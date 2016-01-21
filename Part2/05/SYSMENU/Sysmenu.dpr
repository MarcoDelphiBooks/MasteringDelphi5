program sysmenu;

uses
  Forms,
  sysform in 'sysform.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
