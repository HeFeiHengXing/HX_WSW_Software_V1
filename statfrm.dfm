object statform: Tstatform
  Left = 461
  Top = 161
  BorderStyle = bsDialog
  Caption = #32454#33740#20998#31867#32479#35745
  ClientHeight = 562
  ClientWidth = 882
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
  object stgChk: TStringGrid
    Left = 209
    Top = 0
    Width = 673
    Height = 562
    Align = alClient
    ColCount = 8
    DefaultColWidth = 70
    DefaultRowHeight = 20
    RowCount = 1
    FixedRows = 0
    TabOrder = 1
    ColWidths = (
      70
      57
      70
      77
      59
      53
      62
      81)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 209
    Height = 562
    Align = alLeft
    Color = clSkyBlue
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 26
      Width = 24
      Height = 12
      Caption = #33740#23646
    end
    object Label3: TLabel
      Left = 12
      Top = 58
      Width = 24
      Height = 12
      Caption = #21697#31181
    end
    object Label4: TLabel
      Left = 10
      Top = 88
      Width = 48
      Height = 12
      Caption = #26631#26412#31867#22411
    end
    object btnQryData: TBitBtn
      Left = 10
      Top = 366
      Width = 73
      Height = 25
      Caption = #26597#35810
      Default = True
      TabOrder = 6
      OnClick = btnQryDataClick
      NumGlyphs = 2
    end
    object GroupBox1: TGroupBox
      Left = 12
      Top = 222
      Width = 181
      Height = 47
      Caption = #32454#33740#21517#31216
      TabOrder = 4
      object dlcjzname: TDBLookupComboBox
        Left = 6
        Top = 20
        Width = 169
        Height = 20
        DropDownRows = 10
        KeyField = 'name'
        ListField = 'name'
        ListSource = dsxj
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 12
      Top = 274
      Width = 179
      Height = 81
      Caption = #26102#38388#33539#22260
      TabOrder = 5
      object Label2: TLabel
        Left = 12
        Top = 40
        Width = 12
        Height = 12
        Caption = #33267
      end
      object dtpBegDate: TDateTimePicker
        Left = 6
        Top = 16
        Width = 151
        Height = 20
        Date = 0.855668194446480000
        Time = 0.855668194446480000
        TabOrder = 0
      end
      object dtpEndDate: TDateTimePicker
        Left = 6
        Top = 56
        Width = 151
        Height = 20
        Date = 0.855786307867675000
        Time = 0.855786307867675000
        TabOrder = 1
      end
    end
    object chkypm: TCheckBox
      Left = 10
      Top = 216
      Width = 73
      Height = 17
      Caption = #21333#31181#33647#29289
      TabOrder = 2
      Visible = False
      OnClick = chkypmClick
      OnKeyPress = chkypmKeyPress
    end
    object dblyp: TDBLookupComboBox
      Left = 14
      Top = 460
      Width = 169
      Height = 20
      KeyField = 'ypmc'
      ListField = 'ypmc'
      ListSource = DataSource1
      TabOrder = 3
      Visible = False
    end
    object btnExit: TButton
      Left = 102
      Top = 412
      Width = 73
      Height = 25
      Caption = #36864#20986
      TabOrder = 7
      OnClick = btnExitClick
    end
    object SpecialRmDBCh: TCheckBox
      Left = 12
      Top = 169
      Width = 98
      Height = 17
      Caption = ' '#29305#27530#32784#33647#26426#21046
      TabOrder = 0
      OnClick = SpecialRmDBChClick
      OnKeyPress = SpecialRmDBChKeyPress
    end
    object SpecialRmDB: TComboBox
      Left = 12
      Top = 188
      Width = 177
      Height = 20
      Enabled = False
      ItemHeight = 12
      TabOrder = 1
      Items.Strings = (
        'ESBLs'
        'ZR'
        'CRE'
        'CR-PA'
        'CR-AB'
        'MRS'
        'MRSA'
        'MRSCN'
        'VRS'
        'MDR-PA'
        'MDR-AB'
        'XDR-PA'
        'XDR-AB'
        'PDR-PA'
        'PDR-AB'
        'HLAR'
        'VRE'
        'PRSP'
        #20135#35825#23548#37238
        #20135#30899#38738#38665#28911#37238
        #35825#23548#20811#26519#38665#32032#32784#33647)
    end
    object dbc_germtype: TComboBox
      Left = 66
      Top = 22
      Width = 125
      Height = 20
      ItemHeight = 12
      TabOrder = 8
      OnClick = dbc_germtypeClick
    end
    object dbc_section: TComboBox
      Left = 66
      Top = 54
      Width = 125
      Height = 20
      ItemHeight = 12
      TabOrder = 9
    end
    object dbc_bb: TComboBox
      Left = 66
      Top = 84
      Width = 125
      Height = 20
      ItemHeight = 12
      TabOrder = 10
    end
    object GroupBox4: TGroupBox
      Left = 12
      Top = 116
      Width = 173
      Height = 41
      Caption = #26816#32034#20869#23481#65306
      TabOrder = 11
      object Label5: TLabel
        Left = 54
        Top = 18
        Width = 60
        Height = 12
        Caption = #26816#20986#19982#20998#24067
      end
    end
    object Button1: TButton
      Left = 102
      Top = 366
      Width = 75
      Height = 25
      Caption = #25171#21360
      TabOrder = 12
      OnClick = Button1Click
    end
    object btnToExcel: TButton
      Left = 10
      Top = 412
      Width = 73
      Height = 25
      Caption = #23548#20986'EXCEL'
      TabOrder = 13
      OnClick = btnToExcelClick
    end
  end
  object dsxj: TDataSource
    DataSet = rsyx
    Left = 293
    Top = 176
  end
  object dsjz: TDataSource
    DataSet = rsJz
    Left = 293
    Top = 112
  end
  object rsJz: TADODataSet
    Connection = dmym.conn
    CursorType = ctStatic
    CommandText = 'select * from xjname order by xjid'
    IndexFieldNames = 'js'
    MasterFields = 'GermIndex'
    Parameters = <>
    Left = 248
    Top = 112
  end
  object rstData: TADODataSet
    Connection = dmym.conn
    Parameters = <>
    Left = 292
    Top = 208
  end
  object rscalc: TADODataSet
    Connection = dmym.conn
    Parameters = <>
    Left = 247
    Top = 176
  end
  object DataSource1: TDataSource
    DataSet = rsyp
    Left = 248
    Top = 144
  end
  object rsyp: TADODataSet
    Connection = dmym.conn
    CursorType = ctStatic
    CommandText = 'select * from ypAll'
    IndexFieldNames = 'js'
    MasterFields = 'GermIndex'
    Parameters = <>
    Left = 293
    Top = 144
  end
  object rsyx: TADODataSet
    Connection = dmym.conn
    CursorType = ctStatic
    CommandText = 'select * from base where js<>'#39'00'#39
    IndexFieldNames = 'js'
    MasterFields = 'GermIndex'
    Parameters = <>
    Left = 248
    Top = 208
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 248
    Top = 264
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 296
    Top = 264
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 344
    Top = 264
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
    Left = 250
    Top = 306
  end
end
