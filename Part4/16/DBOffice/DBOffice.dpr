program DBOffice;

uses
  Forms,
  OfficeForm in 'OfficeForm.pas' {FormOff};

{$R *.RES}

begin
  Application.CreateForm(TFormOff, FormOff);
  Application.Run;
end.
