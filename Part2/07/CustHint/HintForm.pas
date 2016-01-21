unit HintForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, AppEvnts;

type
  TForm1 = class(TForm)
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    ApplicationEvents1: TApplicationEvents;
    procedure RadioGroup1Click(Sender: TObject);
    procedure ShowHint (var HintStr: string;
      var CanShow: Boolean; var HintInfo: THintInfo);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ShowHint (var HintStr: string;
  var CanShow: Boolean; var HintInfo: THintInfo);
var
  RadioItem, RadioHeight: Integer;
  RadioRect: TRect;
begin
  {if the control is the label show the hint in the middle of it}
  with HintInfo do
    if HintControl = Label1 then
      HintPos := HintControl.ClientToScreen (Point (
        HintControl.Width div 2, HintControl.Height div 2))
    else
    { if the control is the radio group, determine which
    radio button the cursor is over, and set a proper
    hint string, hint rectangle, and hint position}
    if HintControl = RadioGroup1 then
    begin
      RadioHeight := (RadioGroup1.Height) div
        RadioGroup1.Items.Count;
      RadioItem := (CursorPos.Y) div RadioHeight;
      HintStr := 'Choose the ' +
        RadioGroup1.Items [RadioItem] + ' button';
      RadioRect := RadioGroup1.ClientRect;
      RadioRect.Top := RadioRect.Top +
        RadioHeight * RadioItem;
      RadioRect.Bottom := RadioRect.Top + RadioHeight;
      // assign the hints rect and pos
      CursorRect := RadioRect;
    end;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  Label1.Caption := Label1.Caption +
    ' - ' + RadioGroup1.Items [RadioGroup1.ItemIndex];
end;

end.

