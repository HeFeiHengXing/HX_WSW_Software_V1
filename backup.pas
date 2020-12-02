unit backup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, DateUtils;

type
  TbackupForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ListBox1: TListBox;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    procedure updatefilelist;
  public
    { Public declarations }
  end;

var
  backupForm: TbackupForm;

implementation

{$R *.dfm}

procedure TbackupForm.Button2Click(Sender: TObject);
var currentdir: string;
begin
  if messagedlg('是否备份当前系统数据?', mtconfirmation, [mbyes, mbcancel], 0) = idyes then
  begin
    currentdir := getcurrentdir();
    if copyfile(pchar(currentdir + '\germ.mdb'), pchar(currentdir + '\backup\' + datetostr(today()) + '.MDB'), false) then
      showmessage('备份成功!')
    else
      showmessage('备份失败!')
  end;
  updatefilelist;
end;

procedure TbackupForm.updatefilelist;
var path: string;
  HD: Thandle;
  filedata: TWIN32FINDDATA;
  er: Cardinal;
  str: string;
  posi: integer;
begin
  path := getcurrentdir;
  listbox1.Items.Clear;
  hd := findfirstfile(pchar(path + '\backup\*.MDB'), filedata);
  while (hd <> INVALID_HANDLE_VALUE) and (er <> ERROR_NO_MORE_FILES) do
  begin
    str := string(filedata.cFileName);
    posi := pos('.', str);
    str := copy(str, 1, posi - 1);
    listbox1.Items.Add(str);
    findnextfile(hd, filedata);
    er := getlasterror();
  end;
  windows.findclose(hd);
  if listbox1.Items.Count <> 0 then
  begin
    button1.Enabled := true;
    button3.Enabled := true;
    button4.Enabled := true;
  end
  else
  begin
    button1.Enabled := false;
    button3.Enabled := false;
    button4.Enabled := false;
  end;
end;

procedure TbackupForm.FormShow(Sender: TObject);
begin
  updatefilelist;
end;

procedure TbackupForm.Button1Click(Sender: TObject);
var currentdir: string;
begin
  if messagedlg('是否还原到' + listbox1.Items.Strings[listbox1.ItemIndex], mtconfirmation, [mbyes, mbcancel], 0) = idyes then
  begin
    currentdir := getcurrentdir();
    copyfile(pchar(currentdir + '\backup\' + listbox1.Items.Strings[listbox1.ItemIndex] + '.MDB'), pchar(currentdir + '\germ.mdb'), false);
    showmessage('还原完成！');
  end;
end;

procedure TbackupForm.Button3Click(Sender: TObject);
begin
  if listbox1.ItemIndex <> -1 then
    if messagedlg('是否删除所选备份?', mtconfirmation, [mbyes, mbcancel], 0) = idyes then
      deletefile(getcurrentdir() + '\backup\' + listbox1.Items.Strings[listbox1.ItemIndex] + '.MDB');
  updatefilelist;
end;

procedure TbackupForm.Button4Click(Sender: TObject);
var newname: string;
begin
  if listbox1.ItemIndex <> -1 then
  begin
    newname := inputbox('请输入新文件名', '', '');
    if newname = '' then
      showmessage('新文件名为空!')
    else
      renamefile(getcurrentdir() + '\backup\' + listbox1.Items.Strings[listbox1.ItemIndex] + '.MDB', getcurrentdir() + '\backup\' + newname + '.MDB');
  end;
  updatefilelist;
end;

end.
