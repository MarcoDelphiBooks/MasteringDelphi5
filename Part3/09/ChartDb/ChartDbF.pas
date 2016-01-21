unit ChartDbF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, DB, DBTables, ExtCtrls, TeEngine, Series,
  TeeProcs, Chart, DBChart, StdCtrls;

type
  TForm1 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBChart1: TDBChart;
    Series1: TPieSeries;
    Splitter1: TSplitter;
    RadioArea: TRadioButton;
    RadioPopulation: TRadioButton;
    procedure DataSource1StateChange(Sender: TObject);
    procedure RadioPopulationClick(Sender: TObject);
    procedure RadioAreaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.DataSource1StateChange(Sender: TObject);
var
  Title: string;
begin
  case Table1.State of
    dsBrowse: Title := 'Browse';
    dsEdit: Title := 'Edit';
    dsInsert: Title := 'Insert';
  else
    Title := 'Other state';
  end;
  Caption := 'Grid Demo - ' + Title;
end;

procedure TForm1.RadioPopulationClick(Sender: TObject);
begin
  DBChart1.Title.Text [0] := 'Population of Countries';
  (DBChart1.Series [0] as TPieSeries).
    PieValues.ValueSource := 'Population';
end;

procedure TForm1.RadioAreaClick(Sender: TObject);
begin
  DBChart1.Title.Text [0] := 'Area of Countries';
  (DBChart1.Series [0] as TPieSeries).
    PieValues.ValueSource := 'Area';
end;

end.
