unit FormView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, DataM;

type
  TRecordForm = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    DM: TCustomerDM;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TRecordForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TRecordForm.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  DM := TCustomerDM.Create (Self);
  // connect the navigator
  DBNavigator1.DataSource := DM.DataSource1;
  // connect all DBEdit controls
  for I := 0 to ControlCount - 1 do
    if Controls [i] is TDBEdit then
      TDBEdit (Controls [I]).DataSource :=
        DM.DataSource1;
end;

end.
