unit DbEvtsF;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, DBTables, DB, Mask, DBCtrls, Grids, DBGrids,
  Menus, ExtCtrls;

type
  TForm1 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Table1Name: TStringField;
    Table1Capital: TStringField;
    Table1Continent: TStringField;
	 Table1Population: TFloatField;
    Table1Area: TFloatField;
    ListBox1: TListBox;
    Splitter1: TSplitter;
    PopupList: TPopupMenu;
    Addblank1: TMenuItem;
    Clear1: TMenuItem;
    SaveToDisk1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Timer1: TTimer;
    procedure Table1AfterCancel(DataSet: TDataset);
    procedure Table1AfterClose(DataSet: TDataset);
    procedure Table1AfterDelete(DataSet: TDataset);
    procedure Table1AfterEdit(DataSet: TDataset);
    procedure Table1AfterInsert(DataSet: TDataset);
    procedure Table1AfterOpen(DataSet: TDataset);
    procedure Table1AfterPost(DataSet: TDataset);
    procedure Table1BeforeCancel(DataSet: TDataset);
    procedure Table1BeforeClose(DataSet: TDataset);
    procedure Table1BeforeDelete(DataSet: TDataset);
    procedure Table1BeforeEdit(DataSet: TDataset);
    procedure Table1BeforeInsert(DataSet: TDataset);
    procedure Table1BeforeOpen(DataSet: TDataset);
    procedure Table1BeforePost(DataSet: TDataset);
    procedure Table1NewRecord(DataSet: TDataset);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DataSource1StateChange(Sender: TObject);
    procedure DataSource1UpdateData(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure AddBlankClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure SaveToDiskClick(Sender: TObject);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table1BeforeScroll(DataSet: TDataSet);
    procedure Table1DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure Table1EditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure Table1FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure Table1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure Table1UpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure Table1UpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FieldChange(Sender: TField);
    procedure FieldValidate(Sender: TField);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AddToList (Str: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Table1AfterCancel(DataSet: TDataset);
begin
  AddToList ('Table: AfterCancel');
end;

procedure TForm1.Table1AfterClose(DataSet: TDataset);
begin
  AddToList ('Table: AfterClose');
end;

procedure TForm1.Table1AfterDelete(DataSet: TDataset);
begin
  AddToList ('Table: AfterDelete')
end;

procedure TForm1.Table1AfterEdit(DataSet: TDataset);
begin
  AddToList ('Table: AfterEdit');
end;

procedure TForm1.Table1AfterInsert(DataSet: TDataset);
begin
  AddToList ('Table: AfterInsert');
end;

procedure TForm1.Table1AfterOpen(DataSet: TDataset);
begin
  AddToList ('Table: AfterOpen');
end;

procedure TForm1.Table1AfterPost(DataSet: TDataset);
begin
  AddToList ('Table: AfterPost');
end;

procedure TForm1.Table1BeforeCancel(DataSet: TDataset);
begin
  AddToList ('Table: BeforeCancel');
end;

procedure TForm1.Table1BeforeClose(DataSet: TDataset);
begin
  AddToList ('Table: BeforeClose');
end;

procedure TForm1.Table1BeforeDelete(DataSet: TDataset);
begin
  AddToList ('Table: BeforeDelete');
end;

procedure TForm1.Table1BeforeEdit(DataSet: TDataset);
begin
  AddToList ('Table: BeforeEdit');
end;

procedure TForm1.Table1BeforeInsert(DataSet: TDataset);
begin
  AddToList ('Table: BeforeInsert');
end;

procedure TForm1.Table1BeforeOpen(DataSet: TDataset);
begin
  AddToList ('Table: BeforeOpen');
end;

procedure TForm1.Table1BeforePost(DataSet: TDataset);
begin
  AddToList ('Table: BeforePost');
end;

procedure TForm1.Table1NewRecord(DataSet: TDataset);
begin
  AddToList ('Table: OnNewRecord');
end;

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  AddToList ('DataSource: OnDataChange');
end;

const
  States: array [0..5] of string =
  ('dsInactive', 'dsBrowse', 'dsEdit',
	'dsInsert', 'dsSetKey', 'dsCalcFields');

procedure TForm1.DataSource1StateChange(Sender: TObject);
var
  CurrState: string;
begin
  CurrState := States [
    Integer (DataSource1.State)];
  AddToList (
    'DataSource: StateChange (' + CurrState + ')');
end;

procedure TForm1.DataSource1UpdateData(Sender: TObject);
begin
  AddToList ('DataSource: UpdateData')
end;

procedure TForm1.DBGrid1ColEnter(Sender: TObject);
begin
  AddToList ('DBGrid: OnColEnter')
end;

procedure TForm1.DBGrid1ColExit(Sender: TObject);
begin
  AddToList ('DBGrid: OnColExit')
end;

procedure TForm1.AddBlankClick(Sender: TObject);
begin
  AddToList ('');
end;

procedure TForm1.ClearClick(Sender: TObject);
begin
  Listbox1.Items.Clear;
end;

procedure TForm1.SaveToDiskClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    ListBox1.Items.SaveToFile (SaveDialog1.FileName);
end;

procedure TForm1.AddToList(Str: string);
begin
  // add item and select it
  Listbox1.ItemIndex :=
    Listbox1.Items.Add (Str);
end;

procedure TForm1.Table1AfterScroll(DataSet: TDataSet);
begin
  AddToList ('Table: AfterScroll');
end;

procedure TForm1.Table1BeforeScroll(DataSet: TDataSet);
begin
  AddToList ('Table: BeforeScroll');
end;

procedure TForm1.Table1DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  AddToList ('Table: OnDeleteError');
end;

procedure TForm1.Table1EditError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  AddToList ('Table: OnEditError');
end;

procedure TForm1.Table1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  AddToList ('Table: OnFilterRecord');
end;

procedure TForm1.Table1CalcFields(DataSet: TDataSet);
begin
  AddToList ('Table: OnCalcFields');
end;

procedure TForm1.Table1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  AddToList ('Table: OnPostError');
end;

procedure TForm1.Table1UpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  AddToList ('Table: OnUpdateError');
end;

procedure TForm1.Table1UpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  AddToList ('Table: OnUpdateRecord');
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
  AddToList ('DBGrid: OnCellClick');
end;

procedure TForm1.FieldChange(Sender: TField);
begin
  AddToList ('Field ' + Sender.FieldName + ': OnChange');
end;

procedure TForm1.FieldValidate(Sender: TField);
begin
  AddToList ('Field ' + Sender.FieldName + ': OnValidate');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  // if the last item is not an empty line
  if ListBox1.Items [ListBox1.Items.Count -1] <> '' then
    // add one without moving the current selection
    ListBox1.Items.Add ('');
end;

end.
 