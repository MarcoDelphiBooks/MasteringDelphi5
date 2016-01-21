unit BreakpF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormPaint(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    X1, Y1, X2, Y2: Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormPaint(Sender: TObject);
begin
  {set a breakpoint on the next line}
  Canvas.MoveTo (X1, Y1);
  Canvas.LineTo (X2, Y1);
  Canvas.LineTo (X2, Y2);
  Canvas.LineTo (X1, Y2);
  Canvas.LineTo (X1, Y1);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Limit: Integer;
begin
  {set a breakpoint on the next line}
  X1 := X1 + 5;
  Y1 := Y1 + 5;
  X2 := X2 - 5;
  Y2 := Y2 - 5;
  {dummy code: try setting a breakpoint on next line}
  Limit := 3;
  Limit := X1;
  {is the line over the button?}
  if X1 >= Button1.Left then
  begin
    Button1.Enabled := False;
    X1 := Button1.Left;
  end;
  if Y1 >= Button1.Top then
  begin
    Button1.Enabled := False;
    Y1 := Button1.Top;
  end;
  Invalidate;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  {set a breakpoint on the next line}
  Button1.Enabled := True;
  X1 := 10;
  Y1 := 10;
  X2 := ClientWidth - 10;
  Y2 := ClientHeight - 10;
  Invalidate;
end;

end.
