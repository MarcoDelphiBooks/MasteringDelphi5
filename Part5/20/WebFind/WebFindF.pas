unit WebFindF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    BtnFind: TButton;
    Memo1: TMemo;
    EditSearch: TEdit;
    StatusBar1: TStatusBar;
    procedure BtnFindClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  FindTh;

procedure TForm1.BtnFindClick(Sender: TObject);
var
  FindThread: TFindWebThread;
begin
  // create suspended, set initial values, and start
  FindThread := TFindWebThread.Create (True);
  FindThread.FreeOnTerminate := True;
  FindThread.strUrl :=
    'http://search.yahoo.com/bin/search?p=' +
    EditSearch.Text + '&n=100&h=s&b=1';
  FindThread.Resume;
end;

end.
