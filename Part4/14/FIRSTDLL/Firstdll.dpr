library Firstdll;

{changing the uses statement, as suggested in
the comments, the size of the DLL changes}

uses
  ShareMem, SysUtils, Dialogs; // larger code
{uses
  Windows; // minimal}

function Triple (C: Char): Integer; stdcall; overload;
begin
  ShowMessage ('Triple (Char) function called');
  Result := Ord (C) * 3;
end;

function Triple (N: Integer): Integer; stdcall; overload;
begin
  ShowMessage ('Triple function called');
{  MessageBox (0, 'Triple function called',
    'First DLL', mb_OK);}
  Result := N * 3;
end;

function Double (N: Integer): Integer; stdcall;
begin
  ShowMessage ('Double function called');
{  MessageBox (0, 'Double function called',
    'First DLL', mb_OK);}
  Result := N * 2;
end;

function DoubleString (S: string; Separator: Char): string; stdcall;
begin
  Result := S + Separator + S;
end;

function DoublePChar (BufferIn, BufferOut: PChar;
  BufferOutLen: Cardinal; Separator: Char): LongBool; stdcall;
var
  SepStr: array [0..1] of Char;
begin
  // if the buffer is large enough
  if BufferOutLen > StrLen (BufferIn) * 2 + 2 then
  begin
    // copy the input buffer in the output buffer
    StrCopy (BufferOut, BufferIn);
    // build the separator string (value plus null terminator)
    SepStr [0] := Separator;
    SepStr [1] := #0;
    // append the separator
    StrCat (BufferOut, SepStr);
    // append the input buffer once more
    StrCat (BufferOut, BufferIn);
    Result := True;
  end
  else
    // not enough space
    Result := False;
end;

exports
  Triple (N: Integer), Double, DoubleString, DoublePChar;

end.
