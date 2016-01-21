unit ShapesH;

interface

uses
  Windows, Graphics;

type
  TBaseShape = class
  private
    FBrushColor: TColor;
    FPenColor: TColor;
    FPenSize: Integer;
    procedure SetBrushColor(const Value: TColor);
    procedure SetPenColor(const Value: TColor);
    procedure SetPenSize(const Value: Integer);
    procedure SetBottom(const Value: Integer);
    procedure SetLeft(const Value: Integer);
    procedure SetRight(const Value: Integer);
    procedure SetTop(const Value: Integer);
  protected
    FRect: TRect;
  public
    procedure Paint (Canvas: TCanvas; Scale: Integer = 1); virtual;
  published
    property PenSize: Integer read FPenSize write SetPenSize;
    property PenColor: TColor read FPenColor write SetPenColor;
    property BrushColor: TColor read FBrushColor write SetBrushColor;
    property Left: Integer write SetLeft;
    property Right: Integer write SetRight;
    property Top: Integer write SetTop;
    property Bottom: Integer write SetBottom;
    property Rect: TRect read FRect;
  end;

type
  TEllShape = class (TBaseShape)
    procedure Paint (Canvas: TCanvas; Scale: Integer = 1); override;
  end;

  TRectShape = class (TBaseShape)
    procedure Paint (Canvas: TCanvas; Scale: Integer = 1); override;
  end;


implementation

{ TBaseShape }

procedure TBaseShape.Paint (Canvas: TCanvas; Scale: Integer);
begin
  // set the attributes
  Canvas.Pen.Color := fPenColor;
  Canvas.Pen.Width := fPenSize;
  Canvas.Brush.Color := fBrushColor;
end;

procedure TBaseShape.SetBottom(const Value: Integer);
begin
  fRect.Bottom := Value;
end;

procedure TBaseShape.SetBrushColor(const Value: TColor);
begin
  FBrushColor := Value;
end;

procedure TBaseShape.SetLeft(const Value: Integer);
begin
  fRect.Left := Value;
end;

procedure TBaseShape.SetPenColor(const Value: TColor);
begin
  FPenColor := Value;
end;

procedure TBaseShape.SetPenSize(const Value: Integer);
begin
  FPenSize := Value;
end;

procedure TBaseShape.SetRight(const Value: Integer);
begin
  fRect.Right := Value;
end;

procedure TBaseShape.SetTop(const Value: Integer);
begin
  fRect.Top := Value;
end;

{ TEllShape }

procedure TEllShape.Paint(Canvas: TCanvas; Scale: Integer);
begin
  inherited Paint (Canvas);
  Canvas.Ellipse (fRect.Left * Scale, fRect.Top * Scale,
    fRect.Right * Scale, fRect.Bottom * Scale)
end;

{ TRectShape }

procedure TRectShape.Paint(Canvas: TCanvas; Scale: Integer);
begin
  inherited Paint (Canvas);
  Canvas.Rectangle (fRect.Left * Scale, fRect.Top * Scale,
    fRect.Right * Scale, fRect.Bottom * Scale)
end;

end.
