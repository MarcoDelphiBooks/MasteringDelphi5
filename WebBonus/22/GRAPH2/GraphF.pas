unit GraphF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, StdCtrls, TeEngine,
  Series, ExtCtrls, TeeProcs, Chart, Menus;

type
  TForm1 = class(TForm)
    Chart1: TChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Panel1: TPanel;
    ChBoxMarks: TCheckBox;
    UpdateButton: TButton;
    StringGrid1: TStringGrid;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure StringGrid1GetEditMask(Sender: TObject; ACol, ARow: Longint;
      var Value: string);
    procedure ChBoxMarksClick(Sender: TObject);
    procedure ComboChange(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    Combos: array [0..3] of TComboBox;
    Modified: Boolean;
    CurrentFile: string;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  I, J: Integer;
begin
  with StringGrid1 do
  begin
    {fills the fixed column and row,
    and the chart series names}
    for I := 1 to 5 do
      Cells [I, 0] := Format ('Group %d', [I]);
    for J := 1 to 4 do
    begin
      Cells [0, J] := Format ('Series %d', [J]);
      Chart1.Series [J-1].Title := Format ('Series %d', [J]);
    end;

    {fills the grid with random values}
    Randomize;
    for I := 1 to 5 do
      for J := 1 to 4 do
        Cells [I, J] := IntToStr (Random (100));
  end; // with

  // fill the Combos array
  Combos [0] := ComboBox1;
  Combos [1] := ComboBox2;
  Combos [2] := ComboBox3;
  Combos [3] := ComboBox4;

  // show the initial chart type
  for I := 0 to 3 do
    Combos [I].ItemIndex := 1;

  // update the chart
  UpdateButtonClick (Self);
end;

procedure TForm1.UpdateButtonClick(Sender: TObject);
var
  I, J: Integer;
begin
  for I := 1 to 4 do
  begin
    Chart1.Series [I-1].Clear;
    for J := 1 to 5 do
      Chart1.Series [I-1].Add (
        StrToInt (StringGrid1.Cells [J, I]),
        '', Chart1.Series [I-1].SeriesColor);
  end;
  Modified := True;
end;

procedure TForm1.StringGrid1GetEditMask(Sender: TObject; ACol,
  ARow: Longint; var Value: string);
begin
  // edit mask for the grid cells
  Value := '09;0';
end;

procedure TForm1.ChBoxMarksClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to 4 do
    Chart1.Series [I-1].Marks.Visible :=
      ChBoxMarks.Checked;
  Modified := True;
end;

procedure TForm1.ComboChange(Sender: TObject);
var
  I: Integer;
  SeriesClass: TChartSeriesClass;
  NewSeries: TChartSeries;
begin
  // destroy the existing series (in reverse order)
  for I := 3 downto 0 do
    Chart1.Series [I].Free;
  // create the new series
  for I := 0 to 3 do
  begin
    case Combos [I].ItemIndex of
      0: SeriesClass := TLineSeries;
      1: SeriesClass := TBarSeries;
      2: SeriesClass := TAreaSeries;
    else // 3: and default
      SeriesClass := TPointSeries;
    end;
    NewSeries := SeriesClass.Create (Self);
    NewSeries.ParentChart := Chart1;
    NewSeries.Title :=
      Format ('Series %d', [I + 1]);
  end;
  // update the marks and update the data
  ChBoxMarksClick (Self);
  UpdateButtonClick (Self);
  Modified := True;
end;

procedure TForm1.Open1Click(Sender: TObject);
var
  LoadStream: TFileStream;
  I, J, Value: Integer;
begin
  if OpenDialog1.Execute then
  begin
    CurrentFile := OpenDialog1.Filename;
    Caption := 'Graph [' + CurrentFile + ']';
    // load from the current file
    LoadStream := TFileStream.Create (
      CurrentFile, fmOpenRead);
    try
      // read the value of each grid element
      for I := 1 to 5 do
        for J := 1 to 4 do
        begin
          LoadStream.Read (Value, sizeof (Integer));
          StringGrid1.Cells [I, J] := IntToStr(Value);
        end;
      // load the status of the checkbox and the combo boxes
      LoadStream.Read (Value, sizeof (Integer));
      ChBoxMarks.Checked := Boolean(Value);
      for I := 0 to 3 do
      begin
        LoadStream.Read (Value, sizeof (Integer));
        Combos [I].ItemIndex := Value;
      end;
    finally
      LoadStream.Free;
    end;
    // fire udpate events
    ChBoxMarksClick (Self);
    ComboChange (Self);
    UpdateButtonClick (Self);
    Modified := False;
  end;
end;

procedure TForm1.Save1Click(Sender: TObject);
var
  SaveStream: TFileStream;
  I, J, Value: Integer;
begin
  if Modified then
    if CurrentFile = '' then // call save as
      SaveAs1Click (Self)
    else
    begin
      // save to the current file
      SaveStream := TFileStream.Create (
        CurrentFile, fmOpenWrite or fmCreate);
      try
        // write the value of each grid element
        for I := 1 to 5 do
          for J := 1 to 4 do
          begin
            Value := StrToIntDef (Trim (
              StringGrid1.Cells [I, J]), 0);
            SaveStream.Write (Value, sizeof (Integer));
          end;
        // save check box and combo boxes
        Value := Integer (ChBoxMarks.Checked);
        SaveStream.Write (Value, sizeof (Integer));
        for I := 0 to 3 do
        begin
          Value := Combos [I].ItemIndex;
          SaveStream.Write (Value, sizeof (Integer));
        end;
        Modified := False;
      finally
        SaveStream.Free;
      end;
    end;
end;

procedure TForm1.SaveAs1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    CurrentFile := SaveDialog1.Filename;
    Caption := 'Graph [' + CurrentFile + ']';
    // call save
    Modified := True;
    Save1Click (Self);
  end;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  MessageDlg ('Graph example with file support' +
    #13'from "Mastering Delphi" by Marco Cantù',
    mtInformation, [mbOk], 0);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  Code: Word;
begin
  if Modified then
  begin
    Code := MessageDlg (
      'Data has changed, do you want to save it?',
      mtConfirmation, mbYesNoCancel, 0);
    if Code = idYes then
      Save1Click (Self);
    if Code = idCancel then
      CanClose := False
    else
      CanClose := True;
  end
  else
    CanClose := True;
end;

end.
