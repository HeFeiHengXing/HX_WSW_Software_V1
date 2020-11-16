unit YgSurfaceFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls,db, RpBase, RpSystem,
  RpCon, RpConDS, RpDefine, RpRave, ADODB,inifiles,comobj,math;

type
  TYgSurfaceForm = class(TForm)
    lblSpecNum: TLabel;
    lblSecName: TLabel;
    lblRoom: TLabel;
    lblEnviron: TLabel;
    lblGlass: TLabel;
    lblStime: TLabel;
    lblGermNum: TLabel;
    lblSdoctor: TLabel;
    lblSDate: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    lbl_cm: TLabel;
    lbl_cfu: TLabel;
    dbe_SpecNum: TDBEdit;
    dbe_room: TDBEdit;
    dbe_gnum: TDBEdit;

    dbe_cydate: TDBEdit;
    dbe_reportDate: TDBEdit;
    btnClose: TBitBtn;
    btnPrint: TBitBtn;
    dbc_environ: TDBComboBox;
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
    dbe_rate: TDBEdit;
    dbe_area: TDBEdit;
    RvProject1: TRvProject;
    rvSurface: TRvDataSetConnection;
    RvSystem1: TRvSystem;
    dbc_gjbz: TDBEdit;
    dbc_jcjg: TDBEdit;
    Label4: TLabel;
    dbc_shys: TDBComboBox;
    CheckBox2: TCheckBox;
    ZFX_YX: TADOQuery;
    RadioButton3: TRadioButton;
    ComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnExtractClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure dbe_gnumChange(Sender: TObject);
    procedure dbe_rateChange(Sender: TObject);
    procedure dbe_areaChange(Sender: TObject);
    procedure dbcSectionKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_roomKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_environKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_areaKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_rateKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_gnumKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_environChange(Sender: TObject);
    procedure dbe_SpecNumKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_SpecNumClick(Sender: TObject);
    procedure dbc_samplingManKeyPress(Sender: TObject; var Key: Char);
    procedure dbcBGKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_shysKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox2Click(Sender: TObject);
    procedure combobox1KeyPress(Sender: TObject; var Key: Char);
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
  YgSurfaceForm: TYgSurfaceForm;

implementation

uses dbym, regYgfrm, ymDataType, common, regYgSurfaceFrm,loginfrm,
  YgQueryFrm, sreport, flash;

{$R *.dfm}

procedure TYgSurfaceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if (dmym.rsHospital.state=dsInsert) or
      (dmym.rsHospital.State=dsedit) then
      dmym.rsHospital.cancel;
    action:=cafree;
    with dmym.query1 do // 程序中根据国家标准的判定结果存储时发生意外改变。以下代码
                        //直接用刚存储的数据。。从数据库中读出数据进行判定。然后写入数据库判定结果
    begin
        close;
        sql.Clear;
        sql.Add('select * from hospital where cylb=''物体表面''');
        open;
        if recordcount>0 then
        begin
        last;
        //while not eof do
        begin
            edit;
            if fieldvalues['mem']='无细菌生长' then
            begin
                fieldvalues['YGBBJC']:='合格';
                post;
            end
            else
            begin
                if fieldvalues['hjlb']='I' then
                begin
                    if strtofloat(fieldvalues['mem'])<=5 then
                        fieldvalues['YGBBJC']:='合格'
                    else
                        fieldvalues['YGBBJC']:='不合格';
                end  else
                if fieldvalues['hjlb']='II' then
                begin
                    if strtofloat(fieldvalues['mem'])<=5 then
                        fieldvalues['YGBBJC']:='合格'
                    else
                        fieldvalues['YGBBJC']:='不合格';
                end else
                if fieldvalues['hjlb']='III' then
                begin
                    if strtofloat(fieldvalues['mem'])<=10 then
                        fieldvalues['YGBBJC']:='合格'
                    else
                        fieldvalues['YGBBJC']:='不合格';
                end else
                if fieldvalues['hjlb']='IV' then
                begin
                    if strtofloat(fieldvalues['mem'])<=15 then
                        fieldvalues['YGBBJC']:='合格'
                    else
                        fieldvalues['YGBBJC']:='不合格';
                end;
                post;
                next;
            end;
        end;
        end;
    end;
end;

procedure TYgSurfaceForm.FormShow(Sender: TObject);
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
     dbe_totalNum.text:=adanum;
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
     // dbc_shys.Items:=strl;
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
  end;
end;


procedure TYgSurfaceForm.btnExtractClick(Sender: TObject);
var
   rfrm:tregYgSurfaceForm;
begin
   rfrm:= TRegYgSurfaceForm.create(self);
   rfrm.bExtract:=true;
   //rfrm.ygtype:=2;
   rfrm.showmodal;
   if rfrm.extracted then
   begin
      id:=rfrm.id;
      with dmym.exquery do
         begin
            dbe_specNum.Text:=fieldbyname('specNum').asstring;
            dmym.rsHospital['secname']:=fieldbyname('secname').asstring;
            dmym.rsHospital['room']:=fieldbyname('room').asstring;
            dmym.rsHospital['hjlb']:=fieldbyname('hjlb').asstring;
            dmym.rsHospital['area']:=fieldbyname('area').asstring;
            dmym.rsHospital['bs']:=fieldbyname('bs').asstring;
            //dmym.rsHospital['germnum']:=fieldbyname('germnum').asstring;
            dmym.rsHospital['cyys']:=fieldbyname('cyys').asstring;
            dmym.rsHospital['cydate']:=fieldbyname('cydate').asstring;
            if fieldbyname('hjlb').asstring='I' then
                dbc_gjbz.Text:='≤5cfu/cm^2';
            if fieldbyname('hjlb').asstring='II' then
                dbc_gjbz.Text:='≤5cfu/cm^2';
            if fieldbyname('hjlb').asstring='III' then
                dbc_gjbz.Text:='≤10cfu/cm^2';
            if fieldbyname('hjlb').asstring='IV' then
                dbc_gjbz.Text:='≤10cfu/cm^2';
            if fieldbyname('hjlb').asstring='' then
                dbc_gjbz.Text:='    ';
         end;
   end;
end;

procedure TYgSurfaceForm.btnSaveClick(Sender: TObject);
var
   bInTable:boolean;
   stemp:string;
begin
   if not (dmym.rsHospital.State=dsEdit) then
   dmym.rsHospital.Edit;
  if dbe_SpecNum.Text='' then
  begin
   MessageDlg('请输入标本号!',mtInformation,[mbOk],0);
   dbe_SpecNum.SetFocus;
   exit;
  end;
  if dbc_environ.Text='' then
  begin
     showmessage('****请输入环境类别****');
     dbc_environ.SetFocus;
     exit;
  end;
    //根据国家标准判断结果
   if RadioButton1.Checked then
     begin
      dmym.rsHospital['anum']:='';
      dmym.rsHospital['germname']:='';
      dmym.rsHospital['memo']:='';
      dbc_jcjg.Text:='合格';
      dmym.rsHospital['mem']:='无细菌生长';
     end;
   if radiobutton2.Checked  then
     begin
     dmym.rsHospital['hhour']:='';
     dmym.rsHospital['memo']:='';
      if dbc_environ.text='I' then
        begin
          if  strtofloat(trim(dbe_totalNum.Text))<=5 then
              dbc_jcjg.Text:='合格'
          else
              dbc_jcjg.Text:='不合格';
        end;
      if dbc_environ.text='II' then
        begin
          if strtofloat(trim(dbe_totalNum.Text))<=5 then
              dbc_jcjg.Text:='合格'
          else
              dbc_jcjg.Text:='不合格';
        end;
      if dbc_environ.text='III' then
        begin
          if strtofloat(trim(dbe_totalNum.Text))<=10 then
              dbc_jcjg.Text:='合格'
          else
              dbc_jcjg.Text:='不合格';
        end;
      if dbc_environ.text='IV' then
        begin
          if strtofloat(trim(dbe_totalNum.Text))<=10 then
          dbc_jcjg.Text:='合格'
          else
          dbc_jcjg.Text:='不合格';
        end;
       dmym.rsHospital['mem']:=dbe_totalnum.text;
      end;
    if radiobutton3.Checked then
    begin
       dmym.rsHospital['hhour']:='';
       dmym.rsHospital['germname']:='';
       dmym.rsHospital['anum']:='';
       stemp:=dbhelper.Create.extractnum(combobox1.Text);
       if stemp='' then
       begin
       dmym.rsHospital['mem']:='无细菌生长';
       dbc_jcjg.Text:='合格';
       end else
       begin
       dmym.rsHospital['mem']:=stemp;
       if dbc_environ.text='I' then
          begin
          if  strtofloat(stemp)<=5 then
              dbc_jcjg.Text:='合格'
          else
              dbc_jcjg.Text:='不合格';
          end;
       if dbc_environ.text='II' then
          begin
          if strtofloat(stemp)<=5 then
              dbc_jcjg.Text:='合格'
          else
              dbc_jcjg.Text:='不合格';
          end;
       if dbc_environ.text='III' then
          begin
          if strtofloat(stemp)<=10 then
              dbc_jcjg.Text:='合格'
          else
              dbc_jcjg.Text:='不合格';
          end;
       if dbc_environ.text='IV' then
          begin
          if strtofloat(stemp)<=15 then
          dbc_jcjg.Text:='合格'
          else
          dbc_jcjg.Text:='不合格';
          end;
       end;
    end;
    //判断结束
  bInTable:=false;
  dmym.conn.BeginTrans;
   //删除reghospital里的该条记录
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
   dmym.rsHospital['cylb']:='物体表面';
   dmym.rsHospital.Edit;///////////////////////////////////////
   dmym.rsHospital.Post;
   dmym.conn.commitTrans;
   MessageDlg('记录保存成功!',mtInformation,[mbOk],0);
  end;
  except
   dmym.conn.rollbacktrans;
  end;
  btnprint.enabled:=true;
  btnsave.Enabled:=false;
  saved:=true;
  // dmym.rsHospital.edit;
end;

procedure TYgSurfaceForm.btnCloseClick(Sender: TObject);
begin
    if saved=true then
    close
    else
    if messagebox(handle,'结果尚未保存，是否退出？','提示',mb_yesno)=idyes then
    close;
end;

procedure TYgSurfaceForm.FormCreate(Sender: TObject);
begin
   bBrowse:=false;
   bEdit:=false;
   saved:=false;
   rvproject1.ProjectFile:=rvfile;
end;

procedure TYgSurfaceForm.RadioButton2Click(Sender: TObject);
begin
    if dbc_environ.Text='' then
     begin
     showmessage('****请输入环境类别****');
     dbc_environ.SetFocus;
     exit;
     end;
end;

procedure TYgSurfaceForm.Print;
var
  resultstr,cylb:string;
begin
    resultstr:='';
    rvproject1.Open;
    if RadioButton3.Checked then
       if ComboBox1.Text<>'' then
       resultstr:=ComboBox1.Text
       else resultstr:='';
    if radiobutton1.Checked then
       if dbe_hours.Text='' then
          resultstr:=''
       else
       resultstr:='经培养'+dbe_hours.Text+'小时后，分析无细菌生长';
    if radiobutton2.Checked then
      begin
         resultstr:='菌落总数：'+dbe_totalNum.Text+'CFU/cm^2';
          if checkbox1.Checked then
          begin
            resultstr:=resultstr+''#13#10;
            resultstr:=resultstr+'细菌名:'+dbe_gname.Text;
          end;
      end;
   {if CheckBox2.Checked then
     begin
        resultstr:=resultstr+''#13#10;
        resultstr:=resultstr+ComboBox1.Text;
     end;//有关备注打印
     }
   cylb:='物体表面';//采样类别
   rvproject1.SetParam('specnum',dbe_specnum.text);
   rvproject1.SetParam('cylb',cylb);
   rvproject1.SetParam('resultstr',resultstr);
   rvproject1.SetParam('titlestr',hospitalname+'环境卫生学监测报告单');
   //rvproject1.SetParam('remark',ComboBox1.Text);
   rvproject1.ExecuteReport('report4');
   rvproject1.Close;
end;

procedure TYgSurfaceForm.dbe_gnumChange(Sender: TObject);
var
  area,pmjls,rate:integer;
  f:double;
begin
     if dbe_area.Text='' then
     area:=0
     else
     area:=strtoint(dbe_area.Text) ;
     if dbe_rate.Text='' then
     rate:=0
     else
     rate:=strtoint(dbe_rate.Text);
     if dbe_gnum.Text='' then
     pmjls:=0
     else
     pmjls:=strtoint(dbe_gnum.Text);
     if (area<>0) and (rate<>0) and (pmjls<>0) then
     begin
     f:=roundto(pmjls*rate/area,-1);
     dbe_totalNum.text :=floattostr(f);
     RadioButton2.Checked:=true;
     end else
     dbe_totalNum.text :='0.0';
end;

procedure TYgSurfaceForm.dbe_rateChange(Sender: TObject);
var
  area,pmjls,rate:integer;
  f:double;
begin
     if dbe_area.Text='' then
     area:=0
     else
     area:=strtoint(dbe_area.Text) ;
     if dbe_rate.Text='' then
     rate:=0
     else
     rate:=strtoint(dbe_rate.Text);
     if dbe_gnum.Text='' then
     pmjls:=0
     else
     pmjls:=strtoint(dbe_gnum.Text);
     if (area<>0) and (rate<>0) and (pmjls<>0)  then
     begin
     f:=trunc(pmjls*rate/area);
     dbe_totalNum.text :=floattostr(f);
     RadioButton2.Checked:=true;
     end;
end;

procedure TYgSurfaceForm.dbe_areaChange(Sender: TObject);
var
  area,pmjls,rate:integer;
  f:double;
begin
     if dbe_area.Text='' then
     area:=0
     else
     area:=strtoint(dbe_area.Text) ;
     if dbe_rate.Text='' then
     rate:=0
     else
     rate:=strtoint(dbe_rate.Text);
     if dbe_gnum.Text='' then
     pmjls:=0
     else
     pmjls:=strtoint(dbe_gnum.Text);
     if (area<>0) and (rate<>0) and (pmjls<>0)  then
     begin
     f:=trunc(pmjls*rate/area);
     dbe_totalNum.text :=floattostr(f);
     RadioButton2.Checked:=true;
     end;
end;

procedure TYgSurfaceForm.dbcSectionKeyPress(Sender: TObject; var Key: Char);
  var secid,SQLText:string;
  rnum:integer;
begin
  if key=#13 then
  begin
   SQLText:='';
   {if dbcSection.Text='' then
      begin
      showmessage('**请选择或输入科别**');
      exit;
      end;}
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
         dbe_room.setfocus;
   end;
end;

procedure TYgSurfaceForm.dbe_roomKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   dbc_environ.SetFocus;
end;

procedure TYgSurfaceForm.dbc_environKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key=#13 then
   begin
     if dbc_environ.Text='' then
        begin
        showmessage('****请选择环境类别****');
        exit;
        end;
     if dbc_environ.text<>'' then
        begin
           if (dbc_environ.text='1') or (dbc_environ.text='01') then
              dbc_environ.text:='I';
           if (dbc_environ.text='2') or (dbc_environ.text='02') then
              dbc_environ.text:='II';
           if (dbc_environ.text='3') or (dbc_environ.text='03') then
              dbc_environ.text:='III';
           if (dbc_environ.text='4') or (dbc_environ.text='04') then
              dbc_environ.text:='IV';
        end;
      dbe_area.SetFocus;
    end;
end;

procedure TYgSurfaceForm.dbe_areaKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   dbe_rate.SetFocus;
end;

procedure TYgSurfaceForm.dbe_rateKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  dbe_gnum.SetFocus;
end;
procedure TYgSurfaceForm.dbe_gnumKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  dbc_samplingMan.SetFocus;
end;

procedure TYgSurfaceForm.dbc_environChange(Sender: TObject);
begin
   if dbc_environ.Text='I' then
      dbc_gjbz.Text:='≤5cfu/cm^2';
   if dbc_environ.Text='II' then
      dbc_gjbz.Text:='≤5cfu/cm^2';
   if dbc_environ.Text='III' then
      dbc_gjbz.Text:='≤10cfu/cm^2';
   if dbc_environ.Text='IV' then
      dbc_gjbz.Text:='≤10cfu/cm^2';
   if dbc_environ.Text='' then
      dbc_gjbz.Text:='    ';
end;

procedure TYgSurfaceForm.dbe_SpecNumKeyPress(Sender: TObject;
  var Key: Char);
begin
  IF KEY=#13 THEN
  dbcSection.SetFocus;
end;

procedure TYgSurfaceForm.dbe_SpecNumClick(Sender: TObject);
var zDbHelper:dbhelper;
begin
 dmym.rshospital.Active:=true;/////////////////////////////////////////////////////
 dmym.rshospital.Edit;/////////////////////////////////////////////////////////////
 zDbHelper:=DbHelper.Create;///////////////////////////////////////////////////
 //zDbHelper.getYGbbh;////////////////////////////////////////////////////////
 //dbe_SpecNum.Text:=inttostr(zDbHelper.YGMaxbbh1);
end;

procedure TYgSurfaceForm.dbc_samplingManKeyPress(Sender: TObject;
  var Key: Char);
  var ID:string;
begin
  if key=#13 then
  begin
   SQLText:='';
  { if dbc_samplingMan.Text='' then
      begin
      showmessage('**请选择采样人员**');
      exit;
      end;}
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

procedure TYgSurfaceForm.dbcBGKeyPress(Sender: TObject; var Key: Char);
 var ID:string;
begin
  if key=#13 then
  begin
   SQLText:='';
   if dbcBG.Text='' then
      showmessage('**请选择报告人员**');
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
       dbc_shys.SetFocus;
   end;
end;

procedure TYgSurfaceForm.dbc_shysKeyPress(Sender: TObject; var Key: Char);
var ID:string;
begin
if key=#13 then
  begin
   SQLText:='';
   {if dbc_shys.Text='' then
      showmessage('**请选择报告人员**');}
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
   //dbe_reportDate.SetFocus;
   end;

end;

procedure TYgSurfaceForm.CheckBox2Click(Sender: TObject);
begin
     ComboBox1.Enabled:=checkbox2.Checked;
end;

procedure TYgSurfaceForm.combobox1KeyPress(Sender: TObject; var Key: Char);
  var id:string;
begin
  if key=#13 then
  begin
   SQLText:='';
   if combobox1.Text='' then
      begin
      showmessage('**请选择送检备注**');
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
      //dbe_lczd.SetFocus;
   end;
end;

procedure TYgSurfaceForm.CheckBox1KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if not CheckBox1.Checked then
            CheckBox1.Checked:=true
        else
            CheckBox1.Checked:=false;
    end;
end;

procedure TYgSurfaceForm.Button1Click(Sender: TObject);
var dataclass:dbhelper;
begin
    dataclass:=dbhelper.Create;
    dmym.rsHospital['specNum']:=dataclass.generateNumber('hosno');
    dataclass.Free;
end;
procedure TYgSurfaceForm.btnPrintClick(Sender: TObject);
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
    Sendmessage(findwindow('TYgSurfaceForm',nil),WM_SYSCOMMAND,SC_CLOSE,0);
end;

procedure TYgSurfaceForm.ExportWord;
var wordapp,worddoc,wordtab,myrange,Template:variant;
    myini:Tinifile;
    h:hwnd;
    resultstr:string;
begin
    Try
        wordapp:=createoleobject('word.application');
        wordapp.visible:=false;
    Except
        messagebox(0,'未安装 Word应用程序,请先安装MicrosoftOffice,然后输出报表!',
                    '程序未找到',mb_Ok+MB_ICONWARNING+MB_APPLMODAL);
        Abort;
    End;

    application.CreateForm(Tflashform,flashform);
    flashform.Show;
    flashform.Panel1.Caption:='正在导出到Word,请稍后...';
    flashform.Refresh;

    //设定文档模式,(*关闭拼音查找，语法查找，提高运行效率*)
    Wordapp.Options.CheckSpellingAsYouType := False;
    Wordapp.Options.CheckGrammarAsYouType := False;
    Template:=ExtractFiledir(Application.Exename)+'/doc/院感报告单.dot';
    worddoc:=wordapp.Documents.Add(template);
    wordtab:=worddoc.tables.item(1);

    try
    wordtab.cell(1,1).range.insertafter(hospitalName+'环境卫生学监测报告单');
    wordtab.cell(2,1).range.insertafter('标本号：'+dbe_specnum.text);
    wordtab.cell(2,2).range.insertafter('科室：'+dbcsection.text);
    wordtab.cell(2,3).range.insertafter('物体：'+dbe_room.text);
    wordtab.cell(3,1).range.insertafter('采样类别：'+'物体表面');
    wordtab.cell(3,2).range.insertafter('环境类别：'+dbc_environ.text);
    wordtab.cell(3,3).range.insertafter('采样面积：'+dbe_area.text);
    wordtab.cell(4,1).range.insertafter('稀释倍数：'+dbe_rate.text);
    wordtab.cell(4,2).range.insertafter('平皿总菌落数：'+dbe_gnum.text);
    wordtab.cell(4,3).range.insertafter('采样者：'+dbc_samplingMan.text);
    wordtab.cell(5,1).range.insertafter('采样日期：'+dbe_cydate.text);
    resultstr:='';
    if  radiobutton1.Checked then
    if  dbe_hours.Text=''then
      resultstr:=''
    else
      resultstr:='经培养'+dbe_hours.Text+'小时后，分析无细菌生长';
    if   radiobutton2.Checked then
    begin
      resultstr:='菌落总数：'+dbe_totalNum.Text+'CFU/cm^2';
      if checkbox1.Checked then
      begin
        resultstr:=resultstr+''#13#10;
        resultstr:=resultstr+'细菌名:'+dbe_gname.Text;
      end;
    end;
    if RadioButton3.Checked then
    if ComboBox1.Text<>'' then
        resultstr:=ComboBox1.Text
    else  resultstr:='';
    wordtab.cell(6,1).range.insertafter(resultstr);
    //导出审核者，送检者
    wordtab.cell(7,1).range.insertafter(dbcbg.Text);
    wordtab.cell(7,2).range.insertafter(dbc_shys.Text);
    wordtab.cell(7,3).range.insertafter(dbe_reportdate.Text);
    //导出页脚
    myini:=Tinifile.Create(Extractfiledir(Application.ExeName)+'\dw.ini');
    wordtab.cell(8,1).range.insertafter(myini.ReadString('DepartMent','Information',''));
    myini.Free;
    except
      messagedlg('导出报表出错！',mtWarning,[mbok],0);
    end;
    flashform.Hide;
    flashform.Free;

    wordapp.visible:=true;
    setwindowpos(findwindow('NetUIHWND',nil),HWND_TOPMOST,0,0,0,0,SWP_SHOWWINDOW);
end;

end.
