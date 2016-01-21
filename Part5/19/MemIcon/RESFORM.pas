unit Resform;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, Gauges,
  StdCtrls, Menus, ShellAPI;

const
  wm_IconMessage = wm_User;

type
  TMemForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    RamGauge: TGauge;
    VirtualGauge: TGauge;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    Details1: TMenuItem;
    Close1: TMenuItem;
    N1: TMenuItem;
    About1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Details1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    procedure IconTray (var Msg: TMessage);
      message wm_IconMessage;
  private
    nid: TNotifyIconData;
  end;

var
  MemForm: TMemForm;

implementation

{$R *.DFM}
{$R RYG.RES}

function FmtMem (N: Integer): string;
begin
  if N > 1024*1024 then
    FmtMem := Format ('%.1f MB', [n / (1024*1024)])
  else
    FmtMem := Format ('%.1f KB', [n / 1024])
end;

procedure TMemForm.Timer1Timer(Sender: TObject);
var
  MemInfo : TMemoryStatus;
begin
  MemInfo.dwLength := Sizeof (MemInfo);
  GlobalMemoryStatus (MemInfo);
  RamGauge.Progress := MemInfo.dwAvailPhys div
    (MemInfo.dwTotalPhys div 100);
  VirtualGauge.Progress := MemInfo.dwAvailPageFile div
    (MemInfo.dwTotalPageFile div 100);

  Caption := Format ('Memory: = %d - %d',
    [RamGauge.Progress, VirtualGauge.Progress]);

  Label1.Caption := Format ('RAM:'#13'%s'#13'(%s)',
    [FmtMem (MemInfo.dwAvailPhys),
    FmtMem (MemInfo.dwTotalPhys)]);
  Label2.Caption := Format ('Swap:'#13'%s'#13'(%s)',
    [FmtMem (MemInfo.dwAvailPageFile),
    FmtMem (MemInfo.dwTotalPageFile)]);

  // set icon color
  if RamGauge.Progress > 5 then
    Icon.Handle :=
      LoadIcon (HInstance, 'GREEN')
  else if VirtualGauge.Progress > 20 then
    Icon.Handle :=
      LoadIcon (HInstance, 'YELLOW')
  else
    Icon.Handle :=
      LoadIcon (HInstance, 'RED');

  // update the NotifyIcon structure
  nid.hIcon := Icon.Handle;
  strcopy (nid.szTip, PChar(Caption));
  nid.uFlags := nif_Icon or nif_Tip;
  Shell_NotifyIcon (NIM_MODIFY, @nid);
end;

procedure TMemForm.IconTray (var Msg: TMessage);
var
  Pt: TPoint;
begin
  if Msg.lParam = wm_rbuttondown then
  begin
    GetCursorPos (Pt);
//    SetForegroundWindow (Handle);
    PopupMenu1.Popup (Pt.x, Pt.y);
  end;
  if Msg.lParam = wm_lbuttondblclk then
    Details1Click (Self);
end;

procedure TMemForm.FormCreate(Sender: TObject);
begin
  // load the initial icon
  Icon.Handle :=
    LoadIcon (HInstance, 'GREEN');

  // fill the NotifyIcon data structure
  nid.cbSize := sizeof (nid);
  nid.wnd := Handle;
  nid.uID := 1; // icon ID
  nid.uCallBAckMessage := wm_IconMessage;
  nid.hIcon := Icon.Handle;
  nid.szTip := 'Free memory';
  nid.uFlags := nif_Message or
    nif_Icon or nif_Tip;
  Shell_NotifyIcon (NIM_ADD, @nid);

  // update the output ASAP
  Timer1Timer (Self);
end;

procedure TMemForm.FormDestroy(Sender: TObject);
begin
  nid.uFlags := 0;
  Shell_NotifyIcon (NIM_DELETE, @nid);
end;

procedure TMemForm.Details1Click(Sender: TObject);
begin
  ShowWindow (Handle, sw_ShowNormal);
  SetForegroundWindow (Handle);
  Show; // enables the creation of window controls
end;

procedure TMemForm.About1Click(Sender: TObject);
begin
  MessageDlg ('Windows Memory Meter'#13 +
    'Copyright Marco Cantù 1996-99'#13 +
    'Source code in Mastering Delphi',
    mtInformation, [mbOk], 0);
end;

procedure TMemForm.Close1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMemForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
  ShowWindow (Handle, sw_Hide);
end;

end.


