program Shapes;

uses
  Forms,
  ShapesF in 'ShapesF.pas' {ShapesForm},
  ShapesH in 'ShapesH.pas';

{$R *.RES}

begin
  Application.CreateForm(TShapesForm, ShapesForm);
  Application.Run;
end.

