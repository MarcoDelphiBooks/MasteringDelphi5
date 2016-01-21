unit OdsForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    Total: Integer;
  end;

var
  Form1: TForm1;

implementation

uses
  Math;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
  X, Y: extended;
begin
  X := 14.3;
  Y := 1 / GetTickCount;
  X := LogN (1/X, Y);
  Button1.Caption := IntToStr (Round (X));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  I, J: Integer;
begin
  // J := 0; // omit this to get an error
  for I := 1 to 10000 do
    J := J + I;

{$IFDEF DEBUG}
  OutputDebugString (
    PChar ('Button2Click - I=' + IntToStr (I)));
{$ENDIF}

  Button1.Caption := 'J = ' + IntToStr (J);
  Inc (Total, J);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  s1, s2: string;
begin
  s1 := Caption;
  s2 := s1;
  s2 [3] := 'X';
  Caption := s2;

  {$IFDEF DEBUG}
    OutputDebugString (
      PChar (s2));
  {$ENDIF}
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Total := 0;
end;

end.
