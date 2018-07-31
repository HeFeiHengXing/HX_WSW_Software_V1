unit YgAirFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls,db, RpCon, RpConDS,
  RpBase, RpSystem, RpDefine, RpRave, ADODB, ComCtrls,strutils,inifiles,comobj,
  math;

type
  TYgAirForm = class(TForm)
    lblSpecNum: TLabel;
    lblSecName: TLabel;
    lblRoom: TLabel;
    lblEnviron: TLabel;
    lblGermNum: TLabel;
    lblSdoctor: TLabel;
    lblSDate: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    lbl_cfu: TLabel;
    dbe_SpecNum: TDBEdit;
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
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    rvaircon: TRvDataSetConnection;
    Panel1: TPanel;
    Shape3: TShape;
    Label2: TLabel;
    Label3: TLabel;
    dbe_pmNum: TDBEdit;
    dbc_gjbz: TDBEdit;
    dbc_jcjg: TDBEdit;
    ZFX_YX: TADOQuery;
    dbc_shys: TDBComboBox;
    Label4: TLabel;
    dbe_room: TDBEdit;
    RadioButton3: TRadioButton;
    ComboBox1: TDBComboBox;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExtractClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbe_pmNumKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_gnumKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_environChange(Sender: TObject);
    procedure dbe_pmNumChange(Sender: TObject);
    procedure dbe_SpecNumKeyPress(Sender: TObject; var Key: Char);
    procedure dbcSectionKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_environKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_samplingManKeyPress(Sender: TObject; var Key: Char);
    procedure dbcBGKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_shysKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_cydateKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_roomKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    SQLText:STRING;
    bBrowse:boolean;
    bEdit:boolean;
    saved:boolean;
    procedure print;
    procedure ExportWord;
  end;

var
  YgAirForm: TYgAirForm;

implementation

uses dbym, ymDataType, regYgfrm, common,loginfrm, YgQueryFrm, sreport,
  flash;

{$R *.dfm}

procedure TYgAirForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if (dmym.rsHospital.state=dsInsert) or
      (dmym.rsHospital.State=dsedit) then
      dmym.rsHospital.cancel;
    action:=cafree;
end;

procedure TYgAirForm.FormShow(Sender: TObject);
var
   strl:tstringlist;
   dh:dbhelper;
begin
  if bBrowse then
  begin
    dmym.rsHospital.Edit;
    btnExtract.Enabled:=false;
    if dmym.rsHospital['chk']='a' then
      radiobutton1.Checked:=true;
    if dmym.rsHospital['chk']='b' then
    begin
      radiobutton2.Checked:=true;
      if (dmym.rsHospital['germname']<>'') and not varisnull(dmym.rsHospital['germname']) then
        checkbox1.Checked:=true;
    end;
    if dmym.rsHospital['chk']='c' then
      radiobutton3.Checked:=true;
    dbe_totalNum.text:=adanum ;
    label20.Caption:=copy(dmym.rsHospital['ygbbgb'],4,length(trim(dmym.rsHospital['ygbbgb']))-3);
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
    //dbc_shys.Items:=strl;

    dbc_shys.Items.Add(userNamehfut); //初始化审核者
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

procedure TYgAirForm.btnSaveClick(Sender: TObject);
var
    bInTable:boolean;
    str,str1,sqltext:string ;
    stemp:string;
begin
    if dbe_SpecNum.Text='' then///标本号不能为空
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
      dbc_jcjg.text:='合格' ;
      dmym.rsHospital['mem']:='无细菌生长';
    end;
    if radiobutton2.Checked  then
    begin
      dmym.rsHospital['hhour']:='';
      dmym.rsHospital['memo']:='';
      if  strtofloat(dbe_totalNum.Text)<=4 then
        dbc_jcjg.Text:='合格'
      else
        dbc_jcjg.Text:='不合格';
      dmym.rsHospital['mem']:=dbe_totalnum.Text;
    end;
    if radiobutton3.Checked then
    begin
       dmym.rsHospital['hhour']:='';
       dmym.rsHospital['anum']:='';
       dmym.rsHospital['germname']:='';
       stemp:=dbhelper.Create.extractnum(combobox1.Text);
       if stemp='' then
       begin
          dmym.rsHospital['mem']:='无细菌生长';
          dbc_jcjg.Text:='合格';
       end else
       begin
          dmym.rsHospital['mem']:=stemp;
          if strtofloat(stemp)<=4 then
            dbc_jcjg.Text:='合格'
          else
            dbc_jcjg.Text:='不合格';
       end;
    end;
    //判断结束
   bInTable:=false;
   //删除reghospital里的该条记录
   // bInTable:=false;
   dmym.conn.BeginTrans;
   try
   begin
   with dmym.rsRegYg do
   begin
      active:=true;
      bIntable:=locate('specnum',dbe_specNum.text,[loCaseInsensitive]);
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
   dmym.rsHospital['cylb']:='空气';
   dmym.rsHospital['YgBBJC']:=dbc_jcjg.Text;
   dmym.rsHospital.Post;

   dmym.conn.commitTrans;
   MessageDlg('记录保存成功!',mtInformation,[mbOk],0);
  end;
  except
   dmym.conn.rollbacktrans;
  end;
  btnprint.Enabled:=true;
  btnsave.Enabled:=false;
  saved:=true;
end;

procedure TYgAirForm.btnCloseClick(Sender: TObject);
begin
    if saved=true then
    close
    else
    if messagebox(handle,'结果尚未保存，是否退出？','提示',mb_yesno)=idyes then
    close;
end;

procedure TYgAirForm.btnExtractClick(Sender: TObject);
var
   rfrm:tregYgForm;
begin
   rfrm:= TRegYgForm.create(self);
   rfrm.bExtract:=true;
  // rfrm.ygtype:=1;
   rfrm.showmodal;
   if rfrm.extracted then
   begin
      with dmym.exquery do
      begin
            dbe_specNum.Text:=fieldbyname('specNum').asstring;
            dmym.rsHospital['secname']:=fieldbyname('secname').asstring;
            dmym.rsHospital['room']:=fieldbyname('room').asstring;
            dmym.rsHospital['hjlb']:=fieldbyname('hjlb').asstring;
            //dmym.rsHospital['germnum']:=fieldbyname('germnum').asstring;
            dmym.rsHospital['pmNum']:=fieldbyname('pmNum').asstring;
            dmym.rsHospital['cyys']:=fieldbyname('cyys').asstring;
            dmym.rsHospital['cydate']:=fieldbyname('cydate').asstring;

             if fieldbyname('hjlb').asstring='I' then
             begin
                label20.Caption:='cfu/(30min·直径9cm平皿)';
                dbc_gjbz.Text:='≤4cfu/(30min·直径9cm平皿)';
             end else
             if fieldbyname('hjlb').asstring='II' then
             begin
                label20.Caption:='cfu/(15min·直径9cm平皿)';
                dbc_gjbz.Text:='≤4cfu/(15min·直径9cm平皿)';
             end else
             if fieldbyname('hjlb').asstring='III' then
             begin
                label20.Caption:='cfu/(5min·直径9cm平皿)';
                dbc_gjbz.Text:='≤4cfu/(5min·直径9cm平皿)';
             end else
             if fieldbyname('hjlb').asstring='IV' then
             begin
                label20.Caption:='cfu/(5min·直径9cm平皿)';
                dbc_gjbz.Text:='≤4cfu/(5min·直径9cm平皿)';
             end else
             dbc_gjbz.Text:='无菌生长';
      end;
   end;
end;

procedure TYgAirForm.FormCreate(Sender: TObject);
begin
   bBrowse:=false;
   bEdit:=false;
   saved:=false;
   rvproject1.ProjectFile:=rvfile;
end;

procedure TYgAirForm.Print;
var
  resultstr,specNum,secName,room,CYlb:string;
  hjlb,germNum,pmNum,cyys,cyDate:string;
  reporter,reportDate,shys:string;
begin
   rvproject1.Open;
   //打印结果
   resultstr:='';
   if  radiobutton1.Checked then
      if  dbe_hours.Text=''then
      resultstr:=''
      else
      resultstr:='经培养'+dbe_hours.Text+'小时后，分析无细菌生长';
   if   radiobutton2.Checked then
   begin
      resultstr:='细菌总菌落数：'+dbe_totalNum.Text+label20.Caption;
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
   if dbe_SpecNum.Text<>'' then
       specNum:=dbe_SpecNum.Text
   else
      specNum:='';
   if dbcSection.Text<>'' then
      secName:=dbcSection.Text
   else
      secName:='';
   if dbe_room.Text<>'' then
      room:=dbe_room.Text
   else
      room:='';
   CYlb:='空气';
   if dbc_environ.Text<>'' then
      hjlb:=dbc_environ.Text
   else
      hjlb:='';
   if dbe_gnum.Text<>'' then
      germNum:=dbe_gnum.Text
   else
      germNum:='';
   if dbe_pmNum.Text<>'' then
      pmNum:=dbe_pmNum.Text
   else
      pmNum:='';
   if dbc_samplingMan.Text<>'' then
      cyys:=dbc_samplingMan.Text
    else
      cyys:='';
   if dbe_cydate.Text<>'' then
      cyDate:=dbe_cydate.Text
   else
      cyDate:='';
   if dbcBG.Text<>'' then
      reporter:=dbcBG.Text
   else
      reporter:='';
   if dbe_reportDate.Text<>'' then
      reportDate:=dbe_reportDate.Text
   else
      reportDate:='';
   if dbc_shys.Text<>'' then
      shys:=dbc_shys.Text;
   {if CheckBox2.Checked then
     begin
        resultstr:=resultstr+''#13#10;
        resultstr:=resultstr+ComboBox1.Text;
     end;//有关备注打印
     }
   rvproject1.SetParam('reporter',reporter);
   rvproject1.SetParam('reportDate',reportDate);
   rvproject1.SetParam('cyDate',cyDate);
   rvproject1.SetParam('cyys',cyys);
   rvproject1.SetParam('pmNum',pmNum+' 个');
   rvproject1.SetParam('germNum',germNum+' CFU');
   rvproject1.SetParam('room',room);
   rvproject1.SetParam('CYlb',CYlb);
   rvproject1.SetParam('hjlb',hjlb);
   rvproject1.SetParam('specNum',specNum);
   rvproject1.SetParam('secName',secName);
   rvproject1.SetParam('resultstr',resultstr);
   rvproject1.SetParam('titlestr',hospitalname+'院内感染监测报告单');
   rvproject1.SetParam('shys',shys);
   rvproject1.ExecuteReport('report3');
   rvproject1.Close;
end;

procedure TYgAirForm.dbe_pmNumKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #13 then
     dbe_gnum.SetFocus;
end;

procedure TYgAirForm.dbe_gnumKeyPress(Sender: TObject; var Key: Char);
begin
   if key =#13 THEN
    dbe_hours.setfocus;
end;

procedure TYgAirForm.dbc_environChange(Sender: TObject);
begin
   if dbc_environ.Text='I' then
   begin
      label20.Caption:='cfu/(30min·直径9cm平皿)';
      dbc_gjbz.Text:='≤4cfu/(30min·直径9cm平皿)';
   end else
   if dbc_environ.Text='II' then
   begin
      label20.Caption:='cfu/(15min·直径9cm平皿)';
      dbc_gjbz.Text:='≤4cfu/(15min·直径9cm平皿)';
   end else
   if dbc_environ.Text='III' then
   begin
      label20.Caption:='cfu/(5min·直径9cm平皿)';
      dbc_gjbz.Text:='≤4cfu/(5min·直径9cm平皿)';
   end else
   if dbc_environ.Text='IV' then
   begin
      label20.Caption:='cfu/(5min·直径9cm平皿)';
      dbc_gjbz.Text:='≤4cfu/(5min·直径9cm平皿)';
   end else
   if dbc_environ.Text='' then
      dbc_gjbz.Text:='无菌生长';
end;

procedure TYgAirForm.dbe_pmNumChange(Sender: TObject);
var
  pmnum,gnum:double;
  f:double;
begin
     if dbe_pmNum.Text='' then
      pmnum:=0
     else
      pmnum:=strtoint(dbe_pmNum.Text);
     if dbe_gnum.Text='' then
      gnum:=0
     else
      gnum:=strtoint(dbe_gnum.Text);
     if pmnum<>0 then
     begin
     f:=roundto(gnum/pmnum,-1);
     if f<>0 then
     dbe_totalNum.text :=floattostr(f)
     else
     dbe_totalNum.text :='0.0';
     RadioButton1.Checked:=false;
     RadioButton2.Checked:=true;
     {dmym.rshospital.Active:=true;
     dmym.rshospital['anum']:=dbe_totalNum.Text;
     dmym.rshospital.Active:=false;}
     end;
end;


procedure TYgAirForm.dbe_SpecNumKeyPress(Sender: TObject; var Key: Char);
begin
 IF KEY=#13 THEN
 dbcSection.SetFocus;
end;

procedure TYgAirForm.dbcSectionKeyPress(Sender: TObject; var Key: Char);
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

procedure TYgAirForm.dbc_environKeyPress(Sender: TObject; var Key: Char);
begin
     IF KEY=#13 THEN
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
        dbc_samplingMan.SetFocus;
     end;
end;

procedure TYgAirForm.dbc_samplingManKeyPress(Sender: TObject;
  var Key: Char);
  var ID:string;
begin
  if key=#13 then
  begin
   SQLText:='';
   if dbc_samplingMan.Text='' then
      begin
      showmessage('**请选择采样人员**');
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

procedure TYgAirForm.dbcBGKeyPress(Sender: TObject; var Key: Char);
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

procedure TYgAirForm.dbc_shysKeyPress(Sender: TObject; var Key: Char);
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

procedure TYgAirForm.dbe_cydateKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   dbe_pmnum.SetFocus;
end;


procedure TYgAirForm.dbe_roomKeyPress(Sender: TObject; var Key: Char);
begin
 IF KEY=#13 THEN
    dbc_environ.SetFocus;

end;

procedure TYgAirForm.ComboBox1KeyPress(Sender: TObject; var Key: Char);
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
   end;
end;

procedure TYgAirForm.CheckBox1KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if not CheckBox1.Checked then
            CheckBox1.Checked:=true
        else
            CheckBox1.Checked:=false;
    end;
end;

procedure TYgAirForm.Button1Click(Sender: TObject);
var dataclass:dbhelper;
begin
    dataclass:=dbhelper.Create;
    dmym.rsHospital['specNum']:=dataclass.generateNumber('hosno');
    dataclass.Free;
end;

procedure TYgAirForm.btnPrintClick(Sender: TObject);
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
    Sendmessage(findwindow('TYgAirForm',nil),WM_SYSCOMMAND,SC_CLOSE,0);
end;

procedure TYgAirForm.Exportword;
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
    wordtab.cell(1,1).range.insertafter(hospitalName+'院内感染监测报告单');
    wordtab.cell(2,1).range.insertafter('标本号：'+dbe_specnum.text);
    wordtab.cell(2,2).range.insertafter('科室：'+dbcsection.text);
    wordtab.cell(2,3).range.insertafter('标本来源：'+dbe_room.text);
    wordtab.cell(3,1).range.insertafter('采样类别：'+'空气');
    wordtab.cell(3,2).range.insertafter('环境类别：'+dbc_environ.Text);
    wordtab.cell(3,3).range.insertafter('采样者：'+dbc_samplingMan.text);
    wordtab.cell(4,1).range.insertafter('采样日期：'+dbe_cydate.text);
    wordtab.cell(4,2).range.insertafter('平皿总数量：'+dbe_pmnum.text);
    wordtab.cell(4,3).range.insertafter('平皿总菌落数：'+dbe_gnum.text);
    wordtab.rows.item(5).delete;
    resultstr:='';
    if  radiobutton1.Checked then
    if  dbe_hours.Text=''then
      resultstr:=''
    else
      resultstr:='经培养'+dbe_hours.Text+'小时后，分析无细菌生长';
    if   radiobutton2.Checked then
    begin
      resultstr:='细菌总菌落数：'+dbe_totalNum.Text+label20.caption;
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
    wordtab.cell(5,1).range.insertafter(resultstr);
    //导出审核者，送检者
    wordtab.cell(6,1).range.insertafter(dbcbg.Text);
    wordtab.cell(6,2).range.insertafter(dbc_shys.Text);
    wordtab.cell(6,3).range.insertafter(dbe_reportdate.Text);
    //导出页脚
    myini:=Tinifile.Create(Extractfiledir(Application.ExeName)+'\dw.ini');
    wordtab.cell(7,1).range.insertafter(myini.ReadString('DepartMent','Information',''));
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
