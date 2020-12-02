unit YYRepoFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave,
  Mask, Buttons, db, Grids, DBGrids, ADODB, ExcelXP, OleServer, ComCtrls, Math;

type
  TYYRepoForm = class(TForm)
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    ADODataSet1: TADODataSet;
    dbc_sjmd: TComboBox;
    BitBtn2: TBitBtn;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    BitBtn3: TBitBtn;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    Button1: TButton;
    GroupBox1: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    dbc_bb: TComboBox;
    dbc_section: TComboBox;
    dbc_germtype: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    StringGrid2: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RvSystem1Print(Sender: TObject);
   // procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    bTableTitled: boolean;
  public
    { Public declarations }

  end;

var
  YYRepoForm: TYYRepoForm;

implementation

uses dbym, common, ymdatatype, loginfrm;

{$R *.dfm}

procedure TYYRepoForm.FormShow(Sender: TObject);
begin
  DateTimePicker1.Datetime := now;
  DateTimePicker2.Datetime := now;
{if checkbox1.Checked then
 begin
  //dmym.rsbase.Active:= true;
  dbc_sjmd.Enabled :=true;
 end else
 begin
  dbc_sjmd.Enabled :=false;
  //dmym.rsbase.Active:= false;
 end;}
  StringGrid1.Cells[0, 1] := '阳性';
  StringGrid1.Cells[0, 2] := '阴性';
  StringGrid1.Cells[0, 3] := '总数';
  StringGrid1.Cells[1, 0] := '数量';
  StringGrid1.Cells[2, 0] := '比率';

  stringgrid2.Cells[0, 0] := '送检医生';
  stringgrid2.Cells[1, 0] := '送检目的';
  stringgrid2.Cells[2, 0] := '记录数';
end;

procedure TYYRepoForm.BitBtn1Click(Sender: TObject);
var
  i, j, k: integer;
  str: string;
  positivecount, negativecount: integer;
begin
  str := '';
  if (trim(dbc_germtype.text) <> '******不限******') then
    str := str + ' and js=''' + dbhelper.Create.getgermindex(trim(dbc_germtype.text)) + '''';
  if (trim(dbc_section.text) <> '******不限******') then
    str := str + ' and kb=''' + trim(dbc_section.text) + '''';
  if (trim(dbc_bb.text) <> '******不限******') then
    str := str + ' and bb=''' + trim(dbc_bb.text) + '''';
  if (trim(dbc_sjmd.Text) <> '******不限******') then
    str := str + ' and sjmd=''' + trim(dbc_sjmd.text) + '''';

  ADODataSet1.Active := false;
  ADODataSet1.CommandText := 'select count(*) as 记录数,type from' +
    ' base where repdate between #' + datetostr(DateTimePicker1.datetime) +
    '#  and  #' + datetostr(DateTimePicker2.datetime + 1) + '#' + str + ' group by type';
  ADODataSet1.Active := true;

  positivecount := 0; negativecount := 0;
  while not ADODataSet1.Eof do
  begin
    if ADODataSet1.FieldValues['type'] = '阳性报告' then
      positivecount := positivecount + ADODataSet1.FieldValues['记录数'];
    if ADODataSet1.FieldValues['type'] = '鉴定分析' then
      positivecount := positivecount + ADODataSet1.FieldValues['记录数'];
    if ADODataSet1.FieldValues['type'] = '阴性报告' then
      negativecount := ADODataSet1.FieldValues['记录数'];
    ADODataSet1.next;
  end;
  StringGrid1.Cells[1, 1] := inttostr(positivecount);
  StringGrid1.Cells[1, 2] := inttostr(negativecount);
  StringGrid1.Cells[1, 3] := inttostr(positivecount + negativecount);

  i := positivecount * 100;
  j := negativecount * 100;
  k := positivecount + negativecount;
  if k <> 0 then
  begin
    StringGrid1.Cells[2, 1] := copy(floattostr(i / k), 1, 4) + '%';
    StringGrid1.Cells[2, 2] := copy(floattostr(j / k), 1, 4) + '%';
  end else
  begin
    StringGrid1.Cells[2, 1] := '';
    StringGrid1.Cells[2, 2] := '';
  end;

  ADODataSet1.Active := false;
  ADODataSet1.CommandText := 'select count(*) as 记录数,sjmd,sj from' +
    ' base where repdate between #' + datetostr(DateTimePicker1.datetime) +
    '#  and  #' + datetostr(DateTimePicker2.datetime + 1) + '#' + str + ' group by sj,sjmd';
  ADODataSet1.Active := true;

  stringgrid2.RowCount := ADODataSet1.RecordCount + 1;
  ADODataSet1.First;
  if ADODataSet1.recordcount <> 0 then
    while not ADODataSet1.Eof do
    begin
      stringgrid2.Cells[0, ADODataSet1.recno] := ADODataSet1.Fieldbyname('sj').AsString;
      stringgrid2.Cells[1, ADODataSet1.recno] := ADODataSet1.Fieldbyname('sjmd').AsString;
      stringgrid2.Cells[2, ADODataSet1.recno] := ADODataSet1.Fieldbyname('记录数').AsString;
      ADODataSet1.next;
    end;

end;


procedure TYYRepoForm.FormCreate(Sender: TObject);
var str: Tstringlist;
  i: integer;
  db: dbhelper;
begin
  str := Tstringlist.Create;
  str.Clear;
  db := dbhelper.Create;
  db.getSjmd(str);
  dbc_sjmd.Items := str;
  dbc_sjmd.Items.Add('******不限******');
  i := dbc_sjmd.Items.IndexOf('******不限******');
  dbc_sjmd.ItemIndex := i;
  str.Clear;

  db.getGermType(str);
  dbc_germtype.Items := str;
  dbc_germtype.Items.Add('******不限******');
  i := dbc_germtype.Items.IndexOf('******不限******');
  dbc_germtype.ItemIndex := i;
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
  rvproject1.ProjectFile := rvfile;
end;

procedure TYYRepoForm.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TYYRepoForm.BitBtn3Click(Sender: TObject);
begin
  rvsystem1.Execute;
 {rvproject1.Open;
 rvproject1.SetParam('timerange',datetostr(DateTimePicker1.datetime)+'至'+datetostr(DateTimePicker2.datetime));
 rvproject1.SetParam('germtype',dbc_germtype.text);
 rvproject1.SetParam('section',dbc_section.text);
 rvproject1.SetParam('bb',dbc_bb.text);
 rvproject1.SetParam('sjmd',dbc_sjmd.text);
 rvproject1.SetParam('titlestr',hospitalname+'阴阳性比率报告单');
 rvproject1.SetParam('yinsum',StringGrid1.Cells[1,1]);
 rvproject1.SetParam('yangsum',StringGrid1.Cells[1,2]);
 rvproject1.SetParam('sum',StringGrid1.Cells[1,3]);
 rvproject1.SetParam('yinrate',StringGrid1.Cells[2,1]);
 rvproject1.SetParam('yangrate',StringGrid1.Cells[2,2]);
 rvproject1.SetParam('user',userNamehfut);
 rvproject1.SetParam('time',datetostr(date)+' '+timetostr(time));
 rvproject1.ExecuteReport('ReportYYRate');
 rvproject1.Close;}
end;

procedure TYYRepoForm.Button1Click(Sender: TObject);
var
  i, j, k: integer;
  str: string;
begin
  with ExcelApplication1 do
  begin
    disconnect;
    visible[0] := true;
    sheetsInNewWorkbook[0] := 2;
    workbooks.add(emptyparam, 0);
    excelworkbook1.connectto(workbooks[workbooks.count] as _workbook);
  end;
  with ExcelWorksheet1 do
  begin
    connectTo(excelworkbook1.sheets[1] as _worksheet);
    name := '阴阳性报告比率报表';
  end;
  k := 1;
  excelWorksheet1.cells.item[k, 1] := '菌属：' + dbc_germtype.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '科室：' + dbc_section.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '标本类型：' + dbc_bb.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '送检目的：' + dbc_sjmd.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '时间范围：' + datetostr(DateTimePicker1.date) + '至' + datetostr(DateTimePicker2.Date);
  inc(k);

  for i := 0 to StringGrid1.RowCount - 1 do
    for j := 0 to StringGrid1.ColCount - 1 do
    begin
      if varisnull(StringGrid1.Cells[j, i]) then
        str := ''
      else
        str := trim(StringGrid1.Cells[j, i]);
      excelWorksheet1.cells.item[i + k, j + 1] := str;
    end;
  with ExcelWorksheet1 do
  begin
    rows.font.Name := '宋体';
    rows.font.Size := 10;
    columns.AutoFit;
    with range[cells.item[k, 1], cells.item[k, StringGrid1.ColCount]] do
    begin
      font.Bold := true;
      horizontalalignment := xlCenter;
    end;
  end;

    //填写送检医生表
  with ExcelWorksheet1 do
  begin
    connectTo(excelworkbook1.sheets[2] as _worksheet);
    name := '送检医生统计表';
  end;
  k := 1;
  excelWorksheet1.cells.item[k, 1] := '菌属：' + dbc_germtype.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '科室：' + dbc_section.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '标本类型：' + dbc_bb.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '送检目的：' + dbc_sjmd.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '时间范围：' + datetostr(DateTimePicker1.date) + '至' + datetostr(DateTimePicker2.Date);
  inc(k);

  for i := 0 to StringGrid2.RowCount - 1 do
    for j := 0 to StringGrid2.ColCount - 1 do
    begin
      if varisnull(StringGrid2.Cells[j, i]) then
        str := ''
      else
        str := trim(StringGrid2.Cells[j, i]);
      excelWorksheet1.cells.item[i + k, j + 1] := str;
    end;
  with ExcelWorksheet1 do
  begin
    rows.font.Name := '宋体';
    rows.font.Size := 10;
    columns.AutoFit;
    with range[cells.item[k, 1], cells.item[k, StringGrid2.ColCount]] do
    begin
      font.Bold := true;
      horizontalalignment := xlCenter;
    end;
  end;
end;

procedure TYYRepoForm.RvSystem1Print(Sender: TObject);
var
  col, row: integer;
  n: integer;
  str: string;
begin
  with sender as TBaseReport do
  begin
     //打印标题
    margintop := 0.5;
    setFont('黑体', 18);
    Bold := true;
    PrintHeader(hospitalname + '阴阳性比率报告单', pjCenter);
     //标题下的粗横线
    SetPen(clBlack, psSolid, -1, pmCopy);
    moveto(0.6, 1.1);
    lineto(pagewidth - 0.6, 1.1);
    moveto(0.6, 1.13);
    lineto(pagewidth - 0.6, 1.13);
     //打印基本信息
    setfont('楷体_GB2312', 11);
    bold := false;
    ypos := ypos + 0.6;
    printcenter('菌属： ' + dbc_germtype.text, 2.8);
    printcenter('科室： ' + dbc_section.text, 5.5);
    ypos := ypos + 0.4;
    printcenter('标本类型： ' + dbc_bb.Text, 2.8);
    printcenter('时间范围： ' + datetostr(datetimepicker1.Date) + '至' + datetostr(datetimepicker2.Date), 5.5);
    ypos := ypos + 0.4;
    printcenter('送检目的： ' + dbc_sjmd.Text, 2.8);
     //打印基本信息下两条横线
    setpen(clblack, pssolid, -2, pmcopy);
    moveto(0.6, ypos + 0.2);
    lineto(pagewidth - 0.6, ypos + 0.2);
    setpen(clblack, pssolid, -1, pmcopy);
    moveto(0.6, ypos + 0.22);
    lineto(pagewidth - 0.6, ypos + 0.22);
     //打印阴阳对比表
    cleartabs;
    setFont('楷体_GB2312', 11);
    ypos := ypos + 0.5;
    setTab(1.2, pjcenter, 1.5, 0, boxlineall, 0);
    settab(na, pjcenter, 2, 0, boxlineall, 0);
    settab(na, pjcenter, 2, 0, boxlineall, 0);
    n := stringgrid1.ColCount - 1;
    for row := 0 to stringgrid1.RowCount - 1 do
    begin
      for col := 0 to n do
      begin
        Tab(0, 0, 0, 0, 10);
        print(stringgrid1.cells[col, row]);
      end;
      println('');
    end;
       //打印对比表下面横线
    setpen(clblack, pssolid, -1, pmcopy);
    ypos := ypos + 0.1;
    moveto(0.6, ypos);
    lineto(pagewidth - 0.6, ypos);
       //打印送检医生统计结果
    cleartabs;
    setFont('楷体_GB2312', 11);
    ypos := ypos + 0.5;
    setTab(1.2, pjcenter, 1.5, 0, boxlineall, 0);
    settab(na, pjcenter, 2, 0, boxlineall, 0);
    settab(na, pjcenter, 2, 0, boxlineall, 0);
    n := stringgrid2.ColCount - 1;
    for row := 0 to stringgrid2.rowcount - 1 do
    begin
      if ypos >= 10.25 then
        newpage;
      for col := 0 to n do
      begin
        Tab(0, 0, 0, 0, 10);
        print(stringgrid2.cells[col, row]);
      end;
      println('');
    end;
       //打印页脚
    marginbottom := 0.5;
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
