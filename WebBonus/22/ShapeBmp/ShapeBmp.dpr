program ShapeBmp;

uses
  Forms,
  ShapesF in 'ShapesF.pas' {ShapesForm};

{$R *.RES}

begin
  Application.CreateForm(TShapesForm, ShapesForm);
  Application.Run;
end.

