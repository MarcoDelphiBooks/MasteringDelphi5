unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBTables, Grids, DBGrids;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Database1: TDatabase;
    Table1: TTable;
    DataSource1: TDataSource;
    grpIsolation: TRadioGroup;
    grpTransaction: TGroupBox;
    btnRollback: TButton;
    btnStart: TButton;
    btnCommit: TButton;
    btnRefresh: TButton;
    btnClose: TButton;
    grpUpdate: TRadioGroup;
    procedure grpIsolationClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure btnRollbackClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure grpUpdateClick(Sender: TObject);
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

procedure TForm1.grpIsolationClick(Sender: TObject);
begin
  Database1.TransIsolation := TTransIsolation(grpIsolation.ItemIndex);
end;

procedure TForm1.btnStartClick(Sender: TObject);
begin
  Database1.StartTransaction;
  btnStart.Enabled := False;
  btnCommit.Enabled := True;
  btnRollback.Enabled := True;
end;

procedure TForm1.btnCommitClick(Sender: TObject);
begin
  Database1.Commit;
  btnStart.Enabled := True;
  btnCommit.Enabled := False;
  btnRollback.Enabled := False;
end;

procedure TForm1.btnRollbackClick(Sender: TObject);
begin
  Database1.Rollback;
  btnStart.Enabled := True;
  btnCommit.Enabled := False;
  btnRollback.Enabled := False;
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btnRefreshClick(Sender: TObject);
begin
  Table1.Close;
  Table1.Open;
end;

procedure TForm1.grpUpdateClick(Sender: TObject);
begin
  Table1.UpdateMode := TUpdateMode(grpUpdate.ItemIndex);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Table1.Open;
end;

end.
