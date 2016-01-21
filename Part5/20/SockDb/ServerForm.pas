unit ServerForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ScktComp, StdCtrls, Grids, DBGrids, Db, DBTables, ComCtrls;

const
  wm_RefreshClients = wm_User;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    lbClients: TListBox;
    lbLog: TListBox;
    ServerSocket1: TServerSocket;
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Table1Company: TStringField;
    Table1CompID: TFloatField;
    Table1Address: TStringField;
    Table1State: TStringField;
    Table1Country: TStringField;
    Table1Email: TStringField;
    Table1Contact: TStringField;
    Table1LoggedBy: TStringField;
    Table1LoggetOn: TDateField;
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
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

procedure TForm1.FormCreate(Sender: TObject);
begin
  // use a table in the current directory
  Table1.DatabaseName :=
    ExtractFilePath (Application.ExeName);
  // create the table, if it doens't exist
  if not Table1.Exists then
    Table1.CreateTable;
  Table1.Active := True;
end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  strCommand: string;
  strFeedback: string;
  Data: TStringList;
  I: Integer;
begin
  // read from the client
  strCommand := Socket.ReceiveText;
  lbLog.Items.Add (strCommand);

  // reassemble the data
  Data := TStringList.Create;
  try
    Data.Text := strCommand;
    // new record
    Table1.Insert;
    // set the fields using the strings
    for I := 0 to Table1.FieldCount - 1 do
      Table1.Fields [I].AsString :=
        Data.Values [Table1.Fields[I].FieldName];
    // complete with random ID, sender, and date
    Table1CompID.AsInteger := GetTickCount;
    Table1LoggedBy.AsString := Socket.RemoteAddress;
    Table1LoggetOn.AsDateTime := Date;
    Table1.Post;

    // get the value to return
    strFeedback := Table1CompID.AsString;

    // send results back
    lbLog.Items.Add (strFeedback);
    Socket.SendText (strFeedback);
  finally
    Data.Free;
  end;
end;

end.
