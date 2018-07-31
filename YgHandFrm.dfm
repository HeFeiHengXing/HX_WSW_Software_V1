object YgHandForm: TYgHandForm
  Left = 448
  Top = 232
  BorderStyle = bsDialog
  Caption = #38498#20869#24863#26579#20998#26512#65293#65293#21307#25252#20154#21592#25163
  ClientHeight = 319
  ClientWidth = 607
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
    Left = 24
    Top = 28
    Width = 48
    Height = 12
    Caption = #26631' '#26412' '#21495
    FocusControl = dbe_SpecNum
  end
  object lblSecName: TLabel
    Left = 227
    Top = 28
    Width = 48
    Height = 12
    Caption = #31185'    '#23460
  end
  object lblRoom: TLabel
    Left = 423
    Top = 28
    Width = 48
    Height = 12
    Caption = #21307#25252#20154#21592
    FocusControl = dbe_room
  end
  object lblEnviron: TLabel
    Left = 24
    Top = 65
    Width = 48
    Height = 12
    Caption = #31867'    '#21035
  end
  object lblGlass: TLabel
    Left = 226
    Top = 65
    Width = 48
    Height = 12
    Caption = #37319#26679#38754#31215
  end
  object lblStime: TLabel
    Left = 425
    Top = 65
    Width = 48
    Height = 12
    Caption = #31232#37322#20493#25968
  end
  object lblGermNum: TLabel
    Left = 0
    Top = 100
    Width = 72
    Height = 12
    Caption = #24179#30399#24635#33740#33853#25968
    FocusControl = dbe_gnum
  end
  object lblSdoctor: TLabel
    Left = 226
    Top = 100
    Width = 48
    Height = 12
    Caption = #37319' '#26679' '#32773
  end
  object lblSDate: TLabel
    Left = 423
    Top = 100
    Width = 48
    Height = 12
    Caption = #37319#26679#26085#26399
    FocusControl = dbe_cydate
  end
  object Label12: TLabel
    Left = 424
    Top = 243
    Width = 48
    Height = 12
    Caption = #25253#21578#26085#26399
    FocusControl = dbe_reportDate
  end
  object Label14: TLabel
    Left = 24
    Top = 243
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
    Width = 42
    Height = 14
    Caption = 'CFU/cm'
    FocusControl = dbe_hours
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Shape1: TShape
    Left = 8
    Top = 128
    Width = 558
    Height = 1
  end
  object Shape2: TShape
    Left = 8
    Top = 231
    Width = 560
    Height = 1
  end
  object lbl_cm: TLabel
    Left = 390
    Top = 65
    Width = 14
    Height = 14
    Caption = 'cm'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lbl_cfu: TLabel
    Left = 169
    Top = 100
    Width = 28
    Height = 14
    Caption = 'CFU '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 233
    Top = 243
    Width = 36
    Height = 12
    Caption = #23457#26680#32773
  end
  object Label1: TLabel
    Left = 234
    Top = 174
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
    Left = 406
    Top = 62
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
  object dbe_SpecNum: TDBEdit
    Left = 80
    Top = 24
    Width = 65
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
    Left = 484
    Top = 24
    Width = 113
    Height = 20
    DataField = 'room'
    DataSource = dmym.dsHospital
    TabOrder = 3
    OnKeyPress = dbe_roomKeyPress
  end
  object dbe_gnum: TDBEdit
    Left = 80
    Top = 96
    Width = 81
    Height = 20
    DataField = 'germNum'
    DataSource = dmym.dsHospital
    TabOrder = 7
    OnChange = dbe_gnumChange
    OnKeyPress = dbe_gnumKeyPress
  end
  object dbe_cydate: TDBEdit
    Left = 485
    Top = 96
    Width = 111
    Height = 20
    DataField = 'cyDate'
    DataSource = dmym.dsHospital
    TabOrder = 9
  end
  object dbe_reportDate: TDBEdit
    Left = 482
    Top = 239
    Width = 112
    Height = 20
    DataField = 'reportDate'
    DataSource = dmym.dsHospital
    TabOrder = 20
  end
  object btnClose: TBitBtn
    Left = 499
    Top = 280
    Width = 75
    Height = 25
    Caption = #36864#20986'(&C)'
    TabOrder = 23
    OnClick = btnCloseClick
  end
  object btnPrint: TBitBtn
    Left = 403
    Top = 281
    Width = 86
    Height = 25
    Caption = #25253#34920'(&R)'
    TabOrder = 22
    OnClick = btnPrintClick
  end
  object dbc_environ: TDBComboBox
    Left = 79
    Top = 61
    Width = 82
    Height = 20
    DataField = 'hjlb'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    Items.Strings = (
      #21355#29983#25163
      #22806#31185#25163)
    TabOrder = 4
    OnChange = dbc_environChange
    OnKeyPress = dbc_environKeyPress
  end
  object dbcSection: TDBComboBox
    Left = 288
    Top = 24
    Width = 97
    Height = 20
    DataField = 'secName'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    TabOrder = 2
    OnKeyPress = dbcSectionKeyPress
  end
  object dbcBG: TDBComboBox
    Left = 68
    Top = 239
    Width = 97
    Height = 20
    DataField = 'reporter'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    Items.Strings = (
      #40664#35748#29992#25143)
    TabOrder = 18
    OnKeyPress = dbcBGKeyPress
  end
  object dbe_hours: TDBEdit
    Left = 80
    Top = 140
    Width = 137
    Height = 20
    DataField = 'hhour'
    DataSource = dmym.dsHospital
    TabOrder = 11
  end
  object dbe_gname: TDBEdit
    Left = 332
    Top = 168
    Width = 177
    Height = 20
    DataField = 'germName'
    DataSource = dmym.dsHospital
    TabOrder = 15
  end
  object dbe_totalNum: TDBEdit
    Left = 112
    Top = 170
    Width = 73
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
    Width = 97
    Height = 17
    Caption = #32454#33740#24635#33740#33853#25968
    TabOrder = 12
    OnClick = RadioButton2Click
  end
  object CheckBox1: TCheckBox
    Left = 270
    Top = 170
    Width = 57
    Height = 17
    Caption = #32454#33740#21517
    TabOrder = 14
    OnKeyPress = CheckBox1KeyPress
  end
  object btnSave: TBitBtn
    Left = 319
    Top = 281
    Width = 75
    Height = 25
    Caption = #23384#30424'(&S)'
    TabOrder = 21
    OnClick = btnSaveClick
  end
  object btnExtract: TButton
    Left = 146
    Top = 24
    Width = 53
    Height = 23
    Caption = #26631#26412#30331#35760
    TabOrder = 1
    OnClick = btnExtractClick
  end
  object dbc_samplingMan: TDBComboBox
    Left = 289
    Top = 96
    Width = 98
    Height = 20
    DataField = 'cyys'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    TabOrder = 8
    OnKeyPress = dbc_samplingManKeyPress
  end
  object dbe_rate: TDBEdit
    Left = 484
    Top = 61
    Width = 113
    Height = 20
    DataField = 'bs'
    DataSource = dmym.dsHospital
    TabOrder = 6
    OnChange = dbe_rateChange
    OnKeyPress = dbe_rateKeyPress
  end
  object dbe_area: TDBEdit
    Left = 288
    Top = 61
    Width = 97
    Height = 20
    DataField = 'Area'
    DataSource = dmym.dsHospital
    TabOrder = 5
    OnChange = dbe_areaChange
    OnKeyPress = dbe_areaKeyPress
  end
  object dbc_gjbz: TDBEdit
    Left = 24
    Top = 266
    Width = 121
    Height = 20
    DataField = 'YgbbGB'
    DataSource = dmym.dsHospital
    TabOrder = 24
    Visible = False
  end
  object dbc_jcjg: TDBEdit
    Left = 168
    Top = 270
    Width = 121
    Height = 20
    DataField = 'YgbbJC'
    DataSource = dmym.dsHospital
    TabOrder = 25
    Visible = False
  end
  object dbc_shys: TDBComboBox
    Left = 283
    Top = 239
    Width = 74
    Height = 20
    Style = csDropDownList
    DataField = 'shys'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    TabOrder = 19
    OnKeyPress = dbc_shysKeyPress
  end
  object CheckBox2: TCheckBox
    Left = 5
    Top = 223
    Width = 20
    Height = 17
    TabOrder = 26
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
    Left = 360
    Top = 144
    Width = 121
    Height = 20
    TabOrder = 27
    Visible = False
  end
  object Button1: TButton
    Left = 145
    Top = 24
    Width = 29
    Height = 23
    Caption = #32534#30721
    TabOrder = 28
    Visible = False
    OnClick = Button1Click
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    Left = 24
    Top = 291
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
    Left = 64
    Top = 291
  end
  object rvHand: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsHospital
    Left = 104
    Top = 290
  end
  object ZFX_YX: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 408
  end
end
