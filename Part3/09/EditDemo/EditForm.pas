unit EditForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, DB, DBTables;

type
  TNavigForm = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBNavigator1: TDBNavigator;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure DataSource1StateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NavigForm: TNavigForm;

implementation

{$R *.DFM}

procedure TNavigForm.DataSource1StateChange(Sender: TObject);
var
  Title: string;
begin
  case Table1.State of
    dsBrowse: Title := 'Browse';
    dsEdit: Title := 'Edit';
    dsInsert: Title := 'Insert';
  else
    Title := 'Other state';
  end;
  Caption := 'Navigator - ' + Title;
end;

end.
