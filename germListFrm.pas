unit germListFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TgermListForm = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  germListForm: TgermListForm;

implementation

uses dbym;

{$R *.dfm}

procedure TgermListForm.FormShow(Sender: TObject);
begin
   dmym.rsGermName.Active:=true;
end;

procedure TgermListForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmym.rsGermName.active:=false;
   action:=cafree;
end;

end.
