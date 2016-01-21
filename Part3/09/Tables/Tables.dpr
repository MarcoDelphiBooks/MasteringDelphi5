program Tables;

uses
  Forms,
  TablesF in 'TablesF.pas' {MainForm},
  FieldsF in 'FieldsF.pas' {FieldsForm},
  DbgridF in 'Dbgridf.pas' {GridForm};

{$R *.RES}

begin
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFieldsForm, FieldsForm);
  Application.CreateForm(TGridForm, GridForm);
  Application.Run;
end.
