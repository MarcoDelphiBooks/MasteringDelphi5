program DragList;

uses
  Forms,
  DragF in 'DragF.pas' {DragForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDragForm, DragForm);
  Application.Run;
end.
