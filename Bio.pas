unit Bio;

interface
uses
  Graphics, dialogs, windows, sysutils, common, inifiles, variants;
type
  zBio = class
  private
    reactionColors: array[1..30] of double;

    ofcolors: array[1..3] of double;
    holeCodes: array[1..30] of integer; //��ͬ�ľ�������Ӧ�Ĳ������Ŀ׺�
    errorCodes: array[1..10] of integer;
    errorCodesLen: integer; //>0��errorCodes��Ԫ�ظ���
    assistCodes: array[1..15] of integer;
     //sideHoleCodes:


    germIndex: string; //�ڽ��з���ʱ�û���ѡ���"������
    originJS: string; //���˽��еǼ�ʱ����ġ�������

    tbname: string;

    bmod, blen: integer;
    bNewPatient: boolean; //�Ƿ��²���
    ofisstrange: boolean; //����27��30�Ƿ���ʾ

    function correctError: boolean; //����
    function verify(): string; //У��
    function getMaxerror: integer; //germindex���maxerror�ֶ�
  public
    ofIsPositive: boolean; //��Ӧbase���OF�ֶ�
    bioResults: array[1..30] of boolean;
    jzname: string;
    stdCode: string; // ������
    cbCode: string; //checkbox code  base��bm�ֶ�
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
    procedure calcStdCode(var code: array of integer); //��׼����
    function getStdCode: string;
    function chkcgj(): boolean;
    procedure checkResult; //У����
    function getGermTableName: string;
    function calcProbs(): boolean; //�������
    procedure updateProbTable;
    procedure expertof;
    procedure formatProb(str: string); //�����ʸ�ʽ��Ϊ8.2��ʽ�Ա�����ʾ
    procedure bioexpert; //ϸ���ж����ר��ϵͳ
      //property getter
      //getBioIsPositive
  end;
implementation

uses dbym, Meds;


// �������ù��ܷ��ڱ�����
//�����ּ��OF��ɫֵ��ȷ��
//1����OF���������
//2����������Ӧ��26-28��������� ���⽫���������ѡ����Ƿ�ѡ�У�������ѡ�У�.
//Ҫ��ofcolor�����Ѿ����

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
         //if (r>b) and ((g-b)>15) then   20131026��
      if (ofcolors[i] >= 300) and (ofcolors[i] <= 900) then
      begin
        if i = 1 then
          ofIsPositive := true;
        bioResults[i + 25] := true;
      end;
    end;
  end;
end;
//������Ӧ�����,����bioResults������check.dll
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
  //��ͼ����������Ӧ check.dll
    //inifile:=tinifile.Create(getcurrentdir+'\ym.ini');/////////////////////////////////
    //path:=inifile.ReadString('dll','check','0');
    path:=Getcurrentdir+'\check.dll';
    LibHandle:=loadlibrary(pchar(path));
    try
      if LibHandle=0 then
        raise EdllLoadError.create('�޷������Ӧ�Ķ�̬���ļ�');
      @comccolor:=getprocaddress(libhandle,'comccolor');
      if not (@comccolor=nil) then
      begin
        //if originjs='01' then   //���˾�O-F����Ԥ�������
        //   bioresults[26]:=true;
        for i:=1 to 24 do  //����������Ӧֵ
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
    freeLibrary(LibHandle);  //ж��dll
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
  //��ͼ����������Ӧ check.dll
    //inifile:=tinifile.Create(getcurrentdir+'\ym.ini');/////////////////////////////////
    //path:=inifile.ReadString('dll','check','0');
  path := Getcurrentdir + '\check.dll';
  LibHandle := loadlibrary(pchar(path));
  try
    if LibHandle = 0 then
      raise EdllLoadError.create('�޷������Ӧ�Ķ�̬���ļ�');
    @comccolor := getprocaddress(libhandle, 'comccolor');
    if not (@comccolor = nil) then
    begin
        //if originjs='01' then   //���˾�O-F����Ԥ�������
        //   bioresults[26]:=true;
      for i := 1 to 24 do //����������Ӧֵ
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
    freeLibrary(LibHandle); //ж��dll
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
//���������������Լ��
//read: originjs,bioResults
//write:originjs,jzname
//return: if ��  DȺ�������false������Ϊtrue

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
      jzname := 'ţ�����';
      result := false;
      exit;
    end;
  end;
  result := true;
end;
//���ÿױ���ţ�����holecodes����
//��ѯboard���е�btype��1ʱ�Ŀױ��
// read: originjs
// write: holeCodes[]

procedure zbio.SetHoleCodes;
var
  i: integer;
  fiNum: integer;
  str: string;
begin
  // ��ʼ��holeCode����,��Ϊ�������еľ��ֶ���15�ַ�Ӧ.
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
  //��board���ж�ȡ���
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
      //���finum��0Ϊ��ʼ����
      str := fields[i + finum].asstring;
      if varisnull(str) or (str = '') then
        str := '0'
      else
        str := trimright(fields[i + finum].AsString);
      holeCodes[i + 1] := strtoint(str);
    end;
  end;

end;
//����������ţ�����errorcodes����
//��ѯboard���е�btype��4ʱ�������
// read: originjs
// write: errorCodes[]

procedure zbio.SetErrorCodes;
var
  i: integer;
  fiNum: integer;
  str: string;
begin
  // ��ʼ��errCode����,��Ϊ�������еľ��ֶ���15�ַ�Ӧ.
  for i := 1 to length(errorCodes) do
    errorCodes[i] := 0;
  //��board���ж�ȡ���
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
//����׼������ţ�����assistcodes����
//��ѯboard���е�btype��3ʱ�Ŀױ��
// read: originjs
// write: assistCodes[]

procedure zbio.SetAssistCodes;
var
  i: integer;
  fiNum: integer;
  str: string;
begin
  // ��ʼ��errCode����,��Ϊ�������еľ��ֶ���15�ַ�Ӧ.
  for i := 1 to length(assistCodes) do
    assistCodes[i] := 0;
  //��board���ж�ȡ���
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
 //base�����result�ֶ�
 {����bioResults�Լ�holeCodes������㲢�õ�������Ӧ���룬���ظ��ַ��� basecode
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
//�����׼����Ӧ���� �����ұ�׼������ ,ϸ�����bm�ֶ�
//Ӳ����:bmod=3 ��2����ģʽ
{����basecode�Լ�bmod��ת����8���Ʊ���
   read:bmod,code(�����basecode����ֵ�������飩

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
//���� variable stdcode

function zbio.getStdCode: string;
begin
  result := stdCode;
end;
//���˾������Լ��
{
 cgj�ľ���ϸ�֡�
 read: originjs,bioresults[]
 write:jzname
 return:
   if ���ھ����б�֮�ڣ�����Ϊfalse

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

  if copy(src, 15, 1) = '0' then //�����Ӧ15Ϊ�����򷵻أ���������
  begin
    result := false;
    exit;
  end;
  rstr := '';
  rstr := rstr + copy(src, 1, 1);
  rstr := rstr + copy(src, 2, 1);
  rstr := rstr + copy(src, 13, 1);
  rstr := rstr + copy(src, 24, 1); //ԭ��Ϊ16����Ϊ20111109��������˳�򣬹ʸ�Ϊ24
  rstr := rstr + copy(src, 19, 1);
  rstr := rstr + copy(src, 20, 1);
  num := strtoint(rstr);
  case num of
    101101, 101100:
      jzname := 'Ħ��Ħ����';
    1110:
      jzname := '�����������Ǿ�';
    1111:
      jzname := '˹���������Ǿ�';
    1010:
      jzname := '�����������Ǿ�';
    1000:
      jzname := '�����������Ǿ�';
    100111, 100110, 100101, 100100:
      jzname := '������θ˾�';
    1101, 1100:
      jzname := '��ͨ���θ˾�';
    101, 100:
      jzname := '����θ˾�';
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
 ���Ʋ�̫׼ȷ���ϸ���˵���ǰ���bioResults�Ľ����
      true--1
      false--0
 ��֮ת��Ϊһ���ַ������롣����
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
 ����һ�󲽡�����������ȡ�Ļ�������(basecode)����׼����(stdcode)���о����У��
 read:
   originjs,jzname
   stdcode (�ж����Ƿ���Ч������Ч��У��֮�����򣬾���֮��
 call: correctError(������verify��У�飩
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
   //Ԥ��OFֵ,���Ϊ�����������������ټ������¹���
  cbcode := encodeCheckbox;
  if bioResults[4] then //20111108����������OF��26��Ϊ4
    ofIsPositive := true;
  if (originjs = '01') and ((bioResults[4] = false) or (not bioResults[16])) then
  begin
    ofIsStrange := true;
      {chkgerm[27].Visible:=true;
      chkgerm[28].Visible:=true;
      chkgerm[29].Visible:=true;
      chkgerm[30].Visible:=true;
      chkgerm[27].caption:='������';
      chkgerm[28].caption:='����';
      chkgerm[29].caption:='��Ѫ(�˹�����)';
      chkgerm[30].Caption:='44������';
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
           showmessage('������������');
           dmym.rsBase['bc']:= '������������';
           exit;
         end;
   }
   //first get reaction string
  tbName := getGermTableName;
  getReactionString;
  setErrorCodes;
  setAssistCodes;
//����ȷ�������Ƿ���Ч
//ȡ����׼�ı���
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
    jzname := '���ܴ��ڼ������������±���';

  bioexpert;
   //���������
   {if (originjs='06') and bNewPatient then
      readlqjyp;
   if (originjs='04') and bNewPatient then
      readcqjyp;
   }
end;
{
  ����originjs���ض�Ӧ�ľ���������ݿ������
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
 �������
  read:
   bmod,blen,basecode
  call:
   getGermTableName,getMaxError ,updateProbTable ,calcProbs
  write:
   ����glzz��
   jzname
}

function zbio.correctError: boolean;
var
  i, j, chkLen, maxerrornum, errornum: integer;
  str, strnew: string;
begin
    //����
  dmym.conn.Execute('update xjname set gl=0');

  MaxErrorNum := getMaxError;
  if maxErrorNum > 0 then
  begin

    dmym.conn.Execute('delete from glzz'); //������ʱ�
  //���¿�ʼ�������Ⱦ���һλ�������������ΪMaxErrorNum
    errornum := 1;
    chkLen := bmod * blen;
      //tbname:=getGermTablename;
    for i := 1 to chkLen do //����һλ��
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

      if (RecordCount = 0) and (ErrorNum < MaxErrorNum) then //������λ��
      begin
        for i := 1 to chkLen - 1 do //�ı��һλ
        begin
          strNew := basecode;
          if strNew[i] = '1' then
            strNew[i] := '0'
          else
            strNew[i] := '1';

          for j := i + 1 to chkLen do //�ı�ڶ�λ
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
      jzname := '���ܴ��ڼ������������±���'
    else
      updateProbTable;
    result := true;
  end //end if
  else
    result := false;

end;
{
 ��germtype���ȡ��Ӧ������maxerror�ֶ�
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
//called by correctError,�������
{
 read:
 ��ȡglzz������ݣ�
 write:
 ���Ľ������glz����
 return:
   glzzΪ���򷵻أ�
 call:
   getGermTablename,encodeCheckbox
}

function zbio.calcProbs(): boolean; //�������
var str: string;
  i: integer;
  glc: double;
  bm, xjid, chk: string;

  rstr: string;
begin
  with dmym.query1 do //����������ֱ���
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
    //���¿�ʼ����������
  dmym.conn.Execute('delete from glz'); //��ո��ʼ����
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
         //����������Ӧ����
      for i := 1 to bmod * blen do
      begin
        str := 'a' + inttostr(i);
        if chk[i] = '1' then
          glc := glc * fieldvalues[str]
        else
          glc := glc * (100 - fieldvalues[str]);
        glc := glc / 100;
      end;
         //����������Ӧ����
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
      next; //�ƶ�����һ����¼
      str := 'insert into glz(bm,xjid,gl) values(''' + bm + ''',' + xjid + ',' + floattostr(glc) + ')';
      if glc > 0 then
        dmym.conn.Execute(str);
    end;
  end;
  result := true;
end;
//ͳ�Ʋ����¸��ʱ� xjname
{
    ����xjname(glz�ṩgl���룩��rate,gl�ֶ�
}

procedure zbio.updateProbTable;
var
  glc: double;

begin
  //����
  dmym.conn.Execute('update xjname set rate=0');
  //���ʺϲ�
  dmym.conn.Execute('update xjname,glz set xjname.rate=xjname.rate+glz.gl where xjname.xjid=glz.xjid');
  //���ʼ���
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
 У�����
 call:
   getGermTableName :���Ըñ��ѯ
 read:
   stdcode,bioResults[],assistCodes[]
 write&return:
   ����һ����ѯ�ַ�����������checkResult�ĺ�������

}

function zbio.verify(): string;
var i, j, k, L: integer;
  startpos, endpos: integer;
  jy1: array[1..10] of integer;
  jy2: array[1..10] of string;
  jy3: array[1..15] of boolean; //����У���ֶ�ָʾ,TΪ����,FΪ������;
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
       //��ȡУ���Ӧֵ��Lָʾ���У��������
    begin
      for i := 1 to 15 do
        jy3[i] := false;
      L := 0;
      first;
      startpos := fieldbyname('b1').FieldNo - 1;
         //endpos:=fieldbyname('b10').fieldno-1;
      endpos := fieldcount - 1;
      while not eof do //�ҳ������ҪУ��ļ�¼
      begin
         //      j:=0;  //J ָʾ��ǰ��¼��ƥ����
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
 ��OFֵ�йصļ���
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
  if bioResults[22] then //20111109��������14��Ϊ22
    str := str + '1'
  else
    str := str + '0';
  if bioResults[16] then //22��Ϊ16
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
      jzname := '����ѿխʳ������';
    0:
      jzname := '��Ʋ����˾�';
    10:
      jzname := '��Ѫ�����˾�';
    10001:
      jzname := '���������˾�';
    10000:
      jzname := '����Ʋ����˾�';
  else
    jzname := '���ַ��벻������ּ��������';
  end;
  str := str + '';
  if bioResults[15] then
    str := str + '1'
  else
    str := str + '0';
  i := strtoint(str);
  case i of
    1:
      jzname := 'Ħ��Ħ����';
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
      jzname := '���������˾�';
    110:
      jzname := '���������˾�';
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

procedure zBio.bioexpert; //ϸ�������ж�
begin
    (*���˾�*)
  chkcgj();
    (*������������*)
  if (originjs = '04') and (jzname = '���ܴ��ڼ������������±���') then
    jzname := '�������';
  if (originjs = '06') and (jzname = '���ܴ��ڼ������������±���') then
  begin
    if bioResults[3] and bioResults[25] and (not bioResults[26]) then
      jzname := '��-��Ѫ(��A��BȺ)�����';
    if (not bioResults[25]) and bioResults[4] and (not bioResults[26]) then
      jzname := '����ɫ�����';
  end;
    (*��ĸ�����*)
  if originjs = '09' then
    if bioresults[27] then
      jzname := '��ɫ�����';
end;

end.

