unit statfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ComCtrls, DBCtrls, ExtCtrls, Buttons, Grids,
  ExcelXP, OleServer, RpDefine, RpBase, RpSystem;

type
  Tstatform = class(TForm)
    stgChk: TStringGrid;
    Panel1: TPanel;
    Label1: TLabel;
    btnQryData: TBitBtn;
    GroupBox1: TGroupBox;
    dlcjzname: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    dtpBegDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    chkypm: TCheckBox;
    dblyp: TDBLookupComboBox;
    dsxj: TDataSource;
    dsjz: TDataSource;
    rsJz: TADODataSet;
    rstData: TADODataSet;
    rscalc: TADODataSet;
    DataSource1: TDataSource;
    rsyp: TADODataSet;
    rsyx: TADODataSet;
    btnExit: TButton;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    SpecialRmDBCh: TCheckBox;
    SpecialRmDB: TComboBox;
    Label2: TLabel;
    dbc_germtype: TComboBox;
    dbc_section: TComboBox;
    dbc_bb: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Button1: TButton;
    RvSystem1: TRvSystem;
    btnToExcel: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnQryDataClick(Sender: TObject);
    procedure chkypmClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnToExcelClick(Sender: TObject);
    procedure SpecialRmDBChClick(Sender: TObject);
    procedure SpecialRmDBChKeyPress(Sender: TObject; var Key: Char);
    procedure chkypmKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_germtypeClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RvSystem1Print(Sender: TObject);
  private
    { Private declarations }
    bTableTitled: boolean;
    tbdata: array of array of string;
    procedure baseDate; //基本年月库
    procedure qryDistribute; //检出分布率
    procedure qrysample; //检出标本分布率
  public
    { Public declarations }
  end;

var
  statform: Tstatform;

implementation

uses dbym, ymDataType, common, loginfrm;

{$R *.dfm}

procedure TStatform.qrySample; //细菌标本中的分布率
var strqstatic, strSpecial, strSpecial1, strSpecial2, strSpecial3: string;
var i, j: integer;
var rate: real;
var Fname: string; //字段名
  str: string;
begin
    {str:='';
    if dbc_germtype.text<>'******不限******' then
       str:=str+' and js='+ }
  if SpecialRmDBCh.Checked then
  begin
    stgchk.Refresh;
    if SpecialRmDB.Text = '' then
      showmessage('********请选择耐药机制********');
    stgchk.ColCount := 7;
    stgchk.Cells[1, 0] := '同种耐药数';
    stgchk.cells[2, 0] := '同属耐药数';
    stgchk.Cells[3, 0] := '菌种检出数';
    stgchk.Cells[4, 0] := '菌属检出数';
    stgchk.Cells[5, 0] := '菌种比率';
    stgchk.Cells[6, 0] := '菌属比率';

        //同属耐药数
    strSpecial := 'select chkdate,count(chkdate) as base from base where repdate between #' + datetostr(dtpBegDate.datetime) + '# and #' + datetostr(dtpendDate.datetime + 1) + '#';
    strSpecial := strSpecial + ' and js="' + dmym.rsGermType['germindex'] + '"';
    if SpecialRmDB.Text = 'MRS' then
      strSpecial := strSpecial + ' and tsnyIDM="' + SpecialRmDB.Text + '"'
    else
      strSpecial := strSpecial + ' and tsnyID="' + SpecialRmDB.Text + '"';
    strSpecial := strSpecial + ' group by chkdate'; //base
        //同种耐药数
    strSpecial1 := 'select chkdate,count(chkdate) as same from base where repdate between #' + datetostr(dtpBegDate.datetime) + '# and #' + datetostr(dtpendDate.datetime + 1) + '#';
    strSpecial1 := strSpecial1 + ' and js="' + dmym.rsGermType['germindex'] + '"';
    if SpecialRmDB.Text = 'MRS' then
      strSpecial1 := strSpecial1 + ' and tsnyIDM="' + SpecialRmDB.Text + '"'
    else
      strSpecial1 := strSpecial1 + ' and tsnyID="' + SpecialRmDB.Text + '"';
    strSpecial1 := strSpecial1 + ' and jzname="' + dlcjzname.Text + '"';
    strSpecial1 := strSpecial1 + ' group by chkdate'; //same
        //菌属检出数
    strSpecial2 := 'select chkdate,count(chkdate) as allb from base where repdate between #' + datetostr(dtpBegDate.datetime) + '# and #' + datetostr(dtpendDate.datetime + 1) + '#';
    strSpecial2 := strSpecial2 + ' and js="' + dmym.rsGermType['germindex'] + '"';
    strSpecial2 := strSpecial2 + ' group by chkdate'; //allb
        //菌种检出数
    strSpecial3 := 'select chkdate,count(chkdate) as e from base where repdate between #' + datetostr(dtpBegDate.datetime) + '# and #' + datetostr(dtpendDate.datetime + 1) + '#';
    strSpecial3 := strSpecial3 + ' and js="' + dmym.rsGermType['germindex'] + '"';
    strSpecial3 := strSpecial3 + ' and jzname="' + dlcjzname.Text + '"'; //e
    strSpecial3 := strSpecial3 + ' group by chkdate';
        //插入数据库
    with dmym.conn do
    begin
      execute('delete from tmpstatic');
      Execute('insert into tmpstatic ' + strSpecial);
      execute('update tmpcheck,tmpstatic set tmpcheck.base=tmpstatic.base where tmpcheck.chkdate=tmpstatic.chkdate');

      execute('delete from tmpstatic');
      Execute('insert into tmpstatic ' + strSpecial1);
      execute('update tmpcheck,tmpstatic set tmpcheck.same=tmpstatic.same where tmpcheck.chkdate=tmpstatic.chkdate');

      execute('delete from tmpstatic');
      Execute('insert into tmpstatic ' + strSpecial2);
      execute('update tmpcheck,tmpstatic set tmpcheck.allb=tmpstatic.allb where tmpcheck.chkdate=tmpstatic.chkdate');

      execute('delete from tmpstatic');
      Execute('insert into tmpstatic ' + strSpecial3);
      execute('update tmpcheck,tmpstatic set tmpcheck.e=tmpstatic.e where tmpcheck.chkdate=tmpstatic.chkdate');
    end;
    rsCalc.CommandText := ' select * from tmpcheck';
    rscalc.Active := true;
    stgchk.RowCount := rscalc.RecordCount + 1;
    for i := 1 to rscalc.recordcount do
      for j := 1 to 6 do
        stgchk.Cells[j, i] := '   ';
    for i := 1 to rscalc.recordcount do //写入表格中
    begin
      stgchk.cells[0, i] := rscalc.fieldvalues['chkdate'];
      stgchk.cells[1, i] := inttostr(rscalc.fieldvalues['same']);
      stgchk.cells[2, i] := inttostr(rscalc.fieldvalues['base']);
      stgchk.cells[3, i] := inttostr(rscalc.fieldvalues['e']);
      stgchk.cells[4, i] := inttostr(rscalc.fieldvalues['allb']);

      if rscalc.fieldvalues['allb'] > 0 then
      begin
        rate := rscalc.fieldvalues['base'] / rscalc.fieldvalues['allb'] * 100;
        stgchk.cells[6, i] := trim(copy(floattostr(rate), 1, 4)) + '%';
      end
      else
      begin
        stgchk.cells[6, i] := '0';
      end;

      if rscalc.fieldvalues['e'] > 0 then
      begin
        rate := rscalc.fieldvalues['same'] / rscalc.fieldvalues['e'] * 100;
        stgchk.cells[5, i] := trim(copy(floattostr(rate), 1, 6)) + '%';
      end
      else
      begin
        stgchk.cells[5, i] := '0';
      end;
      rscalc.Next;
    end;
    stgchk.Refresh;
    rscalc.Active := false;
  end
  else
  begin
    strqstatic := 'TRANSFORM Count(useid) SELECT chkdate, Count(useid) AS 总计 FROM Base  ';
    strqstatic := strqstatic + 'where jzname="' + dlcjzname.text + '" and repdate between #' + datetostr(dtpBegDate.datetime) + '# and #' + datetostr(dtpendDate.datetime + 1) + '# GROUP BY [chkdate] PIVOT [bb]';
    rstdata.CommandText := strqstatic;
    rstdata.Active := true;

    stgchk.Refresh;
    rsCalc.CommandText := ' select * from tmpcheck';
    rscalc.Active := true;
    stgchk.RowCount := rscalc.RecordCount + 1;
    stgchk.ColCount := rstdata.FieldCount;
    for j := 1 to rstdata.fieldcount - 1 do
      stgchk.cells[j, 0] := rstdata.Fields[j].FieldName;
    for i := 1 to rscalc.recordcount do
      for j := 1 to rstdata.fieldcount - 1 do
        stgchk.Cells[j, i] := ' ';

    for i := 1 to rscalc.recordcount do //写入表格中
    begin
      stgchk.cells[0, i] := rscalc.fieldvalues['chkdate'];
      stgchk.cells[1, i] := inttostr(rscalc.fieldvalues['base']);
      if rstdata.FieldValues['chkdate'] = rscalc.FieldValues['chkdate'] then
      begin
        for j := 1 to rstdata.fieldcount - 1 do
        begin
          fname := rstdata.Fields[j].FieldName;
          if rstdata.fieldvalues[fname] <> null then
            stgchk.cells[j, i] := inttostr(rstdata.fieldvalues[fname]);
        end;
        rstdata.Next;
      end;
      rscalc.Next;
    end;
    rscalc.Active := false;
  end;

end;

procedure TStatform.qryDistribute;
var s, strqjz, strqstatic, strq, strqyx, strSpecial, strSpecial1, strSpecial2, strSpecial3: string;
  i, j: integer;
  rate: real;
  str: string;
  sum1, sum2, sum3, sum4, tsnys1, tsnys2, tsnys3: integer; //sum1 检出数，sum2 同属检出数,sum3 总检出数 sum4总阳性数
begin
  if dbc_section.text <> '******不限******' then
    str := str + ' and kb=''' + trim(dbc_section.text) + '''';
  if dbc_bb.text <> '******不限******' then
    str := str + ' and bb=''' + trim(dbc_bb.text) + '''';

  stgchk.Refresh;
  stgchk.ColCount := 8;
  stgchk.Cells[0, 0] := '细菌名称';
  stgchk.Cells[1, 0] := '检出数';
  stgchk.Cells[2, 0] := '同种检出数';
  stgchk.Cells[3, 0] := '同种分布率';
  stgchk.Cells[4, 0] := '同属全部细菌数';
  stgchk.Cells[5, 0] := '同属分布率';
  stgchk.Cells[6, 0] := '总标本数';
  stgchk.Cells[7, 0] := '总标本分布率';
        //检出数
  strSpecial := 'select jzname,count(useid) as same from base where repdate between #' + datetostr(dtpBegDate.datetime) + '# and #' + datetostr(dtpendDate.datetime + 1) + '#';
  strSpecial := strSpecial + str;
  strspecial := strSpecial + ' and js=''' + dbhelper.Create.getgermindex(trim(dbc_germtype.text)) + '''';
  if SpecialRmDBCh.Checked then
    if SpecialRmDB.Text = 'MRS' then
      strSpecial := strSpecial + ' and tsnyIDM like ''%' + SpecialRmDB.Text + '%'''
    else
      strSpecial := strSpecial + ' and tsnyID like ''%' + SpecialRmDB.Text + '%''';
  if dlcjzname.text <> '' then
    strSpecial := strSpecial + ' and jzname=''' + dlcjzname.Text + '''';
  strSpecial := strSpecial + ' group by jzname'; //same


  rscalc.Active := false;
  rscalc.CommandText := strSpecial;
  rscalc.Active := true;
  stgchk.RowCount := rscalc.RecordCount + 1;
  i := 1;
  dmym.conn.Execute('delete from tmpcheck');
  rscalc.First;
  while not rscalc.eof do
  begin
    stgchk.Cells[0, i] := rscalc.FieldValues['jzname'];
    dmym.conn.Execute('insert into tmpcheck(jzname) values(''' + rscalc.FieldValues['jzname'] + ''')');
    stgchk.Cells[1, i] := rscalc.FieldValues['same'];
    rscalc.Next;
    inc(i);
  end;

        //同种检出数
  strSpecial := 'select jzname,count(useid) as itself from base where repdate between #' + datetostr(dtpBegDate.datetime) + '# and #' + datetostr(dtpendDate.datetime + 1) + '#';
  strSpecial := strSpecial + str;
  strspecial := strSpecial + ' and js=''' + dbhelper.Create.getgermindex(trim(dbc_germtype.text)) + '''';
  strSpecial := strSpecial + ' and jzname in (select jzname from tmpcheck)';
  strSpecial := strSpecial + ' group by jzname'; //same

  rscalc.Active := false;
  rscalc.CommandText := strSpecial;
  rscalc.Active := true;
  i := 1;
  rscalc.First;
  while not rscalc.eof do
  begin
    stgchk.Cells[2, i] := rscalc.FieldValues['itself'];
    rscalc.Next;
    inc(i);
  end;

        //同属全部细菌检出数
  strSpecial := 'select count(useid) as total from base where repdate between #' + datetostr(dtpBegDate.datetime) + '# and #' + datetostr(dtpendDate.datetime + 1) + '#';
  strSpecial := strSpecial + str;
  strspecial := strSpecial + ' and js=''' + dbhelper.Create.getgermindex(trim(dbc_germtype.text)) + '''';


  rscalc.Active := false;
  rscalc.CommandText := strSpecial;
  rscalc.Active := true;
  for i := 1 to stgchk.RowCount do
    stgchk.Cells[4, i] := rscalc.FieldValues['total'];

        //总标本检出数
  strSpecial2 := 'select count(useid) as allb from base where repdate between #' + datetostr(dtpBegDate.datetime) + '# and #' + datetostr(dtpendDate.datetime + 1) + '# and type=''鉴定分析''';
  strSpecial2 := strSpecial2 + str;
  rscalc.Active := false;
  rscalc.CommandText := strSpecial2;
  rscalc.Active := true;
  for i := 1 to stgchk.RowCount do
    stgchk.Cells[6, i] := rscalc.FieldValues['allb'];
        //计算百分比
  for i := 1 to stgchk.RowCount - 1 do
  begin
    if strtoint(stgchk.Cells[2, i]) <> 0 then
    begin
      rate := strtoint(stgchk.Cells[1, i]) / strtoint(stgchk.Cells[2, i]) * 100;
      stgchk.cells[3, i] := trim(copy(floattostr(rate), 1, 4)) + '%';
    end
    else
    begin
      stgchk.cells[3, i] := '0';
    end;

    if strtoint(stgchk.Cells[4, i]) <> 0 then
    begin
      rate := strtoint(stgchk.Cells[1, i]) / strtoint(stgchk.Cells[4, i]) * 100;
      stgchk.cells[5, i] := trim(copy(floattostr(rate), 1, 4)) + '%';
    end
    else
    begin
      stgchk.cells[5, i] := '0';
    end;

    if strtoint(stgchk.Cells[6, i]) <> 0 then
    begin
      rate := strtoint(stgchk.Cells[1, i]) / strtoint(stgchk.Cells[6, i]) * 100;
      stgchk.cells[7, i] := trim(copy(floattostr(rate), 1, 4)) + '%';
    end
    else
    begin
      stgchk.cells[7, i] := '0';
    end;
  end;
end;

procedure TStatform.FormShow(Sender: TObject);
begin
  if dbhelper.Create.getgermindex(trim(dbc_germtype.text)) <> '00' then
  begin
    rsyx.Active := false;
    rsyx.CommandText := 'select *  from xjname where js=''' + dbhelper.Create.getgermindex(trim(dbc_germtype.text)) + ''' order by xjid';
    rsyx.Active := true;
  end;
  dtpEndDate.date := date;
  dtpBegdate.date := date;
  //dtpendDate.t
  stgchk.ColWidths[0] := 120;
  stgchk.ColWidths[4] := 120;
  stgchk.ColWidths[5] := 75;
  rstdata.Active := false;
end;

procedure TStatform.baseDate;
var y1, m1, y2, m2, monthNum, i: integer;
var year, month, day: word;
var strvalue: string;
begin
  decodedate(dtpbegdate.datetime, year, month, day);
  y1 := year;
  m1 := month;
  decodedate(dtpenddate.datetime, year, month, day);
  y2 := year;
  m2 := month;
  monthnum := (y2 - y1) * 12 + m2 - m1 + 1;
  with dmym.conn do
  begin
    Execute('delete from tmpCheck');
    execute('delete from tmpstatic');
    for i := 1 to monthnum do
    begin
      if (m1 < 13) then
      begin
        strvalue := inttostr(y1 * 100 + m1);
        m1 := m1 + 1;
      end
      else
      begin
        y1 := y1 + 1;
        m1 := 2;
        strvalue := inttostr(y1 * 100 + 1);
      end;
      strvalue := 'insert into tmpcheck(chkdate) values("' + strvalue + '")';
      execute(strvalue);
    end;
  end;


end;

procedure TStatform.btnQryDataClick(Sender: TObject);
begin
  qrydistribute;
  rstdata.Active := false;
end;


procedure TStatform.chkypmClick(Sender: TObject);
begin
  dblyp.Enabled := chkypm.Checked;
  rsyp.Active := false;
  rsyp.commandtext := 'select * from ypAll where js="' + dmym.rsGermType['germIndex'] + '" order by ypid';
  rsyp.Active := true;
end;

procedure TStatform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TStatform.DBLookupComboBox1Click(Sender: TObject);
begin
  rsjz.Active := false;
  if dmym.rsGermType['germindex'] <> '00' then
  begin
    rsjz.CommandText := 'select * from xjname where js=' + '"' + dmym.rsgermtype['germindex'] + '"' + ' order by xjid';
    rsjz.Active := true;
  end;

end;

procedure Tstatform.FormCreate(Sender: TObject);
var db: dbhelper;
  str: tstringlist;
  i: integer;
begin
  if dmym.rsgermtype.Active = false then
    dmym.rsgermtype.Active := true;

  db := dbhelper.Create;
  str := tstringlist.Create;
  str.Clear;
  db.getGermType(str);
  dbc_germtype.Items := str;
  dbc_germtype.ItemIndex := 0;
  str.Clear;

  db.getsection(str);
  dbc_section.Items := str;
  dbc_section.Items.Add('******不限******');
  i := dbc_section.Items.IndexOf('******不限******');
  dbc_section.ItemIndex := i;
  str.Clear;

  db.getBBType(str);
  dbc_bb.Items := str;
  dbc_bb.Items.Add('******不限******');
  i := dbc_bb.Items.IndexOf('******不限******');
  dbc_bb.ItemIndex := i;
  str.Clear;
  str.Free;

end;

procedure Tstatform.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure Tstatform.btnToExcelClick(Sender: TObject);
var
  i, j, k: integer;
  str: string;
begin
  with ExcelApplication1 do
  begin
    disconnect;
    visible[0] := true;
    sheetsInNewWorkbook[0] := 1;
    workbooks.add(emptyparam, 0);
    excelworkbook1.connectto(workbooks[workbooks.count] as _workbook);
  end;
  with ExcelWorksheet1 do
  begin
    connectTo(excelworkbook1.sheets[1] as _worksheet);
    name := '标本分布报表';
  end;
  k := 1;
  excelWorksheet1.cells.item[k, 1] := '菌属：' + dbc_germtype.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '品种：' + dbc_section.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '标本类型：' + dbc_bb.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '时间范围：' + datetostr(dtpBegDate.date) + '至' + datetostr(dtpEndDate.Date);
  inc(k);
  if SpecialRmDBCh.Checked then
  begin
    excelWorksheet1.cells.item[k, 1] := '特殊耐药机制：' + SpecialRmDB.Text;
    inc(k);
  end;
  if chkypm.Checked then
  begin
    excelWorksheet1.cells.item[k, 1] := '单种药物：' + dlcjzname.Text;
    inc(k);
  end;

  for i := 0 to stgchk.rowCount - 1 do
    for j := 0 to stgchk.colcount - 1 do
    begin
      if varisnull(stgchk.Cells[j, i]) then
        str := ''
      else
        str := trim(stgchk.Cells[j, i]);
      excelWorksheet1.cells.item[i + k, j + 1] := str;
    end;
  with excelWorksheet1 do
  begin
    range[cells.item[k, 1], cells.item[k, stgchk.colcount]].font.bold := true;
    range[cells.item[k, 1], cells.item[k, stgchk.colcount]].horizontalalignment := xlCenter;
  end;
  excelWorksheet1.Cells.Font.Size := 10;
  excelWorksheet1.Columns.AutoFit;
end;

procedure Tstatform.SpecialRmDBChClick(Sender: TObject);
begin
  SpecialRmDB.Enabled := SpecialRmDBCh.Checked;
  if not SpecialRmDBCh.checked then
    SpecialRmDB.ItemIndex := -1;
end;

procedure Tstatform.SpecialRmDBChKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if not SpecialRmDBCh.Checked then
      SpecialRmDBCh.Checked := true
    else
      SpecialRmDBCh.Checked := false;
  end;
end;

procedure Tstatform.chkypmKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if not chkypm.Checked then
      chkypm.Checked := true
    else
      chkypm.Checked := false;
  end;
end;

procedure Tstatform.dbc_germtypeClick(Sender: TObject);
begin
  rsyx.Active := false;
  if dbhelper.Create.getgermindex(trim(dbc_germtype.text)) <> '00' then
  begin
    rsyx.CommandText := 'select *  from xjname where js=''' + dbhelper.Create.getgermindex(trim(dbc_germtype.text)) + ''' order by xjid';
    rsyx.Active := true;
  end;
end;

procedure Tstatform.Button1Click(Sender: TObject);
begin
  rvsystem1.Execute;
end;

procedure Tstatform.RvSystem1Print(Sender: TObject);
var
  col, row: integer;
  n, m: integer;
  str: string;
begin
  with sender as Tbasereport do
  begin
     //打印标题
    margintop := 0.6;
    setFont('楷体_GB2312', 18);
    Bold := true;
    PrintHeader(hospitalname + '细菌分类统计报告单', pjCenter);
     //标题下的粗横线
    SetPen(clBlack, psSolid, -1, pmCopy);
    moveto(0.3, 1.1);
    lineto(pagewidth - 0.3, 1.1);
    moveto(0.3, 1.13);
    lineto(pagewidth - 0.3, 1.13);
     //打印基本信息
    setfont('楷体_GB2312', 11);
    bold := false;
    ypos := ypos + 0.6;
    printcenter('菌属： ' + dbc_germtype.text, 1);
    printcenter('品种： ' + dbc_section.text, 3.8);
    printcenter('标本类型： ' + dbc_bb.Text, 6.6);
    ypos := ypos + 0.4;
    printcenter('特殊耐药机制： ' + SpecialRmDB.text, 1);
    printcenter('单种药物： ' + dlcjzname.text, 3.8);
    printcenter('时间范围： ' + datetostr(dtpbegdate.Date) + '至' + datetostr(dtpEndDate.Date), 6.6);
     //打印基本信息下两条横线
    setpen(clblack, pssolid, -2, pmcopy);
    moveto(0.3, ypos + 0.2);
    lineto(pagewidth - 0.3, ypos + 0.2);
    setpen(clblack, pssolid, -1, pmcopy);
    moveto(0.3, ypos + 0.22);
    lineto(pagewidth - 0.3, ypos + 0.22);
     // 打印表
    cleartabs;
    setFont('楷体_GB2312', 11);
    ypos := ypos + 0.5;
    n := stgchk.colcount - 1;
    m := stgchk.rowcount - 1;
    setTab(0.5, pjcenter, 0.8, 0, boxlineall, 0);
    settab(na, pjcenter, 0.6, 0, boxlineall, 0);
    settab(na, pjcenter, 0.9, 0, boxlineall, 0);
    settab(na, pjcenter, 1, 0, boxlineall, 0);
    settab(na, pjcenter, 1.2, 0, boxlineall, 0);
    settab(na, pjcenter, 1, 0, boxlineall, 0);
    settab(na, pjcenter, 0.9, 0, boxlineall, 0);
    settab(na, pjcenter, 1, 0, boxlineall, 0);

        //for col:=1 to n do
            //settab(na,pjcenter,1.5,0,boxlineall,0);
       //打印表内容

    for row := 0 to m do
    begin
      for col := 0 to n do
      begin
        tab(0, 0, 0, 0, 10);
        if stgchk.Cells[col, row] = '' then
          str := ''
        else
          str := stgchk.Cells[col, row];
        print(str);
      end;
      println('');
    end;
        //打印页脚
    marginbottom := 0.6;
    ypos := 10.25;
    setpen(clblack, pssolid, -1, pmcopy);
    moveto(0.6, ypos);
    lineto(pagewidth - 0.6, ypos);
    ypos := ypos + 0.22;
    printleft('统计时间：' + datetostr(date) + ' ' + timetostr(time), 5.5);
    printleft('统计人员：' + userNamehfut, 0.8);
  end;
end;

end.
