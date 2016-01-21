program ObjClone;

uses
  Forms,
  UNit1 in 'UNit1.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
