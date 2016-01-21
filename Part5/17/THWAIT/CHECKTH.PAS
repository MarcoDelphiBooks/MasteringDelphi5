unit CheckTh;

interface

uses
  Classes, Graphics, ComCtrls;

type
  TFindThread = class(TThread)
  protected
    Progr: Integer;
    procedure UpdateProgress;
    procedure Execute; override;
  public
    Found: Integer;
    LookFor: Char;
    Progress: TProgressBar;
  end;

type
  TMultiFind = class(TThread)
  protected
    Progr: Integer;
    procedure UpdateProgress;
    procedure Execute; override;
    procedure Show;
  public
    LookFor, Output: String;
    Progresses: array [1..5] of TProgressBar;
  end;

implementation

{ TPainterThread }

uses
  MainForm, Dialogs, SysUtils;

procedure TFindThread.Execute;
var
  I, J: Integer;
  Line: string;
begin
  Found := 0;
  with Form1.Memo1 do
    for I := 0 to Lines.Count - 1 do
    begin
      Line := Lines [I];
      for J := 1 to Length (Line) do
        if Line [J] = LookFor then
          Inc (Found);
      Progr := I + 1;
      Synchronize (UpdateProgress);
    end;
end;

procedure TFindThread.UpdateProgress;
begin
  Progress.Position := Progr;
end;

procedure TMultiFind.Execute;
var
  Finders: array [1..4] of TFindThread;
  I: Integer;
begin
  // setup the four threads
  for I := 1 to 4 do
  begin
    Finders[I] := TFindThread.Create (True);
    Finders[I].LookFor := LookFor[I];
    Finders[I].Progress := Progresses [I+1];
    Finders[I].Resume;
  end;

  // wait the threads to end...
  for I := 1 to 4 do
  begin
    Finders[I].WaitFor;
    Progr := I;
    Synchronize (UpdateProgress);
  end;

  // show the result
  Output := 'Found: ';
  for I := 1 to 4 do
    Output := Output + Format ('%d %s, ',
      [Finders[I].Found, LookFor[I]]);
  Synchronize (Show);

  // delete threads
  for I := 1 to 4 do
    Finders[I].Free;
end;

procedure TMultiFind.UpdateProgress;
begin
  Progresses[1].Position := Progr;
end;

procedure TMultiFind.Show;
begin
  ShowMessage (Output);
end;

end.
