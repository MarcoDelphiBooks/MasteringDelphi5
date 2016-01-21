program AdoPrimer;

uses
  Forms,
  FormPrimer in 'FormPrimer.pas' {Form1},
  DmPrimer in 'DmPrimer.pas' {DataModule2: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
