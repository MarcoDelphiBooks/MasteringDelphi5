unit MdListAct;

interface

uses
  ActnList, Classes, StdCtrls;

type
  TMdListAction = class (TAction)
  public
    function HandlesTarget (Target: TObject): Boolean; override;
    procedure UpdateTarget (Target: TObject); override;
  end;

  TMdListCutAction = class (TMdListAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TMdListCopyAction = class (TMdListAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TMdListPasteAction = class (TMdListAction)
  public
    procedure UpdateTarget (Target: TObject); override;
    procedure ExecuteTarget (Target: TObject); override;
  end;

procedure Register;

implementation

uses
  Windows, Clipbrd;

function TMdListAction.HandlesTarget (Target: TObject): Boolean;
begin
  Result := (Target is TListBox) and
    TListBox(Target).Focused;
end;

procedure TMdListAction.UpdateTarget(Target: TObject);
begin
  Enabled := ((Target as TListBox).Items.Count > 0) and
    ((Target as TListBox).ItemIndex >= 0);
end;

procedure TMdListCopyAction.ExecuteTarget(Target: TObject);
begin
  with Target as TListBox do
    Clipboard.AsText := Items [ItemIndex];
end;

procedure TMdListCutAction.ExecuteTarget(Target: TObject);
begin
  with Target as TListBox do
  begin
    Clipboard.AsText := Items [ItemIndex];
    Items.Delete (ItemIndex);
  end;
end;

procedure TMdListPasteAction.ExecuteTarget(Target: TObject);
begin
  (Target as TListBox).Items.Add (Clipboard.AsText);
end;

procedure TMdListPasteAction.UpdateTarget(Target: TObject);
begin
  Enabled := Clipboard.HasFormat (CF_TEXT);
end;

procedure Register;
begin
  RegisterActions ('ListBox',
    [TMdListCutAction, TMdListCopyAction, TMdListPasteAction],
    nil);
end;

end.
