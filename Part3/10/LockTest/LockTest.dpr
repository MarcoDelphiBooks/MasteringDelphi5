program LockTest;

uses
  Forms,
  LockForm in 'LockForm.pas' {NavigForm};

{$R *.RES}

begin
  Application.CreateForm(TNavigForm, NavigForm);
  Application.CreateForm(TNavigForm, NavigForm);
  Application.Run;
end.
