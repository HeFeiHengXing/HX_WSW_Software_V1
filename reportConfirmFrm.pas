unit reportConfirmFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TreportConfirmForm = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bJJ,bPy,bFj:boolean;
  end;

var
  reportConfirmForm: TreportConfirmForm;

implementation

uses dbym;

{$R *.dfm}

procedure TreportConfirmForm.FormCreate(Sender: TObject);
begin
  bJJ:=false;
  bpy:=false;
  bfj:=false;
end;

procedure TreportConfirmForm.CheckBox1Click(Sender: TObject);
begin
  bjj:=checkbox1.Checked;
end;

procedure TreportConfirmForm.CheckBox2Click(Sender: TObject);
begin
  bpy:=checkbox2.Checked;
end;

procedure TreportConfirmForm.CheckBox3Click(Sender: TObject);
begin
  bfj:=checkbox3.Checked;
end;

procedure TreportConfirmForm.Button1Click(Sender: TObject);
begin
   modalresult:=mrOK;
end;

procedure TreportConfirmForm.Button2Click(Sender: TObject);
begin
   modalresult:=mrcancel;
end;

end.
