unit germAnalysisFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, ymDataType, Grids,
  DBGrids, helper, db, adodb, RpCon, RpConDS, RpBase, RpSystem, RpDefine,
  RpRave, inifiles, rvproj, rvclass, rvcsdata, rvcsrpt, rvcsstd, rvcsdraw,
  rvdirectdataview, strutils, TFlatEditUnit, TFlatComboBoxUnit, comobj;

type
  TgermAnalysisForm = class(TForm)
    gbNameInfo: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    btnExtract: TButton;
    Panel1: TPanel;
    gbInput: TGroupBox;
    GroupBox1: TGroupBox;
    btnStartScan: TBitBtn;
    dbe_name: TDBEdit;
    Label6: TLabel;
    dbe_age: TDBEdit;
    Label7: TLabel;
    dbe_zyh: TDBEdit;
    Label8: TLabel;
    dbe_bed: TDBEdit;
    Label9: TLabel;
    dbc_section: TDBComboBox;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    dbc_bb: TDBComboBox;
    Label11: TLabel;
    dbc_sex: TDBComboBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dbe_repdate: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    dbc_sj: TDBComboBox;
    dbc_reporter: TDBComboBox;
    Label17: TLabel;
    dbc_sjmd: TDBComboBox;
    dbc_shys: TDBComboBox;
    Label18: TLabel;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Panel2: TPanel;
    btnExit: TBitBtn;
    Bevel1: TBevel;
    btnAnalysis: TButton;
    GroupBox5: TGroupBox;
    DBGrid1: TDBGrid;
    lbGermStdCode: TLabel;
    lbJzName: TLabel;
    dbe_jzname: TDBEdit;
    lblCode: TLabel;
    btnYmAnalysis: TButton;
    dbm_jj: TDBMemo;
    dbm_conclusion: TDBMemo;
    GroupBox6: TGroupBox;
    sGrid: TStringGrid;
    btnPrint: TButton;
    btnSave: TButton;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    rvGermAnalysis: TRvDataSetConnection;
    rvyp: TRvDataSetConnection;
    rsYptable: TADODataSet;
    btnAppend: TBitBtn;
    rvYpAdd: TRvDataSetConnection;
    dbe_bbh: TDBEdit;
    Button1: TButton;
    ZFX_PrintQuery: TADOQuery;
    ADODataSet1: TADODataSet;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    ZFX_jsdbe: TDBEdit;
    ZFX_junshu: TADOQuery;
    ZFX_bblx: TADOQuery;
    ZFX_shry: TADOQuery;
    ZFX_sjmd: TADOQuery;
    ZFX_kebie: TADOQuery;
    ZFX_bgry: TADOQuery;
    ZFX_sjry: TADOQuery;
    ZFX_xingbie: TADOQuery;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    DataSource6: TDataSource;
    DataSource7: TDataSource;
    DataSource8: TDataSource;
    ZFX_xingbieDBE: TDBEdit;
    ZFX_sjryDBE: TDBEdit;
    ZFX_bgryDBE: TDBEdit;
    ZFX_kebieDBE: TDBEdit;
    ZFX_sjmdDBE: TDBEdit;
    ZFX_shryDBE: TDBEdit;
    ZFX_bblxDBE: TDBEdit;
    ADOQuery3: TADOQuery;
    Label3: TLabel;
    Edit12: TEdit;
    Label5: TLabel;
    DBC_age: TDBComboBox;
    dbe_lczd: TDBComboBox;
    BtnHistory: TButton;
    Label19: TLabel;
    Label20: TLabel;
    dbe_cydate: TDBEdit;
    cb_germtype: TComboBox;
    ZFX_YX: TADOQuery;
    Edit1: TDBEdit;
    Button2: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn1: TBitBtn;
    ypchange: TADODataSet;
    Button3: TButton;
    IsPrintCombox: TComboBox;
    helpedit: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure btnStartScanClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure setJs;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAnalysisClick(Sender: TObject);
    procedure btnYmAnalysisClick(Sender: TObject);
    procedure btnExtractClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure dbe_jznameClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnAppendClick(Sender: TObject);
    procedure rsYptableAfterOpen(DataSet: TDataSet);
    procedure dbe_jznameChange(Sender: TObject);
    procedure dbe_bbhKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_nameKeyPress(Sender: TObject; var Key: Char);
    procedure sGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sGridTopLeftChanged(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IsprintComboxChange(Sender: TObject);
    procedure IsprintComboxExit(Sender: TObject);
    procedure IsprintComboxClick(Sender: TObject);
    procedure cb_germtypeKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_ageKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sexKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_bedKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sectionKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_zyhKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_bbKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sjKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_reporterKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sjmdKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_shysKeyPress(Sender: TObject; var Key: Char);
    procedure cb_germtype1Exit(Sender: TObject);
    procedure dbc_bbClick(Sender: TObject);
    procedure DBC_ageKeyPress(Sender: TObject; var Key: Char);
    procedure BtnHistoryClick(Sender: TObject);
    procedure dbe_lczdKeyPress(Sender: TObject; var Key: Char);
    procedure cb_germtypeClick(Sender: TObject);
    procedure cb_germtypeExit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbc_sectionExit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);

 //  procedure DelphiTwain1TwainAcquire(Sender: TObject;
 //  const Index: Integer; Image: TBitmap; var Cancel: Boolean);
   //procedure DelphiTwain1SourceSetupFileXfer(Sender: TObject;
 //  const Index: Integer);


  private
    { Private declarations }
    dbe_jznameChge, Bbbjljs: boolean;
    js: string;
    jzname: string;
    hpr: zHelper;
    expert: string; //ר��ϵͳ���
    bHumanInput, bNoScanInput: boolean;
    saved: boolean;
    globalstrarray: array[0..30] of string;
  public
    { Public declarations }
    bbId: integer;
    Dname: string; //�����ؼ�
    SQLText: string;
    helpi, helpj: integer;
    bNewPatient: boolean;
    chkboxes: array[1..30] of tcheckbox; //������Ӧ
    lbContent: array[1..24] of tlabel; //24������ҩƷ��ǩ
    lbComplement: array[1..6] of tlabel; //6 ��of������ǩ
    zDbHelper: dbhelper;
    ymChkboxes: array[1..3, 1..24] of tcheckbox; //ҩ����Ӧ��Checkbox
    bioLabel: array[1..30] of TLabel;
    ymlabel: array[1..6] of tlabel;
    ymlabel2: array[1..24] of tlabel;
    useid: integer;
    function vstring(s: string): string;
    procedure createContentLabel(gtype: string); //�������������ʱ�ǩ
    procedure createCheckbox;
    procedure createComplementLabel(gtype: string); //�������ӿ׵����ʱ�ǩ
    procedure ComplementCheckbox;
    procedure createYmCheckbox;
    procedure setYmCheckbox;
    procedure CreateBioLabel;
    procedure createBioAddLabel;
    procedure createYmLabel;
    procedure createYmLabel2;
    function isNewPatient(bno: string): boolean; //
    procedure addBaseNewRecord;
    procedure updateBioCheckbox(ofispositive: boolean; bioispositive: array of boolean);
    function getid: integer;
    procedure initGrid;
    procedure updateGrid;
    procedure updateGridFromYpBase(id: integer);
    procedure initGUI;
    procedure informationsave;
    procedure print;
    procedure ExportWord;
  end;
function convertstring(source: string): string;
var
  germAnalysisForm: TgermAnalysisForm;

implementation

uses dbym, common, Meds, Bio, regBBfrm, appendYpfrm, ZFX_XiTong, detailfrm, totalfrm, loginfrm, LSDZFrm, colorfrm,
  DISet, MedReport, flash, sreport;

{$R *.dfm}

procedure TgermAnalysisForm.Button2Click(Sender: TObject);
var afrm: Tcolorform;
begin
  if cb_germtype.text = '' then
    showmessage('��ѡ�����')
  else
  begin
    afrm := Tcolorform.Create(self);
    afrm.germtype := cb_germtype.Text;
    afrm.germleft := left;
    afrm.germtop := top;
    afrm.Show;
  end;
end;

procedure TgermAnalysisForm.createContentLabel(gtype: string);
var
  i, j: integer;
  k: integer; //ָʾ�����ֶ�b1��λ��
  w, h: integer;

begin
  w := trunc((panel1.Width - 160) / 13);
  h := trunc(panel1.Height / 3);
   //release the old tlabels
  for i := 1 to 24 do
  begin
    if not (lbcontent[i] = nil) then
      lbcontent[i].Free;
  end;
   //create 24 tlabels
  for i := 1 to 24 do
    lbContent[i] := tlabel.create(self);
   //first read contents from 'board'-table
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('select * from board where js=:gtype and btype=2 order by bjs');
    parameters.parambyname('gtype').value := gtype;
    open;
      //move to the second record;
    first;
      //next;
      //@end
    k := fieldbyname('b1').fieldno - 1;
    for i := 1 to 2 do
      for j := 1 to 12 do
      begin
        with lbcontent[j + (i - 1) * 12] do
        begin
          parent := panel1;
          if fields[k].asstring = '' then
            caption := ''
          else
            caption := convertstring(trim(fields[k].asstring));
          if (j + (i - 1) * 12) > 12 then
            left := 31 + (j + (i - 1) * 12 - 13) * w
          else
            left := 31 + (j + (i - 1) * 12 - 1) * w;
          if (j + (i - 1) * 12) > 12 then
            top := h + 60
          else
            top := h - 40;
          autosize := true;
          visible := true;
          inc(k);
        end;
      end;
  end;
end;

function TgermAnalysisForm.vstring(s: string): string;
var
  vstr: string;
  i, len: integer;
  cc: byte;
begin
  vstr := '';
  len := length(s);
  i := 1;
  while (i <= len) do
  begin
    cc := ord(s[i]);
    if (cc > 160) then
    begin
      vstr := vstr + s[i] + s[i + 1] + ''#13'';
      i := i + 2;
    end else
    begin
      vstr := vstr + s[i] + ''#13'';
      i := i + 1;
    end;
  end;
  result := vstr;
end;

procedure tGermAnalysisForm.CreateCheckbox;
var
  i, j: integer;
  w, h: integer;
begin
  w := trunc((panel1.Width - 160) / 13);
  h := trunc(panel1.Height / 3);
  for i := 1 to 30 do
    chkboxes[i] := tcheckbox.Create(self);
  for i := 1 to 2 do
    for j := 1 to 12 do
    begin
      with chkboxes[j + (i - 1) * 12] do
      begin
        parent := panel1;
        if (j + (i - 1) * 12) > 12 then
          Left := 30 + (j + (i - 1) * 12 - 13) * w
        else
          Left := 30 + (j + (i - 1) * 12 - 1) * w;
        if (j + (i - 1) * 12) > 12 then
          Top := 42 + (i - 1) * h
        else
          Top := 20 + (i - 1) * h;
        // Alignment:=taleftJustify;
        //caption:=inttostr(j+(i-1)*12);
        width := 30;
        visible := true;
      end;
    end;
end;

procedure TgermAnalysisForm.createComplementLabel(gtype: string);
var
  i, k: integer;
  h: integer;
  j: integer;
  str: string;
begin
  for i := 1 to 6 do
    lbComplement[i].Free;
  h := trunc((gbinput.height - 10) / 6);
   //����6��������ǩ
  for i := 1 to 6 do
    lbComplement[i] := tlabel.create(self);
  with dmym.query1 do
  begin
    close;
    sql.Clear;
    sql.add('select * from board where js=:gtype and btype=2 order by bjs ');
    parameters.parambyname('gtype').value := gtype;
    open;
    first;
    // next;
    j := 0;
    k := fieldbyname('b25').FieldNo - 1;
    for i := 1 to 6 do
      with lbComplement[i] do
      begin
        parent := gbinput;
        top := 18 + (i - 1) * h;
        left := 20 + 20;
        if varisnull(fields[k].Value) then
          str := ''
        else
        begin
          inc(j);
          str := fields[k].AsString;
        end;
        if str = '0' then
          caption := ''
        else
          caption := str + '  ';
        autosize := true;
        visible := true;
        inc(k);
      end;
  end;
  for i := j to 6 do
    chkboxes[24 + i].Visible := false;
end;

procedure tgermAnalysisForm.ComplementCheckbox;
var
  i: integer;
  h: integer;
begin
  h := trunc((gbinput.height - 10) / 6);
  //begin from chkboxes[25-30]
  for i := 1 to 6 do
    with chkboxes[i + 24] do
    begin
      parent := gbInput;
      top := 15 + (i - 1) * h;
      left := 20;
      width := 20;
      visible := true;
    end;
end;

function tgermAnalysisform.isNewPatient(bno: string): boolean;
begin
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('select * from base where bbh=:bno');
    parameters.ParamByName('bno').Value := bno;
    open;
    if recordcount > 0 then
      result := false
    else
      result := true;
  end;
end;

procedure TgermAnalysisForm.btnStartScanClick(Sender: TObject);
begin
  if cb_germtype.Text = '' then
  begin
    showMessage('��ѡ�����');
    exit;
  end;
  if dbe_bbh.Text = '' then
  begin
    showMessage('������걾��');
    exit;
  end;
  //����ɨ���Ǽ�����
  //firstCheck(false,1,self);
  //����checkbox��״̬
  //updateBioCheckbox;
  //����ҩ����Ӧ���
  //id:=getid;
  btnstartscan.Enabled := false;
  if bNewPatient then
    hpr := zHelper.create(js, 'ypbase', self, bNewPatient, 0)
  else
    hpr := zHelper.create(js, 'ypbase', self, bNewPatient, dmym.rsbase['useid']);
  hpr.setRs(dmym.rsBase);
  //hpr.setNewPatient(bNewPatient);
  hpr.startCheck;
  btnstartscan.Enabled := true;
  btnAnalysis.Enabled := true;
  //���½���
  //updateBioCheckbox
  {
  med:=zMed.create(0,js,false);
  med.updateFy;
  setYmCheckbox;
  med.analysis;
  }
 { updateGrid; }
end;

procedure TGermAnalysisForm.createYmCheckbox;
var
  i, j, k: integer;
  w, h: integer;
begin
  w := trunc((panel2.Width - 5) / 14);
  h := trunc((panel2.Height - 20) / 8);
  for i := 1 to 3 do
    for j := 1 to 24 do
      if ymChkboxes[i, j] <> nil then
        ymChkboxes[i, j].Free;
  //����2�У�ÿ��12�У�ÿ����С��
  for i := 1 to 3 do
    for j := 1 to 8 do
      for k := 1 to 3 do
      begin
        ymChkboxes[k, j + (i - 1) * 8] := tcheckbox.Create(self);
        with ymChkboxes[k, j + (i - 1) * 8] do
        begin
          parent := panel2;
          if (j + (i - 1) * 8) >= 13 then
            top := 50 + (k - 1 + 3) * h
          else
            top := 20 + (k - 1) * h;
          if (j + (i - 1) * 8) >= 13 then
            left := 55 + (j + (i - 1) * 8 - 13) * w
          else
            left := 55 + (j + (i - 1) * 8 - 1) * w;
          width := 25;
        end;
      end;
end;

procedure TGermAnalysisForm.setYmCheckbox;
var
  i, j, k: integer;
begin
  for i := 1 to 3 do
    for j := 1 to 8 do
      for k := 1 to 3 do
      begin
        with ymChkboxes[k, j + (i - 1) * 8] do
        begin
          if ymResults[k, j + (i - 1) * 8] = true then
            checked := true;
        end;
      end;
end;

procedure tgermAnalysisForm.createYmLabel;
var
  i, j: integer;
  h: integer;
begin
  //create ��ҩ���н顢����
//  w:=trunc((panel2.Width-5)/14);
  h := trunc((panel2.Height - 20) / 8);
  for i := 1 to 6 do
    if not (ymlabel[i] = nil) then
      ymlabel[i].Free;
  for i := 1 to 2 do
    for j := 1 to 3 do
    begin
      ymlabel[j + (i - 1) * 3] := tlabel.Create(self);
      with ymlabel[j + (i - 1) * 3] do
      begin
        parent := panel2;
        if (j + (i - 1) * 3) >= 4 then
          top := (j + (i - 1) * 3) * h + 30
        else
          top := (j + (i - 1) * 3) * h;
        left := 5;
        parentfont := true;
            //font.height:=3;
        visible := true;
      end;
    end;
  if Js = '09' then
  begin
    ymlabel[1].Caption := '������'; ymlabel[4].Caption := '��������';
    ymlabel[2].Caption := '�����Ҿ�'; ymlabel[5].Caption := '�׿��Ҿ�';
    ymlabel[3].Caption := '����ù��' + #13#10 + 'B'; ymlabel[6].Caption := '�������';
  end else
  begin
    ymlabel[1].Caption := '��(C)'; ymlabel[4].Caption := '��(F)';
    ymlabel[2].Caption := '��(D)'; ymlabel[5].Caption := '��(G)';
    ymlabel[3].Caption := '��(E)'; ymlabel[6].Caption := '��(H)';
  end;
end;

procedure tgermAnalysisForm.createYmLabel2;
var
  i, j: integer;
  w, h: integer;
begin
  w := trunc((panel2.Width - 5) / 14);
  h := trunc((panel2.Height - 20) / 8);
  for i := 1 to 24 do
    if ymlabel2[i] <> nil then
      ymlabel2[i].Free;
  if js = '09' then
  begin
    for i := 1 to 24 do
    begin
      ymlabel2[i] := Tlabel.Create(self);
      with ymlabel2[i] do
      begin
        top := 5;
        caption := inttostr(i);
        left := 55 + (i - 1) * w;
        parent := panel2;
        visible := true;
      end;
    end;
  end else
  begin
    for i := 1 to 2 do
      for j := 1 to 12 do
      begin
        ymlabel2[j + (i - 1) * 12] := tlabel.Create(self);
        with ymlabel2[j + (i - 1) * 12] do
        begin
          if j + (i - 1) * 12 >= 13 then
            caption := inttostr(j + (i - 1) * 12)
          else
            caption := inttostr(j + (i - 1) * 12);
          parent := panel2;
          if j + (i - 1) * 12 >= 13 then
            top := 3 * h + 35
          else
            top := 5;
          if j + (i - 1) * 12 >= 13 then
            left := 55 + (j + (i - 1) * 12 - 13) * w
          else
            left := 55 + (j - 1) * w;
          visible := true;
        end;
      end;
  end;
end;

procedure TgermAnalysisForm.btnExitClick(Sender: TObject);
begin
  if saved = false then
  begin
    if (MessageDlg('�����δ���̣��Ƿ��˳���', mtConfirmation, [mbyes, mbno], 0)) = mryes then
      close
    else
      exit;
  end else
    close;
end;

procedure TgermAnalysisForm.FormCreate(Sender: TObject);
var
  strlist: tstringlist;
  str: string;
begin
  str := '��'#13#10 + ' '#13#10 + '��'#13#10 + ' '#13#10 + 'ҩ'#13#10 + ' '#13#10 + 'Ʒ';
  btnAppend.Caption := str;
  bHumanInput := false;
  bNoScanInput := false;
  bNewPatient := true;

  strlist := tstringlist.Create;
  zDbHelper := dbhelper.create;

  zDbHelper.getGermType(strlist);
  cb_germType.Items := strlist;
  strlist.Clear;

  zDbHelper.getSjMan(strlist);
  dbc_sj.Items := strlist;
  strlist.clear;

  zDbHelper.getCheckMan(strlist);
  dbc_reporter.Items := strlist;
  strlist.clear;

  zDbHelper.getSection(strlist);
  dbc_section.Items := strlist;
  strlist.clear;

  zDbHelper.getBBType(strlist);
  dbc_bb.Items := strlist;
  strlist.clear;

  zDbHelper.getLczd(strlist);
  dbe_lczd.Items := strlist;
  strlist.clear;

  zDbHelper.getSjmd(strlist);
  dbc_sjmd.Items := strlist;
  strlist.clear;

  zdbhelper.getsex(strlist);
  dbc_sex.Items := strlist;
  strlist.Clear;
  strlist.free;

// ��ʼ�� �����
  dbc_shys.Text := '';
  dbc_shys.ItemIndex := -1;
  dbc_shys.Items.Add(userNamehfut);
  dbc_SHYS.Items.Add('');
// ��ʼ�������
  initGUI;
  //clear the ypaddtemp table
  dmym.conn.Execute('delete * from ypaddtmp');
  //report
  rvproject1.ProjectFile := rvfile;
end;

procedure TgermAnalysisForm.FormShow(Sender: TObject);
var str: string;
  idx: integer;
begin
  if bNewpatient then
    addBaseNewRecord
  else //�����µĲ��ˣ��������м�¼������ʾ
  begin
    //TgermAnalysisForm(aform).updateGrid;
    dmym.rsBase.Active := true;
    dmym.rsBase.Edit;
    str := dmym.rsBase['orignjs'];
    if (str <> '') or (str <> '00') then
    begin
      idx := zdbhelper.getIndex(str);
      cb_germtype.ItemIndex := idx;
    end;
    //cb_germtype.Text:=str;
    btnstartscanclick(self);
    btnstartscan.Enabled := false;
    btnAnalysis.Enabled := false;
    btnYmanalysis.Enabled := false;
    BtnSave.Enabled := false;
    Button1.Enabled := false;
  end;
end;

procedure tgermAnalysisForm.setJs;
var
  jsname: string;
begin
  jsname := trim(cb_germtype.Text);
  js := zdbhelper.getgermindex(jsname);
end;

procedure tgermAnalysisForm.addBaseNewRecord;
begin
   //�ҳ�base����bbh�����
 { with ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select max(bbh) as Maxbbh from base');
   open;
  end;
  Mbbh:=ADOQuery1.FieldValues['Maxbbh'];}
  with dmym.rsbase do
  begin
    active := true;
    append;
    edit;
  end;
  with dmym do
  begin
    rsbase['name'] := '';
    rsbase['kb'] := '';
    if timetype = 'now' then
    begin
      rsbase['cydate'] := now;
      rsbase['repdate'] := now;
    end else
    begin
      rsbase['cydate'] := date;
      rsbase['repdate'] := date;
    end;
    rsbase['sex'] := '';
    rsbase['bb'] := '';
    rsbase['zyh'] := '';
    rsbase['bed'] := '';
    rsbase['lczd'] := '';
    rsbase['old'] := '';
    rsbase['age'] := ''; ////////////////////////////////////////////////////////
    rsbase['sj'] := '';
    rsbase['bgys'] := userNamehfut;
    rsbase['age'] := '��';
    rsbase['sjmd'] := 'ϸ��������ҩ��';
  end;
  btnsave.Enabled := false;
  btnprint.Enabled := false;
  dbc_reporter.Enabled := false;
  radiobutton1.Checked := true;
  saved := false;
end;

procedure TgermAnalysisForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  aform: tform;
begin
  dmym.rsBase.Active := false;
  dmym.rsCheck.Active := false;
  if (dmym.rsCheck.State = dsInsert) or
    (dmym.rsCheck.State = dsEdit) then
    dmym.rsCheck.Cancel;
  dmym.conn.Execute('delete from ypaddtmp');
  action := cafree;
  aform := self.Owner as TForm;
  aform.Show;
end;

procedure tgermAnalysisForm.updateBioCheckbox(ofispositive: boolean; bioispositive: array of boolean);
var
  j, i, k: integer;
begin
  j := 0;
  for i := 1 to 30 do
  begin
    if bioIsPositive[i - 1] = true then
    begin
      chkboxes[i].Checked := true;
      inc(j);
    end else
      chkboxes[i].Checked := false;
  end;
  k := 0;
  for i := 5 to 9 do
  begin
    if chkboxes[i].Checked then
      inc(k);
  end;
  for i := 11 to 12 do
  begin
    if chkboxes[i].Checked then
      inc(k);
  end;
  if chkboxes[18].Checked then
    inc(k);
  if chkboxes[23].Checked then
    inc(k);
  if chkboxes[20].Checked then
    inc(k);
  if chkboxes[26].Checked then
    inc(k);
    //���ξ�o-f����������
  if (js = '01') then
  begin
    if ((chkboxes[4].Checked = true) and (k < 3) and (chkboxes[15].Checked = false)) or
      ((chkboxes[15].Checked = true) and (chkboxes[4].Checked = false)) or
      ((chkboxes[4].Checked = false) and (k > 2)) then
    begin
      if (MessageDlg('OFʵ�鲻��ȷ���Ƿ�������', mtConfirmation, [mbOK, mbCancel], 0)) = mrOK then
      begin
        if chkboxes[4].Checked then
          chkboxes[4].Checked := false
        else
          chkboxes[4].Checked := true;
      end else
        exit;
    end;
    if chkboxes[4].Checked then
      ofispositive := true
    else
      ofispositive := false;
  end;
  if ofispositive and (js = '01') then
  begin
    chkboxes[27].Visible := false;
    chkboxes[28].Visible := false;
    chkboxes[29].visible := false;
    chkboxes[30].visible := false;
    lbComplement[3].Visible := false;
    lbComplement[4].Visible := false;
    lbComplement[5].Visible := false;
    lbComplement[6].Visible := false;
  end;
  if (not ofispositive) and (js = '01') then
  begin
    chkboxes[27].Visible := true;
    chkboxes[28].Visible := true;
    chkboxes[29].Visible := true;
    chkboxes[30].Visible := true;
    lbComplement[3].Visible := true;
    lbComplement[4].Visible := true;
    lbComplement[5].Visible := true;
    lbComplement[6].Visible := true;
    lbComplement[3].Caption := '������(G12)';
    lbComplement[4].Caption := '����(H12)';
    lbComplement[5].Caption := '��Ѫ';
    lbComplement[6].Caption := '44������';
  end;
 //�Ƿ��;�����of����///////////////////////////////////////////////////////
  if (js = '02') then
  begin
    chkboxes[26].Checked := true;
    if chkboxes[1].Checked then
      MessageDlg('��ϸ������Ϊ�����ƣ���������ø�������', mtInformation, [mbOK], 0);
  end;
  if js = '09' then
    chkboxes[25].Checked := true;
end;

function tgermAnalysisForm.getId: integer;
begin
  result := dmym.rsbase['useid'].asinteger;
end;

procedure tgermAnalysisForm.initGrid;
begin
  with sGrid do
  begin
    rowcount := 5;
    colCount := 5;
    colwidths[0] := 20;
    cells[0, 0] := '';
    colwidths[1] := 75;
    cells[1, 0] := 'ҩƷ����';
    colwidths[2] := 35;
    cells[2, 0] := ' ug/ml';
    colwidths[3] := 55;
    cells[3, 0] := 'ҩ�����';
    colwidths[4] := 26;
    cells[4, 0] := '����'; //��ע��Ϊ����
  end;
end;

procedure tgermAnalysisForm.updateGrid;
var
  i: integer;
begin
  i := 1;
  with sGrid do
  begin
    with dmym.query1 do
    begin
      close;
      sql.clear;
      sql.add('select * from yp order by ypid');
      open;
      sgrid.RowCount := recordcount + 1;
      while not eof do
      begin
           // if i>rowcount then
           //    rowcount:=recordcount;//rowcount+1;
        colwidths[0] := 20;
        Cells[0, i] := inttostr(i);
        colwidths[1] := 60;
        if Varisnull(fieldValues['ypmc']) then
          cells[1, i] := ' '
        else
          cells[1, i] := fieldvalues['ypmc'];

        colwidths[2] := 45;
        if Varisnull(fieldValues['mic']) then
          cells[2, i] := ' '
        else
          cells[2, i] := fieldvalues['mic'];

        colwidths[3] := 55;
        if Varisnull(fieldValues['mg']) then
          cells[3, i] := ' '
        else
          cells[3, i] := fieldvalues['mg'];

        colwidths[4] := 30;
        if Varisnull(fieldValues['bz']) then
          cells[4, i] := ' '
        else
          cells[4, i] := fieldvalues['bz'];
        next;
        inc(i);
      end;
    end;
    row := 1;
    col := 0;
  end;
end;

procedure TgermAnalysisForm.btnAnalysisClick(Sender: TObject);
begin
  if cb_germtype.Text = '' then
  begin
    showMessage('��ѡ�����');
    exit;
  end;
      //�걾�Ų���Ϊ��/////////////////////
  if dbe_bbh.Text = '' then
  begin
    ShowMessage('������걾��');
    exit;
  end;
  if bNewPatient then
    hpr := zHelper.create(js, 'ypbase', self, bNewPatient, 0)
  else
    hpr := zHelper.create(js, 'ypbase', self, bNewPatient, dmym.rsbase['useid']);
  hpr.setRs(dmym.rsBase);
      //hpr.setNewPatient(bNewPatient);
  hpr.setAllResults;
  dmym.rsCheck.Active := false; //false;
  hpr.analyzeBio;
  btnYmAnalysis.Enabled := true;
  btnSave.Enabled := false;
  // dmym.rsBase['jzname']:=dbe_jzname.Text;
end;

procedure TgermAnalysisForm.btnYmAnalysisClick(Sender: TObject);
var i, j: integer;
  str, bz, text: string;
begin
   {��ʾΣ��ϸ��}
  if AnsimatchText(trim(dbe_jzname.text), ['̿��ѿ���˾�', '����Ү��ɭ��', '�ǾҲ��˻����¾�', '��ǾҲ��˻����¾�', '����������˹��']) then
    messagedlg('��ϸ������ΪǱ�ڵ�����ֲ�ϸ����' +
      'Ӧ��ʱ���������������Ա!', mtwarning, [mbok], 0);
  if AnsimatchText(trim(dbe_jzname.text), ['���˺�ɳ�ž�', 'ɳ�ž�', '�˺�ɳ�ž�', '������־�ؾ�', '־�ؾ�ABCȺ', '�����ɳ�ž�']) then
    messagedlg('��ϸ������һ���Ĵ�Ⱦ�ԣ���ʹ��Ѫ��ѧ��' +
      '������ⷽ������ȷ��!', mtwarning, [mbok], 0);

  hpr.analyzeYm;
  Expert := hpr.Expert;
  btnSave.Enabled := true;
   // ר��ϵͳ�б�ΪESBLʱ ��ʾ�û� �޸�ĳЩҩ���ҩ�����
  if pos('ESBLs', Expert) > 0 then
    for i := 0 to sgrid.RowCount - 1 do
      if AnsimatchText(sgrid.cells[1, i], ['ͷ�����', 'ͷ�����', 'ͷ������', '��������', '��������', 'ͷ�����', 'ͷ������', 'ͷ��߻��', 'ͷ����ͪ', 'ͷ�����', '������']) then
        if trim(sgrid.Cells[3, i]) = '����' then
        begin
          if messagedlg('ESBLs����ͨ�������' + sgrid.Cells[1, i] + '����Ϊ��ҩ���������ҩ��������Ƿ���ģ�', mtinformation, [mbyes, mbno], 0) = mryes then
          begin
            sgrid.Cells[3, i] := '��ҩ';
            with ypchange do
            begin
              active := false;
              commandtext := 'select * from yp where ypmc=''' + sgrid.Cells[1, i] + '''';
              active := true;
            end;
            ypchange.Edit;
            ypchange['mg'] := '��ҩ';
            ypchange.Post;
          end;
        end;
   //  ���˾�ר��ϵͳ�б�Ϊ���յ�øʱ ��ʾ�û� �޸�ĳЩҩ���ҩ�����
  if pos('01CYDM', Expert) > 0 then
    for i := 0 to sgrid.RowCount - 1 do
      if Ansimatchstr(sgrid.cells[1, i], ['��������', '��������', 'ͷ������', 'ͷ��߻��', 'ͷ����ͪ', 'ͷ�����', 'ͷ�����', '������', '��������/�����̹', 'ͷ����ͪ/���̹']) then
        if trim(sgrid.Cells[3, i]) = '����' then
          if messagedlg('���յ�ø�������ͨ������¶�ҩ��' + sgrid.Cells[1, i] + '����Ϊ��ҩ���������ҩ��������Ƿ���ģ�', mtinformation, [mbyes, mbno], 0) = mryes then
          begin
            sgrid.Cells[3, i] := '��ҩ';
            with ypchange do
            begin
              active := false;
              commandtext := 'select * from yp where ypmc=''' + sgrid.Cells[1, i] + '''';
              active := true;
            end;
            ypchange.Edit;
            ypchange['mg'] := '��ҩ';
            ypchange.Post;
          end;
   // �Ƿ��͸ξ�ר��ϵͳ�б�Ϊ���յ�øʱ ��ʾ�û� �޸�ĳЩҩ���ҩ�����
  if pos('02CYDM', Expert) > 0 then
    for i := 0 to sgrid.RowCount - 1 do
      if Ansimatchstr(sgrid.cells[1, i], ['��������', '��������', 'ͷ������', 'ͷ����ͪ', 'ͷ�����', '������', '��������/�����̹', 'ͷ����ͪ/���̹', '��������']) then
        if trim(sgrid.Cells[3, i]) = '����' then
          if messagedlg('���յ�ø����ͨ������¶�ҩ��' + sgrid.Cells[1, i] + '����Ϊ��ҩ���������ҩ��������Ƿ���ģ�', mtinformation, [mbyes, mbno], 0) = mryes then
          begin
            sgrid.Cells[3, i] := '��ҩ';
            with ypchange do
            begin
              active := false;
              commandtext := 'select * from yp where ypmc=''' + sgrid.Cells[1, i] + '''';
              active := true;
            end;
            ypchange.Edit;
            ypchange['mg'] := '��ҩ';
            ypchange.Post;
          end;
   // ר��ϵͳ�б�ΪMRSA��MRSCNʱ ��ʾ�û� �޸�ĳЩҩ���ҩ�����
  if pos('MRSA', Expert) > 0 then
    text := '�ͼ������ֵĽ��ɫ�������';
  if pos('MRSCN', Expert) > 0 then
    text := '�ͼ������ֵ�����ø�����������';
  if (pos('MRSA', Expert) > 0) or (pos('MRSCN', Expert) > 0) then
    for i := 0 to sgrid.RowCount - 1 do
      if Ansimatchstr(sgrid.cells[1, i], ['��ù��', '��������', 'ͷ������', 'ͷ������', 'ͷ������', 'ͷ�����', '��Ī����/����ά��', 'ͷ�����', '�ǰ�����']) then
        if trim(sgrid.Cells[3, i]) = '����' then
          if messagedlg(text + 'ͨ������¶�ҩ��' + sgrid.Cells[1, i] + '����Ϊ��ҩ���������ҩ��������Ƿ���ģ�', mtinformation, [mbyes, mbno], 0) = mryes then
          begin
            sgrid.Cells[3, i] := '��ҩ';
            with ypchange do
            begin
              active := false;
              commandtext := 'select * from yp where ypmc=''' + sgrid.Cells[1, i] + '''';
              active := true;
            end;
            ypchange.Edit;
            ypchange['mg'] := '��ҩ';
            ypchange.Post;
          end;
   // ר��ϵͳ�б�Ϊ��̼��ùϡø����ʱ ��ʾ�û� �޸�ĳЩҩ���ҩ�����
  if pos('CTQMXM', Expert) > 0 then
    for i := 0 to sgrid.RowCount - 1 do
      if Ansimatchstr(sgrid.cells[1, i], ['�ǰ�����', '��������']) then
        if trim(sgrid.Cells[3, i]) = '����' then
          if messagedlg('��̼��ùϩø����ͨ������¶�ҩ��' + sgrid.Cells[1, i] + '����Ϊ��ҩ���������ҩ��������Ƿ���ģ�', mtinformation, [mbyes, mbno], 0) = mryes then
          begin
            sgrid.Cells[3, i] := '��ҩ';
            with ypchange do
            begin
              active := false;
              commandtext := 'select * from yp where ypmc=''' + sgrid.Cells[1, i] + '''';
              active := true;
            end;
            ypchange.Edit;
            ypchange['mg'] := '��ҩ';
            ypchange.Post;
          end;
   // ר��ϵͳ�б�Ϊ�յ�����ùʱ ��ʾ�û� �޸�ĳЩҩ���ҩ�����
  if pos('YDKLM', Expert) > 0 then
    for i := 0 to sgrid.RowCount - 1 do
      if trim(sgrid.Cells[1, i]) = '����ù��' then
        if trim(sgrid.Cells[3, i]) = '����' then
          if messagedlg('���ڸþ�����յ�����ù��ҩ���Ʋ����' + sgrid.Cells[1, i] + '����Ϊ��ҩ���������ҩ��������Ƿ���ģ�', mtinformation, [mbyes, mbno], 0) = mryes then
          begin
            sgrid.Cells[3, i] := '��ҩ';
            with ypchange do
            begin
              active := false;
              commandtext := 'select * from yp where ypmc=''' + sgrid.Cells[1, i] + '''';
              active := true;
            end;
            ypchange.Edit;
            ypchange['mg'] := '��ҩ';
            ypchange.Post;
          end;
end;

procedure TgermAnalysisForm.btnExtractClick(Sender: TObject);
var
  rfrm: tregbbForm;
begin
  rfrm := TRegbbForm.create(self);
  rfrm.bExtract := true;
  rfrm.showmodal;
  if rfrm.extracted then
  begin
    with dmym.exquery do
    begin
      dbe_bbh.Text := fieldbyname('bbh').asstring;
            //dbc_Section.Text:=fieldbyname('kb').asstring;
      dmym.rsBase['kb'] := fieldbyname('kb').asstring;
            //dbe_age.text:=fieldbyname('old').asstring;
            //dmym.rsBase['old']:=fieldbyname('old').asstring;
      dmym.rsBase['old'] := fieldbyname('old').asstring;
            //DBC_age.Text:=Fieldbyname('age').AsString;/////////////////////////
      dmym.rsBase['age'] := fieldbyname('age').asstring;
            //dbe_name.text:=fieldbyname('name').asstring;
      dmym.rsBase['name'] := fieldbyname('name').asstring;
            //dbc_sex.text:=fieldbyname('sex').asstring;
      dmym.rsBase['sex'] := fieldbyname('sex').asstring;
            //dbe_zyh.text:=fieldbyname('zyh').asstring;
      dmym.rsBase['zyh'] := fieldbyname('zyh').asstring;
            //dbe_bed.text:=fieldbyname('bed').asstring;
      dmym.rsBase['bed'] := fieldbyname('bed').asstring;
            //dbe_cyDate.text:=fieldbyname('cyDate').asstring;
      dmym.rsBase['cyDate'] := fieldbyname('cyDate').asstring;
            //dbc_bb.text:=fieldbyname('bb').asstring;
      dmym.rsBase['bb'] := fieldbyname('bb').asstring;
            //dbc_sj.Text:=fieldbyname('sj').asstring;
      dmym.rsBase['sj'] := fieldbyname('sj').asstring;
            //dbc_sjmd.text:=fieldbyname('sjmd').asstring;
      dmym.rsBase['sjmd'] := fieldbyname('sjmd').asstring;
            //dbe_lczd.Text:=fieldbyname('lczd').asstring;
      dmym.rsBase['lczd'] := fieldbyname('lczd').asstring;
            //dbc_reporter.Text:=fieldbyname('bgys').asstring;
      dmym.rsBase['bgys'] := fieldbyname('bgys').asstring;
            //dbc_shys.Text:=fieldbyname('shys').asstring;
      dmym.rsBase['shys'] := fieldbyname('shys').asstring;
      bbid := fieldbyname('id').AsInteger;
      dmym.rsBase['bgys'] := userNamehfut;
            {if trim(rfrm.dbc_specType.text)='�ж���' then
            begin
                Edit1.Visible:=true;
                Label3.Visible:=true;
                Label5.Visible:=true;
                Bbbjljs:=true;
                edit1.SetFocus;
            end
            else
            begin
                Edit1.Visible:=false;
                Label3.Visible:=false;
                Label5.Visible:=false;
                Bbbjljs:=false;
                dbe_lczd.setfocus;
            end; }
    end
  end;
  if not (dmym.rsbase.State = dsInsert) then
    dmym.rsbase.Append;
      //dmym.rsbase.Post;
end;

procedure TgermAnalysisForm.btnSaveClick(Sender: TObject);
begin
  dmym.conn.BeginTrans;
  try
    begin
      if bnewPatient = false then
      begin
        dmym.rsBase.Edit;
        if messageDlg('������Ϣ���޸ģ��Ƿ񱣴棿', mtInformation, [mbyes, mbno], 0) = mryes then
        begin
         {useid:=dmym.rsbase['useid'];
         SQLtext:='delete from YpBase where useid='+inttostr(useid);
         dmym.conn.Execute(SQLtext);}
          informationsave;
        end else
          exit;
      end else
      begin
        informationsave;
        dmym.rsBase.Edit;
        dmym.rsBase['type'] := '��������';
        bnewpatient := false;
        cb_germtype.Enabled := false;
        dbe_bbh.Enabled := false;
        if radiobutton1.Checked then
          dmym.rsBase['jjjg'] := 'ͿƬ��������' + dmym.rsBase['jjjg'];
        if radiobutton2.Checked then
          dmym.rsBase['jjjg'] := 'ϸ��������' + dmym.rsBase['jjjg'];
        if dbm_conclusion.Text <> '' then
          dmym.rsBase['yspy'] := '���������' + dmym.rsBase['yspy'];
        with ADOQuery2 do
        begin
          close;
          sql.Clear;
          sql.Add('select* from xjname where name="' + dbe_jzname.Text + '"');
          open;
          if recordcount <> 0 then
            dmym.rsBase['Ename'] := FieldByName('Ename').AsString; //ϸ��Ӣ����
        end;
        useid := dmym.rsBase['useid'];
        dmym.rsBase.Post;
      end;
      dmym.conn.CommitTrans;
    end;
  except
    dmym.conn.RollbackTrans;
    showmessage('ϵͳ����!�����²�����');
    application.Terminate;
  end;
end;

procedure TgermAnalysisForm.Print;
var
  mypage: tRavePage;
  mymemo: tRaveDataMemo;
  myregion: traveRegion;
  mydataband: travedataband;
  jjband, titleband, pyband, bzband: traveband;
  mydatatext1, mydatatext2: travedatatext;
  mytext1, mytext2: travetext;
  mydataview: tRavedataview;
  myhline1, myhline2: travehline;
 // mysection,mysection2:travesection;
  myini: Tinifile;
  memo1: tRaveMemo;
  s, s1, EngXj: string;
  str, str1: string;
  b1: boolean;
  text22, bbjljs: TRaveText;
  RetNum, i, index: integer;
  slist: tstringlist;
  a: array[1..30] of string;
  b: array[1..30] of string;
begin
//�ȽϽ��
  myini := Tinifile.Create(Extractfiledir(Application.ExeName) + '\dw.ini');
  if not StrToBool(Myini.ReadString('ReportConfig', 'NoStandard', '')) then //��ȡ�ļ���Ϣ������
  begin
    SqlText := 'select * from ZFX_YP Where jsname=''' + cb_germtype.Text + ''' and xjname=''' + dbe_jzname.Text + ''' and bblx=''' + dbc_bb.Text + ''' ORDER BY ypid';
    ZFX_PrintQuery.Close;
    ZFX_PrintQuery.SQL.Clear;
    ZFX_PrintQuery.SQL.Add(SqlText);
    ZFX_PrintQuery.Open;
    RetNum := ZFX_PrintQuery.RecordCount;
    if RetNum > 0 then
    begin
      for i := 1 to RetNum do
      begin
        a[i] := ZFX_PrintQuery.FieldByName('isprint').AsString;
        b[i] := ZFX_PrintQuery.FieldByName('ypmc').AsString;
        ZFX_PrintQuery.Next;
      end;
      for i := 1 to RetNum do
        if a[i] = 'no' then
        begin
          try
            with dmym.conn do
              execute('delete from yp where ypmc=''' + b[i] + '''');
          except
          end;
        end;
    end;
    SqlText := 'select * from ZFX_YP Where jsname=''' + cb_germtype.Text + ''' and bblx=''' + dbc_bb.Text + ''' and xjname=''����'' ORDER BY ypid';
    ZFX_PrintQuery.Close;
    ZFX_PrintQuery.SQL.Clear;
    ZFX_PrintQuery.SQL.Add(SqlText);
    ZFX_PrintQuery.Open;
    RetNum := ZFX_PrintQuery.RecordCount;
    if RetNum > 0 then
    begin
      for i := 1 to RetNum do
      begin
        a[i] := ZFX_PrintQuery.FieldByName('isprint').AsString;
        b[i] := ZFX_PrintQuery.FieldByName('ypmc').AsString;
        ZFX_PrintQuery.Next;
      end;
      for i := 1 to RetNum do
        if a[i] = 'no' then
        begin
          try
            with dmym.conn do
              execute('delete from yp where ypmc=''' + b[i] + '''');
          except
          end;
        end;
    end;
    SqlText := 'select * from ZFX_YP Where jsname=''' + cb_germtype.Text + ''' and xjname=''' + dbe_jzname.Text + ''' and bblx=''����'' ORDER BY ypid';
    ZFX_PrintQuery.Close;
    ZFX_PrintQuery.SQL.Clear;
    ZFX_PrintQuery.SQL.Add(SqlText);
    ZFX_PrintQuery.Open;
    RetNum := ZFX_PrintQuery.RecordCount;
    if RetNum > 0 then
    begin
      for i := 1 to RetNum do
      begin
        a[i] := ZFX_PrintQuery.FieldByName('isprint').AsString;
        b[i] := ZFX_PrintQuery.FieldByName('ypmc').AsString;
        ZFX_PrintQuery.Next;
      end;
      for i := 1 to RetNum do
        if a[i] = 'no' then
        begin
          try
            with dmym.conn do
              execute('delete from yp where ypmc=''' + b[i] + '''');
          except
          end;
        end;
    end;
    SqlText := 'select * from ZFX_YP Where jsname=''' + cb_germtype.Text + ''' and xjname=''����'' and bblx=''����'' ORDER BY ypid';
    ZFX_PrintQuery.Close;
    ZFX_PrintQuery.SQL.Clear;
    ZFX_PrintQuery.SQL.Add(SqlText);
    ZFX_PrintQuery.Open;
    RetNum := ZFX_PrintQuery.RecordCount;
    if RetNum > 0 then
    begin
      for i := 1 to RetNum do
      begin
        a[i] := ZFX_PrintQuery.FieldByName('isprint').AsString;
        b[i] := ZFX_PrintQuery.FieldByName('ypmc').AsString;
        ZFX_PrintQuery.Next;
      end;
      for i := 1 to RetNum do
        if a[i] = 'no' then
        begin
          try
            with dmym.conn do
              execute('delete from yp where ypmc=''' + b[i] + '''');
          except
          end;
        end;
    end;
  end;
//�ȽϽ���

  if not StrToBool(Myini.ReadString('ReportConfig', 'NatrualResistance', '')) then
  begin
    with dmym.query1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from ymspecial where ymType=''+'' and js=''' +
        js + ''' and xjName=''' + dbe_jzname.Text + '''');
      open;
      first;
      while not Eof do
      begin
        try
          dmym.conn.Execute('delete from yp where ypmc=''' + FieldByName('ypmc').AsString + '''');
        except
        end;
        next;
      end;
    end;
  end;

  if (saved) or (not bNewpatient) then
  begin
    rvproject1.Open;
    with rvproject1.ProjMan do
    begin
      mypage := findRaveComponent('report_germanalysis.page1', nil) as tRavePage;
      myRegion := findRaveComponent('dv_ypregion', mypage) as tRaveRegion;
      mydataband := findRaveComponent('dv_ypdataband', myregion) as tRaveDataband;
      mymemo := findRaveComponent('datamemo1', mypage) as tRaveDatamemo;
      mytext1 := findRaveComponent('Text9', mypage) as tRaveText; //�����ͷ
      mydatatext1 := findRaveComponent('DataText3', mypage) as tRavedataText;
      mytext2 := findRaveComponent('Text11', mypage) as tRaveText; //�������÷��ı�ͷ
      mydatatext2 := findRaveComponent('DataText32', mypage) as tRavedataText;
      titleband := findRaveComponent('dv_ypBand', mypage) as tRaveband;
      pyband := findRaveComponent('pyBand', mypage) as tRaveband;
      bzband := findRaveComponent('bzBand', mypage) as tRaveband;
      jjband := findRaveComponent('jjband', mypage) as traveband;
        //��ӡ������
         {if not(checkbox2.Checked=true) then
         begin
             jjband.Visible:=false;
             titleband.PositionValue:=jjband.PositionValue;
         end;
         //��ӡҽ������
         if not(checkbox3.Checked=true) then
         begin
             pyband.Visible:=false;
             bzband.PositionValue:=pyband.PositionValue;
         end;}

      if dbm_jj.text <> '' then
      begin
        myhline1 := travehline.Create(jjband);
        myhline1.Parent := jjband;
        myhline1.Name := GetUniqueName('hline11', mypage, false);
        myhline1.Top := 0;
        myhline1.left := 0;
        myhline1.LineWidth := 8;
        myhline1.Width := 7.15;
        addcomponent(myhline1);
        jjband.Height := 0.2;
      end else
        jjband.Height := 0.001;

      if dbm_conclusion.text <> '' then
      begin
        myhline2 := travehline.Create(pyband);
        myhline2.Parent := pyband;
        myhline2.Name := GetUniqueName('hline12', mypage, false);
        myhline2.Top := 0;
        myhline2.left := 0;
        myhline2.LineWidth := 8;
        myhline2.Width := 7.15;
        addcomponent(myhline2);
        pyband.Height := 0.2;
      end else
        pyband.Height := 0.001;
         //��ӡ��ע
         {���ʱ���ӡSDD}
      if js = '09' then
      begin
        ReportRemarkNumber := 6;
        rvproject1.SetParam('sdd', '5��SDD:��������������.');
      end
      else
        ReportRemarkNumber := 5;
      memo1 := findRaveComponent('memo1', mypage) as tRaveMemo;
      s := nrstr(js, hpr.jzname);
      s := s + bcstr(hpr.bc);
      memo1.text := s;
      if s = '' then
        b1 := false
      else
        b1 := true;
      memo1.text := memo1.text + ''#13#10 + nastr(b1);
    end;
    with ADOQuery2 do
    begin
      close;
      sql.Clear;
      sql.Add('select* from xjname where name="' + dbe_jzname.Text + '"');
      open;
    end;
    if trim(edit1.Text) <> '' then
    begin
      rvProject1.SetParam('jljs', '�������:');
      rvproject1.SetParam('cfudw', 'CFU/ml');
    end;
    rvproject1.SetParam('bbh', dbe_bbh.text);
    rvproject1.SetParam('Egxj', ADOQuery2.FieldByName('Ename').AsString);
            //rvproject1.SetParam('datestr',hpr.datestr);
            //rvproject1.SetParam('timestr',' '+hpr.timestr);
    rvproject1.SetParam('titlestr', hospitalName + '΢�����ⱨ�浥');

            (*���ÿ��Ҵ�ӡ��Ϣ*)
    rvproject1.SetParam('Remark', myini.ReadString('DepartMent', 'Information', ''));
    if not StrToBool(Myini.ReadString('ReportConfig', 'Group', '')) then
    begin
      mytext1.Visible := false;
      mydatatext1.Visible := false;
    end;
    if not StrToBool(Myini.ReadString('ReportConfig', 'DoseUsage', '')) then
    begin
      mytext2.Visible := false;
      mydatatext2.Visible := false;
    end;
    myini.Free;

    rvproject1.ExecuteReport('report_germanalysis');
    rvproject1.Close;
  end;
  index := 0;
  rsyptable.active := true;
  rsyptable.first;
  while not rsyptable.Eof do
  begin
    rsyptable.Edit;
    rsyptable.FieldValues['ypmc'] := globalstrarray[index];
    rsyptable.Next;
    inc(index);
  end;
end;

{
procedure TgermAnalysisForm.DelphiTwain1TwainAcquire(Sender: TObject;
  const Index: Integer; Image: TBitmap; var Cancel: Boolean);
begin
     //Copies the acquired bitmap to the TImage control
//  Image1.Picture.Assign(Image);
  //Because the component supports multiple images
  //from the source device, Cancel will tell the
  //source that we don't want no more images
//  Cancel := TRUE;

end;

procedure TgermAnalysisForm.DelphiTwain1SourceSetupFileXfer(
  Sender: TObject; const Index: Integer);
var
  afile:tinifile;
  bmppath:string;
begin
  afile:=tinifile.Create(getcurrentdir+'\ym.ini');
  bmppath:=inifile.ReadString('bmp','scan','0');
  //delphitwain1.source[index].SetupFileTransfer(
  ///  IncludeTrailingBackslash(getcurrentdir) +
   // 'pic.bmp',tfBMP);
  delphitwain1.source[index].SetupFileTransfer(
    bmppath,tfBMP);


end;
}

procedure TgermAnalysisForm.cb_germtypeClick(Sender: TObject);
var
  i, j, w, h: integer;
begin
  if dbe_bbh.Text = '' then
  begin
    showmessage('****������걾��****');
    exit;
  end;
  IsprintCombox.Visible := false;
  HelpEdit.Visible := false;
   //�����ȳ�ʼ��ȫ�ֱ�����
  setJs;
   //����ҩ���ǩ
  createContentLabel(js);
  createComplementLabel(js);
  createYmLabel;
  createymLabel2;
  //����checkbox

  for i := 1 to 30 do
  begin
    chkboxes[i].checked := false;
    chkboxes[i].Visible := true;
  end;
  //����ym checkbox
  for i := 1 to 3 do
    for j := 1 to 24 do
      ymchkboxes[i, j].Checked := false;
end;

procedure TgermAnalysisForm.dbe_jznameClick(Sender: TObject);
begin
  try
    if (dmym.rsBase.state = dsEdit) or (dmym.rsBase.state = dsInsert) then
    //dbe_jzname.Text:=hpr.jzname;
  except
    messagebox(0, '���Ƚ���ϸ��������', '��ʾ', mb_ok);
  end;
end;

procedure TgermAnalysisForm.DBGrid1CellClick(Column: TColumn);
begin
  if dbgrid1.FieldCount > 0 then
  begin
    jzname := column.Field.asstring;
    dbe_jzname.Text := jzname;
  end;
end;

procedure TgermAnalysisForm.btnAppendClick(Sender: TObject);
var
  aform: tappendypform;
begin
  aform := tappendypform.Create(self);
  //aform.setUserId(dmym.rsBase['useid']);
  aform.ShowModal;
end;
{
function TgermAnalysisform.bcstr(str1:string):string;
var
  s:string;
begin

  if pos('ESBL',str1)>0 then
     s:='3����ESBLs�������צ�-������ø���ľ��꣬�ٴ��Ͽ��ܶ���ù���࣬ͷ�߾����������������Ч��'#13#10+'  ��ʹ���ⲿ��ҩ�����С�'
  else if pos('���յ�ø',str1)>0 then
     s:='3�����յ�ø���յ��Ͳ���-������ø���ľ��꣬�ٴ��϶���ù���ࡢͷ��һ����ͷ�߶�����ͷ������'#13#10+'  �Լ�����-�������࿹�Ŀ�����������Ч����ʹ���ⲿ��ҩ�����С�'
  else if pos('�ͼ������ֵĽ��ɫ�������',str1)>0 then
     s:='3���ͼ������ֵĽ��ɫ���������MRSA��ͨ�������еĦ�-�������࿹���أ����������Ƽ����ٴ���'#13#10+'  ����Ч����ʹ���ⲿ��ҩ�����С�'
  else if pos('�ͼ������ֵ�����ø�����������',str1)>0 then
     s:='3���ͼ������ֵ�����ø���Ե����������MRSCN��ͨ�������еĦ�-�������࿹���أ����������Ƽ���'#13#10+'  �ٴ�������Ч����ʹ���ⲿ��ҩ�����С�'
  else if pos('���ù�ظ�ˮƽ��ҩ�ĳ����',str1)>0 then
     s:='3��HARE���͸�ˮƽ���������ࣩ�ľ��꣬�ٴ��϶԰�������������ù����������ҩ������Ч����ʹ��'#13#10+'  �ⲿ��ҩ������'
  else
     s:='';

  result:=s;
end;

function tgermanalysisform.nastr(b1:boolean):string;
var
  s:string;
  i:integer;
  bNa:boolean;
begin
  //�����������ҩ����,b1Ϊtrue
  if b1 then
     i:=4
  else
    i:=3;
  //�ж��Ƿ����na
  bNa:=false;
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.Add('select * from yp');
    open;

    while not eof do
    begin
      if fieldvalues['bz']='NA' then
      begin
        bNa:=true;
        break;
      end;
      next;
    end;
  end;
  if bNa then
  begin
    s:=inttostr(i)+'��NA��Not accepted��:��ҩ��ҩ��������ɿ���Ӧ���ظ��������ϸ������ѯ��';
  end else
    s:='';
  result:=s;
end;
}

procedure TgermAnalysisForm.rsYptableAfterOpen(DataSet: TDataSet);
var
  str: string;
  s, s1, s2: string;
  i, idx: integer;
begin
  i := 0;
  dataset.Edit;
  dataset.First;
  while not dataset.Eof do
  begin
    globalstrarray[i] := dataset.FieldValues['ypmc'];
    inc(i);
    dataset.Next;
  end;

  dataset.First;
    // MIC�۵��ʾ
  while not dataset.Eof do
  begin
    dataset.Edit;
    dataset.Fieldvalues['jfyl'] := '';
    with dmym.query1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from specialmic where js=''' + js + ''' and jzname=''' + jzname + ''' and ypmc=''' + dataset.FieldValues['ypmc'] + '''');
      open;
      if recordcount > 0 then
        while not eof do
        begin
          dataset.Edit;
          dataset.Fieldvalues['jfyl'] := FieldValues['miczd'];
          next;
        end
      else
      begin
        close;
        sql.Clear;
        sql.Add('select * from specialmic where js=''' + js + ''' and jzname=''-'' and ypmc=''' + dataset.FieldValues['ypmc'] + '''');
        open;
        if recordcount > 0 then
          while not eof do
          begin
            dataset.Edit;
            dataset.Fieldvalues['jfyl'] := FieldValues['miczd'];
            next;
          end;
      end;
    end;

        //�������÷���A.B������ʾ
        {str:=dataset.fieldvalues['jfyl'];
        idx:=pos(';',str);
        if idx>0 then
        begin
            s1:=leftstr(str,idx-1);
            s2:=rightstr(str,length(str)-idx);
            dataset.Edit;
            dataset.Fieldvalues['jfyl']:=s1+''#13#10+s2;
        end;  }
        //Ӣ�����ָ��ӵ��������ֱ���
    s := dataset.FieldValues['ypmc'];
    s := trim(s + dataset.FieldValues['ename']);

    dataset.Edit;
    dataset.FieldValues['ypmc'] := s;
    dataset.FieldValues['ename'] := '';
        //������е�ҩ��ǰ��ӹ�
    if dataset.FieldValues['mg'] = '����' then
      dataset.FieldValues['ypmc'] := '*' + dataset.FieldValues['ypmc']
    else
      dataset.FieldValues['ypmc'] := '  ' + dataset.FieldValues['ypmc'];
    dataset.Next;
  end;
end;

procedure tGermanalysisform.initGUI;
begin
  createCheckbox;
  ComplementCheckbox;
  createBioLabel;
  createBioAddLabel;
  createymCheckbox;
  //createymLabel2;
  initGrid;
end;

procedure tGermAnalysisForm.updateGridFromYpBase(id: integer);
var
  i: integer;
begin
  i := 1;
  with sGrid do
  begin
    with dmym.query1 do
    begin
      close;
      sql.clear;
      sql.add('select * from ypbase where useid=:id order by ypid');
      parameters.ParamByName('id').Value := id;
      open;
      sgrid.RowCount := recordcount + 1;
      while not eof do
      begin
           // if i>rowcount then
           //    rowcount:=recordcount;//rowcount+1;
        colwidths[0] := 20;
        Cells[0, i] := inttostr(i);

        colwidths[1] := 60;
        if Varisnull(fieldValues['ypmc']) then
          cells[1, i] := ' '
        else
          cells[1, i] := fieldvalues['ypmc'];

        colwidths[2] := 45;
        if Varisnull(fieldValues['mic']) then
          cells[2, i] := ' '
        else
          cells[2, i] := fieldvalues['mic'];

        colwidths[3] := 55;
        if Varisnull(fieldValues['mg']) then
          cells[3, i] := ' '
        else
          cells[3, i] := fieldvalues['mg'];

        colwidths[4] := 30;
        if Varisnull(fieldValues['bz']) then
          cells[4, i] := ' '
        else
          cells[4, i] := fieldvalues['bz'];
        next;
        inc(i);
      end;
    end;
    row := 1;
    col := 0;
  end;
end;

procedure TgermAnalysisForm.dbe_jznameChange(Sender: TObject);
begin
  if dbe_jzname.Enabled then
    dbe_jznameChge := true;
end;

procedure TgermAnalysisForm.dbe_bbhKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (((key >= #48) and (key <= #57)) or (key = #8) or (key = #13)) then
    key := #0
  else
    if key = #13 then
      cb_germtype.SetFocus;
end;

procedure TgermAnalysisForm.dbe_nameKeyPress(Sender: TObject;
  var Key: Char);

begin
  if key = #13 then
    dbe_age.SetFocus;
     {else
     dbe_name.text:=key;}
end;

procedure TgermAnalysisForm.sGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  with sGrid do
  begin
    if ACol = 3 then
    begin
      helpi := ACol;
      helpj := ARow;
      IsprintCombox.Text := sGrid.Cells[ACol, ARow];
      HelpEdit.Text := sGrid.Cells[1, ARow];
      IsprintCombox.Left := CellRect(ACol, ARow).Left + 1;
      IsprintCombox.Top := Top + CellRect(ACol, ARow).Top + 1;
      IsprintCombox.Width := ColWidths[ACol];
      IsprintCombox.Height := 24;
      IsprintCombox.Visible := true;
      IsprintCombox.SetFocus;
      IsprintCombox.Text := sGrid.Cells[ACol, ARow];
    end
    else
      IsprintCombox.Visible := false;
  end;
end;


procedure TgermAnalysisForm.sGridTopLeftChanged(Sender: TObject);
begin
  IsprintCombox.Visible := false;
end;

procedure TgermAnalysisForm.Button1Click(Sender: TObject);
begin
  (*application.CreateForm(TZFX_YPDY,ZFX_YPDY);
  ZFX_YPDY.showmodal;*)
  Application.CreateForm(TDISetform, DISetform);
  DISetform.ShowModal;
end;

procedure TgermAnalysisForm.IsprintComboxChange(Sender: TObject);
begin
  with sGrid do
  begin
    if helpi = 3 then
    begin
      sGrid.Cells[helpi, helpj] := IsprintCombox.Text;
    end;
    with dmym.conn do
    begin
      execute('update yp set mg=''' + sGrid.Cells[3, helpj] + '''where ypmc=''' + HelpEdit.Text + '''');
    end;
  end;
end;

procedure TgermAnalysisForm.IsprintComboxExit(Sender: TObject);
begin
  if helpi = 3 then
    with dmym.conn do
    begin
      execute('update yp set mg=''' + sGrid.Cells[3, helpj] + '''where ypmc=''' + HelpEdit.Text + '''');
    end;
end;

procedure TgermAnalysisForm.IsprintComboxClick(Sender: TObject);
begin
  if helpi = 3 then
    with dmym.conn do
    begin
      execute('update yp set mg=''' + sGrid.Cells[3, helpj] + '''where ypmc=''' + HelpEdit.Text + '''');
    end;
end;

procedure TgermAnalysisForm.cb_germtypeKeyPress(Sender: TObject;
  var Key: Char);
var GermIndex: string;
  m: boolean;
begin
  m := (key < #13) or (key > #13) and (key < #48) or (key > #57);
  if m then
    Key := #0
  else
    if key = #13 then
    begin
      if cb_germtype.Text = '' then
        showmessage('**��ѡ�����**');
      if cb_germtype.Text <> '' then
      begin
        GermIndex := cb_germtype.Text;
        with ADOQuery1 do
        begin
          close;
          sql.clear;
          sql.add('select * from GermType where GermIndex=:GermIndex');
          parameters.parambyname('GermIndex').value := GermIndex;
          open;
        end;
        if ADOQuery1.RecordCount > 0 then
          cb_germtype.Text := ADOQuery1.Fieldbyname('GermType').AsString;

      end;
      dbe_name.setfocus;
    end;
end;

procedure TgermAnalysisForm.dbe_ageKeyPress(Sender: TObject;
  var Key: Char);
begin
  if KEY = #13 then
    DBC_age.SetFocus;
end;

procedure TgermAnalysisForm.dbc_sexKeyPress(Sender: TObject;
  var Key: Char);
var ID: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbc_sex.Text <> '' then
    begin
      SQLText := 'select * from ZFX_XB';
      ID := dbc_sex.Text;
      with ZFX_xingbie do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ID=:ID');
        parameters.parambyname('ID').value := ID;
        open;
      end;
      if ZFX_xingbie.RecordCount > 0 then
        dbc_sex.Text := ZFX_xingbieDBE.Text;
    end;
    dbe_bed.setfocus;
  end;
end;

procedure TgermAnalysisForm.dbe_bedKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    dbc_section.SetFocus;
end;

procedure TgermAnalysisForm.dbc_sectionKeyPress(Sender: TObject;
  var Key: Char);
var secid: string;
  rnum: integer;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbc_section.Text <> '' then
    begin
      SQLText := 'select * from secname';
      secid := dbc_section.Text;
      with ZFX_kebie do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where secid=:secid');
        parameters.parambyname('secid').value := secid;
        open;
      end;
      rnum := ZFX_kebie.RecordCount;
      if rnum > 0 then
        dbc_section.Text := ZFX_kebieDBE.Text;
    end;
    dbe_zyh.setfocus;
  end;
end;

procedure TgermAnalysisForm.dbe_zyhKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    dbc_bb.SetFocus;
end;

procedure TgermAnalysisForm.dbc_bbKeyPress(Sender: TObject; var Key: Char);
var ID: string;
  rnum: integer;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbc_bb.Text <> '' then
    begin
      SQLText := 'select * from bb';
      ID := dbc_bb.Text;
      with ZFX_bblx do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ID=:ID');
        parameters.parambyname('ID').value := ID;
        open;
        rnum := ZFX_bblx.RecordCount;
      end;
      if rnum > 0 then
        dbc_bb.Text := ZFX_bblxDBE.Text;
    end;


      {if dbc_bb.text='�ж���' then
         begin
         Edit1.Visible:=true;
         Label3.Visible:=true;
         Label5.Visible:=true;
         Bbbjljs:=true;
         edit1.SetFocus;
         end
     else
         begin
         Edit1.Visible:=false;
         Label3.Visible:=false;
         Label5.Visible:=false;
         Bbbjljs:=false;
         dbe_lczd.setfocus;
         end;  }
  end;
end;

procedure TgermAnalysisForm.dbc_sjKeyPress(Sender: TObject; var Key: Char);
var ID: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbc_sj.Text <> '' then
    begin
      SQLText := 'select * from sjys';
      ID := dbc_sj.Text;
      with ZFX_sjry do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ID=:ID');
        parameters.parambyname('ID').value := ID;
        open;
      end;
      if ZFX_sjry.RecordCount > 0 then
        dbc_sj.Text := ZFX_sjryDBE.Text;
    end;
    dbc_sjmd.setfocus;
  end;
end;

procedure TgermAnalysisForm.dbc_reporterKeyPress(Sender: TObject;
  var Key: Char);
var ID: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbc_reporter.Text <> '' then
    begin
      SQLText := 'select * from checkman';
      ID := dbc_reporter.Text;
      with ZFX_bgry do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ID=:ID');
        parameters.parambyname('ID').value := ID;
        open;
      end;
      if ZFX_bgry.RecordCount > 0 then
        dbc_reporter.Text := ZFX_bgryDBE.Text;
    end;
    dbc_sjmd.setfocus;
  end;
end;

procedure TgermAnalysisForm.dbc_sjmdKeyPress(Sender: TObject;
  var Key: Char);
var ZT_sjmdID: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbc_sjmd.Text <> '' then
    begin
      SQLText := 'select * from ZT_SJ';
      ZT_sjmdID := dbc_sjmd.Text;
      with ZFX_sjmd do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ZT_sjmdID=:ZT_sjmdID');
        parameters.parambyname('ZT_sjmdID').value := ZT_sjmdID;
        open;
      end;
      if ZFX_sjmd.RecordCount > 0 then
        dbc_sjmd.Text := ZFX_sjmdDBE.Text;
    end;
    dbc_shys.setfocus;
  end;
end;

procedure TgermAnalysisForm.dbc_shysKeyPress(Sender: TObject;
  var Key: Char);
var ID: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbc_shys.Text <> '' then
    begin
      SQLText := 'select * from checkman';
      ID := dbc_shys.Text;
      with ZFX_shry do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ID=:ID');
        parameters.parambyname('ID').value := ID;
        open;
      end;
      if ZFX_shry.RecordCount > 0 then
        dbc_shys.Text := ZFX_shryDBE.Text;
    end;
        // dbe_lczd.setfocus;
  end;
end;

procedure TgermAnalysisForm.cb_germtype1Exit(Sender: TObject);
var
  i, j: integer;
begin
  if cb_germtype.Text = '' then
  begin
    showmessage('**��ѡ�����**');
    cb_germtype.SetFocus;
    exit;
  end
  else
  begin
    IsprintCombox.Visible := false;
    HelpEdit.Visible := false;
   //�����ȳ�ʼ��ȫ�ֱ�����
    setJs;
   //����ҩ���ǩ
    createContentLabel(js);
    createComplementLabel(js);
  //����checkbox
    for i := 1 to 30 do
    begin
      chkboxes[i].checked := false;
      chkboxes[i].Visible := true;
    end;
  //����ym checkbox
    for i := 1 to 3 do
      for j := 1 to 24 do
        ymchkboxes[i, j].Checked := false;
  end;
end;

procedure TgermAnalysisForm.dbc_bbClick(Sender: TObject);
begin
    {if dbc_bb.text='�ж���' then
    begin
      Edit1.Visible:=true;
      Label3.Visible:=true;
      Label5.Visible:=true;
      Bbbjljs:=true;
    end
    else
    begin
      Edit1.Visible:=false;
      Label3.Visible:=false;
      Label5.Visible:=false;
      Bbbjljs:=false;
    end; }
end;

procedure TgermAnalysisForm.DBC_ageKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    if (dbc_age.Text = '01') or (dbc_age.text = '1') then
      dbc_age.Text := '��';
    if (dbc_age.Text = '02') or (dbc_age.text = '2') then
      dbc_age.Text := '��';
    if (dbc_age.Text = '03') or (dbc_age.text = '3') then
      dbc_age.Text := '��';
    if (dbc_age.Text = '04') or (dbc_age.text = '4') then
      dbc_age.Text := 'Сʱ';
    if (dbc_age.Text = '05') or (dbc_age.text = '5') then
      dbc_age.Text := '����';
    dbc_sex.SetFocus;
  end;
end;

procedure TgermAnalysisForm.BtnHistoryClick(Sender: TObject);
var
  frmtotal: TLSDZForm;
begin
  if dbe_name.text <> '' then
  begin
    Dname := dbe_name.Text;
    dmym.LSADODataSet1.Active := false;
    dmym.LSADODataSet1.CommandText := 'select * from base where name=''' + Dname + ''' and type=''��������'''; //'''+Dname+'''';//"'+dbe_name.Text+'"';
    dmym.LSADODataSet1.Active := true;
    if dmym.LSADODataSet1.RecordCount > 0 then
    begin
      frmtotal := TLSDZForm.Create(self);
      frmtotal.ShowModal;
    end else
      showmessage('�˲�������ʷ��¼');
  end else
  begin
    dmym.LSADODataSet1.Active := false;
    dmym.LSADODataSet1.CommandText := 'select * from base where result is not null order  by cydate desc';
    dmym.LSADODataSet1.Active := true;
    if dmym.LSADODataSet1.recordcount > 0 then
    begin
      frmtotal := TLSDZForm.Create(self);
      frmtotal.ShowModal;
    end else
      showmessage('�걾����ʷ��¼');
  end;
end;

function convertstring(source: string): string;
var i, j: integer;
  a, b: array[0..50] of char;
begin
  StrPCopy(a, source);
  j := 0; i := 0;
  while (a[j] <> #0) do
  begin
    b[i] := a[j];
    if ByteType(b[i], 1) = mbLeadByte then
    begin
      if (j mod 2 = 1) and (j > 0) then
      begin
        Inc(i); b[i] := #13;
      end;
      Inc(j); Inc(i);
    end
    else
    begin
      Inc(i); b[i] := #13;
      Inc(j); Inc(i);
    end;
  end;
  b[i - 1] := #0;
  result := strpas(b);
end;


procedure TgermAnalysisForm.dbe_lczdKeyPress(Sender: TObject;
  var Key: Char);
var lczdID: string;
begin
  if key = #13 then
  begin
    if dbe_lczd.Text <> '' then
    begin
      lczdID := dbe_lczd.Text;
      with ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from YYlczd where id=:lczdID');
        parameters.parambyname('lczdID').value := lczdID;
        open;
      end;
      if ADOQuery1.RecordCount > 0 then
        dbe_lczd.Text := ADOQuery1.Fieldbyname('lczd').AsString;
    end;
    dbc_sj.SetFocus;
  end;
end;

{procedure tgermAnalysisForm.createYmLabel23;
var
  i,j:integer;
  w,h:integer;
begin
  w:=trunc((panel1.Width-160)/13);
  h:=trunc((panel1.Height-20)/8);
  //for i:=1 to 2  do
  i:=1;
    for j:=1 to 12 do
    begin
      ymlabel[j+(i-1)*12]:=tlabel.Create(self);
      with ymlabel[j+(i-1)*12] do
      begin
        if  j+(i-1)*12>=13 then
        caption:=inttostr(j+(i-1)*12)
        else
        caption:=inttostr(j+(i-1)*12);
        parent:=panel1;
        if  j+(i-1)*12>=13 then
        top:=3*h+32
        else
        top:=5;
        if  j+(i-1)*12>=13 then
        left:=32+ (j+(i-1)*12-13)*w
        else
        left:=32+ (j-1)*w;
        visible:=true;
      end;
    end;
end; }

procedure tgermAnalysisForm.createBioAddLabel;
var
  i: integer;
  h: integer;
begin
  h := trunc((gbinput.height - 10) / 6);
  for i := 1 to 6 do
  begin
    BioLabel[24 + i] := tlabel.Create(self);
    with BioLabel[24 + i] do
    begin
      parent := gbInput;
      top := 18 + (i - 1) * h;
      left := 5;
      width := 20;
      caption := inttostr(24 + i);
      visible := true;
    end;
  end;
end;



procedure TgermAnalysisForm.cb_germtypeExit(Sender: TObject);
var
  i, j, w, h: integer;
begin
  if cb_germtype.Text = '' then
  begin
    showmessage('**��ѡ�����**');
    cb_germtype.SetFocus;
    exit;
  end
  else
  begin
    IsprintCombox.Visible := false;
    HelpEdit.Visible := false;
   //�����ȳ�ʼ��ȫ�ֱ�����
    setJs;
   //����ҩ���ǩ
    createContentLabel(js);
    createComplementLabel(js);
    createYmLabel;
    createymLabel2;
  //����checkbox
    for i := 1 to 30 do
    begin
      chkboxes[i].checked := false;
      chkboxes[i].Visible := true;
    end;
  //����ym checkbox
    for i := 1 to 3 do
      for j := 1 to 24 do
        ymchkboxes[i, j].Checked := false;
  end;
end;

procedure Tgermanalysisform.informationsave;
var i: integer;
  str: string;
  str1: string;
begin
  saved := true;
  btnPrint.Enabled := true;
  btnStartScan.Enabled := false;
  btnanalysis.Enabled := false;
  BtnYmAnalysis.Enabled := false;
  btnExtract.Enabled := false;
  btnsave.Enabled := false;
  hpr.bbid := bbid;
  hpr.updateDatabase();
end;

procedure TgermAnalysisForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    dbe_lczd.SetFocus;
end;

procedure TgermAnalysisForm.CreateBioLabel;
var w, h: integer;
  i, j: integer;
begin
  begin
    w := trunc((panel1.Width - 160) / 13);
    h := trunc((panel1.Height - 20) / 8);
    for i := 1 to 2 do
  //i:=1;
      for j := 1 to 12 do
      begin
        BioLabel[j + (i - 1) * 12] := tlabel.Create(self);
        with BioLabel[j + (i - 1) * 12] do
        begin
          if j + (i - 1) * 12 >= 13 then
            caption := inttostr(j + (i - 1) * 12)
          else
            caption := inttostr(j + (i - 1) * 12);
          parent := panel1;

          if j + (i - 1) * 12 >= 13 then
            top := 3 * h + 24
          else
            top := 5;

          if j + (i - 1) * 12 >= 13 then
            left := 32 + (j + (i - 1) * 12 - 13) * w
          else
            left := 32 + (j - 1) * w;
          visible := true;
        end;
      end;
  end;
end;

procedure TgermAnalysisForm.BitBtn1Click(Sender: TObject);
var aform: TMedReportForm;
begin
  application.CreateForm(TMedReportForm, aform);
  aform.left := self.left;
  aform.top := groupbox6.Top + self.Top - aform.Height;
  aform.Show;
end;

procedure TgermAnalysisForm.dbc_sectionExit(Sender: TObject);
var strlist: Tstringlist;
begin
  strlist := Tstringlist.Create;
  if zDbHelper.getSjMan(strlist, dbc_section.text) <> 0 then
    dbc_sj.Items := strlist;
end;

procedure TgermAnalysisForm.Button3Click(Sender: TObject);
begin
  dmym.rsBase['bbh'] := zDbHelper.generateNumber('baseno');
end;

procedure TgermAnalysisForm.btnPrintClick(Sender: TObject);
var reporttype: integer;
begin
  application.CreateForm(Tsreportform, sreportform);
  if sreportform.ShowModal = mrok then
  begin
    reporttype := sreportform.reporttype;
    case reporttype of
      1: begin
          Rvsystem1.SystemSetups := Rvsystem1.SystemSetups - [ssAllowSetup];
          Rvsystem1.DefaultDest := rdPrinter;
          print;
        end;
      2: begin
          Rvsystem1.SystemSetups := Rvsystem1.SystemSetups - [ssAllowSetup];
          Rvsystem1.DefaultDest := rdPreview;
          print;
        end;
      3: ExportWord;
    end;
  end;
  sreportform.Free;
  Sendmessage(findwindow('TgermAnalysisForm', nil), WM_SYSCOMMAND, SC_CLOSE, 0);
end;

procedure TgermAnalysisForm.ExportWord;
var wordapp, worddoc, wordtab, myrange, Template: variant;
  s, str1, str2: string;
  k: integer;
  myini: Tinifile;
  h: hwnd;
begin
  try
    wordapp := createoleobject('word.application');
    wordapp.visible := false;
  except
    messagebox(0, 'δ��װ WordӦ�ó���,���Ȱ�װMicrosoftOffice,Ȼ���������!',
      '����δ�ҵ�', mb_Ok + MB_ICONWARNING + MB_APPLMODAL);
    Abort;
  end;

  application.CreateForm(Tflashform, flashform);
  flashform.Show;
  flashform.Panel1.Caption := '���ڵ�����Word,���Ժ�...';
  flashform.Refresh;
  myini := Tinifile.Create(Extractfiledir(Application.ExeName) + '\dw.ini');

    //�趨�ĵ�ģʽ,(*�ر�ƴ�����ң��﷨���ң��������Ч��*)
  Wordapp.Options.CheckSpellingAsYouType := False;
  Wordapp.Options.CheckGrammarAsYouType := False;
  Template := ExtractFiledir(Application.Exename) + '/doc/�����������浥.dot';
  worddoc := wordapp.Documents.Add(template);
  wordtab := worddoc.tables.item(1);
    //
  try
    //{�������ݲ�Դ��Ϣ}
    wordtab.cell(1, 1).range.insertafter(hospitalName + '΢�����ⱨ�浥');
    wordtab.cell(2, 1).range.insertafter(dmym.rsBase['name']);
    wordtab.cell(2, 2).range.insertafter(dmym.rsBase['kb']);
    wordtab.cell(2, 3).range.insertafter(dmym.rsBase['sjmd']);
    wordtab.cell(3, 1).range.insertafter(dmym.rsBase['sex']);
    wordtab.cell(3, 2).range.insertafter(dmym.rsBase['zyh']);
    wordtab.cell(3, 3).range.insertafter(dmym.rsBase['bb']);
    wordtab.cell(4, 1).range.insertafter(dmym.rsBase['old'] + dmym.rsBase['age']);
    wordtab.cell(4, 2).range.insertafter(dmym.rsBase['bed']);
    wordtab.cell(4, 3).range.insertafter(dmym.rsBase['cydate']);
    wordtab.cell(5, 1).range.insertafter(dmym.rsBase['bbh']);
    wordtab.cell(5, 2).range.insertafter(dmym.rsBase['sj']);
    wordtab.cell(5, 3).range.insertafter(dmym.rsBase['repdate']);
    wordtab.cell(6, 1).range.insertafter(dmym.rsBase['lczd']);
    //���������Ϣ
    wordtab.cell(7, 1).range.insertafter(dmym.rsBase.FieldByName('jzname').AsString);
    wordtab.cell(8, 1).range.insertafter(dmym.rsBase.FieldByName('ename').AsString);
    str1 := ''; str2 := '';
    if trim(dmym.rsBase.FieldByName('cfu').asstring) <> '' then
    begin
      str1 := '  ���������';
      str2 := 'CFU/ml'
    end;
    wordtab.cell(9, 1).range.insertafter(dmym.rsBase.FieldByName('bc').AsString + str1 + dmym.rsBase.FieldByName('cfu').asstring + str2);
    //���������� }
    k := 9;
    if (dmym.rsBase['jjjg'] <> '') and (not varisnull(dmym.rsBase['jjjg'])) then
    begin
      inc(k);
      wordtab.cell(k, 1).range.insertafter(dmym.rsBase['jjjg']);
    end else
      wordtab.rows.item(k + 1).delete;
    //����ҩ������
    k := k + 2;
    if rsyptable.Active = false then
      rsyptable.Active := true;
    rsyptable.first;
    while not rsyptable.Eof do
    begin
      wordtab.cell(k, 1).range.insertafter(rsyptable['ypmc']);
      if StrToBool(Myini.ReadString('ReportConfig', 'Group', '')) then
      begin
        wordtab.cell(k, 2).range.insertafter(rsyptable['bz']);
      end;
      wordtab.cell(k, 3).range.insertafter(rsyptable['mic']);
      wordtab.cell(k, 4).range.insertafter(rsyptable['mg']);
      if StrToBool(Myini.ReadString('ReportConfig', 'DoseUsage', '')) then
      begin
        wordtab.cell(k, 5).range.insertafter(rsyptable['jfyl']);
      end;
      wordtab.Rows.item(k + 1).Select;
      wordapp.Selection.InsertRowsBelow;
      inc(k);
      rsyptable.Next;
      application.ProcessMessages;
    end;
    wordtab.rows.item(k).borders.item(-1).linestyle := 1;
    dmym.rsAddTemp.Active := false;
    dmym.rsAddTemp.Active := true; //ˢ��һ�Σ�ʹָ��ָ���һ����¼
    if dmym.rsAddTemp.RecNo > 0 then
      while not dmym.rsAddTemp.Eof do
      begin
        wordtab.cell(k, 1).range.insertafter(dmym.rsAddTemp.FieldByName('ypmc').AsString);
        wordtab.cell(k, 3).range.insertafter(dmym.rsAddTemp.FieldByName('mic').AsString);
        wordtab.cell(k, 4).range.insertafter(dmym.rsAddTemp.FieldByName('mg').AsString);
        wordtab.cell(k, 5).range.insertafter(dmym.rsAddTemp.FieldByName('bcsm').AsString);
        wordtab.Rows.item(k + 1).Select;
        wordapp.Selection.InsertRowsBelow;
        inc(k);
        dmym.rsAddTemp.Next;
      end;
    wordtab.rows.item(k).delete; //����ɾ������
    wordtab.rows.item(k).delete;
    //����ҽ������
    if (dmym.rsBase['yspy'] <> '') and (not varisnull(dmym.rsBase['yspy'])) then
    begin
      wordtab.cell(k, 1).range.insertafter(dmym.rsBase['yspy']);
      inc(k);
    end
    else
      wordtab.rows.item(k).delete;
    //������ע
    K := K + 4;
    if js = '09' then
    begin
      ReportRemarkNumber := 6;
      wordtab.rows.item(k).select;
      wordapp.selection.InsertRowsBelow;
      inc(k);
      wordtab.cell(k, 1).range.insertafter('5��SDD:��������������.');
      wordtab.cell(k, 1).borders.item(-1).linestyle := 0;
    end else
      ReportRemarkNumber := 5;
    s := nrstr(js, hpr.jzname);
    if s <> '' then
    begin
      wordtab.rows.item(k).select;
      wordapp.selection.InsertRowsBelow;
      inc(k);
      wordtab.cell(k, 1).range.insertafter(s);
      wordtab.cell(k, 1).borders.item(-1).linestyle := 0;
    end;
    if bcstr(hpr.bc) <> '' then
    begin
      wordtab.rows.item(k).select;
      wordapp.selection.InsertRowsBelow;
      inc(k);
      wordtab.cell(k, 1).range.insertafter(bcstr(hpr.bc));
      wordtab.cell(k, 1).borders.item(-1).linestyle := 0;
    end;
    //��������ߣ��ͼ���
    inc(k);
    if not varisnull(dmym.rsBase['bgys']) then
      wordtab.cell(k, 1).range.insertafter(dmym.rsBase['bgys']);
    if not varisnull(dmym.rsBase['shys']) then
      wordtab.cell(k, 2).range.insertafter(dmym.rsBase['shys']);
    //����ҳ��
    inc(k);
    wordtab.cell(k, 1).range.insertafter(myini.ReadString('DepartMent', 'Information', ''));
    myini.Free;
  except
    messagedlg('�����������', mtWarning, [mbok], 0);
  end;
  flashform.Hide;
  flashform.Free;

  setwindowpos(findwindow('NetUIHWND', nil), HWND_TOPMOST, 0, 0, 0, 0, SWP_SHOWWINDOW);
  wordapp.visible := true;
end;

end.

