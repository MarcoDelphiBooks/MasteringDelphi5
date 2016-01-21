unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Paintth, ComCtrls;

type
  TForm1 = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    TrackBar4: TTrackBar;
    procedure CheckBox1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    PT: array [1..4] of TPainterThread;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if (Sender as TCheckbox).Checked then
    PT [(Sender as TCheckbox).Tag].Resume
  else
    // basic version
    // PT [(Sender as TCheckbox).Tag].Suspend;
    // safer version:
    PT [(Sender as TCheckbox).Tag].DelayedSuspend;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  PT [(Sender as TTrackBar).Tag].Priority :=
    TThreadPriority ((Sender as TTrackBar).Position);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PT [1] := TPainterThread.Create (clRed);
  PT [2] := TPainterThread.Create (clBlue);
  PT [3] := TPainterThread.Create (clGreen);
  PT [4] := TPainterThread.Create (ClBlack);
end;

end.
