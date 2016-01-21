unit IeFirstDm;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, MidItems, Db, DBClient,
  MConnect, SConnect, CompProd, PagItems, MidProd, XMLBrokr;

type
  TWebModule1 = class(TWebModule)
    XMLBroker1: TXMLBroker;
    MidasPageProducer1: TMidasPageProducer;
    DataForm1: TDataForm;
    DataGrid1: TDataGrid;
    DataNavigator1: TDataNavigator;
    DCOMConnection1: TDCOMConnection;
    PageProducer1: TPageProducer;
    procedure XMLBroker1GetResponse(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.DFM}

procedure TWebModule1.XMLBroker1GetResponse(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := '<h1>Updated</h1><p>' +
    MidasPageProducer1.Content;
  Handled := True;
end;

end.
