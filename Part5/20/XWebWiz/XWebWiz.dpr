library XWebWiz;

uses
  ComServ,
  XWebWiz_TLB in 'XWebWiz_TLB.pas',
  XWizF in 'XWizF.pas' {XWizForm: TActiveForm} {XWizForm: CoClass},
  WizForm in 'WizForm.pas' {WizardForm};

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
