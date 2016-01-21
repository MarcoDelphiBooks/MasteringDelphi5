unit MonForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBSQLMonitor, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    IBSQLMonitor1: TIBSQLMonitor;
    RichEdit1: TRichEdit;
    procedure IBSQLMonitor1SQL(EventText: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.IBSQLMonitor1SQL(EventText: String);
begin
  if Assigned (RichEdit1) then
    RichEdit1.Lines.Add (TimeToStr (Now) + ': ' + EventText);
end;

end.
