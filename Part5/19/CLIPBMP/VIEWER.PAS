unit Viewer;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Tabs, Menus, Dialogs, ExtCtrls, Printers, Preview, ComCtrls;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    TabControl1: TTabControl;
    Image1: TImage;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Print1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Edit1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    N2: TMenuItem;
    Delete1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    procedure Open1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Cut1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure File1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  Clipbrd;

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
var
  TabText: string;
begin
  Image1.Visible := True;
  TabText := TabControl1.Tabs [TabControl1.TabIndex];
  if TabText <> 'Clipboard' then
    // load the file indicated in the tab
    Image1.Picture.LoadFromFile (TabText)
  else
    {if the tab is 'Clipboard' and a bitmap
    is available in the clipboard}
    if Clipboard.HasFormat (cf_Bitmap) then
      Image1.Picture.Assign (Clipboard)
    else
    begin
      // else remove the clipboard tab
      TabControl1.Tabs.Delete (TabControl1.TabIndex);
      if TabControl1.Tabs.Count = 0 then
        Image1.Visible := False;
    end;
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
  Paste1.Enabled := Clipboard.HasFormat (cf_Bitmap);
  if TabControl1.Tabs.Count > 0 then
  begin
    Cut1.Enabled := True;
    Copy1.Enabled := True;
    Delete1.Enabled := True;
  end
  else
  begin
    Cut1.Enabled := False;
    Copy1.Enabled := False;
    Delete1.Enabled := False;
  end;
end;

procedure TForm1.Paste1Click(Sender: TObject);
var
  TabNum: Integer;
begin
  {try to locate the page}
  TabNum := TabControl1.Tabs.IndexOf ('Clipboard');
  if TabNum < 0 then
    {create a new page for the clipboard}
    TabNum := TabControl1.Tabs.Add ('Clipboard');
  {go to the clipboard page and force repaint}
  TabControl1.TabIndex := TabNum;
  TabControl1Change (Self);
end;

procedure TForm1.Copy1Click(Sender: TObject);
begin
  Clipboard.Assign (Image1.Picture.Graphic);
end;

procedure TForm1.Cut1Click(Sender: TObject);
begin
  Copy1Click (Self);
  Delete1Click (Self);
end;

procedure TForm1.Delete1Click(Sender: TObject);
begin
  with TabControl1 do
  begin
    if TabIndex >= 0 then
      Tabs.Delete (TabIndex);
    if Tabs.Count = 0 then
      Image1.Visible := False;
  end;
end;

procedure TForm1.File1Click(Sender: TObject);
begin
  Print1.Enabled := TabControl1.Tabs.Count > 0;
end;

end.

