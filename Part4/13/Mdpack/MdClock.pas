unit MdClock;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, StdCtrls, ExtCtrls;

type
  TMdClock = class (TCustomLabel)
  private
    FTimer: TTimer;
    function GetActive: Boolean;
    procedure SetActive (Value: Boolean);
  protected
    procedure UpdateClock (Sender: TObject);
  public
    constructor Create (AOwner: TComponent); override;
  published
    property Align;
    property Alignment;
    property Color;
    property Font;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Transparent;
    property Visible;
    property Active: Boolean
      read GetActive write SetActive;
  end;

procedure Register;

implementation

constructor TMdClock.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  // create the internal timer object
  FTimer := TTimer.Create (Self);
  FTimer.OnTimer := UpdateClock;
  FTimer.Enabled := True;
end;

procedure TMdClock.UpdateClock (Sender: TObject);
begin
  // set the current time as caption
  Caption := TimeToStr (Time);
end;

function TMdClock.GetActive: Boolean;
begin
  // get the status of the timer
  Result := FTimer.Enabled;
end;

procedure TMdClock.SetActive (Value: Boolean);
begin
  // change the status of the timer
  FTimer.Enabled := Value;
end;

procedure Register;
begin
  RegisterComponents('Md', [TMdClock]);
end;

end.
