unit WizForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TWizardForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Image1: TImage;
    btnNext1: TButton;
    btnNext2: TButton;
    btnNext3: TButton;
    btnNext4: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    CheckInprise: TCheckBox;
    btnBack: TButton;
    Label2: TLabel;
    Label3: TLabel;
    CheckDone: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    CheckDone2: TCheckBox;
    ListBox1: TListBox;
    Label6: TLabel;
    Label7: TLabel;
    btnNext5: TButton;
    procedure btnNext1Click(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnNext2Click(Sender: TObject);
    procedure btnNext3Click(Sender: TObject);
    procedure btnNext4Click(Sender: TObject);
    procedure btnNext5Click(Sender: TObject);
    procedure LabelLinkClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    BackPages: TList;
  public
    procedure MoveTo (TabSheet: TTabSheet);
  end;

var
  WizardForm: TWizardForm;

implementation

{$R *.DFM}

uses
  ShellApi;

procedure TWizardForm.btnNext1Click(Sender: TObject);
begin
  if CheckInprise.Checked then
    MoveTo (TabSheet2)
  else
    MoveTo (TabSheet3);
end;

procedure TWizardForm.btnBackClick(Sender: TObject);
var
  LastPage: TTabSheet;
begin
  // get the last page and jump to it
  LastPage := TTabSheet (BackPages [BackPages.Count - 1]);
  PageControl1.ActivePage := LastPage;
  // delete the last page from the list
  BackPages.Delete (BackPages.Count - 1);
  // eventually disable the back button
  BtnBack.Enabled := not (BackPages.Count = 0);
  // move image and bevel
  Bevel1.Parent := PageControl1.ActivePage;
  Image1.Parent := PageControl1.ActivePage;
end;

procedure TWizardForm.FormCreate(Sender: TObject);
begin
  BackPages := TList.Create;
end;

procedure TWizardForm.FormDestroy(Sender: TObject);
begin
  BackPages.Free;
end;

procedure TWizardForm.MoveTo(TabSheet: TTabSheet);
begin
  // add the last page to the list
  BackPages.Add (PageControl1.ActivePage);
  BtnBack.Enabled := True;
  // change page
  PageControl1.ActivePage := TabSheet;
  // move image and bevel
  Bevel1.Parent := PageControl1.ActivePage;
  Image1.Parent := PageControl1.ActivePage;
end;

procedure TWizardForm.btnNext2Click(Sender: TObject);
begin
  if CheckDone.Checked then
    MoveTo (TabSheet5)
  else
    MoveTo (TabSheet3);
end;

procedure TWizardForm.btnNext3Click(Sender: TObject);
begin
  if CheckDone.Checked then
    MoveTo (TabSheet5)
  else
    MoveTo (TabSheet4);
end;

procedure TWizardForm.btnNext4Click(Sender: TObject);
begin
  MoveTo (TabSheet5);
end;

procedure TWizardForm.btnNext5Click(Sender: TObject);
begin
  Close;
end;

procedure TWizardForm.LabelLinkClick(Sender: TObject);
var
  Caption, StrUrl: string;
begin
  Caption := (Sender as TLabel).Caption;
  StrUrl := Copy (Caption, Pos ('www.', Caption), 100);
  ShellExecute (Handle, 'open', PChar (StrUrl), '', '', sw_Show);
end;

procedure TWizardForm.ListBox1Click(Sender: TObject);
var
  StrUrl: string;
begin
  StrUrl := ListBox1.Items [ListBox1.ItemIndex];
  ShellExecute (Handle, 'open', PChar (StrUrl), '', '', sw_Show);
end;

end.
