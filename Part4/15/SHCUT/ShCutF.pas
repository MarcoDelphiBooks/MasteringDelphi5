unit ShCutF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    EditName: TEdit;
    Label1: TLabel;
    Button2: TButton;
    GroupBox1: TGroupBox;
    cbDir: TCheckBox;
    cbDesktop: TCheckBox;
    cbStartMenu: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  ComObj, ActiveX, ShlObj, Registry;

procedure TForm1.Button1Click(Sender: TObject);
var
  AnObj: IUnknown;
  ShLink: IShellLink;
  PFile: IPersistFile;
  FileName: string;
  WFileName: WideString;
  Reg: TRegIniFile;
begin
  // access to the two interfaces of the object
  AnObj := CreateComObject (CLSID_ShellLink);
  ShLink := AnObj as IShellLink;
  PFile := AnObj as IPersistFile;
  // get the name of the application file
  FileName := ParamStr (0);
  // set the link properties
  ShLink.SetPath (PChar (FileName));
  ShLink.SetWorkingDirectory (PChar (
    ExtractFilePath (FileName)));

  // save the file in the current dir
  if cbDir.Checked then
  begin
    // using a WideString
    WFileName := ExtractFilePath (FileName) +
      EditName.Text + '.lnk';
    PFile.Save (PWChar (WFileName), False);
  end;

  // save on the desktop
  if cbDesktop.Checked then
  begin
    Reg := TRegIniFile.Create(
      'Software\MicroSoft\Windows\CurrentVersion\Explorer');
    WFileName := Reg.ReadString ('Shell Folders', 'Desktop', '') +
      '\' + EditName.Text + '.lnk';
    Reg.Free;
    PFile.Save (PWChar (WFileName), False);
  end;

  // save in the Start Menu
  if cbStartMenu.Checked then
  begin
    Reg := TRegIniFile.Create(
      'Software\MicroSoft\Windows\CurrentVersion\Explorer');
    WFileName := Reg.ReadString ('Shell Folders', 'Start Menu', '') +
      '\' + EditName.Text + '.lnk';
    Reg.Free;
    PFile.Save (PWChar (WFileName), False);
  end;
end;

// add a document to the Start menu documents list
procedure TForm1.Button2Click(Sender: TObject);
var
  ProjectFile: string;
begin
  ProjectFile := ChangeFileExt (ParamStr (0), '.dpr');
  SHAddToRecentDocs (SHARD_PATH, PChar(ProjectFile));
end;

end.
