unit formDbThread;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, DBTables, StdCtrls, dbthreadclass, ExtCtrls;

type
  TForm1 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
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
    ListBox1: TListBox;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure Table1AfterScroll(DataSet: TDataSet);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Table1.Active := True;
end;

procedure TForm1.Table1AfterScroll(DataSet: TDataSet);
var
  Th1: TDatabaseThread;
begin
  // create and start a new thread
  Th1 := TDatabaseThread.Create (True);
  Th1.Priority := tpLowest;
  Th1.FreeOnTerminate := True;
  Th1.CustNo := Table1CustNo.AsInteger;
  Th1.Resume;
end;

end.
