unit UseDynaF;

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
    procedure FormDestroy(Sender: TObject);
  private
    hInstDLL: THandle;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

type
  TGetColorProc = function (Col: LongInt): LongInt; stdcall;
  TShowColorProc = procedure (Col: LongInt); stdcall;

procedure TForm1.BtnChangeClick(Sender: TObject);
var
  Col: LongInt;
  GetColorProc: TGetColorProc;
  FPointer: TFarProc;
begin
  FPointer := GetProcAddress (hInstDll, 'GetColor');
  if FPointer = nil then
    raise Exception.Create ('GetColor DLL function not found');
  GetColorProc := TGetColorProc (FPointer);
  // original code
  Col := ColorToRGB (Color);
  Color := GetColorProc (Col);
end;

procedure TForm1.BtnSelectClick(Sender: TObject);
var
  Col: LongInt;
  ShowColorProc: TShowColorProc;
  FPointer: TFarProc;
begin
  FPointer := GetProcAddress (hInstDll, 'ShowColor');
  if FPointer = nil then
    raise Exception.Create ('GetColor DLL function not found');
  ShowColorProc := TShowColorProc (FPointer);
  // original code
  Col := ColorToRGB (Color);
  ShowColorProc (Col);
end;

procedure TForm1.BtnAppClick(Sender: TObject);
begin
  ShowMessage ('Application Handle: ' +
    IntToStr (Application.Handle));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  hInstDll := LoadLibrary ('FormDllD.dll');
  if hInstDll <= 0 then
    raise Exception.Create ('FormDllD library not found');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if hInstDLL > 0 then
    FreeLibrary (hInstDLL);
end;

end.
