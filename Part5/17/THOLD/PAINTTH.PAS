unit paintth;

interface

uses
  Classes;

type
  TPainterThread = class(TThread)
  private
    X, Y: Integer;
  protected
    procedure Execute; override;
    procedure Paint;
  end;

implementation

{ TPainterThread }

uses
  MainForm, Graphics;

procedure TPainterThread.Paint;
begin
  Form1.Canvas.Pixels [X, Y] := clRed;
end;

procedure TPainterThread.Execute;
begin
  Randomize;
  repeat
    X := Random (300);
    Y := Random (Form1.ClientHeight);
    Synchronize (Paint);
  until Terminated;
end;

end.
