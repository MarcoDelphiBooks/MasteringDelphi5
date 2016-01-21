unit MaxForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, StdCtrls;

type
  TForm1 = class(TForm)
    EmpTable: TTable;
    EmpQuery: TQuery;
    Database1: TDatabase;
    BtnTable: TButton;
    BtnQuery: TButton;
    procedure BtnTableClick(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.BtnTableClick(Sender: TObject);
var
  MaxSalary: Double;
  Tick: Cardinal;
begin
  Tick := GetTickCount;
  EmpTable.Open;
  EmpTable.First;
  MaxSalary := 0;
  while not EmpTable.Eof do
  begin
    if EmpTable.FieldByName ('Salary').AsCurrency > MaxSalary then
      MaxSalary := EmpTable.FieldByName ('Salary').AsCurrency;
    EmpTable.Next;
  end;
  Caption := 'Time: ' + IntToStr (GetTickCount - Tick);
  ShowMessage (FloatToStr (MaxSalary));
end;

procedure TForm1.BtnQueryClick(Sender: TObject);
var
  Tick: Cardinal;
begin
  Tick := GetTickCount;
  EmpQuery.Open;
  Caption := 'Time: ' + IntToStr (GetTickCount - Tick);
  ShowMessage (EmpQuery.Fields[0].AsString);
end;

end.
