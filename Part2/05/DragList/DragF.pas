unit DragF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, CheckLst, ExtCtrls;

type
  TDragForm = class(TForm)
    ListBox1: TListBox;
    CheckListBox1: TCheckListBox;
    Label1: TLabel;
    Edit1: TEdit;
    procedure ListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure CheckListBox1DragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure Edit1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    function AddNotDup (List: TCustomListBox; Text: string): Boolean;
  end;

var
  DragForm: TDragForm;

implementation

{$R *.DFM}

procedure TDragForm.ListDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := True;
  // if the source is the edit and the items
  // is already in the destiantion list, reject it
  if (Source = Edit1) and
    ((Sender as TCustomListBox).Items.IndexOf (Edit1.Text) >= 0) then
    Accept := False;
end;

procedure TDragForm.ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
  I: Integer;
begin
  if Source = Edit1 then
    // copy the text of the edit box
    ListBox1.Items.Add (Edit1.Text)
  else if Source = CheckListBox1 then
  begin
    // copy all the selected items (unless duplicate)
    // and delete them (using reverse order!)
    for I := CheckListBox1.Items.Count - 1 downto 0 do
      if CheckListBox1.Checked [I] then
      begin
        if AddNotDup (ListBox1, CheckListBox1.Items [I]) then
          CheckListBox1.Items.Delete (I);
      end;
  end;
end;

procedure TDragForm.CheckListBox1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  nItem: Integer;
begin
  if Source = Edit1 then
    // copy the text of the edit box
    CheckListBox1.Items.Add (Edit1.Text)
  else if Source = ListBox1 then
  begin
    // copy if not duplicate
    nItem := ListBox1.ItemIndex;
    if AddNotDup (CheckListBox1, ListBox1.Items [nItem]) then
      // remove source item
      ListBox1.Items.Delete (nItem);
  end;
end;

procedure TDragForm.Edit1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Edit1.BeginDrag (False, 10);
end;

function TDragForm.AddNotDup (List: TCustomListBox; Text: string): Boolean;
begin
   // return if the string was not already in the list
  Result := List.Items.IndexOf (Text) < 0;
  if Result then
    List.Items.Add (Text);
end;

end.
