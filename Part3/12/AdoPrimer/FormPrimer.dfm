object Form1: TForm1
  Left = 245
  Top = 179
  Width = 596
  Height = 367
  Caption = 'AdoPrimer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 217
    Width = 588
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 25
    Width = 588
    Height = 192
    Align = alTop
    DataSource = DataModule2.DataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'LAST_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIRST_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACCT_NBR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDRESS_1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CITY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZIP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEPHONE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_OPEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BIRTH_DATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RISK_LEVEL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OCCUPATION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBJECTIVES'
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 588
    Height = 25
    DataSource = DataModule2.DataSource
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
    Align = alTop
    TabOrder = 1
  end
  object DBMemo1: TDBMemo
    Left = 0
    Top = 220
    Width = 588
    Height = 120
    Align = alClient
    DataField = 'INTERESTS'
    DataSource = DataModule2.DataSource
    TabOrder = 2
  end
end
