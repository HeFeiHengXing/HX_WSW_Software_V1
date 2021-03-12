object detailform: Tdetailform
  Left = 442
  Top = 203
  BorderStyle = bsDialog
  Caption = #35814#32454#26597#35810
  ClientHeight = 436
  ClientWidth = 780
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
  object sgrid: TStringGrid
    Left = 622
    Top = 144
    Width = 139
    Height = 89
    Color = clInactiveCaption
    FixedColor = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = False
    OnDrawCell = sgridDrawCell
    ColWidths = (
      64
      151
      102
      97
      88)
  end
  object BitBtn1: TBitBtn
    Left = 336
    Top = 383
    Width = 83
    Height = 25
    Caption = #25253#34920
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object DBGrid1: TDBGrid
    Left = 426
    Top = 0
    Width = 349
    Height = 317
    DataSource = dstemp
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ypmc'
        Title.Caption = #33647#21697#21517#31216
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mic'
        Title.Caption = 'ug/ml'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mg'
        PickList.Strings = (
          #25935#24863
          #20013#20171
          #32784#33647
          #20302#32784
          #39640#32784)
        Title.Caption = #33647#25935#32467#26524
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bz'
        PickList.Strings = (
          'A'
          'B'
          'C'
          'U'
          'O')
        Title.Caption = #20998#32452
        Width = 35
        Visible = True
      end>
  end
  object BitBtn2: TBitBtn
    Left = 152
    Top = 384
    Width = 75
    Height = 25
    Caption = #32534#36753
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 244
    Top = 384
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 4
    Width = 421
    Height = 281
    Caption = #22522#26412#20449#24687
    TabOrder = 5
    object Label28: TLabel
      Left = 10
      Top = 17
      Width = 48
      Height = 12
      Caption = #26631#26412#21495#65306
      Transparent = True
    end
    object Label27: TLabel
      Left = 146
      Top = 17
      Width = 36
      Height = 12
      Caption = #33740#23646#65306
      Transparent = True
    end
    object Label29: TLabel
      Left = 10
      Top = 53
      Width = 48
      Height = 12
      Caption = #23456#29289#21517#65306
      Transparent = True
    end
    object Label32: TLabel
      Left = 10
      Top = 81
      Width = 36
      Height = 12
      Caption = #21697#31181#65306
      Transparent = True
    end
    object Label33: TLabel
      Left = 10
      Top = 109
      Width = 60
      Height = 12
      Caption = #26631#26412#31867#22411#65306
      Transparent = True
    end
    object Label41: TLabel
      Left = 142
      Top = 200
      Width = 48
      Height = 12
      Caption = #23457#26680#32773#65306
      Transparent = True
    end
    object Label40: TLabel
      Left = 10
      Top = 200
      Width = 48
      Height = 12
      Caption = #25253#21578#32773#65306
      Transparent = True
    end
    object Label39: TLabel
      Left = 264
      Top = 200
      Width = 60
      Height = 12
      Caption = #25253#21578#26085#26399#65306
      Transparent = True
    end
    object Label34: TLabel
      Left = 270
      Top = 81
      Width = 48
      Height = 12
      Caption = #23456#29289#20027#65306
      Transparent = True
    end
    object Label31: TLabel
      Left = 146
      Top = 53
      Width = 36
      Height = 12
      Caption = #24180#40836#65306
      Transparent = True
    end
    object Label30: TLabel
      Left = 282
      Top = 53
      Width = 36
      Height = 12
      Caption = #24615#21035#65306
      Transparent = True
    end
    object Label35: TLabel
      Left = 134
      Top = 81
      Width = 48
      Height = 12
      Caption = #30149#21382#21495#65306
      Transparent = True
    end
    object Label36: TLabel
      Left = 10
      Top = 137
      Width = 60
      Height = 12
      Caption = #20020#24202#35786#26029#65306
      Transparent = True
    end
    object Label38: TLabel
      Left = 10
      Top = 173
      Width = 48
      Height = 12
      Caption = #36865#26816#32773#65306
      Transparent = True
    end
    object Label37: TLabel
      Left = 264
      Top = 173
      Width = 60
      Height = 12
      Caption = #36865#26816#26085#26399#65306
      Transparent = True
    end
    object Label2: TLabel
      Left = 130
      Top = 173
      Width = 60
      Height = 12
      Caption = #36865#26816#30446#30340#65306
      Transparent = True
    end
    object Shape1: TShape
      Left = 8
      Top = 36
      Width = 399
      Height = 1
    end
    object Shape2: TShape
      Left = 7
      Top = 160
      Width = 399
      Height = 1
    end
    object Shape3: TShape
      Left = 7
      Top = 220
      Width = 399
      Height = 1
    end
    object Label5: TLabel
      Left = 210
      Top = 224
      Width = 72
      Height = 12
      Caption = #26816#39564#32773#35780#35821#65306
      Transparent = True
    end
    object Label7: TLabel
      Left = 229
      Top = 109
      Width = 60
      Height = 12
      Caption = #33740#33853#35760#25968#65306
      Transparent = True
    end
    object Label8: TLabel
      Left = 368
      Top = 108
      Width = 36
      Height = 12
      Caption = 'CFU/ml'
      Transparent = True
    end
    object DBText1: TDBText
      Left = 57
      Top = 17
      Width = 73
      Height = 17
      DataField = 'bbh'
      DataSource = dmym.dsBase
      Transparent = True
    end
    object GermType: TLabel
      Left = 188
      Top = 16
      Width = 6
      Height = 12
      Caption = '0'
      Transparent = True
    end
    object DBName: TDBEdit
      Left = 56
      Top = 49
      Width = 77
      Height = 20
      DataField = 'name'
      DataSource = dmym.dsBase
      TabOrder = 0
    end
    object DBAge: TDBEdit
      Left = 180
      Top = 49
      Width = 45
      Height = 20
      DataField = 'old'
      DataSource = dmym.dsBase
      TabOrder = 1
    end
    object DBHospital: TDBEdit
      Left = 180
      Top = 77
      Width = 77
      Height = 20
      DataField = 'zyh'
      DataSource = dmym.dsBase
      TabOrder = 2
    end
    object DBDeliverDate: TDBEdit
      Left = 324
      Top = 169
      Width = 89
      Height = 20
      DataField = 'cydate'
      DataSource = dmym.dsBase
      TabOrder = 3
    end
    object DBReportDate: TDBEdit
      Left = 324
      Top = 196
      Width = 89
      Height = 20
      DataField = 'repdate'
      DataSource = dmym.dsBase
      TabOrder = 4
    end
    object DBBed: TDBEdit
      Left = 316
      Top = 77
      Width = 77
      Height = 20
      DataField = 'bed'
      DataSource = dmym.dsBase
      TabOrder = 5
    end
    object DBAgeUnique: TDBComboBox
      Left = 224
      Top = 49
      Width = 41
      Height = 20
      DataField = 'age'
      DataSource = dmym.dsBase
      ItemHeight = 12
      TabOrder = 6
    end
    object DBSex: TDBComboBox
      Left = 316
      Top = 49
      Width = 77
      Height = 20
      DataField = 'sex'
      DataSource = dmym.dsBase
      ItemHeight = 12
      TabOrder = 7
    end
    object DBSection: TDBComboBox
      Left = 44
      Top = 77
      Width = 77
      Height = 20
      DataField = 'kb'
      DataSource = dmym.dsBase
      ItemHeight = 12
      TabOrder = 8
    end
    object DBSamType: TDBComboBox
      Left = 68
      Top = 105
      Width = 149
      Height = 20
      DataField = 'bb'
      DataSource = dmym.dsBase
      ItemHeight = 12
      TabOrder = 9
      OnChange = DBSamTypeChange
    end
    object DBTest: TDBComboBox
      Left = 68
      Top = 133
      Width = 149
      Height = 20
      DataField = 'lczd'
      DataSource = dmym.dsBase
      ItemHeight = 12
      TabOrder = 10
    end
    object DBDeliver: TDBComboBox
      Left = 56
      Top = 169
      Width = 69
      Height = 20
      DataField = 'sj'
      DataSource = dmym.dsBase
      ItemHeight = 12
      TabOrder = 11
    end
    object DBDeliverAim: TDBComboBox
      Left = 188
      Top = 169
      Width = 73
      Height = 20
      DataField = 'sjmd'
      DataSource = dmym.dsBase
      ItemHeight = 12
      TabOrder = 12
    end
    object DBReporter: TDBComboBox
      Left = 56
      Top = 196
      Width = 69
      Height = 20
      Style = csDropDownList
      DataField = 'bgys'
      DataSource = dmym.dsBase
      ItemHeight = 12
      TabOrder = 13
    end
    object DBChecker: TDBComboBox
      Left = 188
      Top = 196
      Width = 73
      Height = 20
      Style = csDropDownList
      DataField = 'shys'
      DataSource = dmym.dsBase
      ItemHeight = 12
      TabOrder = 14
    end
    object DBRemark: TDBMemo
      Left = 8
      Top = 242
      Width = 161
      Height = 37
      DataField = 'jjjg'
      DataSource = dmym.dsBase
      TabOrder = 15
      OnExit = DBRemarkExit
    end
    object DBConclusion: TDBMemo
      Left = 208
      Top = 242
      Width = 157
      Height = 37
      DataField = 'yspy'
      DataSource = dmym.dsBase
      TabOrder = 16
      OnExit = DBConclusionExit
    end
    object DBCount: TDBEdit
      Left = 288
      Top = 105
      Width = 77
      Height = 20
      DataField = 'cfu'
      DataSource = dmym.dsBase
      TabOrder = 17
    end
    object RadioButton1: TRadioButton
      Left = 8
      Top = 224
      Width = 113
      Height = 17
      Caption = #38236#26816#32467#26524#65306
      TabOrder = 18
    end
    object RadioButton2: TRadioButton
      Left = 92
      Top = 224
      Width = 113
      Height = 17
      Caption = #32454#33740#29983#38271#65306
      TabOrder = 19
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 288
    Width = 421
    Height = 89
    Caption = #37492#23450#32467#26524
    TabOrder = 6
    object Label1: TLabel
      Left = 22
      Top = 17
      Width = 60
      Height = 12
      Caption = #32454#33740#21517#31216#65306
      Transparent = True
    end
    object Label3: TLabel
      Left = 22
      Top = 41
      Width = 36
      Height = 12
      Caption = #33740#32676#65306
      Transparent = True
    end
    object Label4: TLabel
      Left = 22
      Top = 64
      Width = 36
      Height = 12
      Caption = #22791#27880#65306
      Transparent = True
    end
    object DBJzname: TDBEdit
      Left = 88
      Top = 13
      Width = 305
      Height = 20
      DataField = 'jzname'
      DataSource = dmym.dsBase
      TabOrder = 0
    end
    object DBJzclass: TDBEdit
      Left = 88
      Top = 37
      Width = 305
      Height = 20
      DataField = 'jzclass'
      DataSource = dmym.dsBase
      TabOrder = 1
    end
    object DBBc: TDBEdit
      Left = 88
      Top = 60
      Width = 305
      Height = 20
      DataField = 'bc'
      DataSource = dmym.dsBase
      TabOrder = 2
    end
  end
  object GroupBox3: TGroupBox
    Left = 424
    Top = 320
    Width = 349
    Height = 89
    Caption = #38468#21152#33647#21697
    TabOrder = 7
    object DBGrid2: TDBGrid
      Left = 2
      Top = 14
      Width = 345
      Height = 73
      Align = alClient
      DataSource = DsMedAdd
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ypmc'
          Title.Caption = #33647#21697#21517#31216
          Width = 125
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mic'
          Title.Caption = 'ug/ml'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mg'
          PickList.Strings = (
            #25935#24863
            #20013#20171
            #32784#33647
            #20302#32784
            #39640#32784)
          Title.Caption = #33647#25935#32467#26524
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bcsm'
          Title.Caption = #34917#20805#35828#26126
          Width = 60
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 413
    Width = 780
    Height = 23
    Panels = <
      item
        Text = #29366#24577#65306
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object rstemp: TADODataSet
    Connection = dmym.conn
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 484
    Top = 224
  end
  object dstemp: TDataSource
    DataSet = rstemp
    Left = 516
    Top = 224
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    Left = 548
    Top = 256
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
    Left = 580
    Top = 256
  end
  object rvSingle: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsBase
    Left = 516
    Top = 258
  end
  object rvSingle2: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = rstemp
    Left = 452
    Top = 260
  end
  object rvsingle3: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = RsMedAdd
    Left = 484
    Top = 260
  end
  object ADOQuery1: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 452
    Top = 224
  end
  object DsMedAdd: TDataSource
    DataSet = RsMedAdd
    Left = 584
    Top = 224
  end
  object RsMedAdd: TADODataSet
    Connection = dmym.conn
    AfterInsert = RsMedAddAfterInsert
    Parameters = <>
    Left = 552
    Top = 224
  end
end
