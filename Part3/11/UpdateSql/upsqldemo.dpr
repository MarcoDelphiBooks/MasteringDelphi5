program upsqldemo;

uses
  Forms,
  main in 'main.pas' {MainForm},
  data in 'data.pas' {dmData: TDataModule},
  depts in 'depts.pas' {frmDepartments},
  jobs in 'jobs.pas' {frmJobs};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmData, dmData);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfrmDepartments, frmDepartments);
  Application.CreateForm(TfrmJobs, frmJobs);
  Application.Run;
end.
