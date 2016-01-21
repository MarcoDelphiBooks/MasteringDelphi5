unit Unit2;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Menus;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ComboBox1: TComboBox;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    PrintSetup1: TMenuItem;
    Print1: TMenuItem;
    N2: TMenuItem;
    SaveAs1: TMenuItem;
    Save1: TMenuItem;
    Open1: TMenuItem;
    New1: TMenuItem;
    Edit2: TMenuItem;
    Object1: TMenuItem;
    Links1: TMenuItem;
    N3: TMenuItem;
    GoTo1: TMenuItem;
    Replace1: TMenuItem;
    Find1: TMenuItem;
    N4: TMenuItem;
    PasteSpecial1: TMenuItem;
    Paste1: TMenuItem;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    N5: TMenuItem;
    Repeatcommand1: TMenuItem;
    Undo1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    HowtoUseHelp1: TMenuItem;
    Tutorial1: TMenuItem;
    SearchforHelpOn1: TMenuItem;
    Keyboard1: TMenuItem;
    Procedures1: TMenuItem;
    Commands1: TMenuItem;
    Index1: TMenuItem;
    Contents1: TMenuItem;
    PopupMenu1: TPopupMenu;
    About2: TMenuItem;
    HowtoUseHelp2: TMenuItem;
    Tutorial2: TMenuItem;
    SearchforHelpOn2: TMenuItem;
    Keyboard2: TMenuItem;
    Procedures2: TMenuItem;
    Commands2: TMenuItem;
    Index2: TMenuItem;
    Contents2: TMenuItem;
    ListBox1: TListBox;
    procedure FormClose(Sender: TObject;
      var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  Form2: TForm2;}

implementation

{$R *.DFM}

procedure TForm2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
