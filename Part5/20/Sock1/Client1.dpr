program Client1;

uses
  Forms,
  Client1Form in 'Client1Form.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
