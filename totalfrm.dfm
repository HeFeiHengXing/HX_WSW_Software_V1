object totalForm: TtotalForm
  Left = 333
  Top = 163
  BorderStyle = bsDialog
  Caption = #26631#26412#24635#35272
  ClientHeight = 636
  ClientWidth = 965
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
  object Label1: TLabel
    Left = 218
    Top = 616
    Width = 48
    Height = 15
    Caption = 'Label1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 216
    Top = 4
    Width = 749
    Height = 606
    DataSource = dmym.dsBase
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'bbh'
        Title.Caption = #26631#26412#21495
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = #22995#21517
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sex'
        Title.Caption = #24615#21035
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'old'
        Title.Caption = #24180#40836
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'age'
        Title.Caption = #24180#40836#21333#20301
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kb'
        Title.Caption = #31185#21035
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bed'
        Title.Caption = #24202#21495
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'zyh'
        Title.Caption = #20303#38498#21495
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bb'
        Title.Caption = #26631#26412#31867#22411
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jzname'
        Title.Caption = #32454#33740#21517#31216
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'repdate'
        Title.Caption = #25253#21578#26085#26399
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Title.Caption = #31867#22411
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cfu'
        Title.Caption = #33740#33853#35745#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sjmd'
        Title.Caption = #36865#26816#30446#30340
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lczd'
        Title.Caption = #20020#24202#35786#26029
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jjjg'
        Title.Caption = #38236#26816#32467#26524
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'yspy'
        Title.Caption = #21307#29983#35780#35821
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ename'
        Title.Caption = #32454#33740#33521#25991#21517
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tsnyID'
        Title.Caption = #19987#23478#32467#26524
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bc'
        Title.Caption = #34917#20805#35828#26126
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cydate'
        Title.Caption = #36865#26816#26085#26399
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sj'
        Title.Caption = #36865#26816#21307#29983
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'shys'
        Title.Caption = #23457#26680#21307#29983
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bgys'
        Title.Caption = #25253#21578#21307#29983
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 213
    Height = 636
    Align = alLeft
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 0
      Width = 210
      Height = 634
      Align = alCustom
      Caption = #25191#34892#21160#20316
      TabOrder = 0
      object Label4: TLabel
        Left = 16
        Top = 94
        Width = 48
        Height = 12
        Caption = #26631#26412#31867#22411
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 18
        Top = 60
        Width = 24
        Height = 12
        Caption = #31185#23460
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 18
        Top = 26
        Width = 24
        Height = 12
        Caption = #33740#23646
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 16
        Top = 130
        Width = 48
        Height = 12
        Caption = #26631#26412#20998#24067
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 559
        Width = 177
        Height = 65
        Caption = #27880#65306#36873#25321#26102#38388#33539#22260#26102#65292#19981#21253#21547#36215#22987#26085#26399#21644#32467#26463#26085#26399','#22914#26524#26631#26412#20013#30340#25253#21578#26085#26399#24102#26377#26102#20998#31186#65292#37027#20040#25152#36873#25321#26102#38388#33539#22260#30340#26102#65292#20998#65292#31186#20301#25353'0 '#26469#36827#34892#32479#35745#12290
        WordWrap = True
      end
      object Label8: TLabel
        Left = 16
        Top = 166
        Width = 48
        Height = 12
        Caption = #36865#26816#30446#30340
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 16
        Top = 199
        Width = 48
        Height = 12
        Caption = #29305#27530#32784#33647
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 16
        Top = 230
        Width = 48
        Height = 12
        Caption = #32454#33740#21517#31216
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object btnQuery: TBitBtn
        Left = 116
        Top = 419
        Width = 83
        Height = 27
        Caption = #26465#20214#26597#35810'(&A)'
        TabOrder = 12
        Visible = False
        OnClick = btnQueryClick
      end
      object btnDel: TBitBtn
        Left = 11
        Top = 421
        Width = 81
        Height = 25
        Caption = #21024#38500#35760#24405'(&E)'
        TabOrder = 11
        OnClick = btnDelClick
      end
      object btnDetail: TBitBtn
        Left = 11
        Top = 389
        Width = 81
        Height = 25
        Caption = #26597#30475#35814#32454'(&D)'
        TabOrder = 9
        OnClick = btnDetailClick
      end
      object btnPrint: TButton
        Left = 116
        Top = 359
        Width = 83
        Height = 25
        Caption = #25171#21360#25253#34920'(&P)'
        TabOrder = 8
        OnClick = btnPrintClick
      end
      object btnTotalRec: TButton
        Left = 116
        Top = 389
        Width = 83
        Height = 25
        Caption = #20840#37096#35760#24405'(&R)'
        TabOrder = 10
        OnClick = btnTotalRecClick
      end
      object GroupBox2: TGroupBox
        Left = 10
        Top = 451
        Width = 187
        Height = 72
        TabOrder = 13
        object Button1: TButton
          Left = 8
          Top = 44
          Width = 105
          Height = 25
          Caption = #23548#20986'EXCLE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Button1Click
        end
        object chkypmc: TCheckBox
          Left = 8
          Top = 12
          Width = 161
          Height = 33
          Caption = #23548#20986#33647#25935#65288#36873#25321#21333#31181#33740#23646#26597#35810#26377#25928#65289
          Enabled = False
          TabOrder = 1
          WordWrap = True
        end
      end
      object Button2: TButton
        Left = 12
        Top = 359
        Width = 81
        Height = 25
        Caption = #26597#35810
        TabOrder = 7
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 8
        Top = 527
        Width = 95
        Height = 25
        Caption = #36864#20986
        TabOrder = 0
        OnClick = Button3Click
      end
      object GroupBox3: TGroupBox
        Left = 12
        Top = 265
        Width = 183
        Height = 79
        Caption = #26102#38388#33539#22260
        TabOrder = 6
        object Label3: TLabel
          Left = 6
          Top = 38
          Width = 12
          Height = 13
          Caption = #33267
        end
        object dtpBegDate: TDateTimePicker
          Left = 2
          Top = 16
          Width = 131
          Height = 21
          Date = 36837.864669791700000000
          Time = 36837.864669791700000000
          TabOrder = 0
        end
        object dtpEndDate: TDateTimePicker
          Left = 2
          Top = 56
          Width = 131
          Height = 21
          Date = 36837.864709664400000000
          Time = 36837.864709664400000000
          TabOrder = 1
        end
      end
      object dbc_bb: TComboBox
        Left = 68
        Top = 90
        Width = 125
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 12
        ParentFont = False
        TabOrder = 3
      end
      object dbc_section: TComboBox
        Left = 68
        Top = 58
        Width = 125
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 12
        ParentFont = False
        TabOrder = 2
      end
      object dbc_germtype: TComboBox
        Left = 68
        Top = 22
        Width = 125
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 12
        ParentFont = False
        TabOrder = 1
        OnChange = dbc_germtypeChange
      end
      object dbc_bbtype: TComboBox
        Left = 68
        Top = 126
        Width = 125
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 12
        ParentFont = False
        TabOrder = 4
        Items.Strings = (
          #37492#23450#20998#26512
          #38452#24615#25253#21578
          #38451#24615#25253#21578
          #20998#26525#26438#33740
          '******'#19981#38480'******')
      end
      object Dbc_sjmd: TComboBox
        Left = 68
        Top = 162
        Width = 125
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 12
        ParentFont = False
        TabOrder = 5
        Items.Strings = (
          #37492#23450#20998#26512
          #38452#24615#25253#21578
          #38451#24615#25253#21578
          #20998#26525#26438#33740
          '******'#19981#38480'******')
      end
      object SpecialRmDB: TComboBox
        Left = 68
        Top = 195
        Width = 125
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 12
        ParentFont = False
        TabOrder = 14
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
          #35825#23548#20811#26519#38665#32032#32784#33647
          '******'#19981#38480'******')
      end
      object dbc_xjname: TComboBox
        Left = 69
        Top = 227
        Width = 125
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 12
        ParentFont = False
        TabOrder = 15
      end
    end
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 460
    Top = 90
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 508
    Top = 90
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 468
    Top = 130
  end
  object conn: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 580
    Top = 240
  end
  object DelectYP: TADOQuery
    Connection = conn
    Parameters = <>
    Left = 620
    Top = 240
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    Left = 304
    Top = 198
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
    Left = 370
    Top = 198
  end
  object rvConn: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsBase
    Left = 422
    Top = 198
  end
end
