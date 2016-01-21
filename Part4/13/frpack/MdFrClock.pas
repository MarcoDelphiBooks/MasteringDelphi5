unit MdFrClock;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TMdFrameClock = class(TFrame)
    FrameLabel: TLabel;
    FrameTimer: TTimer;
    procedure FrameTimerTimer(Sender: TObject);
  private
    procedure SetActive(const Value: Boolean);
    function GetActive: Boolean;
  published
    property Active: Boolean
      read GetActive write SetActive;
  end;

procedure Register;

implementation

{$R *.DFM}

procedure Register;
begin
  RegisterComponents('Md', [TMdFrameClock]);
end;

procedure TMdFrameClock.FrameTimerTimer(Sender: TObject);
begin
  FrameLabel.Caption := TimeToStr (Time);
end;

function TMdFrameClock.GetActive: Boolean;
begin
  Result := FrameTimer.Enabled;
end;

procedure TMdFrameClock.SetActive(const Value: Boolean);
begin
  FrameTimer.Enabled := Value;
end;

end.
