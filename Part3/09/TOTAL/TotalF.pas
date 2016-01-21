unit TotalF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Buttons, DBTables, Mask, ExtCtrls,
  Dialogs, Spin, DBActns, ActnList, ImgList, ComCtrls, ToolWin;

type
  TSearchForm = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    Table1EmpNo: TIntegerField;
    Table1LastName: TStringField;
    Table1FirstName: TStringField;
    Table1PhoneExt: TStringField;
    Table1HireDate: TDateTimeField;
    Table1Salary: TCurrencyField;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditEmpNo: TDBEdit;
    EditLastName: TDBEdit;
    EditFirstName: TDBEdit;
    EditPhoneExt: TDBEdit;
    EditHireDate: TDBEdit;
    EditSalary: TDBEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Edit1: TEdit;
    ToolButton7: TToolButton;
    ToolButton6: TToolButton;
    ActionList: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetLast1: TDataSetLast;
    DataSetNext1: TDataSetNext;
    DataSetPrior1: TDataSetPrior;
    ActionGoto: TAction;
    ActionGoNear: TAction;
    ImageList: TImageList;
    ToolButton8: TToolButton;
    SpinEdit1: TSpinEdit;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ActionTotal: TAction;
    ActionIncrease: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ActionIncreaseExecute(Sender: TObject);
    procedure ActionTotalExecute(Sender: TObject);
    procedure ActionGoNearExecute(Sender: TObject);
    procedure ActionGotoExecute(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  SearchForm: TSearchForm;

implementation

{$R *.DFM}

procedure TSearchForm.FormCreate(Sender: TObject);
begin
  Table1.IndexFieldNames := 'LastName';
  Table1.First;
end;

procedure TSearchForm.ActionIncreaseExecute(Sender: TObject);
var
  Bookmark: TBookmarkStr;
  Total: Real;
begin
  // store the current position in a bookmark
  Bookmark := Table1.Bookmark;
  Table1.DisableControls;
  Total := 0;
  try
    Table1.First;
    while not Table1.EOF do
    begin
      // start edit mode
      Table1.Edit;
      Table1Salary.Value := Round (Table1Salary.Value *
        SpinEdit1.Value) / 100;
      Total := Total + Table1Salary.Value;
      Table1.Next;
    end;
  finally
    // go back to the bookmark
    Table1.Bookmark := Bookmark;
    Table1.EnableControls;
  end;
  MessageDlg ('Sum of new salaries is ' +
    Format ('%m', [Total]), mtInformation, [mbOk], 0);
end;

procedure TSearchForm.ActionTotalExecute(Sender: TObject);
var
  Bookmark: TBookmarkStr;
  Total: Real;
begin
  // store the current position in a bookmark
  Bookmark := Table1.Bookmark;
  Table1.DisableControls;
  Total := 0;
  try
    Table1.First;
    while not Table1.EOF do
    begin
      Total := Total + Table1Salary.Value;
      Table1.Next;
    end;
  finally
    // go back to the bookmark
    Table1.Bookmark := Bookmark;
    Table1.EnableControls;
  end;
  MessageDlg ('Sum of new salaries is ' +
    Format ('%m', [Total]), mtInformation, [mbOk], 0);
end;

procedure TSearchForm.ActionGoNearExecute(Sender: TObject);
begin
  // short-hand
  {Table1.FindNearest ([EditName.Text]);}

  // alternative code:
  Table1.SetKey;
  Table1 ['LastName'] := Edit1.Text;
  Table1.GotoNearest;
end;

procedure TSearchForm.ActionGotoExecute(Sender: TObject);
begin
  // locate
  if not Table1.Locate ('LastName', Edit1.Text, []) then
    MessageDlg ('Name not found', mtError, [mbOk], 0);

  // short-hand
{  if not Table1.FindKey ([EditName.Text]) then
    MessageDlg ('Name not found', mtError, [mbOk], 0); }

  // alternative code:
  {Table1.SetKey;
  Table1 ['LastName'] := EditName.Text;
  Table1.KeyFieldCount := 1;
  if not Table1.GotoKey then
    MessageDlg ('Name not found', mtError, [mbOk], 0); }
end;

end.