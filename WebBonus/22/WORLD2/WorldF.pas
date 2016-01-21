unit WorldF;

interface

uses
  Windows, Classes, Graphics, Forms, Controls,
  Buttons, StdCtrls, ExtCtrls, SysUtils, Contnrs;

type
  TWorldForm = class(TForm)
    WorldButton: TBitBtn;
    Timer1: TTimer;
    Label1: TLabel;
    procedure WorldButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure WorldButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure WorldButtonMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    Count, YPos, XPos: Integer;
    BitmapsList: TObjectList;
    ControlCanvas: TControlCanvas;
  public
    { Public declarations }
  end;

var
  WorldForm: TWorldForm;

implementation

{$R *.DFM}

procedure TWorldForm.WorldButtonClick(Sender: TObject);
begin
  if Timer1.Enabled then
    begin
      Timer1.Enabled := False;
      WorldButton.Caption := '&Start';
    end
  else
    begin
      Timer1.Enabled := True;
      WorldButton.Caption := '&Stop';
    end;
end;

procedure TWorldForm.Timer1Timer(Sender: TObject);
begin
  Count := (Count mod 16) + 1;
  Label1.Caption := Format ('Displaying image %d', [Count]);
  // draw the current bitmap in the control canvas
  ControlCanvas.Draw (XPos, YPos,
    BitmapsList.Items[Count-1] as TBitmap);
end;

procedure TWorldForm.FormCreate(Sender: TObject);
var
  I: Integer;
  Bmp: TBitmap;
begin
  Count := 1;

  // load the bitmaps and add them to the list
  BitmapsList := TObjectList.Create;
  for I := 1 to 16 do
  begin
    Bmp := TBitmap.Create;
    Bmp.LoadFromResourceName (HInstance,
      'W' + IntToStr (I));
    BitmapsList.Add (Bmp);
  end;

  ControlCanvas := TControlCanvas.Create;
  ControlCanvas.Control := WorldButton;
  YPos := (WorldButton.Height - Bmp.Height) div 2;
  XPos := WorldButton.Margin;
end;

procedure TWorldForm.FormDestroy(Sender: TObject);
begin
  // free the list itself, and each element automatically
  BitmapsList.Free;
end;

procedure TWorldForm.WorldButtonMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    // paint the current image over the button
    WorldButton.Glyph.Assign (
      BitmapsList.Items[Count-1] as TBitmap);
    Inc (YPos, 2);
    Inc (XPos, 2);
  end;
end;

procedure TWorldForm.WorldButtonMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    // paint the current image over the button
    WorldButton.Glyph.Assign (
      BitmapsList.Items[Count-1] as TBitmap);
    Dec (YPos, 2);
    Dec (XPos, 2);
  end;
end;

end.

