unit aspobj1;

interface

uses
  ComObj, ActiveX, AspTlb, StdVcl, AspTest_TLB;

type
  Tasptest = class(TASPObject, IAspTest1)
  protected
    procedure OnEndPage; safecall;
    procedure OnStartPage(const AScriptingContext: IUnknown); safecall;
    procedure ShowData; safecall;
    procedure ShowTable; safecall;
    procedure Hello; safecall;
  private
    StartTime: TDateTime;
  end;

implementation

uses ComServ, testdm, SysUtils;

procedure Tasptest.Hello;
var
  strName: string;
begin
  strName := Session ['UserName'];
  Response.Write ('<h3>Hello, ' + strName + '</h3>');
  Response.Write ('<p>Page started at ' + TimeToStr (StartTime));
end;

procedure Tasptest.OnEndPage;
begin
  inherited OnEndPage;
end;

procedure Tasptest.OnStartPage(const AScriptingContext: IUnknown);
begin
  inherited OnStartPage(AScriptingContext);
  StartTime := Now;
end;

procedure Tasptest.ShowData;
begin
  Response.Write ('<h3>Delphi wrote this text</h3>');
end;

procedure Tasptest.ShowTable;
begin
  DataModule1 := TDataModule1.Create (nil);
  try
    Response.Write (DataModule1.DataSetTableProducer1.Content)
  finally
    DataModule1.Free;
  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, Tasptest, CLASS_AspTest1_,
    ciMultiInstance, tmApartment);
end.
