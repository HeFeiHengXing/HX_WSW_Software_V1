unit ygqtFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, RpCon, RpConDS, RpRave, RpDefine, RpBase,
  RpSystem, StdCtrls, Mask, DBCtrls, DB, ADODB,inifiles,comobj;

type
  TYgqtForm = class(TForm)
    lblRoom: TLabel;
    dbc_Section: TDBComboBox;
    lblSecName: TLabel;
    btnExtract: TButton;
    dbe_SpecNum: TDBEdit;
    lblSpecNum: TLabel;
    dbc_samplingMan: TDBComboBox;
    dbe_cydate: TDBEdit;
    RadioButton1: TRadioButton;
    dbe_hours: TDBEdit;
    Label18: TLabel;
    CheckBox1: TCheckBox;
    dbe_gname: TDBEdit;
    dbe_totalNum: TDBEdit;
    dbe_totalNum2: TDBEdit;
    RadioButton3: TRadioButton;
    RadioButton2: TRadioButton;
    Label14: TLabel;
    dbcBG: TDBComboBox;
    RvSystem1: TRvSystem;
    RvProject1: TRvProject;
    rvYgQt: TRvDataSetConnection;
    btnPrint: TBitBtn;
    Label12: TLabel;
    dbe_reportDate: TDBEdit;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    lblSdoctor: TLabel;
    lblSDate: TLabel;
    Shape1: TShape;
    dbc_pinming: TDBComboBox;
    Label20: TLabel;
    Label4: TLabel;
    dbc_shys: TDBComboBox;
    dbc_jcjg: TDBEdit;
    ZFX_QT: TADOQuery;
    dbe_totalNum3: TDBEdit;
    Shape2: TShape;
    ZFX_YX: TADOQuery;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    ComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    ComboBox4: TComboBox;
    dbc_gjbz: TDBComboBox;
    Label6: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExtractClick(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure dbe_SpecNumClick(Sender: TObject);
    procedure dbe_SpecNumKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_SectionKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_pinmingKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_samplingManKeyPress(Sender: TObject; var Key: Char);
    procedure dbcBGKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_shysKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton4Click(Sender: TObject);
    procedure dbe_totalNumChange(Sender: TObject);
    procedure CheckBox1KeyPress(Sender: TObject; var Key: Char);
    procedure dbc_gjbzExit(Sender: TObject);
    procedure dbc_gjbzChange(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    id:integer;
  public
    { Public declarations }
    bBrowse,bEdit:boolean;
    SQLText:STRING;
    saved:boolean;
    procedure Print;
    Procedure ExportWord;
  end;

var
  YgqtForm: TYgqtForm;

implementation
uses dbym, regYgfrm,ymDataType,common,regYgMedFrm,regYgqt,loginfrm,
  YgQueryFrm, flash, sreport;
{$R *.dfm}

procedure TYgqtForm.FormCreate(Sender: TObject);
begin
   bBrowse:=false;
   bEdit:=false;
   saved:=false;
   rvproject1.ProjectFile:=rvfile;
end;

procedure TYgqtForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if (dmym.rsHospital.state=dsInsert) or
      (dmym.rsHospital.State=dsedit) then
      dmym.rsHospital.cancel;
   //dmym.rsHospital.Close;
   action:=cafree;
   { with dmym.query1 do // 程序中根据国家标准的判定结果存储时发生意外改变。以下代码
                        //直接用刚存储的数据。。从数据库中读出数据进行判定。然后写入数据库判定结果
    begin
        close;
        sql.Clear;
        sql.Add('select * from hospital where cylb=''其他''');
        open;
        if recordcount>0 then
        begin
        last;
        begin
            edit;
            if fieldvalues['mem']='无细菌生长' then
            begin
                fieldvalues['YGBBJC']:='合格';
                post;
            end
            else
            begin
                if strtoint(fieldvalues['mem'])<=10 then
                    fieldvalues['YGBBJC']:='合格'
                else
                    fieldvalues['YGBBJC']:='不合格';
                post;
            end;
        end;
        end;
    end; }
end;

procedure TYgqtForm.FormShow(Sender: TObject);
var
   strl:tstringlist;
   dh:dbhelper;
   str:string;
   i:integer;
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
       str:=dmym.rsHospital.FieldValues['YgbbGB'];
       for i:=1 to length(str) do
       if str[i] in ['0','1','2','3','4','5','6','7','8','9','.'] then
       begin
          str:=copy(str,i,length(str)-i+1);
          break;
       end;
       for i:=1 to length(str) do
       if not (str[i] in ['0','1','2','3','4','5','6','7','8','9','.']) then
       begin
          str:=copy(str,i,length(str)-i+1);
          break;
       end;
       label20.Caption:=str;
     end;
     if dmym.rsHospital['chk']='c' then
       radiobutton3.checked:=true;
     if dmym.rsHospital['chk']='d' then
       radiobutton4.checked:=true;
     if dmym.rsHospital['chk']='e' then
       radiobutton5.checked:=true;
     dbe_totalNum.text:=adanum ;
  end
  else
  begin
      if not dmym.rsHospital.Active then
        dmym.rshospital.Active:=true;
      dmym.rsHospital.Append;
      btnprint.enabled:=false;
      strl:=tstringlist.Create;
      dh.getSection(strl);
      dbc_Section.items:=strl;
      strl.Clear;

      strl:=tstringlist.Create;
      dh.getpinming(strl);
      dbc_pinming.items:=strl;
      strl.Clear;

      strl.Clear;
      dh.getRemark(strl);
      combobox1.Items:=strl;

      {strl.Clear;
      dh.getCheckman(strl);
      dbcbg.items:=strl;
      dbc_samplingman.items:=strl;
      dbc_shys.Items:=strl;}
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
      //dbc_gjbz.Text:='GB15982';

      RadioButton1.Checked:=true;
      
  end;
end;   

procedure TYgqtForm.btnSaveClick(Sender: TObject);
var
   bInTable:boolean;
   stemp:string;
begin
    if not(dmym.rsHospital.state=dsedit) then
    dmym.rsHospital.Edit;
   if dbe_SpecNum.Text='' then
    begin
    MessageDlg('请输入标本编号!',mtInformation,[mbOk],0);
    dbe_SpecNum.SetFocus;
    exit;
    end;
   if DBC_pinming.Text='' then
    begin
    MessageDlg('请输入品名!',mtInformation,[mbOk],0);
    DBC_pinming.SetFocus;
    exit;
    end;

   if RadioButton1.Checked then
     begin
      dmym.rsHospital['anum']:='';
      dmym.rsHospital['germname']:='';
      dmym.rsHospital['memo']:='';
      dbc_jcjg.text:='合格' ;
      dmym.rsHospital['mem']:='无细菌生长';
     end;
   if radiobutton2.Checked or radiobutton3.checked or radiobutton4.Checked then
   begin
      dmym.rsHospital['hhour']:='';
      dmym.rsHospital['memo']:='';
      if trim(dbc_gjbz.Text)='无细菌生长' then
      begin
          if strtoint(dbe_totalNum.Text)<=0 then
              dbc_jcjg.Text:='合格'
          else
              dbc_jcjg.Text:='不合格';
          dmym.rsHospital['mem']:=dbe_totalnum2.Text;
      end else
      begin
          if strtoint(dbe_totalNum.Text)<=strtoint(trim(dbc_gjbz.Text)) then
              dbc_jcjg.Text:='合格'
          else
              dbc_jcjg.Text:='不合格';
          dmym.rsHospital['mem']:=dbe_totalnum2.Text;
      end;
   end;
   if radiobutton5.Checked then
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
          if trim(dbc_gjbz.Text)='无细菌生长' then
          begin
              if strtoint(stemp)<=0 then
                  dbc_jcjg.Text:='合格'
              else
                  dbc_jcjg.Text:='不合格';
          end else
          begin
          if strtoint(stemp)<=strtoint(trim(dbc_gjbz.Text)) then
              dbc_jcjg.Text:='合格'
          else
              dbc_jcjg.Text:='不合格';
          end;
       end;
    end;
    //判断结束
   if trim(dbc_gjbz.Text)='无细菌生长' then
      dmym.rsHospital['YGbbGB']:='无细菌生长'
   else
      dmym.rsHospital['YGbbGB']:='≤'+dbc_gjbz.Text+combobox4.Text;
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
   if RadioButton5.Checked then
      dmym.rsHospital['chk']:='e';
   if RadioButton4.Checked then
      dmym.rsHospital['chk']:='d';
   if RadioButton3.Checked then
      dmym.rsHospital['chk']:='c';
   if RadioButton2.Checked then
      dmym.rsHospital['chk']:='b';
   if RadioButton1.Checked then
      dmym.rsHospital['chk']:='a';
   dmym.rsHospital['cylb']:='其他';
   dmym.rsHospital.Edit;/////////////////////////////////////////////
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
end;

procedure TYgqtForm.btnCloseClick(Sender: TObject);
begin
    if saved=true then
    close
    else
    if messagebox(handle,'结果尚未保存，是否退出？','提示',mb_yesno)=idyes then
    close;
end;

procedure TYgqtForm.btnExtractClick(Sender: TObject);
var
   rfrm:tregYgqtForm;
begin
   rfrm:= TRegYgqtForm.create(self);
   rfrm.bExtract:=true;
   //rfrm.ygtype:=4;
   rfrm.showmodal;
   if rfrm.extracted then
   begin
      id:=rfrm.id;
      with dmym.exquery do
         begin
            dbe_specNum.Text:=fieldbyname('specNum').asstring;
            dmym.rsHospital['secname']:=fieldbyname('secname').asstring;
            dmym.rsHospital['room']:=fieldbyname('room').asstring;
            dmym.rsHospital['CYlb']:=fieldbyname('CYlb').asstring;
            dmym.rsHospital['cyys']:=fieldbyname('cyys').asstring;
            dmym.rsHospital['cydate']:=fieldbyname('cydate').asstring;
         end;
   end;
end;

procedure TYgqtForm.RadioButton3Click(Sender: TObject);
begin
    dbe_totalNum2.Enabled:=radiobutton3.Checked;
    if radiobutton3.Checked then
    begin
      checkbox1.Enabled:=true;
      //dbe_gname.Enabled:=true;
      dbe_hours.Enabled:=false;
      dbe_totalNum.Enabled:=false;
      dbe_totalNum3.Enabled:=false;
      combobox1.Enabled:=false;
    end;
end;

procedure TYgqtForm.Print;
var
  resultstr,cylb:string;
begin
   resultstr:='';
   rvproject1.Open;

     if RadioButton5.Checked then
        if ComboBox1.Text<>'' then
        resultstr:=ComboBox1.Text
        else
        resultstr:='';
     if  radiobutton1.Checked then
     if  dbe_hours.Text='' then
         resultstr:=''
     else
         resultstr:='经培养'+dbe_hours.Text+'小时后，分析无细菌生长';
     if   radiobutton2.Checked then
      begin
         resultstr:='细菌总菌落数：'+dbe_totalNum.Text+label20.caption;
      end;
     {if  radiobutton3.Checked then
         resultstr:='细菌总菌落数：'+dbe_totalNum.Text+'CFU/100cm^2';
     if  radiobutton4.Checked then
         resultstr:='细菌总菌落数：'+dbe_totalNum.Text+'CFU/件';}
     if checkbox1.Checked then
          begin
            resultstr:=resultstr+''#13#10;
            resultstr:=resultstr+'细菌名:'+dbe_gname.Text;
          end;
   cylb:='其它';
   rvproject1.SetParam('specnum',dbe_specnum.text);
   rvproject1.SetParam('cylb',cylb);
   rvproject1.SetParam('resultstr',resultstr);
   rvproject1.SetParam('titlestr',hospitalname+'院内感染监测报告单');
   //rvproject1.SetParam('remark',ComboBox1.Text);
   rvproject1.ExecuteReport('reportygqt');
   rvproject1.Close;
end;

procedure TYgqtForm.dbe_SpecNumClick(Sender: TObject);
var zDbHelper:dbhelper;
begin
 dmym.rshospital.Active:=true;/////////////////////////////////////////////////////
 dmym.rshospital.Edit;/////////////////////////////////////////////////////////////
 zDbHelper:=DbHelper.Create;///////////////////////////////////////////////////
 //zDbHelper.getYGbbh;////////////////////////////////////////////////////////
 //dbe_SpecNum.Text:=inttostr(zDbHelper.YGMaxbbh1);
end;

procedure TYgqtForm.dbe_SpecNumKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  begin
   SQLText:='';
   if dbe_SpecNum.Text='' then
      begin
      showmessage('**请输入标本编号**');
      exit;
      end;
  dbc_Section.SetFocus;
  end;
end;
procedure TYgqtForm.dbc_SectionKeyPress(Sender: TObject; var Key: Char);
  var secid,SQLText:string;
      rnum:integer;
begin
  if key=#13 then
  begin
   SQLText:='';
   if dbc_Section.Text='' then
      BEGIN
      showmessage('**请选择或输入科别**');
      EXIT;
      END;
   if dbc_Section.Text<>'' then
      begin
         SQLText:='select * from secname';
         secid:=dbc_Section.Text;
         with ZFX_QT do
         begin
           close;
           sql.clear;
           sql.add(SQLText);
           sql.add('where secid=:secid');
           parameters.parambyname('secid').value:=secid;
           open;
           rnum:=ZFX_QT.RecordCount;
           if rnum>0 then
           dbc_Section.Text:=ZFX_QT.FieldValues['secname'] ;
         end;
       end;
        DBC_pinming.setfocus;
   end;
end;

procedure TYgqtForm.dbc_pinmingKeyPress(Sender: TObject; var Key: Char);
var SQLtext,secid:string;
    rnum:integer;
begin
    IF KEY=#13 THEN
    begin
       SQLText:='';;
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
    dbc_samplingman.SetFocus;
    end;
end;

procedure TYgqtForm.dbc_samplingManKeyPress(Sender: TObject;
  var Key: Char);
  var ID:string;
begin
  if key=#13 then
  begin
   SQLText:='';
   if dbc_samplingMan.Text='' then
      showmessage('**请选择采样人员**');
   if dbc_samplingMan.Text<>'' then
      begin
         SQLText:='select * from checkman';
         ID:=dbc_samplingMan.Text;
         with ZFX_QT do
         begin
         close;
         sql.clear;
         sql.add(SQLText);
         sql.add('where ID=:ID');
         parameters.parambyname('ID').value:=ID;
         open;
         if ZFX_QT.RecordCount>0 then
         dbc_samplingMan.Text:=ZFX_QT.FieldValues['name'];
         end;
       end;
   dbe_cydate.SetFocus;
   end;
end;

procedure TYgqtForm.dbcBGKeyPress(Sender: TObject; var Key: Char);
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
         with ZFX_QT do
         begin
         close;
         sql.clear;
         sql.add(SQLText);
         sql.add('where ID=:ID');
         parameters.parambyname('ID').value:=ID;
         open;
         if ZFX_QT.RecordCount>0 then
        dbcBG.Text:=ZFX_QT.FieldValues['name'];
         end;
       end;
       dbe_cydate.SetFocus;
   end;
end;

procedure TYgqtForm.dbc_shysKeyPress(Sender: TObject; var Key: Char);
begin
IF KEY=#13 THEN
dbe_reportDate.SetFocus;
end;

procedure TYgqtForm.ComboBox1KeyPress(Sender: TObject; var Key: Char);
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

procedure TYgqtForm.RadioButton4Click(Sender: TObject);
begin
    dbe_totalNum3.Enabled:=radiobutton4.Checked;
    dbe_totalNum3.ReadOnly:=false;
    if radiobutton4.Checked then
    begin
      //dbe_gname.Enabled:=true;
      combobox1.Enabled:=false;
      dbe_hours.Enabled:=false;
      dbe_totalNum.Enabled:=false;
      dbe_totalNum2.Enabled:=false;
      combobox1.Enabled:=false;
    end;
end;

procedure TYgqtForm.dbe_totalNumChange(Sender: TObject);
begin
    IF dbe_totalNum.Text<>'' THEN
      begin
      if strtoint(dbe_totalNum.Text)<=10 then
          dbc_jcjg.Text:='合格'
      else
          dbc_jcjg.Text:='不合格';
      end;
end;

procedure TYgqtForm.CheckBox1KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if not CheckBox1.Checked then
            CheckBox1.Checked:=true
        else
            CheckBox1.Checked:=false;
    end;
end;

procedure TYgqtForm.dbc_gjbzExit(Sender: TObject);
begin
    if trim(dbc_gjbz.Text)='0' then
        dbc_gjbz.Text:='无细菌生长';
end;

procedure TYgqtForm.dbc_gjbzChange(Sender: TObject);
begin
    if dbc_gjbz.text='无细菌生长' then
        combobox4.Enabled:=false
    else
        combobox4.Enabled:=true;
end;

procedure TYgqtForm.ComboBox4Change(Sender: TObject);
begin
    label20.Caption:=combobox4.Text;
end;

procedure TYgqtForm.Button1Click(Sender: TObject);
var dataclass:dbhelper;
begin
    dataclass:=dbhelper.Create;
    dmym.rsHospital['specNum']:=dataclass.generateNumber('hosno');
    dataclass.Free;
end;

procedure TYgqtForm.ExportWord;
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
    wordtab.cell(2,2).range.insertafter('科室：'+dbc_section.text);
    wordtab.cell(2,3).range.insertafter('品名：'+dbc_pinming.Text);
    wordtab.cell(3,1).range.insertafter('采样类别：'+'其他');
    wordtab.cell(3,2).range.insertafter('国家标准：'+dmym.rsHospital['YGbbGB']);
    wordtab.cell(3,3).range.insertafter('采样者：'+dbc_samplingMan.text);
    wordtab.cell(4,1).range.insertafter('采样日期：'+dbe_cydate.text);
    wordtab.rows.item(5).delete;
    resultstr:='';
    if  radiobutton1.Checked then
    if  dbe_hours.Text=''then
      resultstr:=''
    else
      resultstr:='经培养'+dbe_hours.Text+'小时后，分析无细菌生长';
    if   radiobutton2.Checked then
    begin
      resultstr:='细菌总菌落数：'+dbe_totalNum.Text+'CFU/cm^2';
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

procedure TYgqtForm.btnPrintClick(Sender: TObject);
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
    Sendmessage(findwindow('TYgqtForm',nil),WM_SYSCOMMAND,SC_CLOSE,0);
end;

end.
