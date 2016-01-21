program TwoViews;

uses
  Forms,
  GridView in 'GridView.pas' {Form1},
  DataM in 'DataM.pas' {DataModule2},
  FormView in 'FormView.pas' {Form3},
  RangeDb in 'RangeDb.pas' {FormRange};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TFormRange, FormRange);
  Application.Run;
end.
