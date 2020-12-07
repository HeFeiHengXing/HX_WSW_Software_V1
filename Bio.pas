unit Bio;

interface
uses
  Graphics, dialogs, windows, sysutils, common, inifiles, variants;
type
  zBio = class
  private
    reactionColors: array[1..30] of double;

    ofcolors: array[1..3] of double;
    holeCodes: array[1..30] of integer; //不同的菌属所对应的参与编码的孔号
    errorCodes: array[1..10] of integer;
    errorCodesLen: integer; //>0的errorCodes的元素个数
    assistCodes: array[1..15] of integer;
     //sideHoleCodes:


    germIndex: string; //在进行分析时用户所选则的"菌属“
    originJS: string; //病人进行登记时登入的”菌属“

    tbname: string;

    bmod, blen: integer;
    bNewPatient: boolean; //是否新病人
    ofisstrange: boolean; //控制27－30是否显示

    function correctError: boolean; //纠错
    function verify(): string; //校验
    function getMaxerror: integer; //germindex表的maxerror字段
  public
    ofIsPositive: boolean; //对应base表的OF字段
    bioResults: array[1..30] of boolean;
    jzname: string;
    stdCode: string; // 计算用
    cbCode: string; //checkbox code  base的bm字段
    basecode: string; //base-result
    constructor create(js1: string);
    procedure setColor(colors: array of double);
    procedure setOfColor(colors: array of double);
    procedure setInput(iresults: array of boolean);
    procedure setGermIndex(idx: string);
    procedure setOriginJs(js: string);
    function getOriginJs: string;
    procedure setHoleCodes;
    procedure setErrorCodes;
    procedure setAssistCodes;
//    procedure checkReaction;overload;
    procedure checkreaction(var bool1, bool2: boolean); overload;
    function checkCqjLqj: boolean;

    procedure test;
    procedure checkOf;
    function getReactionString: string;
    function encodeCheckbox: string;
    procedure calcStdCode(var code: array of integer); //标准编码
    function getStdCode: string;
    function chkcgj(): boolean;
    procedure checkResult; //校验结果
    function getGermTableName: string;
    function calcProbs(): boolean; //纠错机制
    procedure updateProbTable;
    procedure expertof;
    procedure formatProb(str: string); //将概率格式化为8.2格式以便于显示
    procedure bioexpert; //细菌判定结果专家系统
      //property getter
      //getBioIsPositive
  end;
implementation

uses dbym, Meds;


// 界面设置功能非在本代码
//本部分检查OF颜色值，确定
//1－－OF的阳性与否
//2－－生化反应第26-28的阳性与否 ，这将决定界面的选项框是否选中（阳性则选中）.
//要求：ofcolor数组已经填充

procedure zbio.checkOf;
var
  i, r, g, b: integer;
begin
  if originjs = '01' then
  begin
    r := 0;
    g := 0;
    b := 0;
    for i := 1 to 3 do
    begin
         //if (r>b) and ((g-b)>15) then   20131026改
      if (ofcolors[i] >= 300) and (ofcolors[i] <= 900) then
      begin
        if i = 1 then
          ofIsPositive := true;
        bioResults[i + 25] := true;
      end;
    end;
  end;
end;
//生化反应检查结果,填入bioResults，调用check.dll
//read: reactionColors[]
//write:bioResults[]
{procedure zbio.checkReaction;
var
    i:integer;
    LibHandle:Thandle;
    comccolor:Tcomccolor;
    chk:integer;
    germtype:string;
    r,g,b:integer;
    path:string   ;
    ///helper:MyHelper;
begin
  //试图调用生化反应 check.dll
    //inifile:=tinifile.Create(getcurrentdir+'\ym.ini');/////////////////////////////////
    //path:=inifile.ReadString('dll','check','0');
    path:=Getcurrentdir+'\check.dll';
    LibHandle:=loadlibrary(pchar(path));
    try
      if LibHandle=0 then
        raise EdllLoadError.create('无法调入对应的动态库文件');
      @comccolor:=getprocaddress(libhandle,'comccolor');
      if not (@comccolor=nil) then
      begin
        //if originjs='01' then   //肠杆菌O-F试验预标记阳性
        //   bioresults[26]:=true;
        for i:=1 to 24 do  //计算生化反应值
          begin
            r:=0;
            g:=0;
            b:=0;
            getRGB(reactionColors[i],r,g,b);
            chk:=comccolor(originjs,i,r,g,b);
            if chk=1 then
              bioResults[i]:=true
            else
              bioResults[i]:=false;
          end;
      end
    else
      raiseLastWin32Error;
  finally
    freeLibrary(LibHandle);  //卸载dll
  end;
end;}

procedure zbio.checkReaction(var bool1, bool2: boolean);
var
  i: integer;
  LibHandle: Thandle;
  comccolor: Tcomccolor;
  chk: integer;
  germtype: string;
  r, g, b: integer;
  path: string;
    ///helper:MyHelper;
begin
  //试图调用生化反应 check.dll
    //inifile:=tinifile.Create(getcurrentdir+'\ym.ini');/////////////////////////////////
    //path:=inifile.ReadString('dll','check','0');
  path := Getcurrentdir + '\check.dll';
  LibHandle := loadlibrary(pchar(path));
  try
    if LibHandle = 0 then
      raise EdllLoadError.create('无法调入对应的动态库文件');
    @comccolor := getprocaddress(libhandle, 'comccolor');
    if not (@comccolor = nil) then
    begin
        //if originjs='01' then   //肠杆菌O-F试验预标记阳性
        //   bioresults[26]:=true;
      for i := 1 to 24 do //计算生化反应值
      begin
        chk := comccolor(originjs, i, reactionColors[i]);
        if chk = 1 then
          bioResults[i] := true
        else
          bioResults[i] := false;
      end;
    end
    else
      raiseLastWin32Error;
  finally
    freeLibrary(LibHandle); //卸载dll
  end;
  bool1 := bioResults[1];
  bool2 := bioResults[2];
end;
//set reactionColors[]

procedure zBio.setColor(colors: array of double);
var
  i: integer;
begin
  for i := 0 to High(colors) do
    reactionColors[i + 1] := colors[i];
end;
//set ofColors[]

procedure zBio.setOfColor(colors: array of double);
var
  i: integer;
begin
  for i := 0 to High(colors) do
    OfColors[i + 1] := colors[i];
end;
//set variable:germIndex

procedure zBio.setGermIndex(idx: string);
begin
  originjs := idx;
end;
//constructor
// init  bioResults[]

constructor zbio.create(js1: string);
var
  i: integer;
begin
  for i := 1 to high(bioResults) do
    bioResults[i] := false;
  originjs := js1;
   //tbname:=getGermTableName;
end;

procedure zBio.test;
var
  i: integer;
  outfile: textFile;
  c: array[1..30] of tcolor;
begin
  assignfile(outfile, '1.txt');
  Rewrite(outfile);
  writeln(outfile, 'a local array');
  for i := 1 to 30 do
  begin
    c[i] := i;
    writeln(outfile, c[i]);
  end;
  writeln(outfile, 'high(array) is ', High(reactioncolors));
  try
    for i := 1 to High(reactioncolors) do
      writeln(outfile, 'i=', reactionColors[i]);
  finally
    closefile(outfile);
  end;
end;
//set variable originjs

procedure zBio.setOriginJs(js: string);
begin
  originjs := js;
end;
//肠球菌链球菌特异性检查
//read: originjs,bioResults
//write:originjs,jzname
//return: if 是  D群链球菌则false；否则为true

function zBio.checkCqjLqj: boolean;
begin
  if (originjs = '04') or (originjs = '06') then
  begin
    if bioResults[1] and bioResults[2] then
    begin
      originjs := '04';
    end
    else
      originjs := '06';
    if (bioResults[1] = true) and (not bioResults[2] = true) then
    begin
      jzname := '牛链球菌';
      result := false;
      exit;
    end;
  end;
  result := true;
end;
//设置孔编码号，填入holecodes数组
//查询board表中的btype＝1时的孔编号
// read: originjs
// write: holeCodes[]

procedure zbio.SetHoleCodes;
var
  i: integer;
  fiNum: integer;
  str: string;
begin
  // 初始化holeCode数组,因为并非所有的菌种都有15种反应.
  for i := 1 to length(holeCodes) do
    holeCodes[i] := 0;
  //get bmod and blen
  with dmym.query1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from germtype where germindex=:js1');
    parameters.ParamByName('js1').Value := originjs;
    open;

    if recordCount > 0 then
    begin
      bmod := fieldbyname('bmod').asinteger;
      blen := fieldbyname('blen').asinteger;
    end;
  end;
  //从board表中读取编号
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('select * from board where js=:js1 and btype=1');
    parameters.paramByName('js1').value := originjs;
    open;

    finum := fieldbyname('b1').FieldNo - 1;
    for i := 0 to bmod * blen do
    begin
      //这里，finum以0为起始索引
      str := fields[i + finum].asstring;
      if varisnull(str) or (str = '') then
        str := '0'
      else
        str := trimright(fields[i + finum].AsString);
      holeCodes[i + 1] := strtoint(str);
    end;
  end;

end;
//设置误差编码号，填入errorcodes数组
//查询board表中的btype＝4时的误差编号
// read: originjs
// write: errorCodes[]

procedure zbio.SetErrorCodes;
var
  i: integer;
  fiNum: integer;
  str: string;
begin
  // 初始化errCode数组,因为并非所有的菌种都有15种反应.
  for i := 1 to length(errorCodes) do
    errorCodes[i] := 0;
  //从board表中读取编号
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('select * from board where js=:js1 and btype=4');
    parameters.paramByName('js1').value := originjs;
    open;

    finum := fieldbyname('b1').FieldNo - 1;
    errorCodesLen := 0;
    for i := 0 to 9 do
    begin
      str := fields[i + finum].asstring;
      if varisnull(str) or (str = '') then
        str := '0'
      else
        str := trimright(str);
      errorCodes[i + 1] := strtoint(str);
      if errorcodes[i + 1] > 0 then
        inc(errorCodesLen);
    end;
  end;

end;
//设置准误差编码号，填入assistcodes数组
//查询board表中的btype＝3时的孔编号
// read: originjs
// write: assistCodes[]

procedure zbio.SetAssistCodes;
var
  i: integer;
  fiNum: integer;
  str: string;
begin
  // 初始化errCode数组,因为并非所有的菌种都有15种反应.
  for i := 1 to length(assistCodes) do
    assistCodes[i] := 0;
  //从board表中读取编号
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('select * from board where js=:js1 and btype=3');
    parameters.paramByName('js1').value := originjs;
    open;

    finum := fieldbyname('b1').FieldNo - 1;
    for i := 0 to 14 do
    begin
      str := fields[i + finum].asstring;
      if varisnull(str) or (str = '') then
        str := '0'
      else
        str := trimright(str);
      assistCodes[i + 1] := strtoint(trimright(str));
    end;
  end;

end;
 //base表里的result字段
 {根据bioResults以及holeCodes编码计算并得到生化反应编码，返回该字符串 basecode
   read:originjs,bioResults
   call:
      setHoleCodes
         write: holeCodes
      calcStdCode
         write: stdCode
   write:
         bmod,blen,basecode
 }

function zbio.getReactionString: string;
var
  i: integer;
  rstr: string;
  codes: array[1..30] of integer;
begin
  for i := 1 to bmod * blen do
    codes[i] := 0;
  for i := 1 to length(codes) do
    codes[i] := 0;
  setHoleCodes;

   //encode
  rstr := '';
  for i := 1 to bmod * blen do
  begin
    if bioResults[holecodes[i]] then
    begin
      codes[i] := 1;
    end;
    rstr := rstr + inttostr(codes[i]);
  end;
  calcStdCode(codes);
  basecode := rstr;
  result := rstr;
end;
//计算标准化反应编码 ，国家标准化编码 ,细菌表的bm字段
//硬编码:bmod=3 和2两种模式
{根据basecode以及bmod，转换成8进制编码
   read:bmod,code(输入的basecode的数值化的数组）

   write:
         stdcode
 }

procedure zbio.calcStdCode(var code: array of integer);
var
  startIndex: integer;
  i, k: integer;
  str: string;
begin
  str := '';
  if bmod = 3 then
  begin
      //Attention!
    for i := 0 to blen - 1 do
    begin

      k := 0;
      if code[3 * i] = 1 then k := k + 4;
      if code[3 * i + 1] = 1 then k := k + 2;
      if code[3 * i + 2] = 1 then k := k + 1;
      str := str + inttostr(k);
    end;
  end
  else
  begin
    for i := 0 to blen - 1 do
    begin
      k := 0;
      if code[2 * i] = 1 then k := k + 2;
      if code[2 * i + 1] = 1 then k := k + 1;
      str := str + inttostr(k);
    end;
  end;
  stdcode := str;
end;
//返回 variable stdcode

function zbio.getStdCode: string;
begin
  result := stdCode;
end;
//肠杆菌特异性检查
{
 cgj的菌种细分。
 read: originjs,bioresults[]
 write:jzname
 return:
   if 不在菌种列表之内，则判为false

}

function zbio.chkcgj(): boolean;
var
  src, rstr: string;
  i, num: integer;
begin
//
  if originjs <> '01' then
  begin
    result := false;
    exit;
  end;
  //init str
  src := '';
  for i := 1 to high(bioResults) do
  begin
    if bioResults[i] then
      src := src + '1'
    else
      src := src + '0';
  end;

  if copy(src, 15, 1) = '0' then //如果反应15为阴性则返回，不作处理
  begin
    result := false;
    exit;
  end;
  rstr := '';
  rstr := rstr + copy(src, 1, 1);
  rstr := rstr + copy(src, 2, 1);
  rstr := rstr + copy(src, 13, 1);
  rstr := rstr + copy(src, 24, 1); //原来为16，因为20111109调整生化顺序，故改为24
  rstr := rstr + copy(src, 19, 1);
  rstr := rstr + copy(src, 20, 1);
  num := strtoint(rstr);
  case num of
    101101, 101100:
      jzname := '摩根摩根菌';
    1110:
      jzname := '雷氏普罗威登菌';
    1111:
      jzname := '斯氏普罗威登菌';
    1010:
      jzname := '产碱普罗威登菌';
    1000:
      jzname := '拉氏普罗威登菌';
    100111, 100110, 100101, 100100:
      jzname := '奇异变形杆菌';
    1101, 1100:
      jzname := '普通变形杆菌';
    101, 100:
      jzname := '彭变形杆菌';
  else
    begin
      result := false;
      exit;
    end;
  end; //case
  result := true;
  dmym.rsCheck.Edit;
  dmym.rsCheck.FieldValues['name'] := jzname;
  dmym.rsCheck.FieldValues['gl'] := 100;
end;
{
 名称不太准确，严格来说，是按照bioResults的结果，
      true--1
      false--0
 将之转换为一个字符串编码。例如
      bioresults: true false false true
      string    :  1  0 0 1

}

function zbio.encodeCheckbox: string;
var
  i: integer;
begin
  cbCode := '';
  for i := 1 to high(bioResults) do
  begin
    if bioResults[i] then
      cbCode := cbCode + '1'
    else
      cbCode := cbCode + '0';
  end;
  result := cbCode;
end;
{
 这是一大步。对上面所获取的基本编码(basecode)、标准编码(stdcode)进行纠错和校验
 read:
   originjs,jzname
   stdcode (判断其是否有效，如有效则校验之。否则，纠错之。
 call: correctError(纠错），verify（校验）
 write:jzname

}

procedure zbio.checkResult;
var
  i, num: integer;
  ga: double;
  iserror: boolean;
  rstr, src, qstr, wstr: string;
begin
  if not checkcqjlqj then
    exit;
   //预读OF值,如果为假则先行启动，不再继续以下过程
  cbcode := encodeCheckbox;
  if bioResults[4] then //20111108调整生化，OF由26改为4
    ofIsPositive := true;
  if (originjs = '01') and ((bioResults[4] = false) or (not bioResults[16])) then
  begin
    ofIsStrange := true;
      {chkgerm[27].Visible:=true;
      chkgerm[28].Visible:=true;
      chkgerm[29].Visible:=true;
      chkgerm[30].Visible:=true;
      chkgerm[27].caption:='葡萄糖';
      chkgerm[28].caption:='果糖';
      chkgerm[29].caption:='溶血(人工输入)';
      chkgerm[30].Caption:='44度生长';
      }
    ofIsPositive := false;
      //dmym.rsBase['O-F']:=false;
      //lbfirst.Enabled:=true;
    getReactionString;
    expertof;
    exit;
  end
  else
  begin
    if originjs = '01' then
    begin
        { chkgerm[27].Visible:=false;
         chkgerm[28].Visible:=false;
         chkgerm[29].Visible:=false;
         chkgerm[30].Visible:=false;
         }
      ofIsStrange := false;
    end;
  end;
  //}
  {if dmym.rsGermType['germindex']='12' then
      if not (chkgerm[21].checked and chkgerm[22].checked) then
         begin
           showmessage('菌株生长不良');
           dmym.rsBase['bc']:= '菌株生长不良';
           exit;
         end;
   }
   //first get reaction string
  tbName := getGermTableName;
  getReactionString;
  setErrorCodes;
  setAssistCodes;
//首先确定编码是否有效
//取出标准的编码
  wstr := '';
  with dmym.query1 do
  begin
    close;
    sql.clear;
    qstr := 'select * from ' + tbname + ' where bm=' + '"' + stdcode + '"' + ' order by gl';
    sql.add(qstr);
    //  parameters.ParamByName('stdcode').Value:=stdCode;
    open;
    if recordcount = 0 then
      iserror := true
    else
      iserror := false;
    if iserror then
    begin
      if correctError then
        qstr := 'select name,gl from xjname where gl>0 order by gl desc';
    end
    else if recordcount > 1 then
      qstr := verify
    else
    begin
         //qstr:=
    end;
  end;
    //update rscheck
  dmym.rsCheck.Active := false;
  dmym.rsCheck.CommandText := qstr;
  dmym.rsCheck.Active := true;
  dmym.rscheck.first;
  if dmym.rsCheck.RecordCount > 0 then
  begin
        // formatProb(qstr);
    jzname := dmym.rsCheck['name']
  end else
    jzname := '可能存在技术性误差或发现新表型';

  bioexpert;
   //修正链球菌
   {if (originjs='06') and bNewPatient then
      readlqjyp;
   if (originjs='04') and bNewPatient then
      readcqjyp;
   }
end;
{
  根据originjs返回对应的菌属表的数据库表名称
}

function zbio.getGermTableName: string;
begin
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.Add('select tbname from germtype where germindex=:originjs');
    parameters.ParamByName('originjs').Value := originjs;
    open;

    if recordCount <= 0 then
      result := ''
    else
      result := fieldvalues['tbname'];
  end;
end;
{
 纠错代码
  read:
   bmod,blen,basecode
  call:
   getGermTableName,getMaxError ,updateProbTable ,calcProbs
  write:
   插入glzz表
   jzname
}

function zbio.correctError: boolean;
var
  i, j, chkLen, maxerrornum, errornum: integer;
  str, strnew: string;
begin
    //清零
  dmym.conn.Execute('update xjname set gl=0');

  MaxErrorNum := getMaxError;
  if maxErrorNum > 0 then
  begin

    dmym.conn.Execute('delete from glzz'); //清除概率表
  //以下开始纠错，首先纠正一位错，但错误最大数为MaxErrorNum
    errornum := 1;
    chkLen := bmod * blen;
      //tbname:=getGermTablename;
    for i := 1 to chkLen do //纠正一位错
    begin
      strNew := basecode;
      if strNew[i] = '1' then
        strNew[i] := '0'
      else
        strNew[i] := '1';
      str := 'insert into glzz(bm,xjid,orign) select bm,xjid,orign from ' + tbname + ' where orign="' + strNew + '"';
      dmym.conn.execute(str);
    end;
    with dmym.query1 do
    begin
      close;
      sql.clear;
      sql.Add('select * from glzz');
      open;

      if (RecordCount = 0) and (ErrorNum < MaxErrorNum) then //纠正二位错
      begin
        for i := 1 to chkLen - 1 do //改变第一位
        begin
          strNew := basecode;
          if strNew[i] = '1' then
            strNew[i] := '0'
          else
            strNew[i] := '1';

          for j := i + 1 to chkLen do //改变第二位
          begin
            if strNew[j] = '1' then
              strNew[j] := '0'
            else
              strNew[j] := '1';

            str := 'insert into glzz(bm,xjid,orign) select bm,xjid,orign from ' + tbname + ' where orign="' + strNew + '"';
            dmym.conn.execute(str);
            strNew[j] := basecode[j]; //recover
          end; //end for j
        end; //end for i
      end; //end if
    end; //end with
    if not calcProbs then
      jzname := '可能存在技术性误差或发现新表型'
    else
      updateProbTable;
    result := true;
  end //end if
  else
    result := false;

end;
{
 从germtype表读取对应菌属的maxerror字段
}

function zbio.getMaxerror: integer;
begin
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.Add('select maxerror from germtype where germindex=:originjs');
    parameters.ParamByName('originjs').Value := originjs;
    open;

    if recordCount < 0 then
      result := 0
    else
      result := fieldvalues['maxerror'];
  end;
end;
//called by correctError,计算概率
{
 read:
 读取glzz表的内容，
 write:
 最后的结果插入glz表中
 return:
   glzz为空则返回；
 call:
   getGermTablename,encodeCheckbox
}

function zbio.calcProbs(): boolean; //纠错机制
var str: string;
  i: integer;
  glc: double;
  bm, xjid, chk: string;

  rstr: string;
begin
  with dmym.query1 do //检验纠错后菌种编码
  begin
    close;
    sql.clear;
    sql.add('select * from glzz');
    open;

    if recordCount = 0 then
    begin
      close;
      result := false;
      exit;
    end;
  end;
    //以下开始计算纠错概率
  dmym.conn.Execute('delete from glz'); //清空概率计算表
    //tbname:=getGermTableName;
  rstr := encodeCheckbox;
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('select * from glzz a ,gl' + tbname + ' b where a.xjid=b.xjid');
    open;

    while not eof do
    begin
      glc := 1;
      bm := fieldvalues['bm'];
      xjid := fieldvalues['a.xjid'];
      chk := fieldvalues['orign'];
         //基本生化反应概率
      for i := 1 to bmod * blen do
      begin
        str := 'a' + inttostr(i);
        if chk[i] = '1' then
          glc := glc * fieldvalues[str]
        else
          glc := glc * (100 - fieldvalues[str]);
        glc := glc / 100;
      end;
         //补充生化反应概率
      for i := 1 to errorCodesLen do
      begin
        str := 'b' + inttostr(errorCodes[i]);
        if rstr[assistCodes[errorCodes[i]]] = '1' then
          glc := glc * fieldvalues[str]
        else
          glc := glc * (100 - fieldvalues[str]);
        glc := glc / 100;
        str := inttostr(assistCodes[errorCodes[i]]);
      end;
      next; //移动到下一条记录
      str := 'insert into glz(bm,xjid,gl) values(''' + bm + ''',' + xjid + ',' + floattostr(glc) + ')';
      if glc > 0 then
        dmym.conn.Execute(str);
    end;
  end;
  result := true;
end;
//统计并更新概率表 xjname
{
    更新xjname(glz提供gl输入）的rate,gl字段
}

procedure zbio.updateProbTable;
var
  glc: double;

begin
  //清零
  dmym.conn.Execute('update xjname set rate=0');
  //概率合并
  dmym.conn.Execute('update xjname,glz set xjname.rate=xjname.rate+glz.gl where xjname.xjid=glz.xjid');
  //概率计算
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('select sum(rate) as ra from xjname');
    open;

    glc := fieldvalues['ra'];

    dmym.conn.Execute('update xjname set gl=' + floattostr(glc));
    if glc > 0 then
      dmym.conn.Execute('update xjname set gl=rate/gl*100');
  end;
end;
{
 校验代码
 call:
   getGermTableName :将对该表查询
 read:
   stdcode,bioResults[],assistCodes[]
 write&return:
   返回一个查询字符串，将用于checkResult的后续代码

}

function zbio.verify(): string;
var i, j, k, L: integer;
  startpos, endpos: integer;
  jy1: array[1..10] of integer;
  jy2: array[1..10] of string;
  jy3: array[1..15] of boolean; //参与校验字段指示,T为参与,F为不参与;
  str, comstr: string;
begin
    //tbname:=getGermTableName;
  for i := 1 to 10 do
    jy1[i] := 0;

  str := '';
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('select * from ' + tbname + ' where bm=:stdcode order by gl');
    parameters.ParamByName('stdcode').Value := stdCode;
    open;

    if recordcount > 0 then
       //读取校验项反应值，L指示最大校验数量，
    begin
      for i := 1 to 15 do
        jy3[i] := false;
      L := 0;
      first;
      startpos := fieldbyname('b1').FieldNo - 1;
         //endpos:=fieldbyname('b10').fieldno-1;
      endpos := fieldcount - 1;
      while not eof do //找出最大需要校验的记录
      begin
         //      j:=0;  //J 指示当前记录需匹配数
        for i := startpos to endpos do
        begin
          if not (pos('b', fields[i].FieldName) > 0) then
          begin
            endpos := i - 1;
            break;
          end;
          if Fields[i].AsInteger <> 0 then
          begin
            jy3[i - 3] := true;
          end;
        end;
        next;
      end;
      First;

      j := 0;
      for i := startpos to endpos do
        if jy3[i - 3] then
        begin
          j := j + 1;
          jy1[j] := i - 3;
          jy2[j] := fields[i].fieldname;
        end;
      for i := 1 to j do
      begin
        k := jy1[i];
        if bioResults[assistCodes[k]] then
          str := str + ' and ' + jy2[i] + '>-1'
        else
          str := str + ' and ' + jy2[i] + '<1';
      end;
      comstr := 'select * from ' + tbname + ' where bm=''' + stdCode + '''';
      comstr := comstr + str + ' order by gl desc';
    end;
  end;
  result := comstr;
end;
{
 和OF值有关的检验
 read:bioResults
 write:jzname

}

procedure zbio.expertof;
var str: string;
  i: integer;
begin
  str := '';
  if bioResults[10] then
    str := str + '1'
  else
    str := str + '0';
  if bioResults[22] then //20111109调整生化14改为22
    str := str + '1'
  else
    str := str + '0';
  if bioResults[16] then //22改为16
    str := str + '1'
  else
    str := str + '0';
  if bioResults[29] then
    str := str + '1'
  else
    str := str + '0';
  if bioResults[30] then
    str := str + '1'
  else
    str := str + '0';
  i := strtoint(str);
  case i of
    1100, 11100, 11110, 1110, 1000, 11000, 11010, 01010:
      jzname := '嗜麦芽窄食单胞菌';
    0:
      jzname := '洛菲不动杆菌';
    10:
      jzname := '溶血不动杆菌';
    10001:
      jzname := '鲍曼不动杆菌';
    10000:
      jzname := '醋酸钙不动杆菌';
  else
    jzname := '菌种分离不纯或出现技术性误差';
  end;
  str := str + '';
  if bioResults[15] then
    str := str + '1'
  else
    str := str + '0';
  i := strtoint(str);
  case i of
    1:
      jzname := '摩根摩根菌';
  end;
  str := '';
  if bioResults[8] then
    str := str + '1'
  else
    str := str + '0';
  if bioResults[12] then
    str := str + '1'
  else
    str := str + '0';
  if bioResults[30] then
    str := str + '1'
  else
    str := str + '0';
  i := strtoint(str);
  case i of
    111:
      jzname := '鲍曼不动杆菌';
    110:
      jzname := '鲍曼不动杆菌';
  end;
  stdcode := '00000';

end;

procedure zbio.formatProb(str: string);
begin
  with dmym.rscheck do
  begin
    close;
         //sql.clear;
    commandtext := str;
        // sql.add(str);
    open;

    while not eof do
    begin

      edit;
      str := format('%8.2f', [fieldbyname('gl').AsFloat]);
      fieldvalues['gl'] := strtofloat(str);
      next;
    end;
    first;
  end;
end;

procedure zbio.setInput(iresults: array of boolean);
var
  i: integer;
begin
  for i := 0 to length(iresults) - 1 do
  begin
    bioresults[25 + i] := iresults[i];
  end;
end;

function zBio.getOriginJs: string;
begin
  result := originjs;
end;

procedure zBio.bioexpert; //细菌特殊判定
begin
    (*肠杆菌*)
  chkcgj();
    (*肠球菌，链球菌*)
  if (originjs = '04') and (jzname = '可能存在技术性误差或发现新表型') then
    jzname := '肠球菌属';
  if (originjs = '06') and (jzname = '可能存在技术性误差或发现新表型') then
  begin
    if bioResults[3] and bioResults[25] and (not bioResults[26]) then
      jzname := 'β-溶血(非A非B群)链球菌';
    if (not bioResults[25]) and bioResults[4] and (not bioResults[26]) then
      jzname := '草绿色链球菌';
  end;
    (*酵母菌真菌*)
  if originjs = '09' then
    if bioresults[27] then
      jzname := '白色念珠菌';
end;

end.

