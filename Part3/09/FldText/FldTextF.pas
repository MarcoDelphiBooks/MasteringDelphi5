unit FldTextF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, ComCtrls;

type
  TDbaForm = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBCheckBox1: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBListBox1: TDBListBox;
    Table1LastName: TStringField;
    Table1FirstName: TStringField;
    Table1Department: TSmallintField;
    Table1Branch: TStringField;
    Table1Senior: TBooleanField;
    Table1HireDate: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure Table1DepartmentGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Table1DepartmentSetText(Sender: TField; const Text: String);
  private
    { Private declarations }
  end;

var
  DbaForm: TDbaForm;

implementation

{$R *.DFM}

procedure TDbaForm.FormCreate(Sender: TObject);
begin
  if not Table1.Exists then
  begin
    Table1.CreateTable;
    ShowMessage ('You can add data to this table'#13 +
      'by using the DbAware example of Chapter 11');
  end;
  Table1.Open;
end;

procedure TDbaForm.Table1DepartmentGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  case Sender.AsInteger of
    1: Text := 'Sales';
    2: Text := 'Accounting';
    3: Text := 'Production';
    4: Text := 'Management';
  else
    Text := '[Error]';
  end;
end;

procedure TDbaForm.Table1DepartmentSetText(Sender: TField;
  const Text: String);
begin
  if Text = 'Sales' then
    Sender.Value := 1
  else if Text = 'Accounting' then
    Sender.Value := 2
  else if Text = 'Production' then
    Sender.Value := 3
  else if Text = 'Management' then
    Sender.Value := 4
  else
    raise Exception.Create ('Error in Department field conversion');
end;

end.
 