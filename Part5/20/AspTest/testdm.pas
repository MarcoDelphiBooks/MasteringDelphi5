unit testdm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  HTTPApp, DBWeb, Db, ADODB, DBTables;

type
  TDataModule1 = class(TDataModule)
    Table1: TTable;
    DataSetTableProducer1: TDataSetTableProducer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.DFM}

end.
