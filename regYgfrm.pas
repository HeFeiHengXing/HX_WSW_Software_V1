unit regYgfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids, db, ADODB;

type
  TregYgform = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    dbe_specNumber: TDBEdit;
    dbe_room: TDBEdit;
    dbc_etype: TDBComboBox;
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
  regYgform: TregYgform;

implementation

uses dbym, ymDataType, YgAirFrm, loginfrm;

{$R *.dfm}

procedure TregYgform.FormShow(Sender: TObject);

var
  dh: dbhelper;
  strlist: tstringlist;
  str: string;
  Maxbbhair1: integer;
begin
   {case ygtype of
      0:
         str:='select * from RegBBYngr';
      1: }
  str := 'select * from RegBBYngr where cylb="����" order by cydate';
     { 2:
         str:='select * from RegBBYngr where cylb="�������"';
      3:
         str:='select * from RegBBYngr where cylb="ҽ����Ա��"';
      4:
         str:='select * from RegBBYngr where cylb="ҽ������"';
      5:
         str:='select * from RegBBYngr where cylb="����Һ�뱣��Һ"';
   end;}
  dmym.rsRegyg.CommandText := str;
  dmym.rsRegyg.active := true;
  dmym.rsRegYg.Edit;
  dmym.rsRegYg.FieldValues['cylb'] := '����';
  dh := dbhelper.create;
  strlist := tstringlist.Create;

  dh.getCheckMan(strlist);
  dbc_sampleDoctor.Items := strlist;
  strlist.clear;

  dh.getSection(strlist);
  dbc_sectionName.Items := strlist;
  strlist.Clear;
  strlist.Free;

   {with dmym.query1 do   //��ʼ���걾��
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
          dbe_specNumber.text:=inttostr(Maxbbhair1);//��ʼ���걾��}

  // btnSave.Enabled:=false;
  if bExtract then
  begin
    btnExtract.Enabled := true;
  end else
    btnExtract.enabled := false;

  if dmym.rsRegYg.recordcount <> 0 then
    label11.caption := '�걾����:' + inttostr(dmym.rsRegYg.recordcount)
  else
  begin
    label11.caption := '�걾����:' + inttostr(0);
    dmym.rsRegyg.Edit;
    if timetype = 'now' then
      dmym.rsRegyg['cydate'] := now
    else
      dmym.rsRegyg['cydate'] := date;
    datestr := dbe_cDate.Text;
  end;
end;

procedure TregYgform.btnAddClick(Sender: TObject);
var
  Maxbbhair: string;
  Maxbbhair1: integer;
begin
  if dbe_specNumber.text = '' then
  begin
    showmessage('������걾�ţ�');
    dbe_specNumber.SetFocus;
    exit;
  end;
  if dbe_cdate.text = '' then
  begin
    messagedlg('����������!', mtwarning, [mbok], 0);
    dbe_cdate.SetFocus;
    exit;
  end;
  dmym.rsRegyg.append;
  if timetype = 'now' then
    dmym.rsRegyg['cyDate'] := now
  else
    dmym.rsRegyg['cyDate'] := date;
  dmym.rsRegyg['CYlb'] := '����';
  DBComboBox1.Text := '����';

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

procedure TregYgform.btnSaveClick(Sender: TObject);
begin
  if dbe_specNumber.text = '' then
  begin
    showmessage('������걾�ţ�');
    dbe_specNumber.SetFocus;
    exit;
  end;
  if dbe_cdate.text = '' then
  begin
    messagedlg('����������!', mtwarning, [mbok], 0);
    dbe_cdate.SetFocus;
    exit;
  end;
  if (dmym.rsRegyg.state = dsedit) or (dmym.rsRegyg.state = dsInsert) then
  begin
    dmym.rsRegyg['CYlb'] := '����';
    DBComboBox1.Text := '����';
    dmym.rsRegyg.Post;
        //btnSave.Enabled:=false;
    label11.caption := '�걾����:' + inttostr(dmym.rsRegYg.RecordCount);
  end;
end;

procedure TregYgform.btnModifyClick(Sender: TObject);
begin
  dmym.rsRegyg.Edit;
  btnSave.Enabled := true;
end;

procedure TregYgform.btnDelClick(Sender: TObject);
begin
  if dmym.rsRegYg.RecordCount <> 0 then
  begin
    if MessageDlg('ȷ��ɾ����', mtConfirmation, [mbOk, mbCancel], 0) = mrOK then
      dmym.rsRegyg.Delete;
    label11.caption := '�걾����:' + inttostr(dmym.rsRegYg.RecordCount);
  end
  else
    Messagebox(handle, 'û�м�¼��ɾ����', '��ʾ', mb_okcancel);
  label11.caption := '�걾����:' + inttostr(0);
end;

procedure TregYgform.btnExitClick(Sender: TObject);
begin
  dmym.rsRegyg.Active := false;
  close;
end;

procedure TregYgform.FormCreate(Sender: TObject);
begin
  ygtype := 1;
  bExtract := false;
  extracted := false;
end;

procedure TregYgform.btnExtractClick(Sender: TObject);
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

  if dmym.rsRegYg.RecordCount <> 0 then //��ʼ���걾��¼����
    label11.caption := '�걾����:' + inttostr(dmym.rsRegYg.RecordCount)
  else
    label11.Caption := '�걾����:' + inttostr(0);
end;



procedure TregYgform.dbe_specNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (((key >= #48) and (key <= #57)) or (key = #8) or (key = #13)) then
    key := #0
  else
    if key = #13 then
      dbc_etype.SetFocus;
end;

procedure TregYgform.dbc_sectionNameKeyPress(Sender: TObject; var Key: Char);
var secid, SQLText: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbc_sectionName.Text <> '' then
    begin
      SQLText := 'select * from secname';
      secid := dbc_sectionName.Text;
      with ZFX_YX do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where secid=:secid');
        parameters.parambyname('secid').value := secid;
        open;
        if ZFX_YX.RecordCount <> 0 then
          dbc_sectionName.Text := ZFX_YX.FieldValues['secname'];
      end;
    end;
    dbe_room.setfocus;
  end;
end;

procedure TregYgform.dbe_roomKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    dbc_sampleDoctor.SetFocus;

end;

procedure TregYgform.dbc_etypeKeyPress(Sender: TObject; var Key: Char);
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

procedure TregYgform.dbc_sampleDoctorKeyPress(Sender: TObject;
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
      with ZFX_YX do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ID=:ID');
        parameters.parambyname('ID').value := ID;
        open;
        if ZFX_YX.RecordCount > 0 then
          dbc_sampleDoctor.Text := ZFX_YX.FieldValues['name'];
      end;
    end;
    dbe_cDate.SetFocus;
  end;
end;

procedure TregYgform.Button1Click(Sender: TObject);
var dataclass: dbhelper;
begin
  dataclass := dbhelper.Create;
  dmym.rsRegYg['specnum'] := dataclass.generateNumber('hosno');
  dataclass.Free;
end;

procedure TregYgform.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    dbc_sampleDoctor.SetFocus;
end;

end.
