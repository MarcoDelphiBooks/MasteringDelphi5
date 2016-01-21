unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls;

type
  TServerForm = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    BtnColor: TButton;
    BtnShow: TButton;
    procedure Edit1Change(Sender: TObject);
    procedure BtnColorClick(Sender: TObject);
    procedure BtnShowClick(Sender: TObject);
  private
    CurrentValue: Integer;
  protected
    procedure SetValue (NewValue: Integer);
  public
    property Value: Integer
      read CurrentValue write SetValue;
    procedure ChangeColor;
  end;

var
  ServerForm: TServerForm;

implementation

{$R *.DFM}

procedure TServerForm.Edit1Change(Sender: TObject);
begin
  CurrentValue := UpDown1.Position;
end;

procedure TServerForm.SetValue (NewValue: Integer);
begin
  if NewValue <> CurrentValue then
  begin
    CurrentValue := NewValue;
    UpDown1.Position := CurrentValue;
  end;
end;

procedure TServerForm.ChangeColor;
begin
  Color := RGB (
    Random (255), Random (255), Random (255));
end;

procedure TServerForm.BtnColorClick(Sender: TObject);
begin
  ChangeColor;
end;

procedure TServerForm.BtnShowClick(Sender: TObject);
begin
  ShowMessage (IntToStr (CurrentValue));
end;

end.
