unit WorldF;

interface

uses Windows, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, SysUtils;

type
  TWorldForm = class(TForm)
    WorldButton: TBitBtn;
    Timer1: TTimer;
    Label1: TLabel;
    procedure WorldButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Count: Integer;
  public
    { Public declarations }
  end;

var
  WorldForm: TWorldForm;

implementation

{$R *.DFM}

procedure TWorldForm.WorldButtonClick(Sender: TObject);
begin
  if Timer1.Enabled then
  begin
    Timer1.Enabled := False;
    WorldButton.Caption := '&Start';
  end
  else
  begin
    Timer1.Enabled := True;
    WorldButton.Caption := '&Stop';
  end;
end;

procedure TWorldForm.Timer1Timer(Sender: TObject);
begin
  Count := (Count mod 16) + 1;
  Label1.Caption := 'Displaying image ' + IntToStr (Count);
  WorldButton.Glyph.LoadFromFile ('w' + IntToStr (Count) + '.bmp');
end;

procedure TWorldForm.FormCreate(Sender: TObject);
begin
  Count := 1;
end;

end.

