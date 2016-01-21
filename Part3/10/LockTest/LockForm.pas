unit LockForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, DB, DBTables;

type
  TNavigForm = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBNavigator1: TDBNavigator;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Timer1: TTimer;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure TestLockStatus;
  end;

var
  NavigForm: TNavigForm;

implementation

{$R *.DFM}

uses
  BDE;

function IsRecordLocked (Table: TTable): Boolean;
var
  Locked: BOOL;
  hCur: hDBICur;  
  rslt: DBIResult;
begin  
  Table.UpdateCursorPos;
  // test if the record is locked by the current session
  Check (DbiIsRecordLocked (Table.Handle, Locked));
  Result := Locked;
  // otherwise check all sessions
  if (Result = False) then  
  begin
    // get a new cursor to the same record
    Check (DbiCloneCursor (Table.Handle, False, False, hCur));    
    try
      // try to place a write lock in the record
      rslt := DbiGetRecord (hCur, dbiWRITELOCK, nil, nil);
      // don't call Check: we want to do special actions
      // instead of raising an exception
      if rslt <> DBIERR_NONE then      
      begin
        // if a lock error occured
        if HiByte (rslt) = ERRCAT_LOCKCONFLICT then
          Result := True
        else
          // if some other error happened
          Check (rslt); // raise the exception
      end      
      else
        // if the function was successful, release the lock
        Check (DbiRelRecordLock (hCur, False));    
    finally
      // close the cloned cursor 
      Check (DbiCloseCursor (hCur));
    end;
  end;
end;

procedure TNavigForm.TestLockStatus;
begin
  // if the table is not in edit mode
  if Table1.State in [dsEdit, dsInsert] then
    Caption := 'LockTest - Record in edit mode'
  else if IsRecordLocked (Table1) then
  begin
    DbEdit1.ReadOnly := True;
    DbEdit2.ReadOnly := True;
    DbEdit3.ReadOnly := True;
    Caption := 'LockTest - Record already locked';
  end
  else
  begin
    DbEdit1.ReadOnly := False;
    DbEdit2.ReadOnly := False;
    DbEdit3.ReadOnly := False;
    Caption := 'LockTest - Record not locked';
  end;
end;

procedure TNavigForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  // if the record changed
  if (Field = nil) then
    TestLockStatus;
end;

procedure TNavigForm.Timer1Timer(Sender: TObject);
begin
  TestLockStatus;
end;

end.
