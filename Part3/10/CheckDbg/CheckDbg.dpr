program CheckDbg;

uses
  Forms,
  CheckF in 'CheckF.pas' {DbaForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDbaForm, DbaForm);
  Application.Run;
end.
