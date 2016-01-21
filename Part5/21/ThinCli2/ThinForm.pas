unit ThinForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, MConnect,
  MidasCon;

type
  TForm1 = class(TForm)
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    Panel1: TPanel;
    ButtonUpdate: TButton;
    ClientDataSet1Name: TStringField;
    ClientDataSet1Capital: TStringField;
    ClientDataSet1Continent: TStringField;
    ClientDataSet1Area: TFloatField;
    ClientDataSet1Population: TFloatField;
    ButtonSnap: TButton;
    ButtonReload: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ClientDataSet2: TClientDataSet;
    ButtonDelta: TButton;
    ClientDataSet1Status: TStringField;
    ButtonUndo: TButton;
    DBGrid1: TDBGrid;
    DCOMConnection1: TDCOMConnection;
    procedure ButtonUpdateClick(Sender: TObject);
    procedure ButtonSnapClick(Sender: TObject);
    procedure ButtonReloadClick(Sender: TObject);
    procedure ButtonDeltaClick(Sender: TObject);
    procedure ClientDataSet1CalcFields(DataSet: TDataSet);
    procedure ButtonUndoClick(Sender: TObject);
    procedure ClientDataSet1ReconcileError(DataSet: TClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure ClientDataSet1AfterPost(DataSet: TDataSet);
    procedure Form1Create(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  TypInfo, Reconc, DeltForm;

procedure TForm1.ButtonUpdateClick(Sender: TObject);
begin
  ClientDataSet1.ApplyUpdates (-1);
  FormDelta.Hide;
end;

procedure TForm1.ButtonSnapClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    ClientDataSet1.SaveToFile (SaveDialog1.FileName);
end;

procedure TForm1.ButtonReloadClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    ClientDataSet1.LoadFromFile (OpenDialog1.FileName);
end;

procedure TForm1.ButtonDeltaClick(Sender: TObject);
begin
  if ClientDataSet1.ChangeCount > 0 then
  begin
    ClientDataSet2.Data :=
      ClientDataSet1.Delta;
    ClientDataSet2.Open;
    FormDelta.DataSource1.DataSet :=
       ClientDataSet2;
    FormDelta.Show;
  end
  else
    FormDelta.Hide;
end;

procedure TForm1.ClientDataSet1CalcFields(DataSet: TDataSet);
begin
  ClientDataSet1Status.AsString :=
    GetEnumName (TypeInfo(TUpdateStatus),
      Integer (ClientDataSet1.UpdateStatus));
end;

procedure TForm1.ButtonUndoClick(Sender: TObject);
begin
  ClientDataSet1.UndoLastChange (True);
end;

procedure TForm1.ClientDataSet1ReconcileError(DataSet: TClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TForm1.ClientDataSet1AfterPost(DataSet: TDataSet);
begin
  if FormDelta.Visible and
    (ClientDataSet1.ChangeCount > 0) then
  begin
    ClientDataSet2.Data := ClientDataSet1.Delta;
  end;
end;

procedure TForm1.Form1Create(Sender: TObject);
begin
  ClientDataSet1.Open;
end;

end.
