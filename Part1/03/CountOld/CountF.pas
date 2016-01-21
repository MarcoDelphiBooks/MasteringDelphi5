unit CountF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonKeyPress(Sender: TObject; var Key: Char);
  private
    ToDestroy: TButton;
  end;

  TCountButton = class (TButton)
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetTotal: Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

var
  TotBtns: Integer = 0;

constructor TCountButton.Create (AOwner: TComponent);
begin
  inherited;
  Inc (TotBtns);
end;

destructor TCountButton.Destroy;
begin
  Dec (TotBtns);
  inherited Destroy;
end;

class function TCountButton.GetTotal: Integer;
begin
  Result := TotBtns;
end;

procedure TForm1.FormMouseDown(
  Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  with TCountButton.Create (Self) do
  begin
    Parent := Self;
    Left := X;
    Top := Y;
    Width := Width + 60;
    Caption := Format ('%d Button at %d, %d',
      [GetTotal, X, Y]);
    // set the event handler
    OnKeyPress := ButtonKeyPress;
    // grab the input focus
    SetFocus;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  // if there is an object to destroy
  if Assigned (ToDestroy) then
  begin
    // moves the input focus to the next control
    SelectNext (ToDestroy, True, true);
    // destroy the object
    ToDestroy.Free;
    // no more objects to destroy
    ToDestroy := nil;
  end;
  // update the form caption
  Caption := Format ('CountObj: %d custom buttons',
    [TCountButton.GetTotal]);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
{  MessageBox (0, PChar (Format (
    'There are %d CountButton objects',
    [TCountButton.GetTotal])),
    'CountObj', mb_OK);}
end;

procedure TForm1.ButtonKeyPress(Sender: TObject;
  var Key: Char);
begin
  // if user pressed backspace
  if Key = #8 then
    // set this as the object to destroy
    ToDestroy := Sender as TButton;
end;

initialization
{  MessageBox (0, PChar (Format (
    'There are %d CountButton objects',
    [TCountButton.GetTotal])),
    'CountObj', mb_OK);}
finalization
{  MessageBox (0, PChar (Format (
    'There are %d CountButton objects',
    [TCountButton.GetTotal])),
    'CountObj', mb_OK);}
end.
