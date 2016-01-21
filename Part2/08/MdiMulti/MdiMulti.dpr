program MdiMulti;

uses
  Forms,
  Frame in 'FRAME.PAS' {MainForm},
  Child in 'CHILD.PAS' {CircleChildForm},
  Child2 in 'CHILD2.PAS' {BounceChildForm};

{$R *.RES}

begin
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

