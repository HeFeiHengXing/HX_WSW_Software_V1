unit regYgSurgeryfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids, db, ADODB;

type
  TRegSurgeryform = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    dbe_specNumber: TDBEdit;
    dbe_room: TDBEdit;
    dbc_sectionName: TDBComboBox;
    GroupBox2: TGroupBox;
    btnAdd: TButton;
    btnDel: TButton;
    btnExit: TButton;
    btnSave: TButton;
    dbc_sampleDoctor: TDBComboBox;
    Label8: TLabel;
    dbe_cDate: TDBEdit;
    DBComboBox1: TDBComboBox;
    btnExtract: TButton;
    ZFX_YX: TADOQuery;
    ADOQuery1: TADOQuery;
    Label11: TLabel;
    ADOQuery2: TADOQuery;
    Button1: TButton;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    dbc_area: TComboBox;
    dbc_grade: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExtractClick(Sender: TObject);
    procedure dbe_specNumberKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sectionNameKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_roomKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_etypeKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sampleDoctorKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure dbc_gradeChange(Sender: TObject);
    procedure dbc_areaChange(Sender: TObject);
    procedure dbc_areaKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_gradeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    datestr: string;
  public
    { Public declarations }
    bExtract: boolean;
    extracted: boolean;
    ygtype: integer; //0--input;1--air;2--surface;3--hand;4--medicine;5--liquid
  end;

var
  RegSurgeryform: TRegSurgeryform;

implementation

uses ymDataType, YgAirFrm, loginfrm, dbym;

{$R *.dfm}

procedure TRegSurgeryform.FormShow(Sender: TObject);

var
  dh: dbhelper;
  strlist: tstringlist;
  str: string;
  Maxbbhair1: integer;
begin
  dmym.rsRegyg.Active := false;
  dmym.rsRegyg.CommandText := 'select * from RegBBYngr where cylb="手术室" order by cydate';
  dmym.rsRegyg.active := true;
  dmym.rsRegYg.Edit;
  dmym.rsRegYg.FieldValues['cylb'] := '手术室';
  dh := dbhelper.create;
  strlist := tstringlist.Create;

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
          dbe_specNumber.text:=inttostr(Maxbbhair1);//初始化标本号}

  // btnSave.Enabled:=false;
  if bExtract then
  begin
    btnExtract.Enabled := true;
  end else
    btnExtract.enabled := false;

  if dmym.rsRegYg.recordcount <> 0 then
    label11.caption := '标本总数:' + inttostr(dmym.rsRegYg.recordcount)
  else
  begin
    label11.caption := '标本总数:' + inttostr(0);
    dmym.rsRegyg.Edit;
    if timetype = 'now' then
      dmym.rsRegyg['cydate'] := now
    else
      dmym.rsRegyg['cydate'] := date;
    datestr := dbe_cDate.Text;
  end;
end;

procedure TRegSurgeryform.btnAddClick(Sender: TObject);
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
  dmym.rsRegyg['CYlb'] := '手术室';
  DBComboBox1.Text := '手术室';

//########
     { with dmym.query1 do
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
  dbe_specNumber.SetFocus;
end;

procedure TRegSurgeryform.btnSaveClick(Sender: TObject);
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
    dmym.rsRegyg['CYlb'] := '手术室';
    DBComboBox1.Text := '手术室';
    dmym.rsRegyg.Post;
    dmym.rsRegyg.Refresh;
        //btnSave.Enabled:=false;
    label11.caption := '标本总数:' + inttostr(dmym.rsRegYg.RecordCount);
  end;
end;

procedure TRegSurgeryform.btnModifyClick(Sender: TObject);
begin
  dmym.rsRegyg.Edit;
  btnSave.Enabled := true;
end;

procedure TRegSurgeryform.btnDelClick(Sender: TObject);
begin
  if dmym.rsRegYg.RecordCount <> 0 then
  begin
    if MessageDlg('确定删除吗？', mtConfirmation, [mbOk, mbCancel], 0) = mrOK then
      dmym.rsRegyg.Delete;
    label11.caption := '标本总数:' + inttostr(dmym.rsRegYg.RecordCount);
  end
  else
    Messagebox(handle, '没有记录可删除！', '提示', mb_okcancel);
  label11.caption := '标本总数:' + inttostr(0);
end;

procedure TRegSurgeryform.btnExitClick(Sender: TObject);
begin
  dmym.rsRegyg.Active := false;
  close;
end;

procedure TRegSurgeryform.FormCreate(Sender: TObject);
begin
  ygtype := 1;
  bExtract := false;
  extracted := false;
end;

procedure TRegSurgeryform.btnExtractClick(Sender: TObject);
var
  id: integer;
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

  if dmym.rsRegYg.RecordCount <> 0 then //初始化标本记录总数
    label11.caption := '标本总数:' + inttostr(dmym.rsRegYg.RecordCount)
  else
    label11.Caption := '标本总数:' + inttostr(0);
end;



procedure TRegSurgeryform.dbe_specNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (((key >= #48) and (key <= #57)) or (key = #8) or (key = #13)) then
    key := #0
  else
    if key = #13 then
      dbc_grade.SetFocus;
end;

procedure TRegSurgeryform.dbc_sectionNameKeyPress(Sender: TObject; var Key: Char);
var i: integer;
begin
  if key = #13 then
  begin
    if dbc_sectionName.text <> '' then
    begin
      for i := 1 to dbc_sectionName.Items.Count do
        if (dbc_sectionName.text = inttostr(i)) or (dbc_sectionName.text = '0' + inttostr(i)) then
          dbc_sectionName.ItemIndex := i - 1;
    end;
    dbe_room.setfocus;
  end;
end;

procedure TRegSurgeryform.dbe_roomKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBcombobox1.SetFocus;

end;

procedure TRegSurgeryform.dbc_etypeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if dbc_grade.text <> '' then
    begin
      if (dbc_grade.text = '1') or (dbc_grade.text = '01') then
        dbc_grade.text := 'I';
      if (dbc_grade.text = '2') or (dbc_grade.text = '02') then
        dbc_grade.text := 'II';
      if (dbc_grade.text = '3') or (dbc_grade.text = '03') then
        dbc_grade.text := 'III';
      if (dbc_grade.text = '4') or (dbc_grade.text = '04') then
        dbc_grade.text := 'IV';
    end;
    dbc_area.setfocus;
  end;
end;

procedure TRegSurgeryform.dbc_sampleDoctorKeyPress(Sender: TObject;
  var Key: Char);
var i: integer;
begin
  if key = #13 then
  begin
    if dbc_sampleDoctor.Text <> '' then
    begin
      for i := 1 to dbc_sampleDoctor.Items.Count do
        if (dbc_sampleDoctor.text = inttostr(i)) or (dbc_sampleDoctor.text = '0' + inttostr(i)) then
          dbc_sampleDoctor.ItemIndex := i - 1;
    end;
    dbe_cDate.SetFocus;
  end;
end;

procedure TRegSurgeryform.Button1Click(Sender: TObject);
var dataclass: dbhelper;
begin
  dataclass := dbhelper.Create;
  dmym.rsRegYg['specnum'] := dataclass.generateNumber('hosno');
  dataclass.Free;
end;

procedure TRegSurgeryform.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    dbc_sampleDoctor.SetFocus;
end;

procedure TRegSurgeryform.dbc_gradeChange(Sender: TObject);
begin
  if dbc_grade.Text = 'IV' then
  begin
    dbc_area.Text := '';
    dbc_area.Enabled := false;
    dmym.rsHospital['hjlb'] := 'IV'
  end else
    dbc_area.Enabled := true;
end;

procedure TRegSurgeryform.dbc_areaChange(Sender: TObject);
begin
  dmym.rsRegYg['hjlb'] := dbc_grade.Text + '-' + dbc_area.Text
end;

procedure TRegSurgeryform.dbc_areaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if dbc_area.text <> '' then
    begin
      if (dbc_area.text = '1') or (dbc_area.text = '01') then
        dbc_area.text := 'I';
      if (dbc_area.text = '2') or (dbc_area.text = '02') then
        dbc_area.text := 'II';
    end;
    dbc_sectionname.setfocus;
  end;
end;

procedure TRegSurgeryform.dbc_gradeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    if dbc_grade.text <> '' then
    begin
      if (dbc_grade.text = '1') or (dbc_grade.text = '01') then
        dbc_area.text := 'I';
      if (dbc_grade.text = '2') or (dbc_grade.text = '02') then
        dbc_grade.text := 'II';
      if (dbc_grade.text = '3') or (dbc_grade.text = '03') then
        dbc_grade.text := 'III';
      if (dbc_grade.text = '4') or (dbc_grade.text = '04') then
        dbc_grade.text := 'IV';
    end;
    dbc_area.setfocus;
  end;
end;

end.
