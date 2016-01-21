unit GridView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Buttons, DBCtrls, DataM, ExtCtrls;

type
  TGridForm = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    DM: TCustomerDM;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TGridForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TGridForm.FormCreate(Sender: TObject);
begin
  DM := TCustomerDM.Create (Self);
  DBGrid1.DataSource := DM.DataSource1;
end;

end.
