object antibioForm: TantibioForm
  Left = 477
  Top = 226
  BorderStyle = bsDialog
  Caption = #25239#29983#32032#25928#33021
  ClientHeight = 559
  ClientWidth = 860
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 225
    Top = 0
    Height = 559
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 559
    Align = alLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 80
      Width = 75
      Height = 13
      Caption = #35831#36873#25321#33740#23646'     '
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 120
      Width = 209
      Height = 73
      Caption = #26102#38388#33539#22260
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 52
        Width = 48
        Height = 13
        Caption = #32467#26463#26102#38388
      end
      object Label5: TLabel
        Left = 8
        Top = 28
        Width = 48
        Height = 13
        Caption = #24320#22987#26102#38388
      end
      object dtpBegDate: TDateTimePicker
        Left = 72
        Top = 24
        Width = 105
        Height = 21
        Date = 36840.997245509300000000
        Time = 36840.997245509300000000
        TabOrder = 0
      end
      object dtpEndDate: TDateTimePicker
        Left = 72
        Top = 48
        Width = 105
        Height = 21
        Date = 36840.997275995400000000
        Time = 36840.997275995400000000
        TabOrder = 1
      end
    end
    object btnQryData: TBitBtn
      Left = 16
      Top = 276
      Width = 72
      Height = 25
      Caption = #26597#35810'(&Q)'
      TabOrder = 1
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object btnPrint: TButton
      Left = 88
      Top = 276
      Width = 72
      Height = 25
      Caption = #25171#21360'(&P)'
      TabOrder = 2
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 208
      Width = 209
      Height = 57
      Caption = #25239#29983#32032#21517#31216
      TabOrder = 3
      object dlcAnti: TDBLookupComboBox
        Left = 8
        Top = 24
        Width = 193
        Height = 21
        KeyField = 'ypmc'
        ListField = 'ypmc'
        TabOrder = 0
      end
    end
    object dlcGermType: TDBLookupComboBox
      Left = 88
      Top = 80
      Width = 113
      Height = 21
      KeyField = 'GermType'
      ListField = 'GermType'
      TabOrder = 4
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 225
      Height = 557
      Align = alLeft
      TabOrder = 5
      object Label2: TLabel
        Left = 14
        Top = 24
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
      object Label7: TLabel
        Left = 14
        Top = 60
        Width = 24
        Height = 12
        Caption = #21697#31181
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 14
        Top = 92
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
      object Label4: TLabel
        Left = 12
        Top = 544
        Width = 6
        Height = 12
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 8
        Top = 448
        Width = 192
        Height = 39
        Caption = #27880#65306#26412#26597#35810#21482#25552#20379#21333#31181#33647#29289#25171#21360#12290#22914#26524#26597#35810#20840#37096#33647#29289#30340#25171#21360#65292#35831#23548#20986#25253#34920#21040'Excel'#25171#21360#12290
        WordWrap = True
      end
      object Label6: TLabel
        Left = 14
        Top = 128
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
      object GroupBox3: TGroupBox
        Left = 14
        Top = 250
        Width = 195
        Height = 83
        Caption = #26102#38388#33539#22260
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
        object Label11: TLabel
          Left = 12
          Top = 38
          Width = 12
          Height = 13
          Caption = #33267
        end
        object dateStart: TDateTimePicker
          Left = 2
          Top = 16
          Width = 141
          Height = 21
          Date = 0.997245509301137700
          Time = 0.997245509301137700
          TabOrder = 0
        end
        object dateEnd: TDateTimePicker
          Left = 2
          Top = 54
          Width = 141
          Height = 21
          Date = 0.997275995403470000
          Time = 0.997275995403470000
          TabOrder = 1
        end
      end
      object Button1: TButton
        Left = 89
        Top = 347
        Width = 69
        Height = 25
        Caption = #25171#21360'(&P)'
        TabOrder = 6
        OnClick = Button1Click
      end
      object BitBtn3: TBitBtn
        Left = 11
        Top = 347
        Width = 66
        Height = 25
        Caption = #26597'   '#35810
        TabOrder = 4
        OnClick = BitBtn3Click
      end
      object RadioButton1: TRadioButton
        Left = 12
        Top = 223
        Width = 49
        Height = 17
        Caption = #25935#24863
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = RadioButton4Click
      end
      object RadioButton2: TRadioButton
        Left = 62
        Top = 223
        Width = 49
        Height = 17
        Caption = #20013#20171' '
        TabOrder = 2
        OnClick = RadioButton4Click
      end
      object RadioButton3: TRadioButton
        Left = 114
        Top = 223
        Width = 57
        Height = 17
        Caption = #32784#33647'   '
        TabOrder = 3
        OnClick = RadioButton4Click
      end
      object Button2: TButton
        Left = 10
        Top = 378
        Width = 148
        Height = 25
        Caption = #32467#26524#30334#20998#27604#32479#35745
        TabOrder = 5
        OnClick = Button2Click
      end
      object dbc_germtype: TComboBox
        Left = 76
        Top = 20
        Width = 129
        Height = 20
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 12
        ParentFont = False
        TabOrder = 7
        OnChange = dbc_germtypeChange
      end
      object dbc_section: TComboBox
        Left = 76
        Top = 56
        Width = 129
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
      object dbc_bb: TComboBox
        Left = 76
        Top = 90
        Width = 129
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
      object Button3: TButton
        Left = 87
        Top = 410
        Width = 73
        Height = 25
        Caption = #36864#20986
        TabOrder = 10
        OnClick = Button3Click
      end
      object ComboBox1: TComboBox
        Left = 13
        Top = 186
        Width = 141
        Height = 21
        ItemHeight = 13
        TabOrder = 11
      end
      object RadioButton4: TRadioButton
        Left = 13
        Top = 164
        Width = 113
        Height = 17
        Caption = #21333#31181#33647#29289
        TabOrder = 12
        OnClick = RadioButton4Click
      end
      object dbc_xjname: TComboBox
        Left = 76
        Top = 122
        Width = 130
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 12
        ParentFont = False
        TabOrder = 13
      end
      object btnToExcel: TButton
        Left = 8
        Top = 410
        Width = 69
        Height = 25
        Caption = #23548#20986'EXCEL'
        TabOrder = 14
        OnClick = btnToExcelClick
      end
    end
  end
  object stgchk: TStringGrid
    Left = 224
    Top = 0
    Width = 633
    Height = 557
    ColCount = 6
    RowCount = 1
    FixedRows = 0
    TabOrder = 1
    OnDrawCell = stgchkDrawCell
    RowHeights = (
      24)
  end
  object rsAnti: TADODataSet
    Connection = dmym.conn
    Parameters = <>
    Left = 256
    Top = 344
  end
  object DataSource2: TDataSource
    DataSet = rsAnti
    Left = 260
    Top = 404
  end
  object rs1: TADODataSet
    Connection = dmym.conn
    Parameters = <>
    Left = 319
    Top = 401
  end
  object rstData: TADODataSet
    Connection = dmym.conn
    Parameters = <>
    Left = 264
    Top = 154
  end
  object DataSource1: TDataSource
    DataSet = rstData
    Left = 332
    Top = 156
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
    Left = 317
    Top = 345
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 266
    Top = 236
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 312
    Top = 234
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 354
    Top = 236
  end
end
