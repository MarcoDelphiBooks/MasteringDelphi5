unit MdData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDataModule1 = class(TDataModule)
    Table1: TTable;
    Table2: TTable;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Table3: TTable;
    DataSource3: TDataSource;
    Table3EmpNo: TIntegerField;
    Table3LastName: TStringField;
    Table3FirstName: TStringField;
    Table3PhoneExt: TStringField;
    Table3HireDate: TDateTimeField;
    Table3Salary: TFloatField;
    Table2OrderNo: TFloatField;
    Table2CustNo: TFloatField;
    Table2SaleDate: TDateTimeField;
    Table2ShipDate: TDateTimeField;
    Table2EmpNo: TIntegerField;
    Table2ShipToContact: TStringField;
    Table2ShipToAddr1: TStringField;
    Table2ShipToAddr2: TStringField;
    Table2ShipToCity: TStringField;
    Table2ShipToState: TStringField;
    Table2ShipToZip: TStringField;
    Table2ShipToCountry: TStringField;
    Table2ShipToPhone: TStringField;
    Table2ShipVIA: TStringField;
    Table2PO: TStringField;
    Table2Terms: TStringField;
    Table2PaymentMethod: TStringField;
    Table2ItemsTotal: TCurrencyField;
    Table2TaxRate: TFloatField;
    Table2Freight: TCurrencyField;
    Table2AmountPaid: TCurrencyField;
    Table2Employee: TStringField;
    Table1CustNo: TFloatField;
    Table1Company: TStringField;
    Table1Addr1: TStringField;
    Table1Addr2: TStringField;
    Table1City: TStringField;
    Table1State: TStringField;
    Table1Zip: TStringField;
    Table1Country: TStringField;
    Table1Phone: TStringField;
    Table1FAX: TStringField;
    Table1TaxRate: TFloatField;
    Table1Contact: TStringField;
    Table1LastInvoiceDate: TDateTimeField;
    procedure DataModule1Create(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.DFM}

procedure TDataModule1.DataModule1Create(Sender: TObject);
begin
  Table3.Open;
  Table1.Open;
  Table2.Open;
end;

end.
