unit Dates;

interface

type
  TDate = class
  private
    fDate: TDateTime;
    function GetYear: Integer;
  public
    constructor Create; overload;
    constructor Create (y, m, d: Integer); overload;
    procedure SetValue (y, m, d: Integer); overload;
    procedure SetValue (NewDate: TDateTime); overload;
    function LeapYear: Boolean;
    procedure Increase (NumberOfDays: Integer = 1);
    procedure Decrease (NumberOfDays: Integer = 1);
    function GetText: string;
  end;

implementation

uses
  SysUtils;

procedure TDate.SetValue (y, m, d: Integer);
begin
  fDate := EncodeDate (y, m, d);
end;

function TDate.LeapYear: Boolean;
begin
  // compute leap years, considering "exceptions"
  if (GetYear mod 4 <> 0) then
    LeapYear := False
  else if (GetYear mod 100 <> 0) then
    LeapYear := True
  else if (GetYear mod 400 <> 0) then
    LeapYear := False
  else
    LeapYear := True;
end;

procedure TDate.Increase (NumberOfDays: Integer = 1);
begin
  fDate := fDate + NumberOfDays;
end;

function TDate.GetText: string;
begin
  GetText := DateToStr (fDate);
end;

procedure TDate.Decrease (NumberOfDays: Integer = 1);
begin
  fDate := fDate - NumberOfDays;
end;

constructor TDate.Create (y, m, d: Integer);
begin
  fDate := EncodeDate (y, m, d);
end;

constructor TDate.Create;
begin
  fDate := Date;
end;

function TDate.GetYear: Integer;
var
  y, m, d: Word;
begin
  DecodeDate (fDate, y, m, d);
  Result := y;
end;

procedure TDate.SetValue(NewDate: TDateTime);
begin
  fDate := NewDate;
end;

end.

