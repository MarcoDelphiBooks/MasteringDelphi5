unit AdoMDForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    ADOConnection: TADOConnection;
    ADODataSet3: TADODataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADOTable1CustNo: TFloatField;
    ADOTable1Company: TWideStringField;
    ADOTable1Addr1: TWideStringField;
    ADOTable1Addr2: TWideStringField;
    ADOTable1City: TWideStringField;
    ADOTable1State: TWideStringField;
    ADOTable1Zip: TWideStringField;
    ADOTable1Country: TWideStringField;
    ADOTable1Phone: TWideStringField;
    ADOTable1FAX: TWideStringField;
    ADOTable1TaxRate: TFloatField;
    ADOTable1Contact: TWideStringField;
    ADOTable1LastInvoiceDate: TDateField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  AdoTAble1.Open;
  Adotable2.Open;
  AdoDataSet3.Open;
end;

end.
