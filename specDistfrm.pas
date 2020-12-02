unit specDistfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB, ADODB, Grids, DBGrids,
  RpDefine, RpBase, RpSystem, ExcelXP, OleServer, DBCtrls;

type
  TSpecDistForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Dbc_GermType: TComboBox;
    Dbc_Section: TComboBox;
    Dbc_Bb: TComboBox;
    GroupBox1: TGroupBox;
    DateStart: TDateTimePicker;
    DateEnd: TDateTimePicker;
    Label4: TLabel;
    BtnQuery: TButton;
    BtnPrint: TButton;
    BtnExit: TButton;
    StringGrid1: TStringGrid;
    RsData: TADODataSet;
    RvSystem1: TRvSystem;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    ADOQuery1: TADOQuery;
    BtnToExcel: TButton;
    Label6: TLabel;
    dbc_xjname: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure RvSystem1Print(Sender: TObject);
    procedure BtnToExcelClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure Dbc_GermTypeChange(Sender: TObject);
  private
    { Private declarations }
    bTableTitled: boolean;
  public
    { Public declarations }
  end;

var
  SpecDistForm: TSpecDistForm;

implementation

uses dbym, ymDataType, common, loginfrm, flash;

{$R *.dfm}

procedure TSpecDistForm.FormCreate(Sender: TObject);
var str: Tstringlist;
  db: dbhelper;
  i: integer;
begin
  db := dbhelper.Create;
  str := tstringlist.Create;
  str.Clear;
  db.getGermType(str);
  dbc_germtype.Items := str;
    //dbc_germtype.Items.add('******不限******');
    //i:=dbc_germtype.Items.IndexOf('******不限******');
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
  with dmym.query1 do //初始化单种细菌下拉菜单
  begin
    dbc_xjname.Items.Clear;
    close;
    sql.Clear;
    sql.Add('select distinct name from xjname');
    open;

    if recordcount > 0 then
      while not Eof do
      begin
        dbc_xjname.Items.Add(fieldvalues['name']);
        next;
      end;
    dbc_xjname.Items.Add('******不限******');
    i := dbc_xjname.Items.IndexOf('******不限******');
    dbc_xjname.ItemIndex := i;
  end; //
end;

procedure TSpecDistForm.FormShow(Sender: TObject);
begin
  dateEnd.date := date;
  dateStart.date := date;
end;

procedure TSpecDistForm.BtnQueryClick(Sender: TObject);
var Str, SQLtext: string;
  db: dbhelper;
  i, j: integer;
  germindex: string;
begin
  Application.CreateForm(TFlashForm, FlashForm);
  Flashform.Show;
  Flashform.Refresh;

  db := dbhelper.Create;
  str := '';
  if Dbc_Section.Text <> '******不限******' then
    str := str + ' and kb=''' + Dbc_Section.Text + '''';
  if trim(dbc_xjname.text) <> '******不限******' then
    str := str + ' and jzname=''' + dbc_xjname.text + '''';
  if Dbc_Bb.Text <> '******不限******' then
    str := str + ' and useid in (select useid from base where bb=''' + Dbc_Bb.Text + ''')';
  if Dbc_GermType.Text <> '******不限******' then
  begin
    stringgrid1.Cells[0, 0] := Dbc_GermType.Text;
    stringgrid1.Cells[0, 1] := '药品';
    stringgrid1.Cells[1, 1] := '总检出数';
    stringgrid1.Cells[2, 1] := '敏感数';
    stringgrid1.Cells[3, 1] := '敏感率%';
    stringgrid1.Cells[4, 1] := '中敏数';
    stringgrid1.Cells[5, 1] := '中敏率%';
    stringgrid1.Cells[6, 1] := '耐药数';
    stringGrid1.Cells[7, 1] := '耐药率%';
        //填写第一列药物名称
    germindex := db.getgermindex(dbc_germtype.text);
    with dmym.query1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from ypall where js=''' + germindex + '''');
      open;

      stringgrid1.RowCount := 2 + recordcount;
      i := 2;
      while not eof do
      begin
        stringgrid1.Cells[0, i] := fieldvalues['ypmc'];
        next;
        inc(i);
      end;
    end;
    SQLText := 'select * from vw_anti where repdate between #' + datetostr(datestart.Date) + '# and #' + datetostr(dateend.Date + 1) + '#';
    SQLText := SQLText + ' and js=''' + db.getgermindex(trim(dbc_germtype.text)) + '''';
    SQLText := SQLText + str;
        // 填写第二列总检出数
    rsdata.Active := false;
    rsdata.CommandText := 'select * from base where repdate between #' + datetostr(datestart.Date) + '# and #' + datetostr(dateend.Date + 1) + '#';
    rsdata.CommandText := rsdata.CommandText + str + ' and js=''' + db.getgermindex(trim(dbc_germtype.text)) + '''';
    rsdata.Active := true;
    for i := 2 to stringgrid1.RowCount - 1 do
      stringgrid1.Cells[1, i] := inttostr(rsdata.RecordCount);
        //填写第三列第四列、敏感
    for i := 2 to stringgrid1.RowCount - 1 do
    begin
      rsdata.Active := false;
      rsdata.CommandText := SQLText + ' and ypmc=''' + stringgrid1.Cells[0, i] + ''' and mg=''敏感''';
      rsdata.Active := true;
      stringgrid1.Cells[2, i] := inttostr(rsdata.RecordCount);
      if stringgrid1.Cells[1, i] <> '0' then
        stringgrid1.Cells[3, i] := copy(floattostr(strtoint(stringgrid1.Cells[2, i]) * 100 / strtoint(stringgrid1.Cells[1, i])), 1, 4)
      else
        stringgrid1.Cells[3, i] := '0';
    end;
        //填写第五列 第六列 中敏
    for i := 2 to stringgrid1.RowCount - 1 do
    begin
      rsdata.Active := false;
      rsdata.CommandText := SQLText + ' and ypmc=''' + stringgrid1.Cells[0, i] + ''' and mg=''中介''';
      rsdata.Active := true;
      stringgrid1.Cells[4, i] := inttostr(rsdata.RecordCount);
      if stringgrid1.Cells[1, i] <> '0' then
        stringgrid1.Cells[5, i] := copy(floattostr(strtoint(stringgrid1.Cells[4, i]) * 100 / strtoint(stringgrid1.Cells[1, i])), 1, 4)
      else
        stringgrid1.Cells[5, i] := '0';
    end;
        //填写第七列 第八列 中敏
    for i := 2 to stringgrid1.RowCount - 1 do
    begin
      rsdata.Active := false;
      rsdata.CommandText := SQLText + ' and ypmc=''' + stringgrid1.Cells[0, i] + ''' and mg=''耐药''';
      rsdata.Active := true;
      stringgrid1.Cells[6, i] := inttostr(rsdata.RecordCount);
      if stringgrid1.Cells[1, i] <> '0' then
        stringgrid1.Cells[7, i] := copy(floattostr(strtoint(stringgrid1.Cells[6, i]) * 100 / strtoint(stringgrid1.Cells[1, i])), 1, 4)
      else
        stringgrid1.Cells[7, i] := '0';
    end;
  end else
  begin
        //**************************
        //当不限制均属时候的功能代码
        //**************************
  end;
  FlashForm.hide;
end;

procedure TSpecDistForm.BtnPrintClick(Sender: TObject);
begin
  rvSystem1.Execute;
end;

procedure TSpecDistForm.RvSystem1Print(Sender: TObject);
var
  col, row: integer;
  n: integer;
  str, strtemp: string;
  bw: double;
begin
    //只能打印单种药物
  bw := 0.4;
  with sender as TBaseReport do
  begin
     //打印标题
    margintop := 0.5;
    setFont('楷体_GB2312', 18);
    Bold := true;
    PrintHeader(hospitalname + '抗生素效能报告单', pjCenter);
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
    printcenter('菌属： ' + dbc_germtype.text, 2.8);
    printcenter('科室： ' + dbc_section.text, 5.5);
    ypos := ypos + 0.4;
    printcenter('标本类型： ' + dbc_bb.Text, 2.8);
    printcenter('细菌名称： ' + dbc_xjname.Text, 5.5);
    ypos := ypos + 0.4;
    printcenter('时间范围： ' + datetostr(datestart.Date) + '至' + datetostr(dateend.Date), 2.8);
     //打印基本信息下两条横线
    setpen(clblack, pssolid, -2, pmcopy);
    moveto(0.3, ypos + 0.2);
    lineto(pagewidth - 0.3, ypos + 0.2);
    setpen(clblack, pssolid, -1, pmcopy);
    moveto(0.3, ypos + 0.22);
    lineto(pagewidth - 0.3, ypos + 0.22);
     //打印表
    cleartabs;
    setFont('楷体_GB2312', 11);
    ypos := ypos + 0.5;
    setTab(0.8, pjcenter, 1.5, 0, BOXLINENONE, 0);
    n := stringgrid1.colcount;
    for col := 1 to n - 1 do
    begin
      setTab(na, pjcenter, 0.8, 0, BOXLINENONE, 0);
    end;
    for col := 0 to n - 1 do
    begin
      Tab(0, 0, 0, 0, 10);
      str := stringgrid1.cells[col, 1];
      print(str);
    end;
    setFont('楷体_GB2312', 11);
    ypos := ypos + 0.05;
    row := 0;
    println('');
    setTab(0.8, pjcenter, 1.5, 0, 0, 0);
    for col := 1 to n - 1 do
    begin
      setTab(na, pjcenter, 0.8, 0, BOXLINENONE, 0);
    end;
    for row := 2 to stringgrid1.rowcount - 1 do
    begin
      for col := 0 to n - 1 do
      begin
        Tab(0, 0, 0, 0, 10);
        str := stringgrid1.cells[col, row];
        if varisnull(str) then
          str := ' ';
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

procedure TSpecDistForm.BtnToExcelClick(Sender: TObject);
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
    name := '抗生素效能表报表';
  end;

  k := 1;
  excelWorksheet1.cells.item[k, 1] := '菌属：' + dbc_germtype.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '科室：' + dbc_section.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '标本类型：' + dbc_bb.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '细菌名称：' + dbc_xjname.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '时间范围：' + datetostr(DateStart.date) + '至' + datetostr(Dateend.Date);
  inc(k);

  for i := 0 to stringgrid1.rowCount - 1 do
    for j := 0 to stringgrid1.colcount - 1 do
    begin
      if varisnull(stringgrid1.Cells[j, i]) then
        str := ''
      else
        str := trim(stringgrid1.Cells[j, i]);
      excelWorksheet1.cells.item[i + k, j + 1] := str;
    end;

  with excelWorksheet1 do
  begin
    range[cells.item[k, 1], cells.item[k, stringgrid1.colcount]].font.bold := true;
    range[cells.item[k, 1], cells.item[k, stringgrid1.colcount]].horizontalalignment := xlCenter;
  end;
  excelWorksheet1.Cells.Font.Size := 10;
  excelWorksheet1.Columns.AutoFit;
end;

procedure TSpecDistForm.BtnExitClick(Sender: TObject);
begin
  self.close;
end;

procedure TSpecDistForm.Dbc_GermTypeChange(Sender: TObject);
var str: string;
  i: integer;
begin
  str := dbhelper.Create.getgermindex(dbc_germtype.text);
  if dbc_germtype.text <> '******不限******' then
    with dmym.query1 do
    begin
      dbc_xjname.Items.Clear;
      close;
      sql.Clear;
      sql.Add('select name from xjname where js=''' + str + '''');
      open;
      if recordcount > 0 then
        while not Eof do
        begin
          dbc_xjname.Items.Add(fieldvalues['name']);
          next;
        end;
      dbc_xjname.Items.Add('******不限******');
      i := dbc_xjname.Items.IndexOf('******不限******');
      dbc_xjname.ItemIndex := i;
    end;
end;

end.
