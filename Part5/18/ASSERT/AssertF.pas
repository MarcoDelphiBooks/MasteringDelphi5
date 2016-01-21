unit AssertF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    BtnInc: TButton;
    BtnDec: TButton;
    ProgressBar1: TProgressBar;
    procedure BtnIncClick(Sender: TObject);
    procedure BtnDecClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Number: Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

// disable assertions
// {$C-}

procedure TForm1.BtnIncClick(Sender: TObject);
begin
  if Number < 100 then
    Inc (Number);
  ProgressBar1.Position := Number;
  // test the condition
  Assert ((Number > 0) and (Number <= 100));
end;

procedure TForm1.BtnDecClick(Sender: TObject);
begin
  if Number > 0 then
    Dec (Number);
  ProgressBar1.Position := Number;
  // test the condition
  Assert ((Number > 0) and (Number <= 100));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Number := 1;
end;

end.
