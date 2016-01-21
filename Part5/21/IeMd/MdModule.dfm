object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'WebActionItem1'
      PathInfo = '/MidasPageProducer1'
      Producer = MidasPageProducer1
    end>
  Left = 208
  Top = 183
  Height = 480
  Width = 696
  object XMLBroker1: TXMLBroker
    Params = <>
    ProviderName = 'ProviderCustomer'
    RemoteServer = DCOMConnection1
    WebDispatch.PathInfo = 'XMLBroker1'
    Left = 48
    Top = 64
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
    Left = 48
    Top = 112
    object DataForm1: TDataForm
      object DataNavigator1: TDataNavigator
        XMLComponent = FieldGroup1
        object FirstButton1: TFirstButton
          XMLComponent = FieldGroup1
          Caption = '|<'
        end
        object PriorButton1: TPriorButton
          XMLComponent = FieldGroup1
          Caption = '<'
        end
        object NextButton1: TNextButton
          XMLComponent = FieldGroup1
          Caption = '>'
        end
        object LastButton1: TLastButton
          XMLComponent = FieldGroup1
          Caption = '>|'
        end
        object UndoButton1: TUndoButton
          XMLComponent = FieldGroup1
          Caption = 'Undo'
        end
        object ApplyUpdatesButton1: TApplyUpdatesButton
          Caption = 'Apply Updates'
          XMLBroker = XMLBroker1
          XMLUseParent = True
        end
      end
      object FieldGroup1: TFieldGroup
        XMLBroker = XMLBroker1
        object CustNo: TFieldText
          DisplayWidth = 10
          Caption = 'CustNo'
          FieldName = 'CustNo'
        end
        object Company: TFieldText
          DisplayWidth = 30
          Caption = 'Company'
          FieldName = 'Company'
        end
        object Addr1: TFieldText
          DisplayWidth = 30
          Caption = 'Addr1'
          FieldName = 'Addr1'
        end
        object City: TFieldText
          DisplayWidth = 15
          Caption = 'City'
          FieldName = 'City'
        end
        object State: TFieldText
          DisplayWidth = 20
          Caption = 'State'
          FieldName = 'State'
        end
        object Zip: TFieldText
          DisplayWidth = 10
          Caption = 'Zip'
          FieldName = 'Zip'
        end
        object Country: TFieldText
          DisplayWidth = 20
          Caption = 'Country'
          FieldName = 'Country'
        end
        object Phone: TFieldText
          DisplayWidth = 15
          Caption = 'Phone'
          FieldName = 'Phone'
        end
        object TaxRate: TFieldText
          DisplayWidth = 10
          Caption = 'TaxRate'
          FieldName = 'TaxRate'
        end
        object Contact: TFieldText
          DisplayWidth = 20
          Caption = 'Contact'
          FieldName = 'Contact'
        end
        object FieldStatus1: TFieldStatus
          Caption = 'Updated'
        end
      end
      object DataNavigator2: TDataNavigator
        XMLComponent = DataGrid1
        object FirstButton2: TFirstButton
          XMLComponent = DataGrid1
          Caption = '|<'
        end
        object PriorPageButton1: TPriorPageButton
          XMLComponent = DataGrid1
          Caption = '<<'
        end
        object PriorButton2: TPriorButton
          XMLComponent = DataGrid1
          Caption = '<'
        end
        object NextButton2: TNextButton
          XMLComponent = DataGrid1
          Caption = '>'
        end
        object NextPageButton1: TNextPageButton
          XMLComponent = DataGrid1
          Caption = '>>'
        end
        object LastButton2: TLastButton
          XMLComponent = DataGrid1
          Caption = '>|'
        end
      end
      object DataGrid1: TDataGrid
        XMLBroker = XMLBroker1
        XMLDataSetField = 'TableOrders'
        DisplayRows = 8
        object OrderNo: TTextColumn
          DisplayWidth = 10
          Caption = 'OrderNo'
          FieldName = 'OrderNo'
        end
        object SaleDate: TTextColumn
          DisplayWidth = 18
          Caption = 'SaleDate'
          FieldName = 'SaleDate'
        end
        object EmpNo: TTextColumn
          DisplayWidth = 10
          Caption = 'EmpNo'
          FieldName = 'EmpNo'
        end
        object PO: TTextColumn
          DisplayWidth = 15
          Caption = 'PO'
          FieldName = 'PO'
        end
        object Terms: TTextColumn
          DisplayWidth = 6
          Caption = 'Terms'
          FieldName = 'Terms'
        end
        object ItemsTotal: TTextColumn
          DisplayWidth = 10
          Caption = 'ItemsTotal'
          FieldName = 'ItemsTotal'
        end
        object AmountPaid: TTextColumn
          DisplayWidth = 10
          Caption = 'AmountPaid'
          FieldName = 'AmountPaid'
        end
      end
    end
  end
  object DCOMConnection1: TDCOMConnection
    Connected = True
    ServerGUID = '{E31849A9-4A82-11D3-B9F1-00000100A27B}'
    ServerName = 'AppSPlus.AppServerPlus'
    Left = 48
    Top = 16
  end
  object XMLBroker2: TXMLBroker
    Params = <>
    ProviderName = 'ProviderCustomer'
    RemoteServer = DCOMConnection2
    WebDispatch.PathInfo = 'XMLBroker1'
    Left = 48
    Top = 64
  end
  object MidasPageProducer2: TMidasPageProducer
    HTMLDoc.Strings = (
      '<HTML>'
      '<HEAD>'
      '</HEAD>'
      '<BODY>'
      '<#INCLUDES><#STYLES><#WARNINGS><#FORMS><#SCRIPT>'
      '</BODY>'
      '</HTML>')
    IncludePathURL = 'C:/Program Files/Borland/Delphi5/Source/Webmidas/'
    Left = 48
    Top = 112
    object DataForm2: TDataForm
      object DataNavigator3: TDataNavigator
        XMLComponent = FieldGroup2
        object FirstButton3: TFirstButton
          XMLComponent = FieldGroup2
          Caption = '|<'
        end
        object PriorButton3: TPriorButton
          XMLComponent = FieldGroup2
          Caption = '<'
        end
        object NextButton3: TNextButton
          XMLComponent = FieldGroup2
          Caption = '>'
        end
        object LastButton3: TLastButton
          XMLComponent = FieldGroup2
          Caption = '>|'
        end
        object UndoButton2: TUndoButton
          XMLComponent = FieldGroup2
          Caption = 'Undo'
        end
        object ApplyUpdatesButton2: TApplyUpdatesButton
          Caption = 'Apply Updates'
          XMLBroker = XMLBroker2
          XMLUseParent = True
        end
      end
      object FieldGroup2: TFieldGroup
        XMLBroker = XMLBroker2
        object FieldText1: TFieldText
          DisplayWidth = 10
          Caption = 'CustNo'
          FieldName = 'CustNo'
        end
        object FieldText2: TFieldText
          DisplayWidth = 30
          Caption = 'Company'
          FieldName = 'Company'
        end
        object FieldText3: TFieldText
          DisplayWidth = 30
          Caption = 'Addr1'
          FieldName = 'Addr1'
        end
        object FieldText4: TFieldText
          DisplayWidth = 15
          Caption = 'City'
          FieldName = 'City'
        end
        object FieldText5: TFieldText
          DisplayWidth = 20
          Caption = 'State'
          FieldName = 'State'
        end
        object FieldText6: TFieldText
          DisplayWidth = 10
          Caption = 'Zip'
          FieldName = 'Zip'
        end
        object FieldText7: TFieldText
          DisplayWidth = 20
          Caption = 'Country'
          FieldName = 'Country'
        end
        object FieldText8: TFieldText
          DisplayWidth = 15
          Caption = 'Phone'
          FieldName = 'Phone'
        end
        object FieldText9: TFieldText
          DisplayWidth = 10
          Caption = 'TaxRate'
          FieldName = 'TaxRate'
        end
        object FieldText10: TFieldText
          DisplayWidth = 20
          Caption = 'Contact'
          FieldName = 'Contact'
        end
        object FieldStatus2: TFieldStatus
          Caption = 'Updated'
        end
      end
      object DataNavigator4: TDataNavigator
        XMLComponent = DataGrid2
        object FirstButton4: TFirstButton
          XMLComponent = DataGrid2
          Caption = '|<'
        end
        object PriorPageButton2: TPriorPageButton
          XMLComponent = DataGrid2
          Caption = '<<'
        end
        object PriorButton4: TPriorButton
          XMLComponent = DataGrid2
          Caption = '<'
        end
        object NextButton4: TNextButton
          XMLComponent = DataGrid2
          Caption = '>'
        end
        object NextPageButton2: TNextPageButton
          XMLComponent = DataGrid2
          Caption = '>>'
        end
        object LastButton4: TLastButton
          XMLComponent = DataGrid2
          Caption = '>|'
        end
      end
      object DataGrid2: TDataGrid
        XMLBroker = XMLBroker2
        XMLDataSetField = 'TableOrders'
        DisplayRows = 8
        object TextColumn1: TTextColumn
          DisplayWidth = 10
          Caption = 'OrderNo'
          FieldName = 'OrderNo'
        end
        object TextColumn2: TTextColumn
          DisplayWidth = 18
          Caption = 'SaleDate'
          FieldName = 'SaleDate'
        end
        object TextColumn3: TTextColumn
          DisplayWidth = 10
          Caption = 'EmpNo'
          FieldName = 'EmpNo'
        end
        object TextColumn4: TTextColumn
          DisplayWidth = 15
          Caption = 'PO'
          FieldName = 'PO'
        end
        object TextColumn5: TTextColumn
          DisplayWidth = 6
          Caption = 'Terms'
          FieldName = 'Terms'
        end
        object TextColumn6: TTextColumn
          DisplayWidth = 10
          Caption = 'ItemsTotal'
          FieldName = 'ItemsTotal'
        end
        object TextColumn7: TTextColumn
          DisplayWidth = 10
          Caption = 'AmountPaid'
          FieldName = 'AmountPaid'
        end
      end
    end
  end
  object DCOMConnection2: TDCOMConnection
    Connected = True
    ServerGUID = '{E31849A9-4A82-11D3-B9F1-00000100A27B}'
    ServerName = 'AppSPlus.AppServerPlus'
    Left = 48
    Top = 16
  end
end
