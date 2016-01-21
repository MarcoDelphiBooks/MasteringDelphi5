unit SortForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, ADODB, Grids, DBGrids;

type
  TFormSort = class(TForm)
    ADODataSet: TADODataSet;
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    ADOConnection: TADOConnection;
    Panel1: TPanel;
    Splitter1: TSplitter;
    ListFields: TListBox;
    Label1: TLabel;
    btnSort: TButton;
    btnIndex: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    btnFilter: TButton;
    EditFilter: TEdit;
    Label3: TLabel;
    btnSave: TButton;
    btnLoad: TButton;
    cbConnected: TCheckBox;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnSortClick(Sender: TObject);
    procedure btnIndexClick(Sender: TObject);
    procedure Edit1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Edit1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Edit2Click(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure cbConnectedClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FormSort: TFormSort;

implementation

{$R *.DFM}

procedure TFormSort.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to AdoDataSet.FieldDefs.Count - 1 do
    ListFields.Items.Add (AdoDataSet.FieldDefs [I].Name);
end;

procedure TFormSort.btnSortClick(Sender: TObject);
var
  t: Cardinal;
  strSort: string;
begin
  t := GetTickCount;
  strSort := Edit1.Text;
  if CheckBox1.Checked then
    strSort := strSort + ' DESC';
  if Edit2.Text <> '' then
    strSort := strSort + ',' + Edit2.Text;
  if CheckBox2.Checked then
    strSort := strSort + ' DESC';
  if Edit3.Text <> '' then
    strSort := strSort + ',' + Edit3.Text;
  if CheckBox3.Checked then
    strSort := strSort + ' DESC';
  AdoDataSet.Sort := strSort;
  Caption := 'AdoSort - ' + IntToStr (GetTickCount - t);
end;

procedure TFormSort.btnIndexClick(Sender: TObject);
begin
  // add index on PartNo
  AdoDataSet.Recordset.Fields[ListFields.ItemIndex].
    Properties['Optimize'].Set_Value (True);
end;

procedure TFormSort.Edit1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TListBox;
end;

procedure TFormSort.Edit1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  (Sender as TEdit).Text := (Source as TListBox).Items [
    (Source as TListBox).ItemIndex];
end;

procedure TFormSort.Edit2Click(Sender: TObject);
begin
  (Sender as TEdit).Text := '';
end;

procedure TFormSort.btnFilterClick(Sender: TObject);
begin
  AdoDataSet.Filter := EditFilter.Text;
  AdoDataSet.Filtered := True;
end;

procedure TFormSort.btnSaveClick(Sender: TObject);
begin
  if SaveDialog.Execute and not
      FileExists (SaveDialog.FileName)then
    AdoDataSet.SaveToFile (SaveDialog.FileName);
end;

procedure TFormSort.btnLoadClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    AdoDataSet.LoadFromFile (OpenDialog.FileName);
  cbConnected.Checked := True;
end;

procedure TFormSort.cbConnectedClick(Sender: TObject);
begin
  AdoDataSet.Active := cbConnected.Checked;
end;

end.
