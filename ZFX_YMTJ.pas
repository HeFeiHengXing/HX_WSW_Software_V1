unit ZFX_YMTJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Grids;

type
  TZFX_YMTJFrm = class(TForm)
    Panel1: TPanel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    stgchk: TStringGrid;
    Panel2: TPanel;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    StringGrid1: TStringGrid;
    dateStart: TDateTimePicker;
    GroupBox1: TGroupBox;
    dateEnd: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label5: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZFX_YMTJFrm: TZFX_YMTJFrm;

implementation

{$R *.dfm}

end.
