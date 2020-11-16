unit expert;

interface
uses common,strutils,dialogs,sysutils,classes,variants,controls,db,inifiles,Forms;
const
  cgjArray:array[1..5] of string=('大肠埃希菌','肺炎克雷伯菌肺炎亚种','产酸克雷伯菌',
    '奇异变形杆菌','');
  msgArray:array[1..3] of string=('可能为ESBLs(超广谱β-内酰胺酶)菌株','','');
  greenLqjs:array[1..7] of string=('草绿色咽喉炎链球菌群','草绿色缓症链球菌群',
    '草绿色变异链球菌群','草绿色血液链球菌群','草绿色唾液链球菌群',
    '草绿色链球菌群','');
  function isInArray(idx:string;destarr:array of string):boolean;

  procedure test;
type
   zExpert=class
   private
      js:string;
      jzname:string;
      ZkAns:boolean;//判断是否质控分析 ;
      magicNumber:integer;

      function strInArray(str:string;arr:array of string):boolean;
      function strInList(str:string;list:Tstringlist):boolean;
      function isTb(drugname:string):boolean;//是否头孢类？
      function isTbdFast(d:integer;mgstr:string):boolean;//头孢d代敏感

   public
      expert:string;//专家系统结果
      bc:string;//补充说明，base表的[bc]字段
      tsnyID:string;//补充说明 耐药类别以供在后期查询
      tsnyIDM:string;//补充说明MRS
      constructor create(js1,jz1:string;bezk:boolean);
      procedure decisionProcess;
      procedure expertcgj; //肠杆菌
      procedure expertptqj; //葡萄球菌
      procedure expertffxj;  //非发酵菌
      procedure expertcqj; //肠球菌
      procedure expertlqj; //链球菌
      procedure expertsxgj; //嗜血杆菌
      procedure expertyxqj;//阴性球菌
      procedure expertepi;//真菌专家系统

      function isESBL:boolean;
      function isYdm:boolean;//诱导酶
      function isYpFast(ypname:string):boolean;
      function isctqm:boolean;//判断耐碳青霉烯类抗菌药物
      function isydklm:boolean;//判断 诱导克林霉素实验
      function TsnyType(sec:string):integer; // 判断 0..普通 1..多重耐药 2..高耐药 3..泛耐药
      Procedure NaturalSensitive(var yps:Tstringlist);//提取天然敏感药敏
      Procedure NaturalResistance(var yps:Tstringlist);//提取天然耐药药敏
      procedure updateYpTable(yps:tstringlist); //修改天然敏感药敏结果
      procedure updateYpTable2(yps:tstringlist);//修改天然耐药药敏结果
      procedure modifyYpTable;//直接修改药敏结果敏感值
      procedure modifyYpTable2 ;
      procedure tbUpdate;//根据头孢优先级修改
      Procedure CheckPani;//根据亚胺培南修改帕尼培南；
      Procedure TsnyForTljdbj; // 对于铜绿假单胞菌的特殊耐药性
      Procedure TsnyForBmbdgj; // 对于鲍曼不动杆菌的特殊耐药性
      procedure TsnyForAll;
      function updateTb(yps:array of string):boolean;//修改了返回true，未做修改返回false

      function fastyxqj1:boolean;// 阴性球菌
      function fastsxgj1:boolean;//嗜血杆菌
      function fastCgj1:boolean;//产诱导酶
      function fastCgj2:boolean;//esbl
      function fastCgj3:boolean;//产碳青霉稀霉
      function fastPtqj1:boolean;//1、耐甲氧西林的金黄色葡萄球菌
      function fastPtqj2:boolean;//2、耐甲氧西林的凝固酶阴性葡萄球菌
      function fastFF:boolean;//非发酵菌

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
   if pos('可能存在技术性误差',jzname)>0 then
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
      expertcqj; //肠球菌专家系统
     if (js='06') or (js='13') then
      expertlqj; //链球菌专家系统
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
    // 1、ESBL（产超广谱β-内酰胺酶菌株）
    bc:='';
    b:=false;
    slist:=tstringlist.Create;

    {根据细菌修正药敏结果}
    if not AnsiMatchstr(jzname,['洛菲不动杆菌','鲍曼不动杆菌','醋酸钙不动杆菌']) then
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
            fieldvalues['mg']:='耐药';
            post;
        end;
    end;

    {天然耐药和天然敏感校核}
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

   {特殊耐药机制校核}
   //if ZkAns then
   begin
      if fastCgj1 then
      if isESBL then
      if messagedlg('该菌株为ESBLs(超广谱β-内酰胺酶)菌株',mtinformation,[mbyes,mbno],0)=mryes then
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
    if messagedlg('该菌株为产诱导酶菌株',mtinformation,[mbyes,mbno],0)=mryes then
    begin
       if bc<>'' then
          bc:=bc+';产诱导酶菌株'
       else
          bc:='产诱导酶菌株';
       tsnyID:=trimleft(tsnyID+' 产诱导酶');
       //modifyYpTable2;
       b:=true;
       expert:=trimleft(expert+' 01CYDM');
    end;

    if FastCgj3 then
    if isctqm then
    if messagedlg('该菌株为耐碳青霉烯类抗菌药物菌株',mtinformation,[mbyes,mbno],0)=mryes then
    begin
       if bc<>'' then
          bc:=bc+';CRE'
       else
          bc:='CRE';
       tsnyID:=trimleft(tsnyID+' CRE');
       b:=true;
       expert:=trimleft(expert+' CRE');
    end;

    //CR-AB:耐碳青霉烯类抗菌药物 鲍曼不动杆菌
    if jzname ='鲍曼不动杆菌' then
    if isctqm then
    if messagedlg('该菌株为耐碳青霉烯类抗菌药物鲍曼不动杆菌',mtinformation,[mbyes,mbno],0)=mryes then
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
//阴性球菌
procedure zExpert.expertyxqj;
var
  slist:tstringlist;
begin
    // 1、ESBL（产超广谱β-内酰胺酶菌株）
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
  inlist:array[1..2] of string=('淋病奈瑟菌','莫拉菌属');
begin
  if strInarray(jzname,inlist) then
  begin
       result:=true;
       exit;
  end;
  result:=false;
end;

//////////////////////////////////////////////////////////////////
//嗜血杆菌
procedure zExpert.expertsxgj;
var
  slist:tstringlist;
  b:boolean;
begin
// 1、ESBL（产超广谱β-内酰胺酶菌株）
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
  inlist:array[1..8] of string=('流感嗜血杆菌Ⅰ','流感嗜血杆菌Ⅱ','流感嗜血杆菌Ⅲ','流感嗜血杆菌Ⅳ',
  '流感嗜血杆菌Ⅴ','流感嗜血杆菌Ⅵ','流感嗜血杆菌Ⅶ','流感嗜血杆菌Ⅷ');
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
  inlist:array[1..4] of string=('大肠埃希菌','肺炎克雷伯菌','产酸克雷伯菌','奇异变形杆菌');
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
  nolist:array[1..4] of string=('大肠埃希菌','肺炎克雷伯菌','产酸克雷伯菌','奇异变形杆菌');
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
  inlist:array[1..2] of string=('不动杆菌','窄食单胞菌');
begin
  if strInarray(jzname,inlist) then
  begin
       result:=true;
       exit;
  end;
  result:=false;
end;
{
 2、诱导酶（染色体介导的产β-内酰胺酶菌株）
   WHILE  菌种≠(大肠埃希菌、肺炎克雷伯菌、产酸克雷伯菌)
   DO   判断其是否为产诱导酶菌株
    BEGIN
        IF  （任何头孢三代药物（04**-01 OR 04**-02）以及氨曲南（0701-01 OR 0701-02）的耐药数量≥2 ）
            AND 头孢哌酮/舒巴坦（1001-01） 耐药 AND 头孢吡肟（0501-01 OR 0501-02）敏感
        THEN  判断其为产诱导酶菌株
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
         if pos('头孢',fieldvalues['ypmc'])>0 then
            if (trim(fieldvalues['mg'])='耐药') and
                 fieldvalues['zd']=3 then
               inc(cnt);
         if (trim(fieldvalues['ypmc'])='氨曲南') then
            if (trim(fieldValues['mg'])='耐药') then
              inc(cnt);
         if (trim(fieldvalues['ypmc'])='头孢哌酮/舒巴坦') then
            b1:=(trim(fieldvalues['mg'])='耐药');
         if (trim(fieldvalues['ypmc'])='头孢吡肟') then
            b2:=(trim(fieldvalues['mg'])='敏感');
         next;
     end;
     if (cnt>=2) and  (b1=true) and (b2=true) then
       result:=true
     else
       result:=false;
   end;

end;

{

 1、ESBL（产超广谱β-内酰胺酶菌株）
  WHILE  菌种=大肠埃希菌 OR 肺炎克雷伯菌 OR 产酸克雷伯菌 OR 奇异变形杆菌
  DO 判断其是否为ESBL
   BEGIN
      CASE
    （1）IF     F23、G23、H23（三个低浓度头孢三代药物）中有两个以上耐药（不计反应次序）
         THEN   判断为ESBL
    （2）IF     头孢哌酮（0401-01）耐药 AND 其他任何一种头孢三代（04**-01）耐药 AND
                头孢哌酮/舒巴坦（1001-01） 敏感
         THEN   判断为ESBL
    （3）IF     任何头孢三代药物（04**-01）以及氨曲南（0701-01）的耐药数量≥3
         THEN   判断为ESBL
   END;}
function zExpert.isESBL:boolean;
var
   cnt,i,j:integer;
   b1,b2:boolean;
begin
   cnt:=0;
   b1:=false;
   b2:=false;                
   //1 23号孔有两个以上被选中
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
         if (pos('头孢',fieldvalues['ypmc'])>0) and (trim(fieldvalues['ypmc'])<>'头孢哌酮') and (trim(fieldvalues['ypmc'])<>'头孢哌酮/舒巴坦') then
            if (trim(fieldvalues['mg'])='耐药') and
               fieldvalues['zd']=3 then
               inc(cnt); //用于第一条规则计算非头孢哌酮和头孢哌酮/舒巴坦的其它头孢三代药耐药计数;
         if (pos('头孢',fieldvalues['ypmc'])>0) then
            if (trim(fieldvalues['mg'])='耐药') and
               fieldvalues['zd']=3 then
               inc(j); //用于第三条规则的所有头孢三代药耐药计数;（ 包含头孢哌酮和头孢哌酮/舒巴坦.
         if (trim(fieldvalues['ypmc'])='头孢哌酮') then
            b1:=(trim(fieldValues['mg'])='敏感');
         if (trim(fieldvalues['ypmc'])='头孢哌酮/舒巴坦') then
            b2:=(trim(fieldvalues['mg'])='敏感');
         if (trim(fieldvalues['ypmc'])='氨曲南') then
            if (trim(fieldvalues['mg'])='耐药') then
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
   if pos('头孢',drugname)>0 then
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
        sql.Add('select * from yp where ypmc=''亚胺培南''');
        open;

        if (fieldvalues['mg']='耐药') or (fieldvalues['mg']='中介') then
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
            if pos('红霉素',fieldvalues['ypmc'])>0 then
            if trim(fieldvalues['mg'])='耐药' then
            b:=true
            else
            b:=false;

            if pos('克林霉素',fieldvalues['ypmc'])>0 then
            if (trim(fieldvalues['mg'])='敏感') or (trim(fieldvalues['mg'])='中介') then
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

          if trim(fieldvalues['mg'])='敏感' then
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
一、特殊耐药机制的判断（所有耐药机制均必须最终由用户确认）
 二、根据专家系统规则对药敏结果的修正
（一）根据特殊耐药机制对药敏结果的修正
   1、IF 确认为耐甲氧西林的金黄色葡萄球菌 OR 耐甲氧西林的凝固酶阴性葡萄球菌
     THEN  修正药敏结果
     BEGIN
      β-内酰胺类药物（01**-03 AND 02**-03 AND 03**-03 AND 04**-03 AND 05**-03 AND 06**-03
                       AND 07**-03 AND 08**-03 AND 09** AND 10**）=耐药
      （注： 不改变MIC值）
     END

（二）根据经验规则对药敏结果的修正（仅仅报告“NA”，不改变MIC值和结果。）
   1、天然敏感：
 （1）葡萄球菌：万古霉素
      说明：除了在报告单上加注“NA”以外，在药敏界面上应给出不打印的文字提示“****菌对****药物通常
            呈现敏感，建议对此结果复核。”
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

    {当菌属为葡萄球菌时，细菌为非金黄色葡萄球菌，第二药物如果
    有二个梯度生长，即为耐药}
    if jzname<>'金黄色葡萄球菌' then
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
            fieldvalues['mg']:='耐药';
            post;
        end;
    end;
    (*葡萄球菌对青霉素敏感较少，如有敏感菌株，则提示*)
    with dmym.query1 do
    begin
        close;
        sql.Clear;
        sql.Add('select * from yp where ypmc=''青霉素''');
        open;
        if recordcount>0 then
        if fieldbyname('mg').asstring='敏感' then
        if messagedlg('此菌株对青霉素罕见敏感，请做诱导β-内酰胺酶试验确认。是否修改结果？',mtconfirmation,[mbyes,mbno],0)=mryes then
        begin
          edit;
          fieldvalues['mg']:='耐药';
          post;
        end;
    end;

    {天然耐药和天然敏感}
    naturalSensitive(slist);
    if slist.count>0 then
      updateYpTable(slist);
    slist.Clear;
    NaturalResistance(slist);
      updateypTable2(slist);
    slist.Free;

    //1、耐甲氧西林的金黄色葡萄球菌
    if isydklm then
    if messagedlg('该菌株为诱导克林霉素耐药菌株',mtinformation,[mbyes,mbno],0)=mryes then
    begin
      if bc<>'' then
          bc:=bc+';诱导克林霉素耐药菌株'
      else
          bc:='诱导克林霉素耐药菌株';
      tsnyID:='诱导克林霉素耐药';
      b:=true;
      expert:='YDKLM';
    end;
    if fastPtqj1 then
    if messagedlg('该菌株为耐甲氧西林的金黄色葡萄球菌',mtinformation,[mbyes,mbno],0)=mryes then
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
    if messagedlg('该菌株为耐甲氧西林的凝固酶阴性的葡萄球菌',mtinformation,[mbyes,mbno],0)=mryes then
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

    if isYpFast('万古霉素') then
    if messagedlg('该菌株为耐万古霉素葡萄球菌!',mtconfirmation,[mbyes,mbno],0)=mryes then
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
一、特殊耐药机制的判断（所有耐药机制均必须最终由用户确认）
1、诱导酶（染色体介导的产β-内酰胺酶菌株）
   WHILE  菌属≠（不动杆菌 、窄食单胞菌）
    BEGIN （判断其是否为产诱导酶菌株）
        IF  任何头孢三代药物（04**-01 OR 04**-02）以及氨曲南（0701-01 OR 0701-02）的耐药数量≥2
            AND 头孢哌酮/舒巴坦（1001-01） 耐药 AND 头孢吡肟（0501-01 OR 0501-02）敏感
        THEN  判断其为产诱导酶菌株
    END
}
procedure zExpert.expertffxj;
var
  slist:tstringlist;
  b:boolean;
const
  inlist:array[1..2] of string=('铜绿假单胞菌','鲍曼不动杆菌');
begin
// 1、ESBL（产超广谱β-内酰胺酶菌株）
    b:=false;
    slist:=tstringlist.Create;

    {天然耐药和天然敏感校核}
    naturalSensitive(slist);
    if slist.count>0 then
      updateYpTable(slist);
    slist.Clear;
    NaturalResistance(slist);
    if slist.count>0 then
      updateYpTable2(slist);
    slist.Free;
    tbUpdate;

    {特殊耐药机制校核}
    //if fastFF then  对所有细菌
    if isYdm then
    if messagedlg('该菌株为产诱导酶菌株',mtinformation,[mbyes,mbno],0)=mryes then
    begin
       bc:='产诱导酶菌株';
       tsnyID:='产诱导酶';
       //modifyYpTable2;
       b:=true;
       Expert:='02CYDM';
    end;

    //CR-PA:耐碳青霉烯类抗菌药物铜绿假单胞菌
    if jzname ='铜绿假单胞菌' then
    if isctqm then
    if messagedlg('该菌株为耐碳青霉烯类抗菌药物铜绿假单胞菌',mtinformation,[mbyes,mbno],0)=mryes then
    begin
       if bc<>'' then
          bc:=bc+';CR-PA'
       else
          bc:='CR-PA';
       tsnyID:=trimleft(tsnyID+' CR-PA');
       b:=true;
       expert:=trimleft(expert+' CR-PA');
    end;

    //CR-AB:耐碳青霉烯类抗菌药物 鲍曼不动杆菌
    if jzname ='鲍曼不动杆菌' then
    if isctqm then
    if messagedlg('该菌株为耐碳青霉烯类抗菌药物鲍曼不动杆菌',mtinformation,[mbyes,mbno],0)=mryes then
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
 一、特殊耐药机制的判断（所有耐药机制均必须最终由用户确认）
1、庆大霉素高水平耐药的肠球菌
         IF  庆大霉素（1101-04） 耐药
         THEN  判断其为庆大霉素高水平耐药的肠球菌
     END


二根据经验规则对药敏结果的修正（仅仅报告“NA”，不改变MIC值和结果。）
   1、天然敏感：
  (1）肠球菌：万古霉素（屎肠球菌除外）

}
procedure zExpert.expertcqj;
var
  i:integer;
  slist:tstringlist;
  msg:string;
  b: boolean;
const
  speclist='庆大霉素500';
begin
      //耐药机制检查
      b:=false;
      slist:=tstringlist.Create;

      {天然耐药和天然敏感校核}
      naturalSensitive(slist);
      if slist.count>0 then
          updateYpTable(slist);
      slist.Clear;
      NaturalResistance(slist);
      if slist.count>0 then
          updateYpTable2(slist);
      slist.Free;
      
      {特殊耐药机制校核}
      with dmym.query1 do
      begin
          close;
          sql.clear;
          sql.add('select * from yp where ypmc=:ypname');
          parameters.ParamByName('ypname').Value:=speclist;
          open;
          if recordcount>0  then
          if fieldvalues['mg']='耐药' then
          if messagedlg('该菌株为HLAR(耐高水平氨基糖苷类)菌株',mtinformation,[mbyes,mbno],0)=mryes then
          begin
            bc:='HLAR';
            tsnyID:='HLAR';
            b:=true;
          end;
      end;

      if isYpFast('万古霉素') then
      if messagedlg('该菌株为耐万古霉素肠球菌!',mtconfirmation,[mbyes,mbno],0)=mryes then
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
 1、天然敏感：
  （5）链球菌（肺炎链球菌、B群链球菌、草绿色链球菌外）：青霉素
      草绿色链球菌包括：咽峡炎链球菌群、变异链球菌群、唾液链球菌群、血液链球菌群、缓症链球菌群、
                        草绿色链球菌群等。
 （6）链球菌：万古霉素

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
        sql.add('select * from yp where ypmc=''青霉素'' and mg=''耐药''');
        open;
        if (recordcount>0) and (jzname='肺炎链球菌') then
        if messagedlg('该菌株为耐青霉素肺炎链球菌',mtconfirmation,[mbyes,mbno],0)=mryes then
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
  //相等或者部分相等均返回true
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
  //相等或者部分相等均返回true
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
（二）根据经验规则对药敏结果的修正（仅仅报告"NA"，不改变MIC值和结果。）
  1、天然耐药：
 （1）嗜麦芽窄食单胞菌：亚胺培南
 （2）不动杆菌：头孢哌酮

 说明：除了在报告单上加注"NA"以外，在界面上应给出文字提示"****菌对****药物通常呈现耐药，
       建议对此结果复核。"

  2、天然敏感：
 （1）非发酵菌：亚胺培南（嗜麦芽窄食单胞菌除外）
}



{1、耐甲氧西林的金黄色葡萄球菌
   WHILE 菌种=金黄色葡萄球菌
   DO   判断其是否为耐甲氧西林的金黄色葡萄球菌
   BEGIN
    （1） IF   青霉素（0101-03） 耐药  AND  苯唑西林（0102-03） 耐药 AND （红霉素1201-03、克林
               霉素1602-03、庆大霉素1101-03中的任意2种耐药）
          THEN 判断其为耐甲氧西林的金黄色葡萄球菌
    （2） IF   青霉素（0101-03） 耐药  AND  苯唑西林（0102-03）耐药 AND 头孢唑林（0201-03）耐药
          THEN 判断其为耐甲氧西林的金黄色葡萄球菌
   END
}
function zExpert.fastptqj1:boolean;
var
  cnt:integer;
begin
   cnt:=0;
   if (jzname='金黄色葡萄球菌') then
   if (*isYpFast('青霉素') and *)isYpFast('头孢西丁')(* and isYpFast('头孢唑林') and
        isYpFast('庆大霉素')*) then
   begin
        result:=true;
        exit;
   end;
    {
    if isYpFast('青霉素') and isYpFast('苯唑西林') then
    begin
        if isYpFast('红霉素') then
          inc(cnt);
        if isYpFast('克林霉素') then
          inc(cnt);
        if isYpFast('庆大霉素') then
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
2、耐甲氧西林的凝固酶阴性葡萄球菌
    WHILE 菌种≠金黄色葡萄球菌  AND  科别=葡萄球菌
    DO    判断其是否为耐甲氧西林的凝固酶阴性葡萄球菌
      BEGIN
      （1） IF   青霉素（0101-03） 耐药  AND  苯唑西林（0102-03） 耐药 AND （红霉素1201-03、克林
                 霉素1602-03、庆大霉素1101-03中的任意2种耐药）
            THEN 判断其为耐甲氧西林的金黄色葡萄球菌
      （2） IF   青霉素（0101-03） 耐药  AND  苯唑西林（0102-03）耐药 AND 头孢唑林（0201-03）耐药
            THEN 判断其为耐甲氧西林的凝固酶阴性葡萄球菌
      END
}
function zExpert.fastPtqj2:boolean;
begin
  if (jzname<>'金黄色葡萄球菌') then
  if (jzname<>'里昂葡萄球菌')and (jzname<>'路登葡萄球菌') then
  begin
      if (*isYpFast('青霉素') and *)isYpFast('苯唑西林')(* and isYpFast('头孢唑林') and isYpFast('庆大霉素')*)
          then
      begin
          result:=true;
          exit;
      end;
  end
  else if isYpFast('头孢西丁') then
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
        if (fieldvalues['mg']='耐药') or (fieldvalues['mg']='阳性') then
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
          sql.add('select * from yp where mg=''耐药''');
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
            msg:=jzname+'对以下药品：'+#13#10;
            for i:=0 to length(YpmcArray)-1 do
            begin
                msg:=msg+YpmcArray[i]+#13#10
            end;
            msg:=msg+'通常呈现敏感，建议对此结果进行复核。是否修改结果？' ;
            if messagedlg(msg,mtconfirmation,[mbyes,mbno],1)=mryes then
            begin
                 dmym.conn.BeginTrans;
                 try
                    for i:=0 to length(YpmcArray)-1 do
                      dmym.conn.Execute('update yp set mg=''敏感'' where ypmc='''+YpmcArray[i]+'''');
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
          sql.add('select * from yp where mg=''敏感''');
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
            msg:=jzname+'对以下药品：'+#13#10;
            for i:=0 to length(YpmcArray)-1 do
            begin
                msg:=msg+YpmcArray[i]+#13#10
            end;
            msg:=msg+'通常呈现耐药，建议对此结果进行复核。是否修改结果？' ;
            if messagedlg(msg,mtconfirmation,[mbyes,mbno],1)=mryes then
            begin
                 dmym.conn.BeginTrans;
                 try
                    for i:=0 to length(YpmcArray)-1 do
                      dmym.conn.Execute('update yp set mg=''耐药'' where ypmc='''+YpmcArray[i]+'''');
                    dmym.conn.CommitTrans;
                 except
                    dmym.conn.RollbackTrans;
                 end;
            end;
        end;
    end;
end;
{
 1 β-内酰胺类药物（01**-01 AND 02**-01 AND 03**-01 AND 04**-01 AND 07**-01）=耐药
 氨苄西林 头孢唑林 头孢噻吩 头孢拉啶  头孢呋辛  头孢哌酮  头孢噻肟  头孢他啶  氨曲南
}
procedure zExpert.modifyYpTable;
var
  i:integer;
const
 yplist:array[1..9] of string=('氨苄西林','头孢唑林','头孢噻吩','头孢拉啶','头孢呋辛',
    '头孢哌酮','头孢噻肟','头孢他啶','氨曲南');
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
                if fieldvalues['mg']<>'耐药' then
                 begin
                    edit;
                    fieldvalues['mg']:='耐药';
                 end;
            end;
          end;
      end;
end;
//AND 09**  AND 10** 哌拉西林/他唑巴坦 头孢哌酮/舒巴坦

procedure zExpert.modifyYpTable2 ;
var
  i:integer;
const
  yplist:array[1..15] of string=('氨苄西林','头孢唑林','头孢噻吩','头孢拉啶','头孢呋辛',
    '头孢哌酮','头孢噻肟','头孢他啶','氨曲南','哌拉西林/他唑巴坦','头孢曲松',
    '阿莫西林/克拉维酸','替卡西林/克拉维酸','氨苄西林/舒巴坦',
    '头孢哌酮/舒巴坦');
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
                if fieldvalues['mg']<>'耐药' then
                 begin
                    edit;
                    fieldvalues['mg']:='耐药';
                 end;
            end;
          end;
       end;
end;

{
1、判断头孢类药敏结果的优先级
     BEGIN
       CASE 1 
          IF    头孢一代（02**）=敏感
          THEN  所有头孢（03**、04**、05**、06**、07**、08**、10**）应该为敏感
          ELSE  报告单加注"NA"
          界面上应该给出不打印的文字提示"头孢一代药物敏感时，通常头孢二代、三代、四代也应该敏感，
          请复核该结果。"
       CASE 2
          IF    头孢一代（02**）=耐药  AND 头孢二代（03**）=敏感
          THEN  头孢三、四代（04**、05**、07**、08**、10**）应该为敏感
          ELSE  报告单加注"NA"
          界面上应该给出不打印的文字提示"头孢二代药物敏感时，通常三代、四代也应该敏感，请复核该结
}
procedure zExpert.tbUpdate;
var
  //slist:tstringlist;
  b:boolean;
  msg:string;
const
  yplist2:array[1..5] of string=('头孢哌酮','头孢噻肟','头孢他啶','氨曲南','头孢哌酮/舒巴坦');//头孢3,4代
  yplist:array[1..8] of string=('头孢唑林','头孢噻吩','头孢拉啶','头孢呋辛',
    '头孢哌酮','头孢噻肟','头孢他啶','头孢哌酮/舒巴坦');
begin
  b:=false;
  msg:='';

  if istbdfast(1,'敏感') then
    b:=updateTb(yplist);
  if b then
  begin
    msg:='头孢一代药物敏感时，通常头孢二代、三代、四代也应该敏感，'+#13#10'请复核该结果。';

    MessageDlg(msg,mtInformation,[mbok],0);
  end;

  if istbdfast(1,'耐药') and istbdfast(2,'敏感') then
    b:=updateTb(yplist2);
  if b then
  begin
       msg:='头孢二代药物敏感时，通常三代、四代也应该敏感，'+#13#10'请复核该结果。';
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
       if (pos('头孢',fieldvalues['ypmc'])>0) and (fieldvalues['mg']=mgstr) then
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
                if fieldvalues['mg']<>'敏感' then
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
    Ctlist:Array[0..4]of string=('醋酸钙不动杆菌','鲍曼不动杆菌','溶血不动杆菌','洛菲不动杆菌','嗜麦芽窄食单胞菌');
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
        sql.Add('select * from yp where ypmc=''亚胺培南''');
        open;

        if recordcount<>0 then
         CheckMg:=fieldvalues['mg'];

        close;
        sql.Clear;
        sql.Add('select * from yp where ypmc=''帕尼培南''');
        open;
        if recordcount<>0 then
        if checkmg<>'' then
        if fieldvalues['mg']<>CheckMg then
        begin
            if messagedlg('因为亚胺培南为'+CheckMg+'，所以建议将帕尼培南的药敏'+#13#10
               +'结果修改为'+CheckMg+'，是否修改？',mtconfirmation,[mbyes,mbno],0)=mryes then
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
  if (jzname = '铜绿假单胞菌') then
  begin
    tsny:= TsnyType('铜绿假单胞菌');
    if (tsny = 1) then
    if messagedlg('该菌株为多重耐药铜绿假单胞菌!',mtconfirmation,[mbyes,mbno],0)=mryes then
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
    if messagedlg('该菌株为高耐药铜绿假单胞菌!',mtconfirmation,[mbyes,mbno],0)=mryes then
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
    if messagedlg('该菌株为泛耐药铜绿假单胞菌!',mtconfirmation,[mbyes,mbno],0)=mryes then
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
  if (jzname = '鲍曼不动杆菌') then
    if (js = '01') then
      tsny:= TsnyType('不动杆菌肠杆菌')
    else if (js = '02') then
      tsny:= TsnyType('不动杆菌非发酵菌')
  else
    exit;

    if (tsny = 1) then
    if messagedlg('该菌株为多重耐药鲍曼不动杆菌!',mtconfirmation,[mbyes,mbno],0)=mryes then
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
    if messagedlg('该菌株为高耐药鲍曼不动杆菌!',mtconfirmation,[mbyes,mbno],0)=mryes then
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
    if messagedlg('该菌株为泛耐药鲍曼不动杆菌!',mtconfirmation,[mbyes,mbno],0)=mryes then
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
    Bdgjlist:Array[0..2]of string=('醋酸钙不动杆菌','溶血不动杆菌','洛菲不动杆菌');
var tsny:integer;
begin
  if (jzname = '嗜麦芽窄食单胞菌') then
    exit;

  if ((js = '01') and strInArray(jzname,Bdgjlist) ) then
       tsny:= TsnyType('不动杆菌肠杆菌')
  else if (js = '01') then
       tsny:= TsnyType('肠杆菌')
  else if ((js = '02') and strInArray(jzname,Bdgjlist)) then
       tsny:= TsnyType('不动杆菌非发酵菌')
  else if (js = '03') then
       tsny:= TsnyType('葡萄球菌')
  else if (js = '04') then
       tsny:= TsnyType('肠球菌')
  else if (js = '12') then
       tsny:= TsnyType('肠球菌a')
  else
    exit;

    if (tsny = 1) then
    if messagedlg('该菌株为多重耐药菌株!',mtconfirmation,[mbyes,mbno],0)=mryes then
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
    if messagedlg('该菌株为高耐药菌株!',mtconfirmation,[mbyes,mbno],0)=mryes then
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
    if messagedlg('该菌株为泛耐药菌株!',mtconfirmation,[mbyes,mbno],0)=mryes then
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


