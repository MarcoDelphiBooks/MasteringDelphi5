program FldText;

uses
  Forms,
  FldTextF in 'FldTextF.pas' {DbaForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDbaForm, DbaForm);
  Application.Run;
end.
