program GetMail;

uses
  Forms,
  GetMailF in 'GetMailF.pas' {NewFmForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TNewFmForm, NewFmForm);
  Application.Run;
end.
