program World;

uses
  Forms,
  WorldF in 'WorldF.pas' {WorldForm};

{$R *.RES}

begin
  Application.CreateForm(TWorldForm, WorldForm);
  Application.Run;
end.

