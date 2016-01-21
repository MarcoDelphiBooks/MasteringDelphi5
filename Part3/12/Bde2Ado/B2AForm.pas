unit B2AForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ADODB, Db, DBTables, ExtCtrls;

type
  TForm1 = class(TForm)
    ADOCommand: TADOCommand;
    ADOConnection: TADOConnection;
    ListBox1: TListBox;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    btnGetStructure: TButton;
    BDETable: TTable;
    ADOTable: TADOTable;
    Memo1: TMemo;
    btnCreateTable: TButton;
    btnMoveData: TButton;
    procedure btnGetStructureClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure btnCreateTableClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure btnMoveDataClick(Sender: TObject);
  private
    function TableExists(TableName: string): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btnMoveDataClick(Sender: TObject);
var
  I: Integer;
begin
  BdeTable.Open;
  AdoTable.Open;
  try
    // for each record
    while not BdeTable.Eof do
    begin
      // new record
      AdoTable.Insert;
      // for each field
      for I := 0 to BdeTable.Fields.Count - 1 do
        with BdeTable.Fields [I] do
          AdoTable.FieldByName(Name).Value := Value;
      // post and move on
      AdoTable.Post;
      BdeTable.Next;
    end;
  finally
    BdeTable.Close;
    AdoTable.Close;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Session.GetDatabaseNames (ComboBox1.Items);
  // force an initial list in the listbox
  ComboBox1.Text := 'DBDEMOS';
  ComboBox1Change (Self);
  // select first item
  ListBox1.ItemIndex := 0;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  Session.GetTableNames (ComboBox1.Text, '*.db',
    False, False, ListBox1.Items);
end;

function TForm1.TableExists (TableName: string): Boolean;
var
  TablesList: TStringList;
begin
  // read table names from database
  TablesList := TStringList.Create;
  try
    ADOConnection.GetTableNames (TablesList);
    if TablesList.IndexOf (TableName) >= 0 then
      Result := True
    else
      Result := False;
  finally
    TablesList.Free;
  end;
end;

function AdoTypeName (fdef: TFieldDef): string;
begin
  case fdef.DataType of
    ftString: Result := 'TEXT(' + IntToStr (fdef.Size) + ')';
    ftSmallint: Result := 'SMALLINT';
    ftInteger: Result := 'INTEGER';
    ftWord: Result := 'WORD';
    ftBoolean: Result := 'YESNO';
    ftFloat: Result := 'FLOAT';
    ftCurrency: Result := 'CURRENCY';
    ftDate, ftTime, ftDateTime: Result := 'DATETIME';
    ftAutoInc: Result := 'COUNTER';
    ftBlob, ftGraphic: Result := 'LONGBINARY';
    ftMemo, ftFmtMemo: Result := 'MEMO';
  else
    Result := 'undefined';
  end; // case
end;

procedure TForm1.btnGetStructureClick(Sender: TObject);
var
  strField: string;
  I: Integer;
begin
  // clear output
  Memo1.Lines.Clear;

  // find a new table name
  AdoTable.TableName := (BdeTable.TableName);
  // check if the table already exists
  while TableExists (AdoTable.TableName) do
    AdoTable.TableName := AdoTable.TableName + 'New';
  Memo1.Lines.Add ('create table ' + AdoTable.TableName + ' (');

  // get field information
  BdeTable.FieldDefs.Update;
  for I := 0 to BdeTable.FieldDefs.Count - 1 do
  begin
    strField := '  ' +
      BdeTable.FieldDefs[I].Name + ' ' +
      AdoTypeName (BdeTable.FieldDefs[I]);
    // add comma or parenthesis
    if I < BdeTable.FieldDefs.Count - 1 then
      strField := strField + ','
    else
      strField := strField + ')';
    Memo1.Lines.Add (strField);
  end;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  // close table if open
  BdeTable.Close;
  // set database and table names
  BdeTable.DatabaseName := ComboBox1.Text;
  BdeTable.Tablename :=
    Listbox1.Items [Listbox1.ItemIndex];
end;

procedure TForm1.btnCreateTableClick(Sender: TObject);
begin
  ADOCommand.CommandText :=
    Memo1.Text;
  ADOCommand.Execute;
end;

end.
