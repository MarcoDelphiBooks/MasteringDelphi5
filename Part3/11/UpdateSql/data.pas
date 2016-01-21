unit data;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  TdmData = class(TDataModule)
    spDelEmployee: TStoredProc;
    EmpDS: TDataSource;
    EmpUpdate: TUpdateSQL;
    qryEmployee: TQuery;
    qryEmployeeEMP_NO: TSmallintField;
    qryEmployeeFIRST_NAME: TStringField;
    qryEmployeeLAST_NAME: TStringField;
    qryEmployeeDEPARTMENT: TStringField;
    qryEmployeeJOB_TITLE: TStringField;
    qryEmployeeSALARY: TFloatField;
    AppDB: TDatabase;
    qryDepartment: TQuery;
    DepDS: TDataSource;
    qryEmployeeDEPT_NO: TStringField;
    qryJob: TQuery;
    JobDS: TDataSource;
    qryEmployeeJOB_CODE: TStringField;
    qryEmployeeJOB_GRADE: TSmallintField;
    qryEmployeeJOB_COUNTRY: TStringField;
    procedure qryEmployeeUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure EmpDSUpdateData(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmData: TdmData;

implementation

uses main;

{$R *.DFM}

procedure TdmData.qryEmployeeUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  // when deleting the record, use the Stored Procedure
  if UpdateKind = ukDelete then
  begin
    // assign emp_no value
    with dmData do
      spDelEmployee.Params[0].Value := qryEmployeeEMP_NO.OldValue;
    try
      // invoke stored proc that tries to delete employee
      dmData.spDelEmployee.ExecProc;
      UpdateAction := uaApplied; // success
    except
      UpdateAction := uaFail;
    end;
  end
  else
  try
    // apply updates
    dmData.EmpUpdate.Apply(UpdateKind);
    UpdateAction := uaApplied;
  except
    UpdateAction := uaFail;
  end;
end;

procedure TdmData.EmpDSUpdateData(Sender: TObject);
begin
  MainForm.btnApply.Enabled := True;
end;

end.
