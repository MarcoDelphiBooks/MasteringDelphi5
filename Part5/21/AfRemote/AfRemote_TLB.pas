unit AfRemote_TLB;

{ This file contains pascal declarations imported from a type library.
  This file will be written during each import or refresh of the type
  library editor.  Changes to this file will be discarded during the
  refresh process. }

{ AfRemote Library }
{ Version 1.0 }

{ Conversion log:
  Hint: Class is not registered.  Ambient properties cannot be determined.
 }

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL;

const
  LIBID_AfRemote: TGUID = '{CBF29741-2472-11D1-98D0-444553540000}';

const

{ TxActiveFormBorderStyle }

  afbNone = 0;
  afbSingle = 1;
  afbSunken = 2;
  afbRaised = 3;

{ TxPrintScale }

  poNone = 0;
  poProportional = 1;
  poPrintToFit = 2;

{ TxMouseButton }

  mbLeft = 0;
  mbRight = 1;
  mbMiddle = 2;

{ TxWindowState }

  wsNormal = 0;
  wsMinimized = 1;
  wsMaximized = 2;

const

{ Component class GUIDs }
  Class_ActiveRemote: TGUID = '{CBF29744-2472-11D1-98D0-444553540000}';

type

{ Forward declarations: Interfaces }
  IActiveRemote = interface;
  IActiveRemoteDisp = dispinterface;
  IActiveRemoteEvents = dispinterface;

{ Forward declarations: CoClasses }
  ActiveRemote = IActiveRemote;

{ Forward declarations: Enums }
  TxActiveFormBorderStyle = TOleEnum;
  TxPrintScale = TOleEnum;
  TxMouseButton = TOleEnum;
  TxWindowState = TOleEnum;

{ Dispatch interface for ActiveRemote Control }

  IActiveRemote = interface(IDispatch)
    ['{CBF29742-2472-11D1-98D0-444553540000}']
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: TColor; safecall;
    procedure Set_Color(Value: TColor); safecall;
    function Get_Font: Font; safecall;
    procedure Set_Font(const Value: Font); safecall;
    function Get_KeyPreview: WordBool; safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    function Get_PixelsPerInch: Integer; safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    function Get_Scaled: WordBool; safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    function Get_Active: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    function Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    function Get_WindowState: TxWindowState; safecall;
    procedure Set_WindowState(Value: TxWindowState); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AxBorderStyle: TxActiveFormBorderStyle read Get_AxBorderStyle write Set_AxBorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: TColor read Get_Color write Set_Color;
    property Font: Font read Get_Font write Set_Font;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property PixelsPerInch: Integer read Get_PixelsPerInch write Set_PixelsPerInch;
    property PrintScale: TxPrintScale read Get_PrintScale write Set_PrintScale;
    property Scaled: WordBool read Get_Scaled write Set_Scaled;
    property Active: WordBool read Get_Active;
    property DropTarget: WordBool read Get_DropTarget write Set_DropTarget;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property WindowState: TxWindowState read Get_WindowState write Set_WindowState;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

{ DispInterface declaration for Dual Interface IActiveRemote }

  IActiveRemoteDisp = dispinterface
    ['{CBF29742-2472-11D1-98D0-444553540000}']
    property AutoScroll: WordBool dispid 1;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 2;
    property Caption: WideString dispid 3;
    property Color: TColor dispid 4;
    property Font: Font dispid 5;
    property KeyPreview: WordBool dispid 6;
    property PixelsPerInch: Integer dispid 7;
    property PrintScale: TxPrintScale dispid 8;
    property Scaled: WordBool dispid 9;
    property Active: WordBool readonly dispid 10;
    property DropTarget: WordBool dispid 11;
    property HelpFile: WideString dispid 12;
    property WindowState: TxWindowState dispid 13;
    property Visible: WordBool dispid 14;
    property Enabled: WordBool dispid 15;
    property Cursor: Smallint dispid 16;
  end;

{ Events interface for ActiveRemote Control }

  IActiveRemoteEvents = dispinterface
    ['{CBF29743-2472-11D1-98D0-444553540000}']
    procedure OnActivate; dispid 1;
    procedure OnClick; dispid 2;
    procedure OnCreate; dispid 3;
    procedure OnDblClick; dispid 4;
    procedure OnDestroy; dispid 5;
    procedure OnDeactivate; dispid 6;
    procedure OnKeyPress(var Key: Smallint); dispid 7;
    procedure OnPaint; dispid 8;
  end;

{ ActiveRemoteControl }

  TActiveRemoteOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;

  TActiveRemote = class(TOleControl)
  private
    FOnActivate: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnKeyPress: TActiveRemoteOnKeyPress;
    FOnPaint: TNotifyEvent;
    FIntf: IActiveRemote;
  protected
    procedure InitControlData; override;
    procedure InitControlInterface(const Obj: IUnknown); override;
  public
    property ControlInterface: IActiveRemote read FIntf;
    property Active: WordBool index 10 read GetWordBoolProp;
  published
    property AutoScroll: WordBool index 1 read GetWordBoolProp write SetWordBoolProp stored False;
    property AxBorderStyle: TxActiveFormBorderStyle index 2 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index 3 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index 4 read GetTColorProp write SetTColorProp stored False;
    property Font: TFont index 5 read GetTFontProp write SetTFontProp stored False;
    property KeyPreview: WordBool index 6 read GetWordBoolProp write SetWordBoolProp stored False;
    property PixelsPerInch: Integer index 7 read GetIntegerProp write SetIntegerProp stored False;
    property PrintScale: TxPrintScale index 8 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Scaled: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property DropTarget: WordBool index 11 read GetWordBoolProp write SetWordBoolProp stored False;
    property HelpFile: WideString index 12 read GetWideStringProp write SetWideStringProp stored False;
    property WindowState: TxWindowState index 13 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Visible: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property Enabled: WordBool index 15 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 16 read GetSmallintProp write SetSmallintProp stored False;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyPress: TActiveRemoteOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
  end;

procedure Register;

implementation

uses ComObj;

procedure TActiveRemote.InitControlData;
const
  CEventDispIDs: array[0..7] of Integer = (
    $00000001, $00000002, $00000003, $00000004, $00000005, $00000006,
    $00000007, $00000008);
  CTFontIDs: array [0..0] of Integer = (
    $00000005);
  CControlData: TControlData = (
    ClassID: '{CBF29744-2472-11D1-98D0-444553540000}';
    EventIID: '{CBF29743-2472-11D1-98D0-444553540000}';
    EventCount: 8;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $00000000;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TActiveRemote.InitControlInterface(const Obj: IUnknown);
begin
  FIntf := Obj as IActiveRemote;
end;


procedure Register;
begin
  RegisterComponents('ActiveX', [TActiveRemote]);
end;

end.
