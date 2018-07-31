unit DISet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,inifiles;

type
  TDISetform = class(TForm)
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
     Myini:Tinifile;
  public
    { Public declarations }
  end;

var
  DISetform: TDISetform;

implementation

{$R *.dfm}

procedure TDISetform.FormShow(Sender: TObject);
begin
    Myini:=Tinifile.Create(ExtractFileDir(Application.ExeName)+'\dw.ini');
    Memo1.Text:=Myini.ReadString('DepartMent','Information','');
    CheckBox1.Checked := StrToBool(Myini.ReadString('ReportConfig','Group',''));
    CheckBox2.Checked := StrToBool(Myini.ReadString('ReportConfig','DoseUsage',''));
end;

procedure TDISetform.Button2Click(Sender: TObject);
begin
    Myini.WriteString('DepartMent','Information',Memo1.text);
    Myini.WriteString('ReportConfig','Group',BoolToStr(CheckBox1.Checked));
    Myini.WriteString('ReportConfig','DoseUsage',BoolToStr(CheckBox2.Checked));
    showmessage('设置信息已保存!');
end;

procedure TDISetform.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TDISetform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action:=Cafree;
end;

end.
