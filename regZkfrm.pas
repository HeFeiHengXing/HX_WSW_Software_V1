unit regZkfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids,db, ADODB;

type
  TregZkform = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    dbe_specNumber: TDBEdit;
    dbc_btype: TDBComboBox;
    dbc_regDoctor: TDBComboBox;
    dbe_cDate: TDBEdit;
    dbc_sex: TDBComboBox;
    GroupBox2: TGroupBox;
    btnAdd: TButton;
    btnDel: TButton;
    btnExit: TButton;
    btnSave: TButton;
    dbe_sj: TDBEdit;
    dbe_age: TDBEdit;
    btnExtract: TButton;
    ADOQuery3: TADOQuery;
    zfx_zkbb: TADOQuery;
    DBC_age: TDBComboBox;
    Label6: TLabel;
    dbc_lczd: TDBComboBox;
    Label10: TLabel;
    dbc_sjmd: TDBComboBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExtractClick(Sender: TObject);
    procedure dbe_specNumberKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sexKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_ageKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_btypeKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_lczdKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_sjKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_regDoctorKeyPress(Sender: TObject; var Key: Char);
    procedure DBC_ageKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_lczdKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sjmdKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
     procedure resetform;
  public
    { Public declarations }
     bExtract:boolean;
     extracted:boolean;
  end;

var
  regZkform: TregZkform;

implementation

uses dbym, ymDataType,loginfrm;

{$R *.dfm}

procedure TregZkform.FormCreate(Sender: TObject);
var
   dh:dbhelper;
   strlist:tstringlist;
begin
   dh:=dbhelper.create;
   strlist:=tstringlist.Create;

   dh.getbbtype(strlist);
   dbc_btype.Items:=strlist;
   strlist.clear;

   dh.getCheckman(strlist);
   dbc_regDoctor.Items:=strlist;
   strlist.Clear;

   dh.getLczd(strlist);
   dbc_lczd.Items:=strlist;
   strlist.Clear;

   dh.getSjmd(strlist);
   dbc_sjmd.Items:=strlist;
   strlist.Clear;

   strlist.Free;

   bExtract:=false;
   extracted:=false;

   //btnSave.Enabled:=false;

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

procedure TregZkform.btnAddClick(Sender: TObject);
 var Mbbh:string;
begin
   if dbe_specNumber.Text='' then
   begin
      Application.MessageBox('标本编号不允许为空！','提示',0);
      dbe_specNumber.SetFocus;
      exit;
   end;
   if  dbe_cdate.text='' then
   begin
      messagedlg('请输入日期!',mtwarning,[mbok],0);
      dbe_cdate.SetFocus;
      exit;
   end;
   dmym.rsRegzk.append;
   resetform;
 {with ADOQuery3 do
    begin
      close;
      sql.Clear;
      sql.Add('select bbh from RegBBZK where bbh<>'' ''');
      open;
    end;
 if  ADOQuery3.RecordCount>0 then
   begin
      with ADOQuery3 do
      begin
      close;
      sql.Clear;
      sql.Add('select max(bbh) as Maxbbh from RegBBZK');
      open;
      end;
      Mbbh:=ADOQuery3.FieldValues['Maxbbh'];
      if inttostr(strtoint(Mbbh)+1)<>'' then
      dbe_specNumber.Text:=inttostr(strtoint(Mbbh)+1)
      else
      dbe_specNumber.Text:='';
   end;}
     dbe_specNumber.SetFocus;
end;

procedure TregZkform.btnModifyClick(Sender: TObject);
begin
   dmym.rsRegzk.Edit;
   btnSave.Enabled:=true;
end;

procedure TregZkform.btnSaveClick(Sender: TObject);
begin
    if dbe_specNumber.text=''then
    begin
        messagedlg('标本号不能为空!',mtconfirmation,[mbok],0);
        dbe_specNumber.SetFocus;
        exit;
    end;
    if  dbe_cdate.text='' then
    begin
      messagedlg('请输入日期!',mtwarning,[mbok],0);
      dbe_cdate.SetFocus;
      exit;
    end;
    if (dmym.rsRegzk.state=dsedit) or (dmym.rsRegzk.state=dsInsert) then
    begin
      dmym.rsRegzk.Post;
      label6.Caption:='标本总数:'+inttostr(dmym.rsRegzk.recordcount);
     // btnSave.Enabled:=false;
    end;

end;

procedure TregZkform.btnDelClick(Sender: TObject);
begin
    if dmym.rsRegzk.recordcount<>0 then
    begin
    if MessageDlg('确定删除吗？',mtConfirmation,[mbOk,mbCancel],0)=mrOK then
      begin
      dmym.rsRegzk.Delete;
      label6.Caption:='标本总数:'+inttostr(dmym.rsRegzk.recordcount);
      end;
    end else MessageDlg('没有记录可删除！',mtconfirmation,[mbok,mbcancel],0);
end;

procedure TregZkform.btnExitClick(Sender: TObject);
begin
   dmym.rsRegzk.Active:=false;
   close;
end;

procedure TregZkform.FormShow(Sender: TObject);
begin
    dmym.rsRegzk.active:=true;
    if dmym.rsRegzk.recordcount<>0 then
       label6.Caption:='标本总数:'+inttostr(dmym.rsRegzk.recordcount)
    else
    begin
       label6.Caption:='标本总数:'+inttostr(0);
       resetform;
    end;

    if bExtract then
      btnExtract.Enabled:=true
    else
      btnExtract.enabled:=false;
end;

procedure TregZkform.btnExtractClick(Sender: TObject);
var
  id:integer;
begin
  id:=dmym.rsRegzk['id'];
  with dmym.exquery do
  begin
      close;
      sql.clear;
      sql.add('select * from regbbzk ');
      sql.add('where id=:id');
      parameters.parambyname('id').value:=id;
      open;
  end;
  extracted:=true;
  close;
end;

procedure TregZkform.dbe_specNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(((key>=#48) and (key<=#57))or (key=#8) or (key=#13)) then
   key:=#0
   else
   if key=#13 then
   dbc_sex.SetFocus;
end;

procedure TregZkform.dbc_sexKeyPress(Sender: TObject; var Key: Char);
 var ID,SQLText:string;
begin
  if key=#13 then
  begin
   SQLText:='';
   if dbc_sex.Text='' then
      BEGIN
      showmessage('**请选择性别**');
      EXIT;
      END;
   if dbc_sex.Text<>'' then
      begin
         SQLText:='select * from ZFX_XB';
         ID:=dbc_sex.Text;
         with ZFX_ZKBB do
         begin
         close;
         sql.clear;
         sql.add(SQLText);
         sql.add('where ID=:ID');
         parameters.parambyname('ID').value:=ID;
         open;
         if ZFX_ZKBB.RecordCount>0 then
         dbc_sex.Text:=ZFX_ZKBB.FieldValues['sex'];
         end;
       end;
       dbe_age.SetFocus;
   end;
end;


procedure TregZkform.dbe_ageKeyPress(Sender: TObject; var Key: Char);
begin
  IF KEY=#13 THEN
  dbc_age.SetFocus;
end;

procedure TregZkform.dbc_btypeKeyPress(Sender: TObject; var Key: Char);
 var ID,SQLText:string;
begin
  if key=#13 then
  begin
   SQLText:='';
   if dbc_btype.Text='' then
      BEGIN
      showmessage('**请选择标本类型**');
      EXIT;
      END;
   if dbc_btype.Text<>'' then
      begin
         SQLText:='select * from bb';
         ID:=dbc_btype.Text;
         with ZFX_ZKBB do
         begin
         close;
         sql.clear;
         sql.add(SQLText);
         sql.add('where ID=:ID');
         parameters.parambyname('ID').value:=ID;
         open;
         if ZFX_ZKBB.RecordCount>0 then
         dbc_btype.Text:=ZFX_ZKBB.FieldValues['bbName'];
         end;
       end;
       dbc_lczd.SetFocus;
   end;
end;

procedure TregZkform.dbe_lczdKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
     dbe_sj.SetFocus;
end;

procedure TregZkform.dbe_sjKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
       dbc_sjmd.SetFocus;
end;

procedure TregZkform.dbc_regDoctorKeyPress(Sender: TObject; var Key: Char);
var ID,SQLText:string;
begin
  if key=#13 then
  begin
   SQLText:='';
   if dbc_regDoctor.Text='' then
      BEGIN
      showmessage('**请选择标本类型**');
      EXIT;
      END;
   if dbc_regDoctor.Text<>'' then
      begin
         SQLText:='select * from checkman';
         ID:=dbc_regDoctor.Text;
         with ZFX_ZKBB do
         begin
         close;
         sql.clear;
         sql.add(SQLText);
         sql.add('where ID=:ID');
         parameters.parambyname('ID').value:=ID;
         open;
         if ZFX_ZKBB.RecordCount>0 then
         dbc_regDoctor.Text:=ZFX_ZKBB.FieldValues['Name'];
         end;
       end;
       dbe_cDate.SetFocus;
   end;
end;

procedure TregZkform.DBC_ageKeyPress(Sender: TObject; var Key: Char);
var sqltext,id:string;
begin
  if key=#13 then
  begin
      if (dbc_age.Text='01') or  (dbc_age.text='1') then
      dbc_age.Text:='岁';
      if (dbc_age.Text='02') or  (dbc_age.text='2') then
      dbc_age.Text:='月';
      if (dbc_age.Text='03') or  (dbc_age.text='3') then
      dbc_age.Text:='天';
      if (dbc_age.Text='04') or  (dbc_age.text='4') then
      dbc_age.Text:='小时';
      if (dbc_age.Text='05') or  (dbc_age.text='5') then
      dbc_age.Text:='分钟';
      dbc_btype.SetFocus;
  end;
end;

procedure TregZkform.resetform;
begin
    dmym.rsRegZk.Edit;
    if timetype='now' then
        dmym.rsRegzk['cyDate']:=now
    else
        dmym.rsRegzk['cyDate']:=date;
    dmym.rsRegZk['age']:='岁';
end;

procedure TregZkform.dbc_lczdKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if dbc_lczd.Text<>'' then
        begin
          with dmym.query1 do
          begin
          close;
          sql.clear;
          sql.add('select * from YYlczd where id='''+dbc_lczd.Text+'''');
          open;
          end;
          if dmym.query1.RecordCount>0 then
            dbc_lczd.Text:=dmym.query1.FieldValues['lczd'];
       end;
       dbe_sj.SetFocus;
    end;
end;

procedure TregZkform.dbc_sjmdKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if dbc_sjmd.Text<>'' then
        begin
          with dmym.query1 do
          begin
          close;
          sql.clear;
          sql.add('select * from ZT_sj where ZT_sjmdID='''+dbc_sjmd.Text+'''');
          open;
          end;
          if dmym.query1.RecordCount>0 then
            dbc_sjmd.Text:=dmym.query1.FieldValues['ZT_sjmd'];
       end;
       dbe_cDate.SetFocus;
    end;
end;

procedure TregZkform.Button1Click(Sender: TObject);
var dataclass:dbhelper;
begin
    dataclass:=dbhelper.Create;
    dmym.rsRegZk['bbh']:=dataclass.generateNumber('basezkno');
    dataclass.Free;
end;

end.
