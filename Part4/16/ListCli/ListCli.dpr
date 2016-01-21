program ListCli;

uses
  Forms,
  LCliForm in 'LCliForm.pas' {ListCliForm},
  ImportTlb in 'ImportTlb.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TListCliForm, ListCliForm);
  Application.Run;
end.
