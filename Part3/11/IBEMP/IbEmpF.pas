unit IbEmpF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls;

type
  TFormEmp = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditEMPNO: TDBEdit;
    Label2: TLabel;
    EditLASTNAME: TDBEdit;
    Label3: TLabel;
    EditFIRSTNAME: TDBEdit;
    Label4: TLabel;
    EditPHONEEXT: TDBEdit;
    Label5: TLabel;
    EditHIREDATE: TDBEdit;
    Label6: TLabel;
    EditSALARY: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Query1: TQuery;
    Query1EMPNO: TIntegerField;
    Query1FIRSTNAME: TStringField;
    Query1LASTNAME: TStringField;
    Query1PHONEEXT: TStringField;
    Query1HIREDATE: TDateTimeField;
    Query1SALARY: TFloatField;
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormEmp: TFormEmp;

implementation

{$R *.DFM}

procedure TFormEmp.FormCreate(Sender: TObject);
begin
  Query1.Open;
end;

end.