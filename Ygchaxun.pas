unit Ygchaxun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, ExtCtrls, Buttons, RpBase,
  RpSystem, RpRave, RpDefine, RpCon, RpConDS, Menus;

type
  TYgFrm = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button5: TButton;
    Button2: TButton;
    Button3: TButton;
    Button6: TButton;
    Button8: TButton;
    Button7: TButton;
    Button9: TButton;
    Button4: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YgFrm: TYgFrm;

implementation

uses dbym, YgAirFrm, YgSurfaceFrm, YgHandFrm, YgLiqFrm, YgMedFrm,
  YgQueryFrm, YgqtFrm, Ygtxyfrm, YgSurgeryFrm;

{$R *.dfm}





procedure TYgFrm.Button2Click(Sender: TObject);
var
  yfrm: tygAirForm;
begin
  yfrm := tygAirForm.Create(self);
  yfrm.showmodal;
end;

procedure TYgFrm.Button3Click(Sender: TObject);
var
  yfrm: tYgSurfaceForm;
begin
  yfrm := tYgSurfaceForm.Create(self);
  yfrm.ShowModal;
end;

procedure TYgFrm.Button4Click(Sender: TObject);
var
  yfrm: tYgHandForm;
begin
  yfrm := tYgHandForm.Create(self);
  yfrm.ShowModal;
end;

procedure TYgFrm.Button5Click(Sender: TObject);
var
  yfrm: tYgMedForm;
begin
  yfrm := tYgMedForm.Create(self);
  yfrm.ShowModal;
end;

procedure TYgFrm.Button6Click(Sender: TObject);
var
  yfrm: tYgLiqForm;
begin
  yfrm := tYgLiqForm.Create(self);
  yfrm.ShowModal;
end;

procedure TYgFrm.Button7Click(Sender: TObject);
var
  yfrm: tYgQueryForm;
begin
  yfrm := tYgQueryForm.Create(self);
  yfrm.ShowModal;
end;

procedure TYgFrm.Button8Click(Sender: TObject);
var
  yfrm: TygqtForm;
begin
  yfrm := TygqtForm.Create(self);
  yfrm.ShowModal;
end;

procedure TYgFrm.Button9Click(Sender: TObject);
var afrm: TYgtxy;
begin
  afrm := TYgtxy.Create(self);
  afrm.ShowModal;
end;

procedure TYgFrm.Button10Click(Sender: TObject);
var afrm: TYgSurgeryForm;
begin
  afrm := TYgSurgeryForm.Create(self);
  afrm.ShowModal;
end;

procedure TYgFrm.Button1Click(Sender: TObject);
begin
  self.close;
end;

end.
