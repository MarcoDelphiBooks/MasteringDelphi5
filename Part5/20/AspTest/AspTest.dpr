library AspTest;

uses
  ComServ,
  aspobj1 in 'aspobj1.pas',
  testdm in 'testdm.pas' {DataModule1: TDataModule};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.RES}

{$R *.TLB}

begin
end.
