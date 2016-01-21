unit jobs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids;

type
  TfrmJobs = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    btnAccept: TButton;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJobs: TfrmJobs;

implementation

uses data;

{$R *.DFM}

procedure TfrmJobs.FormCreate(Sender: TObject);
begin
  try
    dmData.qryJob.Open;
  except
    Close;
  end;
end;

procedure TfrmJobs.FormDestroy(Sender: TObject);
begin
  dmData.qryJob.Close;
end;

end.
