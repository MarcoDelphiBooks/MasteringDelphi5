program IntfDemo;

uses
  Forms,
  InftForm in 'InftForm.pas' {Form1},
  WalkIntf in 'WalkIntf.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
