program ThSynch;

uses
  Forms,
  SyncForm in 'SyncForm.pas' {Form1},
  Mutex in 'Mutex.pas' {Form4},
  Plain in 'Plain.pas' {Form2},
  CritSec in 'CritSec.pas' {Form3},
  TCriSect in 'TCriSect.pas' {Form5};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
