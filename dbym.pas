unit dbym;

interface

uses
  SysUtils, Classes, DB, ADODB, SPComm, Registry, Windows, dialogs, Forms, inifiles;

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
  RecieveBuff: array[0..863] of byte;
  RecieveColor: boolean;
  RecieveResponse: boolean;

implementation

{$R *.dfm}

procedure Tdmym.DataModuleCreate(Sender: TObject);
var
  str: string;
  MyIni: Tinifile;
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

  MyIni := Tinifile.Create(getcurrentdir + '\dw.ini');
  USBCOM.CommName := '//./' + Myini.ReadString('COM Port', 'serialport', '');
  MyIni.Free;

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
  findDevice: boolean;
  MyIni: Tinifile;
begin
  result := false;
  findDevice := false;
  // Open the scane machine serial port
  try
    USBCOM.StopComm;
    USBCOM.StartComm;
    if (USBShakeHand) then
    begin
      findDevice := true;
      result := USBColorSample;
    end;
  except
    USBCOM.StopComm;
  end;
  if result then
    exit;
  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  reg.OpenKey('hardware\devicemap\serialcomm', false);
  sComm := TStringList.Create;
  reg.GetValueNames(sComm);
  for i := 0 to sComm.Count - 1 do
  begin
    try
      USBCOM.CommName := '//./' + reg.ReadString(sComm.Strings[i]);
      USBCOM.StopComm;
      USBCOM.StartComm;
      if (USBShakeHand) then
      begin
        findDevice := true;
        MyIni := Tinifile.Create(getcurrentdir + '\dw.ini');
        Myini.WriteString('COM Port', 'serialport', reg.ReadString(sComm.Strings[i]));
        MyIni.Free;
        result := USBColorSample;
        break;
      end
      else
        continue;
    except
    end;
  end;
  if not findDevice then
    MessageDlg('Î´·¢ÏÖÒÇÆ÷!', mtInformation, [mbOK], 0);
  sComm.Free;
  reg.CloseKey;
  reg.free;
end;

function Tdmym.USBShakeHand: boolean;
var
  buf: array[0..1] of byte;
begin
  result := false;
  buf[0] := byte($07);
  buf[1] := byte($11);

  RecieveResponse := false;
  while true do
  begin
    if USBCOM.WriteCommData(@buf[0], 2) then
      break;
  end;
  ResponseWait(2000);
  if RecieveResponse and (RecieveBuff[0] = Byte($A2)) and (RecieveBuff[1] = Byte($FF)) then
  begin
  // success
    result := true;
    exit;
  end;
end;

function Tdmym.USBColorSample: boolean;
var
  buf: array[0..1] of byte;
  dw: Cardinal;
begin
  result := false;
  RecieveColor := false;
  buf[0] := byte($A8);
  buf[1] := byte($01);
  RecieveBuff[0] := 0;
  RecieveBuff[1] := 0;

  RecieveResponse := false;
  while true do
  begin
    if USBCOM.WriteCommData(@buf[0], 2) then
      break;
  end;
  ResponseWait(2000);
  if RecieveResponse and (RecieveBuff[0] = byte($A2)) then
    if RecieveBuff[1] = byte($EC) then
    begin
      // wait for the color data (60s)
      dw := GetTickCount;
      while (not RecieveColor) and (GetTickCount - dw < 60000) do
        Application.ProcessMessages;

      if (RecieveColor) then
      begin
      // success
        result := true;
        exit;
      end;
      MessageDlg('µÈ´ý²âÁ¿³¬Ê±£¡Çë¼ì²éºóÖØÊÔ!', mtInformation, [mbOK], 0);
      exit;
    end
    else if RecieveBuff[1] = byte($FE) then
    begin
      MessageDlg('ÒÇÆ÷·±Ã¦ÖÐ,ÇëÉÔºóÖØÊÔ!', mtInformation, [mbOK], 0);
      exit;
    end
    else if RecieveBuff[1] = byte($EB) then
    begin
      RecieveBuff[0] := 0;
      RecieveBuff[1] := 0;
      buf[0] := byte($A0);
      buf[1] := byte($01);
        // ¼ì²é´íÎóÂë
      RecieveResponse := false;
      while true do
      begin
        if USBCOM.WriteCommData(@buf[0], 2) then
          break;
      end;
      ResponseWait(2000);
      if RecieveResponse and (RecieveBuff[0] = byte($A1)) then
        MessageDlg('ÒÇÆ÷·¢Éú´íÎó, ErrorCode:' + INTTOHEX(RecieveBuff[1], 2) + ',ÇëÖØÆôÒÇÆ÷ºóÖØÊÔ!', mtInformation, [mbOK], 0)
      else
        MessageDlg('ÒÇÆ÷·¢ÉúÎ´Öª´íÎó,ÇëÖØÆôÒÇÆ÷ºóÖØÊÔ!', mtInformation, [mbOK], 0);
      exit;
    end
    else
      MessageDlg('ÒÇÆ÷Ê§È¥Á¬½Ó£¡Çë¼ì²éºóÖØÊÔ!', mtInformation, [mbOK], 0);
end;

procedure Tdmym.comMainReceiveData(Sender: TObject; Buffer: Pointer; BufferLength: Word);
begin
  if (BufferLength = 864) or (BufferLength = 2) then
  begin
    Move(Buffer^, pchar(@RecieveBuff)^, BufferLength);
    if (BufferLength = 864) then
      RecieveColor := true
    else if (BufferLength = 2) then
      RecieveResponse := true;
  end;
end;

procedure Tdmym.ResponseWait(ms_count: integer);
var
  dw: Cardinal;
begin
  dw := GetTickCount;
  while (not RecieveResponse) and (GetTickCount - dw < ms_count) do
    Application.ProcessMessages;
end;

end.

