unit Minesf;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, Forms, Dialogs, Grids, StdCtrls, Menus, ExtCtrls;

{constant values used by the program; if you change the
number of items, you should resize the grid accordingly}
const NItems = 10;      {items on each side of the 'square' grid}
const NMines = 12;      {number of mines in the grid}

{character codes use to describe the contents
of the cells of the grid:
  'M': Mine
  'K': Known mine
  'W': Wrong mine
  '0'..'8': Number of mines}

type
  TForm1 = class(TForm)
    DrawGrid1: TDrawGrid;
    Panel1: TPanel;
    LabelShots: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    NewGame1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure DrawGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DrawGrid1DrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure NewGame1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    Playing: Boolean;                {still playing or terminated}
    Bmp: TBitmap;                    {temporary bitmap}
    LastBmp: Char;                   {code of the temporary bitmap}
    Shots,                           {numer of shots}
    MinesFound: Integer;             {mines really found}

    {boolean array indicating visible elements}
    Display: array [0 .. NItems - 1, 0 .. NItems -1] of Boolean;

    {map with the codes for the cells (see above for the codes)}
    Map: array [0 .. NItems - 1, 0 .. NItems -1] of Char;

    {compute the number of mines surrounding the given cell}
    procedure ComputeMines (X, Y: Integer);

    {display items near a visible zero-cell, using a recursive call}
    procedure FloodZeros (X, Y: Integer);

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  MMSystem;

procedure TForm1.FormCreate(Sender: TObject);
var
  I, J, X, Y, MinesToPlace: Integer;
begin
  // initializations
  Randomize;
  Playing := True;
  Shots := 0;
  MinesFound := 0;
  Bmp := TBitmap.Create;
  LastBmp := ' ';

  // empty the two arrays
  for I := 0 to NItems - 1 do
    for J := 0 to NItems - 1 do
    begin
      Map [I, J] := ' ';
      Display [I, J] := False;
    end;

  // place 'NMines' non-overlapping mines
  MinesToPlace := NMines;
  while MinesToPlace > 0 do
  begin
    X := Random (NItems);
    Y := Random (NItems);
    // if there is not a mine
    if Map [X, Y] <> 'M' then
    begin
      // add a mine
      Map [X, Y] := 'M';
      Dec (MinesToPlace);
    end;
  end;

  {compute the number of surrounding mines in
  every location not having a mine}
  for I := 0 to NItems - 1 do
    for J := 0 to NItems - 1 do
      if not (Map [I, J] = 'M') then
        ComputeMines (I, J);
end;

// compute the number of mines surrounding the given cell
procedure TForm1.ComputeMines (X, Y: Integer);
var
  Col, Row: Integer;
  Total : Char;
begin
  Total := '0';
  // for every contiguos cell...
  for Col := X - 1 to X + 1 do
    for Row := Y -1 to Y + 1 do
      // excluding those out of the borders...
      if (Col >= 0) and (Col < NItems) and
          (Row >= 0) and (Row < NItems) then
        {if there is a mine, hidden or known,
        increase the total surrounding mines}
        if (Map [Col, Row] = 'M') or
            (Map [Col, Row] = 'K') then
          Inc (Total);
  // store the total number of surrounding mines in the map
  Map [X, Y] := Total;
end;

// display items near a visible zero-cell, using a recursive call
procedure TForm1.FloodZeros (X, Y: Integer);
var
  Col, Row: Integer;
  MyRect: TRect;
begin
  // double check that we are on a zero
  if Map [X, Y] = '0' then
    // for every contiguos cell...
    for Col := X - 1 to X + 1 do
      for Row := Y -1 to Y + 1 do
        // excluding out of borders and the item itself...
        if (Col >= 0) and (Col < NItems) and
          (Row >= 0) and (Row < NItems) and
          not ( (Col = X) and (Row = Y) )then
        begin
          {display the element, and if it is a zero, repeat the
          operation; the code seems redundant but the program
          needs to avoid infinite recursion with great care}
          if (Map [Col, Row] = '0') and
              (Display [Col, Row] = False) then
          begin
            {if the cell is still hidden and there is a zero
            display it, then make the flood the zeros near the cell}
            Display [Col, Row] := True;
            FloodZeros (Col, Row);
          end
          else
            // if it is not a zero, display it
            Display [Col, Row] := True;
          // compute the area of the cell, and invalidate it
          MyRect := DrawGrid1.CellRect (Col, Row);
          InvalidateRect (DrawGrid1.Handle, @MyRect, False);
        end
end;

procedure TForm1.DrawGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Col, Row: LongInt;
  MyRect: TRect;
begin
  // get the current column and grid
  DrawGrid1.MouseToCell (X, Y, Col, Row);
  // if game has ended, beep and ignore the action
  if not Playing then
    SysUtils.Beep
  else if Button = mbLeft then
  begin
    // left mouse button click: shot
    Inc (Shots);
    LabelShots.Caption := 'Shots: ' + IntToStr (Shots);

    // if there is a mine, end the game, else display the cell
    if (Map [Col, Row] = 'M') or (Map [Col, Row] = 'K') then
    // mine found...
    begin
      PlaySound ('Boom.wav', 0, snd_async);
      // end the game and redisplay the grid
      Playing := False;
      DrawGrid1.Repaint;
      MessageDlg ('B O O M !'#13#13 +
        'You have found a mine', mtError, [mbOK], 0);
    end
    else // not a mine...
    begin
      // show location
      Display [Col, Row] := True;
      // if the click was on a 0, then show near elements
      if Map [Col, Row] = '0' then
        FloodZeros (Col, Row);
    end;
  end
  else
  begin
    // right mouse button click: mine?
    case Map [Col, Row] of
      {if there is a mine turn code to K, known mine,
      display the cell, increment points}
      'M': begin
        Map [Col, Row] := 'K';
        Display [Col, Row] := True;
        Inc (MinesFound);
        // if all mines have been found, the game ends
        if MinesFound = NMines then
        begin
          MessageDlg ('You have won. Congratulations!',
            mtInformation, [mbOK], 0);
          Playing := False;
          DrawGrid1.Repaint;
        end
      end;
      {if there was a known mine, the 'hidden' mine
      is restored, and the points decremented}
      'K': begin
        Map [Col, Row] := 'M';
        Display [Col, Row] := False;
        Dec (MinesFound);
      end;
      // if there was a number, set W, wrong mine
      '0'..'8': begin
        Map [Col, Row] := 'W';
        Display [Col, Row] := True;
      end;
      {if there was a wrong mine, restore the
      number computing it again}
      'W': begin
        ComputeMines (Col, Row);
        Display [Col, Row] := False;
      end;
    end;
  end;
  // redraw the cell of the grid
  MyRect := DrawGrid1.CellRect (Col, Row);
  InvalidateRect (DrawGrid1.Handle, @MyRect, False);
end;

procedure TForm1.DrawGrid1DrawCell(Sender: TObject;
  Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Code: Char;
begin
  // extract the code and check its value
  Code := Map [Col, Row];

  // if the cell is visible
  if Display [Col, Row] then
  begin
    {if the code corresponds to that of the 'cached' bitmap,
    use it, else load the new bitmap}
    if not (Code = LastBmp) then
    begin
      Bmp.LoadFromResourceName (HInstance, 'M' + Code);
      LastBmp := Code;
    end;
    DrawGrid1.Canvas.Draw (Rect.Left, Rect.Top, Bmp);
  end
  else
  {the cell is not visible: show the default bitmap,
  using the cache mechanism again}
  begin
    if not (LastBmp = 'U') then     // 'U': undefined
    begin
      Bmp.LoadFromResourceName (HInstance, 'UNDEF');
      LastBmp := 'U';
    end;
    DrawGrid1.Canvas.Draw (Rect.Left, Rect.Top, Bmp);
  end;

  {if the game is done, show the mines that were not found
  using the cache again}
  if (not Playing) and (Code = 'M') then
  begin
    if not (Code = LastBmp) then
    begin
      Bmp.LoadFromResourceName (HInstance, 'M' + Code);
      LastBmp := Code;
    end;
    DrawGrid1.Canvas.Draw (Rect.Left, Rect.Top, Bmp);
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Bmp.Free;
end;


procedure TForm1.About1Click(Sender: TObject);
begin
  MessageDlg ('Mastering Delphi Mines',
    mtInformation, [mbOK], 0);
end;

procedure TForm1.NewGame1Click(Sender: TObject);
begin
  // reinitialize and repaint
  FormCreate (Self);
  DrawGrid1.Repaint;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.
