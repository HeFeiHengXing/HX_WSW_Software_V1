
{********************************************************************}
{                                                                    }
{                          XML Data Binding                          }
{                                                                    }
{         Generated on: 2007-10-22 2:01:17                           }
{       Generated from: D:\DephiProject\myproject\ym2\exsystem.xml   }
{                                                                    }
{********************************************************************}

unit exsystem;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IStockHoldingsType = interface;
  IXMLStockType = interface;

{ IStockHoldingsType }

  IStockHoldingsType = interface(IXMLNodeCollection)
    ['{3188C9C9-D5F3-403A-B311-70328A3AF442}']
    { Property Accessors }
    function Get_Stock(Index: Integer): IXMLStockType;
    { Methods & Properties }
    function Add: IXMLStockType;
    function Insert(const Index: Integer): IXMLStockType;
    property Stock[Index: Integer]: IXMLStockType read Get_Stock; default;
  end;

{ IXMLStockType }

  IXMLStockType = interface(IXMLNode)
    ['{7BF2283E-C669-48F1-80F9-62E40C909B14}']
    { Property Accessors }
    function Get_Exchange: WideString;
    function Get_Name: WideString;
    function Get_Price: WideString;
    function Get_Symbol: WideString;
    function Get_Shares: Integer;
    procedure Set_Exchange(Value: WideString);
    procedure Set_Name(Value: WideString);
    procedure Set_Price(Value: WideString);
    procedure Set_Symbol(Value: WideString);
    procedure Set_Shares(Value: Integer);
    { Methods & Properties }
    property Exchange: WideString read Get_Exchange write Set_Exchange;
    property Name: WideString read Get_Name write Set_Name;
    property Price: WideString read Get_Price write Set_Price;
    property Symbol: WideString read Get_Symbol write Set_Symbol;
    property Shares: Integer read Get_Shares write Set_Shares;
  end;

{ Forward Decls }

  TXMLStockHoldingsType = class;
  TXMLStockType = class;

{ TXMLStockHoldingsType }

  TXMLStockHoldingsType = class(TXMLNodeCollection, IStockHoldingsType)
  protected
    { IStockHoldingsType }
    function Get_Stock(Index: Integer): IXMLStockType;
    function Add: IXMLStockType;
    function Insert(const Index: Integer): IXMLStockType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLStockType }

  TXMLStockType = class(TXMLNode, IXMLStockType)
  protected
    { IXMLStockType }
    function Get_Exchange: WideString;
    function Get_Name: WideString;
    function Get_Price: WideString;
    function Get_Symbol: WideString;
    function Get_Shares: Integer;
    procedure Set_Exchange(Value: WideString);
    procedure Set_Name(Value: WideString);
    procedure Set_Price(Value: WideString);
    procedure Set_Symbol(Value: WideString);
    procedure Set_Shares(Value: Integer);
  end;

{ Global Functions }

function GetStockHoldings(Doc: IXMLDocument): IStockHoldingsType;
function LoadStockHoldings(const FileName: WideString): IStockHoldingsType;
function NewStockHoldings: IStockHoldingsType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetStockHoldings(Doc: IXMLDocument): IStockHoldingsType;
begin
  Result := Doc.GetDocBinding('StockHoldings', TXMLStockHoldingsType, TargetNamespace) as IStockHoldingsType;
end;

function LoadStockHoldings(const FileName: WideString): IStockHoldingsType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('StockHoldings', TXMLStockHoldingsType, TargetNamespace) as IStockHoldingsType;
end;

function NewStockHoldings: IStockHoldingsType;
begin
  Result := NewXMLDocument.GetDocBinding('StockHoldings', TXMLStockHoldingsType, TargetNamespace) as IStockHoldingsType;
end;

{ TXMLStockHoldingsType }

procedure TXMLStockHoldingsType.AfterConstruction;
begin
  RegisterChildNode('Stock', TXMLStockType);
  ItemTag := 'Stock';
  ItemInterface := IXMLStockType;
  inherited;
end;

function TXMLStockHoldingsType.Get_Stock(Index: Integer): IXMLStockType;
begin
  Result := List[Index] as IXMLStockType;
end;

function TXMLStockHoldingsType.Add: IXMLStockType;
begin
  Result := AddItem(-1) as IXMLStockType;
end;

function TXMLStockHoldingsType.Insert(const Index: Integer): IXMLStockType;
begin
  Result := AddItem(Index) as IXMLStockType;
end;

{ TXMLStockType }

function TXMLStockType.Get_Exchange: WideString;
begin
  Result := AttributeNodes['exchange'].Text;
end;

procedure TXMLStockType.Set_Exchange(Value: WideString);
begin
  SetAttribute('exchange', Value);
end;

function TXMLStockType.Get_Name: WideString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLStockType.Set_Name(Value: WideString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLStockType.Get_Price: WideString;
begin
  Result := ChildNodes['price'].Text;
end;

procedure TXMLStockType.Set_Price(Value: WideString);
begin
  ChildNodes['price'].NodeValue := Value;
end;

function TXMLStockType.Get_Symbol: WideString;
begin
  Result := ChildNodes['symbol'].Text;
end;

procedure TXMLStockType.Set_Symbol(Value: WideString);
begin
  ChildNodes['symbol'].NodeValue := Value;
end;

function TXMLStockType.Get_Shares: Integer;
begin
  Result := ChildNodes['shares'].NodeValue;
end;

procedure TXMLStockType.Set_Shares(Value: Integer);
begin
  ChildNodes['shares'].NodeValue := Value;
end;

end. 