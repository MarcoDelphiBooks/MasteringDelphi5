unit AnimF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Spin;

type
  TForm1 = class(TForm)
    Animate1: TAnimate;
    Panel1: TPanel;
    ListBox1: TListBox;
    OpenDialog1: TOpenDialog;
    BtnStart: TButton;
    BtnStop: TButton;
    BtnOnce: TButton;
    BtnTrice: TButton;
    BtnFragment: TButton;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtnGoto: TButton;
    SpinEdit3: TSpinEdit;
    BtnReverse: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    LblFrames: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure BtnStartClick(Sender: TObject);
    procedure BtnStopClick(Sender: TObject);
    procedure BtnOnceClick(Sender: TObject);
    procedure BtnTriceClick(Sender: TObject);
    procedure BtnFragmentClick(Sender: TObject);
    procedure BtnGotoClick(Sender: TObject);
    procedure BtnReverseClick(Sender: TObject);
    procedure Animate1Open(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ListBox1.ItemIndex := 1;
  LblFrames.Caption := 'Frames ' +
    IntToStr (Animate1.FrameCount);
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  Animate1.CommonAVI := TCommonAVI (ListBox1.ItemIndex);
  if (ListBox1.ItemIndex = 0) and
      OpenDialog1.Execute then
    Animate1.FileName := OpenDialog1.FileName
end;

procedure TForm1.BtnStartClick(Sender: TObject);
begin
  Animate1.Active := True;
end;

procedure TForm1.BtnStopClick(Sender: TObject);
begin
  Animate1.Stop;
end;

procedure TForm1.BtnOnceClick(Sender: TObject);
begin
  Animate1.Play (0, Animate1.FrameCount, 1);
end;

procedure TForm1.BtnTriceClick(Sender: TObject);
begin
  Animate1.Play (0, Animate1.FrameCount, 3);
end;

procedure TForm1.BtnFragmentClick(Sender: TObject);
begin
  Animate1.Play (SpinEdit1.Value,
    SpinEdit2.Value, -1);
end;

procedure TForm1.BtnGotoClick(Sender: TObject);
begin
  Animate1.Seek (SpinEdit3.Value);
end;

procedure TForm1.BtnReverseClick(Sender: TObject);
var
  Init: TDateTime;
  I: Integer;
begin
  for I := Animate1.FrameCount downto 1 do
  begin
    Animate1.Seek (I);
    // wait 50 milliseconds
    Init := Now;
    while Now < Init + EncodeTime (0, 0, 0, 50) do
      Application.ProcessMessages;
  end;
end;

procedure TForm1.Animate1Open(Sender: TObject);
begin
  LblFrames.Caption := 'Frames ' +
    IntToStr (Animate1.FrameCount);
end;

end.
