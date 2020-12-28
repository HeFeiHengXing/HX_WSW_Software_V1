object YgSurfaceForm: TYgSurfaceForm
  Left = 384
  Top = 333
  BorderStyle = bsDialog
  Caption = #38498#20869#24863#26579#20998#26512#65293#65293#29289#20307#34920#38754
  ClientHeight = 308
  ClientWidth = 608
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
  object lblSpecNum: TLabel
    Left = 29
    Top = 28
    Width = 48
    Height = 12
    Caption = #26631' '#26412' '#21495
    FocusControl = dbe_SpecNum
  end
  object lblSecName: TLabel
    Left = 250
    Top = 28
    Width = 48
    Height = 12
    Caption = #31185'    '#23460
  end
  object lblRoom: TLabel
    Left = 433
    Top = 29
    Width = 48
    Height = 12
    Caption = #29289'    '#20307
    FocusControl = dbe_room
  end
  object lblEnviron: TLabel
    Left = 29
    Top = 66
    Width = 48
    Height = 12
    Caption = #29615#22659#31867#21035
  end
  object lblGlass: TLabel
    Left = 250
    Top = 66
    Width = 48
    Height = 12
    Caption = #37319#26679#38754#31215
  end
  object lblStime: TLabel
    Left = 433
    Top = 66
    Width = 48
    Height = 12
    Caption = #31232#37322#20493#25968
  end
  object lblGermNum: TLabel
    Left = 5
    Top = 99
    Width = 72
    Height = 12
    Caption = #24179#30399#24635#33740#33853#25968
    FocusControl = dbe_gnum
  end
  object lblSdoctor: TLabel
    Left = 252
    Top = 98
    Width = 48
    Height = 12
    Caption = #37319' '#26679' '#32773
  end
  object lblSDate: TLabel
    Left = 433
    Top = 99
    Width = 48
    Height = 12
    Caption = #37319#26679#26085#26399
    FocusControl = dbe_cydate
  end
  object Label12: TLabel
    Left = 436
    Top = 239
    Width = 48
    Height = 12
    Caption = #25253#21578#26085#26399
    FocusControl = dbe_reportDate
  end
  object Label14: TLabel
    Left = 40
    Top = 241
    Width = 36
    Height = 12
    Caption = #25253#21578#32773
  end
  object Label18: TLabel
    Left = 224
    Top = 144
    Width = 132
    Height = 12
    Caption = #23567#26102#21518#65292#20998#26512#26080#32454#33740#29983#38271
    FocusControl = dbe_hours
  end
  object Label20: TLabel
    Left = 192
    Top = 174
    Width = 36
    Height = 12
    Caption = 'CFU/cm'
    FocusControl = dbe_hours
  end
  object Shape1: TShape
    Left = 8
    Top = 128
    Width = 558
    Height = 1
  end
  object Shape2: TShape
    Left = 8
    Top = 229
    Width = 560
    Height = 1
  end
  object lbl_cm: TLabel
    Left = 392
    Top = 66
    Width = 12
    Height = 12
    Caption = 'cm'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_cfu: TLabel
    Left = 179
    Top = 99
    Width = 24
    Height = 12
    Caption = 'CFU '
  end
  object Label4: TLabel
    Left = 255
    Top = 241
    Width = 36
    Height = 12
    Caption = #23457#26680#32773
  end
  object Label1: TLabel
    Left = 228
    Top = 172
    Width = 5
    Height = 9
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 404
    Top = 64
    Width = 5
    Height = 9
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object dbe_SpecNum: TDBEdit
    Left = 88
    Top = 24
    Width = 67
    Height = 20
    DataField = 'specNum'
    DataSource = dmym.dsHospital
    MaxLength = 10
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnClick = dbe_SpecNumClick
    OnKeyPress = dbe_SpecNumKeyPress
  end
  object dbe_room: TDBEdit
    Left = 494
    Top = 24
    Width = 103
    Height = 20
    DataField = 'room'
    DataSource = dmym.dsHospital
    TabOrder = 3
    OnKeyPress = dbe_roomKeyPress
  end
  object dbe_gnum: TDBEdit
    Left = 88
    Top = 95
    Width = 80
    Height = 20
    DataField = 'germNum'
    DataSource = dmym.dsHospital
    TabOrder = 7
    OnChange = dbe_gnumChange
    OnKeyPress = dbe_gnumKeyPress
  end
  object dbe_cydate: TDBEdit
    Left = 496
    Top = 92
    Width = 101
    Height = 20
    DataField = 'cyDate'
    DataSource = dmym.dsHospital
    TabOrder = 9
  end
  object dbe_reportDate: TDBEdit
    Left = 494
    Top = 235
    Width = 103
    Height = 20
    DataField = 'reportDate'
    DataSource = dmym.dsHospital
    TabOrder = 21
  end
  object btnClose: TBitBtn
    Left = 499
    Top = 267
    Width = 75
    Height = 25
    Caption = #36864#20986'(&C)'
    TabOrder = 24
    OnClick = btnCloseClick
  end
  object btnPrint: TBitBtn
    Left = 397
    Top = 267
    Width = 92
    Height = 25
    Caption = #25253#34920'(&R)'
    TabOrder = 23
    OnClick = btnPrintClick
  end
  object dbc_environ: TDBComboBox
    Left = 87
    Top = 62
    Width = 80
    Height = 20
    DataField = 'hjlb'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    Items.Strings = (
      'I'
      'II'
      'III'
      'IV')
    TabOrder = 4
    OnChange = dbc_environChange
    OnKeyPress = dbc_environKeyPress
  end
  object dbcSection: TDBComboBox
    Left = 307
    Top = 24
    Width = 80
    Height = 20
    DataField = 'secName'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    TabOrder = 2
    OnKeyPress = dbcSectionKeyPress
  end
  object dbcBG: TDBComboBox
    Left = 84
    Top = 237
    Width = 97
    Height = 20
    DataField = 'reporter'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    TabOrder = 19
    OnKeyPress = dbcBGKeyPress
  end
  object dbe_hours: TDBEdit
    Left = 87
    Top = 140
    Width = 101
    Height = 20
    DataField = 'hhour'
    DataSource = dmym.dsHospital
    TabOrder = 11
  end
  object dbe_gname: TDBEdit
    Left = 318
    Top = 168
    Width = 177
    Height = 20
    DataField = 'germName'
    DataSource = dmym.dsHospital
    TabOrder = 15
  end
  object dbe_totalNum: TDBEdit
    Left = 86
    Top = 170
    Width = 100
    Height = 20
    DataField = 'anum'
    DataSource = dmym.dsHospital
    TabOrder = 13
  end
  object RadioButton1: TRadioButton
    Left = 16
    Top = 142
    Width = 57
    Height = 17
    Caption = #32463#22521#20859
    Checked = True
    TabOrder = 10
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 16
    Top = 172
    Width = 71
    Height = 17
    Caption = #33740#33853#24635#25968
    TabOrder = 12
    OnClick = RadioButton2Click
  end
  object CheckBox1: TCheckBox
    Left = 254
    Top = 170
    Width = 57
    Height = 17
    Caption = #32454#33740#21517
    TabOrder = 14
    OnKeyPress = CheckBox1KeyPress
  end
  object btnSave: TBitBtn
    Left = 313
    Top = 268
    Width = 75
    Height = 25
    Caption = #23384#30424'(&S)'
    TabOrder = 22
    OnClick = btnSaveClick
  end
  object btnExtract: TButton
    Left = 155
    Top = 23
    Width = 57
    Height = 23
    Caption = #26631#26412#30331#35760
    TabOrder = 1
    OnClick = btnExtractClick
  end
  object dbc_samplingMan: TDBComboBox
    Left = 307
    Top = 92
    Width = 80
    Height = 20
    DataField = 'cyys'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    TabOrder = 8
    OnKeyPress = dbc_samplingManKeyPress
  end
  object dbe_rate: TDBEdit
    Left = 494
    Top = 62
    Width = 105
    Height = 20
    DataField = 'bs'
    DataSource = dmym.dsHospital
    TabOrder = 6
    OnChange = dbe_rateChange
    OnKeyPress = dbe_rateKeyPress
  end
  object dbe_area: TDBEdit
    Left = 307
    Top = 62
    Width = 80
    Height = 20
    DataField = 'Area'
    DataSource = dmym.dsHospital
    TabOrder = 5
    OnChange = dbe_areaChange
    OnKeyPress = dbe_areaKeyPress
  end
  object dbc_gjbz: TDBEdit
    Left = 16
    Top = 267
    Width = 121
    Height = 20
    DataField = 'YgbbGB'
    DataSource = dmym.dsHospital
    TabOrder = 25
    Visible = False
  end
  object dbc_jcjg: TDBEdit
    Left = 168
    Top = 267
    Width = 121
    Height = 20
    DataField = 'YgbbJC'
    DataSource = dmym.dsHospital
    TabOrder = 26
    Visible = False
  end
  object dbc_shys: TDBComboBox
    Left = 301
    Top = 237
    Width = 74
    Height = 20
    Style = csDropDownList
    DataField = 'shys'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    TabOrder = 20
    OnKeyPress = dbc_shysKeyPress
  end
  object CheckBox2: TCheckBox
    Left = 17
    Top = 239
    Width = 16
    Height = 17
    TabOrder = 18
    Visible = False
    OnClick = CheckBox2Click
  end
  object RadioButton3: TRadioButton
    Left = 16
    Top = 200
    Width = 17
    Height = 17
    Caption = 'RadioButton3'
    TabOrder = 16
  end
  object ComboBox1: TDBComboBox
    Left = 32
    Top = 200
    Width = 537
    Height = 20
    DataField = 'memo'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    TabOrder = 17
    OnKeyPress = ComboBox1KeyPress
  end
  object DBEdit1: TDBEdit
    Left = 504
    Top = 144
    Width = 49
    Height = 20
    TabOrder = 27
    Visible = False
  end
  object Button1: TButton
    Left = 156
    Top = 23
    Width = 34
    Height = 23
    Caption = #32534#30721
    TabOrder = 28
    Visible = False
    OnClick = Button1Click
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    Left = 392
    Top = 140
  end
  object rvSurface: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsHospital
    Left = 424
    Top = 139
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
    Left = 472
    Top = 138
  end
  object ZFX_YX: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 398
    Top = 100
  end
end
