program Dynacall;

uses
  Forms,
  DynaForm in 'DynaForm.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
