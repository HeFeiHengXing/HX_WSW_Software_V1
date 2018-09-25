object YYRepoForm: TYYRepoForm
  Left = 341
  Top = 199
  BorderStyle = bsDialog
  Caption = #38452#38451#24615#25253#21578#27604#29575
  ClientHeight = 464
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 12
    Top = 26
    Width = 24
    Height = 12
    Caption = #33740#23646
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 12
    Top = 56
    Width = 24
    Height = 12
    Caption = #31185#23460
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 10
    Top = 90
    Width = 48
    Height = 12
    Caption = #26631#26412#31867#22411
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 10
    Top = 124
    Width = 48
    Height = 12
    Caption = #36865#26816#30446#30340
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 12
    Top = 312
    Width = 156
    Height = 26
    Caption = #27880#65306#37492#23450#20998#26512#25353#38451#24615#25253#21578#36827#34892#32479#35745#12290
    WordWrap = True
  end
  object StringGrid1: TStringGrid
    Left = 195
    Top = 1
    Width = 506
    Height = 228
    ColCount = 3
    RowCount = 4
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing]
    TabOrder = 6
  end
  object BitBtn1: TBitBtn
    Left = 10
    Top = 240
    Width = 75
    Height = 25
    Caption = #26597#35810
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object dbc_sjmd: TComboBox
    Left = 66
    Top = 119
    Width = 125
    Height = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 96
    Top = 271
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 95
    Top = 240
    Width = 75
    Height = 25
    Caption = #25171#21360' '
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object Button1: TButton
    Left = 11
    Top = 272
    Width = 74
    Height = 25
    Caption = #23548#20986'EXCEL'
    TabOrder = 5
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 10
    Top = 146
    Width = 179
    Height = 87
    Caption = #26102#38388#33539#22260
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 42
      Width = 12
      Height = 13
      Caption = #33267
    end
    object DateTimePicker1: TDateTimePicker
      Left = 6
      Top = 16
      Width = 125
      Height = 20
      Date = 39814.864669791700000000
      Time = 39814.864669791700000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 6
      Top = 58
      Width = 125
      Height = 20
      Date = 39814.864709664400000000
      Time = 39814.864709664400000000
      TabOrder = 1
    end
  end
  object dbc_bb: TComboBox
    Left = 66
    Top = 86
    Width = 125
    Height = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 7
  end
  object dbc_section: TComboBox
    Left = 66
    Top = 52
    Width = 125
    Height = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 8
  end
  object dbc_germtype: TComboBox
    Left = 66
    Top = 20
    Width = 125
    Height = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 9
  end
  object StringGrid2: TStringGrid
    Left = 195
    Top = 236
    Width = 506
    Height = 221
    ColCount = 3
    FixedCols = 0
    RowCount = 4
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing]
    TabOrder = 10
  end
  object ADODataSet1: TADODataSet
    Connection = dmym.conn
    Parameters = <>
    Left = 590
    Top = 170
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    Left = 590
    Top = 200
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Rave Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    OnPrint = RvSystem1Print
    Left = 590
    Top = 228
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 590
    Top = 260
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 590
    Top = 292
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 590
    Top = 324
  end
end
