unit ClientForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ScktComp, ExtCtrls;

type
  TCliStatus = (csIdle, csList, csBitmap, csText, csError);

  TForm1 = class(TForm)
    ClientSocket1: TClientSocket;
    cbActivate: TCheckBox;
    EditServer: TEdit;
    Label4: TLabel;
    btnExec: TButton;
    EditServerFile: TEdit;
    Label2: TLabel;
    ListFiles: TListBox;
    Label1: TLabel;
    EditDir: TEdit;
    btnGetDir: TButton;
    LabelDir: TLabel;
    Bevel1: TBevel;
    btnBitmap: TButton;
    btnText: TButton;
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure cbActivateClick(Sender: TObject);
    procedure btnExecClick(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure btnGetDirClick(Sender: TObject);
    procedure ListFilesClick(Sender: TObject);
    procedure btnBitmapClick(Sender: TObject);
    procedure btnTextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    CliStatus: TCliStatus;
    Buffer: array [0..9999] of Char;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  CliBmp, CliText;

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

procedure TForm1.btnExecClick(Sender: TObject);
begin
  ClientSocket1.Socket.SendText ('EXEC!' + EditServerFile.Text);
end;

procedure TForm1.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
var
  strIn: string;
  Stream: TMemoryStream;
  nReceived: Integer;
begin
  case CliStatus of
    // look for data to receive
    csIdle:
    begin
      Socket.ReceiveBuf (Buffer, 5);
      strIn := Copy (Buffer, 1, 5);
      if strIn = 'TEXT!' then
        CliStatus := csText
      else if strIn = 'BITM!' then
        CliStatus := csBitmap
      else if strIn = 'LIST!' then
        CliStatus := csList
      else if strIn = 'ERROR' then
        CliStatus := csError;
    end;
    // show the messages (might actually not be an error)
    csError:
    begin
      ShowMessage (Socket.ReceiveText);
      cliStatus := csIdle;
    end;
    // get a directory listing
    csList:
    begin
      ListFiles.Items.Text := Socket.ReceiveText;
      cliStatus := csIdle;
    end;
    // read a text file
    csText:
    begin
      with TFormText.Create (Application) do
      begin
        Memo1.Text := Socket.ReceiveText;
        Show;
      end;
      cliStatus := csIdle;
    end;
    // read a bitmap file
    csBitmap:
      with TFormBmp.Create (Application) do
      begin
        Stream := TMemoryStream.Create;
        Screen.Cursor := crHourglass;
        try
          while True do
          begin
            nReceived := Socket.ReceiveBuf (Buffer, sizeof (Buffer));
            if nReceived <= 0 then
              Break
            else
              Stream.Write (Buffer, nReceived);
            // delay (200 milliseconds)
            Sleep (200);
          end;
          // reset and load the temporary file
          Stream.Position := 0;
          Image1.Picture.Bitmap.LoadFromStream (Stream);
        finally
          Stream.Free;
          Screen.Cursor := crDefault;
        end;
        Show;
      cliStatus := csIdle;
      end;
  end; // case
end;

procedure TForm1.btnGetDirClick(Sender: TObject);
begin
  ClientSocket1.Socket.SendText ('LIST!' + EditDir.Text);
  LabelDir.Caption := EditDir.Text;
end;

procedure TForm1.ListFilesClick(Sender: TObject);
begin
  EditServerFile.Text := LabelDir.Caption + '\' +
    ListFiles.Items [ListFiles.ItemIndex];
end;

procedure TForm1.btnBitmapClick(Sender: TObject);
begin
  ClientSocket1.Socket.SendText ('BITM!' + EditServerFile.Text);
end;

procedure TForm1.btnTextClick(Sender: TObject);
begin
  ClientSocket1.Socket.SendText ('TEXT!' + EditServerFile.Text);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CliStatus := csIdle;
end;

end.
 