program ToDoFile;

uses
  Forms,
  ToDoForm in 'ToDoForm.pas' {ToDoFileForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TToDoFileForm, ToDoFileForm);
  Application.Run;
end.
