unit detailfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, DB, ADODB, Grids, DBGrids, RpCon, RpConDS, rvcsdraw,
  RpBase, RpSystem, RpDefine, RpRave, rvdirectdataview, rvcsdata, rvcsstd, rvproj,
  rvclass, rvcsrpt, strutils, Buttons, ExtCtrls, Mask, ComCtrls, inifiles, comobj;

type
  Tdetailform = class(TForm)
    rstemp: TADODataSet;
    dstemp: TDataSource;
    sgrid: TStringGrid;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    rvSingle: TRvDataSetConnection;
    rvSingle2: TRvDataSetConnection;
    rvsingle3: TRvDataSetConnection;
    ADOQuery1: TADOQuery;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Label28: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label41: TLabel;
    Label40: TLabel;
    Label39: TLabel;
    Label34: TLabel;
    Label31: TLabel;
    Label30: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label37: TLabel;
    DBName: TDBEdit;
    DBAge: TDBEdit;
    DBHospital: TDBEdit;
    DBDeliverDate: TDBEdit;
    DBReportDate: TDBEdit;
    DBBed: TDBEdit;
    Label2: TLabel;
    DBAgeUnique: TDBComboBox;
    DBSex: TDBComboBox;
    DBSection: TDBComboBox;
    DBSamType: TDBComboBox;
    DBTest: TDBComboBox;
    DBDeliver: TDBComboBox;
    DBDeliverAim: TDBComboBox;
    DBReporter: TDBComboBox;
    DBChecker: TDBComboBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBJzname: TDBEdit;
    DBJzclass: TDBEdit;
    DBBc: TDBEdit;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label5: TLabel;
    DBRemark: TDBMemo;
    DBConclusion: TDBMemo;
    Label7: TLabel;
    DBCount: TDBEdit;
    Label8: TLabel;
    DBText1: TDBText;
    GermType: TLabel;
    DsMedAdd: TDataSource;
    RsMedAdd: TADODataSet;
    StatusBar1: TStatusBar;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RsMedAddAfterInsert(DataSet: TDataSet);
    procedure DBConclusionExit(Sender: TObject);
    procedure DBRemarkExit(Sender: TObject);
    procedure DBSamTypeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bezk: boolean;
    procedure germReport;
    procedure ExportWord;
  end;

var
  detailform: Tdetailform;

implementation

uses dbym, common, reportConfirmFrm, ymDataType, loginfrm, sreport, flash;

{$R *.dfm}

procedure Tdetailform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure Tdetailform.FormShow(Sender: TObject);
var i: integer;
begin
    {label7.Visible:=false;
    label8.Visible:=false;
    DBCount.Visible:=false;}
  dsTemp.AutoEdit := false;
  dsMedAdd.AutoEdit := false;
  for i := 0 to componentcount - 1 do
  begin
    if components[i] is TDBEdit then
      (components[i] as TDBEdit).ReadOnly := true;
    if components[i] is TDBCombobox then
      (components[i] as TDBCombobox).ReadOnly := true;
    if components[i] is TDBMemo then
      (components[i] as TDBMemo).ReadOnly := true;
  end;
  if bezk then
  begin
    for i := 0 to componentcount - 1 do
    begin
      if components[i] is TDBEdit then
        (components[i] as TDBEdit).DataSource := dmym.dsBaseZk;
      if components[i] is TDBCombobox then
        (components[i] as TDBCombobox).DataSource := dmym.dsBaseZk;
      if components[i] is TDBMemo then
        (components[i] as TDBMemo).DataSource := dmym.dsBaseZk;
      DBText1.DataSource := dmym.dsBaseZk;
      DBcount.DataField := '';
      DBRemark.DataField := '';
      DBconclusion.DataField := '';
      DBjzclass.DataField := '';
    end;
        {if trim(dmym.rsBasezk['cfu'])<>'' then
        begin
            label7.Visible:=true;
            label8.Visible:=true;
            DBcount.Visible:=true;
        end;}
    with rsTemp do
    begin
      Active := false;
      commandtext := 'select * from ypBasezk where useid=' + inttostr(dmym.rsBasezk['useid']) + ' order by bz'; //ypid';
      Active := true;
    end;
    with ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select GermType from GermType Where GermIndex=''' + dmym.rsBasezk['js'] + '''');
      open;
      if RecordCount <> 0 then
        GermType.Caption := fieldbyname('GermType').AsString;
    end;
    with rsMedAdd do
    begin
      Active := false;
      commandtext := 'select * from ypAddzk Where useid=' + inttostr(dmym.rsbasezk['useid']);
      Active := true;
    end;
  end else
  begin
    if not varisnull(dmym.rsBase['jjjg']) then
      if AnsiContainsStr(dmym.rsBase['jjjg'], '涂片镜检结果') then
        radiobutton1.Checked := true;
    if not varisnull(dmym.rsBase['jjjg']) then
      if AnsiContainsStr(dmym.rsBase['jjjg'], '细菌生长') then
        radiobutton2.Checked := true;
        {if trim(dmym.rsBase['cfu']) <> '' then
        begin
            label7.Visible:=true;
            label8.Visible:=true;
            DBcount.Visible:=true;
        end;}
    with rsTemp do
    begin
      Active := false;
      commandtext := 'select * from ypbase where useid=' + inttostr(dmym.rsbase['useid']) + ' order by bz'; //ypid';
      Active := true;
    end;
    with ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select GermType from GermType Where GermIndex=''' + dmym.rsBase['js'] + '''');
      open;
      if RecordCount <> 0 then
        GermType.Caption := fieldbyname('GermType').AsString;
    end;
    with rsMedAdd do
    begin
      Active := false;
      commandtext := 'select * from ypAdd Where useid=' + inttostr(dmym.rsbase['useid']);
      Active := true;
    end;
  end;
  statusbar1.Panels.Items[1].Text := '浏览';
    //dmym.rsBase.Edit;
end;

procedure Tdetailform.FormCreate(Sender: TObject);
var Strlist: Tstringlist;
  zdbhelper: dbhelper;
begin
  zdbhelper := dbhelper.Create;
  strlist := Tstringlist.Create;

  strlist.Clear;
  zdbhelper.getsex(strlist);
  DBsex.Items := strlist;

  strlist.Clear;
  zdbhelper.getSection(strlist);
  DBsection.Items := strlist;

  strlist.Clear;
  zdbhelper.getBBType(strlist);
  DBsamtype.Items := strlist;

  strlist.Clear;
  zdbhelper.getLczd(strlist);
  DBtest.Items := strlist;

  strlist.Clear;
  zdbhelper.getSjMan(strlist);
  DBDeliver.Items := strlist;

  strlist.Clear;
  zdbhelper.getSjmd(strlist);
  DBDeliverAim.Items := strlist;

  strlist.Clear;
  strlist.Free;
  zdbhelper.Free;

  DBReporter.Items.Add(usernamehfut);
  DBReporter.Items.Add('');
  DBChecker.Items.Add(usernamehfut);
  DBChecker.Items.Add('');

  DBReporter.Enabled := false;
  bezk := false;

  RvProject1.ProjectFile := rvfile;
end;

procedure Tdetailform.sgridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if acol = 0 then
    sgrid.ColWidths[0] := 25;
end;

procedure tdetailform.germReport;
var
  mydataview1, mydataview2, mydataview3: travedataview;
  mypage: travepage;
  myregion: traveRegion;
  mydataband, fjdataband: travedataband;
  jjband, titleband, pyband, bzband, fjband: traveband;
  mydatatext1, mydatatext2: travedatatext;
  rvdatatext1, rvdatatext2: travedatatext;
  mytext1, mytext2: travetext;
  myhline1, myhline2: travehline;
  str, str1: string;
  memo1: tRaveMemo;
  s, datestr, datestr2, timestr, timestr2: string;
  b1: boolean;
  BSdd: boolean;
  id: integer;
  aform: treportConfirmForm;
  RsbaseTable: TADODataset;
  myini: Tinifile;
begin
  if bezk then
  begin
    RsbaseTable := dmym.rsBaseZk;
    rvsingle.DataSet := dmym.rsBaseZk;
  end else
    RsbaseTable := dmym.rsBase;
  aform := treportConfirmForm.Create(self);
  id := RsbaseTable['useid'];
  if aform.ShowModal = mrOk then
  begin
    rvProject1.Open;
    with rvproject1.ProjMan do
    begin
      if bezk then
      begin
        myDataView1 := FindRaveComponent('dv_zk', nil) as TraveDataView;
        myDataView2 := FindRaveComponent('dv_yp2', nil) as TraveDataView;
        myDataView3 := FindRaveComponent('dv_ypadd', nil) as TraveDataView;
        mydataview1.ConnectionName := 'rvSingle';
        mydataview2.ConnectionName := 'rvSingle2';
        mydataview3.ConnectionName := 'rvSingle3';

        mypage := findRaveComponent('reportzk.page1', nil) as tRavePage;
        myRegion := findRaveComponent('region1', mypage) as tRaveRegion;
        fjdataband := findRaveComponent('databand2', mypage) as tRaveDataband;
      end else
      begin
        myDataView1 := FindRaveComponent('dataView12', nil) as TraveDataView;
        myDataView2 := FindRaveComponent('dv_yp', nil) as TraveDataView;
        myDataView3 := FindRaveComponent('dv_ypadd', nil) as TraveDataView;
        mydataview1.ConnectionName := 'rvSingle';
        mydataview2.ConnectionName := 'rvSingle2';
        mydataview3.ConnectionName := 'rvSingle3';

        mypage := findRaveComponent('report_germanalysis.page1', nil) as tRavePage;
        myRegion := findRaveComponent('dv_ypregion', mypage) as tRaveRegion;
        mydataband := findRaveComponent('dv_ypdataband', myregion) as tRaveDataband;

        mydatatext1 := findRaveComponent('datatext10', mypage) as tRavedataText;
          //mysection:=findRaveComponent('section1',mypage) as tRaveSection;
          //mysection2:=findRaveComponent('section2',mypage) as tRaveSection;
        jjband := findRaveComponent('jjband', mypage) as traveband;
        titleband := findRaveComponent('dv_ypBand', mypage) as tRaveband;
        pyband := findRaveComponent('pyBand', mypage) as tRaveband;
        bzband := findRaveComponent('bzBand', mypage) as tRaveband;
        fjband := findRaveComponent('fjband', mypage) as tRaveband;
        fjdataband := findRaveComponent('databand1', mypage) as tRaveDataband;
        mytext1 := findRaveComponent('Text9', mypage) as tRaveText; //分组表头
        rvdatatext1 := findRaveComponent('DataText3', mypage) as tRavedataText;
        mytext2 := findRaveComponent('Text11', mypage) as tRaveText; //剂量和用法的表头
        rvdatatext2 := findRaveComponent('DataText32', mypage) as tRavedataText;
      end;
        //打印镜检结果
      {if not(aform.bjj=true) then
      begin
         jjband.Visible:=false;
         titleband.PositionValue:=jjband.positionvalue;
      end;
         //打印医生评语
      if not(aform.bPy=true) then
      begin
         pyband.Visible:=false;
         bzband.PositionValue:=pyband.PositionValue;
      end;
        //打印附加药品
      if not(aform.bFj=true) then
      begin
         fjdataband.Visible:=false;
      end; }
      if not bezk then
      begin
        if aform.bjj = true then
        begin
          myhline1 := travehline.Create(jjband);
          myhline1.Parent := jjband;
          myhline1.Name := GetUniqueName('hline11', mypage, false);
          myhline1.Top := 0;
          myhline1.left := 0;
          myhline1.Width := 7.15;
          myhline1.LineWidth := 8;
          addcomponent(myhline1);
          jjband.Height := 0.2;
          dmym.rsBase.Edit;
          if dmym.rsBase['jjjg'] <> null then
            str := dmym.rsBase['jjjg'];
          dmym.rsBase['jjjg'] := str;
        end else
        begin
          dmym.rsBase.Edit;
          if dmym.rsBase['jjjg'] <> null then
            str := dmym.rsBase['jjjg'];
          dmym.rsBase['jjjg'] := '';
          jjband.Height := 0.001;
        end;
        if aform.bpy = true then
        begin
          myhline2 := travehline.Create(pyband);
          myhline2.Parent := pyband;
          myhline2.Name := GetUniqueName('hline12', mypage, false);
          myhline2.Top := 0;
          myhline2.left := 0;
          myhline2.Width := 7.15;
          myhline2.LineWidth := 8;
          addcomponent(myhline2);
          pyband.Height := 0.2;
          dmym.rsBase.Edit;
          if dmym.rsBase['yspy'] <> null then
            str1 := dmym.rsBase['yspy'];
          dmym.rsBase['yspy'] := str1;
        end else
        begin
          dmym.rsBase.Edit;
          if dmym.rsBase['yspy'] <> null then
            str1 := dmym.rsBase['yspy'];
          dmym.rsBase['yspy'] := '';
          pyband.Height := 0.001;
        end;
      end;


      //打印备注
      {真菌时候打印SDD}
      if RsbaseTable['js'] = '09' then
        BSdd := true
      else
        BSdd := False;
      if BSdd then
      begin
        ReportRemarkNumber := 6;
        rvproject1.SetParam('sdd', '5、SDD:剂量依赖性敏感.');
      end
      else
        ReportRemarkNumber := 5;
      memo1 := findRaveComponent('memo1', mypage) as tRaveMemo;
      if RsbaseTable['js'] = '19' then
      begin
        s := inttostr(ReportRemarkNumber) + '、该菌株为' + RsbaseTable['bc'];
        if RsbaseTable['bc'] = '敏感株' then
          s := s + ',敏感株是指该菌株对试验的所有药物敏感;';
        if RsbaseTable['bc'] = '单耐药株' then
          s := s + ',单耐药株是指试验药物中只有一个药物的药敏结果为耐药;';
        if RsbaseTable['bc'] = '多耐药株' then
          s := s + ',多耐药株是指试验药物中同种药物的多个药物的药敏结果为耐药;';
        if RsbaseTable['bc'] = '耐多药株' then
          s := s + ',耐多药株是指试验药物中多种药物的药敏结果为耐药;';
        if RsbaseTable['bc'] = '广泛耐药株' then
          s := s + ',广泛耐药株是指试验药物中所有药物的药敏结果皆为耐药;';
        inc(ReportRemarkNumber);
        if AnsiContainsText(RsbaseTable['jzname'], '缓慢生长的非结核') then
        begin
          s := s + #13#10 + inttostr(ReportRemarkNumber) + '、' + RsbaseTable['jzclass'];
          s := s + ':鸟(MAC)、胞内、堪萨斯、海、瘰疬、溃疡、猿猴、嗜血。';
          inc(ReportRemarkNumber);
        end;
        if AnsiContainsText(RsbaseTable['jzname'], '快速生长的非结核') then
        begin
          s := s + #13#10 + inttostr(ReportRemarkNumber) + '、' + RsbaseTable['jzclass'];
          s := s + ':脓肿、偶然、龟等分枝杆菌。';
          inc(ReportRemarkNumber);
        end;
      end else
        s := nrstr(RsbaseTable['js'], RsbaseTable['jzname']);
      s := s + bcstr(RsbaseTable['bc']);
      memo1.text := s;
    end;
    if trim(dmym.rsBase.FieldByName('cfu').asstring) <> '' then
    begin
      rvProject1.SetParam('jljs', '菌落计数:');
      rvproject1.SetParam('cfudw', 'CFU/ml');
    end;
    datestr := datetostr(RsbaseTable['repdate']);
    timestr := timetostr(RsbaseTable['repdate']);
    rvproject1.SetParam('datestr', datestr);
    rvproject1.SetParam('timestr', ' ' + timestr);
    rvproject1.SetParam('titlestr', hospitalName + '微生物检测报告单');
     (*科室打印信息设置*)
    myini := Tinifile.Create(Extractfiledir(Application.ExeName) + '\dw.ini');
    rvproject1.SetParam('Remark', myini.ReadString('DepartMent', 'Information', ''));
    if not StrToBool(Myini.ReadString('ReportConfig', 'Group', '')) then
    begin
      mytext1.Visible := false;
      rvdatatext1.Visible := false;
    end;
    if not StrToBool(Myini.ReadString('ReportConfig', 'DoseUsage', '')) then
    begin
      mytext2.Visible := false;
      rvdatatext2.Visible := false;
    end;
    myini.Free;
   //
    if bezk then
    begin
      with ADOquery1 do
      begin
        close;
        sql.Clear;
        sql.add('select* from xjname where name="' + RsbaseTable['jzname'] + '"');
        open;
      end;
      if ADOquery1.recordcount <> 0 then
        RvProject1.SetParam('egname', ADOquery1.fieldbyname('ename').asstring)
      else
        RvProject1.SetParam('egname', '');
      rvProject1.ExecuteReport('reportzk');
    end else
      rvProject1.ExecuteReport('report_germanalysis');
    rvProject1.Close;
  end;
{  if not bezk then
  begin
      dmym.rsBase.Edit;
      dmym.rsBase['jjjg']:=str;
      dmym.rsbase['yspy']:=str1;
      dmym.rsBase.Post;
  end;}
end;

procedure Tdetailform.BitBtn1Click(Sender: TObject);
var
  i, id, idex, reporttype: integer;
  bPositive: boolean;
  resultstr: string;
  timestr: string;
  mydataview1, mydataview2: travedataview;
  mytext: travetext;
  mydatatext: travedatatext;
  mypage: travepage;
  myini: Tinifile;
  s, str, str1, str2: string;
begin
  myini := Tinifile.Create(Extractfiledir(Application.ExeName) + '\dw.ini');
  try //为了给药敏前加勾，数据处理过再恢复
    dmym.conn.BeginTrans;
    id := 0;
    rstemp.Active := true;
    rstemp.first;
    rstemp.DisableControls;
    while not rstemp.Eof do
    begin
      rstemp.Edit;
      with dmym.query1 do
      begin
            // MIC折点表示
        rstemp.Fieldvalues['jfyl'] := '';
        close;
        sql.Clear;
        sql.Add('select * from specialmic where js=''' + dmym.rsBase.FieldValues['js'] + ''' and jzname=''' + dmym.rsBase.FieldValues['jzname'] + ''' and ypmc=''' + rstemp.FieldValues['ypmc'] + '''');
        open;
        if recordcount > 0 then
          while not eof do
          begin
            rstemp.Fieldvalues['jfyl'] := FieldValues['miczd'];
            next;
          end
        else
        begin
          close;
          sql.Clear;
          sql.Add('select * from specialmic where js=''' + dmym.rsBase.FieldValues['js'] + ''' and jzname=''-'' and ypmc=''' + rstemp.FieldValues['ypmc'] + '''');
          open;
          if recordcount > 0 then
            while not eof do
            begin
              rstemp.Fieldvalues['jfyl'] := FieldValues['miczd'];
              next;
            end;
        end;

        if not StrToBool(Myini.ReadString('ReportConfig', 'NoStandard', '')) then //读取文件信息来控制
        begin
          close;
          sql.Clear;
          sql.Add('select * from ZFX_YP Where js=''' + dmym.rsBase.FieldValues['js'] +
            ''' and xjname=''' + dmym.rsBase.FieldValues['jzname'] +
            ''' and bblx=''' + dmym.rsBase.FieldValues['bb'] +
            ''' and ypmc=''' + rstemp.FieldValues['ypmc'] + ''' ORDER BY ypid');
          open;
          if RecordCount > 0 then
          begin
            first;
            if FieldValues['isprint'] = 'no' then
            begin
              rstemp.Delete;
              continue;
            end;
          end;

          close;
          sql.Clear;
          sql.Add('select * from ZFX_YP Where js=''' + dmym.rsBase.FieldValues['js'] +
            ''' and xjname=''所有''' +
            ' and bblx=''' + dmym.rsBase.FieldValues['bb'] +
            ''' and ypmc=''' + rstemp.FieldValues['ypmc'] + ''' ORDER BY ypid');
          open;
          if RecordCount > 0 then
          begin
            first;
            if FieldValues['isprint'] = 'no' then
            begin
              rstemp.Delete;
              continue;
            end;
          end;

          close;
          sql.Clear;
          sql.Add('select * from ZFX_YP Where js=''' + dmym.rsBase.FieldValues['js'] +
            ''' and xjname=''' + dmym.rsBase.FieldValues['jzname'] +
            ''' and bblx=''所有''' +
            ' and ypmc=''' + rstemp.FieldValues['ypmc'] + ''' ORDER BY ypid');
          open;
          if RecordCount > 0 then
          begin
            first;
            if FieldValues['isprint'] = 'no' then
            begin
              rstemp.Delete;
              continue;
            end;
          end;

          close;
          sql.Clear;
          sql.Add('select * from ZFX_YP Where js=''' + dmym.rsBase.FieldValues['js'] +
            ''' and xjname=''所有'' and bblx=''所有'' and ypmc=''' +
            rstemp.FieldValues['ypmc'] + ''' ORDER BY ypid');
          open;
          if RecordCount > 0 then
          begin
            first;
            if FieldValues['isprint'] = 'no' then
            begin
              rstemp.Delete;
              continue;
            end;
          end;
        end;

        if not StrToBool(Myini.ReadString('ReportConfig', 'NatrualResistance', '')) then
        begin
          close;
          sql.Clear;
          sql.Add('select * from ymspecial where ymType=''+'' and js=''' +
            dmym.rsBase.FieldValues['js'] + ''' and xjName=''' + dmym.rsBase.FieldValues['jzname'] +
            ''' and ypmc=''' + rstemp.FieldValues['ypmc'] + '''');
          open;
          if RecordCount > 0 then
          begin
            rstemp.Delete;
            continue;
          end;
        end;
      end;

      if id = rstemp.FieldValues['id'] then
      begin
        rstemp.Next;
        continue;
      end;


        //剂量及用法按A,B分行显示的问题
        {str:=rstemp.FieldValues['jfyl'];
        idex:=pos(';',str);
        if idex>0 then
        begin
            str1:=leftstr(str,idex-1);
            str2:=rightstr(str,length(str)-idex);
            rstemp.Edit;
            rstemp.FieldValues['jfyl']:=trim(str1+''#13#10+str2);
        end;}
        //药物英文名称附加到中文名称后面
      s := rstemp.FieldValues['ypmc'];
      s := s + rstemp.FieldValues['ename'];
      rstemp.FieldValues['ypmc'] := s;
        //结果敏感 可用的药物前面打*
      if rstemp.FieldValues['mg'] = '敏感' then
        rstemp.FieldValues['ypmc'] := '*' + rstemp.FieldValues['ypmc']
      else
        rstemp.FieldValues['ypmc'] := '  ' + rstemp.FieldValues['ypmc'];
      id := rstemp.FieldValues['id'];
      rstemp.Next;
    end;
    myini.Free;
    rstemp.EnableControls;

    application.createform(Tsreportform, sreportform);
    if sreportform.ShowModal = mrok then
    begin
      reporttype := sreportform.reporttype;
      case reporttype of
        1: begin
            Rvsystem1.SystemSetups := Rvsystem1.SystemSetups - [ssAllowSetup];
            Rvsystem1.DefaultDest := rdPrinter;
            germreport;
          end;
        2: begin
            Rvsystem1.SystemSetups := Rvsystem1.SystemSetups - [ssAllowSetup];
            Rvsystem1.DefaultDest := rdPreview;
            germreport;
          end;
        3: ExportWord;
      end;
    end;
    sreportform.Free;

    dmym.conn.RollbackTrans;
    rstemp.Refresh;
    dmym.rsBase.Refresh;
    rstemp.EnableControls;
  except
    dmym.conn.RollbackTrans;
    myini.Free;
  end;
end;

procedure Tdetailform.BitBtn2Click(Sender: TObject);
var i: integer;
begin
  dsTemp.AutoEdit := true;
  rstemp.Edit;
  dsMedAdd.AutoEdit := true;
  for i := 0 to componentcount - 1 do
  begin
    if components[i] is TDBEdit then
      (components[i] as TDBEdit).ReadOnly := false;
    if components[i] is TDBCombobox then
      (components[i] as TDBCombobox).ReadOnly := false;
    if components[i] is TDBMemo then
      (components[i] as TDBMemo).ReadOnly := false;
  end;
  if bezk then
    dmym.rsBaseZk.Edit
  else
    dmym.rsBase.Edit;
  statusbar1.Panels.Items[1].Text := '编辑';
  showmessage('记录处于编辑状态，可修改!');
end;

procedure Tdetailform.BitBtn3Click(Sender: TObject);
var Rstable: TADODataset;
begin
  if bezk then
    Rstable := dmym.rsBaseZk
  else
    Rstable := dmym.rsBase;
  if not (Rstable.State = dsedit) then
  begin
    showmessage('记录未处于编辑状态，编辑后保存!');
    exit;
  end;
  dmym.conn.BeginTrans;
  try
    begin
      rsTemp.UpdateBatch;
        //rsTemp.Next;//指针移动到下一条，会自动保存上一条的记录的当前信息;
      rsMedAdd.Next;
      if bezk then
        dmym.rsBasezk.Post
      else
        dmym.rsBase.Post;
      dmym.conn.CommitTrans;
      showmessage('数据保存成功!');
    end;
  except
    showmessage('数据保存出错!');
    dmym.conn.RollbackTrans;
  end;
  statusbar1.Panels.Items[1].Text := '存储完毕';
end;

procedure Tdetailform.RsMedAddAfterInsert(DataSet: TDataSet);
begin
  dataset.FieldValues['useid'] := dmym.rsBase['useid'];
end;

procedure Tdetailform.DBConclusionExit(Sender: TObject);
begin
  if DBConclusion.text <> '' then
    if not AnsiContainstext(dmym.rsBase['yspy'], '检验者评语') then
      dmym.rsBase['yspy'] := '检验者评语:' + dmym.rsBase['yspy'];
end;

procedure Tdetailform.DBRemarkExit(Sender: TObject);
begin
  if DBRemark.text <> '' then
  begin
    if radiobutton1.Checked then
      if not AnsiContainsText(dmym.rsBase['jjjg'], '涂片镜检结果') then
        dmym.rsBase['jjjg'] := '涂片镜检结果：' + dmym.rsBase['jjjg'];
    if radiobutton2.Checked then
      if not AnsiContainsText(dmym.rsBase['jjjg'], '细菌生长') then
        dmym.rsBase['jjjg'] := '细菌生长：' + dmym.rsBase['jjjg'];
  end;
end;

procedure Tdetailform.DBSamTypeChange(Sender: TObject);
begin
    {if trim(DBCount.Text)<>'' then
    begin
        Label7.Visible:=true;
        Label8.Visible:=true;
        DBcount.Visible:=true;
    end else
    begin
        Label7.Visible:=false;
        Label8.Visible:=false;
        DBcount.Visible:=false;
        dbcount.Text:='';
    end;  }
end;

procedure Tdetailform.ExportWord;
var wordapp, worddoc, wordtab, myrange, Template: variant;
  str1, str2, remarkstr: string;
  k: integer;
  myini: Tinifile;
  h: hwnd;
  rsbaseTable: TADODataset;
begin
  if bezk then
  begin
    RsbaseTable := dmym.rsBaseZk;
    rvsingle.DataSet := dmym.rsBaseZk;
  end else
    RsbaseTable := dmym.rsBase;

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
  myini := Tinifile.Create(Extractfiledir(Application.ExeName) + '\dw.ini');

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
    if bezk then
    begin
      wordtab.cell(2, 1).range.insertafter(RsbaseTable['bbh']);
      wordtab.cell(2, 2).range.insertafter(RsbaseTable['js']);
      if not varisnull(RsbaseTable['sjmd']) then
        wordtab.cell(2, 3).range.insertafter(RsbaseTable['sjmd']);
      wordtab.cell(3, 1).range.insertafter(RsbaseTable['sex']);
      wordtab.cell(3, 2).range.insertafter(RsbaseTable['bb']);
      wordtab.cell(3, 3).range.insertafter(RsbaseTable['repdate']);
      wordtab.cell(4, 1).range.insertafter(RsbaseTable['old'] + RsbaseTable['age']);
      wordtab.cell(4, 2).range.insertafter(RsbaseTable['sj']);
      wordtab.cell(4, 3).range.insertafter(RsbaseTable['cydate']);
      wordtab.cell(5, 1).range.insertafter(RsbaseTable['lczd']);
      wordtab.rows.item(6).delete;
      k := 6;
    end else
    begin
      wordtab.cell(2, 1).range.insertafter(RsbaseTable['name']);
      wordtab.cell(2, 2).range.insertafter(RsbaseTable['kb']);
      wordtab.cell(2, 3).range.insertafter(RsbaseTable['sjmd']);
      wordtab.cell(3, 1).range.insertafter(RsbaseTable['sex']);
      wordtab.cell(3, 2).range.insertafter(RsbaseTable['zyh']);
      wordtab.cell(3, 3).range.insertafter(RsbaseTable['bb']);
      wordtab.cell(4, 1).range.insertafter(RsbaseTable['old'] + RsbaseTable['age']);
      wordtab.cell(4, 2).range.insertafter(RsbaseTable['bed']);
      wordtab.cell(4, 3).range.insertafter(RsbaseTable['cydate']);
      wordtab.cell(5, 1).range.insertafter(RsbaseTable['bbh']);
      wordtab.cell(5, 2).range.insertafter(RsbaseTable['sj']);
      wordtab.cell(5, 3).range.insertafter(RsbaseTable['repdate']);
      wordtab.cell(6, 1).range.insertafter(RsbaseTable['lczd']);
      k := 7;
    end;
    //导出诊断信息
    wordtab.cell(k, 1).range.insertafter(RsbaseTable['jzname']);
    inc(k);
    if bezk then
      with dmym.query1 do
      begin
        close;
        sql.Clear;
        sql.add('select* from xjname where name="' + RsbaseTable['jzname'] + '"');
        open;
        if recordcount <> 0 then
          wordtab.cell(k, 1).range.insertafter(fieldbyname('ename').asstring);
      end
    else
      wordtab.cell(k, 1).range.insertafter(RsbaseTable.FieldByName('ename').AsString);
    inc(k);
    str1 := ''; str2 := '';
    if trim(dmym.rsBase.FieldByName('cfu').asstring) <> '' then
    begin
      str1 := '  菌落计数：';
      str2 := 'CFU/ml'
    end;
    wordtab.cell(k, 1).range.insertafter(RsbaseTable.FieldByName('bc').AsString + str1 + RsbaseTable.FieldByName('cfu').asstring + str2);
    //导出镜检结果 }
    if (RsbaseTable['jjjg'] <> '') and (not varisnull(RsbaseTable['jjjg'])) then
    begin
      inc(k);
      wordtab.cell(k, 1).range.insertafter(RsbaseTable['jjjg']);
    end else
      wordtab.rows.item(k + 1).delete;
    //导出药敏数据
    k := k + 2;
    if rstemp.Active = false then
      rstemp.Active := true;
    rstemp.first;
    while not rstemp.Eof do
    begin
      wordtab.cell(k, 1).range.insertafter(rstemp['ypmc']);
      if StrToBool(Myini.ReadString('ReportConfig', 'Group', '')) then
      begin
        wordtab.cell(k, 2).range.insertafter(rstemp['bz']);
      end;
      wordtab.cell(k, 3).range.insertafter(rstemp['mic']);
      wordtab.cell(k, 4).range.insertafter(rstemp['mg']);
      if StrToBool(Myini.ReadString('ReportConfig', 'DoseUsage', '')) then
      begin
        wordtab.cell(k, 5).range.insertafter(rstemp['jfyl']);
      end;
      wordtab.Rows.item(k + 1).Select;
      wordapp.Selection.InsertRowsBelow;
      inc(k);
      rstemp.Next;
      application.ProcessMessages;
    end;
    wordtab.rows.item(k).borders.item(-1).linestyle := 1;
    if RsMedAdd.Active = false then
      RsMedAdd.Active := true;
    if RsMedAdd.RecNo > 0 then
      while not RsMedAdd.Eof do
      begin
        wordtab.cell(k, 1).range.insertafter(RsMedAdd['ypmc']);
        wordtab.cell(k, 3).range.insertafter(RsMedAdd['mic']);
        wordtab.cell(k, 4).range.insertafter(RsMedAdd['mg']);
        wordtab.cell(k, 5).range.insertafter(RsMedAdd['bcsm']);
        wordtab.Rows.item(k + 1).Select;
        wordapp.Selection.InsertRowsBelow;
        inc(k);
        RsMedAdd.Next;
      end;
    wordtab.rows.item(k).delete; //连续删除两行
    wordtab.rows.item(k).delete;
    //导出医生评语
    if (RsbaseTable['yspy'] <> '') and (not varisnull(RsbaseTable['yspy'])) then
    begin
      wordtab.cell(k, 1).range.insertafter(RsbaseTable['yspy']);
      inc(k);
    end
    else
      wordtab.rows.item(k).delete;
    //导出备注
    K := K + 4;
    if RsbaseTable['js'] = '09' then
    begin
      ReportRemarkNumber := 6;
      wordtab.rows.item(k).select;
      wordapp.selection.InsertRowsBelow;
      inc(k);
      ReportRemarkNumber := 6;
      wordtab.cell(k, 1).range.insertafter('5、SDD:剂量依赖性敏感.');
    end else
      ReportRemarkNumber := 5;
    remarkstr := nrstr(RsbaseTable['js'], RsbaseTable['jzname']);
    if remarkstr <> '' then
    begin
      wordtab.rows.item(k).select;
      wordapp.selection.InsertRowsBelow;
      inc(k);
      wordtab.cell(k, 1).range.insertafter(remarkstr);
      wordtab.cell(k, 1).borders.item(-1).linestyle := 0;
    end;
    if RsbaseTable['js'] = '19' then
    begin
      remarkstr := inttostr(ReportRemarkNumber) + '、该菌株为' + RsbaseTable['bc'];
      if RsbaseTable['bc'] = '敏感株' then
        remarkstr := remarkstr + ',敏感株是指该菌株对试验的所有药物敏感;';
      if RsbaseTable['bc'] = '单耐药株' then
        remarkstr := remarkstr + ',单耐药株是指试验药物中只有一个药物的药敏结果为耐药;';
      if RsbaseTable['bc'] = '多耐药株' then
        remarkstr := remarkstr + ',多耐药株是指试验药物中同种药物的多个药物的药敏结果为耐药;';
      if RsbaseTable['bc'] = '耐多药株' then
        remarkstr := remarkstr + ',耐多药株是指试验药物中多种药物的药敏结果为耐药;';
      if RsbaseTable['bc'] = '广泛耐药株' then
        remarkstr := remarkstr + ',广泛耐药株是指试验药物中所有药物的药敏结果皆为耐药;';
      inc(ReportRemarkNumber);
      if AnsiContainsText(RsbaseTable['jzname'], '缓慢生长的非结核') then
      begin
        remarkstr := remarkstr + #13#10 + inttostr(ReportRemarkNumber) + '、' + RsbaseTable['jzclass'];
        remarkstr := remarkstr + ':鸟(MAC)、胞内、堪萨斯、海、瘰疬、溃疡、猿猴、嗜血。';
        inc(ReportRemarkNumber);
      end;
      if AnsiContainsText(RsbaseTable['jzname'], '快速生长的非结核') then
      begin
        remarkstr := remarkstr + #13#10 + inttostr(ReportRemarkNumber) + '、' + RsbaseTable['jzclass'];
        remarkstr := remarkstr + ':脓肿、偶然、龟等分枝杆菌。';
        inc(ReportRemarkNumber);
      end;
    end else
      remarkstr := bcstr(RsbaseTable['bc']);
    if remarkstr <> '' then
    begin
      wordtab.rows.item(k).select;
      wordapp.selection.InsertRowsBelow;
      inc(k);
      wordtab.cell(k, 1).range.insertafter(remarkstr);
      wordtab.cell(k, 1).borders.item(-1).linestyle := 0;
    end;
    //导出审核者，送检者
    inc(k);
    if not varisnull(RsbaseTable['bgys']) then
      wordtab.cell(k, 1).range.insertafter(RsbaseTable['bgys']);
    if not varisnull(RsbaseTable['shys']) then
      wordtab.cell(k, 2).range.insertafter(RsbaseTable['shys']);
    //导出页脚
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

end.
