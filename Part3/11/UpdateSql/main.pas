unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Db, DBTables, Grids, DBGrids, ExtCtrls, StdCtrls;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    btnClose: TButton;
    btnApply: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  Data, depts, jobs;

{$R *.DFM}

resourcestring
  CloseMsg = 'Data has been modified.'#13#13'Save changes?';

procedure TMainForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  Res: Integer;
begin
  with dmData do
    if qryEmployee.UpdatesPending then
    begin
      Res := MessageDlg(CloseMsg, mtInformation, mbYesNoCancel, 0);
      if Res = mrYes then
        AppDB.ApplyUpdates([qryEmployee]);
      CanClose := Res <> mrCancel;
    end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  dmData.qryEmployee.Open;
end;

procedure TMainForm.DBGrid1EditButtonClick(Sender: TObject);
begin
  // Department?
  if DBGrid1.SelectedField = dmData.qryEmployeeDEPARTMENT then
    with TfrmDepartments.Create(Self) do
    try
      dmData.qryDepartment.Locate('DEPT_NO',
        dmData.qryEmployeeDEPT_NO.Value, []);
      if ShowModal = mrOk then
        with dmData do
          begin
            if not (qryEmployee.State in [dsEdit, dsInsert]) then
              qryEmployee.Edit;
            qryEmployeeDEPT_NO.Value :=  qryDepartment.Fields[0].Value;
            qryEmployeeDEPARTMENT.Value := qryDepartment.Fields[1].Value;
          end;
    finally
      Free;
    end
  else
    with TfrmJobs.Create(Self) do
    try
      with dmData do
        qryJob.Locate('JOB_CODE;JOB_GRADE;JOB_COUNTRY',
          VarArrayOf([qryEmployeeJOB_CODE.Value,qryEmployeeJOB_GRADE.Value,
          qryEmployeeJOB_COUNTRY.Value]), []);
      if ShowModal = mrOk then
        with dmData do
        begin
          if not (qryEmployee.State in [dsEdit, dsInsert]) then
            qryEmployee.Edit;
          qryEmployeeJOB_CODE.Value :=  qryJob.Fields[0].Value;
          qryEmployeeJOB_GRADE.Value := qryJob.Fields[1].Value;
          qryEmployeeJOB_COUNTRY.Value := qryJob.Fields[2].Value;
          qryEmployeeJOB_TITLE.Value := qryJob.Fields[3].Value;
          // set salary to min_salary
          qryEmployeeSALARY.Value := qryJob.Fields[4].Value;
        end;
    finally
      Free;
    end;
end;

procedure TMainForm.btnApplyClick(Sender: TObject);
begin
  with dmData do
    if qryEmployee.UpdatesPending then
    begin
      AppDB.ApplyUpdates([qryEmployee]);
      // refresh data
      qryEmployee.Close;
      qryEmployee.Open;
      btnApply.Enabled := False;
    end;
end;

end.
