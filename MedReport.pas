unit MedReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, ExtCtrls, StdCtrls;

type
  TMedReportForm = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MedReportForm: TMedReportForm;


implementation
uses dbym;

{$R *.dfm}

procedure TMedReportForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TMedReportForm.FormShow(Sender: TObject);
var aform: Tform;
  i, j: integer;
begin
  ADODataset1.Active := false;
  ADODataset1.CommandText := 'select * from yp order by ypid';
  ADODataset1.Active := true;
  Timer1.Enabled := true;
end;

procedure TMedReportForm.Timer1Timer(Sender: TObject);
begin
  ADODataset1.DisableControls;
  ADODataset1.Active := false;
  ADODataset1.Active := true;
  ADODataset1.EnableControls
end;

end.
