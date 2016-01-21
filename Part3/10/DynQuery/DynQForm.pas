unit DynQForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Db, DBTables;

type
  TForm1 = class(TForm)
    Query1: TQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Query1.Open;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  Query1.Close;
  Query1.Sql.Clear;
  Query1.Sql.Add ('select * from Country');
  Query1.Open;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  Query1.Close;
  Query1.Sql.Clear;
  Query1.Sql.Add ('select * from Country');
  Query1.Sql.Add ('where Continent = "' +
    (Sender as TRadioButton).Caption + '"');
  Query1.Open;
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
  Query1.Close;
  if (Edit1.Text <> '') then
  begin
    Query1.Sql.Clear;
    Query1.Sql.Add ('select * from Country');
    Query1.Sql.Add ('where ' + Edit1.Text);
  end;
  try
    Query1.Open;
  except
    on EDatabaseError do
      ShowMessage ('Invalid condition:'#13 +
        Edit1.Text);
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  RadioButton4.Enabled := Edit1.Text <> '';
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if RadioButton4.Checked then
      RadioButton4Click (Self)
    else
      RadioButton4.Checked := True;
    Key := #0;
  end;
end;

end.
