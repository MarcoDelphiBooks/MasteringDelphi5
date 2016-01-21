unit FontGF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  I, J: Integer;
begin
  {the number of columns equals the number of fonts plus
  1 for the first fixed column, which has a size of 20}
  StringGrid1.ColCount := Screen.Fonts.Count + 1;
  StringGrid1.ColWidths [0] := 50;

  for I := 1 to Screen.Fonts.Count do
  begin
    // write the name of the font in the first row
    StringGrid1.Cells [I, 0] := Screen.Fonts.Strings [I-1];

    {compute maximum required size of column, getting the width
    of the text with the biggest size of the font of the column}
    StringGrid1.Canvas.Font.Name := StringGrid1.Cells [I, 0];
    StringGrid1.Canvas.Font.Size := 32;
    StringGrid1.ColWidths [I] :=
      StringGrid1.Canvas.TextWidth ('AaBbYyZz');
  end;

  // defines the number of columns
  StringGrid1.RowCount := 26;
  for I := 1 to 25 do
  begin
    // write the number in the first column
    StringGrid1.Cells [0, I] := IntToStr (I+7);
    // set an increasing height for the rows
    StringGrid1.RowHeights [I] := 15 + I*2;
    // insert default text in each column
    for J := 1 to StringGrid1.ColCount do
      StringGrid1.Cells [J, I] := 'AaBbYyZz'
  end;
  StringGrid1.RowHeights [0] := 25;
end;

procedure TForm1.StringGrid1DrawCell (Sender: TObject;
  Col, Row: Integer; Rect: TRect; State: TGridDrawState);
begin
  // select a font, depending on the column
  if (Col = 0) or (Row = 0) then
    StringGrid1.Canvas.Font.Name := 'Arial'
  else
    StringGrid1.Canvas.Font.Name := StringGrid1.Cells [Col, 0];

  // select the size of the font, depending on the row
  if Row = 0 then
    StringGrid1.Canvas.Font.Size := 14
  else
    StringGrid1.Canvas.Font.Size := Row + 7;

  // select the background color
  if gdSelected in State then
    StringGrid1.Canvas.Brush.Color := clHighlight
  else if gdFixed in State then
    StringGrid1.Canvas.Brush.Color := clBtnFace
  else
    StringGrid1.Canvas.Brush.Color := clWindow;

  // output the text
  StringGrid1.Canvas.TextRect (Rect, Rect.Left, Rect.Top,
    StringGrid1.Cells [Col, Row]);

  // draw the focus
  if gdFocused in State then
    StringGrid1.Canvas.DrawFocusRect (Rect);
end;

end.
