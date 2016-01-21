unit sysform;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, AppEvnts;

type
  TForm1 = class(TForm)
    Button1: TButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Edit1: TMenuItem;
    Undo1: TMenuItem;
    N1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    N2: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Undo1Click(Sender: TObject);
    procedure Cut1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
  public
    procedure WMSysCommand (var Msg: TWMSysCommand);
      message wm_SysCommand;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

const
  idSysAbout = 100;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // add a separator and a menu item to the system menu
  AppendMenu (GetSystemMenu (Handle, FALSE),
    MF_SEPARATOR, 0, '');
  AppendMenu (GetSystemMenu (Handle, FALSE),
    MF_STRING, idSysAbout, '&About...');

  // add the same items to the application system menu
  AppendMenu (GetSystemMenu (Application.Handle, FALSE),
    MF_SEPARATOR, 0, '');
  AppendMenu (GetSystemMenu (Application.Handle, FALSE),
    MF_STRING, idSysAbout, '&About...');
end;

procedure TForm1.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if (Msg.Message = wm_SysCommand) and
    (Msg.wParam = idSysAbout) then
  begin
    ShowMessage ('Mastering Delphi: SysMenu2 example');
    Handled := True;
  end;
end;

procedure TForm1.WMSysCommand (var Msg: TWMSysCommand);
var
  Item: TMenuItem;
begin
  // handle a specific command
  if Msg.CmdType = idSysAbout then
    ShowMessage ('Mastering Delphi: SysMenu2 example');

  // activate standard menu handling code
  Item := MainMenu1.FindItem (Msg.CmdType, fkCommand);
  if not (Item = nil) then
    Item.Click;

  // default system menu commands
  inherited;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
begin
  // add a separator
  AppendMenu (GetSystemMenu (Handle, FALSE), MF_SEPARATOR, 0, '');
  // add the main menu to the system menu
  with MainMenu1 do
    for I := 0 to Items.Count - 1 do
      AppendMenu (GetSystemMenu (Self.Handle, FALSE),
        mf_Popup, Items[I].Handle, PChar (Items[I].Caption));
  // disable the button
  Button1.Enabled := False;
end;

procedure TForm1.New1Click(Sender: TObject);
begin
  ShowMessage ('File New menu command');
end;

procedure TForm1.Open1Click(Sender: TObject);
begin
  ShowMessage ('File Open menu command');
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Undo1Click(Sender: TObject);
begin
  ShowMessage ('Edit Undo menu command');
end;

procedure TForm1.Cut1Click(Sender: TObject);
begin
  ShowMessage ('Edit Cut menu command');
end;

procedure TForm1.Copy1Click(Sender: TObject);
begin
  ShowMessage ('Edit Copy menu command');
end;

procedure TForm1.Paste1Click(Sender: TObject);
begin
  ShowMessage ('Edit Paste menu command');
end;

procedure TForm1.About1Click(Sender: TObject);
begin
    ShowMessage ('Mastering Delphi: SysMenu2 example');
end;

end.
