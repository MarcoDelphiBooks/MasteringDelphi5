�
 TFORM1 0�  TPF0TForm1Form1LeftTopkWidthtHeight�CaptionBde2AdoColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderOnCreate
FormCreatePixelsPerInch`
TextHeight TListBoxListBox1Left Top!Width� Height�AlignalLeft
ItemHeightTabOrder OnClickListBox1Click  TPanelPanel1Left Top WidthlHeight!AlignalTopTabOrder 	TComboBox	ComboBox1LeftTopWidth� Height
ItemHeightTabOrder OnChangeComboBox1Change  TButtonbtnGetStructureLeft� TopWidthPHeightCaption&Get StructureTabOrderOnClickbtnGetStructureClick  TButtonbtnCreateTableLeft!TopWidthPHeightCaption&Create TableTabOrderOnClickbtnCreateTableClick  TButtonbtnMoveDataLeftxTopWidthPHeightCaption
&Move DataTabOrderOnClickbtnMoveDataClick   TMemoMemo1Left� Top0Width�Height�TabOrder  TADOCommand
ADOCommandCommandText�create table employees (
  EmpNo COUNTER,
  FirstName TEXT(30),
  LastName TEXT(30),
  PhoneExt TEXT (5),
  HireDate DATETIME,
  Salary CURRENCY);
ConnectionADOConnection
Parameters LeftHTop�   TADOConnectionADOConnectionConnectionStringr  Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\md5code\Part3\11\data\MdData.mdb;Mode=Share Deny None;Extended Properties="";Locale Identifier=1033;Persist Security Info=False;Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=4;Jet OLEDB:Database Locking Mode=0;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don't Copy Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=FalseLoginPromptProviderMicrosoft.Jet.OLEDB.4.0LeftHTop�   TTableBDETableLeftHTopX  	TADOTableADOTable
ConnectionADOConnectionLeftHTop   