unit MultForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, MultAnim;

type
  TFormAnimMi = class(TForm)
    Memo1: TMemo;
    BtnKindI: TButton;
    BtnFlyI: TButton;
    BtnSwimI: TButton;
    BtnWalkI: TButton;
    BtnMammalsI: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnKindIClick(Sender: TObject);
    procedure BtnFlyIClick(Sender: TObject);
    procedure BtnSwimIClick(Sender: TObject);
    procedure BtnWalkIClick(Sender: TObject);
    procedure BtnMammalsIClick(Sender: TObject);
  private
    AnimIntf: array [1..5] of IAnimal;
  end;

var
  FormAnimMi: TFormAnimMi;

implementation

{$R *.DFM}

procedure TFormAnimMi.FormCreate(Sender: TObject);
begin
  AnimIntf[1] := TEagle.Create;
  AnimIntf[2] := TPenguin.Create;
  AnimIntf[3] := TDuck.Create;
  AnimIntf[4] := TBat.Create;
  AnimIntf[5] := TMonkey.Create;
end;

procedure TFormAnimMi.BtnKindIClick(Sender: TObject);
var
  I: Integer;
begin
  Memo1.Lines.Add ('Kinds:');
  for I := 1 to 5 do
    Memo1.Lines.Add (AnimIntf[I].Kind);
  Memo1.Lines.Add ('');
end;

procedure TFormAnimMi.BtnFlyIClick(Sender: TObject);
var
  I: Integer;
  Fly1: ICanFly;
begin
  Memo1.Lines.Add ('Fly:');
  for I := 1 to 5 do
  begin
    AnimIntf[i].QueryInterface (ICanFly, Fly1);
    if Assigned (Fly1) then
      Memo1.Lines.Add (Fly1.Fly);
  end;
  Memo1.Lines.Add ('');
end;

procedure TFormAnimMi.BtnSwimIClick(Sender: TObject);
var
  I: Integer;
  Swim1: ICanSwim;
begin
  Memo1.Lines.Add ('Swim:');
  for I := 1 to 5 do
    if AnimIntf[i].QueryInterface (
        ICanSwim, Swim1) <> E_NoInterface then
      Memo1.Lines.Add (Swim1.Swim);
  Memo1.Lines.Add ('');

end;

procedure TFormAnimMi.BtnWalkIClick(Sender: TObject);
var
  I: Integer;
  Walker1: ICanWalk;
begin
  Memo1.Lines.Add ('Walk:');
  for I := 1 to 5 do
  try
    Walker1 := AnimIntf[i] as ICanWalk;
    Memo1.Lines.Add (Walker1.Walk);
  except
  end;
  Memo1.Lines.Add ('');
end;

procedure TFormAnimMi.BtnMammalsIClick(Sender: TObject);
var
  I: Integer;
  Mam1: IMammal;
begin
  Memo1.Lines.Add ('Mammals:');
  for I := 1 to 5 do
  begin
    AnimIntf[i].QueryInterface (IMammal, Mam1);
    if Assigned (Mam1) then
      Memo1.Lines.Add (Mam1.Kind);
  end;
  Memo1.Lines.Add ('');
end;

end.
