unit regYgMedFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids,db, ADODB;

type
  TregYgMedForm = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    dbe_specNumber: TDBEdit;
    dbc_sectionName: TDBComboBox;
    dbc_sampleDoctor: TDBComboBox;
    dbe_cDate: TDBEdit;
    DBComboBox1: TDBComboBox;
    GroupBox2: TGroupBox;
    btnAdd: TButton;
    btnDel: TButton;
    btnExit: TButton;
    btnSave: TButton;
    btnExtract: TButton;
    lblEnviron: TLabel;
    dbe_brand: TDBEdit;
    lblGlass: TLabel;
    dbe_ph: TDBEdit;
    lblStime: TLabel;
    dbc_type: TDBComboBox;
    Label4: TLabel;
    dbc_pinming: TDBComboBox;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnExtractClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbe_specNumberKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sectionNameKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_pinmingKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_brandKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_phKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_typeKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sampleDoctorKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_pinmingKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    datestr:string;
  public
    { Public declarations }
    bExtract,extracted:boolean;
    id:integer;
  end;

var
  regYgMedForm: TregYgMedForm;

implementation

uses dbym, ymDataType,loginfrm;

{$R *.dfm}

procedure TregYgMedForm.FormCreate(Sender: TObject);
begin
  dbe_brand.DataSource:=dmym.dsRegYg;
  dbe_brand.DataField:='brand';
  dbe_ph.DataSource:=dmym.dsRegYg;
  dbe_ph.DataField:='spph';
  dbc_type.DataSource:=dmym.dsRegYg;
  dbc_type.DataField:='sptype';
  bExtract:=false;
  extracted:=false;
end;

procedure TregYgMedForm.FormShow(Sender: TObject);
var
   dh:dbhelper;
   strlist:tstringlist;
   str:string;
   Maxbbhair1:integer;
begin
   dmym.rsRegYg.active:=false;
   dmym.rsRegyg.CommandText:='select * from RegBBYngr where cylb="医疗用品" order by cydate';;
   dmym.rsRegyg.active:=true;

   dmym.rsRegyg.Edit;
   dmym.rsRegYg['cylb']:='医疗用品';
   if dmym.rsRegYg.recordcount<>0 then
      label4.Caption:='标本总数:'+inttostr(dmym.rsRegYg.recordcount)
   else
   begin
      label4.Caption:='标本总数:'+inttostr(0);
      if timetype='now' then
          dmym.rsRegyg['cydate']:=now
      else
          dmym.rsRegyg['cydate']:=date;
      datestr:=dbe_cDate.Text;
   end;
   dh:=dbhelper.create;
   strlist:=tstringlist.Create;

   dbcombobox1.ItemIndex:=3;
   dbcombobox1.Enabled:=false;

   dh.getCheckMan(strlist);
   dbc_sampleDoctor.Items:=strlist;
   strlist.clear;

   dh.getPinming(strlist);
   dbc_pinming.Items:=strlist;
   strlist.Clear;

   dh.getSection(strlist);
   dbc_sectionName.Items:=strlist;
   strlist.Clear;

   strlist.Free;
   {with dmym.query1 do   //初始化标本号
      begin
      close;
      sql.Clear;
      sql.Add('select specNum from RegBBYngr');
      open;
      end;
      if dmym.query1.RecordCount>0 then
      begin
         with dmym.query1 do
        //bbh:=strtoint(bbh)
          begin
          close;
          sql.Clear;
          sql.Add('select max(specNum) as Maxbbhair from RegBBYngr');
          open;
          end;
          Maxbbhair1:=dmym.query1.Fieldbyname('Maxbbhair').AsInteger;
           if  (Maxbbhair1+1)<>0 then
             Maxbbhair1:=(Maxbbhair1+1)
           else
             Maxbbhair1 :=0;
           end else
             Maxbbhair1:=0;
          dbe_specNumber.text:=inttostr(Maxbbhair1);//初始化标本号}
   if bextract then
   btnExtract.Enabled:=true
   else
   btnExtract.Enabled:=false;
end;

procedure TregYgMedForm.btnAddClick(Sender: TObject);
var
     Maxbbhair: string;
     Maxbbhair1:integer;
begin
   if dbe_specNumber.text='' then
   begin
      showmessage('请输入标本号！');
      dbe_specNumber.SetFocus;
      exit;
   end;
   if  dbe_cdate.text='' then
   begin
      messagedlg('请输入日期!',mtwarning,[mbok],0);
      dbe_cdate.SetFocus;
      exit;
   end;
   dmym.rsRegyg.append;
   dmym.rsRegYg['cylb']:='医疗用品';
   if timetype='now' then
   dmym.rsRegyg['cyDate']:=now
   else
   dmym.rsRegyg['cyDate']:=date;
   //datestr:=datetostr(now);
   //dbe_cDate.Text:=datestr;
   { with dmym.query1 do
      begin
      close;
      sql.Clear;
      sql.Add('select specNum from RegBBYngr');
      open;
      end;
      if dmym.query1.RecordCount>0 then
      begin
         with dmym.query1 do
        //bbh:=strtoint(bbh)
          begin
          close;
          sql.Clear;
          sql.Add('select max(specNum) as Maxbbhair from RegBBYngr');
          open;
          end;
          Maxbbhair1:=dmym.query1.Fieldbyname('Maxbbhair').AsInteger;
           if  (Maxbbhair1+1)<>0 then
             Maxbbhair1:=(Maxbbhair1+1)
           else
             Maxbbhair1 :=0;
           end else
             Maxbbhair1:=0;
             dbe_specNumber.text:=inttostr(Maxbbhair1);}
      dbe_specNumber.SetFocus;
end;

procedure TregYgMedForm.btnSaveClick(Sender: TObject);
begin
  if dbe_specNumber.text='' then
  begin
    showmessage('请输入标本号！');
    dbe_specNumber.SetFocus;
    exit;
  end;
  if  dbe_cdate.text='' then
  begin
      messagedlg('请输入日期!',mtwarning,[mbok],0);
      dbe_cdate.SetFocus;
      exit;
  end;
  if (dmym.rsRegyg.state=dsedit) or (dmym.rsRegyg.state=dsInsert) then
  begin
     dmym.rsRegYg['CYlb']:='医疗用品';
     dmym.rsRegyg.Post;
     label4.Caption:='标本总数:'+inttostr(dmym.rsRegYg.recordcount);
     //btnSave.Enabled:=false;
  end;
end;

procedure TregYgMedForm.btnDelClick(Sender: TObject);
begin
   if dmym.rsRegYg.recordcount<>0 then
   if MessageDlg('确定删除吗？',mtConfirmation,[mbOk,mbCancel],0)=mrOK then
      begin
      dmym.rsRegyg.Delete;
      label4.Caption:='标本总数:'+inttostr(dmym.rsRegYg.recordcount);
      end
   else
      messagedlg('没有记录可删除！',mtconfirmation,[mbok,mbcancel],0);
end;

procedure TregYgMedForm.btnExtractClick(Sender: TObject);
begin
   id:=dmym.rsRegYg['id'];
  with dmym.exquery do
  begin
      close;
      sql.clear;
      sql.add('select * from regbbyngr ');
      sql.add('where id=:id');
      parameters.parambyname('id').value:=id;
      open;

  end;
  extracted:=true;
  close;
end;

procedure TregYgMedForm.btnExitClick(Sender: TObject);
begin
  dmym.rsRegyg.Active:=false;
   close;
end;

procedure TregYgMedForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 dmym.rsRegyg.Active:=false;
end;

procedure TregYgMedForm.dbe_specNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(((key>=#48) and (key<=#57))or (key=#8) or (key=#13)) then
   key:=#0
   else
   if key=#13 then
   dbc_sectionname.SetFocus;
end;

procedure TregYgMedForm.dbc_sectionNameKeyPress(Sender: TObject;
  var Key: Char);
var secid,SQLText:string;
begin
  if key=#13 then
  begin
   SQLText:='';
   if dbc_sectionName.Text<>'' then
      begin
         SQLText:='select * from secname';
         secid:=dbc_sectionName.Text;
         with ADOQuery1 do
         begin
           close;
           sql.clear;
           sql.add(SQLText);
           sql.add('where secid=:secid');
           parameters.parambyname('secid').value:=secid;
           open;
           if ADOQuery1.RecordCount<>0 then
           dbc_sectionName.Text:=ADOQuery1.FieldValues['secname'] ;
         end;
       end;
         dbc_pinming.setfocus;
   end;
end;

procedure TregYgMedForm.dbe_pinmingKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  dbc_type.SetFocus;
end;

procedure TregYgMedForm.dbe_brandKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
 dbe_ph.SetFocus;
end;

procedure TregYgMedForm.dbe_phKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  dbc_type.SetFocus;
end;

procedure TregYgMedForm.dbc_typeKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
      if dbc_type.text<>'' then
      begin
         if (dbc_type.text='1') or (dbc_type.text='01') then
            dbc_type.Text:='无接触的医疗用品';
         if (dbc_type.text='2') or (dbc_type.text='02') then
            dbc_type.Text:='接触粘膜的医疗用品';
         if (dbc_type.text='3') or (dbc_type.text='03') then
            dbc_type.Text:='接触皮肤的医疗用品';
      end;
  dbc_sampleDoctor.SetFocus;
  end;
end;

procedure TregYgMedForm.dbc_sampleDoctorKeyPress(Sender: TObject;
  var Key: Char);
var ID,SQLText:string;
begin
  if key=#13 then
  begin
   SQLText:='';
   if dbc_sampleDoctor.Text<>'' then
      begin
         SQLText:='select * from checkman';
         ID:=dbc_sampleDoctor.Text;
         with ADOQuery1 do
         begin
         close;
         sql.clear;
         sql.add(SQLText);
         sql.add('where ID=:ID');
         parameters.parambyname('ID').value:=ID;
         open;
         if ADOQuery1.RecordCount>0 then
         dbc_sampleDoctor.Text:=ADOQuery1.FieldValues['name'];
         end;
      end;
   end;
end;

procedure TregYgMedForm.dbc_pinmingKeyPress(Sender: TObject;
  var Key: Char);
var secid,SQLText:string;
begin
  if key=#13 then
  begin
   SQLText:='';
   if dbc_pinming.Text<>'' then
      begin
         SQLText:='select * from pinming';
         secid:=dbc_pinming.Text;
         with ADOQuery1 do
         begin
           close;
           sql.clear;
           sql.add(SQLText);
           sql.add('where id=:secid');
           parameters.parambyname('secid').value:=secid;
           open;
           if ADOQuery1.RecordCount<>0 then
           dbc_pinming.Text:=ADOQuery1.FieldValues['pinming'] ;
         end;
       end;
         dbe_brand.setfocus;
   end;
end;

procedure TregYgMedForm.Button1Click(Sender: TObject);
var dataclass:dbhelper;
begin
    dataclass:=dbhelper.Create;
    dmym.rsRegYg['specnum']:=dataclass.generateNumber('hosno');
    dataclass.Free;
end;

end.
