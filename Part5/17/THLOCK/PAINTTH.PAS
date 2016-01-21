unit paintth;

interface

uses
  Classes;

type
  TPainterThread = class(TThread)
  protected
    procedure Execute; override;
  end;

implementation

{ TPainterThread }

uses
  MainForm, Graphics;

procedure TPainterThread.Execute;
var
  X, Y: Integer;
begin
  Randomize;
  repeat
    X := Random (300);
    Y := Random (Form1.ClientHeight);
    with Form1.Canvas do
    begin
      Lock;
      try
        Pixels [X, Y] := clBlue;
      finally
        Unlock;
      end;
    end;
  until Terminated;
end;

end.
