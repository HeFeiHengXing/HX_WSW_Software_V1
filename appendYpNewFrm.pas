unit appendYpNewFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask;

type
  TAppendYpNewForm = class(TForm)
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBComboBox1: TDBComboBox;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    badd: boolean;
  public
    { Public declarations }
    procedure setStatus(b1: boolean);
  end;

var
  AppendYpNewForm: TAppendYpNewForm;

implementation

uses dbym;

{$R *.dfm}

procedure TAppendYpNewForm.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TAppendYpNewForm.Button1Click(Sender: TObject);
begin
  if bAdd then
  begin
    if (dbedit1.Text = '') or (dbComboBox1.Text = '') then
      MessageDlg('信息填写不完整!', mtInformation, [mbok], 0)
    else
    begin
      dmym.rsAddTemp.Post;
      close;
    end
  end else
  begin
    dmym.rsAddTemp.Post;
    close;
  end;

end;

procedure tAppendYpNewForm.setStatus(b1: boolean);
begin
  if b1 then
    self.Caption := '药敏附加结果--新增'
  else
    self.Caption := '药敏附加结果--编辑';
  badd := b1;
end;

procedure TAppendYpNewForm.FormCreate(Sender: TObject);
begin
  badd := false;
end;

procedure TAppendYpNewForm.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBcombobox1.setfocus;
end;

procedure TAppendYpNewForm.DBComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    DBedit2.setfocus;
end;

procedure TAppendYpNewForm.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBedit3.setfocus;
end;

end.
