unit ErrorF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, Buttons, Grids;

type
  TErrorsForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ErrorsForm: TErrorsForm;

implementation

{$R *.DFM}

procedure TErrorsForm.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells [0, 0] := 'Field Name';
  StringGrid1.Cells [1, 0] := 'Old Value';
  StringGrid1.Cells [2, 0] := 'New Value';
end;

end.
 