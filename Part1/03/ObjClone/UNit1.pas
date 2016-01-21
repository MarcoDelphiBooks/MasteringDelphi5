unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Button2: TButton;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure ClickComp(Sender: TObject);
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
var
  AForm: TForm;
begin
  // clone the 'Self' object
  Application.CreateForm (
    TFormClass(Self.ClassType), AForm);
  // move the form and show it
  AForm.Left := Left  + 50;
  AForm.Top := Top  + 50;
  AForm.Show;
end;

procedure TForm1.ClickComp(Sender: TObject);
var
  ControlText: string;
begin
  with TControlClass (Sender.ClassType).Create (Self) do
  begin
    Parent := (Sender as TControl).Parent;
    Left := (Sender as TControl).Left + 10;
    Top := (Sender as TControl).Top + 10;
    SetLength (ControlText, 50);
    (Sender as TControl).GetTextBuf(
      PChar(ControlText), 50);
    ControlText := PChar(ControlText) + ' *';
    SetTextBuf (PChar (ControlText));
  end;
end;



end.
