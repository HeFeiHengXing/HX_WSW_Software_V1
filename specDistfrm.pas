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
    //dbc_germtype.Items.add('******����******');
    //i:=dbc_germtype.Items.IndexOf('******����******');
  dbc_germtype.ItemIndex := 0;
  str.Clear;

  db.getsection(str);
  dbc_section.Items := str;
  dbc_section.Items.Add('******����******');
  i := dbc_section.Items.IndexOf('******����******');
  dbc_section.ItemIndex := i;
  str.Clear;

  db.getBBType(str);
  dbc_bb.Items := str;
  dbc_bb.Items.Add('******����******');
  i := dbc_bb.Items.IndexOf('******����******');
  dbc_bb.ItemIndex := i;
  str.Clear;
  str.Free;
  with dmym.query1 do //��ʼ������ϸ�������˵�
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
    dbc_xjname.Items.Add('******����******');
    i := dbc_xjname.Items.IndexOf('******����******');
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
  if Dbc_Section.Text <> '******����******' then
    str := str + ' and kb=''' + Dbc_Section.Text + '''';
  if trim(dbc_xjname.text) <> '******����******' then
    str := str + ' and jzname=''' + dbc_xjname.text + '''';
  if Dbc_Bb.Text <> '******����******' then
    str := str + ' and useid in (select useid from base where bb=''' + Dbc_Bb.Text + ''')';
  if Dbc_GermType.Text <> '******����******' then
  begin
    stringgrid1.Cells[0, 0] := Dbc_GermType.Text;
    stringgrid1.Cells[0, 1] := 'ҩƷ';
    stringgrid1.Cells[1, 1] := '�ܼ����';
    stringgrid1.Cells[2, 1] := '������';
    stringgrid1.Cells[3, 1] := '������%';
    stringgrid1.Cells[4, 1] := '������';
    stringgrid1.Cells[5, 1] := '������%';
    stringgrid1.Cells[6, 1] := '��ҩ��';
    stringGrid1.Cells[7, 1] := '��ҩ��%';
        //��д��һ��ҩ������
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
        // ��д�ڶ����ܼ����
    rsdata.Active := false;
    rsdata.CommandText := 'select * from base where repdate between #' + datetostr(datestart.Date) + '# and #' + datetostr(dateend.Date + 1) + '#';
    rsdata.CommandText := rsdata.CommandText + str + ' and js=''' + db.getgermindex(trim(dbc_germtype.text)) + '''';
    rsdata.Active := true;
    for i := 2 to stringgrid1.RowCount - 1 do
      stringgrid1.Cells[1, i] := inttostr(rsdata.RecordCount);
        //��д�����е����С�����
    for i := 2 to stringgrid1.RowCount - 1 do
    begin
      rsdata.Active := false;
      rsdata.CommandText := SQLText + ' and ypmc=''' + stringgrid1.Cells[0, i] + ''' and mg=''����''';
      rsdata.Active := true;
      stringgrid1.Cells[2, i] := inttostr(rsdata.RecordCount);
      if stringgrid1.Cells[1, i] <> '0' then
        stringgrid1.Cells[3, i] := copy(floattostr(strtoint(stringgrid1.Cells[2, i]) * 100 / strtoint(stringgrid1.Cells[1, i])), 1, 4)
      else
        stringgrid1.Cells[3, i] := '0';
    end;
        //��д������ ������ ����
    for i := 2 to stringgrid1.RowCount - 1 do
    begin
      rsdata.Active := false;
      rsdata.CommandText := SQLText + ' and ypmc=''' + stringgrid1.Cells[0, i] + ''' and mg=''�н�''';
      rsdata.Active := true;
      stringgrid1.Cells[4, i] := inttostr(rsdata.RecordCount);
      if stringgrid1.Cells[1, i] <> '0' then
        stringgrid1.Cells[5, i] := copy(floattostr(strtoint(stringgrid1.Cells[4, i]) * 100 / strtoint(stringgrid1.Cells[1, i])), 1, 4)
      else
        stringgrid1.Cells[5, i] := '0';
    end;
        //��д������ �ڰ��� ����
    for i := 2 to stringgrid1.RowCount - 1 do
    begin
      rsdata.Active := false;
      rsdata.CommandText := SQLText + ' and ypmc=''' + stringgrid1.Cells[0, i] + ''' and mg=''��ҩ''';
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
        //�������ƾ���ʱ��Ĺ��ܴ���
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
    //ֻ�ܴ�ӡ����ҩ��
  bw := 0.4;
  with sender as TBaseReport do
  begin
     //��ӡ����
    margintop := 0.5;
    setFont('����_GB2312', 18);
    Bold := true;
    PrintHeader(hospitalname + '������Ч�ܱ��浥', pjCenter);
     //�����µĴֺ���
    SetPen(clBlack, psSolid, -1, pmCopy);
    moveto(0.3, 1.1);
    lineto(pagewidth - 0.3, 1.1);
    moveto(0.3, 1.13);
    lineto(pagewidth - 0.3, 1.13);
     //��ӡ������Ϣ
    setfont('����_GB2312', 11);
    bold := false;
    ypos := ypos + 0.6;
    printcenter('������ ' + dbc_germtype.text, 2.8);
    printcenter('���ң� ' + dbc_section.text, 5.5);
    ypos := ypos + 0.4;
    printcenter('�걾���ͣ� ' + dbc_bb.Text, 2.8);
    printcenter('ϸ�����ƣ� ' + dbc_xjname.Text, 5.5);
    ypos := ypos + 0.4;
    printcenter('ʱ�䷶Χ�� ' + datetostr(datestart.Date) + '��' + datetostr(dateend.Date), 2.8);
     //��ӡ������Ϣ����������
    setpen(clblack, pssolid, -2, pmcopy);
    moveto(0.3, ypos + 0.2);
    lineto(pagewidth - 0.3, ypos + 0.2);
    setpen(clblack, pssolid, -1, pmcopy);
    moveto(0.3, ypos + 0.22);
    lineto(pagewidth - 0.3, ypos + 0.22);
     //��ӡ��
    cleartabs;
    setFont('����_GB2312', 11);
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
    setFont('����_GB2312', 11);
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
       //��ӡҳ��
    marginbottom := 0.6;
    ypos := 10.25;
    setpen(clblack, pssolid, -1, pmcopy);
    moveto(0.6, ypos);
    lineto(pagewidth - 0.6, ypos);
    ypos := ypos + 0.22;
    printleft('ͳ��ʱ�䣺' + datetostr(date) + ' ' + timetostr(time), 5.5);
    printleft('ͳ����Ա��' + userNamehfut, 0.8);
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
    name := '������Ч�ܱ���';
  end;

  k := 1;
  excelWorksheet1.cells.item[k, 1] := '������' + dbc_germtype.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '���ң�' + dbc_section.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := '�걾���ͣ�' + dbc_bb.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := 'ϸ�����ƣ�' + dbc_xjname.Text;
  inc(k);
  excelWorksheet1.cells.item[k, 1] := 'ʱ�䷶Χ��' + datetostr(DateStart.date) + '��' + datetostr(Dateend.Date);
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
  if dbc_germtype.text <> '******����******' then
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
      dbc_xjname.Items.Add('******����******');
      i := dbc_xjname.Items.IndexOf('******����******');
      dbc_xjname.ItemIndex := i;
    end;
end;

end.
