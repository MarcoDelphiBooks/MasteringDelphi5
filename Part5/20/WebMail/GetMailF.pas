unit GetMailF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ShellAPi, Psock, NMpop3;

type
  TNewFmForm = class(TForm)
    BtnGetMail: TButton;
    ListBoxMail: TListBox;
    Memo1: TMemo;
    BtnSave: TButton;
    PopMail: TNMPOP3;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    procedure BtnGetMailClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  end;

var
  NewFmForm: TNewFmForm;

implementation

{$R *.DFM}

procedure TNewFmForm.BtnGetMailClick(Sender: TObject);
var
  I, nPos: Integer;
begin
  Screen.Cursor := crHourglass;
  PopMail.Connect;
  try
    Label1.Caption := 'Messages: ' + IntToStr (PopMail.MailCount);
    for I := PopMail.MailCount downto 1 do
    begin
      PopMail.GetMailMessage (I);
      nPos := Pos ('Subscribe', PopMail.MailMessage.Subject);
      if nPos > 0 then
      begin
        ListBoxMail.Items.Add (PopMail.MailMessage.From);
        // remove the mail message
        PopMail.DeleteMailMessage (I);
      end
      else
        // error
        Memo1.Lines.Add (PopMail.MailMessage.Subject);
    end;
  finally
    Screen.Cursor := crDefault;
    PopMail.Disconnect;
  end;
end;

procedure TNewFmForm.BtnSaveClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    ListBoxMail.Items.SaveToFile (SaveDialog1.FileName);
end;

end.
