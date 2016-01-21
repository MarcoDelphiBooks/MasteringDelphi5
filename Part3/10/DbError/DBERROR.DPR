program DbError;

uses
  Forms,
  DBErrFo in 'DBErrFo.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
