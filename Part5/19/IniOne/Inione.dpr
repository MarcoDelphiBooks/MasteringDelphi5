program IniOne;

uses
  Forms,
  IniForm in 'IniForm.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
