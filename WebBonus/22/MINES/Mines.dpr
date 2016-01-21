program Mines;

{$R 'Bitmaps.res' 'Bitmaps.rc'}

uses
  Forms,
  MinesF in 'MINESF.PAS' {Form1};

{$R *.RES}   

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
