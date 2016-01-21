program Multi1;

uses
  Forms,
  MultiRec in 'MultiRec.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
