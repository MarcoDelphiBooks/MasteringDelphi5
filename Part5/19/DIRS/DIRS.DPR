program Dirs;

uses
  Forms,
  DirsForm in 'DirsForm.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
