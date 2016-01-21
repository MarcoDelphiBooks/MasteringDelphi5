program IeMd;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  MdModule in 'MdModule.pas' {WebModule1: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
