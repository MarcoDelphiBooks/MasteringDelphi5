unit NavForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls,
  Mask, DB, DBTables, Printers;

type
  TNavigator = class(TForm)
    PrintButton: TButton;
    PrintAllButton: TButton;
    PrintFormButton: TButton;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Table1: TTable;
    DataSource1: TDataSource;
    ButtonReport: TButton;
    Table1Name: TStringField;
    Table1Capital: TStringField;
    Table1Continent: TStringField;
    Table1Population: TFloatField;
    procedure PrintButtonClick(Sender: TObject);
    procedure PrintFormButtonClick(Sender: TObject);
    procedure PrintAllButtonClick(Sender: TObject);
    procedure ButtonReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Navigator: TNavigator;

implementation

uses RptForm;

{$R *.DFM}

procedure TNavigator.PrintButtonClick(Sender: TObject);
var
  PrintFile: TextFile;
begin
  {assing the printer to a file}
  AssignPrn (PrintFile);
  Rewrite (PrintFile);
  try
    {set the font of the form, and output each element}
    Printer.Canvas.Font := Font;
    Writeln (PrintFile, Label1.Caption,
      ' ', DBEdit1.Text);
    Writeln (PrintFile, Label2.Caption,
      ' ', DBEdit2.Text);
    Writeln (PrintFile, Label3.Caption,
      ' ', DBEdit3.Text);
  finally
    {close the printing process}
    System.CloseFile (PrintFile);
  end;
end;

procedure TNavigator.PrintFormButtonClick(Sender: TObject);
begin
  Print;
end;

procedure TNavigator.PrintAllButtonClick(Sender: TObject);
var
  Bookmark: TBookmark;
  PrintFile: TextFile;
begin
  {assign the printer to a file}
  AssignPrn (PrintFile);
  Rewrite (PrintFile);
  {set the font of the form}
  Printer.Canvas.Font := Font;
  {store the current position, crating a new bookmark}
  Bookmark := Table1.GetBookmark;
  Table1.DisableControls;
  try
    Table1.First;
    while not Table1.EOF do
    begin
      {output the three fields, and a blank line}
      Writeln (PrintFile, 'Country: ',
        Table1.FieldByName ('Name').AsString);
      Writeln (PrintFile, 'Capital: ',
        Table1.FieldByName ('Capital').AsString);
      Writeln (PrintFile, 'Continent: ',
        Table1.FieldByName ('Continent').AsString);
      Writeln (PrintFile);
      Table1.Next;
    end;
  finally
    {go back to the bookmark and destroy it}
    Table1.GotoBookmark (Bookmark);
    Table1.FreeBookmark (Bookmark);
    Table1.EnableControls;
    System.CloseFile (PrintFile);
  end;
end;

procedure TNavigator.ButtonReportClick(Sender: TObject);
begin
  ReportForm.QuickRep1.Preview;
end;

end.
