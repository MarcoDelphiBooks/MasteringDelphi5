program Search;

uses
  Forms,
  SearchF in 'SearchF.pas' {SearchForm};

{$R *.RES}

begin
  Application.CreateForm(TSearchForm, SearchForm);
  Application.Run;
end.
