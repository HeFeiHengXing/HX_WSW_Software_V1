unit common;

interface
uses
//dialogs---messageDlg
//graphics---tcolor
//inifiles---tinifile
//fileexists--sysutils
//timage----extctrls

  graphics,inifiles,sysutils,extctrls,dialogs,variants,windows,controls,dateutils;
  type
      TcomcColor=function(strjz:string;i,r,g,b:integer):integer;  stdcall;
      EDllLoadError=class(Exception);
      TGetImageFromDriver=function(hwnd:Longint; filepath:String; left,top,width,height: double; res,imagetype,origtype: longint):Integer;  stdcall;
      binCarray=array of array of tcolor;
      binBarray=array of array of boolean;
  var
   inifile:tinifile;
   ymResults:array [1..3,1..24] of boolean;
   ymColors:array[1..3,1..24] of tcolor;
   hospitalName:string;
   rvfile:string;
   ScanCount:integer;//��ʼ���loadBmpFromScanner��ɨ�����
   ReportRemarkNumber:integer;//���浥��ע˵���е���Ŀ��
  const
      OFFSET =1;
      MAX_PREHOLE=15;
      MAX_GENERATE_COUNT=999999;
 procedure getRGB(icolor:integer;var ir,ig,ib:integer);
 function calcColor(x,y:integer;img:tImage;Aparam:string):tcolor;
 function bool2Str(b:boolean):string;
 function bcstr(str1:string):string;
 function nastr(b1:boolean):string;
 function calaverage(intarr:array of integer;Aparam:string):integer;//������������COUNT������ƽ��ֵ
 //function getHospitalName:string;
 {var
  generate_count:integer;
  originJs,js:string;
  locx:array[1..12] of integer;
  locy:array[1..12] of integer;
  ymColor:array[1..3,1..24] of integer; //��6�У���Ϊҩ����Ӧ��ɫ
  bioColor:array[1..30] of tcolor;//ǰ���У���Ϊ������Ӧ��ɫ,��6����������
  //ÿ�־��������15��������Ӧ,��������.��Щ��Ӧ��ҩ���Ӧ.
  //����,��Щҩ���ڰ��ϵĿ�Ҳ�ǹ̶���,holeCode������ĳ��ҩ���ڰ��ϵĿ׺�.
  holeCode:array[1..15] of integer;
  inifile:tinifile;//ini�ļ���·��
  image1:timage;//ͼ���ļ���Ϊȫ�����ԡ�
  uid:integer;//�û���ţ���Ϊȫ������
  ofchecked :boolean;//�Ƿ�ѡ��oF;
  ofcolor:array[1..3] of tcolor;
  ofIsPositive:boolean;
  germIsPositive:array[1..30] of boolean;//ÿ�־�����Ӧ30��ҩƷ��Ӧ,�Ƿ�����.
  bioIsPositive:array [1..24] of boolean;//ÿ�־�����Ӧ��������Ӧ,24+6
  drugSensitive:array [1..3,1..24] of boolean;//��ҩ�̶�,������,��ҩ/����/����

 const
  OFFSET =2;
  SAMPLEPOINTS=9;
  MAX_PREHOLE=15;
  MAX_GENERATE_COUNT=999999;


 procedure FirstCheck(fscan:boolean;board:integer;parent:twincontrol);
 procedure FirstAnalyze;
 procedure getColorsFromImage(boardtype:integer);
 procedure getColorsFromBig;


 function checkRule1:string;
 function checkRule12:string;
 function checkRuleEx1:string;
 procedure bioCheckResults;
 procedure reverseBit(nbit:integer;number:integer);
 function bResultAsString(arr:array of boolean):string;
 function EncodeYm(b1,b2,b3:boolean):integer;
 procedure loadBmpFromScanner(board:integer;dllpath:string;myhwnd:HWND);
 procedure loadBmpFromDisk(parent:twincontrol);
 procedure checkOf;
 function getUniqueInt:string;
 }
implementation

uses dbym;
function bcstr(str1:string):string;
var
  s:string;
  count:integer;
begin
  count:=0;
  s:='';
  if pos('ESBL',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'����ESBL(�����צ�-������ø)�ķ��׿��ײ��Ͼ�:����ù�غ�һ����������ͷ�߾����Լ�����������'+#13#10+'��������ҩ������ͷù�ء�̼��ùϩø��ø���Ƽ��࿹�������С�';
     inc(count);
  end;
  if pos('���յ�ø',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'�����յ�ø(�յ��Ͳ���-������ø)�ľ���,�ٴ��϶���ù���ࡢͷ��һ����ͷ�߶�����ͷ������'+#13#10+'�Լ�����-�������࿹�Ŀ�����������Ч,��ʹ���ⲿ��ҩ�����С�';
     inc(count);
  end;
  if pos('MRSA',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'���ͼ������ֵĽ��ɫ�������(MRSA)ͨ�������еĦ�-�������࿹����(���������Ƽ�)'+#13#10+'�ٴ�������Ч,��ʹ���ⲿ��ҩ�����С�';
     inc(count);
  end;
  if pos('MRSCN',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'���ͼ������ֵ�����ø���Ե��������(MRSCN)ͨ�������еĦ�-�������࿹����(���������Ƽ�)'+#13#10+'�ٴ�������Ч,��ʹҩ�����С�';
     inc(count);
  end;
  if pos('HLAR',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'��HLAR(�͸�ˮƽ����������)�ľ���,�ٴ��϶԰�������������ù����������ҩ������Ч,'+#13#10+'��ʹ���ⲿ��ҩ�����С�';
     inc(count);
  end;
  if pos('��̼��ùϩø',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'����̼��ùϩø��������е�̼��ùϩ��ҩ��������Ч����ʹ���ⲿ��ҩ�����С�';
     inc(count);
  end;
  if pos('�յ�����ù',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'��ͨ���յ�����ù����ҩ���飬�Ʋ�˾���Կ���ù����ҩ������ù�ض�ĳЩ������Ȼ��Ч��';
     inc(count);
  end;
  if pos('PRSP',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'��(PRSP)����ù�ط���������ꡣ';
     inc(count);
  end;
  if pos('CRE',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'��(CRE)��̼��ùϩ�࿹��ҩ�ﳦ�˾���ϸ����';
     inc(count);
  end;
   if pos('VRS',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'��(VRS)�����ù�ص������������';
     inc(count);
  end;
  if pos('CR-PA',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'��(CR-PA)��̼��ùϩ��ͭ�̼ٵ�������';
     inc(count);
  end;
  if pos('CR-AB',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'��(CR-AB)��̼��ùϩ�ı��������˾���';
     inc(count);
  end;
  if pos('MDR-PA',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'��(MDR-PA)������ҩͭ�̼ٵ�������';
     inc(count);
  end
  else if pos('MDR-AB',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'��(MDR-AB)������ҩ���������˾���';
     inc(count);
  end
  else if pos('MDR',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'��(MDR)������ҩ���ꡣ';
     inc(count);
  end;


  if pos('XDR-PA',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'��(XDR-PA)����ҩͭ�̼ٵ�������';
     inc(count);
  end
  else if pos('XDR-AB',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'��(XDR-AB)����ҩ���������˾���';
     inc(count);
  end
  else if pos('XDR',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'��(XDR)����ҩ���ꡣ';
     inc(count);
  end;

  if pos('PDR-PA',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'��(PDR-PA)����ҩͭ�̼ٵ�������';
     inc(count);
  end
  else   if pos('PDR-AB',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'��(PDR-AB)����ҩ���������˾���';
     inc(count);
  end
  else if pos('PDR',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'��(PDR)����ҩ���ꡣ';
     inc(count);
  end;



  if pos('VRE',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'�������ù�س�����ꡣ';
     inc(count);
  end;
  if (str1='������') or (str1='����ҩ��') or (str1='����ҩ��') or (str1='�Ͷ�ҩ��') or (str1='�㷺��ҩ��') then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'���þ���Ϊ'+str1;
     inc(count);
  end;
  result:=s;
end;

function nastr(b1:boolean):string;
var
  s:string;
  i:integer;
  bNa:boolean;
begin
  //�����������ҩ����,b1Ϊtrue
  if b1 then
     i:=6
  else
     i:=5;
  //�ж��Ƿ����na
  bNa:=false;
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.Add('select * from yp');
    open;

    while not eof do
    begin
      if fieldvalues['bz']='NA' then
      begin
        bNa:=true;
        break;
      end;
      next;
    end;
  end;
  if bNa then
  begin
  s:='';//inttostr(i)+'��NA��Not accepted��:��ҩ��ҩ��������ɿ���Ӧ���ظ��������ϸ������ѯ��';
  end else
  s:='';
  result:=s;
end;
//��16����������ɫֵ�зֱ����r��g��b��ֵ
procedure getRGB(icolor:integer;var ir,ig,ib:integer);
begin
    ib:=icolor  shr 16;
    ig:=(icolor shr 8) - (ib shl 8);
    ir:=icolor-(ib shl 16)-(ig shl 8);
end;
function bool2Str(b:boolean):string;
begin
   if b then
      result:=inttostr(1)
   else
      result:=inttostr(0);
      
end;
function calcColor(x,y:integer;img:tImage;Aparam:string):tcolor;
var
  offx,offy:integer;//x,y��ƫ����
  i,j,k:integer;
  curColor:array[0..24] of integer;
begin
  k:=0;
  for i:=-2 to 2 do
  for j:=-2 to 2 do
  begin
      offx:=i*OFFSET;
      offy:=j*oFFSET;
      if Aparam='bio' then
        curColor[k]:=img.canvas.pixels[x+offx,y+offy];
      if Aparam='drug' then //ҩ��ֻȡ��ɫֵ���м���
        curColor[k]:=getBvalue(img.canvas.pixels[x+offx,y+offy]);
      inc(k);
  end;
  result:=calaverage(curcolor,Aparam);
end;

function calaverage(intarr:array of integer;Aparam:string):integer;
function rank(var arr:array of integer):integer; //ð�ݷ�����С��������************
var i,j,k:integer;
begin
    for i:=0 to length(arr)-2 do
    for j:=1 to length(arr)-1-i do
    begin
        if arr[j-1]>arr[j] then
        begin
          k:=arr[j];
          arr[j]:=arr[j-1];
          arr[j-1]:=k;
        end;
    end;
end;
var  i,j,count:integer;
     sum:integer;
     Rarr,Garr,Barr:array of integer; //RGB��������
     Ravg,Gavg,Bavg:integer;//RGB�������
begin
    {��ȡ�㣺ҩ��ȥ�����10���㣬���5����ȡƽ���������ȷֽ��RGB�󣬷ֱ��R/G/B
    ȥ���5���㣬���10����ȥƽ�����ٺϳɡ�
    ҩ��ΪC\D\E\F\G\H�������Ҳ����У�������ΪA\B��ͼ��������У�}
    sum:=0;
    if Aparam='bio' then
    begin
        setlength(Rarr,length(intarr));
        setlength(Garr,length(intarr));
        setlength(Barr,length(intarr));
        for i:=0 to length(intarr)-1 do
        begin
            Rarr[i]:=GetRvalue(intarr[i]);
            Garr[i]:=GetGvalue(intarr[i]);
            Barr[i]:=GetBvalue(intarr[i]);
        end;
        rank(Rarr);
        rank(Garr);
        rank(Barr);
        sum:=0;
        for i:=10 to 19 do
          sum:=sum+Rarr[i];
        Ravg:=trunc(sum div 10);

        sum:=0;
        for i:=10 to 19 do
          sum:=sum+Garr[i];
        Gavg:=trunc(sum div 10);

        sum:=0;
        for i:=10 to 19 do
          sum:=sum+Barr[i];
        Bavg:=trunc(sum div 10);

        result:=RGB(Ravg,Gavg,Bavg);
    end;

    if Aparam='drug' then
    begin
        rank(intarr);
        for i:=5 to 14 do
          sum:=sum+intarr[i];
        result:=sum div 10;
    end;
end;

//uses ymDataType, dbym,Meds;
{
 //����ɨ�����������򣬶�ȡͼ�񣬻�ȡ���׵���ɫֵ
 //fileexists---sysutils  ,fscan:==�Ƿ񾭹�ɨ��
procedure FirstCheck(fscan:boolean;board:integer;parent:twincontrol);
var
   dllpath:string;
   med:zMed;
begin
   //�������ļ��ж�ȡɨ������������·��
   inifile:=tinifile.Create(getcurrentdir+'\ym.ini');
   dllpath:=inifile.readString('dll','driver','0');
   if fileexists(dllpath) then
   begin
   //���ݰ������ͣ��ֱ����ɨ����򣬶���ͼ��
      if  fscan=true then //���������ɨ��,�ȴ��ֹ�����
         loadBmpFromScanner(board,dllpath,parent.Handle) ;
      loadBmpFromDisk(parent);
   //��ͼ���ж�ȡ����ɫֵ
      getColorsFromImage(board);
   //������ɫ�����������Ӧ
      bioCheckResults;
   //���of
      checkOf;
   //����ҩ������
     { med:=zMed.create(uid);
      med.updateFy();
      }

   //end else
   //   MessageDlg('����������ã�ȷ��ɨ�������������·����ȷ!',mtInformation,[mbOK],0);

   {
end;
//��ɨ��ͼƬ��ȡ�ø��׵ķ�Ӧ��ɫֵ������ȫ������ymcolor�С�
procedure getColorsFromImage(boardtype:integer);
begin
   if boardtype=1 then
      getColorsFromBig;
  { else
      getColorsFromSmall;

end;
 }
//ini�ļ���·����Ϊȫ������
{
 �������ȫ�ֱ������飺
 biocolor
 ymcolor
 ofcolor

procedure getColorsFromBig;
var
   i,j,k:integer;
begin
   //��ȡbigline�ֶ� ,��ע�뵽locx,locy������ ,top--y���꣬left--x����
   with inifile do
   begin
      for i:=1 to length(locx) do
         locx[i]:=readInteger('bigline','left'+inttostr(i+12),0);
      for i:=1 to length(locy) do
         locy[i]:=readInteger('bigline','top'+inttostr(i),0);
   end;
   //��1��2�У���Ϊ������Ӧ��ɫ������bioColor����
   for i:=1 to 2 do
    for j:=1 to 12 do
      bioColor[j+(i-1)*12]:=calcColor(locx[i],locy[j],image1);

   // ��һ��ҩ����Ӧ����3�е���5��,ֻҪ��ɫֵ����ŵ�ymcolor��ǰ12�С�
   for  i:=3 to 5 do
    for j:=1 to 12 do
     ymColor[i-2,j]:=calcColor(locx[i],locy[j],image1) shr 16;
   // �ڶ���ҩ����Ӧ����6�е���8��,ֻҪ��ɫֵ����ŵ�ymcolor�ĺ�12��
   for  i:=6 to 8 do
    for j:=1 to 12 do
     ymColor[i-5,j+12]:=calcColor(locx[i],locy[j],image1) shr 16;
   //o-f ������ɫ����
   if js='01' then   //���˾�O-F����Ԥ�������
    ofchecked:=true;
   ofcolor[1]:=calccolor(locx[6],locy[12],image1);
   ofcolor[2]:=calccolor(locx[7],locy[12],image1);
   ofColor[3]:=calccolor(locx[8],locy[12],image1);
end;
//��ȡͼƬimg���ض���(x,y)����ɫ����Ϊ16��������ֵ����
function calcColor(x,y:integer;img:tImage):tcolor;
var
  sumr,sumg,sumb:integer ;
  ir,ig,ib:integer;
  maxr,maxg,maxb:integer;
  minr,ming,minb:integer;
  offx,offy:integer;//x,y��ƫ����
  i,j:integer;
  curColor:integer;
begin
  sumr:=0; sumg:=0;  sumb:=0;
  maxr:=0; maxg:=0;  maxb:=0;
  minr:=255; ming:=255;  minb:=255;

  //��ʼ����ɫ��ֵ

  //��9�������ɫ��r��g��b�ĺͣ��Լ����ֵ����Сֵ
  //timage---extctrls;
  for i:=-1 to 1 do
    for j:=-1 to 1 do
    begin
        offx:=i*OFFSET;
        offy:=j*oFFSET;
        //get r,g,b for (x+offx,y+offy)
        curColor:=img.canvas.pixels[x+offx,y+offy];
        getRGB(curColor,ir,ig,ib);
        //sum
        sumr:=sumr+ir;
        sumg:=sumg+ig;
        sumb:=sumb+ib;
        //max & min
        if maxr<ir then
          maxr:=ir;
        if maxg<ig then
          maxg:=ig;
        if maxb<ib then
          maxb:=ib;
        if ir<minr then
          minr:=ir;
        if ig<ming then
          ming:=ig;
        if ib<minb then
          minb:=ib;
    end;
    //ȥ��������Сֵ��������ƽ��ֵ
    sumr:=round((sumr-maxr-minr)/(SAMPLEPOINTS-2));
    sumg:=round((sumg-maxg-ming)/(SAMPLEPOINTS-2));
    sumb:=round((sumb-maxb-minb)/(SAMPLEPOINTS-2));
    //��ϳ���ɫ
    result:=(sumb shl 16)+(sumg shl 8)+ sumr;
end;

//��16����������ɫֵ�зֱ����r��g��b��ֵ
procedure getRGB(icolor:integer;var ir,ig,ib:integer);
begin
    ib:=icolor  shr 16;
    ig:=(icolor shr 8) - (ib shl 8);
    ir:=icolor-(ib shl 16)-(ig shl 8);
end;
//��һ�����
//ofChecked;����Ҫ��germtype�򽻵�.�ñ���dblookupCombobox
//��base���[originjs]���Լ���[germindex]����.
//
procedure FirstAnalyze;
begin
   //1--����������Լ�飺chkcqjlqj

   //2
end;

//������Ϊ01ʱ,���������Ӧ���Ի�������,�ó�һ�������Ľ���; �����ؽ���ַ���
function checkRule1:string;
var
  ir:integer;
begin
  ir:=0;
  //��10������Ԫ��Ϊ����,����ir�ĵ�10λΪ1
  if germIsPositive[10] then
    ir:=ir or (1 shl 9);
  if germIsPositive[14] then
    ir:=ir or (1 shl 13);
  if germIsPositive[22] then
    ir:=ir or (1 shl 21);
  if germIsPositive[29] then
    ir:=ir or (1 shl 28 );
  if germIsPositive[30] then
    ir:=ir or (1 shl 29);
  //0001,0000,0010,0000,0010,0000,0000,0000
  case ir of
    0:
      result:='��Ʋ����˾�';
    $10000000:
      result:='��Ѫ�����˾�';
    $20000200:
      result:='���������˾�';
    $00000200:
      result:='����Ʋ����˾�';
    $00202000,$00202200,$10202200,$10202000,$00002000,
      $00002200,$10002200,$10002000:
      result:='����ѿ��Դ������';
    else
      result:='���ַ��벻������ּ��������';
  end;

end;

function checkRule12:string;
begin
  if (germIsPositive[21]=false) or (germIsPositive[22]=false) then
    result:='������������';
end;
//ԭ����checkcqj
//����������Ӧ���������Խ��,�ж�һ�������Ľ��
//Ӧ�ý����ֺͱ����γ�һ���±�.
function checkRuleEx1:string;
var
  ir:integer;
begin
  if originjs<> '01' then
    result:='';
  if bioIsPositive[15]=false then
    result:='A';//ԭ��������
   ir:=0;
  //��10������Ԫ��Ϊ����,����ir�ĵ�10λΪ1
  if bioIsPositive[1] then
    ir:=ir or (1 shl 0);
  if bioIsPositive[2] then
    ir:=ir or (1 shl 1);
  if bioIsPositive[13] then
    ir:=ir or (1 shl 12);
  if bioIsPositive[16] then
    ir:=ir or (1 shl 15 );
  if bioIsPositive[19] then
    ir:=ir or (1 shl 18);
  if germIsPositive[20] then
    ir:=ir or (1 shl 19);
  case ir of
    $00008000,$00088000:
      result:='����θ˾�';
    $00001000:
      result:='���������Ǿ�';
    //
    $00088101,$00008101:
      result:='Ħ��Ħ����';
    $00048100:
      result:='���������Ǿ�';
    $000c8100:
      result:='˹�������Ǿ�';
    $00041000:
      result:='�����������Ǿ�';
    $00089000,$00009000:
      result:='��ͨ���θ˾�';
    // 100111,100110,100101,100100:
    $000c8001,$00048001,$00088001, $00008001:
      result:='������θ˾�';
    else
      result:='F';  //δ�����ķ�Ӧ,�����쳣��Ӧ.û�кܺõĶ���
  end;

end;

//��ȡ��������Ļ�ѧ����  ,��board���ж�ȡb25-b30���ֶ��� ;
//@len---��Ҫ��ȡ���ֶεĳ���.
//@drugs---���ҩƷ�����ַ�������
procedure getSecondaryDrugs(js1:string; drugs:array of string;len:integer);
var
  i:integer;
  finum:integer;
begin
   //setLength(drugs,6);
   with dmym.query1 do
   begin
       close;
       sql.clear;
       //Ϊ���Ч��,�ɸĳ�selct * from b25,...,���ǲ����ڽ�����չ
       sql.add('select * from  board where js=:js1 and btype=2');
       parameters.parambyName('js1').value:=js1;
       open;
       //��ȡb1�ֶε����Ա��
       finum:=fieldbyname('b1').FieldNo;
       for i:=0 to len-1 do
       begin
        if VarIsNull(fields[i+finum].asvariant) then
          continue;
        drugs[i]:=fields[i+finum].AsString;
       end;
   end;
end;

//��ȡ�׺�,����holecode����
procedure getHoleCode(js1:string);
var
  i:integer;
  fiNum:integer;
begin
  // ��ʼ��holeCode����,��Ϊ�������еľ��ֶ���15�ַ�Ӧ.
  for i:=1 to length(holeCode) do
    holeCode[i]:=0;
  //��board���ж�ȡ���
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('select * from board where js=:js1');
    parameters.paramByName('js1').value:=js1;
    open;

    finum:=fieldbyname('b1').FieldNo;
    for i:=0 to MAX_PREHOLE-1 do
    begin
      holeCode[i+1]:=fields[i+finum].asInteger;
    end;
  end;

end;
//������Ӧ�����,����bioIsPositive
procedure bioCheckResults;
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

    path:=inifile.ReadString('dll','check','0');

    LibHandle:=loadlibrary(pchar(path));
    try
      if LibHandle=0 then
        raise EdllLoadError.create('�޷������Ӧ�Ķ�̬���ļ�');
      @comccolor:=getprocaddress(libhandle,'comccolor');
      if not (@comccolor=nil) then
      begin
        for i:=1 to length(bioIsPositive) do  //����������Ӧֵ
          begin
            r:=0;
            g:=0;
            b:=0;
            getRGB(bioColor[i],r,g,b);
            chk:=comccolor(js,i,r,g,b);
            if chk=1 then
              bioIsPositive[i]:=true;
          end;
      end
    else
      raiseLastWin32Error;
  finally
    freeLibrary(LibHandle);  //ж��dll
  end;
end;
//����������Ӧ�ı���,��Ҫ����λ��,�������������ַ�Ӧ��Ӧһ������,Ҳ
//������һ�ַ�Ӧ��Ӧһ������ ,����һ���ַ�����ʽ�ı���
//��Ҫ��ȡ����getHoleCode
function calcReactionCode(bios:array of boolean):string;
var
 i,ir:integer;
 validReaction:array[1..MAX_PREHOLE] of boolean; //��Ӧ��׵�ʵ�ʱ��,����,��1��Ԫ�ؾͶ�Ӧ��һ����,δ���ǵ�һ��ҩƷ

begin
   //�Ƚ�24����Ӧ����Ч��Ӧ���,���洢��validReaction������
  //��ʼ��validReaction
  for i:=1 to MAX_PREHOLE do
    validReaction[i]:=false;
  for i:=1 to MAX_PREHOLE do
    if bios[i] then
      validReaction[holeCode[i]]:=true;
  //��15�ַ�Ӧ����������.ԭ�����������������.
  ir:=0;
  for i:=1 to MAX_PREHOLE do
  begin
     if validReaction[i] then
       ir:=ir or (1 shl i-1);
  end;
  result:=inttohex(ir,1);

end;
}
{
 ԭchangeError
�ҵ���������Ϊƥ��ı���, ����delphi�Ĺ涨,����newCodes����Ԥ�����úô�С.
@nbits----�����޸ĵ�λ���λ��
@oldcode---�ϵķ�Ӧ����
@newCodes---�����޸ĺ��һ���µķ�Ӧ����
�㷨: (ʹ���������)
 1 init the bit-block =$oldCode;
 2 set the bit-block =not $oldCode
 3 let i move from 1 to (Maxlen-nbits)
      set tempint:= $00000001 ,--nbits=1;
                  = $00000011,---nbits=2;

      window_width:=nbits
      window_pos:=i;
      window_int:=bitBlock and (tempint<< i);
 4 replace the bits of oldCode with window_int at the current pos
      set zeroint:=$11111110--nbits=1
                   $11111100--nbits=2;
      newCode:=oldCode & (zeroint<<i)
 �ҵ��ı���洢��glzz����
@first version--10/20/2007
                author:lz

procedure FindApproximateNumber(nbits,oldCode:integer;newCodes:array of integer);
var
  i,j:integer;
begin
   //1---init newCodes
   for i:=1 to length(newCodes) do
      newCodes[i]:=0;
   for i:=1 to MAX_PREHOLE-nbits+1 do
   begin
     newCodes[i]:=oldCode;
     for j:=i to nbits+i-1 do
     begin
        reverseBit(j,newCodes[i]);
     end;
   end;
end;
//ȡ��number�ĵ�nbitλ ,��1Ϊ���ֽ���ʼλ.
procedure reverseBit(nbit:integer;number:integer);
var
  i,j:integer;
begin
  i:=1;
  j:=0;
  //�����λΪ1
  if (number and (i shl (nbit-1)) )=(i shl (nbit-1)) then
    number:=number and (not(i shl (nbit-1)))
  else
    number:=number or (i shl (nbit-1));
end;

 ԭcheckError
 ��FindApproximateNumber֮��,��������Ʊ���ĸ���
 ��Ҫ�����ض����ֵĸ��ʱ�,���յĽ���洢��glApprox����

}
{
procedure calcProbability(tblName:string);
begin
    //���glzz���Ƿ�Ϊ��

end;

function bResultAsString(arr:array of boolean):string;
var
  i:integer;
  s:string;
begin
  for i:=1 to length(arr) do
  begin
    if arr[i] then
      s:=s+'1'
    else
      s:=s+'0';
  end;
  result:=s;
end;
//����ҩ���������ν��б���
function EncodeYm(b1,b2,b3:boolean):integer;
var i:integer;
begin
  i:=0;
  if b1 then
    i:=i or (1 shl 2);
  if b2 then
    i:=i or (1 shl 1);;
  if b3 then
    i:=i or 1;
  result:=i;
end;

procedure loadBmpfromScanner(board:integer;dllpath:string;myhwnd:HWND);
var
  bmppath,bstr:string ;
  left,top,width,height:double;
  VALUE:integer;
  lpFarProc:FARPROC;
//added-end
  i:integer;
    LibHandle:Thandle;
    GetImageFromDriver:TGetImageFromDriver ;
begin
  if board=0 then
    bstr:='bigscan'
  else
    bstr:='smallscan';
  bmppath:=inifile.ReadString('bmp','scan','0');
  with  inifile do
    begin
      left:=strtofloat(ReadString(bstr, 'left', '0'));
      top:=strtofloat(ReadString(bstr, 'top', '0'));
      width:=strtofloat(ReadString(bstr, 'width', '4.3'));
      height:=strtofloat(ReadString(bstr, 'height', '5.6'));
    end;
  libhandle:=loadlibrary(pchar(dllpath));
  lpFarProc:=getprocaddress(libhandle,'GetImageFromDriver');
  if not (lpFarProc=nil) then
      @GetImageFromDriver:=lpFarProc
  else
      exit;
  //changed----call getbmpfromini
  try
    bmppath:=inifile.readstring('bmp','scan','0');

    value:=GetImageFromDriver(myHWNd,bmppath,
              left, top, width, height, 100, 2,1);

  except

  end;
  freeLibrary(LibHandle);
end;

procedure loadBmpfromDisk(parent:twincontrol);
var
  bmppath:string;
begin
  bmppath:=inifile.readstring('bmp','scan','0');
  if bmppath='0' then
    begin
      MessageDlg('����ͼƬ�����ڣ�������ȷ���ã�',mtInformation,[mbOK],0);
      exit;
    end;
  image1:=timage.Create(parent);
  image1.picture.LoadFromFile(bmppath);
end;

procedure checkOf;
var
 i,r,g,b:integer;
begin
  r:=0;
  g:=0;
  b:=0;
  for i:=1 to 3 do
  begin
    getRGB(ofcolor[i],r,g,b);
    if (r>b) and ((g-b)>15) then
    begin
      if i=1 then
        ofIsPositive:=true;
       bioIsPositive[i+25]:=true;
    end;
  end;

end;
function getUniqueInt:string;
var
   str:string;
   at,t:tdatetime;
   d:integer;
begin
   //time
   //d:=dateofyear;
   randomize;
   d:=random(100);
   str:=inttostr(d);

   str:=str+inttostr(gettickcount());
   result:=str;
end;
 }
end.

