unit ServerForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ScktComp, StdCtrls;

const
  wm_RefreshClients = wm_User;

type
  TForm1 = class(TForm)
    ServerSocket1: TServerSocket;
    lbMsg: TListBox;
    lbClients: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    lbLog: TListBox;
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    procedure RefreshClients (var Msg: TMessage);
      message wm_RefreshClients;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  lbLog.Items.Add ('Connected: ' +
    Socket.RemoteHost + ' (' +
    Socket.RemoteAddress + ')' );
  PostMessage (Handle, wm_RefreshClients, 0, 0);
end;

procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  lbLog.Items.Add ('Disconnected: ' +
    Socket.RemoteHost + ' (' +
    Socket.RemoteAddress + ')' );
  PostMessage (Handle, wm_RefreshClients, 0, 0);
end;

procedure TForm1.RefreshClients;
var
  I: Integer;
begin
  lbClients.Clear;
  for I := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
    with ServerSocket1.Socket.Connections [I] do
      lbClients.Items.Add (
        RemoteAddress + ' (' + RemoteHost + ')');
end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  // read from the client
  lbMsg.Items.Add (Socket.RemoteHost + ': ' +
    Socket.ReceiveText);
end;

end.
