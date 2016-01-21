program Mastdet;

uses
  Forms,
  MastdetF in 'MastdetF.pas' {Form2},
  MdData in 'MdData.pas' {DataModule1: TDataModule};

{$R *.RES}

begin
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
