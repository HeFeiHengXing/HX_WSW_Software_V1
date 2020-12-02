unit Tjchaxun;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  Taboutbox = class(TForm)
    Button9: TButton;
    Button3: TButton;
    Button5: TButton;
    Button1: TButton;
    Button7: TButton;
    Button2: TButton;
    Button8: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  aboutbox: Taboutbox;

implementation
uses statfrm, distributefrm, antibiofrm, totalfrm,
  specdistfrm, querypatientfrm, yyrepofrm, dbym;
{$R *.dfm}

procedure Taboutbox.Button1Click(Sender: TObject);
var
  sfrm: tstatform;
begin
  sfrm := tstatform.Create(self);
  sfrm.ShowModal;
end;

procedure Taboutbox.Button2Click(Sender: TObject);
var
  bfrm: tbbdistributeform;
begin
  bfrm := tbbdistributeForm.create(self);
  bfrm.showmodal;
end;

procedure Taboutbox.Button6Click(Sender: TObject);
var
  afrm: tantibioForm;
begin
  afrm := tantibioForm.create(self);
  afrm.showmodal;
end;

procedure Taboutbox.Button7Click(Sender: TObject);
var
  tfrm1: ttotalform;
begin
  dmym.rsbase.Active := false;
  dmym.rsbase.CommandText := 'select * from Base  order by cydate desc';
  dmym.rsbase.Active := true;
  tfrm1 := ttotalForm.create(self);
  tfrm1.showmodal;
end;

procedure Taboutbox.Button3Click(Sender: TObject);
var
  sfrm: tspecDistForm;
begin
  sfrm := tspecDistForm.Create(self);
  sfrm.ShowModal;
end;

procedure Taboutbox.Button8Click(Sender: TObject);
var
  pfrm: tqueryPatientForm;
begin
  pfrm := tqueryPatientForm.Create(self);
  pfrm.ShowModal;
end;

procedure Taboutbox.Button5Click(Sender: TObject);
var
  gfrm: TYYRepoForm;
begin
  gfrm := TYYRepoForm.Create(self);
  gfrm.ShowModal;
end;

procedure Taboutbox.Button9Click(Sender: TObject);
begin
  close;
end;

end.
