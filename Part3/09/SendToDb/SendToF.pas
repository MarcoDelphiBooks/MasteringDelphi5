unit SendToF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, StdCtrls, Grids, DBGrids, ComCtrls;

type
  TForm1 = class(TForm)
    Table1: TTable;
    Table1Name: TStringField;
    Table1Capital: TStringField;
    Table1Continent: TStringField;
    Table1Area: TFloatField;
    Table1Population: TFloatField;
    EditCapital: TEdit;
    EditPopulation: TEdit;
    EditArea: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboContinent: TComboBox;
    Button1: TButton;
    Button2: TButton;
    ComboName: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboNameKeyPress(Sender: TObject; var Key: Char);
    procedure ComboNameClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GetData;
    procedure SendData;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.GetData;
begin
  Table1.FindNearest ([ComboName.Text]);
  ComboName.Text := Table1Name.AsString;
  EditCapital.Text := Table1Capital.AsString;
  ComboContinent.Text := Table1Continent.AsString;
  EditArea.Text := Table1Area.AsString;
  EditPopulation.Text := Table1Population.AsString;
end;

procedure TForm1.SendData;
begin
  // raise an exception if there is no name
  if ComboName.Text = '' then
    raise Exception.Create ('Insert the name');

  // check if the record is already in the table    
  if Table1.FindKey ([ComboName.Text]) then
  begin
    // modify found record
    Table1.Edit;
    Table1Capital.AsString := EditCapital.Text;
    Table1Continent.AsString := ComboContinent.Text;
    Table1Area.AsString := EditArea.Text;
    Table1Population.AsString := EditPopulation.Text;
    Table1.Post;
  end
  else
  begin
    // insert new record
    Table1.InsertRecord ([ComboName.Text,
      EditCapital.Text, ComboContinent.Text,
      EditArea.Text, EditPopulation.Text]);
    // add to list
    ComboName.Items.Add (ComboName.Text)
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  GetData;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SendData;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // fill the list of names
  Table1.Open;
  while not Table1.Eof do
  begin
    ComboName.Items.Add (Table1Name.AsString);
    Table1.Next;
  end;
end;

procedure TForm1.ComboNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    GetData;
end;

procedure TForm1.ComboNameClick(Sender: TObject);
begin
  GetData;
end;

end.
