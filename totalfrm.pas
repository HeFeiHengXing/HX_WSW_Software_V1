unit totalfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, DBGrids, RpBase, RpSystem,
  RpCon, RpConDS, RpDefine, RpRave, ExcelXP, OleServer, DB, ADODB, Mask,
  DBCtrls, ComCtrls,Comobj;

type
  TtotalForm = class(TForm)
    DBGrid1: TDBGrid;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    conn: TADOConnection;
    DelectYP: TADOQuery;
    Label1: TLabel;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    rvConn: TRvDataSetConnection;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    btnQuery: TBitBtn;
    btnDel: TBitBtn;
    btnDetail: TBitBtn;
    btnPrint: TButton;
    btnTotalRec: TButton;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    dtpBegDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    dbc_bb: TComboBox;
    Label4: TLabel;
    Label2: TLabel;
    dbc_section: TComboBox;
    dbc_germtype: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    dbc_bbtype: TComboBox;
    Label7: TLabel;
    Dbc_sjmd: TComboBox;
    Label8: TLabel;
    chkypmc: TCheckBox;
    Label9: TLabel;
    SpecialRmDB: TComboBox;
    dbc_xjname: TComboBox;
    Label10: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTotalRecClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnDetailClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure dbc_germtypeChange(Sender: TObject);
  private
    { Private declarations }
    parentWnd:tform;
    comstr:string;
  public
    { Public declarations }
  end;

var
  totalForm: TtotalForm;

implementation

uses dbym, detailfrm, queryGenFrm, common,germAnalysisFrm,
     positiveFrm, NegativeFrm,loginfrm, ymDataType;

{$R *.dfm}

procedure TtotalForm.FormShow(Sender: TObject);
begin
  comstr:='select * from Base  order by repdate desc';
  dmym.rsbase.Active:=false;
  dmym.rsbase.CommandText:=comstr;
  dmym.rsbase.Active:=true;
  if dmym.rsBase.recordcount<>0 then
     label1.Caption:='标本总数:'+inttostr(dmym.rsbase.recordcount)
  else
     label1.Caption:='标本总数:'+inttostr(0);
end;

procedure TtotalForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    action:=cafree;
end;

procedure TtotalForm.btnTotalRecClick(Sender: TObject);
begin
  comstr:='select * from Base order by repdate desc';
  dmym.rsbase.Active:=false;
  dmym.rsbase.CommandText:=comstr;
  dmym.rsbase.Active:=true;
  label1.Caption:='标本总数:'+inttostr(dmym.rsbase.recordcount);
end;

procedure TtotalForm.btnDelClick(Sender: TObject);
var SQLtext:string;
    useid:integer;
begin
    if dmym.rsBase.recordcount<>0 then
    begin
    if messagebox(handle,'删除当前记录?','提示',mb_okcancel)=idok then
    begin
      useid:=dmym.rsbase['useId'];
      if dmym.rsBase['type']='鉴定分析' then
      begin
          SQLtext:='delete from YpBase where useid='+inttostr(dmym.rsbase['useid']);
          dmym.conn.Execute(SQLtext);
      end else
      begin
          SQLtext:='delete from yx where useid='+inttostr(dmym.rsbase['useid']);
          dmym.conn.Execute(SQLtext);
      end;
      SQLtext:='delete from ypadd where useid='+inttostr(dmym.rsbase['useid']);
      dmym.conn.Execute(SQLtext);
      dmym.rsBase.Delete;
      label1.Caption:='标本总数:'+inttostr(dmym.rsbase.recordcount);
    end;
    end else
    messagebox(0,'没有记录可删除！','提示',mb_okcancel);
end;

procedure TtotalForm.btnDetailClick(Sender: TObject);
var frmDetail:tdetailform;
    pfrm:tPositiveform;
    nfrm:tNegativeform;
    id:integer;
    bPositive:boolean;
    gfrm:tgermAnalysisForm;
begin
    if dmym.rsbase.recordcount>0 then
    begin
        if  dmym.rsBase['type']='阳性报告' then
        begin
            pfrm:=tPositiveForm.Create(self);
            pfrm.boldPatient:=true;
            pfrm.ShowModal;
            dmym.rsbase.Active:=false;
            dmym.rsbase.CommandText:=comstr;
            dmym.rsbase.Active:=true;
        end else
        if dmym.rsBase['type']='阴性报告' then
        begin
            nfrm:=tNegativeForm.Create(self);
            nfrm.bOldPatient:=true;
            nfrm.ShowModal;
            dmym.rsbase.Active:=false;
            dmym.rsbase.CommandText:=comstr;
            dmym.rsbase.Active:=true;
        end else
        if (dmym.rsbase['type']='鉴定分析') or (dmym.rsBase['type']='分枝杆菌') then
        begin
            frmDetail:=tDetailform.Create(self);
            frmdetail.showmodal;
        end;
    end else
    dmym.rsbase.close;
end;

procedure TtotalForm.btnQueryClick(Sender: TObject);
var
   gfrm:tquerygenform;
begin
  gfrm:=tquerygenform.Create(self);
  gfrm.showmodal;
  gfrm.Free;
end;

procedure TtotalForm.btnPrintClick(Sender: TObject);
begin
   rvProject1.Open;
   rvProject1.ExecuteReport('report2');
   rvProject1.Close;
end;

procedure TtotalForm.FormCreate(Sender: TObject);
var db:dbhelper;
    str:tstringlist;
    i:integer;
begin
    rvproject1.ProjectFile:=rvfile;
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

    db.getsjmd(str);
    dbc_sjmd.Items:=str;
    dbc_sjmd.Items.Add('******不限******');
    i:=dbc_sjmd.Items.IndexOf('******不限******');
    dbc_sjmd.ItemIndex:=i;
    str.Clear;

    db.getBBType(str);
    dbc_bb.Items:=str;
    dbc_bb.Items.Add('******不限******');
    i:=dbc_bb.Items.IndexOf('******不限******');
    dbc_bb.ItemIndex:=i;
    str.Clear;

    i:=SpecialRmDB.Items.IndexOf('******不限******');
    SpecialRmDB.ItemIndex:=i;
    str.Clear;

    with dmym.query1 do//初始化单种细菌下拉菜单
    begin
        dbc_xjname.Items.Clear;
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
    str.Free;

    dbc_bbtype.ItemIndex:=4;

    dtpEndDate.date:=date;
    dtpBegdate.date:=date;
end;



procedure TtotalForm.Button1Click(Sender: TObject);
var
  i,j,k,excolumns,ypmccolcount,basecolcount:integer;
  js,ypmc,strtemp:string;
  dh:dbhelper;
  dataarr:array of array of string;
  SQLstr:string;
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
    excelWorksheet1.cells.item[k,1]:='标本分布：'+dbc_bbtype.Text;
    inc(k);
    excelWorksheet1.cells.item[k,1]:='送检目的：'+dbc_sjmd.Text;
    inc(k);
    excelWorksheet1.cells.item[k,1]:='时间范围：'+datetostr(dtpBegDate.date)+'至'+datetostr(dtpEndDate.Date);
    inc(k);

    dh:=dbhelper.Create;
    js:=dh.getgermindex(dbc_germtype.text);
    ypmc:='';
    //填写表头
    with dmym.rsBase do
    begin
        with excelworksheet1 do
        begin
            for j:=1 to DBgrid1.Columns.Count do
                cells.item[k,j]:=DBgrid1.Columns.Items[j-1].title.caption;
            basecolcount:=DBgrid1.Columns.Count;
            if chkypmc.checked then
            begin
                with dmym.query1 do
                begin
                  close;
                  sql.Clear;
                  sql.Add('select ypmc from ypall where js='''+js+''' order by ypid');
                  open;

                  ypmccolcount:=recordcount;
                  while not eof do
                  begin
                    cells.Item[k,j]:=fieldvalues['ypmc'];
                    next;
                    inc(j);
                  end;
                end;
            end;
            excolumns:=basecolcount+ypmccolcount;
        end;
    end;

    setlength(dataarr,dmym.rsBase.RecordCount);
    for i:=0 to dmym.rsBase.RecordCount-1 do
        setlength(dataarr[i],excolumns);

    SQLstr:='select ';
    for j:=0  to  basecolcount-1 do
        SQLstr:=SQLstr+'a.'+DBgrid1.Columns[j].FieldName+',';
    if chkypmc.Checked then
        SQLstr:=SQLstr+'b.mg,b.ypid from ('+dmym.rsBase.CommandText+') a inner join ypbase b on a.useid=b.useid order by a.repdate,a.useid,b.ypid'
    else
        SQLstr:=copy(SQLstr,1,length(SQLstr)-1)+' from ('+dmym.rsBase.CommandText+') a order by repdate';
    //showmessage(sqlstr);
    //填写信息
    with dmym.query1 do
    begin
        close;
        sql.Clear;
        sql.Add(SQLstr);
        open;

        first;
        i:=0;j:=0;
        if chkypmc.Checked then
        while not eof do
        begin
          if  RecNo=i*ypmccolcount+1 then
          for j:=0 to basecolcount-1 do
              dataarr[i,j]:=Fields[j].AsString;

          dataarr[i,j]:=fieldvalues['mg'];
          inc(j);
          if RecNo=(i+1)*ypmccolcount then
            inc(i);
          next;
        end else
        while not eof do
        begin
          for j:=0 to basecolcount-1 do
              dataarr[i,j]:=Fields[j].AsString;
          inc(i);
          next;
        end
    end;
    ExcelWorksheet1.Range[ExcelWorksheet1.cells.Item[k+1,1],ExcelWorksheet1.cells.item[dmym.rsBase.RecordCount+k,excolumns]].Value2:=dataarr;

    //设置EXCEL格式
    with ExcelWorksheet1.range[ExcelWorksheet1.cells.item[k,1],ExcelWorksheet1.cells.item[k,excolumns]] do
    begin
        font.bold:=1;
        horizontalalignment:=xlCenter;
    end;
    excelWorksheet1.Cells.Font.Size:=10;
    excelWorksheet1.Columns.AutoFit;
end;



procedure TtotalForm.Button2Click(Sender: TObject);
begin
    comstr:='select * from base where repdate between #';
    comstr:=comstr+datetostr(dtpbegdate.DateTime)+'# and #'+datetostr(dtpenddate.DateTime)+'# ';
    if dbc_germtype.text<>'******不限******' then
        comstr:=comstr+' and js='''+dbhelper.Create.getgermindex(trim(dbc_germtype.text))+'''';
    if dbc_section.text<>'******不限******' then
        comstr:=comstr+' and kb='''+trim(dbc_section.text)+'''';
    if dbc_bb.text<>'******不限******' then
        comstr:=comstr+' and bb='''+trim(dbc_bb.text)+'''';
    if dbc_bbtype.text<>'******不限******' then
        comstr:=comstr+' and type='''+trim(dbc_bbtype.text)+'''';
    if dbc_sjmd.text<>'******不限******' then
        comstr:=comstr+' and sjmd='''+trim(dbc_sjmd.text)+'''';
    if SpecialRmDB.text<>'******不限******' then
        IF SpecialRmDB.Text='MRS' THEN
                comstr:=comstr+' and tsnyIDM like ''%'+SpecialRmDB.Text+'%'''
        ELSE
                comstr:=comstr+' and tsnyID like ''%'+SpecialRmDB.Text+'%''';
    if dbc_xjname.text<>'******不限******' then
        comstr:=comstr+' and jzname='''+trim(dbc_xjname.text)+'''';
    comstr:=comstr+' order by repdate desc';

    with dmym.rsBase do
    begin
        active:=false;
        commandtext:=comstr;
        active:=true;
    end;
    label1.Caption:='标本总数:'+inttostr(dmym.rsbase.recordcount);
end;

procedure TtotalForm.Button3Click(Sender: TObject);
begin
    close;
end;

procedure TtotalForm.dbc_germtypeChange(Sender: TObject);
begin
    if   dbc_germtype.Text='******不限******' then
    begin
      chkypmc.Checked:=false;
      chkypmc.enabled:=false;
    end else
    begin
      chkypmc.Checked:=true;
      chkypmc.enabled:=true;
    end;
end;

end.
