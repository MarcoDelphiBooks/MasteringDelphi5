program ThWait;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form1},
  CheckTh in 'CheckTh.pas';

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
