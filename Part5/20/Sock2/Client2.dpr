program Client2;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {Form1},
  CliBmp in 'CliBmp.pas' {FormBmp},
  CliText in 'CliText.pas' {FormText};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
