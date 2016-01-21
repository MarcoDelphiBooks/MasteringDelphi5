program Printbmp;

uses
  Forms,
  Viewer in 'VIEWER.PAS' {Form1},
  Preview in 'PREVIEW.PAS' {PreviewForm};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TPreviewForm, PreviewForm);
  Application.Run;
end.
