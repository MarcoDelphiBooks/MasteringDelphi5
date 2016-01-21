unit DdlForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBTables, Db;

type
  TForm1 = class(TForm)
    Query1: TQuery;
    Database1: TDatabase;
    grpCommands: TRadioGroup;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure grpCommandsClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

const
  MaxCmds = 6;
  Commands: array [0..MaxCmds - 1] of PChar = (
    'CREATE TABLE Customers ('#13'  CUST_NO INTEGER NOT NULL CONSTRAINT CUST_PK PRIMARY KEY,'#13'  FIRSTNAME VARCHAR(30) NOT NULL,'#13'  LASTNAME VARCHAR(30) NOT NULL,'#13'  ADDRESS VARCHAR(30),'#13'  PHONE_NUMBER VARCHAR(20)'#13');',
    'ALTER TABLE Customers DROP CONSTRAINT CUST_PK',
    'CREATE INDEX CUST_NAME ON CUSTOMERS (NAME);',
    'CREATE VIEW FullCustNames (FullName) AS'#13'SELECT (Name || " " || Surname) FROM Customers',
    'CREATE GENERATOR custno_generator;',
    'CREATE TRIGGER SET_CUST_NO FOR CUSTOMERS'#13'BEFORE INSERT POSITION 0 AS'#13'BEGIN'#13'   new.cust_no = gen_id(custno_generator, 1);'#13'END'
  );

procedure TForm1.grpCommandsClick(Sender: TObject);
begin
  Memo1.Lines.SetText(Commands[grpCommands.ItemIndex]);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Query1.SQL.Assign(Memo1.Lines);
  try
    Query1.ExecSQL;
    ShowMessage('SQL command executed successfully.');
  except
    raise;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  grpCommandsClick(nil);
end;

end.
