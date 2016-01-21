unit Tranform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls;

type
  TForm1 = class(TForm)
    Database1: TDatabase;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BtnStart: TButton;
    BtnCommit: TButton;
    BtnRollback: TButton;
    Query1: TQuery;
    procedure BtnStartClick(Sender: TObject);
    procedure BtnCommitClick(Sender: TObject);
    procedure BtnRollbackClick(Sender: TObject);
    procedure Query1BeforeEdit(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.BtnStartClick(Sender: TObject);
begin
  Database1.StartTransaction;
  // set buttons
  BtnStart.Enabled := False;
  BtnCommit.Enabled := True;
  BtnRollback.Enabled := True;
end;

procedure TForm1.BtnCommitClick(Sender: TObject);
begin
  Query1.Post;
  Database1.Commit;
  // set buttons
  BtnStart.Enabled := True;
  BtnCommit.Enabled := False;
  BtnRollback.Enabled := False;
end;

procedure TForm1.BtnRollbackClick(Sender: TObject);
begin
  Query1.Cancel;
  Database1.Rollback;
  // refresh
  Query1.Refresh;
  // set buttons
  BtnStart.Enabled := True;
  BtnCommit.Enabled := False;
  BtnRollback.Enabled := False;
end;

procedure TForm1.Query1BeforeEdit(DataSet: TDataSet);
begin
  // start a transaction, if not already started
  if not Database1.InTransaction then
    BtnStartClick (Self);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Query1.Open;
end;

end.
