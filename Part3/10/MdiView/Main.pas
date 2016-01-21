unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus;

type
  TFrameForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    NewRecordView1: TMenuItem;
    NewGridView1: TMenuItem;
    Close1: TMenuItem;
    N1: TMenuItem;
    Windows1: TMenuItem;
    Tile1: TMenuItem;
    Cascade1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    procedure NewRecordView1Click(Sender: TObject);
    procedure NewGridView1Click(Sender: TObject);
    procedure Tile1Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrameForm: TFrameForm;

implementation

uses FormView, GridView;

{$R *.DFM}

procedure TFrameForm.NewRecordView1Click(Sender: TObject);
begin
  with TRecordForm.Create (Application) do
    Show;
end;

procedure TFrameForm.NewGridView1Click(Sender: TObject);
begin
  with TGridForm.Create (Application) do
    Show;
end;

procedure TFrameForm.Tile1Click(Sender: TObject);
begin
  Tile;
end;

procedure TFrameForm.Cascade1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TFrameForm.About1Click(Sender: TObject);
begin
  ShowMessage ('MDI datamodule based demo'#13 +
    'from the book "Mastering Delphi 4"');
end;

procedure TFrameForm.Close1Click(Sender: TObject);
begin
  Close;
end;

end.
