unit regform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Registry;

type
  TForm1 = class(TForm)
    ListSub: TListBox;
    ListValues: TListBox;
    ComboKey: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboLast: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListSubClick(Sender: TObject);
    procedure ComboKeyChange(Sender: TObject);
    procedure ComboLastChange(Sender: TObject);
  private
    Reg: TRegistry;
  public
    procedure UpdateAll;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Reg := TRegistry.Create;
  Reg.OpenKey ('\', False);
  UpdateAll;
  // select the current root
  ComboKey.ItemIndex := 1;
  ComboLast.Items.Add('\'); ///////
  ComboLast.ItemIndex := 0;
end;

procedure TForm1.UpdateAll;
begin
  Caption := Reg.CurrentPath;
  if Caption = '' then
    Caption := '[Root]';
  if Reg.HasSubKeys then
    Reg.GetKeyNames(ListSub.Items)
  else
    ListSub.Clear;
  Reg.GetValueNames(ListValues.Items);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Reg.CloseKey;
  Reg.Free;
end;

procedure TForm1.ListSubClick(Sender: TObject);
var
  NewKey, Path: string;
  nItem: Integer;
begin
  // get the selection
  NewKey := ListSub.Items [ListSub.ItemIndex];
  Reg.OpenKey (NewKey, False);
  // save the current path (eventually adding a \)
  // only if the it is not already listed
  Path := Reg.CurrentPath;
  if Path < '\' then
    Path := '\' + Path;
  nItem := ComboLast.Items.IndexOf (Path);
  if nItem < 0 then
  begin
    ComboLast.Items.Insert (0, Path);
    ComboLast.ItemIndex := 0;
  end
  else
    ComboLast.ItemIndex := nItem;
  UpdateAll;
end;

procedure TForm1.ComboKeyChange(Sender: TObject);
begin
  case ComboKey.ItemIndex of
    0: Reg.RootKey := HKEY_CLASSES_ROOT;
    1: Reg.RootKey := HKEY_CURRENT_USER;
    2: Reg.RootKey := HKEY_LOCAL_MACHINE;
    3: Reg.RootKey := HKEY_USERS;
    4: Reg.RootKey := HKEY_CURRENT_CONFIG;
    5: Reg.RootKey := HKEY_DYN_DATA;
  end;
  Reg.OpenKey ('\', False);
  UpdateAll;
  ComboLast.Items.Clear;
end;

procedure TForm1.ComboLastChange(Sender: TObject);
begin
  Reg.OpenKey (ComboLast.Text, False);
  UpdateAll;
end;

end.
