library IsapiDem;

uses
  SysUtils, Classes, Windows, Isapi2;

function GetExtensionVersion (
  var Ver: THSE_VERSION_INFO): BOOL; stdcall;
begin
  with Ver do
  begin
    dwExtensionVersion := $00010000;
    StrCopy (lpszExtensionDesc, 'First DDH Isapi Demo');
  end;
  Result := True;
end;

function HttpExtensionProc (
  var ECB: TEXTENSION_CONTROL_BLOCK): DWORD; stdcall;
var
  OutStr: string;
  StrLength: Cardinal;
begin
  with ECB do
  begin
    OutStr :=
      '<HTML><HEAD><TITLE>First Isapi Demo</TITLE></HEAD><BODY>' +
      '<H2><CENTER>First Isapi Demo</CENTER></H2>' +
      'Hello Mastering Delphi Readers...<p><hr>' +
      '<b>Activated by ' + PChar (@lpszPathInfo[1]) + '</b><p>' +
      '<i>From IsapiDLL on ' + DateToStr (Now) +
      ' at ' + TimeToStr (Now) + '</i>' +
      '</body></html>';
    StrLength := Length (OutStr);
    WriteClient(ConnID, PChar (OutStr), StrLength, 0);
  end;
  Result := HSE_STATUS_SUCCESS;
end;

exports
  GetExtensionVersion,
  HttpExtensionProc;

end.

