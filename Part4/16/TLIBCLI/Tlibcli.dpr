program TLibCli;

uses
  Forms,
  TLibCliF in 'TLibCliF.pas' {ClientForm},
  TlibdemoLib_TLB in 'TlibdemoLib_TLB.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TClientForm, ClientForm);
  Application.Run;
end.
