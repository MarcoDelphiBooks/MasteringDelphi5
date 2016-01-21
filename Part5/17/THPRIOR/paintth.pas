unit paintth;

interface

uses
  Classes, Graphics, Windows;

type
  TPainterThread = class(TThread)
  private
    Color: Integer;
    SuspendRequest: Boolean;
  protected
    procedure Execute; override;
  public
    constructor Create (Col: TColor);
    procedure DelayedSuspend;
  end;

implementation

{ TPainterThread }

uses
  MainForm;

constructor TPainterThread.Create(Col: TColor);
begin
  Color:= Col;
  inherited Create (True);
end;

procedure TPainterThread.DelayedSuspend;
begin
  SuspendRequest := True;
end;

procedure TPainterThread.Execute;
var
  X, Y, X1: Integer;
begin
  X := 0;
  Y := 0;
  repeat
    // scan the lines...
    X1 := X + 1;
    X := X1 mod 250;
    Y := Y + X1 div 250;
    Y := Y mod Form1.ClientHeight;

    Form1.Canvas.Lock;
    try
      Form1.Canvas.Pixels [X, Y] := Color;
    finally
      Form1.Canvas.UnLock;
    end;
    if SuspendRequest then
    begin
      Suspend;
      SuspendRequest := False;
    end;
  until Terminated;
end;

end.
