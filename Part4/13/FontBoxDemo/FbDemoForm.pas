unit FbDemoForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, MdFontbox;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    MdFontCombo1: TMdFontCombo;
    procedure FormCreate(Sender: TObject);
    procedure MdFontCombo1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  // select the item corresponding to the current font
  MdFontCombo1.ItemIndex :=
    MdFontCombo1.Items.IndexOf (Memo1.Font.Name);
end;

procedure TForm1.MdFontCombo1Change(Sender: TObject);
begin
  // activate the new selection
  Memo1.Font.Name := MdFontCombo1.Text;
end;

end.

   