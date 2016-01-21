program Breakp;

uses
  Forms,
  BreakpF in 'BreakpF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
