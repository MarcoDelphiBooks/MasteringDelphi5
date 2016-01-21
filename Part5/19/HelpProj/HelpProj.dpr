program HelpProj;

uses
  Forms,
  HelpForm in 'HelpForm.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.HelpFile := 'C:\md5code\Part5\19\HelpProj\Helpproj.hlp';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
