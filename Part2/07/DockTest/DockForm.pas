unit DockForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    Splitter1: TSplitter;
    PopupMenu1: TPopupMenu;
    DocktoPanel1: TMenuItem;
    DocktoForm1: TMenuItem;
    Floating1: TMenuItem;
    Splitter2: TSplitter;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure Panel1DockDrop(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer);
    procedure ControlStartDock(Sender: TObject;
      var DragObject: TDragDockObject);
    procedure Panel1DockOver(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure DocktoPanel1Click(Sender: TObject);
    procedure DocktoForm1Click(Sender: TObject);
    procedure Floating1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    DockFileName: string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  DockHost;

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  FileStr: TFileStream;
begin
  // Panel1.DockOrientation := doHorizontal;
  Memo1.FloatingDockSiteClass := TForm2;
  ListBox1.FloatingDockSiteClass := TCustomDockForm;

  // relaod the settings
  DockFileName := ExtractFilePath (Application.Exename) +
    'dock.dck';
  if FileExists (DockFileName) then
  begin
    FileStr := TFileStream.Create (DockFileName, fmOpenRead);
    try
      Panel1.DockManager.LoadFromStream (FileStr);
    finally
      FileStr.Free;
    end;
  end;
  Panel1.DockManager.ResetBounds (True);
end;

procedure TForm1.Panel1DockDrop(Sender: TObject; Source: TDragDockObject;
  X, Y: Integer);
begin
  Caption := 'Docked: ' + IntToStr (Panel1.DockClientCount);
end;

procedure TForm1.ControlStartDock(Sender: TObject;
  var DragObject: TDragDockObject);
begin
  Caption := 'Docking ' + (Sender as TComponent).Name;
end;

procedure TForm1.Panel1DockOver(Sender: TObject; Source: TDragDockObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Caption := 'Docking: ' + Source.Control.Name;
  Accept := True;
end;

procedure TForm1.DocktoPanel1Click(Sender: TObject);
begin
  // dock to the panel
  ListBox1.ManualDock (Panel1, Panel1, alBottom);
end;

procedure TForm1.DocktoForm1Click(Sender: TObject);
begin
  // dock to the current form
  ListBox1.Dock (Self, Rect (200, 100, 100, 100));
end;

procedure TForm1.Floating1Click(Sender: TObject);
begin
  // toggle the floating status
  if ListBox1.Floating then
    ListBox1.ManualDock (Panel1, Panel1, alBottom)
  else
    ListBox1.ManualFloat (Rect (100, 100, 200, 300));
  Floating1.Checked := ListBox1.Floating;
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
  FileStr: TFileStream;
begin
  if Panel1.DockClientCount > 0 then
  begin
    FileStr := TFileStream.Create (DockFileName,
      fmCreate or fmOpenWrite);
    try
      Panel1.DockManager.SaveToStream (FileStr);
    finally
      FileStr.Free;
    end;
  end
  else
    // remove the file
    DeleteFile (DockFileName);
end;

end.
