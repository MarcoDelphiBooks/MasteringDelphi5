program Msgflow;

uses
  Forms,
  FlowF in 'FlowF.pas' {Form1},
  Mlist in 'MLIST.PAS',
  Unit2 in 'UNIT2.PAS' {Form2};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
