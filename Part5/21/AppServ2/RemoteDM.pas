unit RemoteDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, DataBkr, AppServTwo_TLB, Db,
  DBTables, Provider;

type
  TRdmCount = class(TRemoteDataModule, IRdmCount)
    Table1: TTable;
    Table1Name: TStringField;
    Table1Capital: TStringField;
    Table1Continent: TStringField;
    Table1Area: TFloatField;
    Table1Population: TFloatField;
    DataSetProvider1: TDataSetProvider;
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID,
      ProgID: string); override;
  public
    { Public declarations }
  end;

var
  RdmCount: TRdmCount;

implementation

{$R *.DFM}

class procedure TRdmCount.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TRdmCount,
    Class_RdmCount, ciMultiInstance);
end.
