unit CompForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleServer, StdCtrls, TlibdemoLib_TLB;

type
  TForm1 = class(TForm)
    FirstServer1: TFirstServer;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FirstServer1.ChangeColor;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FirstServer1.Value := FirstServer1.Value + 1;
end;

end.
