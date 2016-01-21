unit ImageF;

interface

uses Windows, Classes, Graphics, Forms, Controls, Menus,
  Dialogs, StdCtrls, ExtCtrls;

type
  TViewerForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    AboutImageViewer1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Options1: TMenuItem;
    Stretch1: TMenuItem;
    Image1: TImage;
    Center1: TMenuItem;
    procedure Open1Click(Sender: TObject);
    procedure Stretch1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure AboutImageViewer1Click(Sender: TObject);
    procedure Center1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewerForm: TViewerForm;

implementation
              
{$R *.DFM}

procedure TViewerForm.Open1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile (OpenDialog1.FileName);
    Caption := 'Image Viewer - ' + OpenDialog1.FileName;
  end;
end;

procedure TViewerForm.Stretch1Click(Sender: TObject);
begin
  Image1.Stretch := not Image1.Stretch;
  Stretch1.Checked := Image1.Stretch;
end;

procedure TViewerForm.Center1Click(Sender: TObject);
begin
  Image1.Center := not Image1.Center;
  Center1.Checked := Image1.Center;
end;

procedure TViewerForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TViewerForm.AboutImageViewer1Click(Sender: TObject);
begin
  MessageDlg ('Image Viewer is an example'
    + #13'of the book "Mastering Delphi"'
    + #13'written by Marco Cantù',
    mtInformation, [mbOk], 0);
end;

end.

