object DataModule1: TDataModule1
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 251
  Width = 486
  object ADOConnection1: TADOConnection
    Left = 216
    Top = 32
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 120
    Top = 96
  end
  object DataSourceUser: TDataSource
    Left = 360
    Top = 192
  end
  object ADOQueryUser: TADOQuery
    Parameters = <>
    Left = 360
    Top = 96
  end
  object ADODataSetUser: TADODataSet
    Parameters = <>
    Left = 120
    Top = 192
  end
end
