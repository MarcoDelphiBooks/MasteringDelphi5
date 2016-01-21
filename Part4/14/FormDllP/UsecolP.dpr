program UsecolP;

uses
  Forms,
  UseColF in 'UseColF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
