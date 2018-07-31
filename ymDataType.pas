//���е�������
{˵��:ypbase��̫��,����,�б�Ҫ�������ȷŵ�yp��,����Ҫ�����ʱ���ٴ浽ypbase����}
unit ymDataType;


interface
uses adodb,classes,sysUtils,variants,strutils,DateUtils;
type
  binArray=array of array of Integer;
  boolArray=array[1..3,1..24] of boolean;
  MyHelper =class

  public
    function getDllPath():string;
  end;

type
  dbHelper =class
    public
      Maxbbh:string;
      Maxbbh1:integer;
      YGMaxbbh1:integer;
      YGMaxbbh:string;
      function getMaxErrorLimits(js1:string):integer;
      function isGlzzEmpty:boolean;
      procedure calcProbability(js1,tblName:string;probabilities:array of double);
      procedure getCodes(js1:string;errors:array of integer;codetype:integer);
      function getCodesLen(js1:string;codetype:integer):integer ;
      procedure setYmCode(bReactions:boolarray);
      procedure getSpecimenType(var stl:tstringlist); //�걾����
      function getCheckMan(var stl:tstringlist):integer;//ҽ������
      function getSjMan(var stl:tstringlist):integer;overload;//�ͼ�ҽ������
      function getSjMan(var stl:tstringlist;secname:string):integer;overload;//���ݿ��ң���ȡ�ͼ�ҽ������
      function getSection(var stl:tstringlist):integer; //����
      function getsex(var stl:Tstringlist):integer; //�Ա�
      function getGermType(var stl:tstringlist):integer; //����
      function getBBType(var stl:tstringlist):integer;//�걾���� ͬprocedure getspecimentype ����ظ�
      function getIndex(germindex:string):integer; //
      function getgermindex(germtype:string):string;//��ȡ��������;
      function getPinming(var stl:tstringlist):integer;//��������Ʒ��
      function getRemark(var stl:tstringlist):integer;//�������汸ס
      function getLczd(var stl:tstringlist):integer;//���������ٴ����
      function getSjmd(var stl:tstringlist):integer;//��ȡ�ͼ�Ŀ��
      function extractnum(str:string):string;//��ȡ�ַ�����������֣�
      function generateNumber(NumberType:string):string;//�Զ����ɱ걾��
      procedure test;
  end;

implementation

uses dbym, common;
//class zMed:��Ӧ��ypPatient��һ����¼


//my helper---system helper
//
function MyHelper.getDllPath :string;
begin
    result:='check.dll';
end;

//db helper ----��germtype���в���maxerror�ֶε�ֵ,����Ϊjs
function dbHelper.getMaxErrorLimits(js1:string):integer;
begin
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('select maxerror from germtype where germindex=:js1');
    parameters.paramByName('js1').Value:=js1;
    open;

    if recordCount>0 then
      result:=fieldbyname('maxerror').asInteger
    else
      result:=-1;//�������.
  end;
end;

function dbHelper.isGlzzEmpty:boolean;
begin
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('select  * from glzz');
    open;
    if recordCount>0 then
      result:=true
    else
      result:=false;
  end;
end;

//��������ĸ���
procedure dbHelper.calcProbability(js1,tblName:string;probabilities:array of double);
var
  originCode:string;
  i:integer;
  s,rstr:string;
  n1,n2:integer;//n1--sideArray,n2--errorsArray
  sideArr,errArr:array of integer;
begin
  //initiate the probabilities
  for i:=1 to length(probabilities) do
    probabilities[i]:=1;

  n1:=getCodesLen(js1,4);
  setLength(errArr,n1);
  getCodes(js1,errArr,4);
  n2:=getCodesLen(js1,3);
  setLength(sideArr,n2);
  getCodes(js1,sideArr,3);

  //rstr:=bResultAsString(bioIsPositive);

  with dmym.query1 do
  begin
      close;
      sql.clear;
      sql.add('select * from glzz,');
      sql.add(tblName+' where glzz.xjid=');
      sql.add(tblName+'.xjid');
      open;

      while not eof do
      begin
        originCode:=fieldByName('orign').AsString;
        //�����length�Ǳ���ĳ���
        for i:=1 to length(originCode) do
        begin
          s:='a'+inttostr(i);
          if originCode[i]='1' then
            probabilities[i]:=probabilities[i]*fieldbyname(s).AsInteger
          else
            probabilities[i]:=probabilities[i]*(100-fieldbyname(s).AsInteger);
          probabilities[i]:=probabilities[i]/100;
        end;
        for i:=1 to n1 do
        begin
          s:='b'+inttostr(i);
          if rstr[sideArr[errArr[i]]]='1' then
            probabilities[i]:=probabilities[i]*fieldbyname(s).asInteger
          else
             probabilities[i]:=probabilities[i]*(100-fieldbyname(s).AsInteger);
          probabilities[i]:=probabilities[i]/100;
        end;
        next;
      end;
   end;
end;

function dbHelper.getCodesLen(js1:string;codetype:integer):integer ;
var
  i,n:integer;
  j:integer;
begin
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('select * from board where js=:js1 and btype=:codetype');
    parameters.ParamByName('js1').value:=js1;
    parameters.parambyName('codetype').value:=codetype;
    open;

    n:=fieldbyname('a1').FieldNo;
    i:=n;
    j:=0;
    while true do
    begin
         if varisnull(fields[i].Value)  then
          break;
         if strtoint(trimright(fields[i].asstring))=0 then
          break;
         inc(i);
         inc(j);
    end;
    result:=j;
  end;
end;
//��ȡboard���е�btype=4���ֶ�,��ȡ�����������
procedure dbHelper.getCodes(js1:string;errors:array of integer;codetype:integer);
var
  i,j,n:integer;
begin
  with dmym.query1 do
  begin
      close;
      sql.clear;
      sql.add('select * from board where js=:js1 and btype=:codetype');
      parameters.ParamByName('js1').value:=js1;
      parameters.parambyName('codetype').value:=codetype;
      open;
      n:=fieldbyname('a1').FieldNo;
      i:=n;
      j:=1;

      while true do
      begin
         if varisnull(fields[i].Value)  then
          break;
         if strtoint(fields[i].AsString)=0 then
          break;
          //���b1-bn���ֶ�����Ϊint,�Ͳ�����ô�鷳��.
         errors[j]:=strtoint(trimright(fields[i].asstring)) ;
         inc(j);
         inc(i);
      end;


  end;
end;
procedure DBHelper.setYmCode(bReactions:boolarray);
var
 i,ir:integer;
 chk1,chk2,chk3:boolean;
begin
  i:=1;
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('select * from yp order by ypid');
    open;
    while not eof do
    begin
      chk1:=bReactions[1,i];
      chk2:=bReactions[2,i];
      chk3:=bReactions[3,i];
      //ir:=encodeYm(chk1,chk2,chk3);
      edit;
      fieldValues['j1']:=ir;
      case ir of
        0:
        begin
          fieldValues['mic']:='<='+fieldbyname('qz1').AsString;
          fieldValues['mg']:='����';
        end;
        1:
        begin
          fieldValues['mic']:='<='+fieldbyname('qz2').AsString;
          fieldValues['mg']:='����';
        end;
        3:
        begin
          fieldValues['mic']:='<='+fieldbyname('qz3').AsString;
          fieldValues['mg']:='����';
        end;
        7:
        begin
          fieldValues['mic']:='<='+fieldbyname('qz3').AsString;
          fieldValues['mg']:='��ҩ';
        end;
      end;
      next;
      inc(i);
    end;
  end;
end;
procedure dbhelper.test;
var
   barr:boolarray;
begin
   setYmCode(barr);
end;
procedure dbHelper.getSpecimenType(var stl:tstringlist);
begin
  with dmym.query1 do
    begin
      close;
      sql.clear;
      sql.add('Select * from bb order by id');
      open;
      while not eof do
        begin
         stl.Add(fieldbyname('bbname').AsString);
         next;
        end;
    end;
end;
//��ȡҽ������
function dbhelper.getCheckMan(var stl:tstringlist):integer;
begin
  with dmym.query1 do
    begin
      close;
      sql.clear;
      sql.add('Select * from checkman');
      open;
      if recordcount<1 then
      begin
        result:=0;
        exit;
      end;
      while not eof do
        begin
         stl.Add(fieldbyname('name').AsString);
         next;
        end;
     end;
  result:=1;;
end;
//��ȡ�ͼ�ҽ������
function dbhelper.getSjMan(var stl:tstringlist):integer;
begin
  with dmym.query1 do
    begin
      close;
      sql.clear;
      sql.add('Select * from sjys');
      open;
      if recordcount<1 then
      begin
        result:=0;
        exit;
      end;
      while not eof do
        begin
         stl.Add(fieldbyname('name').AsString);
         next;
        end;
     end;
  result:=1;;
end;

function dbHelper.getSjMan(var stl: tstringlist; secname: string): integer;
begin
    with dmym.query1 do
    begin
        close;
        sql.clear;
        sql.add('Select * from sjys where secname='''+secname+''' or secname='''' or secname is null');
        open;
        if recordcount<1 then
        begin
          result:=0;
          exit;
        end;
        while not eof do
        begin
           stl.Add(fieldbyname('name').AsString);
           next;
        end;
    end;
    result:=1;
end;

function dbhelper.getSection(var stl:tstringlist):integer;
begin
  with dmym.query1 do
    begin
      //changed:delete every pre-close
      close;
      sql.clear;
      sql.add('Select * from secname order by secid');
      //sql.add('Select * from Hospital order by cydate desc');
      open;
      if recordCount<0 then
      begin
        result:=0;
        exit;
      end;

      while not eof do
        begin
         stl.Add(fieldbyname('secname').asstring);
         next;
        end;
      end;
  result:=1;
end;
function dbhelper.getGermType(var stl:tstringlist):integer;
begin
  with dmym.query1 do
    begin
      //changed:delete every pre-close
      close;
      sql.clear;
      sql.add('Select * from germtype order by germindex');
      open;
      if recordCount<0 then
      begin
        result:=0;
        exit;
      end;

      while not eof do
        begin
         stl.Add(fieldbyname('germtype').asstring);
         next;
        end;
      end;
  result:=1;
end;
function dbhelper.getBBType(var stl:tstringlist):integer;
begin
   with dmym.query1 do
   begin
      close;
      sql.clear;
      sql.add('select * from bb');
      open;

      while not eof do
      begin
         stl.Add(fieldvalues['bbname']);
         next;
      end;
   end;
   result:=1 ;
end;


function dbhelper.getpinming(var stl:tstringlist):integer;
begin
   with dmym.query1 do
   begin
      close;
      sql.clear;
      sql.add('select * from pinming');
      open;

      while not eof do
      begin
         stl.Add(fieldvalues['pinming']);
         next;
      end;
   end;
   result:=1 ;
end;

function dbhelper.getRemark(var stl:tstringlist):integer;
begin
 with dmym.query1 do
 begin
  close;
  sql.Clear;
  sql.Add('select * from YYRemark');
  open;
  while not eof do
  begin
   stl.Add(FieldValues['remark']);
   next;
  end;
 end;
 result:=1;
end;

function dbhelper.getLczd(var stl:tstringlist):integer;
begin
 with dmym.query1 do
 begin
  close;
  sql.Clear;
  sql.Add('select * from YYLczd');
  open;
  while not eof do
  begin
   stl.Add(FieldValues['lczd']);
   next;
  end;
 end;
 result:=1;
end;

function dbhelper.getSjmd(var stl:tstringlist):integer;
begin
 with dmym.query1 do
 begin
  close;
  sql.Clear;
  sql.Add('select * from ZT_SJ');
  open;
  while not eof do
  begin
   stl.Add(FieldValues['ZT_sjmd']);
   next;
  end;
 end;
 result:=1;
end;

function dbhelper.getIndex(germindex:string):integer;
var
   idx:integer;
begin
  idx:=0;
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('select * from germtype order by germindex');
    open;

    while not eof do
    begin
      if fieldvalues['germindex']=germindex then
        break;
      inc(idx);
      next;
    end;
  end;
  result:=idx;
end;

function dbhelper.getgermindex(germtype:string):string;
begin
    with dmym.query1 do
    begin
        close;
        sql.Clear;
        sql.add('select GermIndex from germtype where GermType=:germtype');
        parameters.ParamByName('germtype').value:=germtype;
        open;

        if recordcount>0 then
        result:=fieldvalues['GermIndex']
        else
        result:='';
    end;
end;

function dbhelper.extractnum(str:string):string;
var stext,stemp:string;
    i:integer;
begin
    stext:=trim(str);
    for i:=0 to length(stext) do
    if stext[i] in ['0','1','2','3','4','5','6','7','8','9'] then
    stemp:=stemp+stext[i];
    result:=stemp;
end;
function dbHelper.getsex(var stl: Tstringlist): integer;
begin
    with dmym.query1 do
    begin
        close;
        sql.Clear;
        sql.Add('select sex from ZFX_XB order by ID');
        open;

        if recordcount>0 then
        begin
            first;
            while not eof do
            begin
                 stl.Add(fieldbyname('sex').AsString);
                 next;
            end;
        end;
    end;
    result:=1;
end;

function dbHelper.generateNumber(NumberType: string): string;
var SQLText:string;
    todaystr:string;
    i:integer;
    ordinals:array of string;
    maxno:integer;
begin
    todaystr:=AnsiReplacestr(datetostr(today()),'-','');
    todaystr:=midstr(todaystr,3,6);
    if NumberType='baseno' then
      SQLText:='select bbh from base where bbh like '''+todaystr+'%'' UNION ALL'+
               ' select bbh from regbblc where bbh like '''+todaystr+'%'''
    else if NumberType='hosno' then
      SQLText:='select specNum from hospital  where specNum like '''+todaystr+'%'' union all'+
               ' select specNum from regbbyngr where specNum like '''+todaystr+'%'''
    else if NumberType='basezkno' then
      SQLText:='select bbh from basezk where bbh like '''+todaystr+'%'' union all'+
               ' select bbh from regbbzk where bbh like '''+todaystr+'%''';
    setlength(ordinals,0);
    with dmym.query1 do
    begin
       close;
       sql.Clear;
       sql.Add(SQLText);
       open;

       if recordcount>0 then
       begin
           first;
           while not eof do
           begin
              setlength(ordinals,length(ordinals)+1);
              ordinals[high(ordinals)]:=rightstr(dmym.query1.Fields[0].AsString,2);
              next;
           end;
           maxno:=0;
           for i:=0 to high(ordinals) do
           if maxno<strtoint(ordinals[i]) then
               maxno:=strtoint(ordinals[i]);

           for i:=1 to maxno do//forѭ��ִ����ɺ���Զ���1
           if not ansimatchtext(format('%.2u',[i]),ordinals) then
           begin
              result:=todaystr+format('%.2u',[i]);
              break;
           end;
           if result='' then
           result:=todaystr+format('%.2u',[i]);
       end else
           result:=todaystr+'01';
    end;
end;

end.

