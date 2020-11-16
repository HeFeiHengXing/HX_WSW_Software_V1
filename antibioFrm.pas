unit antibioFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, DBCtrls, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, RpDefine, RpBase, RpSystem, ExcelXP, OleServer;

type
  TantibioForm = class(TForm)
    Splitter1: TSplitter;
    Panel1: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    //dtpBegDate: TDateTimePicker;
    //dtpEndDate: TDateTimePicker;
    btnQryData: TBitBtn;
    btnPrint: TButton;
    GroupBox2: TGroupBox;
    dlcAnti: TDBLookupComboBox;
    dlcGermType: TDBLookupComboBox;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    dateStart: TDateTimePicker;
    dateEnd: TDateTimePicker;
    Button1: TButton;
    rsAnti: TADODataSet;
    DataSource2: TDataSource;
    rs1: TADODataSet;
    rstData: TADODataSet;
    DataSource1: TDataSource;
    stgchk: TStringGrid;
    RvSystem1: TRvSystem;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    BitBtn3: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Button2: TButton;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbc_germtype: TComboBox;
    dbc_section: TComboBox;
    dbc_bb: TComboBox;
    Button3: TButton;
    ComboBox1: TComboBox;
    Label11: TLabel;
    Label4: TLabel;
    RadioButton4: TRadioButton;
    Label9: TLabel;
    dbc_xjname: TComboBox;
    btnToExcel: TButton;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure stgchkDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure RvSystem1Print(Sender: TObject);
    procedure btnToExcelClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure dbc_germtypeChange(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
  private
    { Private declarations }
    totalrow:integer;
    bTableTitled:boolean;
    datasetrecord:integer;
  public
    { Public declarations }
  end;

var
  antibioForm: TantibioForm;

implementation

uses dbym,ymDataType,common,loginfrm, flash;

{$R *.dfm}

procedure TantibioForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   rstdata.Active:=false;
   action:=cafree;
end;

procedure TantibioForm.BitBtn3Click(Sender: TObject);
var
    strqstatic,str1,sum2:string;
    i,j,ColNum,Rownum,sum1:integer;
    str:string;
    db:dbhelper;
    useids:array of string;
begin
    Application.CreateForm(TFlashForm,FlashForm);
    Flashform.Show;
    Flashform.Refresh;

    db:=dbhelper.Create;
    str:='';
    if trim(dbc_germtype.text)<>'******不限******' then
        str:=str+' and js='''+db.getgermindex(trim(dbc_germtype.text))+'''';
    if trim(dbc_section.text)<>'******不限******' then
        str:=str+' and kb='''+dbc_section.text+'''';
    if trim(dbc_bb.text)<>'******不限******' then
        str:=str+' and useid in (select useid from base where bb='''+dbc_bb.text+''')';
    if trim(dbc_xjname.text)<>'******不限******' then
        str:=str+' and jzname='''+dbc_xjname.text+'''';
    if radiobutton4.Checked then
        str:=str+' and ypmc='''+combobox1.Text+'''';
    //填写表头 第一行药物名称
    if radiobutton4.Checked then
    begin
        stgchk.ColCount:=6;
        colNum:=stgchk.ColCount;
        stgchk.cells[2,0]:=combobox1.Text;
        stgchk.Cells[3,0]:='耐药(率)';
        stgchk.Cells[4,0]:='中介(率)';
        stgchk.Cells[5,0]:='敏感(率)';
    end else
    begin
        rstDAta.Active:=false;
        str1:='select distinct ypmc from vw_anti where ';
        str1:=str1+' repdate between #'+datetostr(dateStart.date)+'# and #'+datetostr(dateEnd.date+1)+'# ';
        str1:=str1+str;
        rstDAta.CommandText:=str1;
        rstDAta.Active:=true;
        i:=1;
        stgchk.ColCount:=rstdata.RecordCount+2;
        colNum:=stgchk.ColCount;

        while not rstdata.Eof do
        begin
            stgchk.Cells[0,i]:=rstDAta.FieldValues['ypmc'];
            rstDAta.Next;
            inc(i);
        end;
        for i:=1 to rstdata.RecordCount do
            stgchk.Cells[i+1,0]:=stgchk.Cells[0,i];
        stgchk.Cols[0].Clear;
    end;

    //填写第一列 细菌名称
    rstDAta.Active:=false;
    rstDAta.CommandText:='select distinct jzname from vw_anti where '+
    'repdate between #'+datetostr(dateStart.date)+'# and #'+datetostr(dateEnd.date+1)+'#'+str;
    rstDAta.Active:=true;
    stgchk.RowCount:=rstdata.RecordCount+2;
    RowNum:=stgchk.RowCount;
    stgchk.Cells[0,Rownum-1]:='总计';
    i:=1;
    while not rstdata.Eof do
    begin
        stgchk.Cells[0,i]:=rstDAta.FieldValues['jzname'];
        rstDAta.Next;
        inc(i);
    end;
    //填写表内容
    datasetrecord:=rstdata.RecordCount;// 细菌数
    for i:=0 to rstdata.RecordCount-1 do
    begin
        if radiobutton4.Checked then
        begin
            strqstatic:='select count(jl) as jlAll from vw_anti where';
            strqstatic:=strqstatic+' repdate between #'+datetostr(dateStart.date)+'# and #'+datetostr(dateEnd.date+1)+'#';
            strqstatic:=strqstatic+'and jzname="'+stgchk.Cells[0,i+1]+'"';
            strqstatic:=strqstatic+str;
            rstdata.Active:=false;
            rstdata.commandtext:=strqstatic;
            rstdata.Active:=true;
            stgchk.Cells[2,i+1]:=rstdata.FieldValues['jlAll'];

            strqstatic:='select count(jl) as jlNy from vw_anti where';
            strqstatic:=strqstatic+' repdate between #'+datetostr(dateStart.date)+'# and #'+datetostr(dateEnd.date+1)+'#';
            strqstatic:=strqstatic+' and jzname="'+stgchk.Cells[0,i+1]+'"';
            strqstatic:=strqstatic+str;
            strqstatic:=strqstatic+' and mg=''耐药''';
            rstdata.Active:=false;
            rstdata.commandtext:=strqstatic;
            rstdata.Active:=true;
            stgchk.Cells[3,i+1]:=rstdata.FieldValues['jlNy'];

            strqstatic:='select count(jl) as jlZj from vw_anti where';
            strqstatic:=strqstatic+' repdate between #'+datetostr(dateStart.date)+'# and #'+datetostr(dateEnd.date+1)+'#';
            strqstatic:=strqstatic+'and jzname="'+stgchk.Cells[0,i+1]+'"';
            strqstatic:=strqstatic+str;
            strqstatic:=strqstatic+' and mg=''中介''';
            rstdata.Active:=false;
            rstdata.commandtext:=strqstatic;
            rstdata.Active:=true;
            stgchk.Cells[4,i+1]:=rstdata.FieldValues['jlZj'];

            strqstatic:='select count(jl) as jlMg from vw_anti where';
            strqstatic:=strqstatic+' repdate between #'+datetostr(dateStart.date)+'# and #'+datetostr(dateEnd.date+1)+'#';
            strqstatic:=strqstatic+'and jzname="'+stgchk.Cells[0,i+1]+'"';
            strqstatic:=strqstatic+str;
            strqstatic:=strqstatic+' and mg=''敏感'' ';
            rstdata.Active:=false;
            rstdata.commandtext:=strqstatic;
            rstdata.Active:=true;
            stgchk.Cells[5,i+1]:=rstdata.FieldValues['jlMg'];
        end else
        for j:=1 to colNum-2 do
        begin
            strqstatic:='select count(jl) as jlAll from vw_anti where';
            strqstatic:=strqstatic+' repdate between #'+datetostr(dateStart.date)+'# and #'+datetostr(dateEnd.date+1)+'#';
            strqstatic:=strqstatic+' and jzname='''+stgchk.Cells[0,i+1]+'''';
            strqstatic:=strqstatic+' and ypmc='''+stgchk.Cells[j+1,0]+'''';
            strqstatic:=strqstatic+str;
            if RadioButton1.Checked then
                strqstatic:=strqstatic+' and mg=''敏感''';
            if RadioButton2.Checked then
                strqstatic:=strqstatic+' and mg=''中介''';
            if RadioButton3.Checked then
                strqstatic:=strqstatic+' and mg=''耐药''';
            rstDAta.Active:=false;
            rstdata.CommandText:=strqstatic;
            rstdata.Active:=true;
            stgchk.cells[j+1,i+1]:=rstdata.FieldValues['jlAll'];
        end;
      //填写检出总数
        if radiobutton4.Checked then
            stgchk.Cells[1,i+1]:=stgchk.Cells[2,i+1]
        else
        begin
            rstDAta.Active:=false;
            rstdata.CommandText:='select count(jzname) as jznum from base  where'+
            ' repdate between #'+datetostr(dateStart.date)+'# and #'+datetostr(dateEnd.date+1)+'#'+' and jzname="'+stgchk.cells[0,i+1]+'"'+str;
            rstdata.Active:=true;
            stgchk.cells[1,i+1]:=rstdata.FieldValues['jznum'];
        end
        {if CheckBox4.Checked then //百分比 统计
        begin
        for j:=1 to colNum-2 do
        if (stgchk.Cells[j+1,i+1]<>'0') and (stgchk.Cells[j+1,i+1]<>'100') then
        stgchk.cells[j+1,i+1]:=copy(floattostr(strtoint(stgchk.Cells[j+1,i+1])*100/strtoint(stgchk.Cells[1,i+1])),1,4)+'%';
         end; }
     end;

    {if CheckBox4.Checked then
    begin
        for j:=1 to colNum-2 do
        if (stgchk.Cells[j+1,Rownum-1]<>'0') and (stgchk.Cells[j+1,Rownum-1]<>'100') then
            stgchk.cells[j+1,Rownum-1]:=copy(floattostr(strtoint(stgchk.Cells[j+1,Rownum-1])*100/strtoint(stgchk.Cells[1,Rownum-1])),1,4)+'%';
    end  else }
    //计算总计
    begin
        for j:=1 to colNum-1 do
        begin
            sum1:=0;
            for i:=1 to Rownum-2 do
            sum1:=sum1+strtoint(stgchk.cells[j,i]);
            stgchk.cells[j,Rownum-1]:=inttostr(sum1);
        end;
    end;
    FlashForm.Hide;
    button2.Enabled:=true;
    button1.Enabled:=true;
end;

procedure TantibioForm.FormShow(Sender: TObject);
begin
  dateEnd.date:=date;
  dateStart.date:=date;
  stgchk.Cells[1,0]:='总检出数';
{  stgchk.cells[2,0]:='敏感数';
  stgchk.Cells[3,0]:='敏感率';
  stgchk.Cells[4,0]:='中敏数';
  stgchk.Cells[5,0]:='中敏率';
  stgchk.cells[6,0]:='耐药数' ;
  stgchk.Cells[7,0]:='耐药率';}
  rstdata.Active:=false;
  button1.Enabled:=false;
end;

procedure TantibioForm.dbc_germtypeChange(Sender: TObject);
var str:string;
    i:integer;
begin
    str:=dbhelper.Create.getgermindex(dbc_germtype.text);
    if  dbc_germtype.text<>'******不限******' then
    with dmym.query1 do
    begin
        combobox1.Items.clear;
        close;
        sql.Clear;
        sql.Add('select ypmc from ypall where js=:jsNum order by ypid');
        parameters.ParamByName('jsNum').Value:=str;
        open;
        if recordcount>0 then
        while not Eof do
        begin
            combobox1.Items.Add(fieldvalues['ypmc']);
            next;
        end;

        dbc_xjname.Items.Clear;
        close;
        sql.Clear;
        sql.Add('select name from xjname where js='''+str+'''');
        open;
        if recordcount>0 then
        while not Eof do
        begin
            dbc_xjname.Items.Add(fieldvalues['name']);
            next;
        end;
        dbc_xjname.Items.Add('******不限******');
        i:=dbc_xjname.Items.IndexOf('******不限******');
        dbc_xjname.ItemIndex:=i;
    end;
    {重新分配细菌}
end;

procedure TantibioForm.FormCreate(Sender: TObject);
var str:Tstringlist;
    db:dbhelper;
    i:integer;
begin
    totalrow:=-1;
    if dmym.rsgermtype.Active=false then
      dmym.rsgermtype.Active:=true;
    button2.Enabled:=false;

    db:=dbhelper.Create;
    str:=tstringlist.Create;
    str.Clear;
    db.getGermType(str);
    dbc_germtype.Items:=str;
    dbc_germtype.Items.add('******不限******');
    i:=dbc_germtype.Items.IndexOf('******不限******');
    dbc_germtype.ItemIndex:=i;
    str.Clear;

    db.getsection(str);
    dbc_section.Items:=str;
    dbc_section.Items.Add('******不限******');
    i:=dbc_section.Items.IndexOf('******不限******');
    dbc_section.ItemIndex:=i;
    str.Clear;

    db.getBBType(str);
    dbc_bb.Items:=str;
    dbc_bb.Items.Add('******不限******');
    i:=dbc_bb.Items.IndexOf('******不限******');
    dbc_bb.ItemIndex:=i;
    str.Clear;
    str.Free;
    with dmym.query1 do//初始化单种药物下拉菜单
    begin
        close;
        sql.Clear;
        sql.Add('select distinct ypmc from ypall');
        open;

        if recordcount>0 then
        while not Eof do
        begin
            if not varisnull(fieldvalues['ypmc']) then
                combobox1.Items.Add(fieldvalues['ypmc']);
            next;
        end;
    end;//
    with dmym.query1 do//初始化单种细菌下拉菜单
    begin
        close;
        sql.Clear;
        sql.Add('select distinct name from xjname');
        open;

        if recordcount>0 then
        while not Eof do
        begin
            dbc_xjname.Items.Add(fieldvalues['name']);
            next;
        end;
        dbc_xjname.Items.Add('******不限******');
        i:=dbc_xjname.Items.IndexOf('******不限******');
        dbc_xjname.ItemIndex:=i;
    end;//
    combobox1.enabled:=false;
end;

procedure TantibioForm.DBLookupComboBox2Click(Sender: TObject);
begin
   rsanti.Active:=false;
   rsanti.CommandText:='select ypmc from ypall where js="'+dmym.rsGermType['germindex']+'"';
   rsanti.Active:=true;
end;

procedure TantibioForm.stgchkDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
//   if ((acol=3) or (acol=5) or (acol=7)) and (arow>0) and (arow<stgchk.RowCount-1) then
{  if ((acol=3) or (acol=5) or (acol=7)) and (arow>0) and (arow<stgchk.RowCount+1) then
   begin
    with stgchk do
    begin
      canvas.brush.color:=clYellow;
      canvas.FillRect(rect);
      canvas.font.color:=clRed;
      canvas.TextOut(rect.left+2,rect.top+2,cells[acol,arow])  ;
    end;
   end;
   if (arow=0) then
    begin
      stgchk.canvas.font.style:=[fsBold];
    end;}
    //else stgchk.Options := stgchk.Options + [goEditing];
   //DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TantibioForm.Button1Click(Sender: TObject);
begin
   rvSystem1.Execute;
end;

procedure TantibioForm.RvSystem1Print(Sender: TObject);
var
   col,row:integer;
   n:integer;
   str,strtemp:string;
   bw:double;
begin
    //只能打印单种药物
     bw:=0.4;
     with sender as TBaseReport do
     begin
     //打印标题
        margintop:=0.5;
        setFont('楷体_GB2312',18);
        Bold:=true;
        PrintHeader(hospitalname+'抗生素'+'('+combobox1.text+')'+'效能报告单',pjCenter);
     //标题下的粗横线
        SetPen(clBlack,psSolid,-1,pmCopy);
        moveto(0.3,1.1);
        lineto(pagewidth-0.3,1.1);
        moveto(0.3,1.13);
        lineto(pagewidth-0.3,1.13);
     //打印基本信息
        setfont('楷体_GB2312',11);
        bold:=false;
        ypos:=ypos+0.6;
        printcenter('菌属： '+dbc_germtype.text,1);
        printcenter('科室： '+dbc_section.text,3.8);
        printcenter('标本类型： '+dbc_bb.Text,6.6);
        printcenter('标本类型： '+dbc_xjname.Text,8);
        ypos:=ypos+0.4;
        if radiobutton4.Checked then
        printcenter('统计对象： '+combobox1.text+'(单种药物)',1)
        else
        if radiobutton1.Checked then
        printcenter('统计对象： 敏感',1)
        else
        if radiobutton2.Checked then
        printcenter('统计对象： 中介',1)
        else
        if radiobutton3.Checked then
        printcenter('统计对象： 耐药',1);
        printcenter('时间范围： '+datetostr(datestart.Date)+'至'+datetostr(dateend.Date),6.6);
     //打印基本信息下两条横线
        setpen(clblack,pssolid,-2,pmcopy);
        moveto(0.3,ypos+0.2);
        lineto(pagewidth-0.3,ypos+0.2);
        setpen(clblack,pssolid,-1,pmcopy);
        moveto(0.3,ypos+0.22);
        lineto(pagewidth-0.3,ypos+0.22);
     //打印表
        cleartabs;
        setFont('楷体_GB2312',11);
        ypos:=ypos+0.5;
        setTab(0.8,pjcenter,1.5,0,BOXLINENONE,0);
        n:=stgchk.colcount;
        for col:=1 to n-1 do
        begin
          setTab(na,pjcenter,1,0,BOXLINENONE,0);
        end;
        for col:=0 to n-1 do
        begin
          Tab(0,0,0,0,10);
          str:=stgchk.cells[col,0];
          print(str);
        end;
        setFont('楷体_GB2312',11);
        ypos:=ypos+0.05;
        row:=0;
        println('');
        setTab(1.5,pjcenter,1.5,0,0,0);
        for col:=1 to n-1 do
        begin
          setTab(na,pjcenter,1.5,0,BOXLINENONE,0);
        end;
        for row:=1 to stgchk.rowcount-1 do
        begin
           for col:=0 to n-1 do
           begin
               Tab(0,0,0,0,10);
               str:=stgchk.cells[col,row];
               if varisnull(str) then
                  str:=' ' ;
               print(str);
           end;
           println('');
        end;
       //打印页脚
        marginbottom:=0.6;
        ypos:=10.25;
        setpen(clblack,pssolid,-1,pmcopy);
        moveto(0.6,ypos);
        lineto(pagewidth-0.6,ypos);
        ypos:=ypos+0.22;
        printleft('统计时间：'+datetostr(date)+' '+timetostr(time),5.5);
        printleft('统计人员：'+userNamehfut,0.8);
     end;
end;

procedure TantibioForm.btnToExcelClick(Sender: TObject);
var
  i,j,k:integer;
  str:string;
begin
    with ExcelApplication1 do
    begin
      disconnect;
      visible[0]:=true;
      sheetsInNewWorkbook[0]:=1;
      workbooks.add(emptyparam,0);
      excelworkbook1.connectto(workbooks[workbooks.count] as _workbook);
    end;
    with ExcelWorksheet1 do
    begin
      connectTo(excelworkbook1.sheets[1] as _worksheet);
      name:='标本分布报表';
    end;
    k:=1;
    excelWorksheet1.cells.item[k,1]:='菌属：'+dbc_germtype.Text;
    inc(k);
    excelWorksheet1.cells.item[k,1]:='科室：'+dbc_section.Text;
    inc(k);
    excelWorksheet1.cells.item[k,1]:='标本类型：'+dbc_bb.Text;
    inc(k);
    excelWorksheet1.cells.item[k,1]:='细菌：'+dbc_xjname.Text;
    inc(k);
    excelWorksheet1.cells.item[k,1]:='时间范围：'+datetostr(datestart.date)+'至'+datetostr(dateend.Date);
    inc(k);
    if RadioButton4.Checked then
    begin
      excelWorksheet1.cells.item[k,1]:='单种药物：'+ComboBox1.Text;
      inc(k);
    end;
    if radiobutton1.Checked then
    begin
      excelWorksheet1.cells.item[k,1]:='限定药敏结果：敏感';
      inc(k);
    end else
    if radiobutton2.Checked then
    begin
      excelWorksheet1.cells.item[k,1]:='限定药敏结果：中介';
      inc(k);
    end else
    begin
      excelWorksheet1.cells.item[k,1]:='限定药敏结果：耐药';
      inc(k);
    end;
    
    //填写表头
    for i:=0 to stgchk.rowCount-1 do
    for j:=0 to stgchk.colcount-1 do
    begin
        if varisnull(stgchk.Cells[j,i]) then
            str:=''
        else
            str:=trim(stgchk.Cells[j,i]);
        excelWorksheet1.cells.item[i+k,j+1]:=str;
    end;
    with excelWorksheet1 do
    begin
        range[cells.item[k,1],cells.item[k,stgchk.colcount]].font.bold:=true;
        range[cells.item[k,1],cells.item[k,stgchk.colcount]].horizontalalignment:=xlCenter;
    end;
    excelWorksheet1.Cells.Font.Size:=10;
    excelWorksheet1.Columns.AutoFit;
end;

procedure TantibioForm.Button2Click(Sender: TObject);
var
    i,j,ColNum,RowNum:integer;
    a:integer;
begin
    begin
        ColNum:=stgchk.colcount;
        RowNum:=stgchk.rowcount;
        if radiobutton4.Checked then
            a:=2
        else a:=1;
        for i:=0 to datasetrecord-1 do
        begin
            for j:=a to colNum-2 do
            if (stgchk.Cells[j+1,i+1]<>'0') and (stgchk.Cells[j+1,i+1]<>'100') then
                stgchk.cells[j+1,i+1]:=copy(floattostr(strtoint(stgchk.Cells[j+1,i+1])*100/strtoint(stgchk.Cells[1,i+1])),1,4)+'%';
        end;
            for j:=a to colNum-2 do
            if (stgchk.Cells[j+1,Rownum-1]<>'0') and (stgchk.Cells[j+1,Rownum-1]<>'100') then
                stgchk.cells[j+1,Rownum-1]:=copy(floattostr(strtoint(stgchk.Cells[j+1,Rownum-1])*100/strtoint(stgchk.Cells[1,Rownum-1])),1,4)+'%';
    { for j:=1 to colNum-2 do
    begin
        sum2:='';
        for i:=1 to Rownum-2 do
        sum2:=sum2+stgchk.cells[j,i];
        stgchk.cells[j,Rownum-1]:=sum2;
    end;}
        button2.enabled:=false;
    end;
end;

procedure TantibioForm.Button3Click(Sender: TObject);
begin
    close;
end;


procedure TantibioForm.RadioButton4Click(Sender: TObject);
begin
    if radiobutton4.Checked then
    begin
        combobox1.Enabled:=true;
        combobox1.ItemIndex:=0;
        button1.Enabled:=true;//只提供单种药物打印
    end else
    begin
        combobox1.Enabled:=false;
        combobox1.ItemIndex:=-1;
        button1.Enabled:=false;//只提供单种药物打印
    end;
end;

end.
