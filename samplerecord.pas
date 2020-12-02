unit samplerecord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, db;

type
  Tsamplerecordform = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  samplerecordform: Tsamplerecordform;

implementation

uses regBBfrm, regZkfrm, dbym, germAnalysisFrm, loginfrm, ygsamplefrm;

{$R *.dfm}

procedure Tsamplerecordform.Button4Click(Sender: TObject);
begin
  close;
end;

procedure Tsamplerecordform.Button1Click(Sender: TObject);
var afrm: TRegBBform;
begin
  afrm := TRegbbForm.create(self);
  afrm.showmodal;
end;

procedure Tsamplerecordform.Button3Click(Sender: TObject);
var afrm: Tregzkform;
begin
  afrm := Tregzkform.Create(self);
  afrm.ShowModal;
end;

procedure Tsamplerecordform.Button2Click(Sender: TObject);
var afrm: tYgSample;
begin
  afrm := TYgSample.Create(self);
  afrm.ShowModal;
end;

end.
