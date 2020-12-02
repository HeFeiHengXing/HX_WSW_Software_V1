unit NegativeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons, db, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, rvproj, rvclass, rvcsstd, rvcsrpt, ADODB, RVCSdraw,
  inifiles, strutils, comobj;

type
  TNegativeForm = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label13: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    btnPrint: TBitBtn;
    BitBtn2: TBitBtn;
    dbe_specnum: TDBEdit;
    dbe_name: TDBEdit;
    dbc_Section: TDBComboBox;
    dbcBBtype: TDBComboBox;
    dbe_age: TDBEdit;
    dbe_bed: TDBEdit;
    dbc_sex: TDBComboBox;
    dbe_custNo: TDBEdit;
    dbe_checkDate: TDBEdit;
    dbe_reportDate: TDBEdit;
    dbcbg: TDBComboBox;
    dbcsh: TDBComboBox;
    BitBtn3: TBitBtn;
    btn_listNumber: TButton;
    dbc_checkDoctor: TDBComboBox;
    dbc_checkGoal: TDBComboBox;
    dbe_lczd1: TDBEdit;
    edtTime: TEdit;
    chkNormal: TCheckBox;
    edtNormal: TEdit;
    chkFailed: TCheckBox;
    edtFailed: TEdit;
    chkGrowth: TCheckBox;
    edtGrowth: TEdit;
    chkNoGrowCause: TCheckBox;
    chkNoGrowth: TCheckBox;
    chkMicroscope: TCheckBox;
    cbMicroscope: TComboBox;
    chkNoOutput: TCheckBox;
    edtOutput: TEdit;
    chkOutput: TCheckBox;
    edtNoOutput: TEdit;
    Memo1: TMemo;
    cbTime: TComboBox;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    rvNegative: TRvDataSetConnection;
    DBCRemark1: TDBComboBox;
    ZFX_YX: TADOQuery;
    ChkRemark: TCheckBox;
    DBCRemark: TComboBox;
    dbe_lczd: TDBComboBox;
    DBComboBox1: TDBComboBox;
    CheckBox1: TCheckBox;
    BtnHistory: TButton;
    Button1: TButton;
    procedure btn_listNumberClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbe_specnumKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_nameKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_sexKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_ageKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_custNoKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_bedKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_SectionKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_checkDateKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_checkDoctorKeyPress(Sender: TObject; var Key: Char);
    procedure dbc_checkGoalKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_lczdKeyPress(Sender: TObject; var Key: Char);
    procedure dbcbgKeyPress(Sender: TObject; var Key: Char);
    procedure dbcshKeyPress(Sender: TObject; var Key: Char);
    procedure edtTimeKeyPress(Sender: TObject; var Key: Char);
    procedure cbTimeKeyPress(Sender: TObject; var Key: Char);
    procedure edtNormalKeyPress(Sender: TObject; var Key: Char);
    procedure edtFailedKeyPress(Sender: TObject; var Key: Char);
    procedure edtGrowthKeyPress(Sender: TObject; var Key: Char);
    procedure cbMicroscopeKeyPress(Sender: TObject; var Key: Char);
    procedure edtNoOutputKeyPress(Sender: TObject; var Key: Char);
    procedure edtOutputKeyPress(Sender: TObject; var Key: Char);
    procedure DBCRemark1KeyPress(Sender: TObject; var Key: Char);
    procedure dbcBBtypeKeyPress(Sender: TObject; var Key: Char);
    procedure ChkRemarkClick(Sender: TObject);
    procedure DBCRemarkKeyPress(Sender: TObject; var Key: Char);
    procedure dbe_specnumClick(Sender: TObject);
    procedure chkNormalClick(Sender: TObject);
    procedure chkFailedClick(Sender: TObject);
    procedure chkGrowthClick(Sender: TObject);
    procedure chkMicroscopeClick(Sender: TObject);
    procedure chkNoOutputClick(Sender: TObject);
    procedure chkOutputClick(Sender: TObject);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    procedure BtnHistoryClick(Sender: TObject);
    procedure chkNormalKeyPress(Sender: TObject; var Key: Char);
    procedure chkFailedKeyPress(Sender: TObject; var Key: Char);
    procedure chkGrowthKeyPress(Sender: TObject; var Key: Char);
    procedure chkNoGrowCauseKeyPress(Sender: TObject; var Key: Char);
    procedure chkNoGrowthKeyPress(Sender: TObject; var Key: Char);
    procedure chkMicroscopeKeyPress(Sender: TObject; var Key: Char);
    procedure chkNoOutputKeyPress(Sender: TObject; var Key: Char);
    procedure chkOutputKeyPress(Sender: TObject; var Key: Char);
    procedure ChkRemarkKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    //procedure dbe_lczdClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    SQLText: string;
    bOldPatient: boolean;
    edtMic: tedit;
    saved: boolean;
    procedure initResults;
    procedure Print;
    procedure ExportWord;
  end;

var
  NegativeForm: TNegativeForm;

implementation

uses dbym, ymDataType, regBBfrm, common, loginfrm, LSDZFrm, sreport, flash;

{$R *.dfm}

procedure TNegativeForm.btn_listNumberClick(Sender: TObject);
var
  rfrm: tregbbForm;
begin
  rfrm := TRegbbForm.create(self);
  rfrm.bExtract := true;
  rfrm.showmodal;
  if rfrm.extracted then
  begin
    with dmym.exquery do
    begin
      dbe_specnum.Text := fieldbyname('bbh').asstring;
            //dbc_Section.Text:=fieldbyname('kb').asstring;
      dmym.rsBase['kb'] := fieldbyname('kb').asstring;
            //dbe_age.text:=fieldbyname('old').asstring;
            //dmym.rsBase['old']:=fieldbyname('old').asstring;
      dmym.rsBase['old'] := fieldbyname('old').asstring;
            //DBC_age.Text:=Fieldbyname('age').AsString;/////////////////////////
      dmym.rsBase['age'] := fieldbyname('age').asstring;
            //dbe_name.text:=fieldbyname('name').asstring;
      dmym.rsBase['name'] := fieldbyname('name').asstring;
            //dbc_sex.text:=fieldbyname('sex').asstring;
      dmym.rsBase['sex'] := fieldbyname('sex').asstring;
            //dbe_zyh.text:=fieldbyname('zyh').asstring;
      dmym.rsBase['zyh'] := fieldbyname('zyh').asstring;
            //dbe_bed.text:=fieldbyname('bed').asstring;
      dmym.rsBase['bed'] := fieldbyname('bed').asstring;
            //dbe_cyDate.text:=fieldbyname('cyDate').asstring;
      dmym.rsBase['cyDate'] := fieldbyname('cyDate').asstring;
            //dbc_bb.text:=fieldbyname('bb').asstring;
      dmym.rsBase['bb'] := fieldbyname('bb').asstring;
            //dbc_sj.Text:=fieldbyname('sj').asstring;
      dmym.rsBase['sj'] := fieldbyname('sj').asstring;
            //dbc_sjmd.text:=fieldbyname('sjmd').asstring;
      dmym.rsBase['sjmd'] := fieldbyname('sjmd').asstring;
            //dbe_lczd.Text:=fieldbyname('lczd').asstring;
      dmym.rsBase['lczd'] := fieldbyname('lczd').asstring;
            //dbc_reporter.Text:=fieldbyname('bgys').asstring;
      dmym.rsBase['bgys'] := fieldbyname('bgys').asstring;
            //dbc_shys.Text:=fieldbyname('shys').asstring;
      dmym.rsBase['shys'] := fieldbyname('shys').asstring;
      dmym.rsBase['bgys'] := userNamehfut;
    end;
  end;
  if not (dmym.rsbase.State = dsInsert) then
    dmym.rsbase.Append;
      //dmym.rsbase.Post;
end;

procedure TNegativeForm.BitBtn2Click(Sender: TObject);
var
  bInTable: boolean;
  useid: integer;
  str, str2: string;
begin
  if dbe_specnum.Text = '' then
  begin
    MessageDlg('������걾��!', mtInformation, [mbOk], 0);
    exit;
  end else
  begin
    bInTable := false;
   //ɾ��reghospital��ĸ�����¼
  // bInTable:=false;
    dmym.conn.BeginTrans;
    try
      begin
        with dmym.rsRegbb do
        begin
          active := true;
          bIntable := locate('bbh', dbe_specNum.text, [loCaseInsensitive]);
          if bintable then
            delete;
          active := false;
        end;
        dmym.rsBase.Edit; //////////////////////////////////////////////
        dmym.rsBase['type'] := '���Ա���';
        dmym.rsBase.Post;
        useid := dmym.rsBase['useid'];
  //insert into yx table
        with dmym.conn do
        begin
          if bOldpatient then
            if MessageDlg(#13 + #10'�������޸ģ��Ƿ��滻?', mtConfirmation, [mbyes, mbno], 0) = mryes then
              execute('delete * from yx where useid=' + inttostr(useid) + '') else
              exit;
      //str:= repdate.Text;
      //execute('insert into yx(useid,chk,result,bcsm,type,sjmd,repdate) values('+inttostr(useid)+',"1","'+str+'","'+memo1.text+'","-","'+dbc_checkGoal.Text+'")');
          str := edttime.Text + cbtime.Text;
          execute('insert into yx(useid,chk,result,bcsm,type,sjmd,repdate) values(' + inttostr(useid) + ',"1","' + str + '","' + memo1.text + '","-","' + dbc_checkGoal.Text + '","' + dbe_reportDate.text + '")');
          str := bool2str(chkNormal.Checked);
          execute('insert into yx(useid,chk,result,bcsm,type,sjmd,repdate) values(' + inttostr(useid) + ',"' + str + '","' + edtNormal.text + '","' + memo1.text + '","-","' + dbc_checkGoal.Text + '","' + dbe_reportDate.text + '")');
          str := bool2str(chkFailed.Checked);
          execute('insert into yx(useid,chk,result,bcsm,type,sjmd,repdate) values(' + inttostr(useid) + ',"' + str + '","' + edtFailed.text + '","' + memo1.text + '","-","' + dbc_checkGoal.Text + '","' + dbe_reportDate.text + '")');
          str := bool2str(chkGrowth.Checked);
          execute('insert into yx(useid,chk,result,bcsm,type,sjmd,repdate) values(' + inttostr(useid) + ',"' + str + '","' + edtGrowth.text + '","' + memo1.text + '","-","' + dbc_checkGoal.Text + '","' + dbe_reportDate.text + '")');
          str := bool2str(chkNoGrowCause.Checked);
          execute('insert into yx(useid,chk,result,bcsm,type,sjmd,repdate) values(' + inttostr(useid) + ',"' + str + '"," ","' + memo1.text + '","-","' + dbc_checkGoal.Text + '","' + dbe_reportDate.text + '")');
          str := bool2str(chkNoGrowth.Checked);
          execute('insert into yx(useid,chk,result,bcsm,type,sjmd,repdate) values(' + inttostr(useid) + ',"' + str + '"," ","' + memo1.text + '","-","' + dbc_checkGoal.Text + '","' + dbe_reportDate.text + '")');
          str := bool2str(chkMicroscope.Checked);
          str2 := '��' + cbMicroscope.Text + '����΢�����';
          execute('insert into yx(useid,chk,result,bcsm,type,sjmd,repdate) values(' + inttostr(useid) + ',"' + str + '","' + str2 + '","' + memo1.text + '","-","' + dbc_checkGoal.Text + '","' + dbe_reportDate.text + '")');
          str := bool2str(chkNoOutput.Checked);
          execute('insert into yx(useid,chk,result,bcsm,type,sjmd,repdate) values(' + inttostr(useid) + ',"' + str + '","' + edtNoOutput.text + '","' + memo1.text + '","-","' + dbc_checkGoal.Text + '","' + dbe_reportDate.text + '")');
          str := bool2str(chkOutput.Checked);
          execute('insert into yx(useid,chk,result,bcsm,type,sjmd,repdate) values(' + inttostr(useid) + ',"' + str + '","' + edtOutput.text + '","' + memo1.text + '","-","' + dbc_checkGoal.Text + '","' + dbe_reportDate.text + '")');
          str := bool2str(ChkRemark.Checked);
          execute('insert into yx(useid,chk,result,bcsm,type,sjmd,repdate) values(' + inttostr(useid) + ',"' + str + '","' + DBCRemark.Text + '","' + memo1.text + '","-","' + dbc_checkGoal.Text + '","' + dbe_reportDate.text + '")');
          str := bool2str(CheckBox1.Checked);
          execute('insert into yx(useid,chk,result,bcsm,type,sjmd,repdate) values(' + inttostr(useid) + ',"' + str + '","' + DBCRemark.Text + '","' + memo1.text + '","-","' + dbc_checkGoal.Text + '","' + dbe_reportDate.text + '")');
        end;
        dmym.conn.commitTrans;
        MessageDlg('��¼����ɹ�!', mtInformation, [mbOk], 0);
        saved := true;
      //btnPrint.Enabled:=true;
      end;
    except
      dmym.conn.rollbacktrans;
    end;
  end;
  btnprint.Enabled := true;
  btn_listnumber.Enabled := false;
  dbe_specNum.Enabled := false;
  bitbtn2.Enabled := false;
end;

procedure TNegativeForm.FormShow(Sender: TObject);
var
  strl: tstringlist;
  dh: dbhelper;
begin
  if not dmym.rsbase.Active then
  begin
    dmym.rsbase.Active := true;
  end;
  dmym.rsbase.Edit;
  strl := tstringlist.Create;
  dh.getSection(strl);
  dbc_Section.items := strl;

  strl.Clear;
  dh.getCheckman(strl);
  dbcbg.items := strl;
    { strl.Clear;
    dh.getCheckman(strl);
    dbcbg.items:=strl;
    //dbc_checkDoctor.items:=strl;
    dbcsh.Items:=strl;}
  dbcsh.Items.Add(userNamehfut);
  dbcsh.Items.Add('');

  strl.Clear;
  dh.getSjMan(strl);
  dbc_checkDoctor.Items := strl;

  strl.Clear;
  dh.getBBType(strl);
  dbcBBtype.items := strl;

  strl.Clear;
  dh.getRemark(strl);
  DBCRemark.Items := strl;

  strl.Clear;
  dh.getLczd(strl);
  dbe_lczd.Items := strl;

  strl.clear;
  dh.getSjmd(strl);
  dbc_checkgoal.Items := strl;

  strl.Free;

  dbcbg.Enabled := false;

  if bOldPatient = false then
  begin
    btnPrint.Enabled := false;
    DBCRemark.Enabled := false; /////////////////////////////////////////////////
    dmym.rsbase.Append;
    if timetype = 'now' then
    begin
      dmym.rsbase['repdate'] := now;
      dmym.rsBase['cydate'] := now;
    end else
    begin
      dmym.rsbase['repdate'] := date;
      dmym.rsBase['cydate'] := date;
    end;
    dmym.rsBase['age'] := '��';
    dmym.rsBase['sjmd'] := 'ϸ��������ҩ��';
    dmym.rsbase['bgys'] := userNamehfut;
//  strl.Free;
  end else
    initresults;
end;

procedure TNegativeForm.BitBtn3Click(Sender: TObject);
begin
  if saved = true then
  begin
    dmym.rsBase.Active := false;
    close;
  end else
    if messagebox(handle, '�����δ����,�Ƿ��˳�?', '��ʾ!', mb_yesno) = idyes then
      close
    else exit;
end;

procedure TNegativeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dmym.rsBase.Active then
    dmym.rsBase.Active := false;
  action := cafree;
end;

procedure TNegativeForm.Print;
var
  resultstr: string;
  CommentText: string;
  Text, SubText: string;
  mypage: tRavePage;
  myregion: traveregion;
  bandcomment, bandend: traveband;
  text15, text16: tRaveText;
  myini: Tinifile;
begin
  resultstr := '';
  rvproject1.Open;
   //��ӡ��ʾ
  with rvproject1.ProjMan do
  begin
    mypage := findRaveComponent('report10.mainpage', nil) as tRavePage;
    myregion := FindraveComponent('region1', mypage) as traveregion;
    bandcomment := findravecomponent('band2', mypage) as traveband;
    bandend := findravecomponent('band3', mypage) as traveband;
  end;
    { if edtTime.Text=null then
      begin
       text15.Visible:=false;
       text16.Visible:=false;
      end; else
      begin
       text15.Visible:=true;
       text16.Visible:=true;
      end;  }
  if chkNormal.Checked then
    resultstr := resultstr + '���������Ⱥ' + edtnormal.Text + ''#13#10;
  if chkFailed.Checked then
    resultstr := resultstr + 'δ���' + edtFailed.Text + #13#10;
  if chkGrowth.Checked then
    resultstr := resultstr + edtgrowth.Text + '(������Ⱥ),����������'#13#10;
  if chkNoGrowCause.Checked then
    resultstr := resultstr + '���²�������'#13#10;
  if chkNoGrowth.Checked then
    resultstr := resultstr + '��ϸ������'#13#10;
  if chkMicroscope.Checked then
    if bOldPatient then
      resultstr := resultstr + edtmic.Text + ''#13#10
    else
      resultstr := resultstr + '���� ' + cbmicroscope.Text + ' ����΢�����'#13#10;
  if chkoutput.Checked then
    resultstr := resultstr + '���' + edtoutput.Text + #13#10;
  if chknooutput.checked then
    resultstr := resultstr + 'δ���' + edtnooutput.Text + #13#10;
  if chkremark.Checked then
    resultstr := resultstr + DBCremark.Text;
  if CheckBox1.checked then
  begin
    CommentText := '';
    Text := Memo1.Text;
    while length(Text) > 0 do
    begin
      SubText := midstr(Text, 1, 30);
      CommentText := CommentText + SubText + #13#10;
      Text := Copy(Text, length(SubText) + 1, length(Text) - length(SubText));
    end;
    rvProject1.SetParam('comment', '����������:' + #13#10 + CommentText);
  end;
  rvproject1.SetParam('titlestr', hospitalname + '΢�����ⱨ�浥');
  if edttime.Text = '' then
  begin
    rvProject1.SetParam('time', '');
    rvProject1.SetParam('jpy', ' ');
    rvProject1.SetParam('yhfx', ' ');
    rvProject1.SetParam('timetype', ' ');
  end else
  begin
    rvProject1.SetParam('time', edttime.Text);
    rvProject1.SetParam('jpy', '������');
    rvProject1.SetParam('hfx', '�Ժ��������');
    rvProject1.SetParam('timetype', cbtime.Text);
  end;
  rvProject1.SetParam('bbh', dbe_specnum.text);
  rvProject1.SetParam('resultstr', resultstr);
   (*���Ҵ�ӡ��Ϣ����*)
  myini := Tinifile.Create(Extractfiledir(Application.ExeName) + '\dw.ini');
  rvproject1.SetParam('Remark', myini.ReadString('DepartMent', 'Information', ''));
  myini.Free;
   //
  rvproject1.ExecuteReport('report10');
  rvproject1.Close;
  btnPrint.Enabled := true;
  bitbtn3.Click;
end;

procedure TNegativeForm.FormCreate(Sender: TObject);
begin
  rvproject1.ProjectFile := rvfile;
  saved := false;
  //��ʼ���Ա�����
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('Select sex from ZFX_XB order by sex');
    open;
    if recordCount > 0 then
    begin
      while not eof do
      begin
        dbc_sex.Items.Add(fieldbyname('sex').asstring);
        next;
      end;
    end;
  end;
end;

procedure tNegativeForm.initResults;
var
  i, id: integer;
  str: string;
begin
  id := dmym.rsBase['useid'];
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.Add('select * from yx where useid=:id order by alist');
    parameters.ParamByName('id').Value := id;
    open;
    first;
    i := 0;
    while not eof do
    begin
      if i = 0 then
      begin
        str := fieldvalues['result'];
        cbtime.Visible := false;
        edttime.Text := str;
        edttime.Enabled := true;
        label23.Left := cbtime.Left;
      end;

      if i = 1 then
      begin
        if fieldvalues['chk'] = '1' then
          chkNormal.Checked := true
        else
          chkNormal.Checked := false;
        str := fieldvalues['result'];
        edtNormal.Text := str;
        edtnormal.Enabled := true;
        chkNormal.Enabled := true;
      end;
      if i = 2 then
      begin
        if fieldvalues['chk'] = '1' then
          chkfailed.Checked := true
        else
          chkfailed.Checked := false;
        str := fieldvalues['result'];
        edtfailed.Text := str;
        chkfailed.Enabled := true;
        edtfailed.Enabled := true;
      end;
      if i = 3 then
      begin
        if fieldvalues['chk'] = '1' then
          chkGrowth.Checked := true
        else
          chkGrowth.Checked := false;
        str := fieldvalues['result'];
        edtGrowth.Text := str;
        chkGrowth.Enabled := true;
        edtGrowth.Enabled := true;
      end;
      if i = 4 then
      begin
        if fieldvalues['chk'] = '1' then
          chkNoGrowCause.Checked := true
        else
          chkNoGrowCause.Checked := false;
        chkNoGrowCause.Enabled := true;
      end;
      if i = 5 then
      begin
        if fieldvalues['chk'] = '1' then
          chkNoGrowth.Checked := true
        else
          chkNoGrowth.Checked := false;
        chkNoGrowth.Enabled := true;
      end;
      if i = 6 then
      begin
        if fieldvalues['chk'] = '1' then
          chkMicroscope.Checked := true
        else
          chkMicroscope.Checked := false;
        str := fieldvalues['result'];
        cbMicroscope.Visible := false;
        label27.Visible := false;
        edtMic := tedit.Create(self);
        edtmic.Parent := self;
        edtmic.Left := cbMicroscope.Left;
        edtmic.Top := cbMicroscope.Top;
        edtmic.Height := cbMicroscope.Height;
        edtmic.Width := cbMicroscope.Width + label27.Width;
        edtmic.Text := str;
        edtmic.Visible := true;
        edtmic.Enabled := true;
        chkMicroscope.Enabled := true;
      end;
      if i = 7 then
      begin
        if fieldvalues['chk'] = '1' then
          chkNoOutput.Checked := true
        else
          chkNoOutput.Checked := false;
        str := fieldvalues['result'];
        edtNooutput.Text := str;
        chkNoOutput.Enabled := true;
        edtNoOutput.Enabled := true;
      end;
      if i = 8 then
      begin
        if fieldvalues['chk'] = '1' then
          chkOutput.Checked := true
        else
          chkOutput.Checked := false;
        str := fieldvalues['result'];
        edtoutput.Text := str;
        chkOutput.Enabled := true;
        edtOutput.Enabled := true;
      end;
      if i = 9 then
      begin
        if fieldvalues['chk'] = '1' then
          ChkRemark.Checked := true else
          ChkRemark.Checked := false;
        str := fieldvalues['result'];
        DBCRemark.Text := str;
      end;
      if i = 10 then
      begin
        if fieldvalues['chk'] = '1' then
          CheckBox1.Checked := true else
          CheckBox1.Checked := false;
        str := fieldvalues['bcsm'];
        Memo1.Text := str;
      end;
      inc(i);
      next;
    end;
  end;
  bitbtn2.Enabled := true;

end;

procedure TNegativeForm.dbe_specnumKeyPress(Sender: TObject;
  var Key: Char);
begin
  if KEY = #13 then
    dbe_name.SetFocus;
end;

procedure TNegativeForm.dbe_nameKeyPress(Sender: TObject; var Key: Char);
begin
  if KEY = #13 then
    dbc_sex.SetFocus;
end;

procedure TNegativeForm.dbc_sexKeyPress(Sender: TObject; var Key: Char);
var ID: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbc_sex.Text <> '' then
    begin
      SQLText := 'select * from ZFX_XB';
      ID := dbc_sex.Text;
      with ZFX_YX do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ID=:ID');
        parameters.parambyname('ID').value := ID;
        open;
        if ZFX_YX.RecordCount > 0 then
          dbc_sex.Text := ZFX_YX.FieldValues['sex'];
      end;
    end;
    dbe_age.setfocus;
  end;
end;


procedure TNegativeForm.dbe_ageKeyPress(Sender: TObject; var Key: Char);
begin
  if KEY = #13 then
    DBComboBox1.SetFocus;
end;

procedure TNegativeForm.dbe_custNoKeyPress(Sender: TObject; var Key: Char);
begin
  if KEY = #13 then
    dbe_bed.SetFocus;
end;

procedure TNegativeForm.dbe_bedKeyPress(Sender: TObject; var Key: Char);
begin
  if KEY = #13 then
    dbc_Section.SetFocus;
end;

procedure TNegativeForm.dbc_SectionKeyPress(Sender: TObject;
  var Key: Char);
var secid: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbc_section.Text <> '' then
    begin
      SQLText := 'select * from secname';
      secid := dbc_section.Text;
      with ZFX_YX do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where secid=:secid');
        parameters.parambyname('secid').value := secid;
        open;
        if ZFX_YX.RecordCount > 0 then
          dbc_section.Text := ZFX_YX.FieldValues['secname'];
      end;
    end;
    dbcBBtype.setfocus;
  end;
end;

procedure TNegativeForm.dbe_checkDateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if KEY = #13 then
    dbc_checkDoctor.SetFocus;
end;

procedure TNegativeForm.dbc_checkDoctorKeyPress(Sender: TObject;
  var Key: Char);
var ID: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbc_checkDoctor.Text <> '' then
    begin
      SQLText := 'select * from sjys';
      ID := dbc_checkDoctor.Text;
      with ZFX_YX do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ID=:ID');
        parameters.parambyname('ID').value := ID;
        open;
        if ZFX_YX.RecordCount > 0 then
          dbc_checkDoctor.Text := ZFX_YX.FieldValues['Name'];
      end;
    end;
    dbc_checkGoal.SetFocus;
  end;
end;


procedure TNegativeForm.dbc_checkGoalKeyPress(Sender: TObject;
  var Key: Char);
var ZT_sjmdID: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbc_checkGoal.Text <> '' then
    begin
      SQLText := 'select * from ZT_SJ';
      ZT_sjmdID := dbc_checkGoal.Text;
      with ZFX_YX do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ZT_sjmdID=:ZT_sjmdID');
        parameters.parambyname('ZT_sjmdID').value := ZT_sjmdID;
        open;
        if ZFX_YX.RecordCount > 0 then
          dbc_checkGoal.Text := ZFX_YX.FieldValues['ZT_sjmd'];
      end;
    end;
    dbe_lczd.SetFocus;
  end;
end;


procedure TNegativeForm.dbe_lczdKeyPress(Sender: TObject; var Key: Char);
var id: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbe_lczd.Text <> '' then
    begin
      SQLText := 'select * from YYLczd';
      id := dbe_lczd.Text;
      with ZFX_YX do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where id=:id');
        parameters.parambyname('id').value := id;
        open;
        if ZFX_YX.RecordCount > 0 then
          dbe_lczd.Text := ZFX_YX.FieldValues['lczd'];
      end;
    end;
    dbcsh.setfocus;
  end;
end;

procedure TNegativeForm.dbcbgKeyPress(Sender: TObject; var Key: Char);
var ID: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbcbg.Text <> '' then
    begin
      SQLText := 'select * from checkman';
      ID := dbcbg.Text;
      with ZFX_YX do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ID=:ID');
        parameters.parambyname('ID').value := ID;
        open;
        if ZFX_YX.RecordCount > 0 then
          dbcbg.Text := ZFX_YX.FieldValues['name'];
      end;
    end;
    dbcsh.SetFocus;
  end;
end;


procedure TNegativeForm.dbcshKeyPress(Sender: TObject; var Key: Char);
var ID: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbcsh.Text <> '' then
    begin
      SQLText := 'select * from checkman';
      ID := dbcsh.Text;
      with ZFX_YX do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ID=:ID');
        parameters.parambyname('ID').value := ID;
        open;
        if ZFX_YX.RecordCount > 0 then
          dbcsh.Text := ZFX_YX.FieldValues['Name']
      end;
    end;
    edtTime.SetFocus;
  end;
end;


procedure TNegativeForm.edtTimeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    cbTime.SetFocus;
end;

procedure TNegativeForm.cbTimeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if cbtime.text = '' then
      messagebox(handle, '��������ţ�', '��ʾ', mb_ok)
    else
    begin
      if (cbtime.text = '01') or (cbtime.text = '1') then
        cbtime.Text := 'Сʱ';
      if (cbtime.text = '02') or (cbtime.text = '2') then
        cbtime.Text := '��';
    end;
  end;
   //edtNormal.SetFocus;
end;

procedure TNegativeForm.edtNormalKeyPress(Sender: TObject; var Key: Char);
begin
  {if key=#13 then
  edtFailed.SetFocus;}
end;

procedure TNegativeForm.edtFailedKeyPress(Sender: TObject; var Key: Char);
begin
{  if key=#13 then
  edtGrowth.SetFocus;}
end;

procedure TNegativeForm.edtGrowthKeyPress(Sender: TObject; var Key: Char);
begin
{  if key=#13 then
  cbMicroscope.SetFocus; }
end;

procedure TNegativeForm.cbMicroscopeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    if CBmicroscope.text = '' then
      messagebox(handle, '��������ţ�', '��ʾ', mb_ok)
    else
    begin
      if (CBmicroscope.text = '01') or (CBmicroscope.text = '1') then
        CBmicroscope.Text := '������Ⱦɫ';
      if (CBmicroscope.text = '02') or (CBmicroscope.text = '2') then
        CBmicroscope.Text := '����Ⱦɫ';
      if (CBmicroscope.text = '03') or (CBmicroscope.text = '3') then
        CBmicroscope.Text := 'ֱ��ͿƬ';
    end;
  end;
end;

procedure TNegativeForm.edtNoOutputKeyPress(Sender: TObject;
  var Key: Char);
begin
{  if key=#13 then
  edtOutput.SetFocus; }
end;

procedure TNegativeForm.edtOutputKeyPress(Sender: TObject; var Key: Char);
begin
  {if key=#13 then
  DBCremark.SetFocus;}
end;

procedure TNegativeForm.DBCRemark1KeyPress(Sender: TObject; var Key: Char);
begin
  {if key=#13 then
  Memo1.SetFocus;}
end;

procedure TNegativeForm.dbcBBtypeKeyPress(Sender: TObject; var Key: Char);
var ID: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if dbcBBtype.Text <> '' then
    begin
      SQLText := 'select * from bb';
      ID := dbcBBtype.Text;
      with ZFX_YX do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where ID=:ID');
        parameters.parambyname('ID').value := ID;
        open;
        if ZFX_YX.RecordCount > 0 then
          dbcBBtype.Text := ZFX_YX.FieldValues['bbName'];
      end;
    end;
    dbc_checkDoctor.setfocus;
  end;
end;

procedure TNegativeForm.ChkRemarkClick(Sender: TObject);
begin
  DBCRemark.Enabled := ChkRemark.Checked;
end;

procedure TNegativeForm.DBCRemarkKeyPress(Sender: TObject; var Key: Char);
var id: string;
begin
  if key = #13 then
  begin
    SQLText := '';
    if DBCRemark.Text = '' then
    begin
      showmessage('**��ѡ���ͼ챸ע**');
      exit;
    end;
    if DBCRemark.Text <> '' then
    begin
      SQLText := 'select * from yyremark';
      id := DBCRemark.Text;
      with ZFX_YX do
      begin
        close;
        sql.clear;
        sql.add(SQLText);
        sql.add('where id=:id');
        parameters.parambyname('id').value := id;
        open;
        if ZFX_YX.RecordCount > 0 then
          DBCRemark.Text := ZFX_YX.FieldValues['remark'];
      end;
    end;
  end;
end;

procedure TNegativeForm.dbe_specnumClick(Sender: TObject);
var dh: dbhelper;
var zDbHelper: dbHelper;
begin
  dmym.rsBase.Active := true; /////////////////////////////////////////////////////
  dmym.rsBase.Edit; /////////////////////////////////////////////////////////////
  zDbHelper := DbHelper.Create; ///////////////////////////////////////////////////
 //zDbHelper.generateBBh;////////////////////////////////////////////////////////
 //dbe_specnum.Text:=inttostr(zDbHelper.Maxbbh1);
end;

procedure TNegativeForm.chkNormalClick(Sender: TObject);
begin
  edtNormal.Enabled := chkNormal.Checked;
end;

procedure TNegativeForm.chkFailedClick(Sender: TObject);
begin
  edtFailed.Enabled := chkFailed.Checked;
end;

procedure TNegativeForm.chkGrowthClick(Sender: TObject);
begin
  edtGrowth.Enabled := chkGrowth.Checked;
end;

procedure TNegativeForm.chkMicroscopeClick(Sender: TObject);
begin
  cbMicroscope.Enabled := chkMicroscope.Checked;
end;

procedure TNegativeForm.chkNoOutputClick(Sender: TObject);
begin
  edtNoOutput.Enabled := chkNoOutput.Checked;
end;

procedure TNegativeForm.chkOutputClick(Sender: TObject);
begin
  edtOutput.Enabled := chkOutput.Checked;
end;

procedure TNegativeForm.DBComboBox1KeyPress(Sender: TObject;
  var Key: Char);
var id: string;
begin
  if key = #13 then
  begin
    if (dbcombobox1.Text = '01') or (dbcombobox1.text = '1') then
      dbcombobox1.Text := '��';
    if (dbcombobox1.Text = '02') or (dbcombobox1.text = '2') then
      dbcombobox1.Text := '��';
    if (dbcombobox1.Text = '03') or (dbcombobox1.text = '3') then
      dbcombobox1.Text := '��';
    if (dbcombobox1.Text = '04') or (dbcombobox1.text = '4') then
      dbcombobox1.Text := 'Сʱ';
    if (dbcombobox1.Text = '05') or (dbcombobox1.text = '5') then
      dbcombobox1.Text := '����';
    dbe_custNo.SetFocus;
  end;
end;

procedure TNegativeForm.CheckBox1Click(Sender: TObject);
begin
  Memo1.Enabled := CheckBox1.Checked;
end;

procedure TNegativeForm.BtnHistoryClick(Sender: TObject);
var
  frmtotal: TLSDZForm;
  Dname: string; //�����ؼ���
begin
  if dbe_name.text <> '' then
  begin
    Dname := dbe_name.Text;
 {dmym.rsBase.Active:=false;
 dmym.rsBase.CommandText:='select * from base where name='''+Dname+'''';//'''+Dname+'''';//"'+dbe_name.Text+'"';
 dmym.rsBase.Active:=true;}
    dmym.LSADODataSet1.Active := false;
    dmym.LSADODataSet1.CommandText := 'select * from base where name=''' + Dname + ''''; //'''+Dname+'''';//"'+dbe_name.Text+'"';
    dmym.LSADODataSet1.Active := true;
    if dmym.LSADODataSet1.RecordCount > 0 then
    begin
      frmtotal := TLSDZForm.Create(self);
      frmtotal.ShowModal;
    end else
      showmessage('�˲�������ʷ��¼');
  end else
  begin
    dmym.LSADODataSet1.Active := false;
    dmym.LSADODataSet1.CommandText := 'select * from base order  by cydate desc';
    dmym.LSADODataSet1.Active := true;
    if dmym.LSADODataSet1.recordcount > 0 then
    begin
      frmtotal := TLSDZForm.Create(self);
      frmtotal.ShowModal;
    end else
      showmessage('�걾����ʷ��¼');

  end;
end;

procedure TNegativeForm.chkNormalKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if not chkNormal.Checked then
      chkNormal.Checked := true
    else
      chkNormal.Checked := false;
  end;
end;

procedure TNegativeForm.chkFailedKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if not chkFailed.Checked then
      chkFailed.Checked := true
    else
      chkFailed.Checked := false;
  end;
end;

procedure TNegativeForm.chkGrowthKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if not chkGrowth.Checked then
      chkGrowth.Checked := true
    else
      chkGrowth.Checked := false;
  end;
end;

procedure TNegativeForm.chkNoGrowCauseKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    if not chkNoGrowCause.Checked then
      chkNoGrowCause.Checked := true
    else
      chkNoGrowCause.Checked := false;
  end;
end;

procedure TNegativeForm.chkNoGrowthKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    if not chkNoGrowth.Checked then
      chkNoGrowth.Checked := true
    else
      chkNoGrowth.Checked := false;
  end;
end;

procedure TNegativeForm.chkMicroscopeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    if not chkMicroscope.Checked then
      chkMicroscope.Checked := true
    else
      chkMicroscope.Checked := false;
  end;
end;

procedure TNegativeForm.chkNoOutputKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    if not chkNoOutput.Checked then
      chkNoOutput.Checked := true
    else
      chkNoOutput.Checked := false;
  end;
end;

procedure TNegativeForm.chkOutputKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if not chkOutput.Checked then
      chkOutput.Checked := true
    else
      chkOutput.Checked := false;
  end;
end;

procedure TNegativeForm.ChkRemarkKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if not ChkRemark.Checked then
      ChkRemark.Checked := true
    else
      ChkRemark.Checked := false;
  end;
end;

procedure TNegativeForm.CheckBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if not CheckBox1.Checked then
      CheckBox1.Checked := true
    else
      CheckBox1.Checked := false;
  end;
end;

procedure TNegativeForm.Button1Click(Sender: TObject);
var dataclass: dbhelper;
begin
  dataclass := dbhelper.Create;
  dmym.rsBase['bbh'] := dataclass.generateNumber('baseno');
  dataclass.Free;
end;

procedure TNegativeForm.btnPrintClick(Sender: TObject);
var reporttype: integer;
begin
  application.createform(Tsreportform, sreportform);
  if sreportform.ShowModal = mrok then
  begin
    reporttype := sreportform.reporttype;
    case reporttype of
      1: begin
          Rvsystem1.SystemSetups := Rvsystem1.SystemSetups - [ssAllowSetup];
          Rvsystem1.DefaultDest := rdPrinter;
          print;
        end;
      2: begin
          Rvsystem1.SystemSetups := Rvsystem1.SystemSetups - [ssAllowSetup];
          Rvsystem1.DefaultDest := rdPreview;
          print;
        end;
      3: ExportWord;
    end;
  end;
  sreportform.Free;
  Sendmessage(findwindow('TNegativeForm', nil), WM_SYSCOMMAND, SC_CLOSE, 0);
end;

procedure TNegativeForm.Exportword;
var wordapp, worddoc, wordtab, myrange, Template: variant;
  myini: Tinifile;
  h: hwnd;
  resultstr: string;
begin
  try
    wordapp := createoleobject('word.application');
    wordapp.visible := false;
  except
    messagebox(0, 'δ��װ WordӦ�ó���,���Ȱ�װMicrosoftOffice,Ȼ���������!',
      '����δ�ҵ�', mb_Ok + MB_ICONWARNING + MB_APPLMODAL);
    Abort;
  end;

  application.CreateForm(Tflashform, flashform);
  flashform.Show;
  flashform.Panel1.Caption := '���ڵ�����Word,���Ժ�...';
  flashform.Refresh;

    //�趨�ĵ�ģʽ,(*�ر�ƴ�����ң��﷨���ң��������Ч��*)
  Wordapp.Options.CheckSpellingAsYouType := False;
  Wordapp.Options.CheckGrammarAsYouType := False;
  Template := ExtractFiledir(Application.Exename) + '/doc/�����Ա��浥.dot';
  worddoc := wordapp.Documents.Add(template);
  wordtab := worddoc.tables.item(1);

  try
    (*������Դ��Ϣ*)
    wordtab.cell(1, 1).range.insertafter(hospitalName + '΢�����ⱨ�浥');
    if not varisnull(dmym.rsBase['name']) then
      wordtab.cell(2, 1).range.insertafter(dmym.rsBase['name']);
    if not varisnull(dmym.rsBase['kb']) then
      wordtab.cell(2, 2).range.insertafter(dmym.rsBase['kb']);
    if not varisnull(dmym.rsBase['sjmd']) then
      wordtab.cell(2, 3).range.insertafter(dmym.rsBase['sjmd']);
    if not varisnull(dmym.rsBase['sex']) then
      wordtab.cell(3, 1).range.insertafter(dmym.rsBase['sex']);
    if not varisnull(dmym.rsBase['zyh']) then
      wordtab.cell(3, 2).range.insertafter(dmym.rsBase['zyh']);
    if not varisnull(dmym.rsBase['bb']) then
      wordtab.cell(3, 3).range.insertafter(dmym.rsBase['bb']);
    if (not varisnull(dmym.rsBase['old'])) and (not varisnull(dmym.rsBase['age'])) then
      wordtab.cell(4, 1).range.insertafter(dmym.rsBase['old'] + dmym.rsBase['age']);
    if not varisnull(dmym.rsBase['bed']) then
      wordtab.cell(4, 2).range.insertafter(dmym.rsBase['bed']);
    if not varisnull(dmym.rsBase['bb']) then
      wordtab.cell(4, 3).range.insertafter(dmym.rsBase['cydate']);
    if not varisnull(dmym.rsBase['bbh']) then
      wordtab.cell(5, 1).range.insertafter(dmym.rsBase['bbh']);
    if not varisnull(dmym.rsBase['sj']) then
      wordtab.cell(5, 2).range.insertafter(dmym.rsBase['sj']);
    if not varisnull(dmym.rsBase['repdate']) then
      wordtab.cell(5, 3).range.insertafter(dmym.rsBase['repdate']);
    if not varisnull(dmym.rsBase['lczd']) then
      wordtab.cell(6, 1).range.insertafter(dmym.rsBase['lczd']);
    //������ϸ��Ϣ
    resultstr := '';
    if edttime.Text <> '' then
      resultstr := resultstr + '������' + edttime.Text + cbtime.Text + '�Ժ��������' + #13#10;
    if chkNormal.Checked then
      resultstr := resultstr + '���������Ⱥ' + edtnormal.Text + ''#13#10;
    if chkFailed.Checked then
      resultstr := resultstr + 'δ���' + edtFailed.Text + #13#10;
    if chkGrowth.Checked then
      resultstr := resultstr + edtgrowth.Text + '(������Ⱥ),����������'#13#10;
    if chkNoGrowCause.Checked then
      resultstr := resultstr + '���²�������'#13#10;
    if chkNoGrowth.Checked then
      resultstr := resultstr + '��ϸ������'#13#10;
    if chkMicroscope.Checked then
      if bOldPatient then
        resultstr := resultstr + edtmic.Text + ''#13#10
      else
        resultstr := resultstr + '���� ' + cbmicroscope.Text + ' ����΢�����'#13#10;
    if chkoutput.Checked then
      resultstr := resultstr + '���' + edtoutput.Text + #13#10;
    if chknooutput.checked then
      resultstr := resultstr + 'δ���' + edtnooutput.Text + #13#10;
    if chkremark.Checked then
      resultstr := resultstr + DBCremark.Text + #13#10;
    resultstr := resultstr + #13#10;
    if CheckBox1.checked then
      resultstr := resultstr + '����ҽʦ���' + Memo1.Text;
    wordtab.cell(7, 1).range.insertafter(resultstr);
    //��������ߣ��ͼ���
    if not varisnull(dmym.rsBase['bgys']) then
      wordtab.cell(8, 1).range.insertafter(dmym.rsBase['bgys']);
    if not varisnull(dmym.rsBase['shys']) then
      wordtab.cell(8, 2).range.insertafter(dmym.rsBase['shys']);
    //����ҳ��
    myini := Tinifile.Create(Extractfiledir(Application.ExeName) + '\dw.ini');
    wordtab.cell(9, 1).range.insertafter(myini.ReadString('DepartMent', 'Information', ''));
    myini.Free;
  except
    messagedlg('�����������', mtWarning, [mbok], 0);
  end;
  flashform.Hide;
  flashform.Free;

  wordapp.visible := true;
  setwindowpos(findwindow('NetUIHWND', nil), HWND_TOPMOST, 0, 0, 0, 0, SWP_SHOWWINDOW);
end;


end.
