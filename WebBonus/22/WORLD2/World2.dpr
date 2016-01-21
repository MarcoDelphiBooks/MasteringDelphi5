program World2;

{$R 'WORLDBMP.res' 'WORLDBMP.RC'}

uses
  Forms,
  WorldF in 'WorldF.pas' {WorldForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWorldForm, WorldForm);
  Application.Run;
end.

