program DateProp;

uses
  Forms,
  DateF in 'DateF.pas' {DateForm},
  Dates in 'DATES.PAS';

{$R *.RES}

begin
  Application.CreateForm(TDateForm, DateForm);
  Application.Run;
end.

