unit DbPackF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBTables, Db;

type
  TForm1 = class(TForm)
    BtnDbase: TButton;
    BtnPdx: TButton;
    ListDbase: TListBox;
    ListPdx: TListBox;
    Table1: TTable;
    procedure FormCreate(Sender: TObject);
    procedure BtnPdxClick(Sender: TObject);
    procedure BtnDbaseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  BDE;

procedure PackPdoxTable (Table:TTable);
var
  TableDesc: CRTblDesc;
  WasActive: Boolean;
  hDatabase: hDbiDB;
begin
  WasActive := Table.Active;
  Screen.Cursor := crHourglass;
  try
    // open if it was closed
    // (to get the valid DBHandle)
    if not WasActive then
      Table.Open;
    // get the database handle and close the table
    hDatabase := Table.DBHandle;
    Table.Close;
    // fill the table descriptor
    FillChar (TableDesc, SizeOf (CRTblDesc), 0);
    with TableDesc do
    begin
      StrPCopy (szTblName, Table.TableName);
      StrPCopy (szTblType, szParadox);
      bPack := True;
    end;
    // restructure the table, packing it
    if hDatabase <> nil then
      Check (DBIDoRestructure (hDatabase, 1,
        @TableDesc, nil, nil, nil, False))
    else
      ShowMessage ('Database handle is nil');
  finally
    Screen.Cursor := crDefault;
    // eventually reopen
    if WasActive then
      Table.Open;
  end;
end;

procedure PackDBaseTable (Table: TTable);
var
  WasActive: Boolean;
begin
  WasActive  := Table.Active;
  Screen.Cursor := crHourglass;
  try
    // close if open
    if WasActive then
      Table.Close;
    // reopen in exclusive mode
    Table.Exclusive := True;
    Table.Open;
    // pack the table
    Check (DBIPackTable (Table.DBHandle,
      Table.Handle, nil, nil, True));
    // remove the exclusive mode
    Table.Close;
    Table.Exclusive := False;
  finally
    Screen.Cursor := crDefault;
    // eventually reopen
    if WasActive then
      Table.Open;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // get the table names
  Session.GetTableNames (Table1.DatabaseName,
    '*.db', True, False, ListPdx.Items);
  Session.GetTableNames (Table1.DatabaseName,
    '*.dbf', True, False, ListDbase.Items);
  // select the first item of each list
  ListPdx.ItemIndex := 0;
  ListDbase.ItemIndex := 0;
end;

procedure TForm1.BtnPdxClick(Sender: TObject);
begin
  Table1.TableName :=
    ListPdx.Items [ListPdx.ItemIndex];
  PackPdoxTable (Table1);
end;

procedure TForm1.BtnDbaseClick(Sender: TObject);
begin
  Table1.TableName :=
    ListDbase.Items [ListDbase.ItemIndex];
  PackDBaseTable (Table1);
end;

end.
