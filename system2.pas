unit system2;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls,common,shellapi;

type
  Tsystem = class(TForm)
    Button6: TButton;
    Button5: TButton;
    Button1: TButton;
    Button4: TButton;
    Button3: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  system: Tsystem;

implementation
uses germListFrm,expert,aboutFrm,loginfrm, backup;
{$R *.dfm}

procedure Tsystem.Button1Click(Sender: TObject);
begin
   ShellExecute(application.Handle,nil,Pchar(getcurrentdir+'\ym.chm'),nil,nil,SW_ShowNormal);
end;

procedure Tsystem.Button2Click(Sender: TObject);
var
   gfrm:tgermListForm;
begin
   gfrm:=tgermListForm.Create(self);
   gfrm.ShowModal;
end;

procedure Tsystem.Button5Click(Sender: TObject);
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
end;

procedure Tsystem.Button4Click(Sender: TObject);
var
   afrm:taboutForm;
begin
   afrm:=taboutForm.Create(self);
   afrm.ShowModal;
end;

procedure Tsystem.Button3Click(Sender: TObject);
begin
   close;
end;

procedure Tsystem.FormShow(Sender: TObject);
begin
  if loginform.Bsuper=false then
    Button5.Enabled:=false;
end;
procedure Tsystem.Button6Click(Sender: TObject);
var aform:TbackupForm;
begin
    aform:=TbackupForm.Create(self);
    aform.ShowModal;
end;

end.
