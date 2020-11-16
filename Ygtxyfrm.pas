unit Ygtxyfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls,db, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, ADODB,inifiles,comobj;

type
  TYgtxy = class(TForm)
    Shape1: TShape;
    dbe_hours: TDBEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label10: TLabel;
    dbe_totalnum: TDBEdit;
    Label11: TLabel;
    DBComboBox5: TDBComboBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbe_specnum: TDBEdit;
    dbe_brand: TDBEdit;
    dbc_samplingman: TDBComboBox;
    dbc_section: TDBComboBox;
    dbe_ph: TDBEdit;
    dbe_cydate: TDBEdit;
    dbc_pinming: TDBComboBox;
    dbc_type: TDBComboBox;
    Shape2: TShape;
    dbc_reporter: TDBComboBox;
    dbc_shys: TDBComboBox;
    Label12: TLabel;
    dbe_reportdate: TDBEdit;
    btnprint: TButton;
    btnsave: TButton;
    BtnClose: TButton;
    ygBBJC: TDBEdit;
    ygbbgb: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    dbe_gname: TDBEdit;
    CheckBox1: TCheckBox;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RvDataSetConnection1: TRvDataSetConnection;
    btnextract: TButton;
    ZFX_YX: TADOQuery;
    Button1: TButton;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
    procedure dbc_typeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbe_specnumClick(Sender: TObject);
    procedure dbe_specnumKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sectionKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_pinmingKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_brandKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_phKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_typeKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_samplingmanKeyPress(Sender: TObject; var Key: Char);
    procedure btnextractClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox5KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure btnprintClick(Sender: TObject);
  private
    { Private declarations }
    id:integer;
    SqlText:string;
  public
    { Public declarations }
  bBrowse:boolean;
  bEdit:boolean;
  saved:boolean;
  procedure print;
  procedure ExportWord;
  end;

var
  Ygtxy: TYgtxy;

implementation

uses YgQueryFrm, loginfrm,dbym, ymDataType, common,RegYgtxyfrm, flash,
  sreport;

{$R *.dfm}
var  db:dbhelper;

procedure TYgtxy.BtnCloseClick(Sender: TObject);
begin
    if saved=true then
    close
    else
    if messagebox(handle,'结果尚未保存，是否退出？','提示',mb_yesno)=idyes then
    close;
end;

procedure TYgtxy.FormCreate(Sender: TObject);
begin
    dmym.rsHospital.Active:=true;
    bBrowse:=false;
    bEdit:=false;
    saved:=false;
    RvProject1.ProjectFile:=rvfile;
end;

procedure TYgtxy.FormShow(Sender: TObject);
var strlist:Tstringlist;
begin
    if bBrowse then
    begin
        dmym.rsHospital.Edit;
        btnExtract.Enabled:=false;
        if trim(dmym.rsHospital['chk'])='a' then
           radiobutton1.Checked:=true;
        if trim(dmym.rsHospital['chk'])='b' then
        begin
           radiobutton2.Checked:=true;
           if (dmym.rsHospital['germname']<>'') and not varisnull(dmym.rsHospital['germname']) then
              checkbox1.Checked:=true;
        end;
        if trim(dmym.rsHospital['chk'])='c' then
           radiobutton3.Checked:=true;
        dbe_totalnum.Text:=adanum;
    end else
    begin
        if not dmym.rsHospital.Active then
           dmym.rsHospital.Active:=true;
        dmym.rsHospital.Append;
        btnprint.Enabled:=false;
        radiobutton1.Checked:=true;
        strlist:=Tstringlist.Create;
        strlist.Clear;

        db.getSection(strlist);
        dbc_section.Items:=strlist;
        strlist.Clear;

        db.getRemark(strlist);
        DBcombobox5.Items:=strlist;
        strlist.Clear;

        db.getPinming(strlist);
        dbc_pinming.Items:=strlist;
        strlist.Clear;

        db.getCheckMan(strlist);
        dbc_samplingman.Items:=strlist;
        dbc_reporter.items.Add(usernamehfut);
        dbc_reporter.ItemIndex:=0;
        strlist.Clear;

        strlist.Free;
        dbc_shys.Items.Add(UserNameHfut);
        dbc_shys.Items.Add('');
        dbc_reporter.Enabled:=false;
        if timetype='now' then
        begin
            dmym.rsHospital['cydate']:=now;
            dmym.rsHospital['reportdate']:=now;
        end else
        begin
            dmym.rsHospital['cydate']:=date;
            dmym.rshospital['reportdate']:=date;
        end;
        dmym.rshospital['reporter']:=userNamehfut;
    end;
end;

procedure TYgtxy.btnsaveClick(Sender: TObject);
var stemp:string;
    db:dbhelper;
    bInTable:boolean;
begin
    if not(dmym.rsHospital.state=dsedit) then
    dmym.rsHospital.Edit;
    if trim(dbe_specnum.text)='' then
    begin
        showmessage('请输入标本号!');
        dbe_specnum.SetFocus;
        exit;
    end;
    if trim(dbc_type.text)='' then
    begin
        showmessage('请选择商品类型!');
        dbc_type.SetFocus;
        exit;
    end;

    if radiobutton1.Checked then
    begin
        dmym.rsHospital['anum']:='';
        dmym.rsHospital['germname']:='';
        dmym.rsHospital['memo']:='';
        dmym.rsHospital['chk']:='a';
        dmym.rsHospital['mem']:='无细菌生长';
        ygbbjc.Text:='合格';
    end;
    if radiobutton2.Checked then
    begin
        dmym.rsHospital['hhour']:='';
        dmym.rsHospital['memo']:='';
        dmym.rsHospital['chk']:='b';
        if dbc_type.Text='入口液' then
            if strtoint(dbe_totalnum.text)<=100 then
                ygbbjc.Text:='合格'
            else ygbbjc.Text:='不合格';
        if dbc_type.Text='出口液' then
            if strtoint(dbe_totalnum.text)<=2000 then
                ygbbjc.Text:='合格'
            else ygbbjc.Text:='不合格';
        if dbc_type.Text='反渗水' then
            if strtoint(dbe_totalnum.text)<=200 then
                ygbbjc.Text:='合格'
            else ygbbjc.Text:='不合格';
        if dbc_type.Text='透析用水' then
            if strtoint(dbe_totalnum.text)<=200 then
                ygbbjc.Text:='合格'
            else ygbbjc.Text:='不合格';
        if dbc_type.Text='透析A液' then
            if strtoint(dbe_totalnum.text)<=0 then
                ygbbjc.Text:='合格'
            else ygbbjc.Text:='不合格';
        if dbc_type.Text='透析B液' then
            if strtoint(dbe_totalnum.text)<=200 then
                ygbbjc.Text:='合格'
            else ygbbjc.Text:='不合格';
        if dbc_type.Text='B干粉' then
            if strtoint(dbe_totalnum.text)<=0 then
                ygbbjc.Text:='合格'
            else ygbbjc.Text:='不合格';
        if dbc_type.Text='配液桶' then
            if strtoint(dbe_totalnum.text)<=5 then
                ygbbjc.Text:='合格'
            else ygbbjc.Text:='不合格';
        dmym.rsHospital['mem']:=dbe_totalnum.Text;
    end;
    if radiobutton3.Checked then
    begin
        dmym.rsHospital['hhour']:='';
        dmym.rsHospital['germname']:='';
        dmym.rsHospital['anum']:='';
        dmym.rsHospital['chk']:='c';
        stemp:=db.extractnum(DBcombobox5.text);
        if stemp='' then
        begin
            ygbbjc.Text:='合格';
            dmym.rsHospital['mem']:='无细菌生长';
        end else
        begin
        dmym.rsHospital['mem']:=stemp;
        if dbc_type.text='入口液' then
            if strtoint(stemp)<=100 then
                ygbbjc.Text:='合格'
            else
                ygbbjc.Text:='不合格';
        if dbc_type.Text='出口液' then
            if strtoint(stemp)<=2000 then
                ygbbjc.Text:='合格'
            else ygbbjc.Text:='不合格';
        if dbc_type.text='反渗水' then
            if strtoint(stemp)<=200 then
                ygbbjc.Text:='合格'
            else ygbbjc.Text:='不合格';
        if dbc_type.text='透析用水' then
            if strtoint(stemp)<=200 then
                ygbbjc.Text:='合格'
            else ygbbjc.Text:='不合格';
        if dbc_type.text='透析A液' then
            if strtoint(stemp)<=0 then
                ygbbjc.Text:='合格'
            else ygbbjc.Text:='不合格';
        if dbc_type.Text='透析B液' then
            if strtoint(dbe_totalnum.text)<=200 then
                ygbbjc.Text:='合格'
            else ygbbjc.Text:='不合格';
        if dbc_type.Text='B干粉' then
            if strtoint(dbe_totalnum.text)<=0 then
                ygbbjc.Text:='合格'
            else ygbbjc.Text:='不合格';
        if dbc_type.Text='配液桶' then
            if strtoint(dbe_totalnum.text)<=5 then
                ygbbjc.Text:='合格'
            else ygbbjc.Text:='不合格';
        end;
    end;

    bInTable:=false;
    try
    dmym.conn.BeginTrans;
    begin
        with dmym.rsRegYg do
        begin
             active:=true;
             bInTable:=locate('id',id,[locaseinsensitive]);
             if bInTable then
                delete;
             active:=false;
        end;
        dmym.rsHospital['cylb']:='透析液';
        dmym.rsHospital.Post;
        dmym.conn.CommitTrans;
        showmessage('记录保存成功!');
    end;
    except
        dmym.conn.RollbackTrans;
        showmessage('系统出错!');
    end;
    btnprint.Enabled:=true;
    btnsave.Enabled:=false;
    saved:=true;
end;

procedure TYgtxy.dbc_typeChange(Sender: TObject);
begin
    if dbc_type.text='入口液' then
        ygbbgb.Text:='≤100cfu/ml'
    else if dbc_type.Text='出口液' then
        ygbbgb.Text:='≤2000cfu/ml'
    else if dbc_type.text='反渗水' then
        ygbbgb.Text:='≤200cfu/ml'
    else if dbc_type.text='透析用水' then
        ygbbgb.text:='≤200cfu/ml'
    else if dbc_type.text='透析A液' then
        ygbbgb.Text:='无细菌生长'
    else if dbc_type.text='透析B液' then
        ygbbgb.Text:='≤200cfu/ml'
    else if dbc_type.text='B干粉' then
        ygbbgb.Text:='无细菌生长'
    else if dbc_type.text='配液桶' then
        ygbbgb.Text:='≤5cfu/cm^2';
end;

procedure TYgtxy.print;
var resultstr:string;
begin
    resultstr:='';
    rvproject1.Open;
    if radiobutton1.Checked then
        resultstr:='经培养'+dbe_hours.text+'小时后，无细菌生长';
    if radiobutton2.Checked then
        begin
            resultstr:='菌落总数：'+dbe_totalnum.Text+'CFU/ml';
            if checkbox1.Checked then
            begin
                resultstr:=resultstr+#13#10;
                resultstr:=resultstr+'细菌名：'+dbe_gname.Text;
            end;
        end;
    if radiobutton3.Checked then
        resultstr:=DBcombobox5.Text;
    rvproject1.SetParam('specnum',dbe_specnum.text);
    RvProject1.SetParam('titlestr',hospitalname+'环境卫生学监测报告单');
    RvProject1.SetParam('resultstr',resultstr);
    RvProject1.ExecuteReport('report_Ygtxy');
    RvProject1.Close;
end;

procedure TYgtxy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if (dmym.rsHospital.state=dsedit) or (dmym.rshospital.state=dsinsert) then
        dmym.rsHospital.Cancel;
        action:=cafree;
    with dmym.query1 do // 程序中根据国家标准的判定结果存储时发生意外改变。以下代码
                        //直接用刚存储的数据。。从数据库中读出数据进行判定。然后写入数据库判定结果
    begin
        close;
        sql.Clear;
        sql.Add('select * from hospital where cylb=''透析液''');
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
                if fieldvalues['sptype']='入口液' then
                begin
                    if strtoint(fieldvalues['mem'])<=100 then
                        fieldvalues['YGBBJC']:='合格'
                    else
                        fieldvalues['YGBBJC']:='不合格';
                end  else
                if fieldvalues['sptype']='出口液' then
                begin
                    if strtoint(fieldvalues['mem'])<=2000 then
                        fieldvalues['YGBBJC']:='合格'
                    else
                        fieldvalues['YGBBJC']:='不合格';
                end  else
                if fieldvalues['sptype']='反渗水' then
                begin
                    if strtoint(fieldvalues['mem'])<=200 then
                        fieldvalues['YGBBJC']:='合格'
                    else
                        fieldvalues['YGBBJC']:='不合格';
                end  else
                if fieldvalues['sptype']='透析用水' then
                begin
                    if strtoint(fieldvalues['mem'])<=200 then
                        fieldvalues['YGBBJC']:='合格'
                    else
                        fieldvalues['YGBBJC']:='不合格';
                end else
                if fieldvalues['sptype']='透析A液' then
                begin
                    if strtoint(fieldvalues['mem'])<=0 then
                        fieldvalues['YGBBJC']:='合格'
                    else
                        fieldvalues['YGBBJC']:='不合格';
                end;
                if dbc_type.Text='透析B液' then
                begin
                    if strtoint(dbe_totalnum.text)<=200 then
                        ygbbjc.Text:='合格'
                    else ygbbjc.Text:='不合格';
                end else
                if dbc_type.Text='B干粉' then
                begin
                    if strtoint(dbe_totalnum.text)<=0 then
                        ygbbjc.Text:='合格'
                    else ygbbjc.Text:='不合格';
                end else
                if dbc_type.Text='配液桶' then
                begin
                      if strtoint(dbe_totalnum.text)<=5 then
                            ygbbjc.Text:='合格'
                      else ygbbjc.Text:='不合格';
                end;
                post;
                next;
            end;
        end;
        end;
    end;
end;

procedure TYgtxy.dbe_specnumClick(Sender: TObject);
begin
    dmym.rsHospital.Active:=true;
    dmym.rsHospital.Edit;
    db:=dbhelper.Create;
    //db.getYGbbh;
    //dbe_specnum.Text:=inttostr(db.YGMaxbbh1);
end;

procedure TYgtxy.dbe_specnumKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
        dbc_section.SetFocus;
end;

procedure TYgtxy.dbc_sectionKeyPress(Sender: TObject; var Key: Char);
var SQLtext,secid:string;
    rnum:integer;
begin
    IF KEY=#13 THEN
    begin
       SQLText:='';
    if dbc_Section.Text='' then
      begin
      showmessage('**请选择或输入科别**');
      exit;
      end;
    if dbc_Section.Text<>'' then
      begin
         SQLText:='select * from secname';
         secid:=dbc_Section.Text;
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
           dbc_Section.Text:=ZFX_YX.FieldValues['secname'] ;
         end;
      end;
    dbc_pinming.SetFocus;
    end;
end;

procedure TYgtxy.dbc_pinmingKeyPress(Sender: TObject; var Key: Char);
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

procedure TYgtxy.dbe_brandKeyPress(Sender: TObject; var Key: Char);
begin
      if key=#13 then
          dbe_ph.SetFocus;
end;

procedure TYgtxy.dbe_phKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    dbc_type.SetFocus;
end;

procedure TYgtxy.dbc_typeKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
       if dbc_type.text='' then
       showmessage('请选择商品类型！');
       if dbc_type.text<>'' then
       try
          dbc_type.Text:=dbc_type.Items.Strings[strtoint(dbc_type.text)-1]
       except
       end;
       dbc_samplingman.SetFocus;
    end;
end;

procedure TYgtxy.dbc_samplingmanKeyPress(Sender: TObject; var Key: Char);
var SQLtext,ID:string;
    rnum:integer;
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

procedure TYgtxy.btnextractClick(Sender: TObject);
var afrm:TRegYgtxyform;
begin
    afrm:=TRegYgtxyform.Create(self);
    afrm.bExtract:=true;
    afrm.ShowModal;
    if afrm.extracted then
    begin
        id:=afrm.id;
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

        if fieldbyname('sptype').asstring='入口液' then
            ygbbgb.Text:='≤100cfu/ml'
        else if fieldbyname('sptype').asstring='出口液' then
            ygbbgb.Text:='≤2000cfu/ml'
        else if fieldbyname('sptype').asstring='反渗水' then
            ygbbgb.Text:='≤200cfu/ml'
        else if fieldbyname('sptype').asstring='透析用水' then
            ygbbgb.text:='≤200cfu/ml'
        else if fieldbyname('sptype').asstring='透析A液' then
            ygbbgb.Text:='无细菌生长'
        else if fieldbyname('sptype').asstring='透析B液' then
            ygbbgb.Text:='≤200cfu/ml'
        else if fieldbyname('sptype').asstring='B干粉' then
            ygbbgb.Text:='无细菌生长'
        else if fieldbyname('sptype').asstring='配液桶' then
            ygbbgb.Text:='≤5cfu/cm^2';
        end;
   end;
end;

procedure TYgtxy.CheckBox1Click(Sender: TObject);
begin
    dbe_gname.Enabled:=checkbox1.Checked;end;

procedure TYgtxy.CheckBox1KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if not CheckBox1.Checked then
            CheckBox1.Checked:=true
        else
            CheckBox1.Checked:=false;
    end;
end;

procedure TYgtxy.DBComboBox5KeyPress(Sender: TObject; var Key: Char);
  var id:string;
begin
  if key=#13 then
  begin
   SQLText:='';
   if DBcombobox5.Text='' then
      begin
      showmessage('**请选择送检备注**');
      exit;
      end;
   if DBcombobox5.Text<>'' then
      begin
         SQLText:='select * from yyremark';
         id:=DBcombobox5.Text;
         with ZFX_YX do
         begin
         close;
         sql.clear;
         sql.add(SQLText);
         sql.add('where id=:id');
         parameters.parambyname('id').value:=id;
         open;
         if ZFX_YX.RecordCount>0 then
         DBcombobox5.Text:=ZFX_YX.FieldValues['remark'];
         end;
      end;
   end;
end;

procedure TYgtxy.Button1Click(Sender: TObject);
var dataclass:dbhelper;
begin
    dataclass:=dbhelper.Create;
    dmym.rsHospital['specNum']:=dataclass.generateNumber('hosno');
    dataclass.Free;
end;

procedure TYgtxy.ExportWord;
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
    wordtab.cell(2,2).range.insertafter('科室：'+dbc_section.text);
    wordtab.cell(2,3).range.insertafter('品名：'+dbc_pinming.Text);
    wordtab.cell(3,1).range.insertafter('采样类别：'+'透析液');
    wordtab.cell(3,2).range.insertafter('商标：'+dbe_brand.Text);
    wordtab.cell(3,3).range.insertafter('批号：'+dbe_ph.text);
    wordtab.cell(4,1).range.insertafter('商品类型：'+dbc_type.text);
    wordtab.cell(4,2).range.insertafter('采样者：'+dbc_samplingMan.text);
    wordtab.cell(4,3).range.insertafter('采样日期：'+dbe_cydate.text);
    wordtab.rows.item(5).delete;
    resultstr:='';
    if  radiobutton1.Checked then
    if  dbe_hours.Text=''then
      resultstr:=''
    else
      resultstr:='经培养'+dbe_hours.Text+'小时后，分析无细菌生长';
    if   radiobutton2.Checked then
    begin
      resultstr:='菌落总数：'+dbe_totalNum.Text+'CFU/ml';
      if checkbox1.Checked then
      begin
        resultstr:=resultstr+''#13#10;
        resultstr:=resultstr+'细菌名:'+dbe_gname.Text;
      end;
    end;
    if RadioButton3.Checked then
      resultstr:=DBcombobox5.Text;
    wordtab.cell(5,1).range.insertafter(resultstr);
    //导出审核者，送检者
    wordtab.cell(6,1).range.insertafter(dbc_reporter.Text);
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

procedure TYgtxy.btnprintClick(Sender: TObject);
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
    Sendmessage(findwindow('TYgtxy',nil),WM_SYSCOMMAND,SC_CLOSE,0);
end;

end.
