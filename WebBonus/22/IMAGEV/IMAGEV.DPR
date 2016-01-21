program Imagev;

uses
  Forms,
  ImageF in 'ImageF.pas' {ViewerForm};

{$R *.RES}

begin
  Application.CreateForm(TViewerForm, ViewerForm);
  Application.Run;
end.

