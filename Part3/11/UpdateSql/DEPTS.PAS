unit depts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls;

type
  TfrmDepartments = class(TForm)
    btnAccept: TButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDepartments: TfrmDepartments;

implementation

uses data;

{$R *.DFM}

procedure TfrmDepartments.FormCreate(Sender: TObject);
begin
  try
    dmData.qryDepartment.Open;
  except
    Close;
  end;
end;

procedure TfrmDepartments.FormDestroy(Sender: TObject);
begin
  dmData.qryDepartment.Close;
end;

end.
