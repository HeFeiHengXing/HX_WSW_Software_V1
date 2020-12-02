unit zkAnalysisfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DBCtrls, Buttons, ExtCtrls, Mask, helper,
  ymDataType, db, adodb, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave,
  inifiles, rvclass, rvcsrpt, rvcsstd, strutils, rvdirectdataview, comobj;

type
  TzkAnalysisForm = class(TForm)
    Label1: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    gbNameInfo: TGroupBox;
    Label4: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbe_age: TDBEdit;
    dbc_bb: TDBComboBox;
    dbc_sex: TDBComboBox;
    dbe_bbh: TDBEdit;
    btnExtract: TButton;
    Panel1: TPanel;
    gbInput: TGroupBox;
    GroupBox1: TGroupBox;
    btnStartScan: TBitBtn;
    btnAnalysis: TButton;
    btnYmAnalysis: TButton;
    btnPrint: TButton;
    btnSave: TButton;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    dbe_cydate: TDBEdit;
    dbe_repdate: TDBEdit;
    dbc_sjmd: TDBComboBox;
    dbc_shys: TDBComboBox;
    Panel2: TPanel;
    btnExit: TBitBtn;
    cb_germtype: TComboBox;
    GroupBox5: TGroupBox;
    lbGermStdCode: TLabel;
    lbJzName: TLabel;
    lblCode: TLabel;
    DBGrid1: TDBGrid;
    dbe_jzname: TDBEdit;
    GroupBox6: TGroupBox;
    sGrid: TStringGrid;
    dbe_sj: TDBEdit;
    Label12: TLabel;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    rvZk: TRvDataSetConnection;
    rvyp2: TRvDataSetConnection;
    rsYptable: TADODataSet;
    Image1: TImage;
    ZFX_zk: TADOQuery;
    ZFX_zks: TDataSource;
    ZFX_sexdb: TDBEdit;
    ZFX_bblxdb: TDBEdit;
    ZFX_zkb: TDataSource;
    ZFX_zkbb: TADOQuery;
    ZFX_shrys: TDataSource;
    ZFX_sjmds: TDataSource;
    ZFX_bgrys: TDataSource;
    ZFX_bgrydb: TDBEdit;
    ZFX_sjmddb: TDBEdit;
    ZFX_shrydb: TDBEdit;
    ZFX_bgryq: TADOQuery;
    ZFX_sjmdq: TADOQuery;
    ZFX_shryq: TADOQuery;
    dbc_reporter: TDBComboBox;
    ZFX_junshuq: TADOQuery;
    ZFX_junshus: TDataSource;
    ZFX_junshudb: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnappend: TBitBtn;
    ADOQuery1: TADOQuery;
    rvaddtemp: TRvDataSetConnection;
    dbc_age: TDBComboBox;
    ZFX_YX: TADOQuery;
    Button1: TButton;
    dbc_lczd: TDBComboBox;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnStartScanClick(Sender: TObject);
    procedure btnExtractClick(Sender: TObject);
    procedure btnAnalysisClick(Sender: TObject);
    procedure btnYmAnalysisClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure cb_germtypeClick(Sender: TObject);
    procedure dbc_sexKeyPress(Sender: TObject; var Key: Char);
    procedure cb_germtypeKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_bbKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_lczdKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_sjKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_reporterKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sjmdKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_shysKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_bbhKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_ageKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_jznameClick(Sender: TObject);
    procedure dbe_jznameChange(Sender: TObject);
    procedure btnappendClick(Sender: TObject);
    procedure dbc_ageKeyPress(Sender: TObject; var Key: Char);
    procedure rsYptableAfterOpen(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure cb_germtypeExit(Sender: TObject);
    procedure dbc_lczdKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    js, originjs: string;
    hpr: zHelper;
    dbe_jznameChge, bHumanInput: boolean;
    bbid: integer;
  public
    { Public declarations }
    saved: boolean;
    SQLText: string;
    bNewPatient: boolean;
    bNoScanInput: boolean;
    chkboxes: array[1..30] of tcheckbox; //生化反应
    lbContent: array[1..24] of tlabel; //24个生化药品标签
    lbComplement: array[1..6] of tlabel; //6 个of辅助标签
    zDbHelper: dbhelper;
    ymChkboxes: array[1..3, 1..24] of tcheckbox; //药敏反应
    ymlabel: array[1..9] of tlabel;
    ymlabel2: array[1..24] of tlabel;

    procedure createContentLabel(gtype: string);
    procedure createCheckbox;
    procedure createComplementLabel(gtype: string);
    procedure ComplementCheckbox;
    procedure createYmCheckbox;
    procedure setYmCheckbox;
    procedure createYmLabel;
    procedure createYmLabel2;
//  procedure createYmLabel23;
    procedure createYmLabel234;
    procedure addBaseNewRecord;
    procedure updateBioCheckbox(ofispositive: boolean; bioispositive: array of boolean);
    function getid: integer;
    procedure setJs;
    procedure Print;
    procedure ExportWord;
    procedure initGrid;
    procedure updateGrid;
    procedure updateGrid1(s1: integer);
  end;
function convertstring(source: string): string;
var
  zkAnalysisForm: TzkAnalysisForm;

implementation

uses dbym, Bio, common, Meds, regZkfrm, germAnalysisFrm, loginfrm,
  appendYpfrm, colorfrm, flash, sreport;

{$R *.dfm}

procedure TzkAnalysisForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  aform: tform;
begin
  if (dmym.rsBaseZk.state = dsinsert) or (dmym.rsBaseZk.state = dsedit) then
    dmym.rsBaseZk.Cancel;
  Action := cafree;
  aform := self.Owner as TForm;
  aform.Show;
end;

procedure TzkAnalysisForm.FormCreate(Sender: TObject);
var
  strlist: tstringlist;
  str: string;
begin
  str := '附'#13#10 + ' '#13#10 + '加'#13#10 + ' '#13#10 + '药'#13#10 + ' '#13#10 + '品';
  btnappend.Caption := str;

  bHumanInput := false;
  bNewPatient := true;
  saved := false;

  strlist := tstringlist.Create;
  zDbHelper := dbhelper.create;
  zDbHelper.getGermType(strlist);
  cb_germType.Items := strlist;
  strlist.clear;

  zDbHelper.getBBType(strlist);
  dbc_bb.Items := strlist;
  strlist.clear;

  zDbHelper.getSjmd(strlist);
  dbc_sjmd.Items := strlist;
  strlist.Clear;

  ZDBhelper.getLczd(strlist);
  dbc_lczd.Items := strlist;
  strlist.Clear;

  strlist.free;
  dbc_reporter.Items.Add(userNamehfut);
  dbc_SHYS.Items.Add(userNamehfut);
  dbc_SHYS.Items.Add('');
  createCheckbox;
  //createContentLabel('js');
  ComplementCheckbox;
  //createComplementLabel('js');
  createymCheckbox;
  createymLabel;
  createymLabel2;
 // createymLabel23;
  createymLabel234;
 //初始化性别下拉
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('Select sex from ZFX_XB order by sex');
    open;
    if recordCount > 0 then
    begin
      while not eof do
      begin
        dbc_sex.Items.Add(fieldbyname('sex').asstring);
        next;
      end;
    end;
  end;
//初始化性别下拉
  initGrid;
  rvproject1.ProjectFile := rvfile;
end;

procedure tzkAnalysisForm.updateBioCheckbox(ofispositive: boolean; bioispositive: array of boolean);
var
  i: integer;
begin
  for i := 1 to 30 do
  begin
    if bioIsPositive[i - 1] = true then
    begin
      chkboxes[i].Checked := true;
    end else
      chkboxes[i].Checked := false;
  end;
  if ofispositive and (js = '01') then
  begin
    chkboxes[27].Visible := false;
    chkboxes[28].Visible := false;
    chkboxes[29].visible := false;
    chkboxes[30].visible := false;
  end;
  if (not ofispositive) and (js = '01') then
  begin

    lbComplement[3].Caption := '果糖  ';
    lbComplement[4].Caption := '葡萄糖  ';
    lbComplement[5].Caption := '溶血(人工输入)  ';
  end;
end;

function tzkAnalysisForm.getId: integer;
begin
  result := dmym.rsbasezk['useid'].asinteger;
end;

procedure tzkAnalysisForm.initGrid;

begin
  with sGrid do
  begin
    rowcount := 5;
    colCount := 5;
    colwidths[0] := 20;
    cells[0, 0] := '';
    colwidths[1] := 70;
    cells[1, 0] := '药品名称';
      //colwidths[1]:=20;
    cells[2, 0] := 'ug/ml';
      // colwidths[2]:=40;
    cells[3, 0] := '药敏结果';
      // colwidths[3]:=10;
    cells[4, 0] := '分组';
  end;
end;

procedure tzkAnalysisForm.updateGrid;
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

      while not eof do
      begin
        if i > rowcount then
          rowcount := rowcount + 1;
        Cells[0, i] := inttostr(i);
        if Varisnull(fieldValues['ypmc']) then
          cells[1, i] := ' '
        else
          cells[1, i] := fieldvalues['ypmc'];
        if Varisnull(fieldValues['mic']) then
          cells[2, i] := ' '
        else
          cells[2, i] := fieldvalues['mic'];
        if Varisnull(fieldValues['mg']) then
          cells[3, i] := ' '
        else
          cells[3, i] := fieldvalues['mg'];
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

procedure tzkAnalysisForm.updateGrid1(s1: integer);
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
      sql.add('select * from ypbasezk where useid=:s1');
      parameters.ParamByName('s1').Value := s1;
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

procedure tzkAnalysisForm.setJs;
var
  jsname: string;

begin
    //1--get js
  if cb_germtype.Text <> '' then
  begin
    jsname := trim(cb_germtype.Text);
    with dmym.query1 do
    begin
      close;
      sql.clear;
      sql.Add('select * from germtype where germtype=:jsname');
      parameters.ParamByName('jsname').Value := jsname;
      open;
      if recordCount < 1 then
        showMessage(fieldbyname('germindex').Value);
      js := fieldbyname('germindex').Value;
    end;
  end;
    {//init the arrayes
    for i:=1 to length(bioIsPositive) do
      bioIsPositive[i]:=false;
    }
end;

procedure tzkAnalysisForm.addBaseNewRecord;
begin
  with dmym.rsbasezk do
  begin
      //active:=false;
    active := true;
    append;
    edit;
  end;
  with dmym do
  begin
      //rsbasezk['name']:='';
      //rsbasezk['kb']:='';
    rsbasezk['sex'] := '';
    rsbasezk['bb'] := '';
    rsbasezk['bbh'] := '';
    if timetype = 'now' then
    begin
      rsbasezk['cydate'] := now;
      rsbasezk['repdate'] := now;
    end else
    begin
      rsbasezk['cydate'] := date;
      rsbasezk['repdate'] := date;
    end;

    rsbasezk['lczd'] := '';
    rsbasezk['old'] := '';
    rsbasezk['sj'] := '';
    rsbasezk['age'] := '岁';
      //rsbasezk['bgys']:='';
      //rsbasezk['shys']:='';
    rsbasezk['bgys'] := userNamehfut;
  end;
end;

procedure TzkAnalysisForm.createYmCheckbox;
var
  i, j, k: integer;
  w, h: integer;
begin
  w := trunc((panel2.Width - 5) / 14);
  h := trunc((panel2.Height - 20) / 8);
  //创建2列，每列12行，每列三小行
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
  {w:=trunc((panel2.Width-10)/3);
  h:=trunc((panel2.Height-40)/8);
  //创建三列，每列8行，每行三小列
  for i:=1 to 3 do
    for j:=1 to 8 do
      for k:=1 to 3 do
      begin
        ymChkboxes[k,j+(i-1)*8]:=tcheckbox.Create(self);
        with ymChkboxes[k,j+(i-1)*8] do
        begin
          parent:=panel2;
          top:=30+(j-1)*h;
          left:=30+(k-1)*25+(i-1)*w;
          width:=15;
        end;
      end; }
end;

procedure TzkAnalysisForm.setYmCheckbox;
var
  i, j, k: integer;
  w, h: integer;
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

procedure tzkAnalysisForm.createYmLabel;
var
  i, j: integer;
  w, h: integer;

begin
 //create 耐药、中介、敏感
  w := trunc((panel2.Width - 5) / 14);
  h := trunc((panel2.Height - 20) / 8);
  for i := 1 to 2 do
    for j := 1 to 3 do
    begin
      ymlabel[j + (i - 1) * 3] := tlabel.Create(self);
      with ymlabel[j + (i - 1) * 3] do
      begin
        parent := panel2;
        if (j + (i - 1) * 3) >= 4 then
          top := (j + (i - 1) * 3) * h + 35
        else
          top := (j + (i - 1) * 3) * h + 5;
        left := 5;
        parentfont := true;
      //font.height:=3;
        visible := true;
      end;
      ymlabel[1].Caption := '耐药(C)'; ymlabel[4].Caption := '耐药(F)';
      ymlabel[2].Caption := '中介(D)'; ymlabel[5].Caption := '中介(G)';
      ymlabel[3].Caption := '敏感(E)'; ymlabel[6].Caption := '敏感(H)';
    end;

 { //create 耐药、中介、敏感
  w:=trunc((panel2.Width-10)/3);
  h:=trunc((panel2.Height-40)/8);
  for i:=1 to 3 do
  for j:=1 to 3 do
  begin
    ymlabel[j+(i-1)*3]:=tlabel.Create(self);
    with ymlabel[j+(i-1)*3] do
    begin
      parent:=panel2;
      top:=10;
      left:=30+(j-1)*25+(i-1)*w;
      parentfont:=true;
      //font.height:=3;
      visible:=true;
    end;
  ymlabel[1].Caption:='耐药';ymlabel[4].Caption:='耐药'; ymlabel[7].Caption:='耐药';
  ymlabel[2].Caption:='中介';ymlabel[5].Caption:='中介'; ymlabel[8].Caption:='中介';
  ymlabel[3].Caption:='敏感';ymlabel[6].Caption:='敏感'; ymlabel[9].Caption:='敏感';
  end;}

end;

procedure tzkAnalysisForm.createYmLabel2;
var
  i, j: integer;
  w, h: integer;
begin
  w := trunc((panel2.Width - 5) / 14);
  h := trunc((panel2.Height - 20) / 8);
  for i := 1 to 2 do
    for j := 1 to 12 do
    begin
      ymlabel[j + (i - 1) * 12] := tlabel.Create(self);
      with ymlabel[j + (i - 1) * 12] do
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
 { w:=trunc((panel2.Width-10)/3);
  h:=trunc((panel2.Height-40)/8);
  for i:=1 to 3   do
    for j:=1 to 8 do
    begin
      ymlabel[j+(i-1)*8]:=tlabel.Create(self);
      with ymlabel[j+(i-1)*8] do
      begin
        caption:=inttostr(j+(i-1)*8);
        parent:=panel2;
        top:=30+(j-1)*h;
        left:=10+ (i-1)*w;
        visible:=true;
      end;
    end;}
end;

procedure tzkAnalysisForm.CreateCheckbox;
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
          Top := 40 + (i - 1) * h
        else
          Top := 20 + (i - 1) * h;
        // Alignment:=taleftJustify;
        //caption:=inttostr(j+(i-1)*12);
        width := 30;
        visible := true;
      end;
    end;
   {w:=trunc(panel1.Width/3);
   h:=trunc((panel1.Height-20)/12);

   for i:=1 to 30 do
     chkboxes[i]:=tcheckbox.Create(self);
   for i:=1 to 2 do
   for j:=1 to 12 do
   begin
      with chkboxes[j+(i-1)*12] do
      begin
        parent:=panel1;
        Left:=10+(i-1)*w;
        Top:=10+(j-1)*h;
        Alignment:=taleftJustify;
        caption:=inttostr(j+(i-1)*12);
        width:=35;
        visible:=true;
      end;
   end;}
end;

procedure TzkAnalysisForm.createComplementLabel(gtype: string);
var
  i, j, k: integer;
  w, h: integer;
  str: string;
begin
  for i := 1 to 6 do
    if lbComplement[i] <> nil then
      lbComplement[i].Free;
  h := trunc((gbinput.height - 10) / 6);
   //创建6个辅助标签
  for i := 1 to 6 do
    lbComplement[i] := tlabel.create(self);
   //set the lables;
  with dmym.query1 do
  begin
    close;
    sql.Clear;
    sql.add('select * from board where js=:gtype and btype=2 order by bjs ');
    parameters.parambyname('gtype').value := gtype;
    open;

    first;
    next;
    k := fieldbyname('b25').FieldNo - 1;
    for i := 1 to 6 do
      with lbComplement[i] do
      begin
        parent := gbinput;
        top := 18 + (i - 1) * h;
        left := 10 + 30;
        if varisnull(fields[k].Value) then
          str := ''
        else
        begin
          inc(j);
          str := fields[k].AsString;
        end;
        if fields[k].Asstring = '0' then
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

procedure tzkAnalysisForm.ComplementCheckbox;
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

procedure TzkAnalysisForm.createContentLabel(gtype: string);
var
  i, j: integer;
  k: integer; //指示表中字段b1的位置
  w, h: integer;
begin
  w := trunc((panel1.Width - 160) / 13);
  h := trunc(panel1.Height / 3);
   //w:=trunc(panel1.Width/3);
   //h:=trunc((panel1.Height-20)/12);
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
    next;
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
            caption := convertstring(fields[k].asstring);
          if (j + (i - 1) * 12) > 12 then
            left := 31 + (j + (i - 1) * 12 - 13) * w
          else
            left := 31 + (j + (i - 1) * 12 - 1) * w;
          if (j + (i - 1) * 12) > 12 then
            top := h + 60
          else
            top := h - 20;
          autosize := true;
          visible := true;
          inc(k);
        end;
      end;
  end;
end;

procedure TzkAnalysisForm.FormShow(Sender: TObject);
var
  str, str1: string;
  idx: integer;
begin
  if bNewpatient then
  begin
    addBaseNewRecord;
    str1 := 'delete from ypaddtmp'; // 清空 此次附加药品 数据容器table中的内容。。以免
                                  // 下一次再做标本时候 打印上一次附加药品的内容
    dmym.conn.Execute(str1);
    dbc_reporter.Enabled := false;
    btnstartscan.Enabled := true;
    BtnAnalysis.Enabled := true;
    BtnYmAnalysis.Enabled := false;
    BtnSave.Enabled := false;
    BtnPrint.Enabled := false;
  end else
  begin
    dmym.rsBasezk.Active := true;
    dmym.rsBasezk.Edit;
    str := dmym.rsBasezk['orignjs'];
    if (str <> '') or (str <> '00') then
    begin
      idx := zdbhelper.getIndex(str);
      cb_germtype.ItemIndex := idx;
    end;
     //更新药物标签
    btnstartscanclick(self);
    btnstartscan.Enabled := false;
    btnAnalysis.Enabled := false;
    BtnYmAnalysis.Enabled := false;
    BtnSave.Enabled := false;
    BtnPrint.Enabled := false;
    dbc_reporter.Enabled := false;
    createContentLabel(str);
    createComplementLabel(str);
  end;
end;

procedure TzkAnalysisForm.btnStartScanClick(Sender: TObject);
begin
  if cb_germtype.Text = '' then
  begin
    showMessage('请选择菌属');
    exit;
  end;
  if dbe_bbh.Text = '' then
  begin
    showmessage('****请输入标本号****');
    exit;
  end;
  btnstartscan.Enabled := false;
  if bNewPatient then
    hpr := zHelper.create(js, 'ypbasezk', self, bNewPatient, 0)
  else
    hpr := zHelper.create(js, 'ypbasezk', self, bNewPatient, dmym.rsbasezk['useid']);
  hpr.setRs(dmym.rsBasezk);
  //hpr.setNewPatient(bNewPatient);
  hpr.startCheck;
  btnstartscan.Enabled := true;
  btnAnalysis.Enabled := true;
end;

procedure TzkAnalysisForm.btnExtractClick(Sender: TObject);
var
  rfrm: tregZkForm;
begin
  rfrm := TRegzkForm.create(self);
  rfrm.bExtract := true;
  rfrm.showmodal;
  if rfrm.extracted then
  begin
    with dmym.exquery do
    begin
      dbe_bbh.Text := fieldbyname('bbh').asstring;
      dbe_age.text := fieldbyname('old').asstring;
      dbc_age.Text := fieldbyname('age').AsString;
      dbc_sex.text := fieldbyname('sex').asstring;
      dbe_cyDate.text := fieldbyname('cydate').asstring;
      dbc_bb.text := fieldbyname('bb').asstring;
      dbe_sj.Text := fieldbyname('sj').asstring;
      dbc_sjmd.text := fieldbyname('sjmd').asstring;
      dbc_lczd.Text := fieldbyname('lczd').asstring;
           // dbe_reportdate.text:=fieldbyname('repdate').asstring;
      dbc_reporter.Text := fieldbyname('bgys').asstring;
      dbc_shys.Text := fieldbyname('shys').asstring;
            //dbe_hours.Text:=fieldbyname('hhour').asstring;
      bbid := fieldbyname('id').AsInteger;
    end;
  end;
  if not (dmym.rsbasezk.State = dsInsert) then
    dmym.rsbasezk.Append;
end;

procedure TzkAnalysisForm.btnAnalysisClick(Sender: TObject);
begin
  if cb_germtype.Text = '' then
  begin
    showMessage('请选择菌属');
    exit;
  end;
  if dbe_bbh.Text = '' then
  begin
    showmessage('****请输入标本号****');
    exit;
  end;
  if bNewPatient then
    hpr := zHelper.create(js, 'ypbasezk', self, bNewPatient, 0)
  else
    hpr := zHelper.create(js, 'ypbasezk', self, bNewPatient, dmym.rsbasezk['useid']);
  hpr.setRs(dmym.rsBase);
  //hpr.setNewPatient(bNewPatient);
  hpr.setAllResults;
  btnYmAnalysis.Enabled := true;

  dmym.rsCheck.Active := false;
  hpr.analyzeBio;
  btnYmAnalysis.Enabled := true;
  btnSave.Enabled := false;
  dmym.rsBasezk['jzname'] := dbe_jzname.Text;
end;

procedure TzkAnalysisForm.btnYmAnalysisClick(Sender: TObject);
var i: integer;
  str, bz: string;
begin
  hpr.analyzeYm;
  with sgrid do
    for i := 0 to 30 do
    begin
      if cells[4, i] = 'NA' then
      begin
        str := cells[1, i];
        with dmym.query1 do
        begin
          close;
          sql.Clear;
          sql.add('select bz  from ypall where ypmc=''' + str + '''');
          open;
          if dmym.query1.recordcount <> 0 then
            bz := dmym.query1.FieldValues['bz']
          else
            bz := '';
        end;
        if messagedlg(dbe_jzname.text + '族代耐药，根据以往经验，' + dbe_jzname.text + '对' + cells[1, i] + '应为耐药,建议对此结果复核，是否修改结果？', mtinformation, [mbyes, mbno], 0) = mryes
          then
        begin
          if cells[3, i] = '敏感' then
            cells[3, i] := '耐药';
          cells[4, i] := bz;
        end else
        begin
          cells[4, i] := bz;
          next;
        end;
      end;
    end;
  btnSave.Enabled := true;
end;

procedure TzkAnalysisForm.btnSaveClick(Sender: TObject);
var str: string;
  bbexist: boolean;
begin
  bbexist := false;
  if dbe_bbh.Text = '' then
  begin
    MessageDlg('请输入标本号', mtConfirmation, [mbOK], 0);
    exit;
  end;
  hpr.updateDatabase();
  with dmym.rsRegZk do
  begin
    active := true;
    bbexist := locate('bbh', dbe_bbh.Text, []);
    if bbexist then
      delete;
    active := false;
  end;
  saved := true;
  btnprint.Enabled := true;
  btnStartScan.Enabled := false;
  btnAnalysis.Enabled := false;
  btnsave.Enabled := false;
  btnYmAnalysis.Enabled := false;
end;

procedure TzkAnalysisForm.btnExitClick(Sender: TObject);
begin
  if saved = false then
  begin
    if (MessageDlg('结果尚未存盘，是否退出？', mtConfirmation, [mbyes, mbno], 0) = mryes) then
      close
    else
      exit;
  end;
  close;
end;

procedure TzkAnalysisForm.Print;
var
  mypage: travepage;
  mymemo: travememo;
  mydataview: travedataview;
  s: string;
  b1: boolean;
  myini: Tinifile;
begin
  if saved then
  begin
    rsYptable.Active := true;
    rvproject1.Open;
    with rvproject1.ProjMan do
    begin
      mypage := FindRavecomponent('reportzk.page1', nil) as travepage;
      mymemo := findRaveComponent('memo1', mypage) as tRaveMemo;
      mydataview := findRaveComponent('dv_ypadd', nil) as travedataview;
      mydataview.ConnectionName := 'rvaddtemp';
        {如果是真菌，打印SDD项目};
      if js = '09' then
      begin
        ReportRemarkNumber := 6;
        rvproject1.SetParam('sdd', '5、SDD:剂量依赖性敏感.');
      end
      else
        ReportRemarkNumber := 5;
      s := bcstr(dmym.rsBasezk['bc']);
      mymemo.text := s;
      if s = '' then
        b1 := false
      else
        b1 := true;

      mymemo.text := mymemo.text + ''#13#10 + nastr(b1);
    end;
    with ADOquery1 do
    begin
      close;
      sql.Clear;
      sql.add('select* from xjname where name="' + dbe_jzname.Text + '"');
      open;
    end;
    if ADOquery1.recordcount <> 0 then
      RvProject1.SetParam('egname', ADOquery1.fieldbyname('ename').asstring)
    else
      RvProject1.SetParam('egname', '');
    RvProject1.SetParam('age', dbc_age.text);
    RvProject1.SetParam('js', cb_germtype.text);
    rvproject1.SetParam('titlestr', hospitalName + '微生物检测报告单');
       (*科室打印信息设置*)
    myini := Tinifile.Create(Extractfiledir(Application.ExeName) + '\dw.ini');
    rvproject1.SetParam('Remark', myini.ReadString('DepartMent', 'Information', ''));
    myini.Free;
       //
    rvproject1.ExecuteReport('reportZk');
    rvproject1.Close;
  end;
  btnexit.Click;
end;

procedure TzkAnalysisForm.cb_germtypeClick(Sender: TObject);
var
  i, j, w, h: integer;
begin
  if dbe_bbh.Text = '' then
  begin
    showmessage('****请输入标本号****');
    exit;
  end;
   //必须先初始化全局变量。
  setJs;
   //更新药物标签
  createContentLabel(js);
  createComplementLabel(js);
  //更新checkbox
  for i := 1 to 30 do
  begin
    chkboxes[i].checked := false;
    chkboxes[i].Visible := true;
  end;
  //更新ym checkbox
  for i := 1 to 3 do
    for j := 1 to 24 do
      ymchkboxes[i, j].Checked := false;

  w := trunc((panel1.Width - 160) / 13);
  h := trunc((panel1.Height - 20) / 8);
  for i := 1 to 2 do
  //i:=1;
    for j := 1 to 12 do
    begin
      ymlabel[j + (i - 1) * 12] := tlabel.Create(self);
      with ymlabel[j + (i - 1) * 12] do
      begin
        if j + (i - 1) * 12 >= 13 then
          caption := inttostr(j + (i - 1) * 12)
        else
          caption := inttostr(j + (i - 1) * 12);
        parent := panel1;
        if j + (i - 1) * 12 >= 13 then
          top := 3 * h + 30
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

procedure TzkAnalysisForm.dbc_sexKeyPress(Sender: TObject; var Key: Char);
var ID: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbc_sex.Text = '' then
    begin
      showmessage('**请选择性别**');
      exit;
    end;
    if dbc_sex.Text <> '' then
    begin
      SQLText := 'select * from ZFX_XB';
      ID := dbc_sex.Text;
      with ZFX_zk do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ID=:ID');
        parameters.parambyname('ID').value := ID;
        open;
        if ZFX_zk.RecordCount > 0 then
          dbc_sex.Text := ZFX_zk.FieldValues['sex'];
      end;
    end;
    dbc_bb.setfocus;
  end;
end;

procedure TzkAnalysisForm.cb_germtypeKeyPress(Sender: TObject;
  var Key: Char);
var GermIndex: string;
begin
  if key = #13 then
  begin
    if cb_germtype.Text = '' then
      showmessage('**请选择菌属**');
    if cb_germtype.Text <> '' then
    begin
      GermIndex := cb_germtype.Text;
      with ZFX_junshuq do
      begin
        close;
        sql.clear;
        sql.add('select * from GermType where GermIndex=:GermIndex');
        parameters.parambyname('GermIndex').value := GermIndex;
        open;
      end;
      if ZFX_junshuq.RecordCount > 0 then
        cb_germtype.Text := ZFX_junshuq.Fieldbyname('GermType').AsString;
    end;
    dbe_age.setfocus;
  end;
end;

procedure TzkAnalysisForm.dbc_bbKeyPress(Sender: TObject; var Key: Char);
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
      with ZFX_zkbb do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ID=:ID');
        parameters.parambyname('ID').value := ID;
        open;
      end;
      if ZFX_zkbb.RecordCount > 0 then
        dbc_bb.Text := ZFX_bblxdb.Text;
    end;

{  var ID:string;
begin
  if (Key >=#32) and  not(Key in ['0'..'9','.']) then
      Key:=#0;
  if key=#13 then
  begin
   SQLText:='';
   if dbc_bb.Text='' then
      showmessage('**请选择标本类型**');
   if dbc_bb.Text<>'' then
      begin
         SQLText:='select * from bb';
         ID:=dbc_bb.Text;
         with ZFX_zkbb do
         begin
         close;
         sql.clear;
         sql.add(SQLText);
         sql.add('where ID=:ID');
         parameters.parambyname('ID').value:=ID;
         open;
         end;
         dbc_bb.Text:=ZFX_bblxdb.Text;
       end;}
    dbc_lczd.setfocus;
  end;
end;

procedure TzkAnalysisForm.dbe_lczdKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    dbe_sj.SetFocus;
end;

procedure TzkAnalysisForm.dbe_sjKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    dbc_sjmd.SetFocus;
end;

procedure TzkAnalysisForm.dbc_reporterKeyPress(Sender: TObject;
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
      with ZFX_bgryq do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ID=:ID');
        parameters.parambyname('ID').value := ID;
        open;
      end;
      if ZFX_bgryq.RecordCount > 0 then
        dbc_reporter.Text := ZFX_bgrydb.Text;
    end;
  end;
end;

procedure TzkAnalysisForm.dbc_sjmdKeyPress(Sender: TObject; var Key: Char);
var ZT_sjmdID: string;
begin
  if (Key >= #32) and not (Key in ['0'..'9', '.']) then
    Key := #0;
  if key = #13 then
  begin
    SQLText := '';
    if dbc_sjmd.Text = '' then
      showmessage('**请选择送检目的**');
    if dbc_sjmd.Text <> '' then
    begin
      SQLText := 'select * from ZT_SJ';
      ZT_sjmdID := dbc_sjmd.Text;
      with ZFX_sjmdq do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ZT_sjmdID=:ZT_sjmdID');
        parameters.parambyname('ZT_sjmdID').value := ZT_sjmdID;
        open;
      end;
      if ZFX_sjmdq.RecordCount > 0 then
        dbc_sjmd.Text := ZFX_sjmddb.Text;
    end;
    dbc_shys.setfocus;
  end;
end;

procedure TzkAnalysisForm.dbc_shysKeyPress(Sender: TObject; var Key: Char);
var ID: string;
begin
  if (Key >= #32) and not (Key in ['0'..'9', '.']) then
    Key := #0;
  if key = #13 then
  begin
    SQLText := '';
    if dbc_shys.Text <> '' then
    begin
      SQLText := 'select * from checkman';
      ID := dbc_shys.Text;
      with ZFX_shryq do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ID=:ID');
        parameters.parambyname('ID').value := ID;
        open;
      end;
      if ZFX_shryq.RecordCount > 0 then
        dbc_shys.Text := ZFX_shrydb.Text;
    end;
  end;
end;


procedure TzkAnalysisForm.dbe_bbhKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key >= #65) and (key <= #90)) or ((key >= #97) and (key <= #122)) then
    key := #0
  else
    if key = #13 then
      cb_germtype.SetFocus;
end;

procedure TzkAnalysisForm.dbe_ageKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    dbc_age.SetFocus;
end;

function convertstring(source: string): string;
var
  i, j: integer;
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

{procedure tzkAnalysisForm.createYmLabel23;
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
        top:=3*h+30
        else
        top:=5;
        if  j+(i-1)*12>=13 then
        left:=32+ (j+(i-1)*12-13)*w
        else
        left:=32+ (j-1)*w;
        visible:=true;
      end;
    end;
end;}

procedure tzkAnalysisForm.createYmLabel234;
var
  i: integer;
  h: integer;
begin
  //w:=trunc((panel1.Width-160)/13);
  h := trunc((gbinput.height - 10) / 6);
  for i := 1 to 6 do
  begin
    ymlabel[24 + i] := tlabel.Create(self);
    with ymlabel[24 + i] do
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

procedure TzkAnalysisForm.dbe_jznameClick(Sender: TObject);
begin
   {if (dmym.rsBasezk.state=dsEdit) or (dmym.rsBasezk.state=dsInsert) then
       dbe_jzname.Text:=hpr.jzname;}
end;

procedure TzkAnalysisForm.dbe_jznameChange(Sender: TObject);
begin
  if dbe_jzname.Enabled then
  begin
    btnSave.Enabled := true;
    dbe_jznameChge := true;
  end;
end;

procedure TzkAnalysisForm.btnappendClick(Sender: TObject);
var
  aform: tappendypform;
  str: string;
begin
  dmym.conn.BeginTrans; //提交事务
  str := 'delete from ypaddtmp';
  dmym.conn.Execute(str);
  dmym.conn.CommitTrans; //完成提交
  aform := tappendypform.Create(self);
  aform.ShowModal;
end;

procedure TzkAnalysisForm.dbc_ageKeyPress(Sender: TObject; var Key: Char);
var id: string;
begin
  if key = #13 then
  begin
    if (dbc_age.Text = '01') or (dbc_age.text = '1') then
      dbc_age.Text := '岁';
    if (dbc_age.Text = '02') or (dbc_age.text = '2') then
      dbc_age.Text := '月';
    if (dbc_age.Text = '03') or (dbc_age.text = '3') then
      dbc_age.Text := '天';
    if (dbc_age.Text = '04') or (dbc_age.text = '4') then
      dbc_age.Text := '小时';
    if (dbc_age.Text = '05') or (dbc_age.text = '5') then
      dbc_age.Text := '分钟';
    dbc_sex.SetFocus;
  end;
end;

procedure TzkAnalysisForm.rsYptableAfterOpen(DataSet: TDataSet);
var i: integer;
  s, str, str1, str2: string;
begin
  dataset.First;
  while not dataset.Eof do
  begin
    str := dataset.FieldValues['jfyl'];
    i := pos(';', str);
    if i > 0 then
    begin
      str1 := leftstr(str, i - 1);
      str2 := rightstr(str, length(str) - i);
      dataset.Edit;
      dataset.FieldValues['jfyl'] := str1 + ''#13#10 + str2;
    end;

    s := dataset.FieldValues['ypmc'];
    s := s + dataset.FieldValues['ename'];
    dataset.Edit;
    dataset.FieldValues['ypmc'] := s;
    dataset.FieldValues['ename'] := '';
    dataset.Next;
  end;
end;

procedure TzkAnalysisForm.Button1Click(Sender: TObject);
var afrm: Tcolorform;
begin
  if cb_germtype.text = '' then
    showmessage('请选择菌属')
  else
  begin
    afrm := Tcolorform.Create(self);
    afrm.germtype := cb_germtype.Text;
    afrm.germleft := left;
    afrm.germtop := top;
    afrm.Show;
  end;
end;

procedure TzkAnalysisForm.cb_germtypeExit(Sender: TObject);
var
  i, j, w, h: integer;
begin
  if cb_germtype.Text = '' then
  begin
    showmessage('****请选择菌属****');
    cb_germtype.SetFocus;
    exit;
  end;
   //必须先初始化全局变量。
  setJs;
   //更新药物标签
  createContentLabel(js);
  createComplementLabel(js);
  //更新checkbox
  for i := 1 to 30 do
  begin
    chkboxes[i].checked := false;
    chkboxes[i].Visible := true;
  end;
  //更新ym checkbox
  for i := 1 to 3 do
    for j := 1 to 24 do
      ymchkboxes[i, j].Checked := false;

  w := trunc((panel1.Width - 160) / 13);
  h := trunc((panel1.Height - 20) / 8);
  for i := 1 to 2 do
  //i:=1;
    for j := 1 to 12 do
    begin
      ymlabel[j + (i - 1) * 12] := tlabel.Create(self);
      with ymlabel[j + (i - 1) * 12] do
      begin
        if j + (i - 1) * 12 >= 13 then
          caption := inttostr(j + (i - 1) * 12)
        else
          caption := inttostr(j + (i - 1) * 12);
        parent := panel1;
        if j + (i - 1) * 12 >= 13 then
          top := 3 * h + 30
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

procedure TzkAnalysisForm.dbc_lczdKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if dbc_lczd.Text <> '' then
    begin
      with dmym.query1 do
      begin
        close;
        sql.clear;
        sql.add('select * from YYlczd where id=''' + dbc_lczd.Text + '''');
        open;
      end;
      if dmym.query1.RecordCount > 0 then
        dbc_lczd.Text := dmym.query1.FieldValues['lczd'];
    end;
    dbe_cydate.SetFocus;
  end;
end;

procedure TzkAnalysisForm.Button2Click(Sender: TObject);
begin
  dmym.rsBaseZk['bbh'] := zDbHelper.generateNumber('basezkno');
end;

procedure TzkAnalysisForm.ExportWord;
var wordapp, worddoc, wordtab, myrange, Template: variant;
  str1, str2: string;
  k: integer;
  myini: Tinifile;
  h: hwnd;
begin
  try
    wordapp := createoleobject('word.application');
    wordapp.visible := false;
  except
    messagebox(0, '未安装 Word应用程序,请先安装MicrosoftOffice,然后输出报表!',
      '程序未找到', mb_Ok + MB_ICONWARNING + MB_APPLMODAL);
    Abort;
  end;

  application.CreateForm(Tflashform, flashform);
  flashform.Show;
  flashform.Panel1.Caption := '正在导出到Word,请稍后...';
  flashform.Refresh;

    //设定文档模式,(*关闭拼音查找，语法查找，提高运行效率*)
  Wordapp.Options.CheckSpellingAsYouType := False;
  Wordapp.Options.CheckGrammarAsYouType := False;
  Template := ExtractFiledir(Application.Exename) + '/doc/鉴定分析报告单.dot';
  worddoc := wordapp.Documents.Add(template);
  wordtab := worddoc.tables.item(1);
    //
  try
    //{导出数据病源信息}
    wordtab.cell(1, 1).range.insertafter(hospitalName + '微生物检测报告单');
    wordtab.cell(2, 1).range.insertafter(dmym.rsBaseZk.FieldByName('bbh').AsString);
    wordtab.cell(2, 2).range.insertafter(dmym.rsBaseZk.FieldByName('js').AsString);
    wordtab.cell(2, 3).range.insertafter(dmym.rsBaseZk.FieldByName('sjmd').AsString);
    wordtab.cell(3, 1).range.insertafter(dmym.rsBaseZk.FieldByName('sex').AsString);
    wordtab.cell(3, 2).range.insertafter(dmym.rsBaseZk.FieldByName('bb').AsString);
    wordtab.cell(3, 3).range.insertafter(dmym.rsBaseZk.FieldByName('repdate').AsString);
    wordtab.cell(4, 1).range.insertafter(dmym.rsBaseZk.FieldByName('old').AsString + dmym.rsBaseZk.FieldByName('age').AsString);
    wordtab.cell(4, 2).range.insertafter(dmym.rsBaseZk.FieldByName('sj').AsString);
    wordtab.cell(4, 3).range.insertafter(dmym.rsBaseZk.FieldByName('cydate').AsString);
    wordtab.cell(5, 1).range.insertafter(dmym.rsBaseZk.FieldByName('lczd').AsString);
    wordtab.rows.item(6).delete;
    //导出诊断信息
    wordtab.cell(6, 1).range.insertafter(dmym.rsBaseZk.FieldByName('jzname').AsString);
    with ADOquery1 do
    begin
      close;
      sql.Clear;
      sql.add('select* from xjname where name="' + dbe_jzname.Text + '"');
      open;
    end;
    if ADOquery1.recordcount <> 0 then
      wordtab.cell(7, 1).range.insertafter(ADOquery1.fieldbyname('ename').asstring);
    if dbc_bb.Text = '中段尿' then
    begin
      str1 := '  菌落计数：';
      str2 := 'CFU/ml'
    end;
    wordtab.cell(8, 1).range.insertafter(dmym.rsBaseZk.FieldByName('bc').AsString + str1 + dmym.rsBaseZk.FieldByName('cfu').asstring + str2);
    //删除报表中镜检结果 行}
    wordtab.rows.item(9).delete;
    //导出药敏数据
    k := 10;
    if rsyptable.Active = false then
      rsyptable.Active := true;
    rsyptable.first;
    while not rsyptable.Eof do
    begin
      wordtab.cell(k, 1).range.insertafter(rsyptable.fieldbyname('ypmc').AsString);
      wordtab.cell(k, 2).range.insertafter(rsyptable.fieldbyname('bz').AsString);
      wordtab.cell(k, 3).range.insertafter(rsyptable.fieldbyname('mic').AsString);
      wordtab.cell(k, 4).range.insertafter(rsyptable.fieldbyname('mg').AsString);
      wordtab.cell(k, 5).range.insertafter(rsyptable.fieldbyname('jfyl').AsString);
      wordtab.Rows.item(k + 1).Select;
      wordapp.Selection.InsertRowsBelow;
      inc(k);
      rsyptable.Next;
      application.ProcessMessages;
    end;
    wordtab.rows.item(k).borders.item(-1).linestyle := 1;
    if dmym.rsAddTemp.Active = false then
      dmym.rsAddTemp.Active := true;
    if dmym.rsAddTemp.RecNo > 0 then
      while not dmym.rsAddTemp.Eof do
      begin
        wordtab.cell(k, 1).range.insertafter(dmym.rsAddTemp.fieldbyname('ypmc').AsString);
        wordtab.cell(k, 3).range.insertafter(dmym.rsAddTemp.fieldbyname('mic').AsString);
        wordtab.cell(k, 4).range.insertafter(dmym.rsAddTemp.fieldbyname('mg').AsString);
        wordtab.cell(k, 5).range.insertafter(dmym.rsAddTemp.fieldbyname('bcsm').AsString);
        wordtab.Rows.item(k + 1).Select;
        wordapp.Selection.InsertRowsBelow;
        inc(k);
        dmym.rsAddTemp.Next;
      end;
    wordtab.rows.item(k).delete; //连续删除两行
    wordtab.rows.item(k).delete;
    wordtab.rows.item(k).delete;
    //导出备注
    K := K + 4;
    if js = '09' then
    begin
      ReportRemarkNumber := 6;
      wordtab.rows.item(k).select;
      wordapp.selection.InsertRowsBelow;
      inc(k);
      ReportRemarkNumber := 6;
      wordtab.cell(k, 1).range.insertafter('5、SDD:剂量依赖性敏感.');
    end else
      ReportRemarkNumber := 5;
    if bcstr(hpr.bc) <> '' then
    begin
      wordtab.rows.item(k).select;
      wordapp.selection.InsertRowsBelow;
      inc(k);
      wordtab.cell(k, 1).range.insertafter(bcstr(hpr.bc));
    end;
    //导出审核者，送检者
    inc(k);
    if not varisnull(dmym.rsBasezk['bgys']) then
      wordtab.cell(k, 1).range.insertafter(dmym.rsBasezk['bgys']);
    if not varisnull(dmym.rsBasezk['shys']) then
      wordtab.cell(k, 2).range.insertafter(dmym.rsBasezk['shys']);
    //导出页脚
    myini := Tinifile.Create(Extractfiledir(Application.ExeName) + '\dw.ini');
    inc(k);
    wordtab.cell(k, 1).range.insertafter(myini.ReadString('DepartMent', 'Information', ''));
    myini.Free;
  except
    messagedlg('导出报表出错！', mtWarning, [mbok], 0);
  end;

  flashform.Hide;
  flashform.Free;

  wordapp.visible := true;
    //setwindowpos(findwindow(nil,'Microsoft Word 文档'),HWND_TOPMOST,0,0,0,0,SWP_SHOWWINDOW);
  setwindowpos(findwindow('NetUIHWND', nil), HWND_TOPMOST, 0, 0, 0, 0, SWP_SHOWWINDOW);
end;

procedure TzkAnalysisForm.btnPrintClick(Sender: TObject);
var reporttype: integer;
begin
  application.createform(Tsreportform, sreportform);
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
  Sendmessage(findwindow('TzkAnalysisForm', nil), WM_SYSCOMMAND, SC_CLOSE, 0);
end;

end.

