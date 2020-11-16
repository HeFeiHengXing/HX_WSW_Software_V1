unit YgLiqFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls,db, RpCon, RpConDS,
  RpBase, RpSystem, RpDefine, RpRave, ADODB,inifiles,comobj;

type
  TYgLiqForm = class(TForm)
    lblSpecNum: TLabel;
    lblSecName: TLabel;
    lblRoom: TLabel;
    lblEnviron: TLabel;
    lblGlass: TLabel;
    lblStime: TLabel;
    lblSdoctor: TLabel;
    lblSDate: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    dbe_SpecNum: TDBEdit;
    dbe_cydate: TDBEdit;
    dbe_reportDate: TDBEdit;
    btnClose: TBitBtn;
    btnPrint: TBitBtn;
    dbcSection: TDBComboBox;
    dbcBG: TDBComboBox;
    dbe_hours: TDBEdit;
    dbe_gname: TDBEdit;
    dbe_totalNum: TDBEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox1: TCheckBox;
    btnSave: TBitBtn;
    btnExtract: TButton;
    dbc_samplingMan: TDBComboBox;
    dbe_ph: TDBEdit;
    dbe_brand: TDBEdit;
    dbc_type: TDBComboBox;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    rvLiq: TRvDataSetConnection;
    dbc_shys: TDBComboBox;
    Label4: TLabel;
    dbc_jcjg: TDBEdit;
    dbc_gjbz: TDBEdit;
    ZFX_YX: TADOQuery;
    CheckBox2: TCheckBox;
    RadioButton3: TRadioButton;
    ComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    dbc_pinming: TDBComboBox;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExtractClick(Sender: TObject);
    procedure dbe_SpecNumKeyPress(Sender: TObject; var Key: Char);
    procedure dbcSectionKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_roomKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_brandKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_typeKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_phKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_SpecNumClick(Sender: TObject);
    procedure dbc_typeChange(Sender: TObject);
    procedure dbc_shysKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_samplingManKeyPress(Sender: TObject; var Key: Char);
    procedure dbcBGKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox2Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure dbc_pinmingKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    id:integer;
  public
    { Public declarations }
    bBrowse:boolean;
    SQLText:STRING;
    bEdit:boolean;
    saved:boolean;
    procedure Print;
    procedure ExportWord;
  end;

var
  YgLiqForm: TYgLiqForm;

implementation

uses dbym, regYgfrm, ymDataType, common, regYgLiqFrm,loginfrm, YgQueryFrm,
  flash, sreport;

{$R *.dfm}

procedure TYgLiqForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if (dmym.rsHospital.state=dsInsert) or
      (dmym.rsHospital.State=dsedit) then
      dmym.rsHospital.cancel;
    action:=cafree;
    with dmym.query1 do // �����и��ݹ��ұ�׼���ж�����洢ʱ��������ı䡣���´���
                        //ֱ���øմ洢�����ݡ��������ݿ��ж������ݽ����ж���Ȼ��д�����ݿ��ж����
    begin
        close;
        sql.Clear;
        sql.Add('select * from hospital where cylb=''����Һ�뱣��Һ''');
        open;
        if recordcount>0 then
        begin
        last;
        //while not eof do
        begin
            edit;
            if fieldvalues['mem']='��ϸ������' then
            begin
                fieldvalues['YGBBJC']:='�ϸ�';
                post;
            end
            else
            begin
                if fieldvalues['sptype']='ʹ����������' then
                begin
                    if strtoint(fieldvalues['mem'])<=100 then
                        fieldvalues['YGBBJC']:='�ϸ�'
                    else
                        fieldvalues['YGBBJC']:='���ϸ�';
                end  else
                if fieldvalues['sptype']='Ƥ���Ĥ������' then
                begin
                    if strtoint(fieldvalues['mem'])<=10 then
                        fieldvalues['YGBBJC']:='�ϸ�'
                    else
                        fieldvalues['YGBBJC']:='���ϸ�';
                end  else
                if fieldvalues['sptype']='�޾���е����Һ' then
                begin
                    if strtoint(fieldvalues['mem'])<=0 then
                        fieldvalues['YGBBJC']:='�ϸ�'
                    else
                        fieldvalues['YGBBJC']:='���ϸ�';
                end else
                if fieldvalues['sptype']='���������Һ' then
                begin
                    if strtoint(fieldvalues['mem'])<=0 then
                        fieldvalues['YGBBJC']:='�ϸ�'
                    else
                        fieldvalues['YGBBJC']:='���ϸ�';
                end;
                post;
                next;
            end;
        end;
        end;
    end;
end;

procedure TYgLiqForm.FormCreate(Sender: TObject);
begin
   bBrowse:=false;
   bEdit:=false;
   saved:=false;
   rvproject1.ProjectFile:=rvfile;
end;

procedure TYgLiqForm.FormShow(Sender: TObject);
var
   strl:tstringlist;
   dh:dbhelper;
begin
  if bBrowse then
  begin
     dmym.rsHospital.Edit;
     btnExtract.Enabled:=false;
     if dmym.rsHospital['chk']='a' then
        radiobutton1.checked:=true;
     if dmym.rsHospital['chk']='b' then
     begin
        radiobutton2.checked:=true;
        if (dmym.rsHospital['germname']<>'') and not varisnull(dmym.rsHospital['germname']) then
          checkbox1.Checked:=true;
     end;
     if dmym.rsHospital['chk']='c' then
        radiobutton3.checked:=true;
     dbe_totalNum.text:=adanum ;
  end
  else
  begin
      if not dmym.rsHospital.Active then
        dmym.rshospital.Active:=true;
      dmym.rsHospital.Append;
      btnprint.Enabled:=false;

      strl:=tstringlist.Create;
      dh.getSection(strl);
      dbcSection.items:=strl;

      strl.Clear;
      dh.getRemark(strl);
      combobox1.Items:=strl;

      strl.Clear;
      dh.getCheckman(strl);
      dbcbg.items:=strl;
      dbc_samplingman.items:=strl;

      strl.clear;
      dh.getpinming(strl);
      dbc_pinming.Items:=strl ;
      //dbc_shys.Items:=strl;
      dbc_shys.Items.Add(userNamehfut);
      dbc_shys.Items.Add('');
      dbcBG.Enabled:=false;
      if timetype='now' then
      begin
      dmym.rshospital['reportdate']:=now;
      dmym.rsHospital['cyDate']:=now;
      end else
      begin
      dmym.rshospital['reportdate']:=date;
      dmym.rsHospital['cyDate']:=date;
      end;
      dmym.rshospital['reporter']:=userNamehfut;
      strl.Free;
      RadioButton1.Checked:=true;
  end;
end;

procedure TYgLiqForm.btnSaveClick(Sender: TObject);
var
   bInTable:boolean;
   stemp:string;
begin
   if not (dmym.rsHospital.State=dsEdit) then
   dmym.rsHospital.Edit;
   if dbe_SpecNum.Text='' then///�걾�Ų���Ϊ��
    begin
     MessageDlg('������걾��!',mtInformation,[mbOk],0);
     dbe_SpecNum.SetFocus;
     exit;
    end;
   if dbc_type.Text='' then
   begin
     showmessage('****��������Ʒ����****');
     dbc_type.SetFocus;
     exit;
   end;

//���ݹ��ұ�׼�жϽ��
   if RadioButton1.Checked then
   begin
      dmym.rsHospital['anum']:='';
      dmym.rsHospital['germname']:='';
      dmym.rsHospital['memo']:='';
      dbc_jcjg.text:='�ϸ�' ;
      dmym.rshospital['mem']:='��ϸ������';
   end;
   if radiobutton2.Checked  then
   begin
        dmym.rsHospital['hhour']:='';
        dmym.rsHospital['memo']:='';
        if dbc_type.Text='ʹ����������' then
        begin
          if strtoint(dbe_totalNum.Text)<=100 then
            dbc_jcjg.Text:='�ϸ�'
          else
            dbc_jcjg.Text:='���ϸ�';
        end ;
        if dbc_type.Text='�޾���е����Һ' then
        begin
          if strtoint(dbe_totalNum.Text)<=0 then
              dbc_jcjg.Text:='�ϸ�'
          else
              dbc_jcjg.Text:='���ϸ�';
        end;
        if dbc_type.Text='Ƥ���Ĥ������' then
        begin
          if strtoint(dbe_totalNum.Text)<=10 then
              dbc_jcjg.Text:='�ϸ�'
          else
              dbc_jcjg.Text:='���ϸ�';
        end;
        if dbc_type.Text='���������Һ' then
        begin
          if strtoint(dbe_totalNum.Text)<=0 then
              dbc_jcjg.Text:='�ϸ�'
          else
              dbc_jcjg.Text:='���ϸ�';
        end;
   dmym.rshospital['mem']:=dbe_totalnum.Text;
   end;
   if radiobutton3.Checked then
    begin
       dmym.rsHospital['hhour']:='';
       dmym.rsHospital['germname']:='';
       dmym.rsHospital['anum']:='';
       stemp:=dbhelper.Create.extractnum(combobox1.Text);
       if stemp='' then
       begin
       dmym.rsHospital['mem']:='��ϸ������';
       dbc_jcjg.Text:='�ϸ�';
       end else
       begin
        dmym.rsHospital['mem']:=stemp;
        if dbc_type.Text='ʹ����������' then
        begin
          if strtoint(stemp)<=100 then
            dbc_jcjg.Text:='�ϸ�'
          else
            dbc_jcjg.Text:='���ϸ�';
        end ;
        if dbc_type.Text='Ƥ���Ĥ������' then
        begin
          if strtoint(stemp)<=10 then
            dbc_jcjg.Text:='�ϸ�'
          else
            dbc_jcjg.Text:='���ϸ�';
        end ;
        if dbc_type.Text='�޾���е����Һ' then
        begin
          if strtoint(stemp)<=0 then
              dbc_jcjg.Text:='�ϸ�'
          else
              dbc_jcjg.Text:='���ϸ�';
        end;
        if dbc_type.Text='���������Һ' then
        begin
          if strtoint(dbe_totalNum.Text)<=0 then
              dbc_jcjg.Text:='�ϸ�'
          else
              dbc_jcjg.Text:='���ϸ�';
        end;
       end;
    end;
   //�жϽ���

   bInTable:=false;
   dmym.conn.BeginTrans;
   //ɾ��reghospital��ĸ�����¼
  try
  begin
   with dmym.rsRegYg do
   begin
      active:=true;
      bIntable:=locate('id',id,[loCaseInsensitive]);
      if bintable then
         delete;
      active:=false;
   end;
   if RadioButton3.Checked then
      dmym.rsHospital['chk']:='c';
   if RadioButton2.Checked then
      dmym.rsHospital['chk']:='b';
   if RadioButton1.Checked then
      dmym.rsHospital['chk']:='a';
   dmym.rsHospital['cylb']:='����Һ�뱣��Һ';
   dmym.rsHospital.Post;
   dmym.conn.commitTrans;
   MessageDlg('��¼����ɹ�!',mtInformation,[mbOk],0);
  end;
  except
   dmym.conn.rollbacktrans;
  end;
  btnprint.Enabled:=true;
  btnsave.Enabled:=false;
  saved:=true;
end;

procedure TYgLiqForm.btnCloseClick(Sender: TObject);
begin
    if saved=true then
    close
    else
    if messagebox(handle,'�����δ���棬�Ƿ��˳���','��ʾ',mb_yesno)=idyes then
    close;
end;

procedure TYgLiqForm.btnExtractClick(Sender: TObject);
var
   rfrm:tregYgLiqForm;
begin
   rfrm:= TRegYgLiqForm.create(self);
   rfrm.bExtract:=true;
   //rfrm.ygtype:=5;
   rfrm.showmodal;
   if rfrm.extracted then
   begin
      id:=rfrm.id;
      with dmym.exquery do
         begin
            dbe_specNum.Text:=fieldbyname('specNum').asstring;
            dmym.rsHospital['secname']:=fieldbyname('secname').asstring;
            dmym.rsHospital['room']:=fieldbyname('room').asstring;
            dmym.rsHospital['brand']:=fieldbyname('brand').asstring;
            dmym.rsHospital['spph']:=fieldbyname('spph').asstring;
            dmym.rsHospital['sptype']:=fieldbyname('sptype').asstring;
            dmym.rsHospital['CYlb']:=fieldbyname('CYlb').asstring;
            dmym.rsHospital['cyys']:=fieldbyname('cyys').asstring;
            dmym.rsHospital['cydate']:=fieldbyname('cydate').asstring;

            if fieldbyname('sptype').asstring='ʹ����������' then
                dbc_gjbz.Text:='��100cfu/ml';
            if fieldbyname('sptype').asstring='Ƥ���Ĥ������' then
                dbc_gjbz.Text:='��10cfu/ml';
            if fieldbyname('sptype').asstring='�޾���е����Һ' then
                dbc_gjbz.Text:='�޾�����';
            if fieldbyname('sptype').asstring='���������Һ' then
                dbc_gjbz.Text:='�޾�����';
            end;
   end;
end;

procedure TYgLiqForm.Print;
var
  resultstr,cylb:string;
begin
     resultstr:='';
     rvproject1.Open;
   
     if RadioButton3.Checked then
        if ComboBox1.Text<>'' then
        resultstr:=ComboBox1.Text
        else
        resultstr:='';
     if radiobutton1.Checked then
        resultstr:='������'+dbe_hours.Text+'Сʱ�󣬷�����ϸ������';
     if radiobutton2.Checked then
        begin
        resultstr:='Ⱦ������'+dbe_totalNum.Text+'CFU/ml';
        if checkbox1.Checked then
        begin
          resultstr:=resultstr+''#13#10;
          resultstr:=resultstr+'ϸ����:'+dbe_gname.Text;
        end;
        end;
   cylb:='����Һ�뱣��Һ';
   rvproject1.SetParam('specnum',dbe_specnum.text);
   rvproject1.SetParam('cylb',cylb);
   rvproject1.SetParam('resultstr',resultstr);
   rvproject1.SetParam('titlestr',hospitalname+'��������ѧ��ⱨ�浥');
   //rvproject1.SetParam('remark',ComboBox1.Text);
   rvproject1.ExecuteReport('report7');
   rvproject1.Close;
end;

procedure TYgLiqForm.dbe_SpecNumKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   dbcSection.SetFocus;
end;

procedure TYgLiqForm.dbcSectionKeyPress(Sender: TObject; var Key: Char);
  var secid,SQLText:string;
  rnum:integer;
begin
  if key=#13 then
  begin
   SQLText:='';
   if dbcSection.Text='' then
      begin
      showmessage('**��ѡ�������Ʊ�**');
      exit;
      end;
   if dbcSection.Text<>'' then
      begin
         SQLText:='select * from secname';
         secid:=dbcSection.Text;
         with ZFX_YX do
         begin
           close;
           sql.clear;
           sql.add(SQLText);
           sql.add('where secid=:secid');
           parameters.parambyname('secid').value:=secid;
           open;
           rnum:=ZFX_YX.RecordCount;
           if rnum>0 then
           dbcSection.Text:=ZFX_YX.FieldValues['secname'] ;
         end;
       end;
         dbc_pinming.setfocus;
   end;
end;

procedure TYgLiqForm.dbe_roomKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   dbe_brand.SetFocus;
end;

procedure TYgLiqForm.dbe_brandKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    dbe_ph.SetFocus;
end;

procedure TYgLiqForm.dbc_typeKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
       if dbc_type.text='' then
       showmessage('��ѡ����Ʒ���ͣ�');
       if dbc_type.text<>'' then
       begin
           if (dbc_type.text='1') or (dbc_type.text='01') then
              dbc_type.text:='ʹ����������';
           if (dbc_type.text='2') or (dbc_type.text='02') then
              dbc_type.text:='�޾���е����Һ';
           if (dbc_type.text='3') or (dbc_type.text='03') then
              dbc_type.text:='���������Һ';
           if (dbc_type.text='4') or (dbc_type.text='04') then
              dbc_type.text:='Ƥ���Ĥ������';

        end;
   dbc_samplingMan.SetFocus;
   end;
end;

procedure TYgLiqForm.dbe_phKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    dbc_type.SetFocus;
end;

procedure TYgLiqForm.dbe_SpecNumClick(Sender: TObject);
var zDbHelper:dbhelper;
begin
 dmym.rshospital.Active:=true;/////////////////////////////////////////////////////
 dmym.rshospital.Edit;/////////////////////////////////////////////////////////////
 zDbHelper:=DbHelper.Create;///////////////////////////////////////////////////
 //zDbHelper.getYGbbh;////////////////////////////////////////////////////////
 //dbe_SpecNum.Text:=inttostr(zDbHelper.YGMaxbbh1);
end;

procedure TYgLiqForm.dbc_typeChange(Sender: TObject);
begin
   if dbc_type.Text='ʹ����������' then
      dbc_gjbz.Text:='��100cfu/ml';
   if dbc_type.Text='Ƥ���Ĥ������' then
      dbc_gjbz.Text:='��10cfu/ml';
   if dbc_type.Text='�޾���е����Һ' then
      dbc_gjbz.Text:='�޾�����';
   if dbc_type.text='���������Һ' then
      dbc_gjbz.Text:='�޾�����'

end;

procedure TYgLiqForm.dbc_shysKeyPress(Sender: TObject; var Key: Char);
var ID:string;
    SQLText:STRING;
begin
if key=#13 then
  begin
   SQLText:='';
   if dbc_shys.Text='' then
      showmessage('**��ѡ�񱨸���Ա**');
   if dbc_shys.Text<>'' then
      begin
         SQLText:='select * from checkman';
         ID:=dbc_shys.Text;
         with ZFX_YX do
         begin
         close;
         sql.clear;
         sql.add(SQLText);
         sql.add('where ID=:ID');
         parameters.parambyname('ID').value:=ID;
         open;
         if ZFX_YX.RecordCount>0 then
         dbc_shys.Text:=ZFX_YX.FieldValues['name'];
         end;
       end;
       dbc_samplingMan.SetFocus;
   end;

end;

procedure TYgLiqForm.dbc_samplingManKeyPress(Sender: TObject;
  var Key: Char);
  var ID:string;
begin
  if key=#13 then
  begin
   SQLText:='';
   if dbc_samplingMan.Text='' then
      begin
      showmessage('**��ѡ�������Ա**');
      exit;
      end;
   if dbc_samplingMan.Text<>'' then
      begin
         SQLText:='select * from checkman';
         ID:=dbc_samplingMan.Text;
         with ZFX_YX do
         begin
         close;
         sql.clear;
         sql.add(SQLText);
         sql.add('where ID=:ID');
         parameters.parambyname('ID').value:=ID;
         open;
         if ZFX_YX.RecordCount>0 then
         dbc_samplingMan.Text:=ZFX_YX.FieldValues['name'];
         end;
       end;
   dbe_cydate.SetFocus;
   end;
end;

procedure TYgLiqForm.dbcBGKeyPress(Sender: TObject; var Key: Char);
 var ID:string;
begin
  if key=#13 then
  begin
   SQLText:='';
   if dbcBG.Text='' then
      showmessage('**��ѡ�񱨸���Ա**');
   if dbcBG.Text<>'' then
      begin
         SQLText:='select * from checkman';
         ID:=dbcBG.Text;
         with ZFX_YX do
         begin
         close;
         sql.clear;
         sql.add(SQLText);
         sql.add('where ID=:ID');
         parameters.parambyname('ID').value:=ID;
         open;
         if ZFX_YX.RecordCount>0 then
        dbcBG.Text:=ZFX_YX.FieldValues['name'];
         end;
       end;
     end;
end;

procedure TYgLiqForm.CheckBox2Click(Sender: TObject);
begin
   ComboBox1.Enabled:=checkbox2.Checked;
end;

procedure TYgLiqForm.ComboBox1KeyPress(Sender: TObject; var Key: Char);
  var id:string;
begin
  if key=#13 then
  begin
   SQLText:='';
   if combobox1.Text='' then
      begin
      showmessage('**��ѡ���ͼ챸ע**');
      exit;
      end;
   if combobox1.Text<>'' then
      begin
         SQLText:='select * from yyremark';
         id:=combobox1.Text;
         with ZFX_YX do
         begin
         close;
         sql.clear;
         sql.add(SQLText);
         sql.add('where id=:id');
         parameters.parambyname('id').value:=id;
         open;
         if ZFX_YX.RecordCount>0 then
         combobox1.Text:=ZFX_YX.FieldValues['remark'];
         end;
      end;
     end;
end;

procedure TYgLiqForm.dbc_pinmingKeyPress(Sender: TObject; var Key: Char);
var SQLtext,secid:string;
    rnum:integer;
begin
    IF KEY=#13 THEN
    begin
       SQLText:='';
    if dbc_pinming.Text<>'' then
      begin
         SQLText:='select * from pinming';
         secid:=dbc_pinming.Text;
         with ZFX_YX do
         begin
           close;
           sql.clear;
           sql.add(SQLText);
           sql.add('where id=:secid');
           parameters.parambyname('secid').value:=secid;
           open;
           rnum:=ZFX_YX.RecordCount;
           if rnum>0 then
           dbc_pinming.Text:=ZFX_YX.FieldValues['pinming'] ;
         end;
      end;
    dbe_brand.SetFocus;
    end;
end;

procedure TYgLiqForm.CheckBox1KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if not CheckBox1.Checked then
            CheckBox1.Checked:=true
        else
            CheckBox1.Checked:=false;
    end;
end;

procedure TYgLiqForm.Button1Click(Sender: TObject);
var dataclass:dbhelper;
begin
    dataclass:=dbhelper.Create;
    dmym.rsHospital['specNum']:=dataclass.generateNumber('hosno');
    dataclass.Free;
end;

procedure TYgLiqForm.ExportWord;
var wordapp,worddoc,wordtab,myrange,Template:variant;
    myini:Tinifile;
    h:hwnd;
    resultstr:string;
begin
    Try
        wordapp:=createoleobject('word.application');
        wordapp.visible:=false;
    Except
        messagebox(0,'δ��װ WordӦ�ó���,���Ȱ�װMicrosoftOffice,Ȼ���������!',
                    '����δ�ҵ�',mb_Ok+MB_ICONWARNING+MB_APPLMODAL);
        Abort;
    End;

    application.CreateForm(Tflashform,flashform);
    flashform.Show;
    flashform.Panel1.Caption:='���ڵ�����Word,���Ժ�...';
    flashform.Refresh;

    //�趨�ĵ�ģʽ,(*�ر�ƴ�����ң��﷨���ң��������Ч��*)
    Wordapp.Options.CheckSpellingAsYouType := False;
    Wordapp.Options.CheckGrammarAsYouType := False;
    Template:=ExtractFiledir(Application.Exename)+'/doc/Ժ�б��浥.dot';
    worddoc:=wordapp.Documents.Add(template);
    wordtab:=worddoc.tables.item(1);

    try
    wordtab.cell(1,1).range.insertafter(hospitalName+'��������ѧ��ⱨ�浥');
    wordtab.cell(2,1).range.insertafter('�걾�ţ�'+dbe_specnum.text);
    wordtab.cell(2,2).range.insertafter('���ң�'+dbcsection.text);
    wordtab.cell(2,3).range.insertafter('Ʒ����'+dbc_pinming.Text);
    wordtab.cell(3,1).range.insertafter('�������'+'����Һ�뱣��Һ');
    wordtab.cell(3,2).range.insertafter('�̱꣺'+dbe_brand.Text);
    wordtab.cell(3,3).range.insertafter('���ţ�'+dbe_ph.text);
    wordtab.cell(4,1).range.insertafter('��Ʒ���ͣ�'+dbc_type.text);
    wordtab.cell(4,2).range.insertafter('�����ߣ�'+dbc_samplingMan.text);
    wordtab.cell(4,3).range.insertafter('�������ڣ�'+dbe_cydate.text);
    wordtab.rows.item(5).delete;
    resultstr:='';
    if  radiobutton1.Checked then
    if  dbe_hours.Text=''then
      resultstr:=''
    else
      resultstr:='������'+dbe_hours.Text+'Сʱ�󣬷�����ϸ������';
    if   radiobutton2.Checked then
    begin
      resultstr:='Ⱦ������'+dbe_totalNum.Text+'CFU/ml';
      if checkbox1.Checked then
      begin
        resultstr:=resultstr+''#13#10;
        resultstr:=resultstr+'ϸ����:'+dbe_gname.Text;
      end;
    end;
    if RadioButton3.Checked then
    if ComboBox1.Text<>'' then
        resultstr:=ComboBox1.Text
    else  resultstr:='';
    wordtab.cell(5,1).range.insertafter(resultstr);
    //��������ߣ��ͼ���
    wordtab.cell(6,1).range.insertafter(dbcbg.Text);
    wordtab.cell(6,2).range.insertafter(dbc_shys.Text);
    wordtab.cell(6,3).range.insertafter(dbe_reportdate.Text);
    //����ҳ��
    myini:=Tinifile.Create(Extractfiledir(Application.ExeName)+'\dw.ini');
    wordtab.cell(7,1).range.insertafter(myini.ReadString('DepartMent','Information',''));
    myini.Free;
    except
      messagedlg('�����������',mtWarning,[mbok],0);
    end;
    flashform.Hide;
    flashform.Free;

    wordapp.visible:=true;
    setwindowpos(findwindow('NetUIHWND',nil),HWND_TOPMOST,0,0,0,0,SWP_SHOWWINDOW);
end;

procedure TYgLiqForm.btnPrintClick(Sender: TObject);
var reporttype:integer;
begin
    application.createform(Tsreportform,sreportform);
    if sreportform.ShowModal=mrok then
    begin
        reporttype:=sreportform.reporttype;
        case reporttype of
        1:begin
            Rvsystem1.SystemSetups:=Rvsystem1.SystemSetups-[ssAllowSetup];
            Rvsystem1.DefaultDest:=rdPrinter;
            print;
          end;
        2:begin
            Rvsystem1.SystemSetups:=Rvsystem1.SystemSetups-[ssAllowSetup];
            Rvsystem1.DefaultDest:=rdPreview;
            print;
          end;
        3:ExportWord;
        end;
    end;
    sreportform.Free;
    Sendmessage(findwindow('TYgLiqForm',nil),WM_SYSCOMMAND,SC_CLOSE,0);
end;
end.
