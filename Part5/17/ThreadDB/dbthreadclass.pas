unit dbthreadclass;

interface

uses
  Classes, Windows;

type
  TDatabaseThread = class(TThread)
  private
    { Private declarations }
    NewCaption: string;
    LogText: string;
    FCustNo: Integer;
    procedure SetCustNo(const Value: Integer);
  protected
    procedure Execute; override;
    procedure UpdateCaption;
    procedure AddToLog;
  public
    property CustNo: Integer read FCustNo write SetCustNo;
  end;

var
  thcount: Integer = 0;
  hSemaphore: THandle;

implementation

uses
  FormDbThread, ThreadedModule, SysUtils;

procedure TDatabaseThread.UpdateCaption;
begin
  Form1.Caption := NewCaption;
end;

procedure TDatabaseThread.Execute;
begin
  // log
  Inc (thcount);
  LogText := Format ('Thread %d started (%d active)',
    [CustNo, thcount]);
  Synchronize (AddToLog);

  WaitForSingleobject (hSemaphore, 100000);
  try
    with TDataModule2.Create (nil) do
    begin
      try
        Query1.ParamByName('Cust').AsInteger := CustNo;
        Query1.Open;
        NewCaption := 'Number of Orders ' +
          Query1Count.AsString;
      finally
        Synchronize (UpdateCaption);
        Query1.Close;
        Free; // the data module

        // log
        Dec (thcount);
        LogText := Format ('Thread %d completed (%d active)',
          [CustNo, thcount]);
        Synchronize (AddToLog);
      end;
    end;
  finally
    ReleaseSemaphore (hSemaphore, 1, nil);
  end;
end;

procedure TDatabaseThread.SetCustNo(const Value: Integer);
begin
  FCustNo := Value;
end;

procedure TDatabaseThread.AddToLog;
begin
  with Form1.ListBox1 do
    ItemIndex := Items.Add (LogText);
end;

initialization
  hSemaphore := CreateSemaphore (
    nil, 10, 10, 'ThDB_MD_Semaphore');
end.
