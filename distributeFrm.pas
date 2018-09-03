unit distributeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DB, ADODB, StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls,
  DBGrids, RpCon, RpConDS, RpDefine, RpRave, RpBase, RpSystem, ExcelXP,
  OleServer;

type
  TbbDistributeForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    rdgSelect: TRadioGroup;
    btnQryData: TBitBtn;
    btnPrint: TButton;
    rstData: TADODataSet;
    dsdata: TDataSource;
    DBGrid1: TDBGrid;
    tbYear: TADOTable;
    dsYear: TDataSource;
    RvSystem1: TRvSystem;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    Label2: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    dtpBegDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    Label3: TLabel;
    Button1: TButton;
    dbc_germtype: TComboBox;
    dbc_section: TComboBox;
    dbc_bb: TComboBox;
    btnToExcel: TButton;
    //RvSystem1: TRvSystem;
   // ffRvProject1: TRvProject;

      procedure FormShow(Sender: TObject);
    procedure btnQryDataClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure RvSystem1Print(Sender: TObject);
    procedure btnToExcelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
     ncount:integer;
     btableTitled:boolean;
     procedure getDate;

  public
    { Public declarations }
  end;

var
  bbDistributeForm: TbbDistributeForm;

implementation

uses dbym, ymDataType,common,loginfrm;

{$R *.dfm}

procedure TbbDistributeForm.FormShow(Sender: TObject);
begin
   dtpEndDate.date:=date;
   dtpBegdate.date:=date;
end;

procedure TbbDistributeForm.getdate;
var y1,m1,y2,m2,monthNum,i:integer;
var year,month,day:word;
var strvalue:string;
begin
//生成基本年月库
  decodedate(dtpbegdate.datetime,year,month,day);
  y1:=year;
  m1:=month;
  decodedate(dtpenddate.datetime,year,month,day);
  y2:=year;
  m2:=month;
  monthnum:=(y2-y1)*12+m2-m1+1;
  with dmym.conn do
    begin
      Execute('delete from tmpCheck');
      execute('delete from tmpstatic');
      for i:=1 to monthnum do
        begin
          if (m1< 13) then
             begin
               strvalue:=inttostr(y1*100+m1) ;
               m1:=m1+1;
             end
          else
             begin
               y1:=y1+1;
               m1:=2;
               strvalue:=inttostr(y1*100+1);
             end;
          strvalue:='insert into tmpcheck(chkdate) values("'+strvalue+'")';
          execute(strvalue) ;
        end;
    end;

end;

procedure TbbDistributeForm.btnQryDataClick(Sender: TObject);
var
 str1,str2,str3,strq :string;
 i,sum:integer;
 db:dbhelper;
begin
  str1:=',jzname as 细菌名称';
  str2:='';
  str3:='group by jzname';
  if dbc_germtype.text<>'******不限******' then
  begin
      str2:=str2+' and js='''+db.getgermindex(trim(dbc_germtype.text))+'''';
  end;
  if dbc_section.text<>'******不限******' then
  begin
      str1:=str1+',kb as 科室';
      str2:=str2+' and kb='''+dbc_section.Text+'''';
      str3:=str3+',kb';
  end;
  if dbc_bb.text<>'******不限******' then
  begin
      str1:=str1+',bb as 标本类型';
      str2:=str2+' and bb='''+dbc_bb.Text+'''';
      str3:=str3+',bb';
  end;
  rstdata.Active:=false;
  case rdgselect.ItemIndex of
    1:    //选择总属
    begin
        strq:='select count(useid) as 标本数,jzname as 细菌名称,kb as 科室,bb as 标本类型 from base where repdate between #';
        strq:=strq+datetostr(dtpbegdate.DateTime)+'# and #'+datetostr(dtpenddate.DateTime+1)+'# '+str2;
        strq:=strq+'group by jzname,kb,bb';
    end;
    0:
    begin
        strq:='select count(useid) as 标本数'+str1+' from base where repdate between #'+datetostr(dtpbegdate.DateTime)+'# and #'+datetostr(dtpenddate.DateTime)+'# '+str2;
        strq:=strq+str3;
    end;
    end;
    rstdata.CommandText:=strq;

    dbgrid1.DataSource:=dsdata;
    rstdata.Active:=true;
    sum:=0; //统计总数
    rstdata.First;
    while not rstdata.Eof do
    begin
       sum:=sum+rstdata.Fieldbyname('标本数').AsInteger;
       rstdata.Next;
    end;
    rstdata.Append;
    rstdata['标本数']:=sum; ////////////////////////
    if rstdata.RecordCount>0 then
      btnprint.Enabled:=true;
end;

procedure TbbDistributeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;
procedure TbbDistributeForm.FormCreate(Sender: TObject);
var str:Tstringlist;
    db:dbhelper;
    i:integer;
begin
    btableTitled:=false;
    if not dmym.rsgermtype.active then
        dmym.rsgermtype.Active:=true;
    if not dmym.rssection.Active then
        dmym.rssection.Active:=true;
    if not dmym.rssample.Active then
        dmym.rssample.Active:=true;

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
end;

procedure TbbDistributeForm.btnPrintClick(Sender: TObject);
begin
     rvsystem1.Execute;
end;

procedure TbbDistributeForm.RvSystem1Print(Sender: TObject);
var
   col,row:integer;
   n:integer;
   str:string;
begin
     with sender as TBaseReport do
     begin
     //打印标题
        margintop:=0.6;
        setFont('楷体_GB2312',18);
        Bold:=true;
        PrintHeader(hospitalname+'标本分布报告单',pjCenter);
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
        printcenter('菌属： '+dbc_germtype.text,2.8);
        printcenter('科室： '+dbc_section.text,5.5);
        ypos:=ypos+0.4;
        printcenter('标本类型： '+dbc_bb.Text,2.8);
        printcenter('时间范围： '+datetostr(dtpbegdate.Date)+'至'+datetostr(dtpEndDate.Date),5.5);
     //打印基本信息下两条横线
        setpen(clblack,pssolid,-2,pmcopy);
        moveto(0.3,ypos+0.2);
        lineto(pagewidth-0.3,ypos+0.2);
        setpen(clblack,pssolid,-1,pmcopy);
        moveto(0.3,ypos+0.22);
        lineto(pagewidth-0.3,ypos+0.22);
     //打印表头
        cleartabs;
        setFont('楷体_GB2312',11);
        ypos:=ypos+0.5;
        setTab(0.8,pjcenter,1.5,0,boxlineall,0);
        settab(na,pjcenter,2.5,0,boxlineall,0);
        n:=rstdata.FieldCount-1;
        for col:=2 to n do
        begin
         setTab(na,pjcenter,1.5,0,boxlineall,0);
        end;
        for col:=0 to n do
        begin
          Tab(0,0,0,0,10);
          print(dbgrid1.columns[col].FieldName);
        end;
        //打印表内容
        setFont('楷体_GB2312',11);
        ypos:=ypos+0.18;
        cleartabs;
        //for row:=1 to rstdata.RecordCount-1 do
        rstdata.First;
        row:=0;
        setTab(0.8,pjcenter,1.5,0,0,0);
        settab(na,pjcenter,2.5,0,boxlineall,0);
        boxlinecolor:=clWhite;
        for col:=2 to n do
        begin
         setTab(na,pjcenter,1.5,0,BOXLINENONE,0);
        end;
        while not rstdata.Eof do
        begin

           for col:=0 to rstdata.FieldCount-1 do
           begin
               Tab(0,0,0,0,10);
               if varisnull(rstdata.Fields[col].Value) then
                  str:=' '
               else
                  str:=rstdata.Fields[col].Value;
               print(str);

               inc(row);

           end;
           println('');
           rstdata.next;

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



procedure TbbDistributeForm.btnToExcelClick(Sender: TObject);
var
  i,j,k:integer;
  str:string;
begin
    str:='';
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
   excelWorksheet1.cells.item[k,1]:='时间范围：'+datetostr(dtpBegDate.date)+'至'+datetostr(dtpEndDate.Date);
   inc(k);
   if rdgSelect.itemindex=0 then
   begin
      excelWorksheet1.cells.item[k,1]:='统计方式：细菌总属';
      inc(k);
   end else
   begin
      excelWorksheet1.cells.item[k,1]:='统计方式：列出详单';
      inc(k);
   end;

   for i:=0 to DBgrid1.Columns.Count-1 do
        excelWorksheet1.Cells.Item[k,i+1]:=DBgrid1.Columns.Items[i].Title.Caption;
   with rstdata do
   begin
      first;
      while not eof do
      begin
        for i:=0 to fields.count-1 do
        begin
          if varisnull(fields[i].value) then
            str:=''
          else
            str:=trim(fields[i].value);
          excelWorksheet1.cells.item[recno+k+1,i+1]:=str;
        end;
        next;
      end;
   end;
   with excelWorksheet1 do
   begin
        range[cells.item[k,1],cells.item[k,rstdata.FieldCount]].font.bold:=true;
        range[cells.item[k,1],cells.item[k,rstdata.FieldCount]].horizontalalignment:=xlCenter;
   end;
   excelWorksheet1.Cells.Font.Size:=10;
   excelWorksheet1.Columns.AutoFit;
   // excelworkbook1.savecopyas('标本分布报表');
   // excelApplication1.quit;
   // excelworksheet1.disconnect;
   // excelworkbook1.disconnect;
   //excelapplication1.disconnect;

end;

procedure TbbDistributeForm.Button1Click(Sender: TObject);
begin
    close;
end;

end.
