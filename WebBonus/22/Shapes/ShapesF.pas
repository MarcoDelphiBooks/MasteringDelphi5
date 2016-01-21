unit ShapesF;

interface

uses
  Windows, Classes, Graphics, Forms, Controls, Menus,
  Dialogs, SysUtils, ShapesH;

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
    BackGroundColor1: TMenuItem;
    Size1: TMenuItem;
    IncreasePenSize1: TMenuItem;
    DecreasePenSize1: TMenuItem;
    Help1: TMenuItem;
    AboutShapes1: TMenuItem;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PenColor1Click(Sender: TObject);
    procedure BrushColor1Click(Sender: TObject);
    procedure BackGroundColor1Click(Sender: TObject);
    procedure IncreasePenSize1Click(Sender: TObject);
    procedure DecreasePenSize1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure AboutShapes1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    ShapesList: TList;
    CurrShape: TBaseShape;
    fDragging: Boolean;
  public
    { Public declarations }
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

procedure TShapesForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    // activate dragging
    fDragging := True;
    SetCapture (Handle);

    // create the proper object
    if ssShift in Shift then
      CurrShape := TEllShape.Create
    else
      CurrShape := TRectShape.Create;

    // set the style and colors
    CurrShape.PenSize := Canvas.Pen.Width;
    CurrShape.PenColor := Canvas.Pen.Color;
    CurrShape.BrushColor := Canvas.Brush.Color;

    // set the initial position
    CurrShape.Left := X;
    CurrShape.Top := Y;
    CurrShape.Right := X;
    CurrShape.Bottom := Y;
    Canvas.DrawFocusRect (CurrShape.Rect);

    // add to the list
    ShapesList.Add (CurrShape);
  end;
end;

procedure TShapesForm.PenColor1Click(Sender: TObject);
begin
  // select a new color for the pen
  ColorDialog1.Color := Canvas.Pen.Color;
  if ColorDialog1.Execute then
    Canvas.Pen.Color := ColorDialog1.Color;
end;

procedure TShapesForm.BrushColor1Click(Sender: TObject);
begin
  // select a new color for the brush
  ColorDialog1.Color := Canvas.Brush.Color;
  if ColorDialog1.Execute then
    Canvas.Brush.Color := ColorDialog1.Color;
end;

procedure TShapesForm.BackGroundColor1Click(Sender: TObject);
begin
  // select a new color for the background of the form
  ColorDialog1.Color := Color;
  if ColorDialog1.Execute then
    Color := ColorDialog1.Color;
end;

procedure TShapesForm.IncreasePenSize1Click(Sender: TObject);
begin
  // increase the size of the pen
  Canvas.Pen.Width := Canvas.Pen.Width + 2;
  DecreasePenSize1.Enabled := True;
end;

procedure TShapesForm.DecreasePenSize1Click(Sender: TObject);
begin
  {decrease the size of the pen,
  avoiding to let it go below zero}
  Canvas.Pen.Width := Canvas.Pen.Width - 2;
  if Canvas.Pen.Width < 3 then
    DecreasePenSize1.Enabled := False;
end;

procedure TShapesForm.FormCreate(Sender: TObject);
begin
  // initialization and creation of the list
  ShapesList := TList.Create;
  Canvas.Pen.Style := psInsideFrame;
end;

procedure TShapesForm.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  ARect: TRect;
begin
  // copy the mouse coordinates to the title
  Caption := Format ('Shapes (x=%d, y=%d)', [X, Y]);

  // dragging code
  if fDragging then
  begin
    // remove and redraw the dragging rectangle
    ARect := NormalizeRect (CurrShape.Rect);
    Canvas.DrawFocusRect (ARect);
    CurrShape.Right := X;
    CurrShape.Bottom := Y;
    ARect := NormalizeRect (CurrShape.Rect);
    Canvas.DrawFocusRect (ARect);
  end;
end;

procedure TShapesForm.AboutShapes1Click(Sender: TObject);
begin
  // show a message box
  MessageDlg ('Shapes application'#13 +
    'from "Mastering Delphi" by Marco Cantù',
    mtInformation, [mbOK], 0);
end;

procedure TShapesForm.Exit1Click(Sender: TObject);
begin
  // close the form and the application
  Close;
end;

procedure TShapesForm.New1Click(Sender: TObject);
var
  I: Integer;
begin
  {repaint the surface, after removing the elements
  from the list, if there is any element and the
  user confirms the request}
  if (ShapesList.Count > 0) and
    (MessageDlg ('Are you sure you want to delete all the shapes?',
    mtConfirmation, [mbYes, mbNo], 0) = idYes) then
  begin
    // delete each object
    for I := ShapesList.Count - 1 downto 0 do
      TBaseShape (ShapesList [I]).Free;
    ShapesList.Clear;
    Refresh;
  end;
end;

procedure TShapesForm.FormPaint(Sender: TObject);
var
  I, OldPenW: Integer;
  AShape: TBaseShape;
  OldPenCol, OldBrushCol: TColor;
begin
  // store the current Canvas attributes
  OldPenCol := Canvas.Pen.Color;
  OldPenW := Canvas.Pen.Width;
  OldBrushCol := Canvas.Brush.Color;

  // repaint each shape of the list
  for I := 0 to ShapesList.Count - 1 do
  begin
    AShape := ShapesList.Items [I];
    AShape.Paint (Canvas);
  end;

  // reset the current Canvas attributes
  Canvas.Pen.Color := OldPenCol;
  Canvas.Pen.Width := OldPenW;
  Canvas.Brush.Color := OldBrushCol;
end;

procedure TShapesForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  {ask the user to confirm closing}
  if MessageDlg ('Are you sure you want to exit?',
      mtConfirmation, [mbYes, mbNo], 0) = idNo then
    CanClose := False;
end;

procedure TShapesForm.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  // delete each object
  for I := ShapesList.Count - 1 downto 0 do
    TBaseShape (ShapesList [I]).Free;
  ShapesList.Free;
end;

procedure TShapesForm.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  ARect: TRect;
begin
  if fDragging then
  begin
    // end dragging
    ReleaseCapture;
    fDragging := False;

    // set the final size
    ARect := NormalizeRect (CurrShape.Rect);
    Canvas.DrawFocusRect (ARect);
    CurrShape.Right := X;
    CurrShape.Bottom := Y;

    // optimized invalidate code
    ARect := NormalizeRect (CurrShape.Rect);
    InvalidateRect (Handle, @ARect, False);
  end;
end;

end.

