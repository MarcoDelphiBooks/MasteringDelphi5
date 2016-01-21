library BrokIsa;

uses
  WebBroker, // was HTTPApp,
  ISAPIApp,
  BrokWm in 'BrokWm.pas';

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
