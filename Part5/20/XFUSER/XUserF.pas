unit XUserF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, XFUser_TLB, StdCtrls;

type
  TXFormUser = class(TActiveForm, IXFormUser)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IXFormUserEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ;

{$R *.DFM}

{ TXFormUser }

procedure TXFormUser.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_XFormUserPage); }
end;

procedure TXFormUser.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IXFormUserEvents;
end;

procedure TXFormUser.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TXFormUser.Get_Active: WordBool;
begin
  Result := Active;
end;

function TXFormUser.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TXFormUser.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TXFormUser.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TXFormUser.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(BiDiMode);
end;

function TXFormUser.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TXFormUser.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TXFormUser.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TXFormUser.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TXFormUser.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TXFormUser.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TXFormUser.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TXFormUser.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TXFormUser.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TXFormUser.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TXFormUser.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TXFormUser.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TXFormUser.Get_Visible: WordBool;
begin
  Result := Visible;
end;

procedure TXFormUser._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TXFormUser.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TXFormUser.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TXFormUser.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TXFormUser.Set_BiDiMode(Value: TxBiDiMode);
begin
  BiDiMode := TBiDiMode(Value);
end;

procedure TXFormUser.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TXFormUser.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TXFormUser.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TXFormUser.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TXFormUser.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TXFormUser.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TXFormUser.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TXFormUser.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TXFormUser.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TXFormUser.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TXFormUser.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TXFormUser.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TXFormUser.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TXFormUser.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TXFormUser.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TXFormUser.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TXFormUser.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TXFormUser.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TXFormUser.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TXFormUser.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TXFormUser.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TXFormUser.Button1Click(Sender: TObject);
var
  UserName: string;
  Size: Cardinal;
begin
  Size := 128;
  SetLength (UserName, Size);
  GetUserName (PChar(UserName), Size);
  Label1.Caption := UserName;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TXFormUser,
    Class_XFormUser,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
