program Newcheck;

uses
  Forms,
  CHECK in 'CHECK.PAS' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
