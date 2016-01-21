program ChartDb;

uses
  Forms,
  ChartDbF in 'ChartDbF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
