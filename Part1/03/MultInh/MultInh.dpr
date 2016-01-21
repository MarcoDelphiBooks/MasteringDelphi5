program MultInh;

uses
  Forms,
  MultForm in 'MultForm.pas' {FormAnimMi},
  MultAnim in 'MultAnim.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormAnimMi, FormAnimMi);
  Application.Run;
end.
