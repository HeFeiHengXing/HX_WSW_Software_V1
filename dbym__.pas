unit dbym;

interface

uses
  SysUtils, Classes, DB, ADODB, SPComm, Registry, Windows, dialogs, Forms;

type
  Tdmym = class(TDataModule)
    conn: TADOConnection;
    rsYpPatient: TADODataSet;
    query1: TADOQuery;
    subQuery: TADOQuery;
    rsBase: TADODataSet;
    dsBase: TDataSource;
    rsRegBB: TADODataSet;
    dsRegBB: TDataSource;
    rsCheck: TADODataSet;
    dsCheck: TDataSource;
    rsRegYg: TADODataSet;
    dsRegYg: TDataSource;
    rsRegZk: TADODataSet;
    dsRegZk: TDataSource;
    rsgermtype: TADODataSet;
    dsgermtype: TDataSource;
    rsHospital: TADODataSet;
    dsHospital: TDataSource;
    exQuery: TADOQuery;
    rsYx: TADODataSet;
    rsGermName: TADODataSet;
    dsGermName: TDataSource;
    rsBaseZk: TADODataSet;
    dsBaseZk: TDataSource;
    dsaddTemp: TDataSource;
    rsAdd: TADOTable;
    rsAddTemp: TADOTable;
    loginName: TADOQuery;
    fuzhuqy: TADOQuery;
    LSADODataSet1: TADODataSet;
    LSDataSource1: TDataSource;
    dssection: TDataSource;
    dssample: TDataSource;
    rssection: TADODataSet;
    rssample: TADODataSet;
    rsbase1: TADODataSet;
    dsbase1: TDataSource;
    USBCOM: TComm;
    procedure DataModuleCreate(Sender: TObject);
    procedure rsCheckAfterOpen(DataSet: TDataSet);
    procedure comMainReceiveData(Sender: TObject; Buffer: Pointer; BufferLength: Word);
    procedure ResponseWait(ms_count: integer);
    function USBRecieveColorData: boolean;
    function USBShakeHand: boolean;
    function USBColorSample: boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmym: Tdmym;
  RecieveBuff: array[0..287] of byte;
  RecieveColor: boolean;

implementation

{$R *.dfm}

procedure Tdmym.DataModuleCreate(Sender: TObject);
var
  str: string;
begin
  str := getcurrentdir + '\germ.mdb';
  conn.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;' +
    'Data Source=' + str + ';Mode=Share Deny None;Extended Properties="";' +
    'Jet OLEDB:System database="";Jet OLEDB:Registry Path="";' +
    'Jet OLEDB:Database Password=weichang;' +
    'Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;' +
    'Jet OLEDB:Global Partial Bulk Ops=2;' +
    'Jet OLEDB:Global Bulk Transactions=1;' +
    'Jet OLEDB:New Database Password="";' +
    'Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don''t Copy Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False';

end;

procedure Tdmym.rsCheckAfterOpen(DataSet: TDataSet);
var
  I: Integer;
begin
  for I := 0 to DataSet.Fields.Count - 1 do
    case DataSet.Fields[I].DataType of
      ftSmallint, ftInteger, ftWord, ftFloat:
        TNumericField(DataSet.Fields[I]).DisplayFormat := '#,##0.00';
    end;
end;

function Tdmym.USBRecieveColorData: boolean;
var
  reg: TRegistry;
  sComm: TStrings;
  i: integer;
  ss: string;
begin
  result := false;
  // Open the scane machine serial port
  try
    ss := ss + '1';
    USBCOM.StopComm;
    ss := ss + '2';
    USBCOM.StartComm;
    ss := ss + '3';
    if (USBShakeHand) then
    begin
      ss := ss + '4';
      result := USBColorSample;
      exit;
    end;
    ss := ss + '4';
  except
    ss := 'devices:';
  end;
  ss := ss + '5';
  {reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  reg.OpenKey('hardware\devicemap\serialcomm', false);
  sComm := TStringList.Create;
  reg.GetValueNames(sComm);
  for i := 0 to sComm.Count - 1 do
  begin
    try
      ss := ss + sComm.Strings[i];
      USBCOM.CommName := '//./' + sComm.Strings[i];
      USBCOM.StopComm;
      USBCOM.StartComm;
      if (USBShakeHand) then
      begin
        result := USBColorSample;
        break;
      end
      else
        continue;
    except
    end;
  end;}
  MessageDlg('未发现仪器!' + ss, mtInformation, [mbOK], 0);
  //sComm.Free;
  //reg.CloseKey;
  //reg.free;
end;

function Tdmym.USBShakeHand: boolean;
var
  buf: array[0..1] of byte;
  send_count: integer;
begin
  result := false;
  buf[0] := byte($07);
  buf[1] := byte($11);
  try
    send_count := 10;
    repeat
      Dec(send_count);
      if USBCOM.WriteCommData(@buf[0], 2) then
        break;
    until send_count = 0;
    ResponseWait(300);
    if (RecieveBuff[0] = Byte($A2)) and (RecieveBuff[1] = Byte($FF)) then
    begin
      // success
      result := true;
      exit;
    end;
  except
  end;
end;

function Tdmym.USBColorSample: boolean;
var
  buf: array[0..1] of byte;
  tim, send_count: Integer;
begin
  result := false;
  RecieveColor := false;
  buf[0] := byte($A8);
  buf[1] := byte($01);
  try
    RecieveBuff[0] := 0;
    RecieveBuff[1] := 0;
    send_count := 10;
    repeat
      Dec(send_count);
      if USBCOM.WriteCommData(@buf[0], 2) then
        break;
    until send_count = 0;
    ResponseWait(300);
    if RecieveBuff[0] = byte($A2) then
      if RecieveBuff[1] = byte($EC) then
      begin
        tim := 300;
        while tim > 0 do
        begin
          if (RecieveColor) then
          begin
        // success
            result := true;
            exit;
          end;
          ResponseWait(100);
          Dec(tim);
        end;
        MessageDlg('等待测量超时！请检查后重试!', mtInformation, [mbOK], 0);
        exit;
      end
      else if RecieveBuff[1] = byte($FE) then
      begin
        MessageDlg('仪器繁忙中,请稍后重试!', mtInformation, [mbOK], 0);
        exit;
      end
      else if RecieveBuff[1] = byte($EB) then
      begin
        RecieveBuff[0] := 0;
        RecieveBuff[1] := 0;
        buf[0] := byte($A0);
        buf[1] := byte($01);
         // 检查错误码
        send_count := 10;
        repeat
          Dec(send_count);
          if USBCOM.WriteCommData(@buf[0], 2) then
            break;
        until send_count = 0;
        ResponseWait(300);
        if RecieveBuff[0] = byte($A1) then
          MessageDlg('仪器发生错误, ErrorCode:' + INTTOHEX(RecieveBuff[1], 2) + ',请重启仪器后重试!', mtInformation, [mbOK], 0)
        else
          MessageDlg('仪器发生未知错误,请重启仪器后重试!', mtInformation, [mbOK], 0);
        exit;
      end
      else
        MessageDlg('仪器失去连接！请检查后重试!', mtInformation, [mbOK], 0);
  except
    MessageDlg('发送指令失败,请重试!', mtInformation, [mbOK], 0);
  end;
end;

procedure Tdmym.comMainReceiveData(Sender: TObject; Buffer: Pointer; BufferLength: Word);
begin
  if (BufferLength = 288) or (BufferLength = 2) then
  begin
    Move(Buffer^, pchar(@RecieveBuff)^, BufferLength);
    if (BufferLength = 288) then
      RecieveColor := true;
  end;
end;

procedure Tdmym.ResponseWait(ms_count: integer);
var
  dw: Cardinal;
begin
  dw := GetTickCount;
  while GetTickCount - dw < ms_count do
    Application.ProcessMessages;
end;

end.

