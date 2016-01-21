unit DataM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB;

type
  TCustomerDM = class(TDataModule)
    Table1: TTable;
    DataSource1: TDataSource;
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
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  end;

implementation

{$R *.DFM}

procedure TCustomerDM.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  (Owner as TForm).Caption :=
    (Owner as TForm).Hint + ' - ' +
    Table1Company.AsString;
end;

end.
