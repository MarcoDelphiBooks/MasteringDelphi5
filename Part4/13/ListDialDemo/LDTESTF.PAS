unit LdTestF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Md4ListDial;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Md4ListDialog1: TMd4ListDialog;
    procedure Button1Click(Sender: TObject);
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
  with Md3ListBoxDialog1 do
    if Execute then
      Edit1.Text := SelItem;
end;

end.
