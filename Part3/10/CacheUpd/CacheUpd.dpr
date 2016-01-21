program CacheUpd;

uses
  Forms,
  CacheF in 'CacheF.pas' {Form1},
  ErrorF in 'ErrorF.pas' {ErrorsForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
