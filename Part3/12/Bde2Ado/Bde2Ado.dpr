program Bde2Ado;

uses
  Forms,
  B2AForm in 'B2AForm.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
