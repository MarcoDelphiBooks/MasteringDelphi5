program Excep;

uses
  Forms,
  ExcepF in 'ExcepF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

