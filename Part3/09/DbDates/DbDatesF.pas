unit DbDatesF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, DBCtrls, Db, DBTables, ExtCtrls,
  Grids, DBGrids, DBCGrids;

type
  TForm1 = class(TForm)
    Table1: TTable;
    DBEdit2: TDBEdit;
    DBNavigator1: TDBNavigator;
    Table1EventNo: TAutoIncField;
    Table1VenueNo: TIntegerField;
    Table1Event_Name: TStringField;
    Table1Event_Date: TDateField;
    Table1Event_Time: TTimeField;
    Table1Event_Description: TMemoField;
    Table1Ticket_price: TCurrencyField;
    Table1Event_Photo: TGraphicField;
    DBImage1: TDBImage;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    DataSource1: TDataSource;
    MonthCalendar1: TMonthCalendar;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure MonthCalendar1Click(Sender: TObject);
    procedure DataSource1UpdateData(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  MonthCalendar1.Date := Table1Event_Date.Value;
end;

procedure TForm1.MonthCalendar1Click(Sender: TObject);
begin
  // disconnect handler
  DataSource1.OnDataChange := nil;
  // set table in edit mode
  Table1.Edit;
  // reconnect handler
  DataSource1.OnDataChange := DataSource1DataChange;
end;

procedure TForm1.DataSource1UpdateData(Sender: TObject);
begin
  Table1Event_Date.Value := MonthCalendar1.Date;
end;

end.
