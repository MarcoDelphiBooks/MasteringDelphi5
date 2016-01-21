unit Viewer;

interface

uses
  SysUtils, Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Tabs, Menus, Dialogs, ExtCtrls, ComCtrls, FileCtrl;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    AboutImageViewer1: TMenuItem;
    TabControl1: TTabControl;
    Image1: TImage;
    procedure Open1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure TabControl1DrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    TabBmp: TBitmap;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

const
  BmpSide = 20;

procedure TForm1.Open1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    TabControl1.Tabs := OpenDialog1.Files;
    TabControl1.TabIndex := 0;
    TabControl1Change (TabControl1);
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

procedure TForm1.TabControl1Change(Sender: TObject);
begin
  Image1.Picture.LoadFromFile (
    TabControl1.Tabs [TabControl1.TabIndex]);
end;

procedure TForm1.TabControl1DrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
var
 TabText: string;
 OutRect: TRect;
begin
  TabText := TabControl1.Tabs [TabIndex];
  OutRect := Rect;
  InflateRect (OutRect, -3, -3);
  OutRect.Left := OutRect.Left + BmpSide + 3;
  DrawText (Control.Canvas.Handle,
    PChar (ExtractFileName (TabText)),
    Length (ExtractFileName (TabText)),
    OutRect, dt_Left or dt_SingleLine or dt_VCenter);
  if TabText <> 'None' then
  begin
    TabBmp.LoadFromFile (TabText);
    OutRect.Left := OutRect.Left - BmpSide - 3;
    OutRect.Right := OutRect.Left + BmpSide;
    Control.Canvas.StretchDraw (OutRect, TabBmp);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TabControl1.TabHeight := BmpSide + 6;
  TabBmp := TBitmap.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  TabBmp.Free;
end;

end.
 