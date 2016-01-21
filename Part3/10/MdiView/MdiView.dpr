program MdiView;

uses
  Forms,
  GridView in 'GridView.pas' {GridForm},
  DataM in 'DataM.pas' {CustomerDM},
  FormView in 'FormView.pas' {RecordForm},
  Main in 'Main.pas' {FrameForm};

{$R *.RES}

begin
  Application.CreateForm(TFrameForm, FrameForm);
  Application.Run;
end.
