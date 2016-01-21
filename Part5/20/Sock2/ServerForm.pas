unit ServerForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ScktComp, StdCtrls, FileCtrl;

const
  wm_RefreshClients = wm_User;

type
  TForm1 = class(TForm)
    ServerSocket1: TServerSocket;
    lbClients: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    lbLog: TListBox;
    FileListBox1: TFileListBox;
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
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
end;

procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  lbLog.Items.Add ('Disconnected: ' +
    Socket.RemoteHost + ' (' +
    Socket.RemoteAddress + ')' );
end;

procedure TForm1.RefreshClients;
begin
end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  strCommand, strFile, strFeedback: string;
begin
  // read from the client
  strCommand := Socket.ReceiveText;
  lbLog.Items.Add ('Client: ' + Socket.RemoteAddress + ': ' +
    strCommand);
  // extract the file name (all commands have 5 characters)
  strFile := Copy (strCommand, 6, Length (strCommand) - 5);

  // execute program
  if Pos ('EXEC!', strCommand) = 1 then
  begin
    if FileExists (strFile) and (
        WinExec (pChar (strFile), sw_ShowNormal) > 31) then
      strFeedback := 'ERROR' + strFile + ' activated'
    else
      strFeedback := 'ERROR' + strFile + ' not found';
    Socket.SendText (strFeedback);
  end
  
  // send back a text file
  else if Pos ('TEXT!', strCommand) = 1 then
  begin
    if FileExists (strFile) then
    begin
      strFeedback := 'TEXT!';
      Socket.SendText (strFeedback);
      Socket.SendStream (TFileStream.Create (
        strFile, fmOpenRead or fmShareDenyWrite));
    end
    else
    begin
      strFeedback := 'ERROR' + strFile + ' not found';
      Socket.SendText (strFeedback);
    end;
  end

  // send back a bitmap file
  else if Pos ('BITM!', strCommand) = 1 then
  begin
    if FileExists (strFile) then
    begin
      strFeedback := 'BITM!';
      Socket.SendText (strFeedback);
      Socket.SendStream (TFileStream.Create (
        strFile, fmOpenRead or fmShareDenyWrite));
    end
    else
    begin
      strFeedback := 'ERROR' + strFile + ' not found';
      Socket.SendText (strFeedback);
    end;
  end

  // send back a directory listing
  else if Pos ('LIST!', strCommand) = 1 then
  begin
    if DirectoryExists (strFile) then
    begin
      strFeedback := 'LIST!';
      Socket.SendText (strFeedback);
      FileListBox1.Directory := strFile;
      Socket.SendText (FileListBox1.Items.Text);
    end
    else
    begin
      strFeedback := 'ERROR' + strFile + ' not found';
      Socket.SendText (strFeedback);
    end;
  end
  else
  begin
    strFeedback := 'ERROR' + 'Undefined command: ' + strCommand;
    Socket.SendText (strFeedback);
  end;

  // log result
  lbLog.Items.Add (strFeedback);
end;

end.

