unit Remote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, AfRemote_TLB, StdCtrls, Db, DBClient, ExtCtrls, Grids,
  DBGrids, MIDASCon, MConnect, SConnect;

type
  TActiveRemote = class(TActiveForm, IActiveRemote)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    CheckActive: TCheckBox;
    BtnApply: TButton;
    SocketConnection1: TSocketConnection;
    procedure BtnApplyClick(Sender: TObject);
    procedure CheckActiveClick(Sender: TObject);
    procedure ClientDataSet1ReconcileError(DataSet: TClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
    FEvents: IActiveRemoteEvents;
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
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure Initialize; override;
    function Get_Active: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: TColor; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: Font; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_WindowState: TxWindowState; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: TColor); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: Font); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Set_WindowState(Value: TxWindowState); safecall;
  public
    { Public declarations }
  end;

implementation

uses ComServ, ReconDlg;

{$R *.DFM}

{ TActiveRemote }

procedure TActiveRemote.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IActiveRemoteEvents;
end;

procedure TActiveRemote.Initialize;
begin
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TActiveRemote.Get_Active: WordBool;
begin
  Result := Active;
end;

function TActiveRemote.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TActiveRemote.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TActiveRemote.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TActiveRemote.Get_Color: TColor;
begin
  Result := Color;
end;

function TActiveRemote.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TActiveRemote.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TActiveRemote.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TActiveRemote.Get_Font: Font;
begin
  GetOleFont(Font, Result);
end;

function TActiveRemote.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TActiveRemote.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TActiveRemote.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TActiveRemote.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TActiveRemote.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TActiveRemote.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TActiveRemote.Get_WindowState: TxWindowState;
begin
  Result := Ord(WindowState);
end;

procedure TActiveRemote.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TActiveRemote.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TActiveRemote.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TActiveRemote.Set_Color(Value: TColor);
begin
  Color := Value;
end;

procedure TActiveRemote.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TActiveRemote.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TActiveRemote.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TActiveRemote.Set_Font(const Value: Font);
begin
  SetOleFont(Font, Value);
end;

procedure TActiveRemote.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TActiveRemote.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TActiveRemote.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TActiveRemote.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TActiveRemote.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TActiveRemote.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TActiveRemote.Set_WindowState(Value: TxWindowState);
begin
  WindowState := TWindowState(Value);
end;

procedure TActiveRemote.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TActiveRemote.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TActiveRemote.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TActiveRemote.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TActiveRemote.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TActiveRemote.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TActiveRemote.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TActiveRemote.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TActiveRemote.BtnApplyClick(Sender: TObject);
begin
  if ClientDataSet1.Active then
    ClientDataSet1.ApplyUpdates (-1);
end;

procedure TActiveRemote.CheckActiveClick(Sender: TObject);
begin
  if CheckActive.Checked and not SocketConnection1.Connected then
    SocketConnection1.Connected := True;
  ClientDataSet1.Active := CheckActive.Checked;
end;

procedure TActiveRemote.ClientDataSet1ReconcileError(
  DataSet: TClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  Action := HandleReconcileError (DataSet, UpdateKind, E);
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TActiveRemote,
    Class_ActiveRemote,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL);
end.
 