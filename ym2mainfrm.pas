unit ym2mainfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, StdCtrls, xmldom, XMLIntf, msxmldom, XMLDoc,shellapi,
  jpeg, ExtCtrls,strutils, WinSkinData, WinSkinStore, ComCtrls, ActnMan,
  ActnColorMaps;

type
  Tym2MainForm = class(TForm)
    MainMenu1: TMainMenu;
    NAnalysis: TMenuItem;
    NStatistics: TMenuItem;
    NInfection: TMenuItem;
    NQc: TMenuItem;
    NSystem: TMenuItem;
    rs1: TADODataSet;
    myxml: TXMLDocument;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    NSpeciman: TMenuItem;
    SkinData1: TSkinData;
    NWhonet: TMenuItem;
    procedure mnu_sub_patientRegClick(Sender: TObject);
    procedure mun_sub_infectRegClick(Sender: TObject);
    procedure mnuZKRegClick(Sender: TObject);
    procedure mnu_hospital_airClick(Sender: TObject);
    procedure mnu_hospital_surfaceClick(Sender: TObject);
    procedure mnu_hospital_handClick(Sender: TObject);
    procedure mnu_hospital_medicineClick(Sender: TObject);
    procedure mnu_hospital_xdClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure v(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mnu_qaBrowseClick(Sender: TObject);
    procedure mnu_qaAnalyseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NInfectionClick(Sender: TObject);
    procedure NAnalysisClick(Sender: TObject);
    procedure NStatisticsClick(Sender: TObject);
    procedure NQcClick(Sender: TObject);
    procedure NSystemClick(Sender: TObject);
    procedure NSpecimanClick(Sender: TObject);
    procedure NWhonetClick(Sender: TObject);
  private
    { Private declarations }
    procedure WMSyscommand(var Msg:TWMSYSCOMMAND);message WM_SYSCOMMAND;
  public
    { Public declarations }
  end;

var
  ym2MainForm: Tym2MainForm;

implementation

uses regBBfrm, regYgfrm, regZkfrm, statfrm, distributeFrm, dbym,
  antibioFrm, totalfrm, specDistfrm, queryPatientFrm,
  YgAirFrm, YgSurfaceFrm, YgQueryFrm, YgHandFrm, YgLiqFrm, YgMedFrm,
  common, NegativeFrm, positiveFrm, germListFrm, aboutFrm, bkfrm, loginfrm,
  germAnalysisFrm, zkBrowseFrm, zkAnalysisfrm, expert, Ygchaxun,YYRepoFrm,
  ZFX_YMTJ,fenxiFrm,Tjchaxun,zkmanagerz,system2,samplerecord, whonet;

{$R *.dfm}


procedure Tym2MainForm.mnu_sub_patientRegClick(Sender: TObject);
var
   regfrm:tregbbform;
begin
   regfrm:=tregbbform.Create(self);
   regfrm.ShowModal;
end;

procedure Tym2MainForm.mun_sub_infectRegClick(Sender: TObject);
var
   regfrm:tregygform;
begin
   regfrm:=tregygform.Create(self);
   regfrm.ShowModal;
end;

procedure Tym2MainForm.mnuZKRegClick(Sender: TObject);
var
   regfrm:tregzkform;
begin
   regfrm:=tregzkform.Create(self);
   regfrm.ShowModal;
end;



procedure Tym2MainForm.mnu_hospital_airClick(Sender: TObject);
var
   yfrm:tYgFrm;
begin
   yfrm:=tygFrm.Create(self);
   yfrm.showmodal;
end;

procedure Tym2MainForm.mnu_hospital_surfaceClick(Sender: TObject);
var
   yfrm:tYgSurfaceForm;
begin
   yfrm:=tYgSurfaceForm.Create(self);
   yfrm.ShowModal;
end;


procedure Tym2MainForm.mnu_hospital_handClick(Sender: TObject);
var
   yfrm:tYgHandForm;
begin
   yfrm:=tYgHandForm.Create(self);
   yfrm.ShowModal;
end;

procedure Tym2MainForm.mnu_hospital_medicineClick(Sender: TObject);
var
   yfrm:tYgMedForm;
begin
   yfrm:=tYgMedForm.Create(self);
   yfrm.ShowModal;
end;

procedure Tym2MainForm.mnu_hospital_xdClick(Sender: TObject);
var
   yfrm:tYgLiqForm;
begin
   yfrm:=tYgLiqForm.Create(self);
   yfrm.ShowModal;
end;

procedure Tym2MainForm.FormCreate(Sender: TObject);
var
   node,root:IxMLNode;
begin
      myxml.FileName:=getcurrentdir+'\HospitalName.xml';
      myxml.Active:=true;
      root:=myxml.DocumentElement;
      node:=root.ChildNodes.FindNode('name');
      if (node<>nil) then
         hospitalname:=node.NodeValue
      else
        hospitalname:='错误的用户单位名！';
      //label1.Caption:=hospitalname;
      label2.Caption:=hospitalname;

      rvfile:=getcurrentdir+'\ymoutput.rav';
end;

procedure Tym2MainForm.v(Sender: TObject);
var
   nfrm:tNegativeForm;
begin
   nfrm:=tNegativeForm.Create(self);
   nfrm.ShowModal;
end;




procedure Tym2MainForm.E1Click(Sender: TObject);
begin
   close;
end;

procedure Tym2MainForm.A1Click(Sender: TObject);
var
   afrm:taboutForm;
begin
   afrm:=taboutForm.Create(self);
   afrm.ShowModal;
end;

procedure Tym2MainForm.I1Click(Sender: TObject);
begin
    ShellExecute(application.Handle,nil,Pchar(getcurrentdir+'\ym.chm'),nil,nil,SW_ShowNormal);
end;

procedure Tym2MainForm.FormResize(Sender: TObject);
var
   w:integer;
begin
   image1.Stretch:=true;
   image1.Width:=self.ClientWidth;
   image1.Height:=self.ClientHeight; 
   w:=self.ClientHeight div 2;
   label2.Top:=w;
   label1.Top:=label2.Top+label2.Height;
   w:=(self.ClientWidth-label1.Width) div 2;
   if w>0 then
    label2.Left:=w
   else
    label2.Left:=0;
   if w>0 then
    label1.Left:=label2.Left+(label2.Width-label1.Width) div 2
   else
    label1.Left:=0;
end;

procedure Tym2MainForm.mnu_qaBrowseClick(Sender: TObject);
var
   zfrm:tzkBrowseForm;
begin
   zfrm:=tzkBrowseForm.Create(self);
   zfrm.ShowModal;
end;

procedure Tym2MainForm.mnu_qaAnalyseClick(Sender: TObject);
var
   zfrm:tzkAnalysisForm;
begin
   zfrm:=tzkAnalysisForm.Create(self);
   zfrm.ShowModal;
end;

procedure Tym2MainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  myxml.Active:=false;
  application.terminate;
end;

procedure Tym2MainForm.FormShow(Sender: TObject);
var
  w:integer;
begin

   image1.Stretch:=true;
   image1.Width:=self.ClientWidth;
   image1.Height:=self.ClientHeight;
   self.Left:=0;
   self.Top:=0;
   w:=self.ClientHeight div 2;
   label2.Top:=w;
   label1.Top:=label2.Top+label2.Height;
   w:=(self.ClientWidth-label1.Width) div 2;
   if w>0 then
    label2.Left:=w
   else
    label2.Left:=0;
   if w>0 then
    label1.Left:=label2.Left+(label2.Width-label1.Width) div 2
   else
    label1.Left:=0;
   self.Caption:=hospitalname+'细菌鉴定药敏分析仪';
end;

{procedure Tym2MainForm.N12Click(Sender: TObject);
var
  str:string;
  si: startupinfo;
  pi: process_information;
begin
    ZeroMemory(@si, sizeof(si) );
    si.cb := sizeof(si);
    ZeroMemory( @pi, sizeof(pi) );

   str:=getcurrentdir+'\manager.exe';
   createprocess(nil,pchar(str),nil,nil,false,0,nil,nil,si,pi);

   closehandle(pi.hprocess);
   closehandle(pi.hThread);
end;}

procedure Tym2MainForm.NInfectionClick(Sender: TObject);
var
   yfrm:tYgFrm;
begin
   yfrm:=tygFrm.Create(self);
   yfrm.show;
end;



procedure Tym2MainForm.NAnalysisClick(Sender: TObject);
var
 fenfrm:Tfenxiform;
begin
 fenfrm:=Tfenxiform.Create(self);
 fenfrm.showmodal;
end;

procedure Tym2MainForm.NStatisticsClick(Sender: TObject);
var
   fenfrm:TAboutBox;
begin
   fenfrm:=TAboutBox.Create(self);
   fenfrm.showmodal;
end;

procedure Tym2MainForm.NQcClick(Sender: TObject);
var
   bfrm:Tzkmanagez;
begin
   bfrm:=Tzkmanagez.create(self);
   bfrm.showmodal;
end;

procedure Tym2MainForm.NSystemClick(Sender: TObject);
var
   afrm:Tsystem;
begin
   afrm:=Tsystem.create(self);
   afrm.showmodal;
end;

procedure Tym2MainForm.NSpecimanClick(Sender: TObject);
var afrm:Tsamplerecordform;
begin
   afrm:=Tsamplerecordform.Create(self);
   afrm.showmodal;
end;

procedure Tym2MainForm.WMSyscommand(var Msg: TWMSYSCOMMAND);
begin
    if (Msg.CmdType=SC_MINIMIZE) then
    begin
        application.minimize;
    end else
        inherited;
end;

procedure Tym2MainForm.NWhonetClick(Sender: TObject);
var aform:Twhonetform;
begin
    aform:=Twhonetform.Create(self);
    aform.showmodal;
end;

end.
