object dmym: Tdmym
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 3
  Top = 3
  Height = 448
  Width = 638
  object conn: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 17
    Top = 4
  end
  object rsYpPatient: TADODataSet
    Connection = conn
    Parameters = <>
    Left = 21
    Top = 58
  end
  object query1: TADOQuery
    Connection = conn
    Parameters = <>
    Left = 23
    Top = 330
  end
  object subQuery: TADOQuery
    Connection = conn
    Parameters = <>
    Left = 213
    Top = 272
  end
  object rsBase: TADODataSet
    Connection = conn
    CursorType = ctStatic
    CommandText = 'select * from base'#13#10
    Parameters = <>
    Left = 83
    Top = 58
  end
  object dsBase: TDataSource
    DataSet = rsBase
    Left = 146
    Top = 58
  end
  object rsRegBB: TADODataSet
    Connection = conn
    CursorType = ctStatic
    CommandText = 'select * from regBBlc  order by  cydate  '
    Parameters = <>
    Left = 21
    Top = 110
  end
  object dsRegBB: TDataSource
    DataSet = rsRegBB
    Left = 84
    Top = 110
  end
  object rsCheck: TADODataSet
    Connection = conn
    CursorType = ctStatic
    AfterOpen = rsCheckAfterOpen
    CommandText = 'select name,gl from cgj where bm='#39'00000'#39
    FieldDefs = <>
    Parameters = <>
    StoreDefs = True
    Left = 148
    Top = 166
  end
  object dsCheck: TDataSource
    DataSet = rsCheck
    Left = 212
    Top = 166
  end
  object rsRegYg: TADODataSet
    Connection = conn
    CursorType = ctStatic
    CommandText = 'select * from regBByngr'
    Parameters = <>
    Left = 21
    Top = 164
  end
  object dsRegYg: TDataSource
    DataSet = rsRegYg
    Left = 87
    Top = 164
  end
  object rsRegZk: TADODataSet
    Connection = conn
    CursorType = ctStatic
    CommandText = 'select * from regbbZk order by  cydate'
    Parameters = <>
    Left = 209
    Top = 58
  end
  object dsRegZk: TDataSource
    DataSet = rsRegZk
    Left = 272
    Top = 58
  end
  object rsgermtype: TADODataSet
    Connection = conn
    CommandText = 'select * from GermType order by germIndex'
    Parameters = <>
    Left = 85
    Top = 216
  end
  object dsgermtype: TDataSource
    DataSet = rsgermtype
    Left = 148
    Top = 216
  end
  object rsHospital: TADODataSet
    Connection = conn
    CursorType = ctStatic
    CommandText = 'select * from hospital  order by reportdate desc,Specnum ASC'
    Parameters = <>
    Left = 211
    Top = 216
  end
  object dsHospital: TDataSource
    DataSet = rsHospital
    Left = 274
    Top = 216
  end
  object exQuery: TADOQuery
    Connection = conn
    Parameters = <>
    Left = 277
    Top = 272
  end
  object rsYx: TADODataSet
    CommandText = 'select * from yx '
    Parameters = <>
    Left = 274
    Top = 110
  end
  object rsGermName: TADODataSet
    Connection = conn
    CursorType = ctStatic
    CommandText = 'select * from xjname'
    Parameters = <>
    Left = 147
    Top = 110
  end
  object dsGermName: TDataSource
    DataSet = rsGermName
    Left = 210
    Top = 110
  end
  object rsBaseZk: TADODataSet
    Connection = conn
    CursorType = ctStatic
    CommandText = 'select * from baseZK order by repdate desc'
    Parameters = <>
    Left = 208
    Top = 4
  end
  object dsBaseZk: TDataSource
    DataSet = rsBaseZk
    Left = 272
    Top = 4
  end
  object dsaddTemp: TDataSource
    DataSet = rsAddTemp
    Left = 24
    Top = 272
  end
  object rsAdd: TADOTable
    Connection = conn
    TableName = 'YpAdd'
    Left = 150
    Top = 272
  end
  object rsAddTemp: TADOTable
    Connection = conn
    TableName = 'YpAddTmp'
    Left = 87
    Top = 272
  end
  object loginName: TADOQuery
    Connection = conn
    Parameters = <>
    Left = 23
    Top = 216
  end
  object fuzhuqy: TADOQuery
    Connection = conn
    Parameters = <>
    Left = 274
    Top = 168
  end
  object LSADODataSet1: TADODataSet
    Connection = conn
    CursorType = ctStatic
    CommandText = 'select * from base'#13#10
    Parameters = <>
    Left = 80
    Top = 4
  end
  object LSDataSource1: TDataSource
    DataSet = LSADODataSet1
    Left = 144
    Top = 4
  end
  object dssection: TDataSource
    DataSet = rssection
    Left = 150
    Top = 328
  end
  object dssample: TDataSource
    DataSet = rssample
    Left = 280
    Top = 328
  end
  object rssection: TADODataSet
    Connection = conn
    CommandText = 'select * from secname order by secid'
    Parameters = <>
    Left = 86
    Top = 330
  end
  object rssample: TADODataSet
    Connection = conn
    CommandText = 'select * from bb  order by  ID '
    Parameters = <>
    Left = 214
    Top = 328
  end
  object rsbase1: TADODataSet
    Connection = conn
    CursorType = ctStatic
    CommandText = 'select * from base'#13#10
    Parameters = <>
    Left = 23
    Top = 386
  end
  object dsbase1: TDataSource
    DataSet = rsbase1
    Left = 86
    Top = 386
  end
end
