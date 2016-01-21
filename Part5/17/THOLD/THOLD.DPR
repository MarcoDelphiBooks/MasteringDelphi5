program ThOld;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form1},
  PaintTh in 'PaintTh.pas';

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
