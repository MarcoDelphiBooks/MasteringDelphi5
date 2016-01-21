unit SideTxtF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormPaint(Sender: TObject);
var
  ALogFont: TLogFont;
  hFont: THandle;
begin
  ALogFont.lfHeight := Font.Height;
  ALogFont.lfWidth := 0;
  ALogFont.lfEscapement := 900;
  ALogFont.lfOrientation := 900;
  ALogFont.lfWeight := fw_DemiBold;
  ALogFont.lfItalic := 0; // false
  ALogFont.lfUnderline := 0; // false
  ALogFont.lfStrikeOut := 0; // false
  ALogFont.lfCharSet := Ansi_CharSet;
  ALogFont.lfOutPrecision := Out_Default_Precis;
  ALogFont.lfClipPrecision := Clip_Default_Precis;
  ALogFont.lfQuality := Default_Quality;
  ALogFont.lfPitchAndFamily := Default_Pitch;
  StrCopy (ALogFont.lfFaceName, PChar (Font.Name));
  hFont := CreateFontIndirect (ALogFont);
  Canvas.Font.Handle := hFont;
  Canvas.TextOut (0, ClientHeight, 'Hello');
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ALogFont: TLogFont;
  hFont: THandle;
begin
  ALogFont.lfHeight := Font.Height;
  ALogFont.lfWidth := 0;
  ALogFont.lfEscapement := -450;
  ALogFont.lfOrientation := -450;
  ALogFont.lfWeight := fw_DemiBold;
  ALogFont.lfItalic := 0; // false
  ALogFont.lfUnderline := 0; // false
  ALogFont.lfStrikeOut := 0; // false
  ALogFont.lfCharSet := Ansi_CharSet;
  ALogFont.lfOutPrecision := Out_Default_Precis;
  ALogFont.lfClipPrecision := Clip_Default_Precis;
  ALogFont.lfQuality := Default_Quality;
  ALogFont.lfPitchAndFamily := Default_Pitch;
  StrCopy (ALogFont.lfFaceName, PChar (Font.Name));
  hFont := CreateFontIndirect (ALogFont);
  Font.Handle := hFont;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  ALogFont: TLogFont;
  hFont: THandle;
begin
  ALogFont.lfHeight := Font.Height;
  ALogFont.lfWidth := 0;
  ALogFont.lfEscapement := - (GetTickCount div 10) mod 3600;
  ALogFont.lfOrientation := ALogFont.lfEscapement;
  ALogFont.lfWeight := fw_DemiBold;
  ALogFont.lfItalic := 0; // false
  ALogFont.lfUnderline := 0; // false
  ALogFont.lfStrikeOut := 0; // false
  ALogFont.lfCharSet := Ansi_CharSet;
  ALogFont.lfOutPrecision := Out_Default_Precis;
  ALogFont.lfClipPrecision := Clip_Default_Precis;
  ALogFont.lfQuality := Default_Quality;
  ALogFont.lfPitchAndFamily := Default_Pitch;
  StrCopy (ALogFont.lfFaceName, PChar (Font.Name));
  hFont := CreateFontIndirect (ALogFont);
  Canvas.Font.Handle := hFont;
  Canvas.TextOut (300, 200, 'Rotating');
end;

end.
