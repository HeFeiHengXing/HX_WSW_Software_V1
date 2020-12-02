unit regYgSurfaceFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids, db, ADODB;

type
  TregYgSurfaceForm = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    dbe_specNumber: TDBEdit;
    dbe_room: TDBEdit;
    dbc_etype: TDBComboBox;
    dbc_sectionName: TDBComboBox;
    dbc_sampleDoctor: TDBComboBox;
    dbe_cDate: TDBEdit;
    DBComboBox1: TDBComboBox;
    GroupBox2: TGroupBox;
    btnAdd: TButton;
    btnDel: TButton;
    btnExit: TButton;
    btnSave: TButton;
    btnExtract: TButton;
    dbe_area: TDBEdit;
    lblGlass: TLabel;
    Label6: TLabel;
    ADOQuery1: TADOQuery;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnExtractClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbe_specNumberKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_etypeKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_areaKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_roomKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sectionNameKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sampleDoctorKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    datestr: string;
  public
    { Public declarations }
    bExtract, extracted: boolean;
    id: integer;
  end;

var
  regYgSurfaceForm: TregYgSurfaceForm;

implementation

uses dbym, helper, ymDataType, loginfrm;

{$R *.dfm}

procedure TregYgSurfaceForm.FormCreate(Sender: TObject);
begin
  dbe_area.DataSource := dmym.dsRegYg;
  dbe_area.DataField := 'area';
  bExtract := false;
  extracted := false;
end;

procedure TregYgSurfaceForm.FormShow(Sender: TObject);
var
  dh: dbhelper;
  strlist: tstringlist;
  str: string;
  Maxbbhair1: integer;
begin
  dmym.rsRegyg.active := false;
  dmym.rsRegyg.CommandText := 'select * from RegBBYngr where cylb="物体表面" order by cydate'; ;
  dmym.rsRegyg.active := true;
  dmym.rsRegYg.Edit;
  dmym.rsRegYg.FieldValues['cylb'] := '物体表面';
  dh := dbhelper.create;
  strlist := tstringlist.Create;

  dbcombobox1.ItemIndex := 1;
  dbcombobox1.Enabled := false;

  dh.getCheckMan(strlist);
  dbc_sampleDoctor.Items := strlist;
  strlist.clear;

  dh.getSection(strlist);
  dbc_sectionName.Items := strlist;
  strlist.Clear;

  strlist.Free;

   {with dmym.query1 do   //初始化标本号
      begin
      close;
      sql.Clear;
      sql.Add('select specNum from RegBBYngr');
      open;
      end;
      if dmym.query1.RecordCount>0 then
      begin
         with dmym.query1 do
        //bbh:=strtoint(bbh)
          begin
          close;
          sql.Clear;
          sql.Add('select max(specNum) as Maxbbhair from RegBBYngr');
          open;
          end;
          Maxbbhair1:=dmym.query1.Fieldbyname('Maxbbhair').AsInteger;
           if  (Maxbbhair1+1)<>0 then
             Maxbbhair1:=(Maxbbhair1+1)
           else
             Maxbbhair1 :=0;
           end else
             Maxbbhair1:=0;
          dbe_specNumber.text:=inttostr(Maxbbhair1);//初始化标本号 }
  if bextract then
    btnExtract.Enabled := true
  else
    btnExtract.Enabled := false;

  if dmym.rsRegYg.RecordCount <> 0 then //初始化标本记录总数
    label6.caption := '标本总数:' + inttostr(dmym.rsRegYg.RecordCount)
  else
  begin
    label6.caption := '标本总数:' + inttostr(0);
    dmym.rsRegyg.Edit;
    if timetype = 'now' then
      dmym.rsRegyg['cydate'] := now
    else
      dmym.rsRegyg['cydate'] := date;
    datestr := dbe_cDate.Text;
  end;
end;




procedure TregYgSurfaceForm.btnAddClick(Sender: TObject);
var
  Maxbbhair: string;
  Maxbbhair1: integer;
begin
  if dbe_specNumber.text = '' then
  begin
    showmessage('请输入标本号！');
    dbe_specNumber.SetFocus;
    exit;
  end;
  if dbe_cdate.text = '' then
  begin
    messagedlg('请输入日期!', mtwarning, [mbok], 0);
    dbe_cdate.SetFocus;
    exit;
  end;
  dmym.rsRegyg.append;
  if timetype = 'now' then
    dmym.rsRegyg['cyDate'] := now
  else
    dmym.rsRegyg['cyDate'] := date;
  dmym.rsRegyg['CYlb'] := '物体表面';
  DBComboBox1.Text := '物体表面';

  {with dmym.query1 do
      begin
      close;
      sql.Clear;
      sql.Add('select specNum from RegBBYngr');
      open;
      end;
      if dmym.query1.RecordCount>0 then
      begin
         with dmym.query1 do
        //bbh:=strtoint(bbh)
          begin
          close;
          sql.Clear;
          sql.Add('select max(specNum) as Maxbbhair from RegBBYngr');
          open;
          end;
          Maxbbhair1:=dmym.query1.Fieldbyname('Maxbbhair').AsInteger;
           if  (Maxbbhair1+1)<>0 then
             Maxbbhair1:=(Maxbbhair1+1)
           else
             Maxbbhair1 :=0;
           end else
             Maxbbhair1:=0;
          dbe_specNumber.text:=inttostr(Maxbbhair1);}
//##############
  dbe_specNumber.SetFocus;
end;


procedure TregYgSurfaceForm.btnSaveClick(Sender: TObject);
begin
  if dbe_specNumber.text = '' then
  begin
    showmessage('请输入标本号！');
    dbe_specNumber.SetFocus;
    exit;
  end;
  if dbe_cdate.text = '' then
  begin
    messagedlg('请输入日期!', mtwarning, [mbok], 0);
    dbe_cdate.SetFocus;
    exit;
  end;
  if (dmym.rsRegyg.state = dsedit) or (dmym.rsRegyg.state = dsInsert) then
  begin
    dmym.rsRegYg['cylb'] := '物体表面';
    dmym.rsRegyg.Post;
    label6.Caption := '标本总数:' + inttostr(dmym.rsRegYg.recordcount);
     //btnSave.Enabled:=false;
  end;
end;

procedure TregYgSurfaceForm.btnDelClick(Sender: TObject);
begin
  if dmym.rsRegYg.recordcount <> 0 then
  begin
    if MessageDlg('确定删除吗？', mtConfirmation, [mbOk, mbCancel], 0) = mrOK then
      dmym.rsRegyg.Delete;
    label6.Caption := '标本总数:' + inttostr(dmym.rsRegYg.recordcount);
  end else
    messagebox(0, '没有记录可删除！', '提示', mb_okcancel);
end;


procedure TregYgSurfaceForm.btnExtractClick(Sender: TObject);
begin
  id := dmym.rsRegYg['id'];
  with dmym.exquery do
  begin
    close;
    sql.clear;
    sql.add('select * from regbbyngr ');
    sql.add('where id=:id');
    parameters.parambyname('id').value := id;
    open;

  end;
  extracted := true;
  close;
end;

procedure TregYgSurfaceForm.btnExitClick(Sender: TObject);
begin
  dmym.rsRegyg.Active := false;
  close;
end;

procedure TregYgSurfaceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmym.rsRegyg.Active := false;
end;

procedure TregYgSurfaceForm.dbe_specNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (((key >= #48) and (key <= #57)) or (key = #8) or (key = #13)) then
    key := #0
  else
    if key = #13 then
      dbc_etype.SetFocus;
end;

procedure TregYgSurfaceForm.dbc_etypeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    if dbc_etype.text <> '' then
    begin
      if (dbc_etype.text = '1') or (dbc_etype.text = '01') then
        dbc_etype.text := 'I';
      if (dbc_etype.text = '2') or (dbc_etype.text = '02') then
        dbc_etype.text := 'II';
      if (dbc_etype.text = '3') or (dbc_etype.text = '03') then
        dbc_etype.text := 'III';
      if (dbc_etype.text = '4') or (dbc_etype.text = '04') then
        dbc_etype.text := 'IV';
    end;
    dbc_sectionname.setfocus;
  end;
end;

procedure TregYgSurfaceForm.dbe_areaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    dbc_sampleDoctor.SetFocus;
end;

procedure TregYgSurfaceForm.dbe_roomKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    dbe_area.SetFocus;
end;

procedure TregYgSurfaceForm.DBComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    dbc_sectionName.SetFocus;
end;

procedure TregYgSurfaceForm.dbc_sectionNameKeyPress(Sender: TObject;
  var Key: Char);
var secid, SQLText: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbc_sectionName.Text <> '' then
    begin
      SQLText := 'select * from secname';
      secid := dbc_sectionName.Text;
      with ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where secid=:secid');
        parameters.parambyname('secid').value := secid;
        open;
        if ADOQuery1.RecordCount <> 0 then
          dbc_sectionName.Text := ADOQuery1.FieldValues['secname'];
      end;
    end;
    dbe_room.setfocus;
  end;
end;

procedure TregYgSurfaceForm.dbc_sampleDoctorKeyPress(Sender: TObject;
  var Key: Char);
var ID, SQLText: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbc_sampleDoctor.Text <> '' then
    begin
      SQLText := 'select * from checkman';
      ID := dbc_sampleDoctor.Text;
      with ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ID=:ID');
        parameters.parambyname('ID').value := ID;
        open;
        if ADOQuery1.RecordCount > 0 then
          dbc_sampleDoctor.Text := ADOQuery1.FieldValues['name'];
      end;
    end;
  end;
end;

procedure TregYgSurfaceForm.Button1Click(Sender: TObject);
var dataclass: dbhelper;
begin
  dataclass := dbhelper.Create;
  dmym.rsRegYg['specnum'] := dataclass.generateNumber('hosno');
  dataclass.Free;
end;

end.
