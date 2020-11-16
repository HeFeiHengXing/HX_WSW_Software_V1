unit YgSurgeryFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls,db, RpCon, RpConDS,
  RpBase, RpSystem, RpDefine, RpRave, ADODB, ComCtrls,strutils,inifiles,comobj;

type
  TYgSurgeryForm = class(TForm)
    lblSpecNum: TLabel;
    lblSecName: TLabel;
    lblRoom: TLabel;
    lblSdoctor: TLabel;
    lblSDate: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    labunit3: TLabel;
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
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    rvsurgery: TRvDataSetConnection;
    Panel1: TPanel;
    Shape3: TShape;
    dbc_gjbz: TDBEdit;
    dbc_jcjg: TDBEdit;
    ZFX_YX: TADOQuery;
    dbc_shys: TDBComboBox;
    Label4: TLabel;
    dbe_room: TDBEdit;
    RadioButton3: TRadioButton;
    ComboBox1: TDBComboBox;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    labunit1: TLabel;
    dbc_grade: TComboBox;
    dbc_area: TComboBox;
    labunit2: TLabel;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExtractClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbe_SpecNumKeyPress(Sender: TObject; var Key: Char);
    procedure dbcSectionKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_gradeKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_samplingManKeyPress(Sender: TObject; var Key: Char);
    procedure dbcBGKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_shysKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_roomKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure dbc_gradeChange(Sender: TObject);
    procedure dbc_areaKeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton5KeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton4KeyPress(Sender: TObject; var Key: Char);
    procedure dbe_cydateKeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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
  YgSurgeryForm: TYgSurgeryForm;

implementation

uses dbym, ymDataType, regYgfrm, common,loginfrm, YgQueryFrm, sreport,
  flash, regYgSurgeryfrm;

{$R *.dfm}

procedure TYgSurgeryForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if (dmym.rsHospital.state=dsInsert) or
      (dmym.rsHospital.State=dsedit) then
      dmym.rsHospital.cancel;
    action:=cafree;
end;

procedure TYgSurgeryForm.FormShow(Sender: TObject);
var
   strl:tstringlist;
   dh:dbhelper;
   i:integer;
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
      
    if dmym.rsHospital['hjlb']='IV' then
      dbc_grade.Text:='IV'
    else
    begin
      i:=pos('-',dmym.rsHospital['hjlb']);
      dbc_grade.text:=copy(dmym.rsHospital['hjlb'],1,i-1);
      dbc_gradeChange(sender);
      dbc_area.text:=copy(dmym.rsHospital['hjlb'],i+1,length(dmym.rsHospital['hjlb'])-i);
      dbc_gradeChange(sender);
    end;
    dbe_totalNum.text:=adanum ;

    if pos('cfu',dmym.rsHospital['ygbbgb'])>0 then
    begin
        i:=pos('cfu',dmym.rsHospital['ygbbgb']);
        labunit3.caption:=copy(dmym.rsHospital['ygbbgb'],i,length(dmym.rsHospital['ygbbgb'])-i+1);
    end else
        labunit3.Caption:=dmym.rsHospital['ygbbgb']; 
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

procedure TYgSurgeryForm.btnSaveClick(Sender: TObject);
var
    bInTable:boolean;
    str:string ;
    stemp:string;
    i,j:integer;
begin
    if dbe_SpecNum.Text='' then///标本号不能为空
    begin
      MessageDlg('请输入标本号!',mtInformation,[mbOk],0);
      dbe_SpecNum.SetFocus;
      exit;
    end;
    if dbc_grade.Text='' then
    begin
      showmessage('****请输入环境类别****');
      dbc_grade.SetFocus;
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
      i:=pos('≤',dbc_gjbz.text);
      j:=pos('cfu',dbc_gjbz.text);
      str:=copy(dbc_gjbz.text,i+2,j-i-2);
      if  strtofloat(dbe_totalNum.Text)<strtofloat(str) then
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
          if strtofloat(stemp)<=strtofloat(str) then
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
   dmym.rsHospital['cylb']:='手术室';
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

procedure TYgSurgeryForm.btnCloseClick(Sender: TObject);
begin
    if saved=true then
    close
    else
    if messagebox(handle,'结果尚未保存，是否退出？','提示',mb_yesno)=idyes then
    close;
end;

procedure TYgSurgeryForm.btnExtractClick(Sender: TObject);
var
   rfrm:TRegSurgeryform;
   i:integer;
begin
   rfrm:= TRegSurgeryform.create(self);
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
          dmym.rsHospital['pmNum']:=fieldbyname('pmNum').asstring;
          dmym.rsHospital['cyys']:=fieldbyname('cyys').asstring;
          dmym.rsHospital['cydate']:=fieldbyname('cydate').asstring;
          dmym.rsHospital['hjlb']:=fieldbyname('hjlb').asstring;

          i:=pos('-',fieldbyname('hjlb').asstring);
          if i>0 then
          begin
            dbc_grade.Text:=copy(fieldbyname('hjlb').asstring,1,i-1);
            dbc_area.Text:=copy(fieldbyname('hjlb').asstring,i+1,length(fieldvalues['hjlb'])-i);
          end else
            dbc_grade.Text:=fieldbyname('hjlb').asstring
          {if fieldbyname('hjlb').asstring='I' then
          begin
              label20.Caption:='cfu/(30min·Φ90皿)';
              dbc_gjbz.Text:='≤4cfu/(30min·Φ90皿)';
          end else
          if fieldbyname('hjlb').asstring='II' then
          begin
              label20.Caption:='cfu/(15min·Φ90皿)';
              dbc_gjbz.Text:='≤4cfu/(15min·Φ90皿)';
          end else
          if fieldbyname('hjlb').asstring='III' then
          begin
              label20.Caption:='cfu/(5min·Φ90皿)';
              dbc_gjbz.Text:='≤4cfu/(5min·Φ90皿)';
          end else
          if fieldbyname('hjlb').asstring='IV' then
          begin
              label20.Caption:='cfu/(5min·Φ90皿)';
              dbc_gjbz.Text:='≤4cfu/(5min·Φ90皿)';
          end else
          dbc_gjbz.Text:='无菌生长';}
      end;
   end;
end;

procedure TYgSurgeryForm.FormCreate(Sender: TObject);
begin
   bBrowse:=false;
   bEdit:=false;
   saved:=false;
   rvproject1.ProjectFile:=rvfile;
end;

procedure TYgSurgeryForm.Print;
var
   resultstr:string;
begin
   RvProject1.open;
   //打印结果
   resultstr:='';
   if  radiobutton1.Checked then
      if  dbe_hours.Text=''then
      resultstr:=''
      else
      resultstr:='经培养'+dbe_hours.Text+'小时后，分析无细菌生长';
   if   radiobutton2.Checked then
   begin
      resultstr:='菌落总数：'+dbe_totalNum.Text+labunit3.Caption;
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


   rvproject1.SetParam('resultstr',resultstr);
   rvproject1.SetParam('titlestr',hospitalname+'环境卫生学监测报告单');
   rvproject1.ExecuteReport('Report_ygsurgery');
   rvproject1.Close;
end;

procedure TYgSurgeryForm.dbe_SpecNumKeyPress(Sender: TObject; var Key: Char);
begin
 IF KEY=#13 THEN
 dbcSection.SetFocus;
end;

procedure TYgSurgeryForm.dbcSectionKeyPress(Sender: TObject; var Key: Char);
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

procedure TYgSurgeryForm.dbc_gradeKeyPress(Sender: TObject; var Key: Char);
begin
     IF KEY=#13 THEN
     begin
        if dbc_grade.Text='' then
            begin
            showmessage('****请选择等级****');
            exit;
            end;
        if dbc_grade.text<>'' then
        begin
           if (dbc_grade.text='1') or (dbc_grade.text='01') then
              dbc_grade.text:='I';
           if (dbc_grade.text='2') or (dbc_grade.text='02') then
              dbc_grade.text:='II';
           if (dbc_grade.text='3') or (dbc_grade.text='03') then
              dbc_grade.text:='III';
           if (dbc_grade.text='4') or (dbc_grade.text='04') then
              dbc_grade.text:='IV';
        end;
        dbc_area.SetFocus;
     end;
end;

procedure TYgSurgeryForm.dbc_samplingManKeyPress(Sender: TObject;
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

procedure TYgSurgeryForm.dbcBGKeyPress(Sender: TObject; var Key: Char);
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

procedure TYgSurgeryForm.dbc_shysKeyPress(Sender: TObject; var Key: Char);
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

procedure TYgSurgeryForm.dbe_roomKeyPress(Sender: TObject; var Key: Char);
begin
 IF KEY=#13 THEN
    dbc_grade.SetFocus;
end;

procedure TYgSurgeryForm.ComboBox1KeyPress(Sender: TObject; var Key: Char);
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

procedure TYgSurgeryForm.CheckBox1KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if not CheckBox1.Checked then
            CheckBox1.Checked:=true
        else
            CheckBox1.Checked:=false;
    end;
end;

procedure TYgSurgeryForm.Button1Click(Sender: TObject);
var dataclass:dbhelper;
begin
    dataclass:=dbhelper.Create;
    dmym.rsHospital['specNum']:=dataclass.generateNumber('hosno');
    dataclass.Free;
end;

procedure TYgSurgeryForm.btnPrintClick(Sender: TObject);
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
    Sendmessage(findwindow('TYgSurgeryForm',nil),WM_SYSCOMMAND,SC_CLOSE,0);
end;

procedure TYgSurgeryForm.Exportword;
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
    wordtab.cell(2,3).range.insertafter('标本来源：'+dbe_room.text);
    wordtab.cell(3,1).range.insertafter('采样类别：'+'手术室');
    wordtab.cell(3,2).range.insertafter('环境类别：'+dmym.rsHospital['hjlb']);
    wordtab.cell(3,3).range.insertafter('采样者：'+dbc_samplingMan.text);
    wordtab.cell(4,1).range.insertafter('采样日期：'+dbe_cydate.text);
    wordtab.cell(4,2).range.insertafter('菌落总数：'+dbe_totalnum.Text);
    wordtab.rows.item(5).delete;
    resultstr:='';
    if  radiobutton1.Checked then
    if  dbe_hours.Text=''then
      resultstr:=''
    else
      resultstr:='经培养'+dbe_hours.Text+'小时后，分析无细菌生长';
    if   radiobutton2.Checked then
    begin
      resultstr:='菌落总数：'+dbe_totalNum.Text+labunit3.Caption;
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


procedure TYgSurgeryForm.dbc_gradeChange(Sender: TObject);
begin
    if  dbc_grade.Text='IV' then
    begin
      dbc_area.Text:='';
      dbc_area.Enabled:=false;
      dmym.rsHospital['hjlb']:='IV'
    end else
      dbc_area.Enabled:=true;
    if  (dbc_grade.Text<>'') and (dbc_area.Text<>'') then
        dmym.rsHospital['hjlb']:=dbc_grade.Text+'-'+dbc_area.Text;
end;

procedure TYgSurgeryForm.dbc_areaKeyPress(Sender: TObject; var Key: Char);
begin
     IF KEY=#13 THEN
     begin
        if dbc_area.Text='' then
            begin
            showmessage('****请选择区域****');
            exit;
            end;
        if dbc_area.text<>'' then
        begin
           if (dbc_area.text='1') or (dbc_area.text='01') then
              dbc_area.text:='I';
           if (dbc_area.text='2') or (dbc_area.text='02') then
              dbc_area.text:='II';
        end;
        dbc_samplingMan.SetFocus;
     end;
end;

procedure TYgSurgeryForm.RadioButton4Click(Sender: TObject);
begin
    Edit1.Enabled:=RadioButton4.checked;
    Edit2.enabled:=RadioButton5.Checked;
    radiobutton2.Checked:=true;
    dmym.rsHospital['anum']:=edit1.Text;
    Edit1.SetFocus;
    labunit3.Caption:=labunit1.Caption;
    if dmym.rsHospital['hjlb']='I-I' then
      dbc_gjbz.text:='≤0.2cfu/(30min·Φ90皿)'
    else if dmym.rsHospital['hjlb']='I-II' then
      dbc_gjbz.text:='≤0.4cfu/(30min·Φ90皿)'
    else if dmym.rsHospital['hjlb']='II-I' then
      dbc_gjbz.text:='≤0.75cfu/(30min·Φ90皿)'
    else if dmym.rsHospital['hjlb']='II-II' then
      dbc_gjbz.text:='≤1.5cfu/(30min·Φ90皿)'
    else if dmym.rsHospital['hjlb']='III-I' then
      dbc_gjbz.text:='≤2cfu/(30min·Φ90皿)'
    else if dmym.rsHospital['hjlb']='III-II' then
      dbc_gjbz.text:='≤4cfu/(30min·Φ90皿)'
    else if dmym.rsHospital['hjlb']='IV' then
      dbc_gjbz.text:='≤5cfu/(30min·Φ90皿)';
end;

procedure TYgSurgeryForm.RadioButton5Click(Sender: TObject);
begin
    Edit1.Enabled:=RadioButton4.checked;
    Edit2.Enabled:=RadioButton5.Checked;
    radiobutton2.Checked:=true;
    dmym.rsHospital['anum']:=edit2.Text;
    Edit2.SetFocus;
    labunit3.Caption:=labunit2.Caption;
    if dmym.rsHospital['hjlb']='I-I' then
      dbc_gjbz.text:='≤5cfu/m^3'
    else if dmym.rsHospital['hjlb']='I-II' then
      dbc_gjbz.text:='≤10cfu/m^3'
    else if dmym.rsHospital['hjlb']='II-I' then
      dbc_gjbz.text:='≤25cfu/m^3'
    else if dmym.rsHospital['hjlb']='II-II' then
      dbc_gjbz.text:='≤50cfu/m^3'
    else if dmym.rsHospital['hjlb']='III-I' then
      dbc_gjbz.text:='≤75cfu/m^3'
    else if dmym.rsHospital['hjlb']='III-II' then
      dbc_gjbz.text:='≤150cfu/m^3'
    else if dmym.rsHospital['hjlb']='IV' then
      dbc_gjbz.text:='≤175cfu/m^3';
end;

procedure TYgSurgeryForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if key =#13 THEN
    radiobutton5.setfocus;
end;

procedure TYgSurgeryForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
    if key =#13 THEN
      radiobutton1.setfocus;
end;

procedure TYgSurgeryForm.RadioButton5KeyPress(Sender: TObject;
  var Key: Char);
begin
    if key =#13 THEN
      edit2.setfocus;
end;

procedure TYgSurgeryForm.RadioButton4KeyPress(Sender: TObject;
  var Key: Char);
begin
    if key =#13 THEN
      edit1.setfocus;
end;

procedure TYgSurgeryForm.dbe_cydateKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key =#13 THEN
    radiobutton4.setfocus;
end;

procedure TYgSurgeryForm.Edit2Change(Sender: TObject);
begin
    dmym.rsHospital['anum']:=Edit2.text;
end;

procedure TYgSurgeryForm.Edit1Change(Sender: TObject);
begin
    dmym.rsHospital['anum']:=Edit1.text;
end;

end.
