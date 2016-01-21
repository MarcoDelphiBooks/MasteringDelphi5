unit MemForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ExtCtrls, StdCtrls;

type
  TFormMemStatus = class(TForm)
    StringGrid2: TStringGrid;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormMemStatusClose(Sender: TObject;
      var Action: TCloseAction);
  private
    procedure UpdateStatus;
  public
    s: string;
    sl: TStringList;
    f: TForm;
  end;

var
  FormMemStatus: TFormMemStatus;

implementation

{$R *.DFM}

procedure TFormMemStatus.UpdateStatus;
var
  HeapStatus: THeapStatus;
begin
  HeapStatus := GetHeapStatus;
  with HeapStatus do
  begin
    StringGrid2.Cells [1, 0] := FloatToStrF (
      TotalAddrSpace div 1024,
      ffNumber, 20, 0) + ' Kbytes';
    StringGrid2.Cells [1, 1] := FloatToStrF (
      TotalUncommitted div 1024,
      ffNumber, 20, 0) + ' Kbytes';
    StringGrid2.Cells [1, 2] := FloatToStrF (
      TotalCommitted div 1024,
      ffNumber, 20, 0) + ' Kbytes';
    StringGrid2.Cells [1, 3] := FloatToStrF (
      TotalFree div 1024,
      ffNumber, 20, 0) + ' Kbytes';
    StringGrid2.Cells [1, 4] := FloatToStrF (
      TotalAllocated div 1024,
      ffNumber, 20, 0) + ' Kbytes';
    StringGrid2.Cells [1, 5] := IntToStr (
       TotalAllocated div (TotalAddrSpace div 100)) + '%';
    StringGrid2.Cells [1, 6] := FloatToStrF (
      FreeSmall div 1024,
      ffNumber, 20, 0) + ' Kbytes';
    StringGrid2.Cells [1, 7] := FloatToStrF (
      FreeBig div 1024,
      ffNumber, 20, 0) + ' Kbytes';
    StringGrid2.Cells [1, 8] := FloatToStrF (
      Unused div 1024,
      ffNumber, 20, 0) + ' Kbytes';
    StringGrid2.Cells [1, 9] := FloatToStrF (
      Overhead div 1024,
      ffNumber, 20, 0) + ' Kbytes';
  end;
end;

procedure TFormMemStatus.FormCreate(Sender: TObject);
begin
  StringGrid2.Cells [0, 0] := 'Available address space ';
  StringGrid2.Cells [0, 1] := 'Uncommitted portion';
  StringGrid2.Cells [0, 2] := 'Committed portion';
  StringGrid2.Cells [0, 3] := 'Free portion';
  StringGrid2.Cells [0, 4] := 'Allocated portion';
  StringGrid2.Cells [0, 5] := 'Address space load';
  StringGrid2.Cells [0, 6] := 'Total small free blocks';
  StringGrid2.Cells [0, 7] := 'Total big free blocks';
  StringGrid2.Cells [0, 8] := 'Other unused blocks';
  StringGrid2.Cells [0, 9] := 'Total overhead';

  UpdateStatus;
end;

procedure TFormMemStatus.Timer1Timer(Sender: TObject);
begin
  UpdateStatus;
end;

procedure TFormMemStatus.FormMemStatusClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FormMemStatus := nil;
end;

end.
