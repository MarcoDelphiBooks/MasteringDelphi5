unit XWizF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, XWebWiz_TLB;

type
  TXWizForm = class(TActiveForm, IXWizForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FEvents: IXWizFormEvents;
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

uses ComObj, ComServ, WizForm;

{$R *.DFM}

{ TXWizForm }

procedure TXWizForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_XWizFormPage); }
end;

procedure TXWizForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IXWizFormEvents;
end;

procedure TXWizForm.Initialize;
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

function TXWizForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TXWizForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TXWizForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TXWizForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TXWizForm.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(BiDiMode);
end;

function TXWizForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TXWizForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TXWizForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TXWizForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TXWizForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TXWizForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TXWizForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TXWizForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TXWizForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TXWizForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TXWizForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TXWizForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TXWizForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

procedure TXWizForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TXWizForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TXWizForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TXWizForm.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TXWizForm.Set_BiDiMode(Value: TxBiDiMode);
begin
  BiDiMode := TBiDiMode(Value);
end;

procedure TXWizForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TXWizForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TXWizForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TXWizForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TXWizForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TXWizForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TXWizForm.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TXWizForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TXWizForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TXWizForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TXWizForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TXWizForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TXWizForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TXWizForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TXWizForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
  Beep;
end;

procedure TXWizForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TXWizForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TXWizForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TXWizForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TXWizForm.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TXWizForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TXWizForm.FormCreate(Sender: TObject);
begin
  WizardForm := TWizardForm.Create (Self);
  WizardForm.Parent := Self;
  WizardForm.Align := alClient;
  WizardForm.BorderStyle := bsNone;
  WizardForm.Show;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TXWizForm,
    Class_XWizForm,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
