program DbAware;

uses
  Forms,
  DbAwForm in 'DbAwForm.pas' {DbaForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDbaForm, DbaForm);
  Application.Run;
end.
