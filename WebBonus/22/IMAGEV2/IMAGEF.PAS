unit ImageF;

interface

uses Windows, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, ExtCtrls;

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
    procedure Open1Click(Sender: TObject);
    procedure Stretch1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure AboutImageViewer1Click(Sender: TObject);
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
    Image1.Picture.LoadFromFile (OpenDialog1.FileName);
end;

procedure TViewerForm.Stretch1Click(Sender: TObject);
begin
  Image1.Stretch := not Image1.Stretch;
  Stretch1.Checked := Image1.Stretch;
  if Image1.Stretch then
    Image1.Align := alClient
  else
  begin
    Image1.Align := alNone;
    Image1.Height := Image1.Picture.Height;
    Image1.Width := Image1.Picture.Width;
  end;
end;

procedure TViewerForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TViewerForm.AboutImageViewer1Click(Sender: TObject);
begin
  MessageDlg ('Image Viewer, written by Marco Cantù',
    mtInformation, [mbOk], 0);
end;

end.

