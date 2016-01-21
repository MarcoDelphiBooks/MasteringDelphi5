program BmpDraw;

uses
  Forms,
  BmpForm in 'BmpForm.pas' {BitmapForm};

{$R *.RES}

begin
  Application.CreateForm(TBitmapForm, BitmapForm);
  Application.Run;
end.

