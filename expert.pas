unit expert;

interface
uses common,strutils,dialogs,sysutils,classes,variants,controls,db,inifiles,Forms;
const
  cgjArray:array[1..5] of string=('�󳦰�ϣ��','���׿��ײ�����������','������ײ���',
    '������θ˾�','');
  msgArray:array[1..3] of string=('����ΪESBLs(�����צ�-������ø)����','','');
  greenLqjs:array[1..7] of string=('����ɫ�ʺ��������Ⱥ','����ɫ��֢�����Ⱥ',
    '����ɫ���������Ⱥ','����ɫѪҺ�����Ⱥ','����ɫ��Һ�����Ⱥ',
    '����ɫ�����Ⱥ','');
  function isInArray(idx:string;destarr:array of string):boolean;

  procedure test;
type
   zExpert=class
   private
      js:string;
      jzname:string;
      ZkAns:boolean;//�ж��Ƿ��ʿط��� ;
      magicNumber:integer;

      function strInArray(str:string;arr:array of string):boolean;
      function strInList(str:string;list:Tstringlist):boolean;
      function isTb(drugname:string):boolean;//�Ƿ�ͷ���ࣿ
      function isTbdFast(d:integer;mgstr:string):boolean;//ͷ��d������

   public
      expert:string;//ר��ϵͳ���
      bc:string;//����˵����base���[bc]�ֶ�
      tsnyID:string;//����˵�� ��ҩ����Թ��ں��ڲ�ѯ
      tsnyIDM:string;//����˵��MRS
      constructor create(js1,jz1:string;bezk:boolean);
      procedure decisionProcess;
      procedure expertcgj; //���˾�
      procedure expertptqj; //�������
      procedure expertffxj;  //�Ƿ��;�
      procedure expertcqj; //�����
      procedure expertlqj; //�����
      procedure expertsxgj; //��Ѫ�˾�
      procedure expertyxqj;//�������
      procedure expertepi;//���ר��ϵͳ

      function isESBL:boolean;
      function isYdm:boolean;//�յ�ø
      function isYpFast(ypname:string):boolean;
      function isctqm:boolean;//�ж���̼��ùϩ�࿹��ҩ��
      function isydklm:boolean;//�ж� �յ�����ù��ʵ��
      function TsnyType(sec:string):integer; // �ж� 0..��ͨ 1..������ҩ 2..����ҩ 3..����ҩ
      Procedure NaturalSensitive(var yps:Tstringlist);//��ȡ��Ȼ����ҩ��
      Procedure NaturalResistance(var yps:Tstringlist);//��ȡ��Ȼ��ҩҩ��
      procedure updateYpTable(yps:tstringlist); //�޸���Ȼ����ҩ�����
      procedure updateYpTable2(yps:tstringlist);//�޸���Ȼ��ҩҩ�����
      procedure modifyYpTable;//ֱ���޸�ҩ���������ֵ
      procedure modifyYpTable2 ;
      procedure tbUpdate;//����ͷ�����ȼ��޸�
      Procedure CheckPani;//�����ǰ������޸��������ϣ�
      Procedure TsnyForTljdbj; // ����ͭ�̼ٵ�������������ҩ��
      Procedure TsnyForBmbdgj; // ���ڱ��������˾���������ҩ��
      procedure TsnyForAll;
      function updateTb(yps:array of string):boolean;//�޸��˷���true��δ���޸ķ���false

      function fastyxqj1:boolean;// �������
      function fastsxgj1:boolean;//��Ѫ�˾�
      function fastCgj1:boolean;//���յ�ø
      function fastCgj2:boolean;//esbl
      function fastCgj3:boolean;//��̼��ùϡù
      function fastPtqj1:boolean;//1���ͼ������ֵĽ��ɫ�������
      function fastPtqj2:boolean;//2���ͼ������ֵ�����ø�����������
      function fastFF:boolean;//�Ƿ��;�

end;
implementation

uses dbym, germAnalysisFrm;
 function isInArray(idx:string;destarr:array of string):boolean;
 var
  i:integer;
 begin
     for i:=0 to length(destarr)-1 do
       if destarr[i]=idx then
       begin
        result:=true;
        exit;
       end;
     result:=false;
 end;
 procedure test;
 begin
     isInArray('1',cgjArray);
 end;

constructor zExpert.create(js1,jz1:string;bezk:boolean);
begin
   js:=js1;
   jzname:=jz1;
   ZkAns:=bezk;
   if pos('���ܴ��ڼ��������',jzname)>0 then
      exit;
   magicNumber:=0;
   if ymResults[1,22] then
      inc(magicNumber);
   if ymResults[2,22] then
      inc(magicNumber);
   if ymResults[3,22] then
      inc(magicNumber);
   decisionProcess;
end;

procedure zExpert.decisionProcess;
var
  strselect,strselect2,strselect3,ymType:string;
  i,j,k:integer;
  slist:tstringlist;
  b:boolean;
begin
     if js='01' then
       expertCgj;
     if js='02' then
       expertFfxj;
     if js='03' then
       expertPtqj;
     if (js='04') or (js='12')  then
      expertcqj; //�����ר��ϵͳ
     if (js='06') or (js='13') then
      expertlqj; //�����ר��ϵͳ
     if js='08' then
      expertsxgj;
     if js='14' then
      expertyxqj;
     if js='09' then
      expertepi;
     TsnyForAll;
end;

procedure zExpert.expertcgj;
var
  i:integer;
  slist:tstringlist;
  b:boolean;
begin
    // 1��ESBL���������צ�-������ø���꣩
    bc:='';
    b:=false;
    slist:=tstringlist.Create;

    {����ϸ������ҩ�����}
    if not AnsiMatchstr(jzname,['��Ʋ����˾�','���������˾�','����Ʋ����˾�']) then
    with dmym.query1 do
    begin
        close;
        sql.Clear;
        sql.Add('select * from yp where ypid=10');
        open;
        if recordcount<>0 then
        if fieldvalues['jl']>=3 then
        begin
            edit;
            fieldvalues['mg']:='��ҩ';
            post;
        end;
    end;

    {��Ȼ��ҩ����Ȼ����У��}
    naturalSensitive(slist);
    if slist.count>0 then
      updateYpTable(slist);
    slist.Clear;

    NaturalResistance(slist);
    if slist.count>0 then
      updateYpTable2(slist);
    slist.Clear;
    slist.Free;

    tbUpdate;
    CheckPani;

   {������ҩ����У��}
   //if ZkAns then
   begin
      if fastCgj1 then
      if isESBL then
      if messagedlg('�þ���ΪESBLs(�����צ�-������ø)����',mtinformation,[mbyes,mbno],0)=mryes then
      begin
          bc:='ESBLs';
          tsnyID:='ESBLs';
          //modifyYpTable;
          b:=true;
          expert:='ESBLs';
      end;
   end;
   if fastCgj2 then
    if isYdm then
    if messagedlg('�þ���Ϊ���յ�ø����',mtinformation,[mbyes,mbno],0)=mryes then
    begin
       if bc<>'' then
          bc:=bc+';���յ�ø����'
       else
          bc:='���յ�ø����';
       tsnyID:=trimleft(tsnyID+' ���յ�ø');
       //modifyYpTable2;
       b:=true;
       expert:=trimleft(expert+' 01CYDM');
    end;

    if FastCgj3 then
    if isctqm then
    if messagedlg('�þ���Ϊ��̼��ùϩ�࿹��ҩ�����',mtinformation,[mbyes,mbno],0)=mryes then
    begin
       if bc<>'' then
          bc:=bc+';CRE'
       else
          bc:='CRE';
       tsnyID:=trimleft(tsnyID+' CRE');
       b:=true;
       expert:=trimleft(expert+' CRE');
    end;

    //CR-AB:��̼��ùϩ�࿹��ҩ�� ���������˾�
    if jzname ='���������˾�' then
    if isctqm then
    if messagedlg('�þ���Ϊ��̼��ùϩ�࿹��ҩ�ﱫ�������˾�',mtinformation,[mbyes,mbno],0)=mryes then
    begin
       if bc<>'' then
          bc:=bc+';CR-AB'
       else
          bc:='CR-AB';
       tsnyID:=trimleft(tsnyID+' CR-AB');
       b:=true;
       expert:=trimleft(expert+' CR-AB');
    end;

    TsnyForBmbdgj;
    TsnyForTljdbj;

end;

///////////////////////////////////////////////////////////////////
//�������
procedure zExpert.expertyxqj;
var
  slist:tstringlist;
begin
    // 1��ESBL���������צ�-������ø���꣩
    slist:=tstringlist.Create;
    naturalSensitive(slist);
    if slist.count>0 then
      updateYpTable(slist);
    slist.Clear;
    NaturalResistance(slist);
    if slist.count>0 then
      updateypTable2(slist);
    slist.Free;
    //tbUpdate;
end;


function zExpert.fastyxqj1:boolean;
const
  inlist:array[1..2] of string=('�ܲ���ɪ��','Ī������');
begin
  if strInarray(jzname,inlist) then
  begin
       result:=true;
       exit;
  end;
  result:=false;
end;

//////////////////////////////////////////////////////////////////
//��Ѫ�˾�
procedure zExpert.expertsxgj;
var
  slist:tstringlist;
  b:boolean;
begin
// 1��ESBL���������צ�-������ø���꣩
    b:=false;
    slist:=tstringlist.Create;

    naturalSensitive(slist);
    if slist.count>0 then
      updateYpTable(slist);
    slist.Clear;
    NaturalResistance(slist);
      updateypTable2(slist);
    slist.Free;
    //tbUpdate;
end;


function zExpert.fastsxgj1:boolean;
const
  inlist:array[1..8] of string=('������Ѫ�˾���','������Ѫ�˾���','������Ѫ�˾���','������Ѫ�˾���',
  '������Ѫ�˾���','������Ѫ�˾���','������Ѫ�˾���','������Ѫ�˾���');
begin
  if strInarray(jzname,inlist) then
  begin
       result:=true;
       exit;
  end;
  result:=false;
end;

function zExpert.fastCgj1:boolean;
const
  inlist:array[1..4] of string=('�󳦰�ϣ��','���׿��ײ���','������ײ���','������θ˾�');
begin
  if strInarray(jzname,inlist) then
  begin
       result:=true;
       exit;
  end;
  result:=false;
end;

function zExpert.fastCgj2:boolean;
const
  nolist:array[1..4] of string=('�󳦰�ϣ��','���׿��ײ���','������ײ���','������θ˾�');
begin
  if not strInarray(jzname,nolist) then
  begin
       result:=true;
       exit;
  end;
  result:=false;
end;

function zExpert.fastFF:boolean;
const
  inlist:array[1..2] of string=('�����˾�','խʳ������');
begin
  if strInarray(jzname,inlist) then
  begin
       result:=true;
       exit;
  end;
  result:=false;
end;
{
 2���յ�ø��Ⱦɫ��鵼�Ĳ���-������ø���꣩
   WHILE  ���֡�(�󳦰�ϣ�������׿��ײ�����������ײ���)
   DO   �ж����Ƿ�Ϊ���յ�ø����
    BEGIN
        IF  ���κ�ͷ������ҩ�04**-01 OR 04**-02���Լ������ϣ�0701-01 OR 0701-02������ҩ������2 ��
            AND ͷ����ͪ/���̹��1001-01�� ��ҩ AND ͷ����뿣�0501-01 OR 0501-02������
        THEN  �ж���Ϊ���յ�ø����
    END
}
function zExpert.isYdm:boolean;
var
   cnt:integer;
   b1,b2:boolean;
begin
   cnt:=0;
   b1:=false;
   b2:=false;
   //
   with dmym.query1 do
   begin
     close;
     sql.clear;
     sql.add('select * from yp ');
     open;

     while not eof do
     begin
         if pos('ͷ��',fieldvalues['ypmc'])>0 then
            if (trim(fieldvalues['mg'])='��ҩ') and
                 fieldvalues['zd']=3 then
               inc(cnt);
         if (trim(fieldvalues['ypmc'])='������') then
            if (trim(fieldValues['mg'])='��ҩ') then
              inc(cnt);
         if (trim(fieldvalues['ypmc'])='ͷ����ͪ/���̹') then
            b1:=(trim(fieldvalues['mg'])='��ҩ');
         if (trim(fieldvalues['ypmc'])='ͷ�����') then
            b2:=(trim(fieldvalues['mg'])='����');
         next;
     end;
     if (cnt>=2) and  (b1=true) and (b2=true) then
       result:=true
     else
       result:=false;
   end;

end;

{

 1��ESBL���������צ�-������ø���꣩
  WHILE  ����=�󳦰�ϣ�� OR ���׿��ײ��� OR ������ײ��� OR ������θ˾�
  DO �ж����Ƿ�ΪESBL
   BEGIN
      CASE
    ��1��IF     F23��G23��H23��������Ũ��ͷ������ҩ���������������ҩ�����Ʒ�Ӧ����
         THEN   �ж�ΪESBL
    ��2��IF     ͷ����ͪ��0401-01����ҩ AND �����κ�һ��ͷ��������04**-01����ҩ AND
                ͷ����ͪ/���̹��1001-01�� ����
         THEN   �ж�ΪESBL
    ��3��IF     �κ�ͷ������ҩ�04**-01���Լ������ϣ�0701-01������ҩ������3
         THEN   �ж�ΪESBL
   END;}
function zExpert.isESBL:boolean;
var
   cnt,i,j:integer;
   b1,b2:boolean;
begin
   cnt:=0;
   b1:=false;
   b2:=false;                
   //1 23�ſ����������ϱ�ѡ��
   if magicNumber>=2 then
   begin
     result:=true;
     exit;
   end;
   //
   with dmym.query1 do
   begin

     close;
     sql.clear;
     sql.add('select * from yp ');
     open;

     while not eof do
     begin
         if (pos('ͷ��',fieldvalues['ypmc'])>0) and (trim(fieldvalues['ypmc'])<>'ͷ����ͪ') and (trim(fieldvalues['ypmc'])<>'ͷ����ͪ/���̹') then
            if (trim(fieldvalues['mg'])='��ҩ') and
               fieldvalues['zd']=3 then
               inc(cnt); //���ڵ�һ����������ͷ����ͪ��ͷ����ͪ/���̹������ͷ������ҩ��ҩ����;
         if (pos('ͷ��',fieldvalues['ypmc'])>0) then
            if (trim(fieldvalues['mg'])='��ҩ') and
               fieldvalues['zd']=3 then
               inc(j); //���ڵ��������������ͷ������ҩ��ҩ����;�� ����ͷ����ͪ��ͷ����ͪ/���̹.
         if (trim(fieldvalues['ypmc'])='ͷ����ͪ') then
            b1:=(trim(fieldValues['mg'])='����');
         if (trim(fieldvalues['ypmc'])='ͷ����ͪ/���̹') then
            b2:=(trim(fieldvalues['mg'])='����');
         if (trim(fieldvalues['ypmc'])='������') then
            if (trim(fieldvalues['mg'])='��ҩ') then
              i:=1;
         next;
     end;
     if ((i+j)>=3) then
       result:=true
     else if (b1=true) and (cnt>=1) and (b2=true) then
       result:=true
     else
       result:=false;
   end;
end;

function zExpert.isTb(drugname:string):boolean;
begin
   if pos('ͷ��',drugname)>0 then
      result:=true
   else
      result:=false;

end;

function zExpert.isctqm:boolean;
begin
    result:=false;
    with dmym.query1 do
    begin
        close;
        sql.Clear;
        sql.Add('select * from yp where ypmc=''�ǰ�����''');
        open;

        if (fieldvalues['mg']='��ҩ') or (fieldvalues['mg']='�н�') then
          result:=true;
    end;
end;

function Zexpert.isydklm:boolean;
var a,b,c:boolean;
    k:integer;
begin
    k:=0;
    if ymresults[1,23] then
      inc(k);
    if ymresults[2,23] then
      inc(k);
    if ymresults[3,23] then
      inc(k);
    if k>=2 then
    a:=true
    else
    a:=false;

    with dmym.query1 do
    begin
        close;
        sql.Clear;
        sql.add('select * from yp');
        open;
        first;
        while not eof do
        begin
            if pos('��ù��',fieldvalues['ypmc'])>0 then
            if trim(fieldvalues['mg'])='��ҩ' then
            b:=true
            else
            b:=false;

            if pos('����ù��',fieldvalues['ypmc'])>0 then
            if (trim(fieldvalues['mg'])='����') or (trim(fieldvalues['mg'])='�н�') then
            c:=true
            else
            c:=false;

            next;
        end;
    end;
    if a and b and c then
    result:=true
    else
    result:=false;
end;

function Zexpert.TsnyType(sec:string):integer;
var a,b,c,i:integer;
    bPDR:boolean;
    myini:Tinifile;
    slist:tstringlist;
    naiyao:array[1..20] of boolean;
    ftr_naiyao:array[1..20] of boolean;
begin
  result:=0;
  a:=0;
  c:=0;
  bPDR:=true;
  slist:=tstringlist.Create;
  NaturalResistance(slist);
  fillchar(naiyao,sizeof(naiyao),0);
  fillchar(ftr_naiyao,sizeof(ftr_naiyao),0);
  myini:=Tinifile.Create(Extractfiledir(Application.ExeName)+'\mdr_xdr_pdr.ini');
  a:= myini.readInteger(sec,'CNum',0);
  with dmym.query1 do
  begin
      close;
      sql.clear;
      sql.add('select * from yp');
      open;
      first;
      while not eof do
      begin
          if (myini.ValueExists(sec, trim(fieldvalues['ypmc']))) and not strInList(trim(fieldvalues['ypmc']), slist) then
              ftr_naiyao[myini.readInteger(sec, trim(fieldvalues['ypmc']), 0)]:=true;

          if trim(fieldvalues['mg'])='����' then
            bPDR := false
          else if(myini.ValueExists(sec, trim(fieldvalues['ypmc']))) and not strInList(trim(fieldvalues['ypmc']), slist) then
              naiyao[myini.readInteger(sec, trim(fieldvalues['ypmc']), 0)]:=true;

          next;
      end;
  end;
  slist.Clear;
  myini.Free;
  for i:=1 to a do
    if (ftr_naiyao[i]) then
      inc(b);

  for i:=1 to a do
    if (naiyao[i]) then
      inc(c);

  if bPDR then
    result:=3
  else if c >= b-2 then
    result:=2
  else if c >= 3 then
    result:=1;
end;

{
һ��������ҩ���Ƶ��жϣ�������ҩ���ƾ������������û�ȷ�ϣ�
 ��������ר��ϵͳ�����ҩ�����������
��һ������������ҩ���ƶ�ҩ�����������
   1��IF ȷ��Ϊ�ͼ������ֵĽ��ɫ������� OR �ͼ������ֵ�����ø�����������
     THEN  ����ҩ�����
     BEGIN
      ��-��������ҩ�01**-03 AND 02**-03 AND 03**-03 AND 04**-03 AND 05**-03 AND 06**-03
                       AND 07**-03 AND 08**-03 AND 09** AND 10**��=��ҩ
      ��ע�� ���ı�MICֵ��
     END

���������ݾ�������ҩ��������������������桰NA�������ı�MICֵ�ͽ������
   1����Ȼ���У�
 ��1��������������ù��
      ˵���������ڱ��浥�ϼ�ע��NA�����⣬��ҩ��������Ӧ��������ӡ��������ʾ��****����****ҩ��ͨ��
            �������У�����Դ˽�����ˡ���
}
procedure zExpert.expertptqj;
var
  slist:tstringlist;
  i:integer;
  b:boolean;
begin
    b:=false;
    bc:='';
    slist:=tstringlist.Create;

    {������Ϊ�������ʱ��ϸ��Ϊ�ǽ��ɫ����������ڶ�ҩ�����
    �ж����ݶ���������Ϊ��ҩ}
    if jzname<>'���ɫ�������' then
    with dmym.query1 do
    begin
        close;
        sql.Clear;
        sql.Add('select * from yp where ypid=2');
        open;
        if recordcount<>0 then
        if fieldvalues['jl']>=3 then
        begin
            edit;
            fieldvalues['mg']:='��ҩ';
            post;
        end;
    end;
    (*�����������ù�����н��٣��������о��꣬����ʾ*)
    with dmym.query1 do
    begin
        close;
        sql.Clear;
        sql.Add('select * from yp where ypmc=''��ù��''');
        open;
        if recordcount>0 then
        if fieldbyname('mg').asstring='����' then
        if messagedlg('�˾������ù�غ������У������յ���-������ø����ȷ�ϡ��Ƿ��޸Ľ����',mtconfirmation,[mbyes,mbno],0)=mryes then
        begin
          edit;
          fieldvalues['mg']:='��ҩ';
          post;
        end;
    end;

    {��Ȼ��ҩ����Ȼ����}
    naturalSensitive(slist);
    if slist.count>0 then
      updateYpTable(slist);
    slist.Clear;
    NaturalResistance(slist);
      updateypTable2(slist);
    slist.Free;

    //1���ͼ������ֵĽ��ɫ�������
    if isydklm then
    if messagedlg('�þ���Ϊ�յ�����ù����ҩ����',mtinformation,[mbyes,mbno],0)=mryes then
    begin
      if bc<>'' then
          bc:=bc+';�յ�����ù����ҩ����'
      else
          bc:='�յ�����ù����ҩ����';
      tsnyID:='�յ�����ù����ҩ';
      b:=true;
      expert:='YDKLM';
    end;
    if fastPtqj1 then
    if messagedlg('�þ���Ϊ�ͼ������ֵĽ��ɫ�������',mtinformation,[mbyes,mbno],0)=mryes then
    begin
      if bc<>'' then
          bc:=bc+';MRSA'
      else
          bc:='MRSA';
      tsnyID:=trimleft(tsnyID+' MRSA');
      tsnyIDM:=trimleft(tsnyIDM+' MRS') ;
      //modifyYpTable2;
      b:=true;
      Expert:=trimleft(Expert+' MRSA');
    end;
    if fastPtqj2 then
    if messagedlg('�þ���Ϊ�ͼ������ֵ�����ø���Ե��������',mtinformation,[mbyes,mbno],0)=mryes then
    begin
      if bc<>'' then
          bc:=bc+';MRSCN'
      else
          bc:='MRSCN';
      tsnyID:=trimleft(tsnyID+' MRSCN');
      tsnyIDM:=trimleft(tsnyIDM+' MRS');
      //modifyYpTable2;
      b:=true;
      Expert:=trimleft(Expert+' MRSCN');
    end;

    if isYpFast('���ù��') then
    if messagedlg('�þ���Ϊ�����ù���������!',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
        if bc<>'' then
          bc:=bc+';VRS'
        else
        bc:='VRS';
        tsnyID:=trim(tsnyID+' VRS');
        tsnyIDM:=trim(tsnyIDM+' VRS') ;
        Expert:=Expert+' VRS';
   end;
end;
{
һ��������ҩ���Ƶ��жϣ�������ҩ���ƾ������������û�ȷ�ϣ�
1���յ�ø��Ⱦɫ��鵼�Ĳ���-������ø���꣩
   WHILE  �����٣������˾� ��խʳ��������
    BEGIN ���ж����Ƿ�Ϊ���յ�ø���꣩
        IF  �κ�ͷ������ҩ�04**-01 OR 04**-02���Լ������ϣ�0701-01 OR 0701-02������ҩ������2
            AND ͷ����ͪ/���̹��1001-01�� ��ҩ AND ͷ����뿣�0501-01 OR 0501-02������
        THEN  �ж���Ϊ���յ�ø����
    END
}
procedure zExpert.expertffxj;
var
  slist:tstringlist;
  b:boolean;
const
  inlist:array[1..2] of string=('ͭ�̼ٵ�����','���������˾�');
begin
// 1��ESBL���������צ�-������ø���꣩
    b:=false;
    slist:=tstringlist.Create;

    {��Ȼ��ҩ����Ȼ����У��}
    naturalSensitive(slist);
    if slist.count>0 then
      updateYpTable(slist);
    slist.Clear;
    NaturalResistance(slist);
    if slist.count>0 then
      updateYpTable2(slist);
    slist.Free;
    tbUpdate;

    {������ҩ����У��}
    //if fastFF then  ������ϸ��
    if isYdm then
    if messagedlg('�þ���Ϊ���յ�ø����',mtinformation,[mbyes,mbno],0)=mryes then
    begin
       bc:='���յ�ø����';
       tsnyID:='���յ�ø';
       //modifyYpTable2;
       b:=true;
       Expert:='02CYDM';
    end;

    //CR-PA:��̼��ùϩ�࿹��ҩ��ͭ�̼ٵ�����
    if jzname ='ͭ�̼ٵ�����' then
    if isctqm then
    if messagedlg('�þ���Ϊ��̼��ùϩ�࿹��ҩ��ͭ�̼ٵ�����',mtinformation,[mbyes,mbno],0)=mryes then
    begin
       if bc<>'' then
          bc:=bc+';CR-PA'
       else
          bc:='CR-PA';
       tsnyID:=trimleft(tsnyID+' CR-PA');
       b:=true;
       expert:=trimleft(expert+' CR-PA');
    end;

    //CR-AB:��̼��ùϩ�࿹��ҩ�� ���������˾�
    if jzname ='���������˾�' then
    if isctqm then
    if messagedlg('�þ���Ϊ��̼��ùϩ�࿹��ҩ�ﱫ�������˾�',mtinformation,[mbyes,mbno],0)=mryes then
    begin
       if bc<>'' then
          bc:=bc+';CR-AB'
       else
          bc:='CR-AB';
       tsnyID:=trimleft(tsnyID+' CR-AB');
       b:=true;
       expert:=trimleft(expert+' CR-AB');
    end;

    TsnyForBmbdgj;
    TsnyForTljdbj;

end;
{
 һ��������ҩ���Ƶ��жϣ�������ҩ���ƾ������������û�ȷ�ϣ�
1�����ù�ظ�ˮƽ��ҩ�ĳ����
         IF  ���ù�أ�1101-04�� ��ҩ
         THEN  �ж���Ϊ���ù�ظ�ˮƽ��ҩ�ĳ����
     END


�����ݾ�������ҩ��������������������桰NA�������ı�MICֵ�ͽ������
   1����Ȼ���У�
  (1������������ù�أ�ʺ��������⣩

}
procedure zExpert.expertcqj;
var
  i:integer;
  slist:tstringlist;
  msg:string;
  b: boolean;
const
  speclist='���ù��500';
begin
      //��ҩ���Ƽ��
      b:=false;
      slist:=tstringlist.Create;

      {��Ȼ��ҩ����Ȼ����У��}
      naturalSensitive(slist);
      if slist.count>0 then
          updateYpTable(slist);
      slist.Clear;
      NaturalResistance(slist);
      if slist.count>0 then
          updateYpTable2(slist);
      slist.Free;
      
      {������ҩ����У��}
      with dmym.query1 do
      begin
          close;
          sql.clear;
          sql.add('select * from yp where ypmc=:ypname');
          parameters.ParamByName('ypname').Value:=speclist;
          open;
          if recordcount>0  then
          if fieldvalues['mg']='��ҩ' then
          if messagedlg('�þ���ΪHLAR(�͸�ˮƽ����������)����',mtinformation,[mbyes,mbno],0)=mryes then
          begin
            bc:='HLAR';
            tsnyID:='HLAR';
            b:=true;
          end;
      end;

      if isYpFast('���ù��') then
      if messagedlg('�þ���Ϊ�����ù�س����!',mtconfirmation,[mbyes,mbno],0)=mryes then
      begin
          if bc<>'' then
            bc:=bc+';VRE'
          else
          bc:='VRE';
          tsnyID:=trim(tsnyID+' VRE');
          tsnyIDM:=trim(tsnyIDM+' VRE') ;
          Expert:=Expert+' VRE';
      end;
end;

{
 1����Ȼ���У�
  ��5��������������������BȺ�����������ɫ������⣩����ù��
      ����ɫ�������������Ͽ�������Ⱥ�����������Ⱥ����Һ�����Ⱥ��ѪҺ�����Ⱥ����֢�����Ⱥ��
                        ����ɫ�����Ⱥ�ȡ�
 ��6������������ù��

}
procedure zExpert.expertlqj;
var
  slist:tstringlist;
begin
    slist:=tstringlist.Create;
    naturalSensitive(slist);
    if slist.count>0 then
      updateYpTable(slist);
    slist.Clear;
    NaturalResistance(slist);
      updateypTable2(slist);
    slist.Free;

    with dmym.query1 do
    begin
        close;
        sql.clear;
        sql.add('select * from yp where ypmc=''��ù��'' and mg=''��ҩ''');
        open;
        if (recordcount>0) and (jzname='���������') then
        if messagedlg('�þ���Ϊ����ù�ط��������',mtconfirmation,[mbyes,mbno],0)=mryes then
        begin
            bc:='PRSP';
            tsnyID:='PRSP';
            tsnyIDM:='PRSP';
            Expert:='PRSP';
        end;
    end;
end;

function zExpert.strInArray(str:string;arr:array of string):boolean;
var
  i:integer;
begin
  //��Ȼ��߲�����Ⱦ�����true
  for i := 0 to length(arr) - 1 do
  begin
    if (str=arr[i]) or (pos(arr[i],str)>0) then
    begin
      result:=true;
      exit;
    end;
  end;
  result:=false;
end;

function zExpert.strInList(str:string;list:Tstringlist):boolean;
var
  i:integer;
begin
  //��Ȼ��߲�����Ⱦ�����true
  for i := 0 to list.Count - 1 do
  begin
    if (str=list[i]) or (pos(list[i],str)>0) then
    begin
      result:=true;
      exit;
    end;
  end;
  result:=false;
end;

{ffxj:
���������ݾ�������ҩ���������������������"NA"�����ı�MICֵ�ͽ������
  1����Ȼ��ҩ��
 ��1������ѿխʳ���������ǰ�����
 ��2�������˾���ͷ����ͪ

 ˵���������ڱ��浥�ϼ�ע"NA"���⣬�ڽ�����Ӧ����������ʾ"****����****ҩ��ͨ��������ҩ��
       ����Դ˽�����ˡ�"

  2����Ȼ���У�
 ��1���Ƿ��;����ǰ����ϣ�����ѿխʳ���������⣩
}



{1���ͼ������ֵĽ��ɫ�������
   WHILE ����=���ɫ�������
   DO   �ж����Ƿ�Ϊ�ͼ������ֵĽ��ɫ�������
   BEGIN
    ��1�� IF   ��ù�أ�0101-03�� ��ҩ  AND  �������֣�0102-03�� ��ҩ AND ����ù��1201-03������
               ù��1602-03�����ù��1101-03�е�����2����ҩ��
          THEN �ж���Ϊ�ͼ������ֵĽ��ɫ�������
    ��2�� IF   ��ù�أ�0101-03�� ��ҩ  AND  �������֣�0102-03����ҩ AND ͷ�����֣�0201-03����ҩ
          THEN �ж���Ϊ�ͼ������ֵĽ��ɫ�������
   END
}
function zExpert.fastptqj1:boolean;
var
  cnt:integer;
begin
   cnt:=0;
   if (jzname='���ɫ�������') then
   if (*isYpFast('��ù��') and *)isYpFast('ͷ������')(* and isYpFast('ͷ������') and
        isYpFast('���ù��')*) then
   begin
        result:=true;
        exit;
   end;
    {
    if isYpFast('��ù��') and isYpFast('��������') then
    begin
        if isYpFast('��ù��') then
          inc(cnt);
        if isYpFast('����ù��') then
          inc(cnt);
        if isYpFast('���ù��') then
          inc(cnt);
        if cnt>=2 then
        begin
            result:=true;
            exit;
        end;
    end;
    }
   result:=false;
end;
{
2���ͼ������ֵ�����ø�����������
    WHILE ���֡ٽ��ɫ�������  AND  �Ʊ�=�������
    DO    �ж����Ƿ�Ϊ�ͼ������ֵ�����ø�����������
      BEGIN
      ��1�� IF   ��ù�أ�0101-03�� ��ҩ  AND  �������֣�0102-03�� ��ҩ AND ����ù��1201-03������
                 ù��1602-03�����ù��1101-03�е�����2����ҩ��
            THEN �ж���Ϊ�ͼ������ֵĽ��ɫ�������
      ��2�� IF   ��ù�أ�0101-03�� ��ҩ  AND  �������֣�0102-03����ҩ AND ͷ�����֣�0201-03����ҩ
            THEN �ж���Ϊ�ͼ������ֵ�����ø�����������
      END
}
function zExpert.fastPtqj2:boolean;
begin
  if (jzname<>'���ɫ�������') then
  if (jzname<>'�ﰺ�������')and (jzname<>'·���������') then
  begin
      if (*isYpFast('��ù��') and *)isYpFast('��������')(* and isYpFast('ͷ������') and isYpFast('���ù��')*)
          then
      begin
          result:=true;
          exit;
      end;
  end
  else if isYpFast('ͷ������') then
  begin
      result:=true;
      exit;
  end;

  result:=false;

end;
function zExpert.isYpFast(ypname: string):boolean;
begin
   with dmym.query1 do
   begin
     close;
     sql.clear;
     sql.add('select * from yp where ypmc=:ypname');
     parameters.parambyname('ypname').Value:=ypname;
     open;

     if recordcount>0 then
        if (fieldvalues['mg']='��ҩ') or (fieldvalues['mg']='����') then
        begin
          result:=true;
          exit;
        end;
     result:=false;
   end;
end;

procedure zExpert.updateYpTable(yps:tstringlist);
var
  i:integer;
  msg:string;
  YpmcArray:array of string;
begin
    if yps.count>0 then
    begin
        with dmym.query1 do
        begin
          close;
          sql.Clear;
          sql.add('select * from yp where mg=''��ҩ''');
          open;
          i:=0;
          first;
          while not eof do
          begin
            if pos(fieldbyname('ypmc').asstring,yps.Text)>0 then
            begin
              setlength(YpmcArray,i+1);
              YpmcArray[i]:=fieldbyname('ypmc').asstring;
              inc(i);
            end;
            next;
          end;
        end;
        if length(YpmcArray)>0 then
        begin
            msg:=jzname+'������ҩƷ��'+#13#10;
            for i:=0 to length(YpmcArray)-1 do
            begin
                msg:=msg+YpmcArray[i]+#13#10
            end;
            msg:=msg+'ͨ���������У�����Դ˽�����и��ˡ��Ƿ��޸Ľ����' ;
            if messagedlg(msg,mtconfirmation,[mbyes,mbno],1)=mryes then
            begin
                 dmym.conn.BeginTrans;
                 try
                    for i:=0 to length(YpmcArray)-1 do
                      dmym.conn.Execute('update yp set mg=''����'' where ypmc='''+YpmcArray[i]+'''');
                    dmym.conn.CommitTrans;
                 except
                    dmym.conn.RollbackTrans;
                 end;
            end;
        end;
    end;
end;
procedure zexpert.updateYpTable2(yps:tstringlist);
var
  i:integer;
  msg:string;
  YpmcArray:array of string;
begin
    if yps.count>0 then
    begin
       with dmym.query1 do
        begin
          close;
          sql.Clear;
          sql.add('select * from yp where mg=''����''');
          open;
          i:=0;
          first;
          while not eof do
          begin
            if pos(fieldbyname('ypmc').asstring,yps.Text)>0 then
            begin
              setlength(YpmcArray,i+1);
              YpmcArray[i]:=fieldbyname('ypmc').asstring;
              inc(i);
            end;
            next;
          end;
        end;

        if  length(YpmcArray)>0 then
        begin
            msg:=jzname+'������ҩƷ��'+#13#10;
            for i:=0 to length(YpmcArray)-1 do
            begin
                msg:=msg+YpmcArray[i]+#13#10
            end;
            msg:=msg+'ͨ��������ҩ������Դ˽�����и��ˡ��Ƿ��޸Ľ����' ;
            if messagedlg(msg,mtconfirmation,[mbyes,mbno],1)=mryes then
            begin
                 dmym.conn.BeginTrans;
                 try
                    for i:=0 to length(YpmcArray)-1 do
                      dmym.conn.Execute('update yp set mg=''��ҩ'' where ypmc='''+YpmcArray[i]+'''');
                    dmym.conn.CommitTrans;
                 except
                    dmym.conn.RollbackTrans;
                 end;
            end;
        end;
    end;
end;
{
 1 ��-��������ҩ�01**-01 AND 02**-01 AND 03**-01 AND 04**-01 AND 07**-01��=��ҩ
 �������� ͷ������ ͷ����� ͷ�����  ͷ��߻��  ͷ����ͪ  ͷ�����  ͷ�����  ������
}
procedure zExpert.modifyYpTable;
var
  i:integer;
const
 yplist:array[1..9] of string=('��������','ͷ������','ͷ�����','ͷ�����','ͷ��߻��',
    'ͷ����ͪ','ͷ�����','ͷ�����','������');
begin
    for i := 1 to length(yplist) do
      begin
          with dmym.query1 do
          begin
            close;
            sql.clear;
            sql.add('select * from yp where ypmc=:ypname');
            parameters.ParamByName('ypname').Value:=yplist[i];
            open;

            if recordcount>0 then
            begin
                if fieldvalues['mg']<>'��ҩ' then
                 begin
                    edit;
                    fieldvalues['mg']:='��ҩ';
                 end;
            end;
          end;
      end;
end;
//AND 09**  AND 10** ��������/�����̹ ͷ����ͪ/���̹

procedure zExpert.modifyYpTable2 ;
var
  i:integer;
const
  yplist:array[1..15] of string=('��������','ͷ������','ͷ�����','ͷ�����','ͷ��߻��',
    'ͷ����ͪ','ͷ�����','ͷ�����','������','��������/�����̹','ͷ������',
    '��Ī����/����ά��','�濨����/����ά��','��������/���̹',
    'ͷ����ͪ/���̹');
begin
    for i := 1 to length(yplist) do
      begin
          with dmym.query1 do
          begin
            close;
            sql.clear;
            sql.add('select * from yp where ypmc=:ypname');
            parameters.ParamByName('ypname').Value:=yplist[i];
            open;

            if recordcount>0 then
            begin
                if fieldvalues['mg']<>'��ҩ' then
                 begin
                    edit;
                    fieldvalues['mg']:='��ҩ';
                 end;
            end;
          end;
       end;
end;

{
1���ж�ͷ����ҩ����������ȼ�
     BEGIN
       CASE 1 
          IF    ͷ��һ����02**��=����
          THEN  ����ͷ�ߣ�03**��04**��05**��06**��07**��08**��10**��Ӧ��Ϊ����
          ELSE  ���浥��ע"NA"
          ������Ӧ�ø�������ӡ��������ʾ"ͷ��һ��ҩ������ʱ��ͨ��ͷ�߶������������Ĵ�ҲӦ�����У�
          �븴�˸ý����"
       CASE 2
          IF    ͷ��һ����02**��=��ҩ  AND ͷ�߶�����03**��=����
          THEN  ͷ�������Ĵ���04**��05**��07**��08**��10**��Ӧ��Ϊ����
          ELSE  ���浥��ע"NA"
          ������Ӧ�ø�������ӡ��������ʾ"ͷ�߶���ҩ������ʱ��ͨ���������Ĵ�ҲӦ�����У��븴�˸ý�
}
procedure zExpert.tbUpdate;
var
  //slist:tstringlist;
  b:boolean;
  msg:string;
const
  yplist2:array[1..5] of string=('ͷ����ͪ','ͷ�����','ͷ�����','������','ͷ����ͪ/���̹');//ͷ��3,4��
  yplist:array[1..8] of string=('ͷ������','ͷ�����','ͷ�����','ͷ��߻��',
    'ͷ����ͪ','ͷ�����','ͷ�����','ͷ����ͪ/���̹');
begin
  b:=false;
  msg:='';

  if istbdfast(1,'����') then
    b:=updateTb(yplist);
  if b then
  begin
    msg:='ͷ��һ��ҩ������ʱ��ͨ��ͷ�߶������������Ĵ�ҲӦ�����У�'+#13#10'�븴�˸ý����';

    MessageDlg(msg,mtInformation,[mbok],0);
  end;

  if istbdfast(1,'��ҩ') and istbdfast(2,'����') then
    b:=updateTb(yplist2);
  if b then
  begin
       msg:='ͷ�߶���ҩ������ʱ��ͨ���������Ĵ�ҲӦ�����У�'+#13#10'�븴�˸ý����';
    MessageDlg(msg,mtInformation,[mbok],0);
  end;

end;

function zExpert.isTbdFast(d:integer;mgstr:string):boolean;
var
  i:integer;
  b:boolean;
begin
  b:=false;
  //for i:=1 to length(tb2d) do
   with dmym.query1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from yp where zd=:zd');
      parameters.ParamByName('zd').Value:=d;
      open;

      while not eof do
      begin
       if (pos('ͷ��',fieldvalues['ypmc'])>0) and (fieldvalues['mg']=mgstr) then
          b:=true
       else
          b:=false;
       next;
      end;
    end;
    result:=b;
end;

function zExpert.updateTb(yps:array of string):boolean;
var
  b:boolean;
  i:integer;
begin
    b:=false;
    for i := 0 to length(yps)-1 do
      begin
          with dmym.query1 do
          begin
            close;
            sql.clear;
            sql.add('select * from yp where ypmc=:ypname');
            parameters.ParamByName('ypname').Value:=yps[i];
            open;

            if recordcount>0 then
            begin
                if fieldvalues['mg']<>'����' then
                 begin
                    edit;
                    fieldvalues['bz']:='NA';
                    b:=true;
                 end;
            end;
          end;
       end;
    result:=b;
end;

function zExpert.fastCgj3: boolean;
Const
    Ctlist:Array[0..4]of string=('����Ʋ����˾�','���������˾�','��Ѫ�����˾�','��Ʋ����˾�','����ѿխʳ������');
begin
    if not AnsiMatchText(Jzname,Ctlist) then
      Result:=true
    else
      Result:=false;
end;

procedure zExpert.CheckPani;
var CheckMg:string;
begin
    with dmym.query1 do
    begin
        close;
        sql.Clear;
        sql.Add('select * from yp where ypmc=''�ǰ�����''');
        open;

        if recordcount<>0 then
         CheckMg:=fieldvalues['mg'];

        close;
        sql.Clear;
        sql.Add('select * from yp where ypmc=''��������''');
        open;
        if recordcount<>0 then
        if checkmg<>'' then
        if fieldvalues['mg']<>CheckMg then
        begin
            if messagedlg('��Ϊ�ǰ�����Ϊ'+CheckMg+'�����Խ��齫�������ϵ�ҩ��'+#13#10
               +'����޸�Ϊ'+CheckMg+'���Ƿ��޸ģ�',mtconfirmation,[mbyes,mbno],0)=mryes then
            begin
              edit;
              fieldvalues['mg']:=CheckMg;
              post;
            end;
        end;
    end;
end;

procedure zExpert.NaturalResistance(var yps: Tstringlist);
var YmType:string;
begin
    ymType:='+';
    with dmym.query1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from ymspecial where ymType='''+YmType+''' and js='''+
              js+''' and xjName='''+jzname+'''');
      open;
    end;
    dmym.query1.First;
    yps.Clear;
    While not dmym.query1.Eof do
    begin
      yps.Add(dmym.query1.FieldByName('ypmc').AsString);
      dmym.query1.Next;
    end;
end;

procedure zExpert.NaturalSensitive(var yps: Tstringlist);
var YmType:string;
begin
    ymType:='-';
    with dmym.query1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from ymspecial where ymType='''+YmType+''' and js='''+
              js+''' and xjName='''+jzname+'''');
      open;
    end;
    dmym.query1.First;
    yps.Clear;
    While not dmym.query1.Eof do
    begin
      yps.Add(dmym.query1.FieldByName('ypmc').AsString);
      dmym.query1.Next;
    end;
end;

procedure zExpert.expertepi;
var slist:Tstringlist;
begin
    slist:=tstringlist.Create;
    naturalSensitive(slist);
    if slist.count>0 then
      updateYpTable(slist);
    slist.Clear;
    NaturalResistance(slist);
    if slist.count>0 then
      updateypTable2(slist);
    slist.Free;
end;

procedure zExpert.TsnyForTljdbj;
var tsny:integer;
begin
  if (jzname = 'ͭ�̼ٵ�����') then
  begin
    tsny:= TsnyType('ͭ�̼ٵ�����');
    if (tsny = 1) then
    if messagedlg('�þ���Ϊ������ҩͭ�̼ٵ�����!',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
        if bc<>'' then
          bc:=bc+';MDR-PA'
        else
        bc:='MDR-PA';
        tsnyID:=trim(tsnyID+' MDR-PA');
        tsnyIDM:=trim(tsnyIDM+' MDR-PA') ;
        Expert:=Expert+' MDR-PA';
    end;
    if (tsny = 2) then
    if messagedlg('�þ���Ϊ����ҩͭ�̼ٵ�����!',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
        if bc<>'' then
          bc:=bc+';XDR-PA'
        else
        bc:='XDR-PA';
        tsnyID:=trim(tsnyID+' XDR-PA');
        tsnyIDM:=trim(tsnyIDM+' XDR-PA') ;
        Expert:=Expert+' XDR-PA';
    end;
    if (tsny = 3) then
    if messagedlg('�þ���Ϊ����ҩͭ�̼ٵ�����!',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
        if bc<>'' then
          bc:=bc+';PDR-PA'
        else
        bc:='PDR-PA';
        tsnyID:=trim(tsnyID+' PDR-PA');
        tsnyIDM:=trim(tsnyIDM+' PDR-PA') ;
        Expert:=Expert+' PDR-PA';
    end;
  end;
end;

procedure zExpert.TsnyForBmbdgj;
var tsny:integer;
begin
  if (jzname = '���������˾�') then
    if (js = '01') then
      tsny:= TsnyType('�����˾����˾�')
    else if (js = '02') then
      tsny:= TsnyType('�����˾��Ƿ��;�')
  else
    exit;

    if (tsny = 1) then
    if messagedlg('�þ���Ϊ������ҩ���������˾�!',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
        if bc<>'' then
          bc:=bc+';MDR-AB'
        else
        bc:='MDR-AB';
        tsnyID:=trim(tsnyID+' MDR-AB');
        tsnyIDM:=trim(tsnyIDM+' MDR-AB') ;
        Expert:=Expert+' MDR-AB';
    end;
    if (tsny = 2) then
    if messagedlg('�þ���Ϊ����ҩ���������˾�!',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
        if bc<>'' then
          bc:=bc+';XDR-AB'
        else
        bc:='XDR-AB';
        tsnyID:=trim(tsnyID+' XDR-AB');
        tsnyIDM:=trim(tsnyIDM+' XDR-AB') ;
        Expert:=Expert+' XDR-AB';
    end;
    if (tsny = 3) then
    if messagedlg('�þ���Ϊ����ҩ���������˾�!',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
        if bc<>'' then
          bc:=bc+';PDR-AB'
        else
        bc:='PDR-AB';
        tsnyID:=trim(tsnyID+' PDR-AB');
        tsnyIDM:=trim(tsnyIDM+' PDR-AB') ;
        Expert:=Expert+' PDR-AB';
    end;
end;

procedure zExpert.TsnyForAll;
Const
    Bdgjlist:Array[0..2]of string=('����Ʋ����˾�','��Ѫ�����˾�','��Ʋ����˾�');
var tsny:integer;
begin
  if (jzname = '����ѿխʳ������') then
    exit;

  if ((js = '01') and strInArray(jzname,Bdgjlist) ) then
       tsny:= TsnyType('�����˾����˾�')
  else if (js = '01') then
       tsny:= TsnyType('���˾�')
  else if ((js = '02') and strInArray(jzname,Bdgjlist)) then
       tsny:= TsnyType('�����˾��Ƿ��;�')
  else if (js = '03') then
       tsny:= TsnyType('�������')
  else if (js = '04') then
       tsny:= TsnyType('�����')
  else if (js = '12') then
       tsny:= TsnyType('�����a')
  else
    exit;

    if (tsny = 1) then
    if messagedlg('�þ���Ϊ������ҩ����!',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
        if bc<>'' then
          bc:=bc+';MDR'
        else
        bc:='MDR';
        tsnyID:=trim(tsnyID+' MDR');
        tsnyIDM:=trim(tsnyIDM+' MDR') ;
        Expert:=Expert+' MDR';
    end;
    if (tsny = 2) then
    if messagedlg('�þ���Ϊ����ҩ����!',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
        if bc<>'' then
          bc:=bc+';XDR'
        else
        bc:='XDR';
        tsnyID:=trim(tsnyID+' XDR');
        tsnyIDM:=trim(tsnyIDM+' XDR') ;
        Expert:=Expert+' XDR';
    end;
    if (tsny = 3) then
    if messagedlg('�þ���Ϊ����ҩ����!',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
        if bc<>'' then
          bc:=bc+';PDR'
        else
        bc:='PDR';
        tsnyID:=trim(tsnyID+' PDR');
        tsnyIDM:=trim(tsnyIDM+' PDR') ;
        Expert:=Expert+' PDR';
    end;
end;

end.


