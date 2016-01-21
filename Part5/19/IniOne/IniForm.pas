unit IniForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, IniFiles;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject;
      var Action: TCloseAction);
  private
    IniFile: TIniFile;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  Status: Integer;
begin
  IniFile := TIniFile.Create (ChangeFileExt (
    Application.ExeName, '.ini'));
  {try to read a value and test if it exists}
  Status := IniFile.ReadInteger ('MainForm', 'Status', 0);
  if Status <> 0 then
  begin
    {read position and size using current values as default}
    Top := IniFile.ReadInteger ('MainForm', 'Top', Top);
    Left := IniFile.ReadInteger ('MainForm', 'Left', Left);
    Width := IniFile.ReadInteger ('MainForm', 'Width', Width);
    Height := IniFile.ReadInteger ('MainForm', 'Height', Height);

    {set the minimized or maximized status}
    case Status of
      // 1: WindowState := wsNormal;
        //this is already the default
      2: WindowState := wsMinimized;
      3: WindowState := wsMaximized;
    end;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Status: Integer;
begin
  if MessageDlg ('Save the current status of the form?',
    mtConfirmation, [mbYes, mbNo], 0) = IdYes then
  begin
    Status := 1; // default
    case WindowState of
      wsNormal: begin
        {save position and size only if the state is normal}
        IniFile.WriteInteger ('MainForm', 'Top', Top);
        IniFile.WriteInteger ('MainForm', 'Left', Left);
        IniFile.WriteInteger ('MainForm', 'Width', Width);
        IniFile.WriteInteger ('MainForm', 'Height', Height);
      end;
      wsMinimized: Status := 2;
        {useless: this value is never set by VCL for the main form}
      wsMaximized: Status := 3;
    end;
    {check if the window is minimized, that is, if the form
    is hidden and not active}
    if not Active then
      Status := 2;
    {write status information}
    IniFile.WriteInteger ('MainForm', 'Status', Status);
  end;
  {in any case destroy the IniFile object}
  IniFile.Free;
end;

end.
