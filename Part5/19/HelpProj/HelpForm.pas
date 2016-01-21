unit HelpForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, StdActns, ActnList;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Close1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    Index1: TMenuItem;
    N3: TMenuItem;
    About1: TMenuItem;
    Index2: TMenuItem;
    ActionList1: TActionList;
    HelpContents1: THelpContents;
    HelpOnHelp1: THelpOnHelp;
    HelpTopicSearch1: THelpTopicSearch;
    HelponHelp2: TMenuItem;
    Action1: TAction;
    procedure Index2Click(Sender: TObject);
    procedure Index1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Index2Click(Sender: TObject);
begin
  Application.HelpContext (0);
end;

procedure TForm1.Index1Click(Sender: TObject);
begin
  Application.HelpJump ('Index');
end;

end.
