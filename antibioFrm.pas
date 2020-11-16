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
    if trim(dbc_germtype.text)<>'******����******' then
        str:=str+' and js='''+db.getgermindex(trim(dbc_germtype.text))+'''';
    if trim(dbc_section.text)<>'******����******' then
        str:=str+' and kb='''+dbc_section.text+'''';
    if trim(dbc_bb.text)<>'******����******' then
        str:=str+' and useid in (select useid from base where bb='''+dbc_bb.text+''')';
    if trim(dbc_xjname.text)<>'******����******' then
        str:=str+' and jzname='''+dbc_xjname.text+'''';
    if radiobutton4.Checked then
        str:=str+' and ypmc='''+combobox1.Text+'''';
    //��д��ͷ ��һ��ҩ������
    if radiobutton4.Checked then
    begin
        stgchk.ColCount:=6;
        colNum:=stgchk.ColCount;
        stgchk.cells[2,0]:=combobox1.Text;
        stgchk.Cells[3,0]:='��ҩ(��)';
        stgchk.Cells[4,0]:='�н�(��)';
        stgchk.Cells[5,0]:='����(��)';
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

    //��д��һ�� ϸ������
    rstDAta.Active:=false;
    rstDAta.CommandText:='select distinct jzname from vw_anti where '+
    'repdate between #'+datetostr(dateStart.date)+'# and #'+datetostr(dateEnd.date+1)+'#'+str;
    rstDAta.Active:=true;
    stgchk.RowCount:=rstdata.RecordCount+2;
    RowNum:=stgchk.RowCount;
    stgchk.Cells[0,Rownum-1]:='�ܼ�';
    i:=1;
    while not rstdata.Eof do
    begin
        stgchk.Cells[0,i]:=rstDAta.FieldValues['jzname'];
        rstDAta.Next;
        inc(i);
    end;
    //��д������
    datasetrecord:=rstdata.RecordCount;// ϸ����
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
            strqstatic:=strqstatic+' and mg=''��ҩ''';
            rstdata.Active:=false;
            rstdata.commandtext:=strqstatic;
            rstdata.Active:=true;
            stgchk.Cells[3,i+1]:=rstdata.FieldValues['jlNy'];

            strqstatic:='select count(jl) as jlZj from vw_anti where';
            strqstatic:=strqstatic+' repdate between #'+datetostr(dateStart.date)+'# and #'+datetostr(dateEnd.date+1)+'#';
            strqstatic:=strqstatic+'and jzname="'+stgchk.Cells[0,i+1]+'"';
            strqstatic:=strqstatic+str;
            strqstatic:=strqstatic+' and mg=''�н�''';
            rstdata.Active:=false;
            rstdata.commandtext:=strqstatic;
            rstdata.Active:=true;
            stgchk.Cells[4,i+1]:=rstdata.FieldValues['jlZj'];

            strqstatic:='select count(jl) as jlMg from vw_anti where';
            strqstatic:=strqstatic+' repdate between #'+datetostr(dateStart.date)+'# and #'+datetostr(dateEnd.date+1)+'#';
            strqstatic:=strqstatic+'and jzname="'+stgchk.Cells[0,i+1]+'"';
            strqstatic:=strqstatic+str;
            strqstatic:=strqstatic+' and mg=''����'' ';
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
                strqstatic:=strqstatic+' and mg=''����''';
            if RadioButton2.Checked then
                strqstatic:=strqstatic+' and mg=''�н�''';
            if RadioButton3.Checked then
                strqstatic:=strqstatic+' and mg=''��ҩ''';
            rstDAta.Active:=false;
            rstdata.CommandText:=strqstatic;
            rstdata.Active:=true;
            stgchk.cells[j+1,i+1]:=rstdata.FieldValues['jlAll'];
        end;
      //��д�������
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
        {if CheckBox4.Checked then //�ٷֱ� ͳ��
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
    //�����ܼ�
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
  stgchk.Cells[1,0]:='�ܼ����';
{  stgchk.cells[2,0]:='������';
  stgchk.Cells[3,0]:='������';
  stgchk.Cells[4,0]:='������';
  stgchk.Cells[5,0]:='������';
  stgchk.cells[6,0]:='��ҩ��' ;
  stgchk.Cells[7,0]:='��ҩ��';}
  rstdata.Active:=false;
  button1.Enabled:=false;
end;

procedure TantibioForm.dbc_germtypeChange(Sender: TObject);
var str:string;
    i:integer;
begin
    str:=dbhelper.Create.getgermindex(dbc_germtype.text);
    if  dbc_germtype.text<>'******����******' then
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
        dbc_xjname.Items.Add('******����******');
        i:=dbc_xjname.Items.IndexOf('******����******');
        dbc_xjname.ItemIndex:=i;
    end;
    {���·���ϸ��}
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
    dbc_germtype.Items.add('******����******');
    i:=dbc_germtype.Items.IndexOf('******����******');
    dbc_germtype.ItemIndex:=i;
    str.Clear;

    db.getsection(str);
    dbc_section.Items:=str;
    dbc_section.Items.Add('******����******');
    i:=dbc_section.Items.IndexOf('******����******');
    dbc_section.ItemIndex:=i;
    str.Clear;

    db.getBBType(str);
    dbc_bb.Items:=str;
    dbc_bb.Items.Add('******����******');
    i:=dbc_bb.Items.IndexOf('******����******');
    dbc_bb.ItemIndex:=i;
    str.Clear;
    str.Free;
    with dmym.query1 do//��ʼ������ҩ�������˵�
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
    with dmym.query1 do//��ʼ������ϸ�������˵�
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
        dbc_xjname.Items.Add('******����******');
        i:=dbc_xjname.Items.IndexOf('******����******');
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
    //ֻ�ܴ�ӡ����ҩ��
     bw:=0.4;
     with sender as TBaseReport do
     begin
     //��ӡ����
        margintop:=0.5;
        setFont('����_GB2312',18);
        Bold:=true;
        PrintHeader(hospitalname+'������'+'('+combobox1.text+')'+'Ч�ܱ��浥',pjCenter);
     //�����µĴֺ���
        SetPen(clBlack,psSolid,-1,pmCopy);
        moveto(0.3,1.1);
        lineto(pagewidth-0.3,1.1);
        moveto(0.3,1.13);
        lineto(pagewidth-0.3,1.13);
     //��ӡ������Ϣ
        setfont('����_GB2312',11);
        bold:=false;
        ypos:=ypos+0.6;
        printcenter('������ '+dbc_germtype.text,1);
        printcenter('���ң� '+dbc_section.text,3.8);
        printcenter('�걾���ͣ� '+dbc_bb.Text,6.6);
        printcenter('�걾���ͣ� '+dbc_xjname.Text,8);
        ypos:=ypos+0.4;
        if radiobutton4.Checked then
        printcenter('ͳ�ƶ��� '+combobox1.text+'(����ҩ��)',1)
        else
        if radiobutton1.Checked then
        printcenter('ͳ�ƶ��� ����',1)
        else
        if radiobutton2.Checked then
        printcenter('ͳ�ƶ��� �н�',1)
        else
        if radiobutton3.Checked then
        printcenter('ͳ�ƶ��� ��ҩ',1);
        printcenter('ʱ�䷶Χ�� '+datetostr(datestart.Date)+'��'+datetostr(dateend.Date),6.6);
     //��ӡ������Ϣ����������
        setpen(clblack,pssolid,-2,pmcopy);
        moveto(0.3,ypos+0.2);
        lineto(pagewidth-0.3,ypos+0.2);
        setpen(clblack,pssolid,-1,pmcopy);
        moveto(0.3,ypos+0.22);
        lineto(pagewidth-0.3,ypos+0.22);
     //��ӡ��
        cleartabs;
        setFont('����_GB2312',11);
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
        setFont('����_GB2312',11);
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
       //��ӡҳ��
        marginbottom:=0.6;
        ypos:=10.25;
        setpen(clblack,pssolid,-1,pmcopy);
        moveto(0.6,ypos);
        lineto(pagewidth-0.6,ypos);
        ypos:=ypos+0.22;
        printleft('ͳ��ʱ�䣺'+datetostr(date)+' '+timetostr(time),5.5);
        printleft('ͳ����Ա��'+userNamehfut,0.8);
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
      name:='�걾�ֲ�����';
    end;
    k:=1;
    excelWorksheet1.cells.item[k,1]:='������'+dbc_germtype.Text;
    inc(k);
    excelWorksheet1.cells.item[k,1]:='���ң�'+dbc_section.Text;
    inc(k);
    excelWorksheet1.cells.item[k,1]:='�걾���ͣ�'+dbc_bb.Text;
    inc(k);
    excelWorksheet1.cells.item[k,1]:='ϸ����'+dbc_xjname.Text;
    inc(k);
    excelWorksheet1.cells.item[k,1]:='ʱ�䷶Χ��'+datetostr(datestart.date)+'��'+datetostr(dateend.Date);
    inc(k);
    if RadioButton4.Checked then
    begin
      excelWorksheet1.cells.item[k,1]:='����ҩ�'+ComboBox1.Text;
      inc(k);
    end;
    if radiobutton1.Checked then
    begin
      excelWorksheet1.cells.item[k,1]:='�޶�ҩ�����������';
      inc(k);
    end else
    if radiobutton2.Checked then
    begin
      excelWorksheet1.cells.item[k,1]:='�޶�ҩ��������н�';
      inc(k);
    end else
    begin
      excelWorksheet1.cells.item[k,1]:='�޶�ҩ���������ҩ';
      inc(k);
    end;
    
    //��д��ͷ
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
        button1.Enabled:=true;//ֻ�ṩ����ҩ���ӡ
    end else
    begin
        combobox1.Enabled:=false;
        combobox1.ItemIndex:=-1;
        button1.Enabled:=false;//ֻ�ṩ����ҩ���ӡ
    end;
end;

end.
