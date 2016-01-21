program Mdidemo;

uses
  Forms,
  Frame in 'FRAME.PAS' {MainForm},
  Child in 'CHILD.PAS' {ChildForm};

{$R *.RES}

begin
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

