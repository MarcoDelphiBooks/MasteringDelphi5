unit DirsForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, FileCtrl, ShlObj;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    TestButton: TButton;
    CreateButton: TButton;
    SelectButton: TButton;
    btnBrowse: TButton;
    procedure TestButtonClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CreateButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.TestButtonClick(Sender: TObject);
begin
  if DirectoryExists (Edit1.Text) then
    MessageDlg ('OK, the directory ' +
      Edit1.Text + ' exists', mtInformation, [mbOk], 0)
  else
    MessageDlg ('Sorry, the directory ' + Edit1.Text +
      ' doesn''t exist', mtError, [mbOk], 0);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if Edit1.TExt <> '' then
  begin
    TestButton.Enabled := True;
    CreateButton.Enabled := True;
  end
  else
  begin
    TestButton.Enabled := False;
    CreateButton.Enabled := False;
  end;
end;

procedure TForm1.CreateButtonClick(Sender: TObject);
begin
  if MessageDlg ('Are you sure you want to create the ' +
      Edit1.Text + ' directory', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes then
    ForceDirectories (Edit1.Text);
end;

procedure TForm1.SelectButtonClick(Sender: TObject);
var
  Text: string;
begin
  Text := Edit1.Text;
  if SelectDirectory (Text, [sdAllowCreate,
      sdPerformCreate, sdPrompt], 0) then
    Edit1.Text := Text;
end;

procedure TForm1.btnBrowseClick(Sender: TObject);
var
  bi: TBrowseInfo;
  pidl: pItemIdList;
  strpath: string;
begin
  bi.hwndOwner := Handle;
  bi.pidlRoot := nil;
  bi.pszDisplayName := '';
  bi.lpszTitle := 'Select a folder';
  bi.ulFlags := bif_StatusText;
  bi.lpfn := nil;
  bi.lParam := 0;

  pidl := ShBrowseForFolder (bi);

  SetLength (strPath, 100);
  ShGetPathFromIdList (pidl, PChar(strPath));
  Edit1.Text := strPath;
end;

end.
