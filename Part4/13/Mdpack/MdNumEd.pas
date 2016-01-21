unit MdNumEd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, StdCtrls;

type
  TMdNumEdit = class (TCustomEdit)
  private
    fInputError: TNotifyEvent;
  protected
    function GetValue: Integer;
    procedure SetValue (Value: Integer);
  public
    procedure WmChar (var Msg: TWmChar); message wm_Char;
    constructor Create (Owner: TComponent); override;
  published
    property OnInputError: TNotifyEvent
      read fInputError write fInputError;
    property Value: Integer
      read GetValue write SetValue default 0;
    property AutoSelect;
    property AutoSize;
    property BorderStyle;
    property CharCase;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property MaxLength;
    property OEMConvert;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

procedure Register;

implementation

constructor TMdNumEdit.Create (Owner: TComponent);
begin
  inherited Create (Owner);
  Value := 0;
end;

function TMdNumEdit.GetValue: Integer;
begin
  // set to 0 in case of error
  Result := StrToIntDef (Text, 0);
end;

procedure TMdNumEdit.SetValue (Value: Integer);
begin
  Text := IntToStr (Value);
end;

procedure TMdNumEdit.WmChar (var Msg: TWmChar);
begin
  if not (Char (Msg.CharCode) in ['0'..'9']) and not (Msg.CharCode = 8) then
  begin
    Msg.CharCode := 0;
    if Assigned (fInputError) then
      fInputError (Self);
  end;
end;

procedure Register;
begin
  RegisterComponents ('Md', [TMdNumEdit]);
end;

end.
