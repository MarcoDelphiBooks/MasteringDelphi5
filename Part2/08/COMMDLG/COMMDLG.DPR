program Commdlg;

uses
  Forms,
  Cdlgtest in 'CDLGTEST.PAS' {CommDlgForm};

{$R *.RES}

begin
  Application.CreateForm(TCommDlgForm, CommDlgForm);
  Application.Run;
end.

