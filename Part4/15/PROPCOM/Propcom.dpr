library PropCom;

uses
  ComServ,
  NumIntf in 'NumIntf.pas',
  NumServ in 'NumServ.pas',
  PROPCOM_TLB in 'PROPCOM_TLB.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}
  
end.
