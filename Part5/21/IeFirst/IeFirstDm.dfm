object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'WebActionItem1'
      PathInfo = '/MidasPageProducer1'
      Producer = MidasPageProducer1
    end>
  Left = 243
  Top = 200
  Height = 480
  Width = 696
  object XMLBroker1: TXMLBroker
    Params = <>
    ProviderName = 'DataSetProvider1'
    RemoteServer = DCOMConnection1
    WebDispatch.MethodType = mtAny
    WebDispatch.PathInfo = 'XMLBroker1'
    ReconcileProducer = PageProducer1
    OnGetResponse = XMLBroker1GetResponse
    Left = 64
    Top = 96
  end
  object MidasPageProducer1: TMidasPageProducer
    HTMLDoc.Strings = (
      '<HTML>'
      '<HEAD>'
      '</HEAD>'
      '<BODY>'
      '<#INCLUDES><#STYLES><#WARNINGS><#FORMS><#SCRIPT>'
      '</BODY>'
      '</HTML>')
    IncludePathURL = 'C:/Program Files/Borland/Delphi5/Source/Webmidas/'
    Left = 64
    Top = 152
    object DataForm1: TDataForm
      object DataGrid1: TDataGrid
        XMLBroker = XMLBroker1
        DisplayRows = 8
        TableAttributes.CellSpacing = 0
      end
      object DataNavigator1: TDataNavigator
        XMLComponent = DataGrid1
      end
    end
  end
  object DCOMConnection1: TDCOMConnection
    Connected = True
    ServerGUID = '{09E11D63-4A55-11D3-B9F1-00000100A27B}'
    ServerName = 'AppServ1.AppServerOne'
    Left = 64
    Top = 40
  end
  object PageProducer1: TPageProducer
    HTMLDoc.Strings = (
      '<h1>Update Errors</h1>'
      ''
      '<p>Something went wrong in your udpate request....'
      '<p>Get back to previous page.'
      ''
      ''
      '')
    Left = 136
    Top = 96
  end
end
