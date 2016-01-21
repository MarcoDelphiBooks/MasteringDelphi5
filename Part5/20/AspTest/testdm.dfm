object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 240
  Top = 215
  Height = 480
  Width = 696
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'employee.db'
    Left = 56
    Top = 32
  end
  object DataSetTableProducer1: TDataSetTableProducer
    MaxRows = -1
    DataSet = Table1
    Left = 56
    Top = 80
  end
end
