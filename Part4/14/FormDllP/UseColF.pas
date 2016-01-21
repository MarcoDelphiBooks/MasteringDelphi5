unit UseColF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    BtnChange: TButton;
    BtnSelect: TButton;
    BtnApp: TButton;
    procedure BtnChangeClick(Sender: TObject);
    procedure BtnSelectClick(Sender: TObject);
    procedure BtnAppClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

function GetColor (Col: LongInt): LongInt;
  stdcall; external 'FormDLLP.DLL';
procedure ShowColor (Col: LongInt);
  stdcall; external 'FormDLLP.DLL';

procedure TForm1.BtnChangeClick(Sender: TObject);
var
  Col: LongInt;
begin
  Col := ColorToRGB (Color);
  Color := GetColor (Col)
end;

procedure TForm1.BtnSelectClick(Sender: TObject);
var
  Col: LongInt;
begin
  Col := ColorToRGB (Color);
  ShowColor (Col);
end;

procedure TForm1.BtnAppClick(Sender: TObject);
begin
  ShowMessage ('Application Handle: ' +
    IntToStr (Application.Handle));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // reload the icon of the application
  Application.Icon.Handle :=
    LoadIcon (HInstance, 'MAINICON');
end;

end.
