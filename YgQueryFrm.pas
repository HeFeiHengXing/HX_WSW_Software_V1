unit YgQueryFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, RpCon, RpConDS,
  RpBase, RpSystem, RpDefine, RpRave,comobj, Menus;

type
  TYgQueryForm = class(TForm)
    btnQuery: TBitBtn;
    BitBtn2: TBitBtn;
    btndetail: TBitBtn;
    BitBtn4: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    cbSection: TComboBox;
    begdate: TDateTimePicker;
    enddate: TDateTimePicker;
    chk1: TCheckBox;
    DBGrid1: TDBGrid;
    Button1: TButton;
    rvproject1: TRvProject;
    RvSystem1: TRvSystem;
    Rvquery: TRvDataSetConnection;
    cbStyle: TComboBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    BitBtn1: TBitBtn;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btndetailClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure chk1KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YgQueryForm: TYgQueryForm;
  adanum:string;
implementation

uses dbym,ymDataType,YgAirFrm,YgSurfaceFrm,YgHandFrm,
     YgMedFrm,YgLiqFrm,ygqtFrm,Ygtxyfrm,common, YgSurgeryFrm;

{$R *.dfm}

procedure TYgQueryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=cafree;
   //dmym.rshospital.Active:=false;
end;

procedure TYgQueryForm.FormShow(Sender: TObject);
var
   strl:tstringlist;
   dh:dbhelper;
begin
  cbsection.Enabled:=false;
  cbstyle.Enabled:=false;
  strl:=tstringlist.Create;
  dh.getSection(strl);
  cbSection.items:=strl;
  strl.Free;

  begdate.Date:=date;
  enddate.Date:=date;

  dmym.rsHospital.Active:=true;
end;

procedure TYgQueryForm.BitBtn4Click(Sender: TObject);
begin
    if (not dmym.rsHospital.Bof) or (not dmym.rsHospital.Eof) then
       if dmym.rsHospital.recordcount<>0 then
       if MessageDlg('确定删除吗？',mtConfirmation,[mbOk,mbCancel],0)=mrOK then
             dmym.rsHospital.delete
       else MessageDlg('没有记录可删除！',mtconfirmation,[mbok,mbcancel],0);
end;

procedure TYgQueryForm.btnQueryClick(Sender: TObject);
var
   str:string;
begin
    dmym.rshospital.active:=false;
    if  checkbox2.Checked=true then
        str:='select * from hospital order by reportdate desc'
    else
    begin
      if  chk1.checked and (not(checkbox1.Checked))then
          str:='select * from hospital where secname="'+cbSection.text+'" and ';
      if  CheckBox1.checked and (not(chk1.Checked)) then
          str:='select * from hospital where CYlb="'+cbStyle.text+'" and ';
      if  (CheckBox1.checked=true) and (chk1.checked=true) then
          str:='select * from hospital where secname="'+cbSection.text+'" and CYlb="'+cbStyle.text+'" and ';
      if  (not (chk1.checked)) and (not(CheckBox1.checked)) then
          str:='select * from hospital where ' ;
      str:=str+' reportdate between #'+datetostr(begdate.Date)+'# and #'+datetostr(enddate.date+1)+'# order by reportdate desc,specNum ASC';//asc';
    end;
    dmym.rshospital.CommandText:=str;
    dmym.rshospital.active:=true;
    dmym.rsHospital.First;
end;

procedure TYgQueryForm.chk1Click(Sender: TObject);
begin
   cbSection.Enabled:=chk1.Checked;
end;

procedure TYgQueryForm.CheckBox1Click(Sender: TObject);
begin
     cbStyle.Enabled:=CheckBox1.Checked;
end;

procedure TYgQueryForm.Button1Click(Sender: TObject);
begin
   close;
end;

procedure TYgQueryForm.btndetailClick(Sender: TObject);
var
   airfrm:tYgAirform;
   surfrm:tYgSurfaceForm;
   YhandFrm:TYgHandForm;
   YMedFrm:TYgMedForm;
   YLiqFrm:TYgLiqForm;
   YqtFrm:TYgQtForm;
   ytxyfrm:TYgtxy;
   SurgeryForm:TYgSurgeryForm;
begin
   if  dmym.rsHospital.Active then
   begin
      if dmym.rsHospital['cylb']='空气' then
      begin
         adanum:= dmym.rsHospital['anum'];
         airfrm:=tYgAirForm.Create(self);
         airfrm.bBrowse:=true;
         airfrm.ShowModal;
      end;
      if dmym.rsHospital['cylb']='物体表面' then
      begin
         adanum:= dmym.rsHospital['anum'];
         surfrm:=tYgSurfaceForm.Create(self);
         surfrm.bBrowse:=true;
         surfrm.ShowModal;
      end;
      if dmym.rsHospital['cylb']='医护人员手' then
      begin
       adanum:= dmym.rsHospital['anum'];
       YhandFrm:=TYgHandForm.Create(self);
       YhandFrm.bBrowse:=true;
       YhandFrm.ShowModal;
      end;
      if dmym.rsHospital['cylb']='医疗器材' then
      begin
       adanum:= dmym.rsHospital['anum'];
       YMedFrm:=TYgMedForm.Create(self);
       YMedFrm.bBrowse:=true;
       YMedFrm.ShowModal;
      end;
      if dmym.rsHospital['cylb']='消毒液与保存液' then
      begin
       adanum:= dmym.rsHospital['anum'];
       YLiqFrm:=TYgLiqForm.Create(self);
       YLiqFrm.bBrowse:=true;
       YLiqFrm.ShowModal;
      end;
      if dmym.rsHospital['cylb']='其他' then
      begin
       adanum:= dmym.rsHospital['anum'];
       YqtFrm:=TYgQtForm.Create(self);
       YqtFrm.bBrowse:=true;
       YqtFrm.ShowModal;
      end;
      if dmym.rsHospital['cylb']='透析液' then
      begin
       adanum:= dmym.rsHospital['anum'];
       Ytxyfrm:=TYgtxy.Create(self);
       Ytxyfrm.bBrowse:=true;
       Ytxyfrm.ShowModal;
      end;
      if dmym.rsHospital['cylb']='手术室' then
      begin
       adanum:= dmym.rsHospital['anum'];
       SurgeryForm:=TYgSurgeryForm.Create(self);
       SurgeryForm.bBrowse:=true;
       SurgeryForm.ShowModal;
      end;
   end;
end;

procedure TYgQueryForm.BitBtn2Click(Sender: TObject);
begin
   rvproject1.Open;
   rvproject1.SetParam('cy','采样类别:');
   rvproject1.SetParam('cb','科室:');
  if CheckBox1.Checked then
    begin
    rvproject1.SetParam('cylb',cbStyle.Text);
    end
    else
    begin
     rvproject1.SetParam('cylb','***');
    end;
   if chk1.Checked then
   begin
    rvproject1.SetParam('cbSection',cbSection.Text);
   end else
   begin
    rvproject1.SetParam('cbSection','***');
   end;
   rvproject1.SetParam('begDate',datetostr(begdate.Date));
   rvproject1.SetParam('endDate',datetostr(enddate.Date));
   rvproject1.SetParam('titlestr',hospitalname+'院内感染监测报告单');
   rvproject1.ExecuteReport('report8');
   rvproject1.Close;
end;

procedure TYgQueryForm.FormCreate(Sender: TObject);
begin
  rvproject1.ProjectFile:=rvfile;
end;



procedure TYgQueryForm.chk1KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if not chk1.Checked then
            chk1.Checked:=true
        else
            chk1.Checked:=false;
    end;
end;

procedure TYgQueryForm.CheckBox1KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if not CheckBox1.Checked then
            CheckBox1.Checked:=true
        else
            CheckBox1.Checked:=false;
    end;
end;

procedure TYgQueryForm.BitBtn1Click(Sender: TObject);
var exl:variant;
    i,j,k:integer;
begin
    try
    exl:=createoleobject('excel.application');
    except
    showmessage('导出EXCEL出错，请检查是否安装EXCEL!');
    end;
    exl.workbooks.add;
    exl.caption:='院内感染标本总览';
    exl.visible:=true;
    exl.activesheet.name:='院内感染标本总览';

    k:=1;
    if chk1.Checked then
    begin
      exl.activesheet.cells.item[k,1]:='科室：'+cbsection.Text;
      inc(k);
    end;
    if checkbox1.Checked then
    begin
      exl.activesheet.cells.item[k,1]:='采样类别：'+cbstyle.Text;
      inc(k);
    end;
    exl.activesheet.cells.item[k,1]:='时间范围：'+datetostr(BegDate.date)+'至'+datetostr(EndDate.Date);
    inc(k);

    exl.activesheet.cells[k,1].value:='标本号';
    exl.activesheet.cells[k,2].value:='科室';
    exl.activesheet.cells[k,3].value:='检测对象';
    exl.activesheet.cells[k,4].value:='采样类别';
    exl.activesheet.cells[k,5].value:='检测结果';
    exl.activesheet.cells[k,6].value:='细菌名称';
    exl.activesheet.cells[k,7].value:='国家标准';
    exl.activesheet.cells[k,8].value:='结论';
    exl.activesheet.cells[k,9].value:='检测日期';
    exl.activesheet.cells[k,10].value:='报告日期';

    with dmym.rsHospital do
    begin
        first;
        while not eof do
        begin
          exl.activesheet.cells[dmym.rsHospital.RecNo+k,1].value:=fieldbyname('specnum').asstring;
          exl.activesheet.cells[dmym.rsHospital.RecNo+k,2].value:=fieldbyname('secname').asstring;
          exl.activesheet.cells[dmym.rsHospital.RecNo+k,3].value:=fieldbyname('room').asstring;
          exl.activesheet.cells[dmym.rsHospital.RecNo+k,4].value:=fieldbyname('cylb').asstring;
          exl.activesheet.cells[dmym.rsHospital.RecNo+k,5].value:=fieldbyname('mem').asstring;
          exl.activesheet.cells[dmym.rsHospital.RecNo+k,6].value:=fieldbyname('germname').asstring;
          exl.activesheet.cells[dmym.rsHospital.RecNo+k,7].value:=fieldbyname('YGbbGB').asstring;
          exl.activesheet.cells[dmym.rsHospital.RecNo+k,8].value:=fieldbyname('YGbbJC').asstring;
          exl.activesheet.cells[dmym.rsHospital.RecNo+k,9].value:=fieldbyname('cyDate').asstring;
          exl.activesheet.cells[dmym.rsHospital.RecNo+k,10].value:=fieldbyname('reportDate').asstring;
          next;
        end ;
    end ;

    exl.activesheet.range[exl.activesheet.cells.item[k,1],exl.activesheet.cells.item[k,20]].font.bold:=true;
    exl.activesheet.range[exl.activesheet.cells.item[k,1],exl.activesheet.cells.item[k,20]].horizontalalignment:=-4108;

    exl.activesheet.Cells.Font.Size:=10;
    exl.activesheet.Columns.AutoFit;
end;

procedure TYgQueryForm.DBGrid1TitleClick(Column: TColumn);
begin
    if not Column.Field.IsBlob then { 不能给大二进制字段建立索引或排序 }
      dmym.rshospital.IndexFieldNames := Column.FieldName;
end;

procedure TYgQueryForm.Button2Click(Sender: TObject);
begin
    dmym.rshospital.IndexFieldNames:='specnum';
end;

end.
