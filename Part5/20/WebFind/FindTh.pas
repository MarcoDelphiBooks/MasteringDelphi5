unit FindTh;

interface

uses
  Classes;

type
  TFindWebThread = class(TThread)
  protected
    strAddr, strStatus: string;
    procedure Execute; override;
    procedure AddToList;
    procedure ShowStatus;
  public
    strUrl: string;
  end;

implementation

{ TFindWebThread }

uses
  WinInet, WebFindF, SysUtils;

procedure TFindWebThread.AddToList;
begin
  Form1.Memo1.Lines.Add (strAddr);
end;

procedure TFindWebThread.Execute;
var
  hHttpSession, hReqUrl: HInternet;
  Buffer: array [0..1023] of Char;
  nRead: Cardinal;
  strRead: string;
  nBegin, nEnd: Integer;
begin
  strRead := '';
  hHttpSession := InternetOpen ('FindWeb',
    INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    hReqUrl := InternetOpenURL (hHttpSession, PChar(StrUrl),
      nil, 0,0,0);
    strStatus := 'Connected to ' + StrUrl;
    Synchronize (ShowStatus);
    try
      // read all the data
      repeat
        InternetReadFile (hReqUrl, @Buffer,
          sizeof (Buffer), nRead);
        strRead := strRead + string (Buffer);
        strStatus := 'Retrieved ' + IntToStr (Length (strRead)) +
          ' of ' + StrUrl;
        Synchronize (ShowStatus);
      until nRead = 0;
    finally
      InternetCloseHandle (hReqUrl);
    end;
  finally
    InternetCloseHandle (hHttpSession);
  end;
  // extract the HTTP headers
  strStatus := 'Extracting headers from ' + StrUrl;
  Synchronize (ShowStatus);
  strRead := LowerCase (strRead);
  repeat
    // find the initial part HTTP reference
    nBegin := Pos ('href="http', strRead);
    if nBegin <> 0 then
    begin
      // get the remaining part of the string
      strRead := Copy (strRead, nBegin + 6,
        Length (strRead) - nBegin - 6);
      // find the end of the HTTP reference
      nEnd := Pos ('>', strRead);
      strAddr := Copy (strRead, 0, nEnd - 2);
      // add the URL if 'yahoo' is not in it
      if (strAddr <> '') and (Pos ('yahoo', strAddr) = 0) then
        Synchronize (AddToList);
    end;
  until nBegin = 0;
  strStatus := 'Done with ' + StrUrl;
  Synchronize (ShowStatus);
end;

procedure TFindWebThread.ShowStatus;
begin
  Form1.StatusBar1.SimpleText := strStatus;
end;

end.
