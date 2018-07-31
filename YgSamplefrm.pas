unit YgSamplefrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TYgsample = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    procedure Button7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ygsample: TYgsample;

implementation

uses regYgfrm,regYgSurfaceFrm,regYgHandfrm,RegYgMedfrm,RegYgLiqfrm,RegYgQt,
  RegYgtxyfrm, regYgSurgeryfrm;

{$R *.dfm}

procedure TYgsample.Button7Click(Sender: TObject);
begin
  close;
end;

procedure TYgsample.Button1Click(Sender: TObject);
var afrm:TregYgform;
begin
    afrm:=TregYgForm.Create(self);
    afrm.ShowModal;
end;

procedure TYgsample.Button2Click(Sender: TObject);
var afrm:TregYgSurfaceForm;
begin
    afrm:=TregYgSurfaceForm.Create(self);
    afrm.ShowModal;
end;

procedure TYgsample.Button3Click(Sender: TObject);
var afrm:TRegYgHandForm;
begin
    afrm:=TRegYgHandForm.Create(self);
    afrm.ShowModal;
end;

procedure TYgsample.Button4Click(Sender: TObject);
var afrm:TRegYgMedform;
begin
    afrm:=TRegYgMedform.Create(self);
    afrm.ShowModal;
end;

procedure TYgsample.Button5Click(Sender: TObject);
var afrm:TRegYgLiqform;
begin
    afrm:= TRegYgLiqform.Create(self);
    afrm.ShowModal;
end;

procedure TYgsample.Button6Click(Sender: TObject);
var afrm:TRegYgQtform;
begin
    afrm:=TRegYgQtform.Create(self);
    afrm.ShowModal;
end;

procedure TYgsample.Button8Click(Sender: TObject);
var afrm:TRegYgtxyform;
begin
    afrm:=TRegYgtxyform.Create(self);
    afrm.ShowModal;
end;

procedure TYgsample.Button9Click(Sender: TObject);
var aform:TRegSurgeryform;
begin
    aform:=TRegSurgeryform.Create(self);
    aform.ShowModal;
end;

end.
