program Animals1;

uses
  Forms,
  AnimF in 'AnimF.pas' {FormAnimals},
  Anim in 'ANIM.PAS';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormAnimals, FormAnimals);
  Application.Run;
end.

