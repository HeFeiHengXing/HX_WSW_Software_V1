unit aboutFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TaboutForm = class(TForm)
    Panel1: TPanel;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Label1: TLabel;
    OKButton: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Label5: TLabel;
    procedure OKButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  aboutForm: TaboutForm;

implementation

{$R *.dfm}

procedure TaboutForm.OKButtonClick(Sender: TObject);
begin
   close;
end;

end.
