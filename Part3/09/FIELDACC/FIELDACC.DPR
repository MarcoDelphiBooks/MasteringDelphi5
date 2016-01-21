program FieldAcc;

uses
  Forms,
  FieldF in 'FieldF.pas' {Form2};

{$R *.RES}

begin
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
