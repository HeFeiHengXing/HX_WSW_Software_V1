unit regBBfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask,db, ADODB;

type
  TregBBForm = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    btnAdd: TButton;
    btnDel: TButton;
    btnExit: TButton;
    btnSave: TButton;
    btnExtract: TButton;
    bbdj_bblx: TDBEdit;
    zfx_bblx: TADOQuery;
    zfx_bblxs: TDataSource;
    bbdj_bbxb: TDBEdit;
    zfx_bbxbs: TDataSource;
    zfx_bbxb: TADOQuery;
    bbdj_bbkb: TDBEdit;
    zfx_bbkb: TADOQuery;
    zfx_sjys: TADOQuery;
    zfx_sjmd: TADOQuery;
    zfx_bbkbs: TDataSource;
    zfx_sjmds: TDataSource;
    zfx_sjyss: TDataSource;
    bbdj_sjmd: TDBEdit;
    bbdj_sjys: TDBEdit;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ZFX_YX: TADOQuery;
    Label13: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbe_specNumber: TDBEdit;
    dbe_patientName: TDBEdit;
    dbc_sex: TDBComboBox;
    dbe_caseNumber: TDBEdit;
    dbc_sectionName: TDBComboBox;
    dbe_age: TDBEdit;
    dbc_specType: TDBComboBox;
    dbe_bedNum: TDBEdit;
    dbc_checkPurpose: TDBComboBox;
    dbc_checkDoctor: TDBComboBox;
    dbe_checkDate: TDBEdit;
    dbe_diagnose: TDBComboBox;
    DBCage: TDBComboBox;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExtractClick(Sender: TObject);
    procedure dbe_specNumberKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_caseNumberKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sectionNameKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_patientNameKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sexKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_ageKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_specTypeKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_bedNumKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_checkPurposeKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_checkDoctorKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_diagnoseKeyPress(Sender: TObject; var Key: Char);
    procedure DBCageKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure dbc_sectionNameExit(Sender: TObject);
  private
    { Private declarations }
    procedure resetform;
  public
    { Public declarations }
    bExtract:boolean;
    extracted:boolean;
    SQLText:string;
  end;

var
  regBBForm: TregBBForm;

implementation

uses dbym, ymDataType, common, germAnalysisFrm,loginfrm;

{$R *.dfm}

procedure TregBBForm.FormShow(Sender: TObject);
var
   dh:dbhelper;
   strlist:tstringlist;
begin
   dmym.rsRegBB.active:=true;
   if dmym.rsRegbb.recordcount<>0 then
      label13.Caption:='标本总数:'+inttostr(dmym.rsRegbb.recordcount)
   else
   begin
      label13.Caption:='标本总数:'+inttostr(0);
      resetform;//初始化
   end;
   dh:=dbhelper.create;
   strlist:=tstringlist.Create;

   dh.getSjMan(strlist);
   dbc_checkDoctor.Items:=strlist;
  // dbc_reportDoctor.Items:=strlist;
   strlist.clear;

   dh.getSection(strlist);
   dbc_sectionName.Items:=strlist;
   strlist.Clear;

   dh.getBBType(strlist);
   dbc_spectype.Items:=strlist;
   strlist.Clear;

   dh.getLczd(strlist);
   dbe_diagnose.Items:=strlist;
   strlist.clear;

   dh.getSjmd(strlist);
   dbc_checkPurpose.Items:=strlist;
   strlist.Clear;

   strlist.Free;
   dh.Free;
   //btnSave.Enabled:=false;
   if bExtract then
      btnExtract.Enabled:=true
   else
      btnExtract.enabled:=false;
   //dbe_checkdate.Text:=datetostr(date);
end;

procedure TregBBForm.btnAddClick(Sender: TObject);
var Mbbh:string;
begin
    if dbe_specNumber.Text='' then
    begin
        Application.MessageBox('标本编号不允许为空！','提示',0);
        dbe_specNumber.SetFocus;
        exit;
    end;
    if  dbe_checkdate.text='' then
    begin
        messagedlg('请输入日期!',mtwarning,[mbok],0);
        dbe_checkdate.SetFocus;
        exit;
    end;
    dmym.rsRegBB.append;
    resetform;
   {with ADOQuery3 do
    begin
      close;
      sql.Clear;
      sql.Add('select bbh from RegBBlc where bbh<>'' ''');
      open;
    end;
   if  ADOQuery3.RecordCount>0 then
   begin
      with ADOQuery2 do
      begin
      close;
      sql.Clear;
      sql.Add('select max(bbh) as Maxbbh from RegBBlc');
      open;
      end;
      Mbbh:=ADOQuery2.FieldValues['Maxbbh'];
      if inttostr(strtoint(Mbbh)+1)<>'' then
      dbe_specNumber.Text:=inttostr(strtoint(Mbbh)+1)
      else
      dbe_specNumber.Text:='';
   end; }
    dbe_specNumber.SetFocus;
end;

procedure TregBBForm.btnSaveClick(Sender: TObject);
begin
   btndel.enabled:=true;//添加标本删除按纽可用。若无标本记录 删除按纽不可用。
   if  dbe_specNumber.Text='' then
   begin
    Application.MessageBox('标本编号不允许为空！','提示',0);
    dbe_specNumber.SetFocus;
    exit;
   end;
   if  dbe_checkdate.text='' then
   begin
      messagedlg('请输入日期!',mtwarning,[mbok],0);
      dbe_checkdate.SetFocus;
      exit;
   end;
   if (dmym.rsRegBB.state=dsedit) or (dmym.rsRegBB.state=dsInsert) then
   begin
      dmym.rsRegBB.Post;
      //btnSave.Enabled:=false;
      label13.Caption:='标本总数:'+inttostr(dmym.rsRegbb.recordcount);
   end;
end;

procedure TregBBForm.btnModifyClick(Sender: TObject);
begin
   dmym.rsRegBB.Edit;
   btnSave.Enabled:=true;
end;

procedure TregBBForm.btnExitClick(Sender: TObject);
begin
   dmym.rsRegBB.Active:=false;
   close;
end;

procedure TregBBForm.btnDelClick(Sender: TObject);
begin
   if dmym.rsRegBB.RecordCount<>0 then
   begin
   if MessageDlg('确定删除吗？',mtConfirmation,[mbOk,mbCancel],0)=mrOK then
      begin
      dmym.rsRegBB.Delete;
      label13.Caption:='标本总数:'+inttostr(dmym.rsRegbb.recordcount);
      end;
   end else
   messagedlg('没有记录可删除！',mtconfirmation,[mbok,mbcancel],0);

end;

procedure TregBBForm.FormCreate(Sender: TObject);
begin
   bExtract:=false;
   extracted:=false;

   with dmym.query1 do//初始化性别下拉菜单；
       begin
        close;
        sql.clear;
        sql.add('Select sex from ZFX_XB order by sex' );
        open;
       if recordCount>0 then
        begin
          while not eof do
          begin
            dbc_sex.Items.Add(fieldbyname('sex').asstring);
            next;
          end;
        end;
       end;
end;

procedure TregBBForm.btnExtractClick(Sender: TObject);
var
   id:integer;
begin
  if varisnull(dmym.rsRegBB['id']) then
  begin
    Application.MessageBox('新增记录必须先保存才可以提取！','提示',0);
    //if dmym.rsRegBB.state=dsInsert then
    //   dmym.rsRegBB.Cancel;
  end else
  begin
    id:=dmym.rsRegbb['id'];
    with dmym.exquery do
    begin
      close;
      sql.clear;
      sql.add('select * from regbblc ');
      sql.add('where id=:id');
      parameters.parambyname('id').value:=id;
      open;
    end;
    extracted:=true;
    close;
  end;
end;

procedure TregBBForm.dbe_specNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(((key>=#48) and (key<=#57))or (key=#8) or (key=#13)) then
   key:=#0
   else
   if key = #13 then
    dbe_caseNumber.SetFocus;
end;

procedure TregBBForm.dbe_caseNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
   IF key =#13 then
   dbc_sectionName.SetFocus;
end;

procedure TregBBForm.dbc_sectionNameKeyPress(Sender: TObject;
  var Key: Char);
  var secid:string;
begin
   SQLText:='';
   if key =#13 then
   begin
    if dbc_sectionName.Text='' then
       showmessage('请输入代号选择或直接输入科别！');
    if dbc_sectionName.Text<>'' then
       begin
         SQLText:='select * from secname';
         secid:=dbc_sectionName.Text;
         with zfx_bbkb do
         begin
         close;
         sql.clear;
         sql.add(SQLText);
         sql.add('where secid=:secid');
         parameters.parambyname('secid').value:=secid;
         open;
         end;
         if zfx_bbkb.RecordCount>0 then
            dbc_sectionName.Text:=bbdj_bbkb.Text;
       end;
         dbe_patientName.setfocus;
    end;

end;

procedure TregBBForm.dbe_patientNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  dbc_sex.SetFocus;
end;

procedure TregBBForm.dbc_sexKeyPress(Sender: TObject; var Key: Char);
var ID:string;
begin
   SQLText:='';
   if key =#13 then
   begin
    if dbc_sex.Text='' then
      showmessage('请输入代号');
    if dbc_sex.Text<>'' then
       begin
         SQLText:='select * from ZFX_XB ';
         ID:=dbc_sex.Text;
         with zfx_bbxb do
         begin
         close;
         sql.clear;
         sql.add(SQLText);
         sql.add('where ID=:ID');
         parameters.parambyname('ID').value:=ID;
         open;
         end;
         if zfx_bbxb.RecordCount>0 then
            dbc_sex.Text:=bbdj_bbxb.Text;
       end;
            dbe_age.setfocus;
    end;
end;
procedure TregBBForm.DBCageKeyPress(Sender: TObject; var Key: Char);
  var id:string;
begin
  if key=#13 then
  begin
      if (DBCage.Text='01') or  (DBCage.text='1') then
      DBCage.Text:='岁';
      if (DBCage.Text='02') or  (DBCage.text='2') then
      DBCage.Text:='月';
      if (DBCage.Text='03') or  (DBCage.text='3') then
      DBCage.Text:='天';
      if (DBCage.Text='04') or  (DBCage.text='4') then
      DBCage.Text:='小时';
      if (DBCage.Text='05') or  (DBCage.text='5') then
      DBCage.Text:='分钟';
      dbc_specType.SetFocus;
  end;
end;


procedure TregBBForm.dbe_ageKeyPress(Sender: TObject; var Key: Char);
begin
    if key =#13 then
    DBCage.setfocus;
end;

procedure TregBBForm.dbc_specTypeKeyPress(Sender: TObject; var Key: Char);
var id:string;
begin
    SQLText:='';
    if key =#13 then
    begin
      if dbc_specType.Text='' then
      showmessage('请输入代号');
    if dbc_specType.Text<>'' then
       begin
         SQLText:='select * from bb';
         ID:=dbc_specType.Text;
         with zfx_bblx do
         begin
         close;
         sql.clear;
         sql.add(SQLText);
         sql.add('where ID=:ID');
         parameters.parambyname('ID').value:=ID;
         open;
         end;
         if zfx_bblx.RecordCount>0 then
            dbc_specType.Text:=bbdj_bblx.Text;
       end;
       dbe_bedNum.setfocus;
    end;

end;

procedure TregBBForm.dbe_bedNumKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   dbc_checkPurpose.setfocus;
end;

procedure TregBBForm.dbc_checkPurposeKeyPress(Sender: TObject;
  var Key: Char);
var ZT_sjmdID:string;
begin
    SQLText:='';
    if key=#13 then
    begin
      if dbc_checkPurpose.Text='' then
         showmessage('请输入代号');
      if dbc_checkPurpose.Text<>''then
         begin
           SQLText:='select * from ZT_SJ';
           ZT_sjmdID:=dbc_checkPurpose.Text;
         with zfx_sjmd do
         begin
           close;
           sql.clear;
           sql.add(SQLText);
           sql.add('where ZT_sjmdID=:ZT_sjmdID');
           parameters.parambyname('ZT_sjmdID').value:=ZT_sjmdID;
           open;
         end;
         if zfx_sjmd.RecordCount>0 then
            dbc_checkPurpose.Text:=bbdj_sjmd.Text;
         end;
            dbe_diagnose.SetFocus;
    end;
END;

procedure TregBBForm.dbc_checkDoctorKeyPress(Sender: TObject;
  var Key: Char);
var ID:string;
begin
    SQLText:='';
    if key=#13 then
    begin
     if dbc_checkDoctor.Text='' then
      showmessage('请输入代号');
     if dbc_checkDoctor.Text<>'' then
       begin
         SQLText:='select * from sjys';
         ID:=dbc_checkDoctor.Text;
         with zfx_sjys do
         begin
         close;
         sql.clear;
         sql.add(SQLText);
         sql.add('where ID=:ID');
         parameters.parambyname('ID').value:=ID;
         open;
         end;
         if zfx_sjys.RecordCount>0 then
            dbc_checkDoctor.Text:=bbdj_sjys.Text;
         dbe_checkDate.SetFocus;   
       end;
       //dbe_checkDate.SetFocus;
    end;
end;

procedure TregBBForm.dbe_diagnoseKeyPress(Sender: TObject; var Key: Char);
  var lczdID:string;
begin
  if key=#13 then
  begin
   if dbe_diagnose.Text='' then
      showmessage('**请选择临床诊断**');
   if dbe_diagnose.Text<>'' then
      begin
         lczdID:=dbe_diagnose.Text;
         with ADOQuery1 do
         begin
         close;
         sql.clear;
         sql.add('select * from YYlczd where id=:lczdID');
         parameters.parambyname('lczdID').value:=lczdID;
         open;
         end;
         if ADOQuery1.RecordCount>0 then
            dbe_diagnose.Text:=ADOQuery1.Fieldbyname('lczd').AsString;
       end;
   dbc_checkDoctor.SetFocus
end;
end;
procedure TregBBForm.resetform;
begin
      dmym.dsRegBB.Edit; //第一次如果没有数据 给时间赋初值
      if timetype='now' then
          dmym.rsRegBB['cyDate']:=now
      else
          dmym.rsRegBB['cyDate']:=date;
      dmym.rsRegBB['age']:='岁';
      dmym.rsRegBB['sjmd']:='细菌培养＋药敏';
end;

procedure TregBBForm.Button1Click(Sender: TObject);
var dataclass:dbhelper;
begin
    dataclass:=dbhelper.Create;
    dmym.rsRegBB['bbh']:=dataclass.generateNumber('baseno');
    dataclass.Free;
end;

procedure TregBBForm.dbc_sectionNameExit(Sender: TObject);
var strlist:Tstringlist;
    db:dbhelper;
begin
    db:=dbhelper.Create;
    strlist:=Tstringlist.Create;
    if db.getSjMan(strlist,dbc_sectionname.text)<>0 then
      dbc_checkdoctor.Items:=strlist;
end;

end.
