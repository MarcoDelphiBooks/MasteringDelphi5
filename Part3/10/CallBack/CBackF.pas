unit CBackF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, ComCtrls, StdCtrls, Bde;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    Query1: TQuery;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    ListBox1: TListBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    fAborted: Boolean;
    CallBackObj: TBDECallBack;
    function fnCallBack (CBInfo: Pointer): CBRType;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button2Click(Sender: TObject);
begin
  fAborted := True;
  Button2.Enabled := False;
end;

function TForm1.fnCallBack(CBInfo: Pointer): CBRType;
var
  I: Integer;
begin
  if fAborted then
    Result := cbrAbort
  else
    Result := cbrContinue;

  with PCBPROGRESSDesc(CBInfo)^ do
    // se iPercent e' <0 allora le informazioni si trovano in szMsg
//    if iPercentDone < 0 then
    begin
      //aggiorna la prima label
      // Label1.Caption :=
      ListBox1.Items.Add ('1:' + szMsg);
      // Copy(szMsg, Pos(':', szMsg) + 1, StrLen(szMsg)));
//      ProgressBar1.Position := StrToInt (
//        Copy(szMsg, Pos(':', szMsg) + 1, StrLen(szMsg))) div 10;
//    end
//    else
//    begin
      ProgressBar1.Position := iPercentDone;
      ListBox1.Items.Add ('2: ' + IntToStr (iPercentDone));
    end;

  // slow down a little
  for I := 1 to 1000 do
    Application.ProcessMessages;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Buffer: CBPROGRESSDesc; // ??name
begin
  // activate the DBE first
  Session.Open;
  // create and install the callback object
  CallBackObj := TBDECallBack.Create (Self, nil,
    cbGenProgress {cbCancelQry}, @Buffer, sizeof (Buffer),
    fnCallBack, True);
  try
    Query1.Open;
  finally
    CallBackObj.Free;
  end;
end;

end.
