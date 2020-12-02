unit sreport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, inifiles;

type
  Tsreportform = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton3: TRadioButton;
    Button1: TButton;
    Button3: TButton;
    RadioButton2: TRadioButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    myini: Tinifile;
  public
    { Public declarations }
    reporttype: integer;
  end;

var
  sreportform: Tsreportform;

implementation

{$R *.dfm}

procedure Tsreportform.Button1Click(Sender: TObject);
begin
  ModalResult := mrok;
end;

procedure Tsreportform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if RadioButton1.Checked then
    reporttype := 1;
  if RadioButton2.Checked then
    reporttype := 2;
  if RadioButton3.Checked then
    reporttype := 3;
  myini.Free;
end;

procedure Tsreportform.FormCreate(Sender: TObject);
var printmethod: string;
begin
  myini := Tinifile.Create(Extractfiledir(Application.ExeName) + '\dw.ini');
  printmethod := myini.readstring('print options', 'Printing method', 'Quick Print');
  if printmethod = 'Quick Print' then
    radiobutton1.checked := true;
  if printmethod = 'Preview' then
    radiobutton2.checked := true;
  if printmethod = 'ExportWord' then
    radiobutton3.checked := true;
end;

procedure Tsreportform.Button3Click(Sender: TObject);
begin
  ModalResult := mrcancel;
end;

procedure Tsreportform.Button2Click(Sender: TObject);
begin
  if radiobutton1.Checked then
    myini.WriteString('print options', 'Printing method', 'Quick Print');
  if radiobutton2.Checked then
    myini.WriteString('print options', 'Printing method', 'Preview');
  if radiobutton3.Checked then
    myini.WriteString('print options', 'Printing method', 'ExportWord');
  showmessage('保存设置成功！');
end;

end.
