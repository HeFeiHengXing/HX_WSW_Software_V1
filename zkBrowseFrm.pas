unit zkBrowseFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, RpCon, RpConDS, RpBase, RpSystem,
  RpDefine, RpRave, DB, ADODB, Mask, DBCtrls;

type
  TzkBrowseForm = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    btndetail: TButton;
    btnDel: TButton;
    btnPrint: TButton;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    rvZkAll: TRvDataSetConnection;
    DelectYP: TADOQuery;
    conn: TADOConnection;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure btnDelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btndetailClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  zkBrowseForm: TzkBrowseForm;

implementation

uses dbym, zkAnalysisfrm, common, detailfrm;

{$R *.dfm}

procedure TzkBrowseForm.btnDelClick(Sender: TObject);
var SQLtext:string;
    useid:integer;
begin
    if dmym.rsBaseZk.recordcount<>0 then
    begin
        if messageDlg('确认删除吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
        begin
            Edit1.Text:=dmym.rsbasezk['useid'];
            useid:=dmym.rsbasezk['useid'];
            SQLtext:='delete from YpBaseZK where useid='+inttostr(dmym.rsbasezk['useid']);
            dmym.conn.Execute(SQLtext);
            SQLtext:='delete from ypaddzk where useid='+inttostr(dmym.rsbasezk['useid']);
            dmym.conn.Execute(SQLtext);
            dmym.rsbasezk.delete;
            label1.Caption:='标本总数:'+inttostr(dmym.rsbasezk.recordcount);
        end
    end
    else
      MessageDlg('没有记录可删除！',mtconfirmation,[mbok,mbcancel],0);
end;

procedure TzkBrowseForm.FormShow(Sender: TObject);
begin
    if not dmym.rsBasezk.active then
    begin
     dmym.rsbasezk.Active:=true;
    end;
    if dmym.rsBaseZk.recordcount<>0 then
       label1.Caption:='标本总数:'+inttostr(dmym.rsbasezk.recordcount)
    else
       label1.Caption:='标本总数:'+inttostr(0);
end;

procedure TzkBrowseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmym.rsbasezk.Active:=false;
  action:=cafree;
end;

procedure TzkBrowseForm.FormCreate(Sender: TObject);
begin
   rvproject1.ProjectFile:=rvfile;
end;

procedure TzkBrowseForm.btnPrintClick(Sender: TObject);
begin
   rvproject1.Open;
   rvproject1.ExecuteReport('report_zkall');
   rvproject1.Close;
end;

procedure TzkBrowseForm.btndetailClick(Sender: TObject);
var
   zfrm:tzkAnalysisForm;
   TableName:string;
begin
  //dmym.rsbasezk.CommandText:=;
  //dmym.rsBasezk.Active:=true;
  {zfrm:=tzkAnalysisForm.create(self);
  zfrm.bnewPatient:=false;
  //dmym.rsBasezk.Active:=true;
  //zfrm.iniform;
  zfrm.showmodal;
  zfrm.Free;}
  //close;
    tablename:=dmym.rsAddTemp.TableName;
    dmym.rsAddtemp.TableName:='ypaddzk';
    dmym.rsAddTemp.close;
    dmym.rsAddTemp.Filter:='useid='+inttostr(dmym.rsBasezk['useid']);
    dmym.rsAddTemp.Filtered:=true;
    dmym.rsAddTemp.Open;
    zfrm:=tzkAnalysisForm.create(self);
    zfrm.bnewPatient:=false;
      //gfrm.iniform;
    zfrm.saved:=true;
    zfrm.showmodal;
    zfrm.Free;
    dmym.rsAddTemp.Close;
    dmym.rsAddTemp.TableName:=tablename;
    dmym.rsAddTemp.Filtered:=false;
end;

procedure TzkBrowseForm.Button1Click(Sender: TObject);
var aform:Tdetailform;
begin
    aform:=Tdetailform.Create(self);
    aform.bezk:=true;
    aform.ShowModal;
end;

end.
