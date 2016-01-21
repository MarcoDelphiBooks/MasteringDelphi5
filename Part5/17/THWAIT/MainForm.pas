unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, CheckTh;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    ProgressBar4: TProgressBar;
    ProgressBar5: TProgressBar;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    MainThread: TMultiFind;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
begin
  if Assigned (MainThread) then
    MainThread.Free;
  MainThread := TMultiFind.Create (True);
  MainThread.Progresses [1] := ProgressBar1;
  MainThread.Progresses [2] := ProgressBar2;
  MainThread.Progresses [3] := ProgressBar3;
  MainThread.Progresses [4] := ProgressBar4;
  MainThread.Progresses [5] := ProgressBar5;
  MainThread.Progresses [1].Max := 4;
  for I := 2 to 5 do
    MainThread.Progresses[I].Max := Memo1.Lines.Count;
  for I := 1 to 5 do
    MainThread.Progresses[I].Position := 0;

  MainThread.LookFor := Edit1.Text;
  MainThread.Resume;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Memo1.Lines.LoadFromFile (OpenDialog1.FileName);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if Assigned (MainThread) then
    MainThread.Free;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
  if Length (Edit1.Text) <> 4 then
  begin
    Edit1.SetFocus;
    ShowMessage ('The edit box requires four characters');
  end;
end;

end.
