�
 TDBAFORM 0c  TPF0TDbaFormDbaFormLeft� TopmWidth�Height!CaptionDbAware2 (MS Access)Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	OnCreate
FormCreatePixelsPerInch`
TextHeight TPanelPanel1Left Top Width�Height)AlignalTopTabOrder  TButtonButton2LeftTopWidthyHeightCaption&Add Random DataTabOrder OnClickButton2Click   TPageControlPageControl1Left Top)Width�Height� 
ActivePage	TabSheet1AlignalClientTabOrder 	TTabSheet	TabSheet1CaptionRecord View TDBTextDBText1LeftPTopWidthHeightAutoSize		DataFieldHireDate
DataSourceDataSource1  TLabelLabel1LeftTopWidth.HeightCaption
Hire date:  TLabelLabel2LeftTop4Width3HeightCaption
&Last NameFocusControlDBEdit1  TLabelLabel3LeftTopPWidth2HeightCaption&First NameFocusControlDBEdit2  TLabelLabel4LeftToppWidth"HeightCaption&BranchFocusControlDBComboBox1  TDBNavigatorDBNavigator1LeftTopWidth� Height
DataSourceDataSource1TabOrder   TDBRadioGroupDBRadioGroup1LeftTop0Width� HeightyCaption&Department	DataField
Department
DataSourceDataSource1Items.StringsSales
Accounting
Production
Management TabOrderValues.Strings1234   TDBCheckBoxDBCheckBox1LeftPTop� WidthQHeightCaption&Senior	DataFieldSenior
DataSourceDataSource1TabOrderValueCheckedTrueValueUncheckedFalse  TDBEditDBEdit1LeftPTop0WidthyHeight	DataFieldLastName
DataSourceDataSource1TabOrder  TDBEditDBEdit2LeftPTopPWidthyHeight	DataField	FirstName
DataSourceDataSource1TabOrder  TDBComboBoxDBComboBox1LeftPToppWidthyHeight	DataFieldBranch
DataSourceDataSource1
ItemHeightItems.Strings	BaltimoreBerlinBostonBrasilia	Cape TownChicagoDallasDenverDublin	Las VegasLondonLos Angeles
LouisvilleMexico CityMiamiMinneapolisMoscowNew OrleansNew YorkOrlandoRomeSalt Lake City	San DiegoSan FranciscoSan JoseSeattle	SingaporeTokioToronto	Vancouver Sorted	TabOrder   	TTabSheet	TabSheet2Caption	Grid View
ImageIndex TDBGridDBGrid1Left Top Width�Height� AlignalClient
DataSourceDataSource1TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style     	TADOTableTable1Active		CacheSize2
ConnectionADOConnectionCursorLocationclUseServer
MaxRecords2TableDirect		TableNameWorkersLeft�Top  TDataSourceDataSource1DataSetTable1LeftXTop  TADOConnectionADOConnection	Connected	ConnectionStringb  Provider=Microsoft.Jet.OLEDB.4.0;Password="";User ID=Admin;Data Source=C:\md5code\Part3\12\data\MdData.mdb;Mode=Share Deny None;Extended Properties="";Locale Identifier=1033;Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=4;Jet OLEDB:Database Locking Mode=0;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don't Copy Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=FalseLoginPromptModecmShareDenyNoneProviderMicrosoft.Jet.OLEDB.4.0Left�Top  TADOCommand
ADOCommandCommandText�create table workers (
  firstname TEXT(30),
  lastname TEXT(30),
  department INTEGER,
  branch TEXT (20),
  senior YESNO,
  hiredate DATETIME);
ConnectionADOConnection
Parameters Left(Top   