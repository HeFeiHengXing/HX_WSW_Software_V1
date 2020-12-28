unit Meds;

interface
uses graphics, common, sysutils, dialogs, windows, strutils, inifiles;

type
  zMed = class //药敏反应处理之类
  private
    id: integer;
    js: string;
    //checked:boolean;//是否新病人
    zrecNo: integer;
    //ymColor:array[1..3,1..24] of tcolor;
    //ymResults:array [1..3,1..24] of boolean;//耐药程度,分三种,耐药/中敏/敏感
    procedure appendA;
  public
    chk1, chk2: boolean;
    bNewPatient: boolean;
    yptable: string;
    jzname: string;
     //  drugSensitive:array [1..3,1..24] of boolean;//耐药程度,分三种,耐药/中敏/敏感
    constructor create(userid: integer; js1: string; ytable: string); overload;
    constructor create(js1: string); overload;
   //destructor destroy;
    //procedure getFy1();
    //procedure setFy1(iColor:integer);
    //procedure updateFy(arr:binArray;index:integer);
    //procedure getRecordCount:integer;
    procedure updateFy; //根据颜色值更新敏感数组以及fy字段
    function encodeYm(x1, x2, x3: boolean): integer; //根据三重敏感值获取该药品的敏感编码
    function EncodeEpiYm(X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12: Boolean): integer;
    procedure analysis; //分析药敏反应的结果
    procedure AnalysisEpi; //真菌的药敏反应结果；
    procedure setJs(js1: string);
    procedure getJS; //从patient表中读取该uerid对应的js
    procedure initYPtable;
    procedure setYmColor(colors: binCarray);
    procedure updatebz;
    procedure setjzname(xjname: string);
    procedure SpecialMIC;
    //procedure checkNa(var bNa:array of boolean;zd:array of integer;mg:array of string);
  end;
implementation

uses dbym, germAnalysisFrm;

constructor zMed.create(js1: string);
var
  i, j: integer;
begin
  bnewPatient := true;
  js := js1;
   //checked:=ischecked;
  for i := 1 to high(ymResults) do
    for j := 1 to high(ymResults[1]) do
      ymResults[i, j] := false;
  initYpTable;
end;

constructor zMed.create(userid: integer; js1: string; ytable: string);
var
  i, j: integer;
begin
  id := userid;
  bnewPatient := false;
  yptable := ytable;
   //getJS;
  js := js1;
   //checked:=ischecked;
  for i := 1 to high(ymResults) do
    for j := 1 to high(ymResults[1]) do
      ymResults[i, j] := false;
  initYPTable;
end;

{
procedure zMed.getFy1();
begin
end;
//每名病人有若干条用药反应，这些反应的值做批量更新
procedure zMed.setFy1(icolor:integer);
begin
   with dmym.query1 do
   begin
    close;
    sql.clear;
    sql.add('update ypbase set fy1=:fy1 where useid=:id and js=:js');
    parameters.ParamByName('id').value:=id;
    parameters.ParamByName('js').value:=js;
    execSQL;
   end;

end;
}

procedure zMed.appendA;
begin
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('insert into yp select * from ypall where js=:js');
    parameters.paramByName('js').value := js;
    execSQL;
  end;
end;

procedure zMed.setJS(js1: string);
begin
  js := js1;
end;
 //暂时不用

procedure zMed.getJS;
begin
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('select js from base where useid=:id ');
    parameters.parambyname('id').value := id;
    open;
    js := fields[0].asstring;
    //@for debug
    if recordCount < 1 then
      js := '01';
    //over
  end;
end;

//更新药敏反应

procedure zMed.updateFy();
var
  i, j: integer;
  a, b: boolean;
  fieldNOs, fieldNOe: integer;
  EsblValue: integer;
  DtestValue: integer;
  pinforvalue: integer;
  StdValue: integer;
  StdIsValid: boolean;
  isTiaoKong: boolean;
  msginf: string;
  posarr: array of array[0..1] of integer;
  myini: Tinifile;
begin
  if js = '09' then //真菌试剂板模型不同。判断不同
    with dmym.query1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from zj_mic order by id');
      open;
      i := 1;
      first;
      while not eof do
      begin
        fieldNOs := fieldbyname('fy1').FieldNo - 1;
        fieldNOe := fieldbyname('fy12').FieldNo - 1;
        for j := fieldNOs to fieldNOe do
        begin
          if i <= 3 then
            if ymcolors[i, j - fieldNOs + 1] < fields[j].Value then
              ymresults[i, j - fieldNOs + 1] := true;
          if i > 3 then
            if ymcolors[i - 3, j - fieldNOs + 13] < fields[j].Value then
              ymresults[i - 3, j - fieldNOs + 13] := true;
        end;
        inc(i);
        next;
      end;
      exit;
    end;

  myini := Tinifile.Create(getcurrentdir + '\dw.ini');
    {按23孔系1孔（阳性），2孔（阳性），3孔（阴性）算出标准值，如果标准值在可接受范围
    则其他所有孔位的阴阳性按标准值计算，小于标准值为阳性，大于标准值为阴性，如果标准
    值不在可接受范围，则调取数据库中预设的标准值进行计算}
  pinforvalue := myini.ReadInteger('preset threshold', 'pinforvalue', 60);
  if js = '01' then
  begin
    StdValue := round((ymcolors[3, 23] - (ymcolors[1, 23] + ymcolors[2, 23]) / 2) * 2 / 3) + round((ymcolors[1, 23] + ymcolors[2, 23]) / 2);
    if (ymcolors[1, 23] + ymcolors[2, 23] + ymcolors[3, 23]) / 3 < pinforvalue then
      StdIsValid := true
    else
      StdIsValid := false;
  end else
  begin
    StdValue := round((ymcolors[3, 24] - (ymcolors[1, 24] + ymcolors[2, 24]) / 2) * 2 / 3) + round((ymcolors[1, 24] + ymcolors[2, 24]) / 2);
    if (ymcolors[1, 24] + ymcolors[2, 24] + ymcolors[3, 24]) / 3 < pinforvalue then
      StdIsValid := true
    else
      StdIsValid := false;
  end;
  if not StdIsValid then
    showmessage('试剂板培养时间不够或菌悬液浓度过低,请延长培养或是重新上板');

  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('select * from yp order by ypid'); // where useid=:id');
      //parameters.parambyname('id').value:=id;
    open;

    i := 1;
    while not eof do
    begin
      if js = '06' then //读取试剂板上的3-8列， 作为药敏结果 ；
      begin
            {if StdIsValid then
            begin
              if StdValue>ymcolors[3,i+12] then
                  ymResults[3,i]:=true;
              if StdValue>ymcolors[2,i+12] then
                  ymResults[2,i]:=true;
              if StdValue>ymcolors[1,i+12] then
                  ymResults[1,i]:=true;
            end else }
        begin
          if fieldvalues['fy1'] > ymcolors[3, i + 12] then
            ymResults[3, i] := true;
          if fieldvalues['fy2'] > ymcolors[2, i + 12] then
            ymResults[2, i] := true;
          if fieldvalues['fy3'] > ymcolors[1, i + 12] then
            ymResults[1, i] := true;
        end;
        edit;
        fieldvalues['fy1'] := ymColors[3, i + 12];
        fieldValues['fy2'] := ymColors[2, i + 12];
        fieldValues['fy3'] := ymColors[1, i + 12];
      end else
      begin
            {if StdIsValid then
            begin
              if StdValue>ymcolors[3,i] then
                  ymResults[3,i]:=true;
              if StdValue>ymcolors[2,i] then
                  ymResults[2,i]:=true;
              if StdValue>ymcolors[1,i] then
                  ymResults[1,i]:=true;
            end else }
        begin
          if fieldvalues['fy1'] > ymcolors[3, i] then
            ymResults[3, i] := true;
          if fieldvalues['fy2'] > ymcolors[2, i] then
            ymResults[2, i] := true;
          if fieldvalues['fy3'] > ymcolors[1, i] then
            ymResults[1, i] := true;
        end;
        edit;
        fieldvalues['fy1'] := ymColors[3, i];
        fieldValues['fy2'] := ymColors[2, i];
        fieldValues['fy3'] := ymColors[1, i];
      end;
      next;
      inc(i);
    end;
      //不满24种药品的，处理不同
    EsblValue := myini.ReadInteger('preset threshold', 'ESBL', 3000);
    DtestValue := myini.ReadInteger('preset threshold', 'D-Test', 3000);
    if js = '06' then
      while i < 25 do
      begin
        if (js = '01') and (i = 22) then //肠杆菌 22孔用作ESBL的判断
        begin
          if ymColors[1, i] < EsblValue then
            ymResults[1, i] := true;
          if ymColors[2, i] < EsblValue then
            ymResults[2, i] := true;
          if ymColors[3, i] < EsblValue then
            ymResults[3, i] := true;
        end else
          if (js = '03') and (i = 23) then //葡萄球菌，D试验
          begin
            if ymColors[1, i] < Dtestvalue then
              ymResults[1, i] := true;
            if ymColors[2, i] < Dtestvalue then
              ymResults[2, i] := true;
            if ymColors[3, i] < Dtestvalue then
              ymResults[3, i] := true;
          end;
        inc(i);
      end;
  end;
   {强制界面上24孔系全部显示为阳性}
  if js = '01' then
  begin
    ymResults[1, 23] := true;
    ymResults[2, 23] := true;
    ymResults[3, 23] := true;
  end else
  begin
    ymResults[1, 24] := true;
    ymResults[2, 24] := true;
    ymResults[3, 24] := true;
  end;
    //跳孔机制**********************
  isTiaoKong := false;
  msginf := '';
  for i := 1 to dmym.query1.RecordCount do
  begin
    if ymResults[1, i] and (not ymResults[2, i]) and (not ymResults[3, i]) then
    begin
      isTiaoKong := true;
      if i <= 12 then
        msginf := msginf + 'C' + inttostr(i) + ' '
      else
        msginf := msginf + 'F' + inttostr(i) + ' ';
      setlength(posarr, length(posarr) + 1);
      posarr[length(posarr) - 1, 0] := 1; posarr[length(posarr) - 1, 1] := i;
    end;
    if ymResults[1, i] and ymResults[2, i] and (not ymResults[3, i]) then
    begin
      isTiaoKong := true;
      if i <= 12 then
        msginf := msginf + 'C' + inttostr(i) + ' D' + inttostr(i) + ' '
      else
        msginf := msginf + 'F' + inttostr(i) + ' G' + inttostr(i) + ' ';
      setlength(posarr, length(posarr) + 1);
      posarr[length(posarr) - 1, 0] := 1; posarr[length(posarr) - 1, 1] := i;
      setlength(posarr, length(posarr) + 1);
      posarr[length(posarr) - 1, 0] := 2; posarr[length(posarr) - 1, 1] := i;
    end;
    if ymResults[1, i] and (not ymResults[2, i]) and ymResults[3, i] then
    begin
      isTiaoKong := true;
      if i <= 12 then
        msginf := msginf + 'C' + inttostr(i) + ' '
      else
        msginf := msginf + 'F' + inttostr(i) + ' ';
      setlength(posarr, length(posarr) + 1);
      posarr[length(posarr) - 1, 0] := 1; posarr[length(posarr) - 1, 1] := i;
    end;
    if (not ymResults[1, i]) and (ymResults[2, i]) and (not ymResults[3, i]) then
    begin
      isTiaoKong := true;
      if i <= 12 then
        msginf := msginf + 'D' + inttostr(i) + ' '
      else
        msginf := msginf + 'G' + inttostr(i) + ' ';
      setlength(posarr, length(posarr) + 1);
      posarr[length(posarr) - 1, 0] := 2; posarr[length(posarr) - 1, 1] := i;
    end;
  end;
  if isTiaoKong then
    if messagedlg(msginf + '孔出现跳孔，是否修改结果？', mtconfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      for i := 0 to length(posarr) - 1 do
        ymResults[posarr[i, 0], posarr[i, 1]] := false;
    end;
    //******************************
end;

procedure zMed.initYPTable;
var
  str: string;
begin
  with dmym.query1 do
  begin
    close;
    sql.Clear;
    sql.add('delete from yp'); //删除临时药敏信息表
    execSQL;
  end;
   //如果是新病员记录，插入yp表一条新记录
  if bNewPatient then
    appendA
  else //否则，从ypbase里读取该记录
  begin
    with dmym.conn do
    begin
          //Execute('delete * from yp');
      str := 'insert into yp select * from ' + yptable + ' where useid=' + inttostr(id);
      execute(str);
    end;
  end;
end;

function zMed.encodeYm(x1, x2, x3: boolean): integer;
var
  i: integer;
begin
  i := 0;
  if x1 then i := i + 4;
  if x2 then i := i + 2;
  if x3 then i := i + 1;
  result := i;
end;

function zMed.EncodeEpiYm(X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12: Boolean): integer;
var i: integer;
begin
  i := 0;
    {if X1 then i:=i+0;
    if X2 then i:=i+1;
    if X3 then i:=i+2;
    if X4 then i:=i+4;
    if X5 then i:=i+8;
    if X6 then i:=i+16;
    if X7 then i:=i+32;
    if X8 then i:=i+64;
    if X9 then i:=i+128;
    if X10 then i:=i+256;
    if X11 then i:=i+512;
    if X12 then i:=i+1024;}

  if X1 then i := 0;
  if X2 then i := 1;
  if X3 then i := 3;
  if X4 then i := 7;
  if X5 then i := 15;
  if X6 then i := 31;
  if X7 then i := 63;
  if X8 then i := 127;
  if X9 then i := 255;
  if X10 then i := 511;
  if X11 then i := 1023;
  if X12 then i := 2047;
  result := i;
end;

procedure zMed.analysis;
var
  i, j: integer;
  // zls:array[0..20] of integer;
begin
  i := 1;
   //set jl
  with dmym.query1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from yp order by ypid');
    open;
    while not eof do
    begin
      edit;
      fieldvalues['jl'] := encodeYm(ymResults[1, i],
        ymResults[2, i], ymResults[3, i]);
      next;
      inc(i);
    end;
  end;
   //update yp
  with dmym.conn do
  begin
    execute('update yp set mic=" ",mg=" "');
    execute('update yp set mic="≤"+qz0,mg="敏感" where jl=0');
    execute('update yp set mic=qz1,mg="敏感" where jl=1');
    execute('update yp set mic=qz2,mg="中介" where jl=3');
    execute('update yp set mic="≥"+qz3,mg="耐药" where jl=7');
  end;
  SpecialMIC;
  updatebz;
end;

procedure Zmed.AnalysisEpi;
var i: integer;
begin
  i := 1;
  with dmym.query1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from yp order by ypid');
    open;
    first;
    while not eof do
    begin
      edit;
      if i <= 3 then
        fieldvalues['jl'] := encodeEpiYm(ymResults[i, 1], ymResults[i, 2], ymResults[i, 3],
          ymResults[i, 4], ymResults[i, 5], ymResults[i, 6],
          ymResults[i, 7], ymResults[i, 8], ymResults[i, 9],
          ymResults[i, 10], ymResults[i, 11], ymResults[i, 12]);
      if i > 3 then
        fieldvalues['jl'] := encodeEpiYm(ymResults[i - 3, 13], ymResults[i - 3, 14], ymResults[i - 3, 15],
          ymResults[i - 3, 16], ymResults[i - 3, 17], ymResults[i - 3, 18],
          ymResults[i - 3, 19], ymResults[i - 3, 20], ymResults[i - 3, 21],
          ymResults[i - 3, 22], ymResults[i - 3, 23], ymResults[i - 3, 24]);
      next;
      inc(i);
    end;
  end;
   //update yp
  with dmym.query1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from Zj_Mic');
    open;
    first;
    while not eof do
    begin
      with dmym.conn do
      begin
        execute('update yp set mic=''<' + fieldvalues['qz1'] + ''' where (ypmc=''' + trim(fieldvalues['ypmc']) + ''') and (jl=0)');
        execute('update yp set mic=''' + fieldvalues['qz2'] + ''' where (ypmc=''' + trim(fieldvalues['ypmc']) + ''') and (jl=1)');
        execute('update yp set mic=''' + fieldvalues['qz3'] + ''' where (ypmc=''' + trim(fieldvalues['ypmc']) + ''') and (jl=3)');
        execute('update yp set mic=''' + fieldvalues['qz4'] + ''' where (ypmc=''' + trim(fieldvalues['ypmc']) + ''') and (jl=7)');
        execute('update yp set mic=''' + fieldvalues['qz5'] + ''' where (ypmc=''' + trim(fieldvalues['ypmc']) + ''') and (jl=15)');
        execute('update yp set mic=''' + fieldvalues['qz6'] + ''' where (ypmc=''' + trim(fieldvalues['ypmc']) + ''') and (jl=31)');
        execute('update yp set mic=''' + fieldvalues['qz7'] + ''' where (ypmc=''' + trim(fieldvalues['ypmc']) + ''') and (jl=63)');
        execute('update yp set mic=''' + fieldvalues['qz8'] + ''' where (ypmc=''' + trim(fieldvalues['ypmc']) + ''') and (jl=127)');
        execute('update yp set mic=''' + fieldvalues['qz9'] + ''' where (ypmc=''' + trim(fieldvalues['ypmc']) + ''') and (jl=255)');
        execute('update yp set mic=''' + fieldvalues['qz10'] + ''' where (ypmc=''' + trim(fieldvalues['ypmc']) + ''') and (jl=511)');
        execute('update yp set mic=''' + fieldvalues['qz11'] + ''' where (ypmc=''' + trim(fieldvalues['ypmc']) + ''') and (jl=1023)');
        execute('update yp set mic=''>' + fieldvalues['qz11'] + ''' where (ypmc=''' + trim(fieldvalues['ypmc']) + ''') and (jl=2047)');
        if AnsiMatchText(Trim(fieldvalues['ypmc']), ['氟康唑', '伊曲康唑']) then
        begin
          Execute('update yp set mg=''敏感'' where (ypmc=''' + fieldvalues['ypmc'] + ''') and (jl<=127)');
          execute('update yp set mg=''S-DD'' where (ypmc=''' + fieldvalues['ypmc'] + ''') and ((jl=255) or (jl=511))');
          execute('update yp set mg=''耐药'' where (ypmc=''' + fieldvalues['ypmc'] + ''') and (jl>511)');
        end;
        if Trim(fieldvalues['ypmc']) = '两性霉素B' then
        begin
          execute('update yp set mg=''敏感'' where (ypmc=''' + fieldvalues['ypmc'] + ''') and (jl<=255)');
          execute('update yp set mg=''中介'' where (ypmc=''' + fieldvalues['ypmc'] + ''') and (jl=511)');
          execute('update yp set mg=''耐药'' where (ypmc=''' + fieldvalues['ypmc'] + ''') and (jl>511)');
        end;
        if AnsiMatchText(Trim(fieldvalues['ypmc']), ['卡泊芬净', '米卡芬净']) then
        begin
          execute('update yp set mg=''敏感'' where (ypmc=''' + fieldvalues['ypmc'] + ''') and (jl<=511)');
          execute('update yp set mg=''非敏感'' where (ypmc=''' + fieldvalues['ypmc'] + ''') and (jl>511)');
        end;
        if Trim(fieldvalues['ypmc']) = '氟胞嘧啶' then
        begin
          execute('update yp set mg=''敏感'' where (ypmc=''' + fieldvalues['ypmc'] + ''') and (jl<=127)');
          execute('update yp set mg=''中介'' where (ypmc=''' + fieldvalues['ypmc'] + ''') and ((jl=255) or (jl=511))');
          execute('update yp set mg=''耐药'' where (ypmc=''' + fieldvalues['ypmc'] + ''') and (jl>511)');
        end;
      end;
      next;
    end;
  end;
end;

procedure zMed.setYmColor(colors: binCArray);
var
  i, j: integer;
begin
  for i := 0 to high(colors) do
  begin
    for j := 0 to high(colors[0]) do
    begin
      ymcolors[i + 1, j + 1] := colors[i, j];
    end;
  end;
end;

procedure zMed.updatebz;
var count: array of integer;
  i, j: integer;
  mg: string;
begin
  with dmym.query1 do
  begin
    close;
    sql.Clear;
    sql.Add('select distinct(zl) from yp where zl<>0');
    open;
    if recordcount <> 0 then
    begin
      setlength(count, recordcount);
      i := 0;
      while not eof do
      begin
        count[i] := fieldbyname('zl').AsInteger;
        next;
        inc(i);
      end;
    end;
  end;

  with dmym.query1 do
  begin
    for i := 0 to length(count) - 1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from yp where zl=' + inttostr(count[i]) + ' order by zd desc');
      open;
      first;
      mg := '';
      while not eof do
      begin
        if fieldvalues['mg'] = '耐药' then
          mg := '耐药';
        if fieldvalues['mg'] = '敏感' then
          if mg = '耐药' then
            if messagedlg(jzname + '族代耐药，根据以往经验，' + jzname + '对' + fieldvalues['ypmc'] + '应为耐药,建议对此结果复核，是否修改结果？', mtinformation, [mbyes, mbno], 0) = idyes then
            begin
              dmym.conn.execute('update yp set mg=''耐药'' where ypid=' + inttostr(fieldvalues['ypid']));
              dmym.conn.execute('update yp set jl=''7'' where ypid=' + inttostr(fieldvalues['ypid']));
              next;
            end;
        next;
                //dmym.conn.execute('update yp set bz=''NA'' where ypid='+inttostr(fieldvalues['ypid']));
        next;
      end;
    end;
  end;
end;

{procedure zMed.checkNa(var bNa:array of boolean;zd:array of integer;mg:array of string);
var
  i,j:integer;
begin
  for i:=0 to length(bNa)-1 do
    for j:=i+1 to length(bNa)-1 do
    begin
      if (zd[j]>zd[i]) and (mg[j]='耐药') and (mg[i]='敏感') then
        bNa[i]:=true;
    end;
end;}

procedure zMed.setjzname(xjname: string);
begin
  jzname := xjname;
end;

procedure zMed.SpecialMIC;
begin
    //
  with dmym.query1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from specialmic where js=''' + js + ''' and jzname=''-''');
    open;
    if recordcount > 0 then
    try
      while not eof do
      begin
        dmym.conn.Execute('update yp set mg=iif(jl=0,''' + fieldvalues['000'] + ''',iif(jl=1,''' + fieldvalues['001'] + ''',iif(jl=3,''' + fieldvalues['011'] + ''',''' + fieldvalues['111'] + '''))) where mic<>"" and ypmc=''' + fieldvalues['ypmc'] + '''');
        next;
      end;
    except
    end;

    close;
    sql.Clear;
    sql.Add('select * from specialmic where js=''' + js + ''' and jzname=''' + jzname + '''');
    open;
    if recordcount > 0 then
    try
      while not eof do
      begin
        dmym.conn.Execute('update yp set mg=iif(jl=0,''' + fieldvalues['000'] + ''',iif(jl=1,''' + fieldvalues['001'] + ''',iif(jl=3,''' + fieldvalues['011'] + ''',''' + fieldvalues['111'] + '''))) where mic<>"" and ypmc=''' + fieldvalues['ypmc'] + '''');
        next;
      end;
    except
    end;

    close;
    sql.Clear;
    sql.Add('select mg from yp where mg=''非敏感''');
    open;
    if recordcount > 0 then
      showmessage('鉴定和药敏结果不可靠，其鉴定结果和药敏试验应予以确认。');
  end;

end;

end.

