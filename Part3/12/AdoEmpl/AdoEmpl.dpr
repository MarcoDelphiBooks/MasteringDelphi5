program AdoEmpl;

uses
  Forms,
  AEForm in 'AEForm.pas' {AdoEmplForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TAdoEmplForm, AdoEmplForm);
  Application.Run;
end.
