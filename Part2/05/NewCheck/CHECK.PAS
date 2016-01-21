unit Check;

interface

uses Windows, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Command1: TMenuItem;
    Toggle1: TMenuItem;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Toggle1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Bmp1, Bmp2: TBitmap;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Bmp1 := TBitmap.Create;
  Bmp2 := TBitmap.Create;
  Bmp1.LoadFromFile ('ok.bmp');
  Bmp2.LoadFromFile ('no.bmp');

  {Windows API call}
  SetMenuItemBitmaps (Command1.Handle, Toggle1.Command, MF_BYCOMMAND,
    Bmp2.Handle, Bmp1.Handle);
end;

procedure TForm1.Toggle1Click(Sender: TObject);
begin
  Toggle1.Checked := not Toggle1.Checked;
  if Toggle1.Checked then
    Label1.Caption := 'ON'
  else
    Label1.Caption := 'OFF';
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Bmp1.Free;
  Bmp2.Free;
end;

end.
