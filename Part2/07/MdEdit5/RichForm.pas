unit RichForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Menus, ActnList, ToolWin, ImgList, ClipBrd,
  RichEdit, AppEvnts;

type
  TFormRichNote = class(TForm)
    RichEdit: TRichEdit;
    FontDialog: TFontDialog;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Saveas1: TMenuItem;
    Exit1: TMenuItem;
    Font1: TMenuItem;
    Bold1: TMenuItem;
    Italic1: TMenuItem;
    Paragraph1: TMenuItem;
    LeftAligned1: TMenuItem;
    Centered1: TMenuItem;
    RightAligned1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    More1: TMenuItem;
    ColorDialog: TColorDialog;
    ActionList: TActionList;
    acCentered: TAction;
    acUndo: TAction;
    acCut: TAction;
    acPaste: TAction;
    acCopy: TAction;
    acBold: TAction;
    acItalic: TAction;
    acRightAligned: TAction;
    acLeftAligned: TAction;
    acSave: TAction;
    Undo1: TMenuItem;
    acFont: TAction;
    acCountChars: TAction;
    Images: TImageList;
    SizeMenu: TPopupMenu;
    Small1: TMenuItem;
    Medium1: TMenuItem;
    Large1: TMenuItem;
    acHintColor: TAction;
    HintColor1: TMenuItem;
    ControlBar: TControlBar;
    ToolBarFile: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton20: TToolButton;
    ToolButton4: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton12: TToolButton;
    ToolButton17: TToolButton;
    ToolBarEdit: TToolBar;
    ToolBarFont: TToolBar;
    ComboFont: TComboBox;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    BarMenu: TPopupMenu;
    ToolBarMenu: TToolBar;
    StatusBar: TStatusBar;
    Timer: TTimer;
    acExit: TAction;
    ApplicationEvents1: TApplicationEvents;
    procedure BoldExecute(Sender: TObject);
    procedure ItalicExecute(Sender: TObject);
    procedure ChangeAlignment(Sender: TObject);
    procedure AboutExecute(Sender: TObject);
    procedure ExitExecute(Sender: TObject);
    procedure OpenExecute(Sender: TObject);
    procedure SaveAsExecute(Sender: TObject);
    procedure BackColorExecute(Sender: TObject);
    procedure FontExecute(Sender: TObject);
    procedure CountCharsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NewExecute(Sender: TObject);
    procedure SaveExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PrintExecute(Sender: TObject);
    procedure acSaveUpdate(Sender: TObject);
    procedure acBoldUpdate(Sender: TObject);
    procedure acItalicUpdate(Sender: TObject);
    procedure RichEditChange(Sender: TObject);
    procedure acCountcharsUpdate(Sender: TObject);
    procedure acCutExecute(Sender: TObject);
    procedure acCutUpdate(Sender: TObject);
    procedure acCopyExecute(Sender: TObject);
    procedure acPasteExecute(Sender: TObject);
    procedure acPasteUpdate(Sender: TObject);
    procedure acUndoExecute(Sender: TObject);
    procedure acUndoUpdate(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure ToolButton17Click(Sender: TObject);
    procedure SetFontSize(Sender: TObject);
    procedure ComboFontClick(Sender: TObject);
    procedure RichEditSelectionChange(Sender: TObject);
    procedure acHintColorExecute(Sender: TObject);
    procedure BarMenuPopup(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ShowHint(Sender: TObject);
  private
    FileName: string;
    Modified: Boolean;
  public
    function SaveChanges: Boolean;
    function Save: Boolean;
    function SaveAs: Boolean;
    procedure BarMenuClick (Sender: TObject);
    procedure CheckCapslock;
  end;

var
  FormRichNote: TFormRichNote;

implementation

{$R *.DFM}

// status bar panels

const
  sbpMessage = 0;
  sbpCaps = 1;
  sbpPosition = 2;

/////////// Font operations

procedure TFormRichNote.BoldExecute(Sender: TObject);
begin
  with RichEdit.SelAttributes do
    if fsBold in Style then
      Style := Style - [fsBold]
    else
      Style := Style + [fsBold];
end;

procedure TFormRichNote.ItalicExecute(Sender: TObject);
begin
  with RichEdit.SelAttributes do
    if fsItalic in Style then
      Style := Style - [fsItalic]
    else
      Style := Style + [fsItalic];
end;

procedure TFormRichNote.FontExecute(Sender: TObject);
begin
  FontDialog.Font.Assign (RichEdit.SelAttributes);
  if FontDialog.Execute then
  begin
    RichEdit.SelAttributes.Assign (FontDialog.Font);
    RichEditSelectionChange (Self);
  end;
end;

// right + center + left actions
procedure TFormRichNote.ChangeAlignment(Sender: TObject);
begin
  // change paragraph alignment using the TAlignment
  // value saved in the tag of the action
  RichEdit.Paragraph.Alignment := TAlignment (
    (Sender as TAction).Tag);
end;

procedure TFormRichNote.AboutExecute(Sender: TObject);
begin
  MessageDlg ('RichNote Demo' + #13#13
    + 'written for the book "Mastering Delphi" by Marco Cantù',
    mtInformation, [mbOK], 0);
end;

/////////// File menu

procedure TFormRichNote.NewExecute(Sender: TObject);
begin
  if not Modified or SaveChanges then
  begin
    RichEdit.Text := '';
    Modified := False;
    FileName := '';
    Caption := 'RichNote - [Untitled]';
  end;
end;

procedure TFormRichNote.ExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TFormRichNote.OpenExecute(Sender: TObject);
begin
  if not Modified or SaveChanges then
    if OpenDialog.Execute then
    begin
      Filename := OpenDialog.FileName;
      RichEdit.Lines.LoadFromFile (FileName);
      Modified := False;
      Caption := 'RichNote - ' + FileName;
      RichEdit.ReadOnly := ofReadOnly in
        OpenDialog.Options;
    end;
end;

// return False to skip current operation
function TFormRichNote.SaveChanges: Boolean;
begin
  case MessageDlg (
    'The document ' + filename + ' has changed.' +
    #13#13 + 'Do you want to save the changes?',
    mtConfirmation, mbYesNoCancel, 0) of
  idYes:
    // call Save and return its result
    Result := Save;
  idNo:
    // do not save and continue
    Result := True;
  else // idCancel:
    // do not save and abort operation
    Result := False;
  end;
end;

// return False means the SaveAs has been aborted
function TFormRichNote.Save: Boolean;
begin
  if Filename = '' then
    Result := SaveAs // ask for a file name
  else
  begin
    RichEdit.Lines.SaveToFile (FileName);
    Modified := False;
    Result := True;
  end;
end;

// return False if SaveAs dialog box is cancelled
function TFormRichNote.SaveAs: Boolean;
begin
  SaveDialog.FileName := Filename;
  if SaveDialog.Execute then
  begin
    Filename := SaveDialog.FileName;
    Save;
    Caption := Filename + ' - ' +
      Application.Title;
    Result := True;
  end
  else
    Result := False;
end;

procedure TFormRichNote.SaveExecute(Sender: TObject);
begin
  if Modified then
    Save;
end;

procedure TFormRichNote.SaveAsExecute(Sender: TObject);
begin
  SaveAs;
end;

procedure TFormRichNote.PrintExecute(Sender: TObject);
begin
  RichEdit.Print (FileName);
end;

procedure TFormRichNote.RichEditChange(Sender: TObject);
begin
  // enables save operations
  Modified := True;
end;

/////////// Options menu

procedure TFormRichNote.BackColorExecute(Sender: TObject);
begin
  ColorDialog.Color := RichEdit.Color;
  if ColorDialog.Execute then
    RichEdit.Color := ColorDialog.Color;
end;

procedure TFormRichNote.CountCharsExecute(Sender: TObject);
begin
  MessageDlg (Format (
    'The text has %d characters', [RichEdit.GetTextLen]),
    mtInformation, [mbOK], 0);
end;

/////////// Form events

procedure TFormRichNote.FormCreate(Sender: TObject);
var
  I, ToolSize: Integer;
  mItem: TMenuItem;
  tb: TToolButton;
begin
  FileName := '';
  Modified := False;
  Application.Title := Caption;

  ComboFont.Items := Screen.Fonts;
  ComboFont.ItemIndex := ComboFont.Items.IndexOf (
    RichEdit.Font.Name);

  {Hints are customized in this version, as we use both the short
  and the long portion of the Hint string property
  // move captions to hints, removing the &
  for I := 0 to ActionList.ActionCount - 1 do
    (ActionList.Actions[I] as TAction).Hint :=
      StripHotKey ((ActionList.Actions[I] as TAction).Caption);}

  // populate the control bar menu
  for I := 0 to ControlBar.ControlCount - 1 do
  begin
    mItem := TMenuItem.Create (Self);
    mItem.Caption := ControlBar.Controls [I].Name;
    mItem.Tag := Integer (ControlBar.Controls [I]);
    mItem.OnClick := BarMenuClick;
    BarMenu.Items.Add (mItem);
  end;

  // create the buttons of the menu toolbar
  ToolSize := 0;
  for I := MainMenu.Items.Count - 1 downto 0 do
  begin
    tb := TToolButton.Create (ToolBarMenu);
    tb.Parent := ToolBarMenu;
    tb.AutoSize := True;
    tb.Grouped := True;
    tb.Caption := MainMenu.Items[I].Caption;
    tb.MenuItem := MainMenu.Items[I];
    Inc (ToolSize, tb.Width);
  end;
  // size the menu toolbar
  ToolBarMenu.Width := ToolSize;
  // hide the standard menu, using the form's Menu property
  Menu := nil;
end;

procedure TFormRichNote.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  // short-circuit evaluation: if not modified
  // doesn't even try to save. Doesn't close if
  // save request is cancelled
  CanClose := not Modified or SaveChanges;
end;

// update events for actions

procedure TFormRichNote.acSaveUpdate(Sender: TObject);
begin
  acSave.Enabled := Modified;
end;

procedure TFormRichNote.acBoldUpdate(Sender: TObject);
begin
  acBold.Checked := fsBold in RichEdit.SelAttributes.Style;
end;

procedure TFormRichNote.acItalicUpdate(Sender: TObject);
begin
  acItalic.Checked := fsItalic in RichEdit.SelAttributes.Style;
end;

procedure TFormRichNote.acCountcharsUpdate(Sender: TObject);
begin
  acCountChars.Enabled := RichEdit.GetTextLen > 0;
end;

procedure TFormRichNote.acCutExecute(Sender: TObject);
begin
  RichEdit.CutToClipboard;
end;

procedure TFormRichNote.acCutUpdate(Sender: TObject);
begin
  acCut.Enabled := RichEdit.SelLength > 0;
  acCopy.Enabled := acCut.Enabled;
end;

procedure TFormRichNote.acCopyExecute(Sender: TObject);
begin
  RichEdit.CopyToClipboard;
end;

procedure TFormRichNote.acPasteExecute(Sender: TObject);
begin
  RichEdit.PasteFromClipboard;
end;

procedure TFormRichNote.acPasteUpdate(Sender: TObject);
begin
  acPaste.Enabled := SendMessage (
    RichEdit.Handle, em_CanPaste, 0, 0) <> 0;
end;

procedure TFormRichNote.acUndoExecute(Sender: TObject);
begin
  RichEdit.Undo;
end;

procedure TFormRichNote.acUndoUpdate(Sender: TObject);
begin
  acUndo.Enabled := RichEdit.CanUndo;
end;

procedure TFormRichNote.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  // check the proper paragraph alignment
  case RichEdit.Paragraph.Alignment of
    taLeftJustify: acLeftAligned.Checked := True;
    taRightJustify: acRightAligned.Checked := True;
    taCenter: acCentered.Checked := True;
  end;
  // checks the caps lock status
  CheckCapslock;
end;

procedure TFormRichNote.ToolButton17Click(Sender: TObject);
begin
  RichEdit.SelAttributes.Size :=
    RichEdit.SelAttributes.Size + 2;
end;

procedure TFormRichNote.SetFontSize(Sender: TObject);
begin
  RichEdit.SelAttributes.Size :=
    (Sender as TMenuItem).Tag;
end;

procedure TFormRichNote.ComboFontClick(Sender: TObject);
begin
  RichEdit.SelAttributes.Name :=
    ComboFont.Text;
end;

procedure TFormRichNote.RichEditSelectionChange(Sender: TObject);
begin
  // select the current font name in the font combo box
  ComboFont.ItemIndex :=
    ComboFont.Items.IndexOf (RichEdit.SelAttributes.Name);
  // update the position in the status bar
  StatusBar.Panels[sbpPosition].Text := Format ('%d/%d',
    [RichEdit.CaretPos.Y + 1, RichEdit.CaretPos.X + 1]);
end;

procedure TFormRichNote.acHintColorExecute(Sender: TObject);
begin
  ColorDialog.Color := Application.HintColor;
  if ColorDialog.Execute then
    Application.HintColor := ColorDialog.Color;
end;

procedure TFormRichNote.BarMenuClick(Sender: TObject);
var
  aCtrl: TControl;
begin
  aCtrl := TControl ((Sender as TComponent).Tag);
  aCtrl.Visible := not aCtrl.Visible;
end;

procedure TFormRichNote.BarMenuPopup(Sender: TObject);
var
  I: Integer;
begin
  // update the menu checkmarks
  for I := 0 to BarMenu.Items.Count - 1 do
    BarMenu.Items [I].Checked :=
      TControl (BarMenu.Items [I].Tag).Visible;
end;

procedure TFormRichNote.ShowHint(Sender: TObject);
begin
  // show hint in the status bar message panel
  StatusBar.Panels[sbpMessage].Text := Application.Hint;
end;

procedure TFormRichNote.CheckCapslock;
begin
  // show status in caps panel
  if Odd (GetKeyState (VK_CAPITAL)) then
    StatusBar.Panels[sbpCaps].Text := 'CAPS'
  else
    StatusBar.Panels[sbpCaps].Text := '';
end;

procedure TFormRichNote.TimerTimer(Sender: TObject);
begin
  CheckCapslock;
end;

end.
