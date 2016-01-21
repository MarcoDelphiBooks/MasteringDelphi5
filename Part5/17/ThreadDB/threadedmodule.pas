unit threadedmodule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDataModule2 = class(TDataModule)
    Session1: TSession;
    Database1: TDatabase;
    Query1: TQuery;
    Query1COUNT: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
