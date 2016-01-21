program DynaMenu;

uses
  Forms,
  MenuF in 'MenuF.pas' {FormColorText}; {FormColorText}

{$R *.RES}

begin
  Application.CreateForm(TFormColorText, FormColorText);
  Application.Run;
end.

