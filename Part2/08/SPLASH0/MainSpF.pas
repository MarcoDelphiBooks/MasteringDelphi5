unit MainSpF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    Help1: TMenuItem;
    About1: TMenuItem;
    File1: TMenuItem;
    Exit1: TMenuItem;
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses AboutF;

{$R *.DFM}

procedure TForm1.About1Click(Sender: TObject);
begin
  if not Assigned (AboutBox) then
    AboutBox := TAboutBox.Create (Application);
  AboutBox.ShowModal;
end;

{function local to the unit}
function IsPrime (N: Integer): Boolean;
var
  Test: Integer;
begin
  IsPrime := True;
  for Test := 2 to N - 1 do
    if (N mod Test) = 0 then
    begin
      IsPrime := False;
      break; {jump out of the for loop}
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to 20000 do
    if IsPrime (I) then
      ListBox1.Items.Add (IntToStr (I)); 
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.
