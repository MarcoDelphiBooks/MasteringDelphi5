unit DBHForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, Forms, DBCtrls, StdCtrls, DBTables,
  ExtCtrls, Mask, Db, Dialogs, HTTPApp, DSProd, DBWeb;

type
  TFormProd = class(TForm)
    BtnPrintAll: TButton;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    Table1: TTable;
    DataSource1: TDataSource;
    SaveDialog1: TSaveDialog;
    Memo1: TMemo;
    BtnSave: TButton;
    CheckStart: TCheckBox;
    BtnLine: TButton;
    PageProducer1: TPageProducer;
    DataSetPageProducer1: TDataSetPageProducer;
    Table1Name: TStringField;
    Table1Capital: TStringField;
    Table1Continent: TStringField;
    Table1Area: TFloatField;
    Table1Population: TFloatField;
    BtnDemo: TButton;
    DataSetTableProducer1: TDataSetTableProducer;
    DataSetTableProducer2: TDataSetTableProducer;
    cbCss: TCheckBox;
    procedure BtnPrintAllClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnLineClick(Sender: TObject);
    procedure DataSetPageProducer1HTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure BtnDemoClick(Sender: TObject);
    procedure DataSetTableProducer1FormatCell(Sender: TObject; CellRow,
      CellColumn: Integer; var BgColor: THTMLBgColor;
      var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
      CellData: String);
    procedure DataSetTableProducer2FormatCell(Sender: TObject; CellRow,
      CellColumn: Integer; var BgColor: THTMLBgColor;
      var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
      CellData: String);
  end;

var
  FormProd: TFormProd;

implementation

{$R *.DFM}

uses
  ShellAPI;

procedure TFormProd.BtnPrintAllClick(Sender: TObject);
begin
  Table1.First;
  Memo1.Clear;
  if not cbCss.Checked then
    Memo1.Text := DataSetTableProducer1.Content
  else
    Memo1.Text := DataSetTableProducer2.Content;
  BtnSave.Enabled := True;
end;

procedure TFormProd.BtnSaveClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    Memo1.Lines.SaveToFile (SaveDialog1.FileName);
    if CheckStart.Checked then
      ShellExecute (Handle, 'open',
        PChar (SaveDialog1.FileName),
        '', '', sw_ShowNormal);
  end;
end;

procedure TFormProd.BtnLineClick(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Text := DataSetPageProducer1.Content;
  BtnSave.Enabled := True;
end;

procedure TFormProd.DataSetPageProducer1HTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if TagString = 'program' then
    ReplaceText := ExtractFilename (Forms.Application.Exename)
  else if TagString = 'date' then
    ReplaceText := DateToStr (Date);
end;

procedure TFormProd.PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
var
  nDays: Integer;
begin
  if TagString = 'date' then
    ReplaceText := DateToStr (Now)
  else if TagString = 'appname' then
    ReplaceText := ExtractFilename (Forms.Application.Exename)
  else if TagString = 'expiration' then
  begin
    nDays := StrToIntDef (TagParams.Values['days'], 0);
    if nDays <> 0 then
      ReplaceText := DateToStr (Now + nDays)
    else
      ReplaceText := '<I>{expiration tag error}</I>';
  end;
end;

procedure TFormProd.BtnDemoClick(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Text := PageProducer1.Content;
  BtnSave.Enabled := True;
end;

procedure TFormProd.DataSetTableProducer1FormatCell(Sender: TObject;
  CellRow, CellColumn: Integer; var BgColor: THTMLBgColor;
  var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
  CellData: String);
begin
  if (CellRow > 0) and (((CellColumn = 3) and (Length (CellData) > 8)) or
     ((CellColumn = 4) and (Length (CellData) > 9))) then
  begin
    BgColor := 'red';
    CellData := '<b>' + CellData + '</b>';
  end;
end;

procedure TFormProd.DataSetTableProducer2FormatCell(Sender: TObject;
  CellRow, CellColumn: Integer; var BgColor: THTMLBgColor;
  var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
  CellData: String);
begin
  if (CellRow > 0) and (((CellColumn = 3) and (Length (CellData) > 8)) or
      ((CellColumn = 4) and (Length (CellData) > 9))) then
    CustomAttrs := 'class="highlight"';
end;

end.
