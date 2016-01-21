unit CalcF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls;

type
  TCalcForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    DataSource1: TDataSource;
    Table1: TTable;
    Table1PopulationDensity: TFloatField;
    Table1Area: TFloatField;
    Table1Population: TFloatField;
    Table1Name: TStringField;
    Table1Capital: TStringField;
    Table1Continent: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure Table1CalcFields(DataSet: TDataset);
    procedure DBGrid1EditButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  CalcForm: TCalcForm;

implementation

uses Dialogs;

{$R *.DFM}

procedure TCalcForm.FormCreate(Sender: TObject);
begin
  Table1.Open;
end;

procedure TCalcForm.Table1CalcFields(DataSet: TDataset);
begin
  // plain version (very dangerous)
{  Table1PopulationDensity.Value :=
    Table1Population.Value / Table1Area.Value;}

  // version based on exceptions (ok)
{  try
    Table1PopulationDensity.Value :=
      Table1Population.Value / Table1Area.Value;
  except
    on Exception do
      Table1PopulationDensity.Value := 0;
  end;}

  // definitive version
  if not Table1Area.IsNull and
      (Table1Area.Value <> 0) then
    Table1PopulationDensity.Value :=
      Table1Population.Value / Table1Area.Value
  else
      Table1PopulationDensity.Value := 0;
end;

procedure TCalcForm.DBGrid1EditButtonClick(Sender: TObject);
begin
  MessageDlg (Format (
    'The population density (%.2n)'#13 +
    'is the Population (%.0n)'#13 +
    'devided by the Area (%.0n).'#13#13 +
    'Edit these two fields to change it.',
    [Table1PopulationDensity.AsFloat,
    Table1Population.AsFloat,
    Table1Area.AsFloat]),
    mtInformation, [mbOK], 0);
end;

end.