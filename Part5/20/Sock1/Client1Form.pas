unit Client1Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ScktComp;

type
  TForm1 = class(TForm)
    ClientSocket1: TClientSocket;
    EditMsg: TEdit;
    btnSend: TButton;
    cbActivate: TCheckBox;
    EditServer: TEdit;
    Server: TLabel;
    Label1: TLabel;
    procedure btnSendClick(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure cbActivateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btnSendClick(Sender: TObject);
begin
  ClientSocket1.Socket.SendText (EditMsg.Text);
end;

procedure TForm1.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Caption := 'Connected';
end;

procedure TForm1.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Caption := 'Disconnected';
end;

procedure TForm1.cbActivateClick(Sender: TObject);
begin
  if not ClientSocket1.Active then
    ClientSocket1.Address := EditServer.Text;
  ClientSocket1.Active := cbActivate.Checked;
end;

end.
