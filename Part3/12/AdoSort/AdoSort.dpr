program AdoSort;

uses
  Forms,
  SortForm in 'SortForm.pas' {FormSort};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormSort, FormSort);
  Application.Run;
end.
