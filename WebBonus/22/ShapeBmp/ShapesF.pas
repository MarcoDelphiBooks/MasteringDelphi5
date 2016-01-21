unit ShapesF;

interface

uses Windows, Classes, Graphics, Forms, Controls, Menus,
  Dialogs, ExtCtrls, SysUtils;

type
  TShapesForm = class(TForm)
    MainMenu1: TMainMenu;
    ColorDialog1: TColorDialog;
    File1: TMenuItem;
    New1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Colors1: TMenuItem;
    PenColor1: TMenuItem;
    BrushColor1: TMenuItem;
    Size1: TMenuItem;
    IncreasePenSize1: TMenuItem;
    DecreasePenSize1: TMenuItem;
    Help1: TMenuItem;
    AboutShapes1: TMenuItem;
    Image1: TImage;
    Saveas1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Load1: TMenuItem;
    OpenDialog1: TOpenDialog;
    procedure PenColor1Click(Sender: TObject);
    procedure BrushColor1Click(Sender: TObject);
    procedure IncreasePenSize1Click(Sender: TObject);
    procedure DecreasePenSize1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AboutShapes1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Saveas1Click(Sender: TObject);
    procedure Load1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    fChanged: Boolean;
    fDragging: Boolean;
    fRect: TRect;
  end;

var
  ShapesForm: TShapesForm;

implementation

{$R *.DFM}

function NormalizeRect (ARect: TRect): TRect;
var
  tmp: Integer;
begin
  if ARect.Bottom < ARect.Top then
  begin
    tmp := ARect.Bottom;
    ARect.Bottom := ARect.Top;
    ARect.Top := tmp;
  end;
  if ARect.Right < ARect.Left then
  begin
    tmp := ARect.Right;
    ARect.Right := ARect.Left;
    ARect.Left := tmp;
  end;
  Result := ARect;
end;

procedure TShapesForm.PenColor1Click(Sender: TObject);
begin
  // select a new color for the pen
  ColorDialog1.Color := Image1.Canvas.Pen.Color;
  if ColorDialog1.Execute then
    Image1.Canvas.Pen.Color := ColorDialog1.Color;
end;

procedure TShapesForm.BrushColor1Click(Sender: TObject);
begin
  // select a new color for the brush
  ColorDialog1.Color := Image1.Canvas.Brush.Color;
  if ColorDialog1.Execute then
    Image1.Canvas.Brush.Color := ColorDialog1.Color;
end;

procedure TShapesForm.IncreasePenSize1Click(Sender: TObject);
begin
  // increase the size of the pen
  Image1.Canvas.Pen.Width := Image1.Canvas.Pen.Width + 2;
  DecreasePenSize1.Enabled := True;
end;

procedure TShapesForm.DecreasePenSize1Click(Sender: TObject);
begin
  {decrease the size of the pen,
  avoiding letting it go below zero}
  Image1.Canvas.Pen.Width := Image1.Canvas.Pen.Width - 2;
  if Image1.Canvas.Pen.Width < 3 then
    DecreasePenSize1.Enabled := False;
end;

procedure TShapesForm.FormCreate(Sender: TObject);
begin
  fChanged := False;
end;

procedure TShapesForm.AboutShapes1Click(Sender: TObject);
begin
  // show a message box
  MessageDlg ('ShapeBmp application'#13 +
    'from "Mastering Delphi" by Marco Cantù',
    mtInformation, [mbOK], 0);
end;

procedure TShapesForm.Exit1Click(Sender: TObject);
begin
  {close the form and the application}
  Close;
end;

procedure TShapesForm.New1Click(Sender: TObject);
var
  Area: TRect;
  OldColor: TColor;
begin
  if not fChanged or (MessageDlg ('Are you sure you want to delete the current image?',
    mtConfirmation, [mbYes, mbNo], 0) = idYes) then
  begin
    {repaint the surface, covering the whole area,
    and resetting the old brush}
    Area := Rect (0, 0, Image1.Picture.Width,
      Image1.Picture.Height);
    OldColor := Image1.Canvas.Brush.Color;
    Image1.Canvas.Brush.Color := clWhite;
    Image1.Canvas.FillRect (Area);
    Image1.Canvas.Brush.Color := OldColor;
    fChanged := False;
  end
end;

procedure TShapesForm.Image1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    // start dragging
    fDragging := True;
    SetCapture (Handle);
    fRect.Left := X;
    fRect.Top := Y;
    fRect.BottomRight := fRect.TopLeft;
    Canvas.DrawFocusRect (fRect);
  end;
end;

procedure TShapesForm.Image1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  ARect: TRect;
begin
  // display the position of the mouse in the caption
  Caption := Format ('ShapeBmp (x=%d, y=%d)', [X, Y]);
  if fDragging then
  begin
    // remove and redraw the dragging rectangle
    ARect := NormalizeRect (fRect);
    Canvas.DrawFocusRect (ARect);
    fRect.Right := X;
    fRect.Bottom := Y;
    ARect := NormalizeRect (fRect);
    Canvas.DrawFocusRect (ARect);
  end
  else
    if ssShift in Shift then
      // mark point in red
      Image1.Canvas.Pixels [X, Y] := clRed;
end;

procedure TShapesForm.Saveas1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    Image1.Picture.SaveToFile (SaveDialog1.Filename);
    fChanged := False;
  end;
end;

procedure TShapesForm.Load1Click(Sender: TObject);
var
  PenCol, BrushCol: TColor;
  PenSize: Integer;
begin
  if not fChanged or (MessageDlg ('Are you sure you want to delete the current image?',
      mtConfirmation, [mbYes, mbNo], 0) = idYes) then
    if OpenDialog1.Execute then
    begin
      PenCol := Image1.Canvas.Pen.Color;
      BrushCol := Image1.Canvas.Brush.Color;
      PenSize := Image1.Canvas.Pen.Width;
      Image1.Picture.LoadFromFile (OpenDialog1.Filename);
      Image1.Canvas.Pen.Color := PenCol;
      Image1.Canvas.Brush.Color := BrushCol;
      Image1.Canvas.Pen.Width := PenSize;
      fChanged := False;
    end;
end;

procedure TShapesForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not fChanged or (MessageDlg ('Are you sure you want to delete the current image?',
      mtConfirmation, [mbYes, mbNo], 0) = idYes) then
    CanClose := True
  else
    CanClose := False;
end;

procedure TShapesForm.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if fDragging then
  begin
    ReleaseCapture;
    fDragging := False;
    Image1.Canvas.Rectangle (fRect.Left, fRect.Top,
      fRect.Right, fRect.Bottom);
  end;
end;

end.

