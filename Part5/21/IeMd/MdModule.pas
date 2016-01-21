unit MdModule;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, MidItems, Db, DBClient,
  MConnect, CompProd, PagItems, MidProd, XMLBrokr;

type
  TWebModule1 = class(TWebModule)
    XMLBroker1: TXMLBroker;
    MidasPageProducer1: TMidasPageProducer;
    DCOMConnection1: TDCOMConnection;
    DataForm1: TDataForm;
    FieldGroup1: TFieldGroup;
    CustNo: TFieldText;
    Company: TFieldText;
    Addr1: TFieldText;
    City: TFieldText;
    State: TFieldText;
    Zip: TFieldText;
    Country: TFieldText;
    Phone: TFieldText;
    TaxRate: TFieldText;
    Contact: TFieldText;
    FieldStatus1: TFieldStatus;
    DataGrid1: TDataGrid;
    SaleDate: TTextColumn;
    EmpNo: TTextColumn;
    PO: TTextColumn;
    Terms: TTextColumn;
    ItemsTotal: TTextColumn;
    AmountPaid: TTextColumn;
    OrderNo: TTextColumn;
    DataNavigator1: TDataNavigator;
    FirstButton1: TFirstButton;
    LastButton1: TLastButton;
    UndoButton1: TUndoButton;
    ApplyUpdatesButton1: TApplyUpdatesButton;
    PriorButton1: TPriorButton;
    NextButton1: TNextButton;
    DataNavigator2: TDataNavigator;
    FirstButton2: TFirstButton;
    PriorPageButton1: TPriorPageButton;
    PriorButton2: TPriorButton;
    NextButton2: TNextButton;
    NextPageButton1: TNextPageButton;
    LastButton2: TLastButton;
    XMLBroker2: TXMLBroker;
    MidasPageProducer2: TMidasPageProducer;
    DataForm2: TDataForm;
    DataNavigator3: TDataNavigator;
    FirstButton3: TFirstButton;
    PriorButton3: TPriorButton;
    NextButton3: TNextButton;
    LastButton3: TLastButton;
    UndoButton2: TUndoButton;
    ApplyUpdatesButton2: TApplyUpdatesButton;
    FieldGroup2: TFieldGroup;
    FieldText1: TFieldText;
    FieldText2: TFieldText;
    FieldText3: TFieldText;
    FieldText4: TFieldText;
    FieldText5: TFieldText;
    FieldText6: TFieldText;
    FieldText7: TFieldText;
    FieldText8: TFieldText;
    FieldText9: TFieldText;
    FieldText10: TFieldText;
    FieldStatus2: TFieldStatus;
    DataNavigator4: TDataNavigator;
    FirstButton4: TFirstButton;
    PriorPageButton2: TPriorPageButton;
    PriorButton4: TPriorButton;
    NextButton4: TNextButton;
    NextPageButton2: TNextPageButton;
    LastButton4: TLastButton;
    DataGrid2: TDataGrid;
    TextColumn1: TTextColumn;
    TextColumn2: TTextColumn;
    TextColumn3: TTextColumn;
    TextColumn4: TTextColumn;
    TextColumn5: TTextColumn;
    TextColumn6: TTextColumn;
    TextColumn7: TTextColumn;
    DCOMConnection2: TDCOMConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.DFM}

end.
