program ParQuery;

uses
  Forms,
  ParQForm in 'ParQForm.pas' {QueryForm};

{$R *.RES}

begin
  Application.CreateForm(TQueryForm, QueryForm);
  Application.Run;
end.
