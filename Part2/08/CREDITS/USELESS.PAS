unit Useless;

interface

uses Windows, Classes, Graphics, Forms, Controls,
     Menus, About;

type
  TUselessForm = class(TForm)
    MainMenu1: TMainMenu;
    Help1: TMenuItem;
    Aboutthisprogram1: TMenuItem;
    procedure Aboutthisprogram1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UselessForm: TUselessForm;

implementation

{$R *.DFM}

procedure TUselessForm.Aboutthisprogram1Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

end.

