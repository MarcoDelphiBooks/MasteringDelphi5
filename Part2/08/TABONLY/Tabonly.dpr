program Tabonly;

uses
  Forms,
  Viewer in 'VIEWER.PAS' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
