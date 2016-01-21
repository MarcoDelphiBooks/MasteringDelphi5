unit WmfForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    BtnCreate: TButton;
    PaintBox1: TPaintBox;
    BtnLoad: TButton;
    PaintBox2: TPaintBox;
    cbStretched: TCheckBox;
    procedure BtnCreateClick(Sender: TObject);
    procedure BtnLoadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Wmf: TMetafile;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.BtnCreateClick(Sender: TObject);
var
  WmfCanvas: TMetafileCanvas;
  X, Y: Integer;
begin
  // create the virtual canvas
  WmfCanvas := TMetafileCanvas.CreateWithComment(
    Wmf, 0, 'Marco', 'Demo metafile');

  try
    // clear the background
    WmfCanvas.Brush.Color := clWhite;
    WmfCanvas.FillRect (WmfCanvas.ClipRect);

    // draws 400 lines
    for X := 1 to 20 do
      for Y := 1 to 20 do
      begin
        WmfCanvas.MoveTo (15 * (X + Random (3)), 15 * (Y + Random (3)));
        WmfCanvas.LineTo (45 * Y, 45 * X);
      end;
  finally
    // end the drawing operation
    WmfCanvas.Free;
  end;

  // show the current drawing and save it
  PaintBox1.Canvas.Draw (0, 0, Wmf);
  Wmf.SaveToFile (ExtractFilePath (
    Application.ExeName) + 'test.emf');
end;

procedure TForm1.BtnLoadClick(Sender: TObject);
begin
  // load the metafile
  Wmf.LoadFromFile (ExtractFilePath (
    Application.ExeName) + 'test.emf');

  // draw or stretch it
  if cbStretched.Checked then
    PaintBox2.Canvas.StretchDraw (PaintBox2.Canvas.ClipRect, Wmf)
  else
    PaintBox2.Canvas.Draw (0, 0, Wmf);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Wmf := TMetafile.Create;
  Wmf.Enhanced := True;
  Randomize;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Wmf.Free;
end;

end.
