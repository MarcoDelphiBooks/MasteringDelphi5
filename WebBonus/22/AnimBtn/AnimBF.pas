unit AnimBF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Animate1: TAnimate;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  hDiff: Integer;
begin
  Animate1.Parent := Button1;
  hDiff := Button1.Height - Animate1.Height;
  Animate1.SetBounds (hDiff div 2, hDiff div 2,
    Animate1.Width, Animate1.Height);
  Animate1.Active := True;
end;

end.
