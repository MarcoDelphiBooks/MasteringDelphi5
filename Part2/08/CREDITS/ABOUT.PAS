unit About;

interface

uses
  SysUtils, Windows, Classes, Graphics, Forms,
  Controls, Buttons, StdCtrls, ExtCtrls;

type
  TAboutBox = class(TForm)
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    PaintBox1: TPaintBox;
    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.DFM}

procedure Delay (Seconds, MilliSec: Word);
var
  TimeOut: TDateTime;
begin
  TimeOut := Now + EncodeTime (0,
    Seconds div 60, Seconds mod 60, MilliSec);
  // wait until he TimeOut time
  while Now < TimeOut do
    Application.ProcessMessages;
end;

procedure TAboutBox.Label1MouseDown(Sender: TObject;
  Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  I, LineH: Integer;
begin
  if (Button = mbRight) and (ssShift in Shift) then
  begin
    Panel1.Visible := False;
    LineH := PaintBox1.Canvas.TextHeight ('0');
    for I := 0 to 100 + LineH * 10 do
      with PaintBox1.Canvas do
      begin
        // empty lines are used to delete descendants
        TextOut (40, 100 - I,
          'CREDITS example from:');
        TextOut (40, 100 + LineH - I,
          '"Mastering Delphi"');
        TextOut (40, 100 + LineH * 2 - I,
          '                          ');
        TextOut (40, 100 + LineH * 4 - I,
          'Author: Marco Cantù');
        TextOut (40, 100 + LineH * 5 - I,
          'Publisher: Sybex');
        TextOut (40, 100 + LineH * 6 - I,
          '                          ');
        TextOut (40, 100 + LineH * 8 - I,
          'Dedicated with love');
        TextOut (40, 100 + LineH * 9 - I,
          'to my wife, Lella');
        TextOut (40, 100 + LineH * 10 - I,
          '                          ');
        // wait 5 milliseconds
        Delay (0, 5);
      end;
    Panel1.Visible := True;
  end;
end;

end.

