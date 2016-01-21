unit AEForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, ComCtrls,
  ADODB;

type
  TAdoEmplForm = class(TForm)
    AdoTable: TADOTable;
    DataSource1: TDataSource;
    ADOConnection: TADOConnection;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    cbLock: TCheckBox;
    EditName: TEdit;
    btnFind: TButton;
    btnTotal: TButton;
    BtnStart: TButton;
    BtnCommit: TButton;
    BtnRollback: TButton;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure cbLockClick(Sender: TObject);
    procedure AdoTableBeforeEdit(DataSet: TDataSet);
    procedure BtnCommitClick(Sender: TObject);
    procedure BtnRollbackClick(Sender: TObject);
    procedure BtnStartClick(Sender: TObject);
  private
    { Private declarations }
  end;

var
  AdoEmplForm: TAdoEmplForm;

implementation

{$R *.DFM}

procedure TAdoEmplForm.FormCreate(Sender: TObject);
begin
  // open the new or existing table
  AdoTable.Open;
end;

procedure TAdoEmplForm.btnTotalClick(Sender: TObject);
var
  Bookmark: TBookmark;
  Total: Real;
begin
  {store the current position, crating a new bookmark}
  Bookmark := AdoTable.GetBookmark;
  // AdoTable.DisableControls;
  AdoTable.BlockReadSize := 10;
  Total := 0;
  try
    AdoTable.First;
    while not AdoTable.EOF do
    begin
      Total := Total + AdoTable.FieldByName('Salary').Value;
      AdoTable.Next;
    end;
  finally
    {go back to the bookmark and destroy it}
    AdoTable.GotoBookmark (Bookmark);
    AdoTable.FreeBookmark (Bookmark);
    // AdoTable.EnableControls;
    AdoTable.BlockReadSize := 0;
  end;
  MessageDlg ('Sum of new salaries is ' +
    Format ('%m', [Total]), mtInformation, [mbOk], 0);
end;

procedure TAdoEmplForm.btnFindClick(Sender: TObject);
begin
  if not AdoTable.Locate ('LastName', EditName.Text, []) then
    MessageDlg ('Name not found', mtError, [mbOk], 0);
end;

procedure TAdoEmplForm.cbLockClick(Sender: TObject);
begin
  AdoTable.Close;
  if not cbLock.Checked then
    AdoTable.LockType := ltPessimistic
  else
    AdoTable.LockType := ltOptimistic;
  AdoTable.Open;
end;

procedure TAdoEmplForm.AdoTableBeforeEdit(DataSet: TDataSet);
begin
  // start a transaction, if not already started
  if not AdoConnection.InTransaction then
    BtnStartClick (Self);
end;

procedure TAdoEmplForm.BtnCommitClick(Sender: TObject);
begin
  if AdoTable.State = dsEdit then
    AdoTable.Post;
  AdoConnection.CommitTrans;
  // set buttons
  BtnStart.Enabled := True;
  BtnCommit.Enabled := False;
  BtnRollback.Enabled := False;
end;

procedure TAdoEmplForm.BtnRollbackClick(Sender: TObject);
begin
  AdoTable.Cancel;
  AdoConnection.RollbackTrans;
  // refresh
  AdoTable.Requery;
  // set buttons
  BtnStart.Enabled := True;
  BtnCommit.Enabled := False;
  BtnRollback.Enabled := False;
end;

procedure TAdoEmplForm.BtnStartClick(Sender: TObject);
begin
  AdoConnection.BeginTrans;
  // set buttons
  BtnStart.Enabled := False;
  BtnCommit.Enabled := True;
  BtnRollback.Enabled := True;
end;

end.
