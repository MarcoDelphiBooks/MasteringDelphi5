program Credits;

uses
  Forms,
  Useless in 'USELESS.PAS' {UselessForm},
  About in 'ABOUT.PAS' {AboutBox};

{$R *.RES}

begin
  Application.CreateForm(TUselessForm, UselessForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.

