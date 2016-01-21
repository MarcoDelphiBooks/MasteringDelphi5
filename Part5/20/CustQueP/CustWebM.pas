unit CustWebM;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, Db, DBTables, DBWeb;

type
  TWebModule1 = class(TWebModule)
    QueryTableProducer1: TQueryTableProducer;
    Query1: TQuery;
    Query1Company: TStringField;
    Query1State: TStringField;
    Query1Country: TStringField;
    PageProducer1: TPageProducer;
    Query2: TQuery;
    procedure PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure RecordAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure QueryTableProducer1FormatCell(Sender: TObject; CellRow,
      CellColumn: Integer; var BgColor: THTMLBgColor;
      var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
      CellData: String);
    procedure WebModule1BeforeDispatch(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    ScriptName: string;
  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.DFM}

procedure TWebModule1.PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if TagString = 'script' then
    ReplaceText := ScriptName
  else
  begin
    ReplaceText := '';
    Query2.SQL.Clear;
    Query2.SQL.Add ('select distinct ' +
      TagString + ' from customer');
    try
      Query2.Open;
      try
        Query2.First;
        while not Query2.EOF do
        begin
          ReplaceText := ReplaceText +
            '<option>' + Query2.Fields[0].AsString +
            '</option>'#13;
          Query2.Next;
        end;
      finally
        Query2.Close;
      end;
    except
      ReplaceText := '{wrong field: ' + TagString + '}';
    end;
  end;
end;

procedure TWebModule1.RecordAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  I: Integer;
begin
  if Request.QueryFields.Count = 0 then
    Response.Content := 'Record not found'
  else
  begin
    Query2.SQL.Clear;
    Query2.SQL.Add ('select * from customer ' +
      'where Company="' + Request.QueryFields[0] + '"');
    Query2.Open;
    Response.Content :=
      '<HTML><HEAD><TITLE>Customer Record</TITLE></HEAD><BODY>'#13 +
      '<H1>Customer Record: ' + Request.QueryFields[0] +
      '</H1>'#13 +
      '<table border>'#13;
    for I := 1 to Query2.FieldCount - 1 do
      Response.Content := Response.Content +
        '<tr><td>' + Query2.Fields [I].FieldName +
        '</td>'#13'<td>' + Query2.Fields [I].AsString +
        '</td></tr>'#13;
    Response.Content := Response.Content +
      '</table><hr>'#13 +
      // pointer to the query form
      '<a HREF="' + ScriptName + '/form">' +
      ' Next Query </a>'#13 +
      '</BODY></HTML>'#13;
  end;
end;

procedure TWebModule1.QueryTableProducer1FormatCell(Sender: TObject;
  CellRow, CellColumn: Integer; var BgColor: THTMLBgColor;
  var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
  CellData: String);
begin
  if (CellColumn = 0) and (CellRow <> 0) then
    CellData := '<a HREF="' + Request.ScriptName +
      '/record?' + CellData + '">' + CellData + '</a>'#13;
end;

procedure TWebModule1.WebModule1BeforeDispatch(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  ScriptName := Request.ScriptName;
end;

end.
