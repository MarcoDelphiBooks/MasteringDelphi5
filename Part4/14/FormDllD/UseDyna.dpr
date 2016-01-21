program UseDyna;

uses
  Forms,
  UseDynaF in 'UseDynaF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
