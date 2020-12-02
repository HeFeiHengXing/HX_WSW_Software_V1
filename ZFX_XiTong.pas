unit ZFX_XiTong;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, StdCtrls, ExtCtrls, DBCtrls, DBGrids, ymDataType;

type
  TZFX_YPDY = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    ZFX_Jsname: TComboBox;
    ZFX_Xjname: TComboBox;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    ZFX_xjcx: TADOQuery;
    ZFX_bblx: TComboBox;
    cb_xjname: TCheckBox;
    cb_bblx: TCheckBox;
    Button1: TButton;
    procedure ZFX_JsnameClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZFX_XjnameClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ZFX_JsnameChange(Sender: TObject);
    procedure ZFX_bblxClick(Sender: TObject);
    procedure ZFX_XjnameChange(Sender: TObject);
    procedure cb_xjnameClick(Sender: TObject);
    procedure cb_bblxClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    zDbHelper: dbhelper;
  end;

var
  ZFX_YPDY: TZFX_YPDY;

implementation

uses germAnalysisFrm, dbym;

{$R *.dfm}

procedure TZFX_YPDY.ZFX_JsnameClick(Sender: TObject);
var cmdtext: string;
  zfxbblx: string;
begin
  zfxbblx := '所有';
  ADODataSet1.Active := false;
  if (cb_xjname.Checked = true) and (cb_bblx.Checked = false) then
  begin
    if (ZFX_Jsname.Text <> '') and (ZFX_Xjname.Text <> '') then
    begin
      cmdtext := 'select * from ZFX_YP where jsname=''' + ZFX_Jsname.Text + ''' and xjname=''' + ZFX_Xjname.Text + ''' and bblx=''' + zfxbblx + ''' order by Ypid';
      ADODataSet1.CommandText := cmdtext;
      ADODataSet1.Active := true;
    end
    else
      exit;
  end;
  if (cb_xjname.Checked = false) and (cb_bblx.Checked = true) then
  begin
    if (ZFX_Jsname.Text <> '') and (ZFX_bblx.Text <> '') then
    begin
      cmdtext := 'select * from ZFX_YP where jsname=''' + ZFX_Jsname.Text + ''' and bblx=''' + ZFX_bblx.Text + ''' and order by Ypid';
      ADODataSet1.CommandText := cmdtext;
      ADODataSet1.Active := true;
    end
    else
      exit;
  end;
  if (cb_xjname.Checked = true) and (cb_bblx.Checked = true) then
  begin
    if (ZFX_Jsname.Text <> '') and (ZFX_bblx.Text <> '') and (ZFX_Xjname.Text <> '') then
    begin
      cmdtext := 'select * from ZFX_YP where jsname=''' + ZFX_Jsname.Text + ''' and bblx=''' + ZFX_bblx.Text + ''' and xjname=''' + ZFX_Xjname.Text + ''' order by Ypid';
      ADODataSet1.CommandText := cmdtext;
      ADODataSet1.Active := true;
    end
    else
      exit;
  end
  else
    exit;
end;

procedure TZFX_YPDY.FormShow(Sender: TObject);

begin
  ZFX_Xjname.Enabled := true;
  ZFX_Jsname.Items.Clear;
  ZFX_Xjname.Items.Clear;
  with dmym.query1 do
  begin
    close;
    sql.clear;
    sql.add('Select GermType from GermType order by GermIndex');
    open;
    if recordCount > 0 then
    begin
      while not eof do
      begin
        ZFX_Jsname.Items.Add(fieldbyname('GermType').asstring);
        next;
      end;
    end;
  end;
  cb_xjname.Checked := false;
  cb_bblx.Checked := false;
  ZFX_bblx.Enabled := false;
  ZFX_Xjname.Enabled := false;
  ZFX_bblx.Text := '';
  ZFX_Xjname.Text := '';
  ZFX_Jsname.Text := '';
  DBGrid1.Refresh;


end;

procedure TZFX_YPDY.ZFX_XjnameClick(Sender: TObject);
var cmdtext: string;
  zfxbblx: string;
begin
  zfxbblx := '所有';
  ADODataSet1.Active := false;
  if (cb_xjname.Checked = true) and (cb_bblx.Checked = false) then
  begin
    if (ZFX_Jsname.Text <> '') and (ZFX_Xjname.Text <> '') then
    begin
      cmdtext := 'select * from ZFX_YP where (jsname=''' + ZFX_Jsname.Text + ''' and xjname=''' + ZFX_Xjname.Text + ''' and bblx=''123'') order by Ypid';
      ADODataSet1.CommandText := cmdtext;
      ADODataSet1.Active := true;
    end
    else
      exit;
  end;
  if (cb_xjname.Checked = false) and (cb_bblx.Checked = true) then
  begin
    if (ZFX_Jsname.Text <> '') and (ZFX_bblx.Text <> '') then
    begin
      cmdtext := 'select * from ZFX_YP where jsname=''' + ZFX_Jsname.Text + ''' and bblx=''' + ZFX_bblx.Text + ''' and order by Ypid';
      ADODataSet1.CommandText := cmdtext;
      ADODataSet1.Active := true;
    end
    else
      exit;
  end;
  if (cb_xjname.Checked = true) and (cb_bblx.Checked = true) then
  begin
    if (ZFX_Jsname.Text <> '') and (ZFX_bblx.Text <> '') and (ZFX_Xjname.Text <> '') then
    begin
      cmdtext := 'select * from ZFX_YP where jsname=''' + ZFX_Jsname.Text + ''' and bblx=''' + ZFX_bblx.Text + ''' and xjname=''' + ZFX_Xjname.Text + ''' order by Ypid';
      ADODataSet1.CommandText := cmdtext;
      ADODataSet1.Active := true;
    end
    else
      exit;
  end
  else
    exit;
end;

procedure TZFX_YPDY.CheckBox1Click(Sender: TObject);
begin
  ZFX_Xjname.Enabled := true;

end;

procedure TZFX_YPDY.ZFX_JsnameChange(Sender: TObject);
begin
  if ZFX_Jsname.Text <> '' then
  begin
    ZFX_Xjname.Items.Clear;
    with dmym.query1 do
    begin
      close;
      sql.clear;
      sql.add('Select xjname from ZFX_XTYM where jsname=''' + ZFX_Jsname.Text + ''' order by xjname');
      open;
      if recordCount > 0 then
      begin
        while not eof do
        begin
          ZFX_Xjname.Items.Add(fieldbyname('xjname').asstring);
          next;
        end;
      end;
    end;
  end;
end;

procedure TZFX_YPDY.ZFX_bblxClick(Sender: TObject);
var cmdtext: string;
  zfxbblx: string;
begin
  zfxbblx := '所有';
  ADODataSet1.Active := false;
  if (cb_xjname.Checked = true) and (cb_bblx.Checked = false) then
  begin
    if (ZFX_Jsname.Text <> '') and (ZFX_Xjname.Text <> '') then
    begin
      cmdtext := 'select * from ZFX_YP where jsname=''' + ZFX_Jsname.Text + ''' and xjname=''' + ZFX_Xjname.Text + ''' and bblx=''' + zfxbblx + ''' order by Ypid';
      ADODataSet1.CommandText := cmdtext;
      ADODataSet1.Active := true;
    end
    else
      exit;
  end;
  if (cb_xjname.Checked = false) and (cb_bblx.Checked = true) then
  begin
    if (ZFX_Jsname.Text <> '') and (ZFX_bblx.Text <> '') then
    begin
      cmdtext := 'select * from ZFX_YP where jsname=''' + ZFX_Jsname.Text + ''' and bblx=''' + ZFX_bblx.Text + ''' order by Ypid';
      ADODataSet1.CommandText := cmdtext;
      ADODataSet1.Active := true;
    end
    else
      exit;
  end;
  if (cb_xjname.Checked = true) and (cb_bblx.Checked = true) then
  begin
    if (ZFX_Jsname.Text <> '') and (ZFX_bblx.Text <> '') and (ZFX_Xjname.Text <> '') then
    begin
      cmdtext := 'select * from ZFX_YP where jsname=''' + ZFX_Jsname.Text + ''' and bblx=''' + ZFX_bblx.Text + ''' and xjname=''' + ZFX_Xjname.Text + ''' order by Ypid';
      ADODataSet1.CommandText := cmdtext;
      ADODataSet1.Active := true;
    end
    else
      exit;
  end
  else
    exit;
end;

procedure TZFX_YPDY.ZFX_XjnameChange(Sender: TObject);
var cmdtext: string;
  zfxbblx: string;
begin
  zfxbblx := '所有';
  ADODataSet1.Active := false;
  if (cb_xjname.Checked = true) and (cb_bblx.Checked = false) then
  begin
    if (ZFX_Jsname.Text <> '') and (ZFX_Xjname.Text <> '') then
    begin
      cmdtext := 'select * from ZFX_YP where jsname=''' + ZFX_Jsname.Text + ''' and xjname=''' + ZFX_Xjname.Text + ''' and bblx=''' + zfxbblx + ''' order by Ypid';
      ADODataSet1.CommandText := cmdtext;
      ADODataSet1.Active := true;
    end
    else
      exit;
  end;
  if (cb_xjname.Checked = false) and (cb_bblx.Checked = true) then
  begin
    if (ZFX_Jsname.Text <> '') and (ZFX_bblx.Text <> '') then
    begin
      cmdtext := 'select * from ZFX_YP where jsname=''' + ZFX_Jsname.Text + ''' and bblx=''' + ZFX_bblx.Text + ''' and order by Ypid';
      ADODataSet1.CommandText := cmdtext;
      ADODataSet1.Active := true;
    end
    else
      exit;
  end;
  if (cb_xjname.Checked = true) and (cb_bblx.Checked = true) then
  begin
    if (ZFX_Jsname.Text <> '') and (ZFX_bblx.Text <> '') and (ZFX_Xjname.Text <> '') then
    begin
      cmdtext := 'select * from ZFX_YP where jsname=''' + ZFX_Jsname.Text + ''' and bblx=''' + ZFX_bblx.Text + ''' and xjname=''' + ZFX_Xjname.Text + ''' order by Ypid';
      ADODataSet1.CommandText := cmdtext;
      ADODataSet1.Active := true;
    end
    else
      exit;
  end
  else
    exit;
end;

procedure TZFX_YPDY.cb_xjnameClick(Sender: TObject);
begin
  if cb_xjname.Checked then
    ZFX_Xjname.Enabled := true
  else
    ZFX_Xjname.Enabled := false;
end;

procedure TZFX_YPDY.cb_bblxClick(Sender: TObject);
begin
  if cb_bblx.Checked then
    ZFX_bblx.Enabled := true
  else
    ZFX_bblx.Enabled := false;
end;

procedure TZFX_YPDY.Button1Click(Sender: TObject);
begin
  ZFX_YPDY.Close;
end;


procedure TZFX_YPDY.FormCreate(Sender: TObject);
var
  strlist: tstringlist;
  sqltext: string;
  i: integer;
begin
//初始化标本类型
  with ZFX_xjcx do
  begin
    sqltext := 'select bbName from bb';
    ZFX_xjcx.Close;
    ZFX_xjcx.SQL.Add(sqltext);
    ZFX_xjcx.Open;
    ZFX_xjcx.First;
    if ZFX_xjcx.RecordCount > 0 then
    begin
      for i := 1 to ZFX_xjcx.RecordCount do
      begin
        ZFX_bblx.Items.Add(ZFX_xjcx.fieldbyname('bbName').asstring);
        ZFX_xjcx.Next;
      end;
    end;
//初始化标本类型
  end;
    {zDbHelper.getBBType(strlist);
    ZFX_bblx.Items:=strlist;
    strlist.clear;}
end;

end.
