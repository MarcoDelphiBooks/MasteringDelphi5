unit CacheF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BtnApply: TButton;
    BtnCancel: TButton;
    Query1: TQuery;
    StatusBar1: TStatusBar;
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Query1AfterPost(DataSet: TDataSet);
    procedure Query1UpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Query1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  ErrorF;

{$R *.DFM}

procedure TForm1.BtnApplyClick(Sender: TObject);
begin
  try
    // apply the updates and empty the cache
    Query1.ApplyUpdates;
    Query1.CommitUpdates;
    // set buttons
    BtnApply.Enabled := False;
    BtnCancel.Enabled := False;
  except;
    // silent exception
  end;
end;

procedure TForm1.BtnCancelClick(Sender: TObject);
begin
  Query1.CancelUpdates;
  // set buttons
  BtnApply.Enabled := False;
  BtnCancel.Enabled := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Query1.Open;
end;

procedure TForm1.Query1AfterPost(DataSet: TDataSet);
begin
  // enables the two buttons
  BtnApply.Enabled := True;
  BtnCancel.Enabled := True;
end;

procedure TForm1.Query1UpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
var
  strDescr: string;
  I, nRow: Integer;
begin
  nRow := 0;
  // create the dialog box
  ErrorsForm := TErrorsForm.Create (nil);
  try
    // set the caption to a description of the record
    ErrorsForm.Caption := 'Record: ' +
      DataSet.FieldByName('LastName').AsString;

    // for each modified field
    for I := 0 to DataSet.FieldCount - 1 do
      if DataSet.Fields [I].OldValue <>
          DataSet.Fields [I].NewValue then
        begin
          // add a row to the string grid
          Inc (nRow);
          ErrorsForm.StringGrid1.RowCount := nRow + 1;
          // copy the data to the new row
          with ErrorsForm.StringGrid1, DataSet.Fields[I] do
          begin
            Cells [0, nRow] := FieldName;
            Cells [1, nRow] := string (OldValue);
            Cells [2, nRow] := string (NewValue);
          end;
        end;

    // if new items were added, show the dialog
    if (nRow > 0) and
      (ErrorsForm.ShowModal = mrOk) then
    begin
      // revert the record and hide the message
      (DataSet as TQuery).RevertRecord;
      UpdateAction := uaAbort
    end
    else
      // skip the record, keeping it in the cache
      UpdateAction := uaSkip;
  finally
    ErrorsForm.Free;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // if there are pending changes, ask the user what to do
  if Query1.UpdatesPending and
      (MessageDlg ('Apply the pending updates?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    Query1.ApplyUpdates;
end;

procedure TForm1.Query1AfterScroll(DataSet: TDataSet);
begin
  // show the record update status in the status bar
  case Query1.UpdateStatus of
    usUnmodified:
      StatusBar1.SimpleText := 'Non Modified';
    usModified:
      StatusBar1.SimpleText := 'Modified';
    usInserted:
      StatusBar1.SimpleText := 'Inserted';
  end;
end;

end.
