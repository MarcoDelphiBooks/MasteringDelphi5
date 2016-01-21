unit DbgridF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, Grids, DBGrids, ExtCtrls, DBCtrls,
  StdCtrls, Buttons, Fieldsf;

type
  TGridForm = class(TForm)
    DBGrid1: TDBGrid;
    Table1: TTable;
    DataSource1: TDataSource;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    SpeedButton1: TSpeedButton;
    ComboBox1: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GridForm: TGridForm;

implementation

{$R *.DFM}

procedure TGridForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TGridForm.SpeedButton1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Table1.FieldCount - 1 do
  begin
    FieldsForm.FieldsList.Items.Add (Table1.Fields[I].FieldName);
    if Table1.Fields[I].Visible then
      FieldsForm.FieldsList.Selected [I] := True;
  end;
  if FieldsForm.ShowModal = mrOk then
    for I := 0 to Table1.FieldCount - 1 do
      Table1.Fields[I].Visible := FieldsForm.FieldsList.Selected [I];
  FieldsForm.FieldsList.Clear;
end;

procedure TGridForm.ComboBox1Change(Sender: TObject);
begin
  // toggle the visibility of the field
  Table1.FieldByName (ComboBox1.Text).Visible :=
    not Table1.FieldByName (ComboBox1.Text).Visible;
end;

procedure TGridForm.FormShow(Sender: TObject);
var
  I: Integer;
begin
  Caption := Format ('Table: %s - %s',
    [Table1.DatabaseName, Table1.TableName]);

  // fill the combo box with the names of the fields
  ComboBox1.Items.Clear;
  for I := 0 to Table1.FieldCount - 1 do
    ComboBox1.Items.Add (Table1.Fields[I].FieldName);
end;

end.
