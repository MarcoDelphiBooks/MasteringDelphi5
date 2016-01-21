unit ParQForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, DB, DBTables, DBLookup,
  Grids, DBGrids;

type
  TQueryForm = class(TForm)
    DataSource1: TDataSource;
    Query1: TQuery;
    ListBox1: TListBox;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    Query2: TQuery;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Query1BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QueryForm: TQueryForm;

implementation

{$R *.DFM}

procedure TQueryForm.FormCreate(Sender: TObject);
begin
  // get the list of continents
  Query2.Open;
  while not Query2.EOF do
  begin
    ListBox1.Items.Add (Query2.Fields [0].AsString);
    Query2.Next;
  end;
  ListBox1.ItemIndex := 0;

  // prepare and open the first query
  Query1.Prepare;
  Query1.Params[0].Value := ListBox1.Items [0];
  Query1.Open;
end;

procedure TQueryForm.ListBox1Click(Sender: TObject);
begin
  Query1.Close;
  Query1.Params[0].Value :=
    ListBox1.Items [Listbox1.ItemIndex];
  Query1.Open;
end;

procedure TQueryForm.FormDestroy(Sender: TObject);
begin
  Query1.Close;
  Query1.Unprepare;
end;

procedure TQueryForm.Query1BeforePost(DataSet: TDataSet);
var
  StrNewCont: string;
begin
  // add the continent, if not already in the list
  StrNewCont := Query1.FieldByName ('Continent').AsString;
  if ListBox1.Items.IndexOf (StrNewCont) < 0 then
    ListBox1.Items.Add (StrNewCont);
end;

end.
