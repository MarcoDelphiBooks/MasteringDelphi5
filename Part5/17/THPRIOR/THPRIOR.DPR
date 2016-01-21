program ThPrior;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form1},
  paintth in 'paintth.pas';

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
