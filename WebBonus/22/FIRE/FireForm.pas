unit FireForm;

interface

uses Windows, Classes, Graphics, Forms,
  Controls, Buttons, Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    BitBtnFire: TBitBtn;
    procedure BitBtnFireMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtnFireMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtnFireClick(Sender: TObject);
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
  MmSystem;

procedure TForm1.BitBtnFireMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  // load firing cannon bitmap
  if Button = mbLeft then
    BitBtnFire.Glyph.LoadFromFile ('fire2.bmp');
end;

procedure TForm1.BitBtnFireMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  // load default cannon bitmap
  if Button = mbLeft then
    BitBtnFire.Glyph.LoadFromFile ('fire.bmp');
end;

procedure TForm1.BitBtnFireClick(Sender: TObject);
begin
  PlaySound ('Boom.wav', 0, snd_Async);
  MessageDlg ('Boom!', mtWarning, [mbOk], 0);
end;

end.
