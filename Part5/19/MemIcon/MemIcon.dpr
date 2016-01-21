program MemIcon;

uses
  RunFirst in 'RunFirst.pas',
  Forms, Windows,
  Resform in 'RESFORM.PAS' {MemForm};

{$R *.RES}

begin
  Application.ShowMainForm := False;
  IsLibrary := False;
  Application.CreateForm(TMemForm, MemForm);
  Application.Run;
end.

