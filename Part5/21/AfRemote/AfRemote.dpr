library AfRemote;

uses
  ComServ,
  AfRemote_TLB in 'AfRemote_TLB.pas',
  Remote in 'Remote.pas' {ActiveRemote: TActiveForm} {ActiveRemote: CoClass},
  ReconDlg in 'ReconDlg.pas' {ReconcileErrorForm};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

{$E ocx}

begin
end.
