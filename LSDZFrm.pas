unit LSDZFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, DBTables, Mask, DBCtrls,
  ADODB;

type
  TLSDZForm = class(TForm)
    DBGrid1: TDBGrid;
    btnDetail: TBitBtn;
    btnTotalRec: TButton;
    btnDel: TBitBtn;
    ADOQuery1: TADOQuery;
    Label1: TLabel;
    procedure btnDetailClick(Sender: TObject);
    procedure btnTotalRecClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    BolBase:boolean;
  end;

var
  LSDZForm: TLSDZForm;

implementation
uses dbym,detailfrm,queryGenFrm, common,germAnalysisFrm,
     positiveFrm, NegativeFrm,lsdetailfrm;
{$R *.dfm}

procedure TLSDZForm.btnDetailClick(Sender: TObject);
var frmDetail:tlsdetailform;
    pfrm:tPositiveform;
    nfrm:tNegativeform;
    id:integer;
    bPositive:boolean;
    gfrm:tgermAnalysisForm;
begin
  dmym.LSADODataSet1.Active:=true;
  if dmym.LSADODataSet1['js']<>'00' then
    begin
      {frmDetail:=tDetailform.Create(self);
      frmdetail.showmodal;}
    end
  else
    begin
{      frmyx:=tfemform.create(self);
      //frmyx.newyx:=true;
      frmyx.showmodal;}
    end;
   if dmym.LSADODataSet1.recordcount>0 then
    begin
      id  :=1;
      if varisnull(dmym.LSADODataSet1['result']) then
      begin
        id:=dmym.LSADODataSet1['useid'];
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
           dmym.LSADODataSet1.Active:=false;
           dmym.LSADODataSet1.CommandText:='select * from Base order by repdate desc';
           //dmym.rsbase.CommandText:='select * from Base order by cypdate desc';
           dmym.LSADODataSet1.Active:=true;
        end else
        begin
           nfrm:=tNegativeForm.Create(self);
           nfrm.bOldPatient:=true;
           nfrm.ShowModal;
           dmym.LSADODataSet1.Active:=false;
           dmym.LSADODataSet1.CommandText:='select * from Base order by repdate desc';
           //dmym.rsbase.CommandText:='select * from Base order by cypdate desc';
           dmym.LSADODataSet1.Active:=true;
        end;
      end else
      begin
        frmDetail:=tLSdetailform.Create(self);
        frmdetail.showmodal;
      end;
    end
  else
    dmym.LSADODataSet1.close;
end;

procedure TLSDZForm.btnTotalRecClick(Sender: TObject);
begin
  dmym.LSADODataSet1.Active:=false;
  dmym.LSADODataSet1.CommandText:='select * from Base order by repdate desc';
  //dmym.rsbase.CommandText:='select * from Base order by cydate desc';
  dmym.LSADODataSet1.Active:=true;
end;

procedure TLSDZForm.FormShow(Sender: TObject);
begin
 BolBase:=true;
 if dmym.LSADODataSet1.recordcount>0 then // 初始化历史对照标本总数的记录；
    label1.Caption:='标本总数:'+inttostr(dmym.LSADODataset1.recordcount)
 else
    label1.Caption:='标本总数:'+inttostr(0);
end;

procedure TLSDZForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 BolBase:=false;
 action:=cafree;
end;

procedure TLSDZForm.btnDelClick(Sender: TObject);
var SQLtext:string;
    useid:integer;
begin
    if dmym.LSADODataSet1.recordcount<>0 then
    if messagebox(handle,'删除当前记录?','提示',mb_okcancel)=idok
     then
      begin
         useid:=dmym.LSADODataSet1['useId'];
         SQLtext:='delete from YpBase where useid='+inttostr(dmym.LSADODataSet1['useid']);
         dmym.conn.Execute(SQLtext);
         dmym.LSADODataSet1.Delete;
         label1.Caption:='标本总数:'+inttostr(dmym.LSADODataset1.recordcount);
      end
     else MessageDlg('没有记录可删除！',mtconfirmation,[mbok,mbcancel],0);

end;

end.
