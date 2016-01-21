program Navig;

uses
  Forms,
  RptForm in 'RptForm.pas' {ReportForm},
  NavForm in 'NavForm.pas' {Navigator};

{$R *.RES}

begin
  Application.CreateForm(TNavigator, Navigator);
  Application.CreateForm(TReportForm, ReportForm);
  Application.Run;
end.
