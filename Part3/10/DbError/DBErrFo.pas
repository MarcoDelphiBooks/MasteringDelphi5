unit DBErrFo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DB, DBTables, StdCtrls, AppEvnts;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Query1: TQuery;
    ApplicationEvents1: TApplicationEvents;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Table1DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure Table1EditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure Table1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
  private
    { Private declarations }
  public
    procedure ShowError (E: EDBEngineError);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ShowError(E: EDBEngineError);
var
  I: Integer;
begin
  Memo1.Lines.Add('');
  Memo1.Lines.Add('Error: ' + (E.Message));
  Memo1.Lines.Add('Number of errors: ' +
    IntToStr(E.ErrorCount));
  // iterate through the Errors
  for I := 0 to E.ErrorCount - 1 do
  begin
    Memo1.Lines.Add('Message: ' +
      E.Errors[I].Message);
    Memo1.Lines.Add('   Category: ' +
      IntToStr(E.Errors[I].Category));
     Memo1.Lines.Add('   Error Code: ' +
      IntToStr(E.Errors[I].ErrorCode));
    Memo1.Lines.Add('   SubCode: ' +
      IntToStr(E.Errors[I].SubCode));
    Memo1.Lines.Add('   Native Error: ' +
      IntToStr(E.Errors[I].NativeError));
    Memo1.Lines.Add('');
  end;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  Table1.FieldByName ('Name').Value := 'something';
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  S: String;
begin
  s := Table1.FieldByName ('Name').Value;
  Table1.Insert;
  Table1.FieldByName ('Name').Value := s;
  Table1.Post;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Query1.SQL.Clear;
  Query1.SQL.Add (
    'select * from Countries where Population > 100000');
  Query1.Open;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Query1.SQL.Clear;
  Query1.SQL.Add (
    'select * from Country where Populations > 100000');
  Query1.Open;
end;

procedure TForm1.Table1DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Memo1.Lines.Add (' -> Delete Error: ' + E.Message);
end;

procedure TForm1.Table1EditError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Memo1.Lines.Add (' -> Edit Error: ' + E.Message);
end;

procedure TForm1.Table1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Memo1.Lines.Add (' -> Post Error: ' + E.Message);
end;

procedure TForm1.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  Beep;
  if E is EDBEngineError then
    ShowError (EDBEngineError (E))
  else
    ShowMessage (E.Message);
end;

end.
