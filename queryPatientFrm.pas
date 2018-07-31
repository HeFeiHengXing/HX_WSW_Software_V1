unit queryPatientFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TqueryPatientForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbQueryName: TComboBox;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  queryPatientForm: TqueryPatientForm;

implementation

uses dbym, germAnalysisFrm, positiveFrm, NegativeFrm;

{$R *.dfm}

procedure TqueryPatientForm.FormShow(Sender: TObject);
begin
   dmym.rsbase.Active:=false;
end;

procedure TqueryPatientForm.Button1Click(Sender: TObject);
var
 strSelect:string ;
 k:integer;
begin
   if cbQueryName.Text='' then
   begin
    Application.MessageBox('请选择查询名称!','提示',0);
    exit;
   end;
   dmym.rsBase.Active:=false;

   case cbQueryName.ItemIndex of
     0:
       strselect:='select * from base where zyh='+''''+edit1.Text+'''' ;
     1:
       strselect:='select * from base where name='+''''+edit1.Text+'''';
     2:
       strselect:='select * from base where bbh='+''''+edit1.Text+'''';
   end;

   dmym.rsbase.CommandText:=strselect;
   dmym.rsBase.Active:=true;
end;

procedure TqueryPatientForm.BitBtn2Click(Sender: TObject);
begin
   dmym.rsBase.Active:=false;
   close;
end;

procedure TqueryPatientForm.BitBtn1Click(Sender: TObject);
var
  gfrm:tgermAnalysisForm;
  pfrm:tPositiveform;
  nfrm:tNegativeform;
  id:integer;
  tablename:string;
  bPositive:boolean;
begin
   if dmym.rsbase.recordcount>0 then
    begin
      if varisnull(dmym.rsBase['result']) then
      begin
        id:=dmym.rsBase['useid'];
        with dmym.query1 do
        begin
          close;
          sql.clear;
          sql.Add('select * from yx where useid=:id order by alist');
          parameters.ParamByName('id').Value:=id;
          open;

          if not eof then
          begin
            if fieldvalues['type']='-' then
              bpositive:=false
            else
              bPositive:=true;
          end;
        end;
        if  bPositive then
        begin
           pfrm:=tPositiveForm.Create(self);
           pfrm.boldPatient:=true;
           pfrm.ShowModal;

        end else
        begin
           nfrm:=tNegativeForm.Create(self);
           nfrm.bOldPatient:=true;
           nfrm.ShowModal;
        end;
      end else
      begin
        dmym.rsAddtemp.Close;
        tablename:=dmym.rsAddTemp.TableName;
        dmym.rsAddtemp.TableName:='ypadd';
        dmym.rsAddTemp.close;
        dmym.rsAddTemp.Filter:='useid='+inttostr(dmym.rsBase['useid'])+' or useid=null';
        dmym.rsAddTemp.Filtered:=true;
        dmym.rsAddTemp.Open;
        gfrm:=tgermAnalysisForm.create(self);
        gfrm.bnewPatient:=false;
      //gfrm.iniform;
        gfrm.showmodal;
        gfrm.Free;
        dmym.rsAddTemp.Close;
        dmym.rsAddTemp.TableName:=tablename;
        dmym.rsAddTemp.Filtered:=false;
      end;
    end
  else
    dmym.rsbase.close;
  //close;
end;

end.
