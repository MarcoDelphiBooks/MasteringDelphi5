program EditDemo;

uses
  Forms,
  EditForm in 'EditForm.pas' {NavigForm};

{$R *.RES}

begin
  Application.CreateForm(TNavigForm, NavigForm);
  Application.Run;
end.
