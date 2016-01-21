unit OfficeForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, Forms, DBCtrls, StdCtrls, DBTables,
  ExtCtrls, Mask, Db, Dialogs, Excel97, Word97,
  OleServer;

type
  TFormOff = class(TForm)
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    Table1: TTable;
    DataSource1: TDataSource;
    BtnWord: TButton;
    BtnExcel: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    WordDocument1: TWordDocument;
    procedure BtnWordClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
  end;

var
  FormOff: TFormOff;

implementation

{$R *.DFM}

uses
  ComObj, ActiveX;

procedure TFormOff.BtnWordClick(Sender: TObject);
var
  Bookmark: TBookmark;
  RangeW: Word97.Range;
  v1: Variant;
  ov1: OleVariant;
  Row1: Word97.Row;
begin
  WordDocument1.Activate;
  // insert title
  WordDocument1.Range.Text := 'American Capitals from ' + Table1.TableName;
  WordDocument1.Range.Font.Size := 14;
  // disable the UI
  Table1.DisableControls;
  try
    // store the current position
    Bookmark := Table1.GetBookmark;
    try
      // scan the database table
      Table1.First;
      while not Table1.EOF do
      begin
        // send the two fields
        WordDocument1.Range.InsertParagraphAfter;
        WordDocument1.Paragraphs.Last.Range.Text :=
          Table1.FieldByName ('Name').AsString + #9 +
          Table1.FieldByName ('Capital').AsString;
        Table1.Next;
      end;
    finally
      // go back to the bookmark and destroy it
      Table1.GotoBookmark (Bookmark);
      Table1.FreeBookmark (Bookmark);
    end;
  finally
    // re-enable the controls
    Table1.EnableControls;
  end;
  RangeW := WordDocument1.Content;
  v1 := RangeW;
  v1.ConvertToTable (#9, 19, 2);
  Row1 := WordDocument1.Tables.Item(1).Rows.Get_First;
  Row1.Range.Bold := 1;
  Row1.Range.Font.Size := 30;
  Row1.Range.InsertParagraphAfter;
  ov1 := ' ';
  Row1.ConvertToText (ov1);
end;

procedure TFormOff.BtnExcelClick(Sender: TObject);
var
  RangeE: Excel97.Range;
  I, Row: Integer;
  Bookmark: TBookmarkStr;
begin
  // create and show
  ExcelApplication1.Visible [0] := True;
  ExcelApplication1.Workbooks.Add (NULL, 0);
  // fill is the first row with field titles
  RangeE := ExcelApplication1.ActiveCell;
  for I := 0 to Table1.Fields.Count - 1 do
  begin
    RangeE.Value := Table1.Fields [I].DisplayLabel;
    RangeE := RangeE.Next;
  end;
  // add field data in following rows
  Table1.DisableControls;
  try
    Bookmark := Table1.Bookmark;
    try
      Table1.First;
      Row := 2;
      while not Table1.EOF do
      begin
        RangeE := ExcelApplication1.Range ['A' + IntToStr (Row),
          'A' + IntToStr (Row)];
        for I := 0 to Table1.Fields.Count - 1 do
        begin
          RangeE.Value := Table1.Fields [I].AsString;
          RangeE := RangeE.Next;
        end;
        Table1.Next;
        Inc (Row);
      end;
    finally
      Table1.Bookmark := Bookmark;
    end;
  finally
    Table1.EnableControls;
  end;
  // format the section
  RangeE := ExcelApplication1.Range ['A1', 'E' + IntToStr (Row - 1)];
  RangeE.AutoFormat (3, NULL, NULL, NULL, NULL, NULL, NULL);
end;

initialization
  CoInitialize (nil);
end.
