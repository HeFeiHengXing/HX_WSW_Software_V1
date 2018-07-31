unit dbym;

interface

uses
  SysUtils, Classes, DB, ADODB;

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
    procedure DataModuleCreate(Sender: TObject);
    procedure rsCheckAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmym: Tdmym;

implementation

{$R *.dfm}

procedure Tdmym.DataModuleCreate(Sender: TObject);
var
  str:string;
begin
  str:=getcurrentdir+'\germ.mdb';
  conn.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;'+
    'Data Source='+str+';Mode=Share Deny None;Extended Properties="";'+
    'Jet OLEDB:System database="";Jet OLEDB:Registry Path="";'+
    'Jet OLEDB:Database Password=weichang;'+
    'Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;'+
    'Jet OLEDB:Global Partial Bulk Ops=2;'+
    'Jet OLEDB:Global Bulk Transactions=1;'+
    'Jet OLEDB:New Database Password="";'+
    'Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don''t Copy Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False';

end;

procedure Tdmym.rsCheckAfterOpen(DataSet: TDataSet);
var  
      I:   Integer;  
  begin  
      for   I   :=   0   to   DataSet.Fields.Count   -   1   do  
          case   DataSet.Fields[I].DataType   of  
              ftSmallint,   ftInteger,   ftWord,   ftFloat:
                  TNumericField(DataSet.Fields[I]).DisplayFormat   :=   '#,##0.00';  
          end;
end;
end.
