program ErrorLog;

uses
  Forms,
  LogForm in 'LogForm.pas' {FormLog};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormLog, FormLog);
  Application.Run;
end.
