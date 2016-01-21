program Olecont;

uses
  Forms,
  Oleform in 'OLEFORM.PAS' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
