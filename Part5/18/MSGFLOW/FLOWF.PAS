unit FlowF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Panel1: TPanel;
    SpyButton: TSpeedButton;
    SkipButton: TSpeedButton;
    ClearButton: TSpeedButton;
    ShowButton: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpyButtonClick(Sender: TObject);
    procedure SkipButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure ShowButtonClick(Sender: TObject);
  private
    Skipping, Spying: Boolean;
    LastMessage: TMsg;
  public
    procedure HandleMessage (var Msg: TMsg;
      var Handled: Boolean);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  Mlist,      {define the string list of messages}
  Unit2;      {define the secondary form, TForm2}

procedure TForm1.FormCreate(Sender: TObject);
begin
  {set the OnMessage handler}
  Application.OnMessage := HandleMessage;
  Skipping := False;
  Spying := False;
end;

procedure TForm1.HandleMessage (var Msg: TMsg;
  var Handled: Boolean);
var
  Line, Caption: string;
begin
  // initialize long strings
  SetLength (Line, 200);
  SetLength (Caption, 50);

  {output the new message only if the spying flag is true,
  the message is not for the list box. If the skipping flag
  is true, ignore a message equal to the previous one}
  if Spying and (Msg.Hwnd <> Listbox1.Handle) and not
    (Skipping and (LastMessage.Message = Msg.Message) and
    (LastMessage.Hwnd = Msg.Hwnd)) then
  begin
    // output the hex value of the handle
    Line := 'Hwnd:' + IntToHex (Msg.Hwnd, 4);

    {get the caption from the handle, using an API function}
    GetWindowText (Msg.Hwnd, PChar (Caption), Length (Caption));
    Caption := PChar (Caption); // re-cast
    if Caption = '' then
      Caption := 'Unknown';

    // format the caption in 15 characters
    AppendStr (Line, Format (' ( %15s ) ', [Caption]));

    {access the MsgList object, using the function
    exported by the MList unit}
    AppendStr (Line, GetMessageName (Msg.Message));

    {add the hexadecimal output of the two message parameters}
    AppendStr (Line, 'Params: ' + IntToHex (Msg.wParam, 8) +
      ', ' + IntToHex (Msg.lParam, 8));

    {add the line, selecting it}
    ListBox1.ItemIndex := ListBox1.Items.Add (Line);

    {store the message, to compare it with the next one}
    LastMessage := Msg;
  end;
end;

procedure TForm1.SpyButtonClick(Sender: TObject);
begin
  Spying := SpyButton.Down;
end;

procedure TForm1.SkipButtonClick(Sender: TObject);
begin
  Skipping := SkipButton.Down;
end;

procedure TForm1.ClearButtonClick(Sender: TObject);
begin
  ListBox1.Clear;
end;

procedure TForm1.ShowButtonClick(Sender: TObject);
var
  SecondForm: TForm2;
begin
  {create and show the second form}
  SecondForm := TForm2.Create (Application);
  SecondForm.Show;
end;

end.
