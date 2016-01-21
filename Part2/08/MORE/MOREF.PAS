unit MoreF;

interface

uses
  Windows, Classes, Graphics, Forms,
  Controls, ConfDial, StdCtrls;

type
  TForm1 = class(TForm)
    ConfigureButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure ConfigureButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ConfigureButtonClick(Sender: TObject);
begin
  ConfigureDialog.CheckBox1.Checked := Label1.Visible;
  ConfigureDialog.CheckBox2.Checked := Label2.Visible;
  if (fsItalic in Label1.Font.Style) then
    ConfigureDialog.ItalicCheckBox.Checked := True
  else
    ConfigureDialog.ItalicCheckBox.Checked := False;
  if (fsBold in Label1.Font.Style) then
    ConfigureDialog.BoldCheckBox.Checked := True
  else
    ConfigureDialog.BoldCheckBox.Checked := False;
  if (ConfigureDialog.ShowModal = mrOk) then
    begin
      Label1.Visible := ConfigureDialog.CheckBox1.Checked;
      Label2.Visible := ConfigureDialog.CheckBox2.Checked;

      {compute the style of the first label}
      if ConfigureDialog.BoldCheckBox.Checked then
        Label1.Font.Style := [fsBold]
      else
        Label1.Font.Style := [];
      if ConfigureDialog.ItalicCheckBox.Checked then
        Label1.Font.Style := Label1.Font.Style + [fsItalic];

      {copy the style to the other label}
      Label2.Font.Style := Label1.Font.Style;
    end;
end;

end.

