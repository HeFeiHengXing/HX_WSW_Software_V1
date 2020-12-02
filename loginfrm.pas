unit loginfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Mask, ExtCtrls, WinSkinData, jpeg,
  registry, inifiles;

type
  TloginForm = class(TForm)
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    edtPwd: TMaskEdit;
    Panel1: TPanel;
    edtUsername: TEdit;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtUsernameKeyPress(Sender: TObject; var Key: Char);
    procedure edtPwdKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

  public
    { Public declarations }
    Bsuper: boolean;
    function loggingin: boolean;
    procedure enter;
  end;

var
  loginForm: TloginForm;
  userNamehfut: string;
  timetype: string;
implementation

uses dbym, ym2mainfrm, common;
var harddisknum: string;
  belog: boolean;
  LoggingInNum: string;
  LoggingInPassWord: string;
{$R *.dfm}

procedure TloginForm.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TloginForm.BitBtn3Click(Sender: TObject);
var Reg: Tregistry;
begin
  if belog then
    enter
  else
  begin
    if edit2.text = '' then
      showmessage('请输入注册码');
    if edit2.text <> '' then
      if trim(edit2.text) = LoggingInPassWord then
      begin
        showmessage('注册成功！');
        bitbtn3.Caption := '登录';
        try
          Reg := Tregistry.Create;
          Reg.RootKey := HKEY_LOCAL_MACHINE;
          Reg.openkey('SoftWare\Analysis systems', true);
          Reg.writestring('myharddisknum', harddisknum);

          label4.Visible := false;
          label5.Visible := false;
          edit1.Visible := false;
          edit2.Visible := false;

          label1.Visible := true;
          label2.Visible := true;
          edtUsername.Visible := true;
          edtPwd.Visible := true;

          belog := true;
          edtUsername.SetFocus;
        finally
          Reg.CloseKey;
          Reg.Free;
        end;
      end
      else
      begin
        showmessage('注册码错误，请重新输入！');
        edit2.SetFocus;
      end;
  end;
end;

procedure TloginForm.FormCreate(Sender: TObject);
var
  dw, dwTemp1, dwTemp2: DWord;
  p1, p2: array[0..30] of char;
begin
  shortdateformat := 'yyyy/mm/dd';
  shorttimeformat := 'hh:mm';
  longtimeformat := shorttimeformat;
  edtpwd.PasswordChar := '*';
  GetVolumeInformation(PChar('c:\'), p1, 20, @dw, dwTemp1, dwTemp2, p2, 20);
  harddisknum := inttostr(dw); //获取硬盘系列号

  belog := false;
  label4.Visible := false;
  label5.Visible := false;
  edit1.Visible := false;
  edit2.Visible := false;
end;

procedure TloginForm.FormShow(Sender: TObject);
var Reg: Tregistry;
  harddisk: string;
begin
  Reg := Tregistry.Create;
  try
    with Reg do
    begin
      Rootkey := HKEY_LOCAL_MACHINE;
      if Openkey('SoftWare\Analysis Systems', true) then
      begin
        if ValueExists('myharddisknum') then
        begin
          harddisk := readstring('myharddisknum');
          if harddisknum = harddisk then
            belog := true
          else
            if messagebox(handle, '软件未注册,是否注册？', '提示！', mb_yesno or mb_iconquestion) = idyes then
            begin
              loggingin;
              bitbtn3.Caption := '注册';
            end
            else
              close;
        end
        else
          if messagebox(handle, '软件未注册,是否注册？', '提示！', mb_yesno or mb_iconquestion) = idyes then
          begin
            loggingin;
            bitbtn3.Caption := '注册';
          end
          else
            close;
      end;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TloginForm.edtUsernameKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    edtPwd.SetFocus;
end;

procedure TloginForm.edtPwdKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  {if edtUsername.Text=null then
    begin
    MessageDlg('请输入用户名！!',mtError,[mbOk],0);
    edtUsername.SetFocus;
    end else}
    BitBtn3Click(Sender);
end;

procedure TloginForm.enter;
var
  str, super, sqltext, userID: string;
  afrm: tym2mainform;
  MyInifile: Tinifile;
begin
  edtusername.SetFocus;
  with dmym.query1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from username where username=:username and usePassword=:password');
    str := edtusername.Text;
    parameters.ParamByName('username').Value := str;
    str := edtpwd.Text;
    parameters.ParamByName('password').Value := str;
    open;

    if recordcount < 1 then
      MessageDlg('用户名或口令错误！!', mtError, [mbOk], 0)
    else
    begin
      super := fieldbyname('power').Value;
      userID := trim(edtUsername.Text);
      sqltext := 'select ChinaName from username where username=''' + UserID + '''';
//初始化全局 变量userName
      with dmym.query1 do
      begin
        close;
        sql.Clear;
        sql.Add(sqltext);
        open;
        if recordCount > 0 then
        begin
          userNamehfut := dmym.query1.fieldbyname('ChinaName').asstring;
          MyInifile := Tinifile.Create(getcurrentdir + '\dw.ini');
          MyInifile.WriteString('username', 'usernamehfut', usernamehfut);
          MyInifile.Free;
        end;
      end;
//初始化全局 变量userName
      if super = '0' then
        Bsuper := false else
        Bsuper := true;
      close;
      sql.Clear;
      sql.add('select timetype from systimetype');
      open;
      if recordcount <> 0 then
        if fieldvalues['timetype'] = 1 then
          timetype := 'now'
        else
          timetype := 'date';
      afrm := tym2mainform.create(self);
      self.Hide;
      afrm.show;
    end;
  end;
end;

function TloginForm.loggingin: boolean;
var
  i: integer;
begin
  label4.Visible := true;
  label5.Visible := true;
  edit1.Visible := true;
  edit2.Visible := true;

  label1.Visible := false;
  label2.Visible := false;
  edtUsername.Visible := false;
  edtPwd.Visible := false;
    //生成注册号
  for i := 0 to length(harddisknum) - 1 do
  begin
    loggingInNum := loggingInNum + chr((ord(harddisknum[i]) + i) mod 9 + (i + 9) * (i + 11) mod 17 + 97);
    edit1.Text := loggingInNum;
  end;

  for i := 0 to length(LoggingInNum) - 1 do
  begin
    LoggingInPassWord := LoggingInPassWord + chr((ord(LoggingInNum[i]) + i) mod 9 + (i + 9) * (i + 11) mod 17 + 65);
  end;
end;

end.
