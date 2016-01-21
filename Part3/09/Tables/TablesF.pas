unit TablesF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, DB, ExtCtrls, Buttons, Grids,
  DBGrids, DBTables;

type
  TMainForm = class(TForm)
    ListBox1: TListBox;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses
  FieldsF, DbGridF;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Session.GetDatabaseNames (ComboBox1.Items);
  // force an initial list in the listbox
  ComboBox1.Text := 'DBDEMOS';
  ComboBox1Change (Self);
  // force an initial selection in the DBGrid
  ListBox1.ItemIndex := 0;
  ListBox1Click (Self);
end;

procedure TMainForm.ComboBox1Change(Sender: TObject);
begin
  Session.GetTableNames (ComboBox1.Text, '',
    True, False, ListBox1.Items);
end;

procedure TMainForm.ListBox1Click(Sender: TObject);
begin
  Table1.Close;
  Table1.DatabaseName := ComboBox1.Text;
  Table1.Tablename :=
    Listbox1.Items [Listbox1.ItemIndex];
  Table1.Open;
  Caption := Format ('Table: %s - %s',
    [Table1.DatabaseName,
    Table1.Tablename]);
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
var
  I: Integer;
begin
  FieldsForm.FieldsList.Clear;
  for I := 0 to Table1.FieldCount - 1 do
  begin
    FieldsForm.FieldsList.Items.Add (
      Table1.Fields[I].FieldName);
    FieldsForm.FieldsList.Selected [I] :=
      Table1.Fields[I].Visible;
  end;
  if FieldsForm.ShowModal = mrOk then
    for I := 0 to Table1.FieldCount - 1 do
      Table1.Fields[I].Visible :=
        FieldsForm.FieldsList.Selected [I];
end;

procedure TMainForm.ListBox1DblClick(Sender: TObject);
var
  GridForm: TGridForm;
begin
  GridForm := TGridForm.Create (Self);
  {connect the table component to the selected
  table and activate it}
  GridForm.Table1.DatabaseName := ComboBox1.Text;
  GridForm.Table1.TableName :=
    Listbox1.Items [Listbox1.ItemIndex];
  try
    GridForm.Table1.Open;
    GridForm.Show;
  except
    GridForm.Close;
  end;
end;

end.
