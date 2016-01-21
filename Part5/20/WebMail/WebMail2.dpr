program WebMail2;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  WMailDm in 'WMailDm.pas' {WebModule1: TWebModule};

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
