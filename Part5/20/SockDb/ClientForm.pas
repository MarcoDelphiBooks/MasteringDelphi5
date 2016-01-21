unit ClientForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ScktComp, DBCtrls, ExtCtrls, Db, Mask, DBTables;

type
  TForm1 = class(TForm)
    ClientSocket1: TClientSocket;
    EditServer: TEdit;
    Server: TLabel;
    Table1: TTable;
    Table1Company: TStringField;
    Table1CompID: TFloatField;
    Table1Address: TStringField;
    Table1State: TStringField;
    Table1Country: TStringField;
    Table1Email: TStringField;
    Table1Contact: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    btnSendAll: TButton;
    lbLog: TListBox;
    BtnStop: TButton;
    BtnDelete: TButton;
    Label8: TLabel;
    Bevel1: TBevel;
    procedure btnSendAllClick(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure BtnStopClick(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure BtnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    fWaiting: Boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btnSendAllClick(Sender: TObject);
var
  Data: TStringList;
  I: Integer;
begin
  // activate the connection
  ClientSocket1.Address := EditServer.Text;
  ClientSocket1.Active := True;
  Application.ProcessMessages;
  // save database data in a string list
  Data := TStringList.Create;
  try
    table1.First;
    while not Table1.Eof do
    begin
      // if the record is still not logged
      if Table1CompID.IsNull or (Table1CompId.AsInteger = 0) then
      begin
        lbLog.Items.Add ('Sending ' + Table1Company.AsString);
        Data.Clear;
        // create strings with structure "FieldName=Value"
        for I := 0 to Table1.FieldCount - 1 do
          Data.Values [Table1.Fields[I].FieldName] :=
            Table1.Fields [I].AsString;
        // send the record
        ClientSocket1.Socket.SendText (Data.Text);
        // wait for reponse
        fWaiting := True;
        while fWaiting do
          Application.ProcessMessages;
      end;
      Table1.Next;
    end;
  finally
    // free the data and close the connection
    Data.Free;
    ClientSocket1.Active := False;
  end;
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

procedure TForm1.FormCreate(Sender: TObject);
begin
  fWaiting := False;
  // use a table in the current directory
  Table1.DatabaseName :=
    ExtractFilePath (Application.ExeName);
  // create it if it doesn't exist
  if not Table1.Exists then
    Table1.CreateTable;
  Table1.Active := True;
end;

procedure TForm1.BtnStopClick(Sender: TObject);
begin
  fWaiting := False;
end;

procedure TForm1.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  if fWaiting then
  begin
    Table1.Edit;
    Table1CompId.AsString := Socket.ReceiveText;
    Table1.Post;
    lbLog.Items.Add (Table1Company.AsString +
      ' logged as ' + Table1CompId.AsString);
    fWaiting := False;
  end;
end;

procedure TForm1.BtnDeleteClick(Sender: TObject);
begin
  table1.First;
  while not Table1.Eof do
  begin
    // if the record is still logged
    if not Table1CompID.IsNull and (Table1CompId.AsInteger <> 0) then
      Table1.Delete;
    Table1.Next;
  end;
end;

end.
