unit Confdial;

interface

uses
  Windows, Classes, Graphics, Forms,
  Controls, Buttons, StdCtrls, ExtCtrls;

type
  TConfigureDialog = class(TForm)
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    btnMore: TBitBtn;
    PanelMore: TPanel;
    ItalicCheckBox: TCheckBox;
    BoldCheckBox: TCheckBox;
    Label1: TLabel;
    procedure btnMoreClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    OldHeight, NewHeight: Integer;
  end;

var
  ConfigureDialog: TConfigureDialog;

implementation

{$R *.DFM}

procedure TConfigureDialog.btnMoreClick(Sender: TObject);
var
  I: Integer;
begin
  PanelMore.Visible := True;
  btnMore.Enabled := False;
  for I := ClientHeight to NewHeight do
  begin
    ClientHeight := I;
    Update;
  end;
end;

procedure TConfigureDialog.FormCreate(Sender: TObject);
begin
  OldHeight := ClientHeight;
  // bottom of the panel
  NewHeight := PanelMore.Top + PanelMore.Height;
end;

procedure TConfigureDialog.FormActivate(Sender: TObject);
begin
  ClientHeight := OldHeight;
  btnMore.Enabled := True;
  PanelMore.Visible := False;
end;

end.

