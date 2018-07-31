object SpecDistForm: TSpecDistForm
  Left = 223
  Top = 123
  BorderStyle = bsDialog
  Caption = #24635#20307#25239#29983#32032#25928#33021#32479#35745
  ClientHeight = 534
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 221
    Height = 534
    Align = alLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 24
      Height = 12
      Caption = #33740#23646
    end
    object Label2: TLabel
      Left = 8
      Top = 60
      Width = 24
      Height = 12
      Caption = #31185#23460
    end
    object Label3: TLabel
      Left = 8
      Top = 92
      Width = 48
      Height = 12
      Caption = #26631#26412#31867#22411
    end
    object Label6: TLabel
      Left = 10
      Top = 124
      Width = 24
      Height = 12
      Caption = #32454#33740
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Dbc_GermType: TComboBox
      Left = 68
      Top = 24
      Width = 145
      Height = 20
      ItemHeight = 12
      TabOrder = 0
      Text = 'Dbc_GermType'
      OnChange = Dbc_GermTypeChange
    end
    object Dbc_Section: TComboBox
      Left = 68
      Top = 56
      Width = 145
      Height = 20
      ItemHeight = 12
      TabOrder = 1
      Text = 'Dbc_Section'
    end
    object Dbc_Bb: TComboBox
      Left = 68
      Top = 88
      Width = 145
      Height = 20
      ItemHeight = 12
      TabOrder = 2
      Text = 'Dbc_Bb'
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 160
      Width = 205
      Height = 121
      Caption = #26102#38388#33539#22260
      TabOrder = 3
      object Label4: TLabel
        Left = 12
        Top = 52
        Width = 12
        Height = 12
        Caption = #33267
      end
      object DateStart: TDateTimePicker
        Left = 8
        Top = 24
        Width = 186
        Height = 20
        Date = 40347.992836400470000000
        Time = 40347.992836400470000000
        TabOrder = 0
      end
      object DateEnd: TDateTimePicker
        Left = 8
        Top = 76
        Width = 186
        Height = 20
        Date = 40347.992973263890000000
        Time = 40347.992973263890000000
        TabOrder = 1
      end
    end
    object BtnQuery: TButton
      Left = 16
      Top = 296
      Width = 89
      Height = 25
      Caption = #26597#35810
      TabOrder = 4
      OnClick = BtnQueryClick
    end
    object BtnPrint: TButton
      Left = 120
      Top = 296
      Width = 83
      Height = 25
      Caption = #25171#21360
      TabOrder = 5
      OnClick = BtnPrintClick
    end
    object BtnExit: TButton
      Left = 120
      Top = 336
      Width = 85
      Height = 25
      Caption = #36864#20986
      TabOrder = 6
      OnClick = BtnExitClick
    end
    object BtnToExcel: TButton
      Left = 16
      Top = 336
      Width = 89
      Height = 25
      Caption = #23548#20986'EXCEL'
      TabOrder = 7
      OnClick = BtnToExcelClick
    end
    object dbc_xjname: TComboBox
      Left = 68
      Top = 121
      Width = 145
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 12
      ParentFont = False
      TabOrder = 8
    end
  end
  object Panel2: TPanel
    Left = 228
    Top = 0
    Width = 545
    Height = 534
    Align = alRight
    TabOrder = 1
    object StringGrid1: TStringGrid
      Left = 0
      Top = 1
      Width = 526
      Height = 532
      ColCount = 8
      TabOrder = 0
    end
  end
  object RsData: TADODataSet
    Connection = dmym.conn
    Parameters = <>
    Left = 250
    Top = 164
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
    Left = 288
    Top = 164
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 332
    Top = 164
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 388
    Top = 176
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 460
    Top = 192
  end
  object ADOQuery1: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 536
    Top = 188
  end
end
