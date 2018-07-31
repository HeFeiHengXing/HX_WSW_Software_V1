unit LSDetailfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, DB, ADODB, Grids, DBGrids, RpCon, RpConDS,
  RpBase, RpSystem, RpDefine, RpRave,rvdirectdataview,rvcsdata,rvcsstd,rvproj,
  rvclass,rvcsrpt,strutils;

type
  TLSdetailForm = class(TForm)
    sgrid: TStringGrid;
    RvSystem1: TRvSystem;
    rvsingle3: TRvDataSetConnection;
    rvSingle2: TRvDataSetConnection;
    rvSingle: TRvDataSetConnection;
    RvProject1: TRvProject;
    Label42: TLabel;
    Label41: TLabel;
    Label40: TLabel;
    Label39: TLabel;
    Label38: TLabel;
    Label37: TLabel;
    Label36: TLabel;
    Label35: TLabel;
    Label34: TLabel;
    Label33: TLabel;
    Label32: TLabel;
    Label31: TLabel;
    Label30: TLabel;
    Label29: TLabel;
    Label28: TLabel;
    Label27: TLabel;
    Label1: TLabel;
    DBText9: TDBText;
    DBText8: TDBText;
    DBText7: TDBText;
    DBText6: TDBText;
    DBText5: TDBText;
    DBText4: TDBText;
    DBText3: TDBText;
    DBText2: TDBText;
    DBText17: TDBText;
    DBText16: TDBText;
    DBText15: TDBText;
    DBText14: TDBText;
    DBText13: TDBText;
    DBText12: TDBText;
    DBText11: TDBText;
    DBText10: TDBText;
    DBText1: TDBText;
    Button1: TButton;
    rsSingleAdd: TADODataSet;
    dstemp: TDataSource;
    rstemp: TADODataSet;
    ADOQuery1: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      procedure yxReport;
    procedure germReport;
  end;

var
  LSdetailForm: TLSdetailForm;

implementation
uses dbym, common, reportConfirmFrm;
{$R *.dfm}

procedure Tlsdetailform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action:=cafree;
end;

procedure Tlsdetailform.FormShow(Sender: TObject);
var i,j:integer;
  str,strqz:string;
begin
  with rsTemp do
    begin
      Active:=false;
      commandtext:='select * from ypbase where useid='+inttostr(dmym.LSADODataSet1['useid'])+' order by ypid';
      Active:=true;
    end;
  i:=1;
  sgrid.RowCount:=rstemp.RecordCount+1;
  for j:=1 to sgrid.RowCount-1 do
  sgrid.rowheights[j]:=20;
  while not rstemp.eof do
  begin
      case rstemp['jl'] of
         0:
           begin
             str:='敏感';
             strqz:='<'+rstemp['qz1'];
           end;
         1:
           begin
             str:='敏感';
             strqz:=rstemp['qz1'];
           end;
         3:
           begin
             str:='中介';
             strqz:=rstemp['qz2'];
           end;
         7:
           begin
             str:='耐药';
             strqz:='≥'+rstemp['qz3'];
           end;
       else
           begin
             str:='';
             strqz:='';
           end;
       end;
       sgrid.Cells[0,i]:=inttostr(i);
       sgrid.Cells[1,i]:=rsTemp['ypmc'];
       sgrid.cells[2,i]:=strqz;
       sgrid.Cells[3,i]:=str;
       if varisnull(rstemp['bz']) then
         sgrid.Cells[4,i]:=' '
       else
         sgrid.Cells[4,i]:=rstemp['bz'];
       inc(i);
       rstemp.next;
    end;
  rstemp.active:=false;
end;

procedure Tlsdetailform.FormCreate(Sender: TObject);
begin
   sgrid.Cells[1,0]:='药物名称';
   sgrid.Cells[2,0]:='MIC/ug(ml)';
   sgrid.Cells[3,0]:='敏感度';
   sgrid.Cells[4,0]:='分组';
   sgrid.FixedRows:=1;             
   rvproject1.ProjectFile:=rvfile;
end;

procedure Tlsdetailform.sgridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
   if acol=0 then
      sgrid.ColWidths[0]:=25;
end;

procedure Tlsdetailform.Button1Click(Sender: TObject);
var
  i,id:integer;
  bPositive:boolean;
  resultstr:string;
  timestr:string;
  mydataview1,mydataview2:travedataview;
  mytext:travetext;
  mydatatext:travedatatext;
  mypage:travepage;
begin
  if varisnull(dmym.LSADODataSet1['result'])  then
     yxreport
  else
     germReport;

end;

procedure tlsdetailform.yxReport;
var
  i,id:integer;
  bPositive:boolean;
  resultstr:string;
  timestr:string;
  mydataview1,mydataview2:travedataview;
  mytext:travetext;
  mydatatext:travedatatext;
  mypage:travepage;
begin
  resultstr:='';
  rvProject1.Open;
  with rvproject1.ProjMan do
  begin
     myDataView1:=FindRaveComponent('dataview8',nil) as TraveDataView;
     myDataView2:=FindRaveComponent('dataview9',nil) as TraveDataView;
     mydataview1.ConnectionName:='rvSingle';
     mydataview2.ConnectionName:='rvSingle';
  end;
  id:=dmym.rsBase['useid'];
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.Add('select * from yx where useid=:id order by alist');
    parameters.ParamByName('id').Value:=id;
    open;

    if not eof then
    begin
      if fieldvalues['type']='-' then
        bpositive:=false
      else
        bPositive:=true;
    end;
    first;
    i:=0;
    while not eof do
    begin
      if bPositive then
      begin
        if i=0 then
          timestr:=fieldvalues['result'];
        if i=1 then
          if fieldvalues['chk']='1' then
            resultstr:=resultstr+'检出正常菌群'+fieldvalues['result']+''#13#10;
        if i=2 then
          if fieldvalues['chk']='1' then
             resultstr:=resultstr+fieldvalues['result']+' '#13#10;;
        if i=3 then
          if fieldvalues['chk']='1' then
            resultstr:=resultstr+'检出'+fieldvalues['result']+#13#10;
      end else
      begin
        if i=0 then
          timestr:=fieldvalues['result'];
        if i=1 then
          if fieldvalues['chk']='1' then
            resultstr:=resultstr+'检出正常菌群'+fieldvalues['result']+''#13#10;
        if i=2 then
          if fieldvalues['chk']='1' then
             resultstr:=resultstr+'未检出'+fieldvalues['result']+' '#13#10;;
        if i=3 then
          if fieldvalues['chk']='1' then
            resultstr:=resultstr+fieldvalues['result']+'(正常菌群),呈现优势生长'#13#10;
        if i=6 then
          if fieldvalues['chk']='1' then
            resultstr:=resultstr+fieldvalues['result']+''#13#10;
         if i=7 then
          if fieldvalues['chk']='1' then
            resultstr:=resultstr+'未检出'+fieldvalues['result']+#13#10;
         if i=8 then
          if fieldvalues['chk']='1' then
            resultstr:=resultstr+'检出'+fieldvalues['result']+#13#10;
      end;
      next;
      inc(i);
    end;

  end;
   rvproject1.SetParam('titlestr',hospitalname+'微生物检测报告单');
   rvProject1.SetParam('ntime',timestr);
   rvProject1.SetParam('resultstr',resultstr);
   if bPositive then//阳性报告单
   begin
      with rvproject1.projman do
      begin
        mypage:=findRaveComponent('report9.page2',nil) as tRavePage;
        mydatatext:=findRaveComponent('datatext16',mypage) as tRavedataText;
        mytext:=findRaveComponent('text16',mypage) as tRaveText;
        mytext.Left:=mydatatext.Left;
        rvProject1.executeReport('report9') ;
      end;
   end  else  //阴性报告单
   begin
       with rvproject1.projman do
       begin
          mypage:=findRaveComponent('report10.mainpage',nil) as tRavePage;
          mydatatext:=findRaveComponent('datatext16',mypage) as tRavedataText;
         
          mytext:=findRaveComponent('text16',mypage) as tRaveText;
          mytext.Left:=mydatatext.Left;
          rvProject1.executeReport('report10');
       end;
   end;
  rvproject1.Close;
end;

procedure tlsdetailform.germReport;
var
  mydataview1,mydataview2,mydataview3:travedataview;
  mypage:travepage;
  myregion:traveRegion;
  mydataband,fjdataband:travedataband;
  jjband,titleband,pyband,bzband,fjband:traveband;
  mydatatext1,mydatatext2:travedatatext;
 // mysection,mysection2:travesection;
  memo1:tRaveMemo;
  s,datestr,datestr2,timestr,timestr2:string;
  b1:boolean;
  id:integer;
  aform:treportConfirmForm;
begin
  aform:=treportConfirmForm.Create(self);
  id:=dmym.rsBase['useid'];
  if aform.ShowModal=mrOk then
  begin
    with rsSingleadd do
    begin
      active:=false;
      commandtext:='select * from ypadd where useid='+inttostr(id);
    end;
    rvProject1.Open;
    with rvproject1.ProjMan do
    begin
      myDataView1:=FindRaveComponent('dv_germAnalysis',nil) as TraveDataView;
      myDataView2:=FindRaveComponent('dv_yp',nil) as TraveDataView;
      myDataView3:=FindRaveComponent('dv_ypAdd',nil) as TraveDataView;
      mydataview1.ConnectionName:='rvSingle';
      mydataview2.ConnectionName:='rvSingle2';
      mydataview3.ConnectionName:='rvSingle3';

      mypage:=findRaveComponent('report_zk.page1',nil) as tRavePage;
      myRegion:=findRaveComponent('dv_ypregion',mypage) as tRaveRegion;
      mydataband:=findRaveComponent('dv_ypdataband',myregion) as tRaveDataband;

      mydatatext1:=findRaveComponent('datatext10',mypage) as tRavedataText;
      //mysection:=findRaveComponent('section1',mypage) as tRaveSection;
      //mysection2:=findRaveComponent('section2',mypage) as tRaveSection;
      jjband:=findRaveComponent('jjband',mypage) as traveband;
      titleband:=findRaveComponent('dv_ypBand',mypage) as tRaveband;
      pyband:=findRaveComponent('pyBand',mypage) as tRaveband;
      bzband:=findRaveComponent('bzBand',mypage) as tRaveband;
      fjband:=findRaveComponent('fjband',mypage) as tRaveband;
      fjdataband:=findRaveComponent('databand1',mypage) as tRaveDataband;
        //打印镜检结果
      if not(aform.bjj=true) then
      begin
         jjband.Visible:=false;
         titleband.PositionValue:=jjband.positionvalue;
      end;
         //打印医生评语
      if not(aform.bPy=true) then
      begin
         pyband.Visible:=false;
         bzband.PositionValue:=pyband.PositionValue;
      end;

         //打印附加药品
        if not(aform.bFj=true) then
         begin
            fjband.Visible:=false;
            fjdataband.Visible:=false;
         end;

         //打印备注
      memo1:=findRaveComponent('memo1',mypage) as tRaveMemo;
      s:=bcstr(dmym.rsBase['bc']);

      memo1.text:=s;
      if s='' then
        b1:=false
      else
        b1:=true;

      memo1.text:=memo1.text+''#13#10+nastr(b1);
    end;
     with ADOQuery1 do
         begin
          close;
          sql.Clear; 
          sql.Add('select* from base where jzname='''+DBText16.Caption+'''');
          open;
         end;
     rvproject1.SetParam('Egxj',ADOQuery1.FieldByName('Ename').AsString);
     datestr:=datetostr(dmym.rsBase['repdate']);
     timestr:=timetostr(dmym.rsBase['repdate']);
     //datestr2:=datetostr(dmym.rsBase['cydate']);
     //timestr2:=timetostr(dmym.rsBase['cydate']);
     rvproject1.SetParam('datestr',datestr);
     rvproject1.SetParam('timestr',' '+timestr);
     //rvproject1.SetParam('datestr',datestr2);
     //rvproject1.SetParam('timestr',' '+timestr2);
     rvproject1.SetParam('titlestr',hospitalName+'微生物检测报告单');
    rvProject1.ExecuteReport('report_zk');
    rvProject1.Close;
  end;
end;









end.
