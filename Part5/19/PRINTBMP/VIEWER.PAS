unit Viewer;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Tabs, Menus, Dialogs, ExtCtrls, Printers, Preview, ComCtrls;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Print1: TMenuItem;
    TabControl1: TTabControl;
    Image1: TImage;
    procedure Open1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Open1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    TabControl1.Tabs := OpenDialog1.Files;
    TabControl1.TabIndex := 0;
    TabControl1Change (TabControl1);
    Print1.Enabled := True;
  end;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  MessageDlg ('Bitmap Viewer with Tabs, from "Mastering Delphi"',
    mtInformation, [mbOk], 0);
end;

procedure TForm1.Print1Click(Sender: TObject);
begin
  {double checks if an image is selected}
  if Image1.Picture.Graphic <> nil then
  begin
    {set a default scale, and start the preview}
    PreviewForm.Scale := 2;
    PreviewForm.SetPage;
    PreviewForm.DrawPreview;
    PreviewForm.ShowModal;
  end;
end;

procedure TForm1.TabControl1Change(Sender: TObject);
begin
  Image1.Picture.LoadFromFile (
    TabControl1.Tabs [TabControl1.TabIndex]);
end;

end.

