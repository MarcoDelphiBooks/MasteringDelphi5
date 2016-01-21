program VclMem;

uses
  Forms,
  MainForm in 'MainForm.pas' {FormMain},
  MemForm in 'MemForm.pas' {FormMemStatus};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
