unit BmpForm;

interface

uses
  Windows, Classes, Graphics, Forms, Controls, Menus,
  Dialogs, StdCtrls, ExtCtrls, SysUtils, ComCtrls, Buttons;

type
  TBitmapForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    AboutImageViewer1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Options1: TMenuItem;
    Image1: TImage;
    ColorDepth1: TMenuItem;
    GenerateSlow1: TMenuItem;
    GenerateFast1: TMenuItem;
    ScrollPanel1: TMenuItem;
    PanelScroll: TPanel;
    TrackBar1: TTrackBar;
    BtnCancel: TBitBtn;
    BtnGo: TBitBtn;
    Label1: TLabel;
    procedure Open1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure AboutImageViewer1Click(Sender: TObject);
    procedure ColorDepth1Click(Sender: TObject);
    procedure GenerateSlow1Click(Sender: TObject);
    procedure GenerateFast1Click(Sender: TObject);
    procedure ScrollPanel1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure BtnGoClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    nLines: Integer;
    fCancel: Boolean;
  public
    { Public declarations }
  end;

var
  BitmapForm: TBitmapForm;

implementation
              
{$R *.DFM}

procedure TBitmapForm.Open1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile (OpenDialog1.FileName);
    Caption := 'Image Viewer - ' + OpenDialog1.FileName;
  end;
end;

procedure TBitmapForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TBitmapForm.AboutImageViewer1Click(Sender: TObject);
begin
  MessageDlg ('Image Viewer is an example'
    + #13'of the book "Mastering Delphi"'
    + #13'written by Marco Cantù',
    mtInformation, [mbOk], 0);
end;

procedure TBitmapForm.ColorDepth1Click(Sender: TObject);
var
  strDepth: String;
begin
  case Image1.Picture.Bitmap.PixelFormat of
    pfDevice: strDepth := 'Device';
    pf1bit: strDepth := '1-bit';
    pf4bit: strDepth := '4-bit';
    pf8bit: strDepth := '8-bit';
    pf15bit: strDepth := '15-bit';
    pf16bit: strDepth := '16-bit';
    pf24bit: strDepth := '24-bit';
    pf32bit: strDepth := '32-bit';
    pfCustom: strDepth := 'Custom';
  end;
  MessageDlg ('Bitmap color depth: ' + strDepth,
    mtInformation, [mbOK], 0);
end;

procedure TBitmapForm.GenerateSlow1Click(Sender: TObject);
var
  Bmp: TBitmap;
  I, J: Integer;
  T: Cardinal;
begin
  // get the image and modify it
  Bmp := Image1.Picture.Bitmap;
  Bmp.PixelFormat := pf24bit;
  Bmp.Width := 256;
  Bmp.Height := 256;

  T := GetTickCount;
  // change every pixel
  for I := 0 to Bmp.Height - 1 do
    for J := 0 to Bmp.Width - 1 do
      Bmp.Canvas.Pixels [I, J] := RGB (I*J mod 255, I, J);
  Caption := 'Image Viewer - Memory Image (MSecs: ' +
    IntToStr (GetTickCount - T) + ')';
end;

procedure TBitmapForm.GenerateFast1Click(Sender: TObject);
var
  Bmp: TBitmap;
  I, J: Integer;
  T: Cardinal;
  Line: PByteArray;
begin
  // get the image and modify it
  Bmp := Image1.Picture.Bitmap;
  Bmp.PixelFormat := pf24bit;
  Bmp.Width := 256;
  Bmp.Height := 256;

  T := GetTickCount;
  // change every pixel, line by line
  for I := 0 to Bmp.Height - 1 do
  begin
    Line := PByteArray (Bmp.ScanLine [I]);
    for J := 0 to Bmp.Width - 1 do
    begin
      Line [J*3] := J;
      Line [J*3+1] := I*J mod 255;
      Line [J*3+2] := I;
    end;
  end;
  // refresh the video
  Image1.Invalidate;
  Caption := 'Image Viewer - Memory Image (MSecs: ' +
    IntToStr (GetTickCount - T) + ')';
end;

procedure TBitmapForm.ScrollPanel1Click(Sender: TObject);
begin
  PanelScroll.Visible := not PanelScroll.Visible;
  ScrollPanel1.Checked := PanelScroll.Visible;
end;

procedure TBitmapForm.TrackBar1Change(Sender: TObject);
begin
  nLines := TrackBar1.Position;
  TrackBar1.Hint := IntToStr (TrackBar1.Position);
end;

procedure TBitmapForm.BtnGoClick(Sender: TObject);
var
  W, H, I, J, LineBytes: Integer;
  Line: PByteArray;
  Bmp: TBitmap;
  R: TRect;
begin
  // set the user interface
  fCancel := False;
  BtnGo.Enabled := False;
  BtnCancel.Enabled := True;

  // get the bitmap of the image and resize it
  Bmp := Image1.Picture.Bitmap;
  W := Bmp.Width;
  H := Bmp.Height;

  // allocate enough memory for one line
  LineBytes := Abs (Integer (Bmp.ScanLine [1]) -
    Integer (Bmp.ScanLine [0]));
  Line := AllocMem (LineBytes);

  // scroll how many itmes as there are lines
  for I := 0 to H - 1 do
  begin
    // exit the for loop if Cancel was pressed
    if fCancel then
      Break;
    // copy the first line
    Move ((Bmp.ScanLine [0])^, Line^, LineBytes);
    // for every line
    for J := 1 to H - 1 do
    begin
      // move line to the previous one
      Move ((Bmp.ScanLine [J])^, (Bmp.ScanLine [J-1])^, LineBytes);
      // every nLines update the output
      if (J mod nLines = 0) then
      begin
        R := Rect (0, PanelScroll.Height + J-nLines,
          W, PanelScroll.Height + J);
        InvalidateRect (Handle, @R, False);
        UpdateWindow (Handle);
      end;
    end;
    // move back the first line to the end
    Move (Line^, (Bmp.ScanLine [Bmp.Height - 1])^, LineBytes);
    // update the final portion of the bitmap
    R := Rect (0, PanelScroll.Height + H - nLines,
      W, PanelScroll.Height + H);
    InvalidateRect (Handle, @R, False);
    UpdateWindow (Handle);
    // let the program handle other messages
    Application.ProcessMessages;
  end;
  // reset the UI
  BtnGo.Enabled := True;
  BtnCancel.Enabled := False;
end;

procedure TBitmapForm.BtnCancelClick(Sender: TObject);
begin
  fCancel := True;
end;

procedure TBitmapForm.FormCreate(Sender: TObject);
begin
  TrackBar1Change (Self); 
end;

end.

