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
   ScanCount:integer;//开始检查loadBmpFromScanner的扫描次数
   ReportRemarkNumber:integer;//报告单备注说明中的项目数
  const
      OFFSET =1;
      MAX_PREHOLE=15;
      MAX_GENERATE_COUNT=999999;
 procedure getRGB(icolor:integer;var ir,ig,ib:integer);
 function calcColor(x,y:integer;img:tImage;Aparam:string):tcolor;
 function bool2Str(b:boolean):string;
 function bcstr(str1:string):string;
 function nastr(b1:boolean):string;
 function calaverage(intarr:array of integer;Aparam:string):integer;//计算数组最大的COUNT个数的平均值
 //function getHospitalName:string;
 {var
  generate_count:integer;
  originJs,js:string;
  locx:array[1..12] of integer;
  locy:array[1..12] of integer;
  ymColor:array[1..3,1..24] of integer; //后6列，作为药敏反应颜色
  bioColor:array[1..30] of tcolor;//前两列，作为生化反应颜色,加6个补充试验
  //每种菌种有最多15种生化反应,或阴或阳.这些反应与药物对应.
  //而且,这些药物在板上的孔也是固定的,holeCode储存着某种药物在板上的孔号.
  holeCode:array[1..15] of integer;
  inifile:tinifile;//ini文件的路径
  image1:timage;//图像文件作为全局属性。
  uid:integer;//用户编号，作为全局属性
  ofchecked :boolean;//是否选择oF;
  ofcolor:array[1..3] of tcolor;
  ofIsPositive:boolean;
  germIsPositive:array[1..30] of boolean;//每种菌属对应30种药品反应,是否阳性.
  bioIsPositive:array [1..24] of boolean;//每种菌属对应的生化反应,24+6
  drugSensitive:array [1..3,1..24] of boolean;//耐药程度,分三种,耐药/中敏/敏感

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
     s:=s+inttostr(count+ReportRemarkNumber)+'、产ESBL(超广谱β-内酰胺酶)的肺炎克雷伯氏菌:对青霉素和一、二、三代头孢菌素以及单环菌素类'+#13#10+'抗生素耐药，但对头霉素、碳青霉烯酶及酶抑制剂类抗生素敏感。';
     inc(count);
  end;
  if pos('产诱导酶',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、产诱导酶(诱导型产β-内酰胺酶)的菌株,临床上对青霉素类、头孢一代、头孢二代、头孢三代'+#13#10+'以及含β-内酰胺类抗的抗生素治疗无效,即使体外部分药物敏感。';
     inc(count);
  end;
  if pos('MRSA',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、耐甲氧西林的金黄色葡萄球菌(MRSA)通常对所有的β-内酰胺类抗生素(包括复合制剂)'+#13#10+'临床治疗无效,即使体外部分药物敏感。';
     inc(count);
  end;
  if pos('MRSCN',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、耐甲氧西林的凝固酶阴性的葡萄球菌(MRSCN)通常对所有的β-内酰胺类抗生素(包括复合制剂)'+#13#10+'临床治疗无效,即使药物敏感。';
     inc(count);
  end;
  if pos('HLAR',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、HLAR(耐高水平氨基糖苷类)的菌株,临床上对氨基糖苷类与青霉素类联合用药治疗无效,'+#13#10+'即使体外部分药物敏感。';
     inc(count);
  end;
  if pos('产碳青霉烯酶',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、产碳青霉烯酶菌株对所有的碳青霉烯类药物治疗无效，即使体外部分药物敏感。';
     inc(count);
  end;
  if pos('诱导克林霉',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、通过诱导克林霉素耐药试验，推测此菌株对克林霉素耐药，克林霉素对某些病人仍然有效。';
     inc(count);
  end;
  if pos('PRSP',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、(PRSP)耐青霉素肺炎链球菌株。';
     inc(count);
  end;
  if pos('CRE',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、(CRE)耐碳青霉烯类抗菌药物肠杆菌科细菌。';
     inc(count);
  end;
   if pos('VRS',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、(VRS)耐万古霉素的葡萄球菌菌。';
     inc(count);
  end;
  if pos('CR-PA',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、(CR-PA)耐碳青霉烯的铜绿假单胞菌。';
     inc(count);
  end;
  if pos('CR-AB',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、(CR-AB)耐碳青霉烯的鲍曼不动杆菌。';
     inc(count);
  end;
  if pos('MDR-PA',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、(MDR-PA)多重耐药铜绿假单胞菌。';
     inc(count);
  end
  else if pos('MDR-AB',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、(MDR-AB)多重耐药鲍曼不动杆菌。';
     inc(count);
  end
  else if pos('MDR',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、(MDR)多重耐药菌株。';
     inc(count);
  end;


  if pos('XDR-PA',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、(XDR-PA)高耐药铜绿假单胞菌。';
     inc(count);
  end
  else if pos('XDR-AB',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、(XDR-AB)高耐药鲍曼不动杆菌。';
     inc(count);
  end
  else if pos('XDR',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、(XDR)高耐药菌株。';
     inc(count);
  end;

  if pos('PDR-PA',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、(PDR-PA)泛耐药铜绿假单胞菌。';
     inc(count);
  end
  else   if pos('PDR-AB',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、(PDR-AB)泛耐药鲍曼不动杆菌。';
     inc(count);
  end
  else if pos('PDR',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、(PDR)泛耐药菌株。';
     inc(count);
  end;



  if pos('VRE',str1)>0 then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、耐万古霉素肠球菌株。';
     inc(count);
  end;
  if (str1='敏感株') or (str1='单耐药株') or (str1='多耐药株') or (str1='耐多药株') or (str1='广泛耐药株') then
  begin
     if count>0 then
        s:=s+#13#10;
     s:=s+inttostr(count+ReportRemarkNumber)+'、该菌株为'+str1;
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
  //如果有特殊耐药机制,b1为true
  if b1 then
     i:=6
  else
     i:=5;
  //判断是否存在na
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
  s:='';//inttostr(i)+'、NA（Not accepted）:该药物药敏结果不可靠，应该重复试验或向细菌室咨询。';
  end else
  s:='';
  result:=s;
end;
//从16进制整数颜色值中分别读出r，g，b的值
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
  offx,offy:integer;//x,y的偏移量
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
      if Aparam='drug' then //药敏只取蓝色值进行计算
        curColor[k]:=getBvalue(img.canvas.pixels[x+offx,y+offy]);
      inc(k);
  end;
  result:=calaverage(curcolor,Aparam);
end;

function calaverage(intarr:array of integer;Aparam:string):integer;
function rank(var arr:array of integer):integer; //冒泡法，从小到大排序************
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
     Rarr,Garr,Barr:array of integer; //RGB分量数组
     Ravg,Gavg,Bavg:integer;//RGB结果分量
begin
    {读取点：药敏去掉最高10个点，最低5个点取平均，生化先分解成RGB后，分别对R/G/B
    去最高5个点，最低10个点去平均，再合成。
    药敏为C\D\E\F\G\H（如下右侧六列），生化为A\B（图像左侧两列）}
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
 //调用扫描仪驱动程序，读取图像，获取各孔的颜色值
 //fileexists---sysutils  ,fscan:==是否经过扫描
procedure FirstCheck(fscan:boolean;board:integer;parent:twincontrol);
var
   dllpath:string;
   med:zMed;
begin
   //从配置文件中读取扫描仪驱动程序路径
   inifile:=tinifile.Create(getcurrentdir+'\ym.ini');
   dllpath:=inifile.readString('dll','driver','0');
   if fileexists(dllpath) then
   begin
   //根据板条类型，分别调用扫描程序，读入图像
      if  fscan=true then //如果不经过扫描,等待手工填入
         loadBmpFromScanner(board,dllpath,parent.Handle) ;
      loadBmpFromDisk(parent);
   //从图像中读取各颜色值
      getColorsFromImage(board);
   //计算颜色代表的生化反应
      bioCheckResults;
   //检查of
      checkOf;
   //进行药敏试验
     { med:=zMed.create(uid);
      med.updateFy();
      }

   //end else
   //   MessageDlg('请检查你的配置，确认扫描仪驱动程序的路径正确!',mtInformation,[mbOK],0);

   {
end;
//从扫描图片中取得各孔的反应颜色值，存入全局数组ymcolor中。
procedure getColorsFromImage(boardtype:integer);
begin
   if boardtype=1 then
      getColorsFromBig;
  { else
      getColorsFromSmall;

end;
 }
//ini文件的路径作为全局属性
{
 填充三个全局变量数组：
 biocolor
 ymcolor
 ofcolor

procedure getColorsFromBig;
var
   i,j,k:integer;
begin
   //获取bigline字段 ,并注入到locx,locy数组中 ,top--y坐标，left--x坐标
   with inifile do
   begin
      for i:=1 to length(locx) do
         locx[i]:=readInteger('bigline','left'+inttostr(i+12),0);
      for i:=1 to length(locy) do
         locy[i]:=readInteger('bigline','top'+inttostr(i),0);
   end;
   //第1－2列，作为生化反应颜色，存至bioColor数组
   for i:=1 to 2 do
    for j:=1 to 12 do
      bioColor[j+(i-1)*12]:=calcColor(locx[i],locy[j],image1);

   // 第一组药敏反应，第3列到第5列,只要蓝色值。存放到ymcolor的前12列。
   for  i:=3 to 5 do
    for j:=1 to 12 do
     ymColor[i-2,j]:=calcColor(locx[i],locy[j],image1) shr 16;
   // 第二组药敏反应，第6列到第8列,只要蓝色值。存放到ymcolor的后12列
   for  i:=6 to 8 do
    for j:=1 to 12 do
     ymColor[i-5,j+12]:=calcColor(locx[i],locy[j],image1) shr 16;
   //o-f 试验颜色计算
   if js='01' then   //肠杆菌O-F试验预标记阳性
    ofchecked:=true;
   ofcolor[1]:=calccolor(locx[6],locy[12],image1);
   ofcolor[2]:=calccolor(locx[7],locy[12],image1);
   ofColor[3]:=calccolor(locx[8],locy[12],image1);
end;
//读取图片img的特定点(x,y)的颜色，作为16进制整数值返回
function calcColor(x,y:integer;img:tImage):tcolor;
var
  sumr,sumg,sumb:integer ;
  ir,ig,ib:integer;
  maxr,maxg,maxb:integer;
  minr,ming,minb:integer;
  offx,offy:integer;//x,y的偏移量
  i,j:integer;
  curColor:integer;
begin
  sumr:=0; sumg:=0;  sumb:=0;
  maxr:=0; maxg:=0;  maxb:=0;
  minr:=255; ming:=255;  minb:=255;

  //初始的三色极值

  //求9个点的颜色的r，g，b的和，以及最大值和最小值
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
    //去掉最大和最小值，并求其平均值
    sumr:=round((sumr-maxr-minr)/(SAMPLEPOINTS-2));
    sumg:=round((sumg-maxg-ming)/(SAMPLEPOINTS-2));
    sumb:=round((sumb-maxb-minb)/(SAMPLEPOINTS-2));
    //组合成颜色
    result:=(sumb shl 16)+(sumg shl 8)+ sumr;
end;

//从16进制整数颜色值中分别读出r，g，b的值
procedure getRGB(icolor:integer;var ir,ig,ib:integer);
begin
    ib:=icolor  shr 16;
    ig:=(icolor shr 8) - (ib shl 8);
    ir:=icolor-(ib shl 16)-(ig shl 8);
end;
//第一遍分析
//ofChecked;这里要和germtype打交道.该表由dblookupCombobox
//与base表的[originjs]和自己的[germindex]关联.
//
procedure FirstAnalyze;
begin
   //1--肠球菌特异性检查：chkcqjlqj

   //2
end;

//当菌属为01时,检查生化反应阴性或者阳性,得出一个基本的结论; 并返回结果字符串
function checkRule1:string;
var
  ir:integer;
begin
  ir:=0;
  //第10个数组元素为阳性,则置ir的第10位为1
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
      result:='洛菲不动杆菌';
    $10000000:
      result:='溶血不动杆菌';
    $20000200:
      result:='鲍曼不动杆菌';
    $00000200:
      result:='醋酸钙不动杆菌';
    $00202000,$00202200,$10202200,$10202000,$00002000,
      $00002200,$10002200,$10002000:
      result:='嗜麦芽寡源单胞菌';
    else
      result:='菌种分离不纯或出现技术性误差';
  end;

end;

function checkRule12:string;
begin
  if (germIsPositive[21]=false) or (germIsPositive[22]=false) then
    result:='菌株生长不良';
end;
//原来的checkcqj
//根据生化反应的阴性阳性结果,判断一个基本的结果
//应该将菌种和编码形成一张新表.
function checkRuleEx1:string;
var
  ir:integer;
begin
  if originjs<> '01' then
    result:='';
  if bioIsPositive[15]=false then
    result:='A';//原不做处理
   ir:=0;
  //第10个数组元素为阳性,则置ir的第10位为1
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
      result:='彭变形杆菌';
    $00001000:
      result:='拉普罗威登菌';
    //
    $00088101,$00008101:
      result:='摩根摩根菌';
    $00048100:
      result:='雷普罗威登菌';
    $000c8100:
      result:='斯普罗威登菌';
    $00041000:
      result:='产碱普罗威登菌';
    $00089000,$00009000:
      result:='普通变形杆菌';
    // 100111,100110,100101,100100:
    $000c8001,$00048001,$00088001, $00008001:
      result:='奇异变形杆菌';
    else
      result:='F';  //未见过的反应,或者异常反应.没有很好的定义
  end;

end;

//读取补充试验的化学物名  ,从board表中读取b25-b30的字段名 ;
//@len---需要读取的字段的长度.
//@drugs---存放药品名的字符串数组
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
       //为提高效率,可改成selct * from b25,...,但是不便于将来扩展
       sql.add('select * from  board where js=:js1 and btype=2');
       parameters.parambyName('js1').value:=js1;
       open;
       //获取b1字段的属性编号
       finum:=fieldbyname('b1').FieldNo;
       for i:=0 to len-1 do
       begin
        if VarIsNull(fields[i+finum].asvariant) then
          continue;
        drugs[i]:=fields[i+finum].AsString;
       end;
   end;
end;

//读取孔号,存入holecode数组
procedure getHoleCode(js1:string);
var
  i:integer;
  fiNum:integer;
begin
  // 初始化holeCode数组,因为并非所有的菌种都有15种反应.
  for i:=1 to length(holeCode) do
    holeCode[i]:=0;
  //从board表中读取编号
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
//生化反应检查结果,填入bioIsPositive
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

  //试图调用生化反应 check.dll

    path:=inifile.ReadString('dll','check','0');

    LibHandle:=loadlibrary(pchar(path));
    try
      if LibHandle=0 then
        raise EdllLoadError.create('无法调入对应的动态库文件');
      @comccolor:=getprocaddress(libhandle,'comccolor');
      if not (@comccolor=nil) then
      begin
        for i:=1 to length(bioIsPositive) do  //计算生化反应值
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
    freeLibrary(LibHandle);  //卸载dll
  end;
end;
//计算生化反应的编码,需要编码位数,可能是连续三种反应对应一个编码,也
//可能是一种反应对应一个编码 ,返回一个字符串形式的编码
//需要提取计算getHoleCode
function calcReactionCode(bios:array of boolean):string;
var
 i,ir:integer;
 validReaction:array[1..MAX_PREHOLE] of boolean; //对应板孔的实际编号,例如,第1个元素就对应第一个孔,未必是第一种药品

begin
   //先将24个反应的有效反应提出,并存储到validReaction数组中
  //初始化validReaction
  for i:=1 to MAX_PREHOLE do
    validReaction[i]:=false;
  for i:=1 to MAX_PREHOLE do
    if bios[i] then
      validReaction[holeCode[i]]:=true;
  //将15种反应编入整数码.原来的做法是有问题的.
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
 原changeError
找到若干条较为匹配的编码, 由于delphi的规定,数组newCodes必须预先设置好大小.
@nbits----允许修改的位块的位数
@oldcode---老的反应编码
@newCodes---经过修改后的一组新的反应编码
算法: (使用异或运算)
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
 找到的编码存储到glzz表中
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
//取反number的第nbit位 ,以1为低字节起始位.
procedure reverseBit(nbit:integer;number:integer);
var
  i,j:integer;
begin
  i:=1;
  j:=0;
  //如果该位为1
  if (number and (i shl (nbit-1)) )=(i shl (nbit-1)) then
    number:=number and (not(i shl (nbit-1)))
  else
    number:=number or (i shl (nbit-1));
end;

 原checkError
 在FindApproximateNumber之后,计算各近似编码的概率
 需要检索特定菌种的概率表,最终的结果存储到glApprox表中

}
{
procedure calcProbability(tblName:string);
begin
    //检查glzz表是否为空

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
//对耐药的三种情形进行编码
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
      MessageDlg('背景图片不存在！请先正确设置！',mtInformation,[mbOK],0);
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

