object bbDistributeForm: TbbDistributeForm
  Left = 413
  Top = 177
  BorderStyle = bsDialog
  Caption = #26631#26412#20998#24067
  ClientHeight = 511
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 511
    Align = alLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 18
      Top = 26
      Width = 24
      Height = 12
      Caption = #33740#23646
    end
    object Label2: TLabel
      Left = 18
      Top = 60
      Width = 24
      Height = 12
      Caption = #31185#23460
    end
    object Label4: TLabel
      Left = 16
      Top = 92
      Width = 48
      Height = 12
      Caption = #26631#26412#31867#22411
    end
    object rdgSelect: TRadioGroup
      Left = 14
      Top = 124
      Width = 177
      Height = 41
      Hint = #24635#23646#21482#32479#35745#21508#23646#22312#26631#26412#20013#20998#24067#65292#35814#21333#21017#21015#20986#35813#23646#20840#37096#32454#33740
      Caption = #32479#35745#26041#24335
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #32454#33740#24635#23646
        #21015#20986#35814#21333)
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object btnQryData: TBitBtn
      Left = 12
      Top = 274
      Width = 72
      Height = 25
      Caption = #26597#35810'(&Q)'
      TabOrder = 1
      OnClick = btnQryDataClick
      NumGlyphs = 2
    end
    object btnPrint: TButton
      Left = 96
      Top = 274
      Width = 72
      Height = 25
      Caption = #25171#21360'(&P)'
      TabOrder = 2
      OnClick = btnPrintClick
    end
    object GroupBox1: TGroupBox
      Left = 14
      Top = 180
      Width = 177
      Height = 79
      Caption = #26102#38388#33539#22260
      TabOrder = 3
      object Label3: TLabel
        Left = 6
        Top = 38
        Width = 12
        Height = 12
        Caption = #33267
      end
      object dtpBegDate: TDateTimePicker
        Left = 2
        Top = 16
        Width = 131
        Height = 20
        Date = 36837.864669791700000000
        Time = 36837.864669791700000000
        TabOrder = 0
      end
      object dtpEndDate: TDateTimePicker
        Left = 2
        Top = 56
        Width = 131
        Height = 20
        Date = 36837.864709664400000000
        Time = 36837.864709664400000000
        TabOrder = 1
      end
    end
    object Button1: TButton
      Left = 96
      Top = 310
      Width = 73
      Height = 25
      Caption = #36864#20986
      TabOrder = 4
      OnClick = Button1Click
    end
    object dbc_germtype: TComboBox
      Left = 68
      Top = 22
      Width = 125
      Height = 20
      ItemHeight = 12
      TabOrder = 5
    end
    object dbc_section: TComboBox
      Left = 68
      Top = 58
      Width = 125
      Height = 20
      ItemHeight = 12
      TabOrder = 6
    end
    object dbc_bb: TComboBox
      Left = 68
      Top = 90
      Width = 125
      Height = 20
      ItemHeight = 12
      TabOrder = 7
    end
    object btnToExcel: TButton
      Left = 10
      Top = 310
      Width = 75
      Height = 25
      Caption = #23548#20986'EXCEL'
      TabOrder = 8
      OnClick = btnToExcelClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 226
    Top = 0
    Width = 575
    Height = 507
    DataSource = dsdata
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
  end
  object rstData: TADODataSet
    Connection = dmym.conn
    CursorType = ctStatic
    FieldDefs = <
      item
        Name = 'GermIndex'
        DataType = ftWideString
        Size = 2
      end
      item
        Name = 'GermType'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'bnum'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'bmod'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'blen'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'tbName'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'boardType'
        Attributes = [faFixed]
        DataType = ftBoolean
      end
      item
        Name = 'maxerror'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'IsReadBoard'
        DataType = ftWideString
        Size = 1
      end>
    Parameters = <>
    StoreDefs = True
    Left = 392
    Top = 96
  end
  object dsdata: TDataSource
    DataSet = rstData
    Left = 400
    Top = 136
  end
  object tbYear: TADOTable
    Connection = dmym.conn
    CursorType = ctStatic
    TableName = 'TmpCheck'
    Left = 392
    Top = 280
  end
  object dsYear: TDataSource
    DataSet = tbYear
    Left = 424
    Top = 280
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
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    OnPrint = RvSystem1Print
    Left = 362
    Top = 346
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 296
    Top = 376
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 288
    Top = 344
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 320
    Top = 344
  end
end
