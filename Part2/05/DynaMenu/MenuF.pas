unit MenuF;

interface

uses
  SysUtils, Windows, Classes, Graphics, Forms, Controls,
  StdCtrls, Menus, Dialogs, ExtCtrls;

type
  TFormColorText = class(TForm)
    Label1: TLabel;
    ColorDialog1: TColorDialog;
    MainMenu1: TMainMenu;
    FontDialog1: TFontDialog;
    Options1: TMenuItem;
    Font1: TMenuItem;
    BackColor1: TMenuItem;
    N1: TMenuItem;
    Left1: TMenuItem;
    Center1: TMenuItem;
    Right1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N3: TMenuItem;
    DisableHelp1: TMenuItem;
    procedure About1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure BackColor1Click(Sender: TObject);
    procedure Left1Click(Sender: TObject);
    procedure Center1Click(Sender: TObject);
    procedure Right1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure DisableHelp1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    procedure SizeItemClick(Sender: TObject);
    procedure SizeClick(Sender: TObject);
  end;

var
  FormColorText: TFormColorText;

implementation

{$R *.DFM}

procedure TFormColorText.About1Click(Sender: TObject);
begin
  MessageDlg ('DynaMenu creates part of the menu at runtime'#13#13 +
    'from the book "Mastering Delphi 4" by Marco Cantù',
    mtInformation, [mbOk], 0);
end;

procedure TFormColorText.Font1Click(Sender: TObject);
begin
  with FontDialog1 do
  begin
    Font := Label1.Font;
    if Execute then
      Label1.Font := Font;
  end;
end;

procedure TFormColorText.BackColor1Click(Sender: TObject);
begin
  with ColorDialog1 do
  begin
    Color := Label1.Color;
    if Execute then
      Label1.Color := Color;
  end;
end;

procedure TFormColorText.Left1Click(Sender: TObject);
begin
  Label1.Alignment := taLeftJustify;
  Left1.Checked := True;
end;

procedure TFormColorText.Center1Click(Sender: TObject);
begin
  Label1.Alignment := taCenter;
  Center1.Checked := True;
end;

procedure TFormColorText.Right1Click(Sender: TObject);
begin
  Label1.Alignment := taRightJustify;
  Right1.Checked := True;
end;

procedure TFormColorText.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormColorText.DisableHelp1Click(Sender: TObject);
begin
  DisableHelp1.Checked := not DisableHelp1.Checked;
  Help1.Enabled := not Help1.Enabled;
end;

procedure TFormColorText.FormCreate(Sender: TObject);
var
  PullDown, Item: TMenuItem;
  Position, I: Integer;
begin
  // create the new pulldown menu
  PullDown := TMenuItem.Create (Self);
  PullDown.AutoHotkeys := maManual;
  PullDown.Caption := 'Size';
  PullDown.OnClick := SizeClick;
  // compute the position and add it
  Position := MainMenu1.Items.IndexOf (Options1);
  MainMenu1.Items.Insert (Position + 1, PullDown);
  // create menu items for various sizes
  I := 8;
  while I <= 48 do
  begin
    // create the new item
    Item := TMenuItem.Create (Self);
    Item.Caption := IntToStr (I);
    // make it a radio item
    Item.GroupIndex := 1;
    Item.RadioItem := True;
    // handle click and insert
    Item.OnClick := SizeItemClick;
    PullDown.Insert (PullDown.Count, Item);
    I := I + 4;
  end;
  // add extra item at the end
  Item := TMenuItem.Create (Self);
  Item.Caption := '&More...';
  // make it a radio item
  Item.GroupIndex := 1;
  Item.RadioItem := True;
  // handle it by showing the font selection dialog
  Item.OnClick := Font1Click;
  PullDown.Insert (PullDown.Count, Item);
end;

procedure TFormColorText.SizeItemClick(Sender: TObject);
begin
  with Sender as TMenuItem do
    Label1.Font.Size := StrToInt (Caption);
end;

procedure TFormColorText.SizeClick (Sender: TObject);
var
  I: Integer;
  Found: Boolean;
begin
  Found := False;
  with Sender as TMenuItem do
  begin
    // look for a match, skipping the last item
    for I := 0 to Count - 2 do
      if StrToInt (Items [I].Caption) =
        Label1.Font.Size then
      begin
        Items [I].Checked := True;
        Found := True;
        System.Break; // skip the rest of the loop
      end;
    if not Found then
      Items [Count - 1].Checked := True;
  end;
end;

end.

