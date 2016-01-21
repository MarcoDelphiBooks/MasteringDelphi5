program More;

uses
  Forms,
  MoreF in 'MoreF.pas' {Form1},
  Confdial in 'CONFDIAL.PAS' {ConfigureDialog};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TConfigureDialog, ConfigureDialog);
  Application.Run;
end.

