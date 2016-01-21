unit WMailDm;

interface

uses
  Windows, Messages, SysUtils, Classes, HttpApp, Psock, NMsmtp;

type
  TWebModule1 = class(TWebModule)
    Mail: TNMSMTP;
    procedure WebModule1WebActionItem1Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.DFM}

procedure TWebModule1.WebModule1WebActionItem1Action(
  Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
var
  OutString: string;
begin
  OutString := Request.ContentFields.Values ['firstname'];
  OutString := OutString + ' ' +
    Request.ContentFields.Values ['lastname'];
  OutString := OutString + ' [' +
    Request.ContentFields.Values ['email'] + ']';

  // send email
  Mail.PostMessage.FromAddress := OutString;
  Mail.Connect;
  Mail.SendMail;
  Mail.Disconnect;

  Response.Content := Response.Content +
    '<HTML><HEAD><TITLE>Newsletter</TITLE></HEAD>' +
    '<BODY><H1>Newsletter</H1><H2>Subscription received</H2><hr>' +
    '<H4>You''re registered in our database as <br>' +
    OutString + '</h4>' +
    '</BODY></HTML>';
end;

end.
