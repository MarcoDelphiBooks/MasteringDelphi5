unit IconsF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls;
              
type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Image2: TImage;
    Button1: TButton;
    Button2: TButton;
    Bevel1: TBevel;
    OpenDialog1: TOpenDialog;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  with OpenDialog1 do
    if Execute then
    begin
      Application.Icon.LoadFromFile (Filename);
      Image1.Picture.LoadFromFile (Filename);
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  with OpenDialog1 do
    if Execute then
    begin
      Icon.LoadFromFile (Filename);
      Image2.Picture.LoadFromFile (Filename);
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Application.Icon := nil;
  Image1.Picture := nil;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Icon := nil;
  Image2.Picture := nil;
end;

end.
