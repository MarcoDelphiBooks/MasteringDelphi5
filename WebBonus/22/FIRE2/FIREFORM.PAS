unit FireForm;

interface

uses
  Windows, Classes, Graphics, Forms,
  Controls, Buttons, Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    BitBtnFire: TBitBtn;
    CheckBox1: TCheckBox;
    procedure BitBtnFireClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses MMSystem;

{$R *.DFM}

procedure TForm1.BitBtnFireClick(Sender: TObject);
begin
  PlaySound ('Boom.wav', 0, snd_Async);
  MessageDlg ('Boom!', mtWarning, [mbOk], 0);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  BitBtnFire.Enabled := CheckBox1.Checked;
end;

end.
