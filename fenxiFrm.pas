unit fenxiFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, shellapi;

type
  TfenxiForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fenxiForm: TfenxiForm;

implementation
uses germAnalysisFrm, NegativeFrm, positiveFrm;
{$R *.dfm}

procedure TfenxiForm.Button1Click(Sender: TObject);
var
  gfrm: tgermAnalysisForm;
begin
  gfrm := tgermAnalysisForm.Create(self);
  self.Hide;
  gfrm.ShowModal;
end;

procedure TfenxiForm.Button2Click(Sender: TObject);
var
  nfrm: tNegativeForm;
begin
  nfrm := tNegativeForm.Create(self);
  nfrm.ShowModal;
end;

procedure TfenxiForm.Button3Click(Sender: TObject);
var
  nfrm: tPositiveForm;
begin
  nfrm := tPositiveForm.Create(self);
  nfrm.ShowModal;
end;

procedure TfenxiForm.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfenxiForm.Button5Click(Sender: TObject);
var path: string;
begin
  path := getcurrentdir + '\Epi.exe';
  shellexecute(handle, 'open', pchar(path), nil, nil, sw_show);
end;

end.
