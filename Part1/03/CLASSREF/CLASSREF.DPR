program ClassRef;

uses
  Forms,
  CRefF in 'CRefF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
