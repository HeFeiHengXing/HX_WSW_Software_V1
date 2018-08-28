object YgqtForm: TYgqtForm
  Left = 402
  Top = 234
  BorderStyle = bsDialog
  Caption = #38498#20869#24863#26579#65293#65293#20854#20182
  ClientHeight = 304
  ClientWidth = 589
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
  object lblRoom: TLabel
    Left = 396
    Top = 29
    Width = 72
    Height = 12
    Caption = #21697'    '#21517'    '
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lblSecName: TLabel
    Left = 224
    Top = 29
    Width = 66
    Height = 12
    Caption = #31185'    '#23460'   '
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lblSpecNum: TLabel
    Left = 20
    Top = 29
    Width = 60
    Height = 12
    Caption = #26631' '#26412' '#21495'  '
    FocusControl = dbe_SpecNum
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label18: TLabel
    Left = 236
    Top = 119
    Width = 192
    Height = 13
    Caption = #23567#26102#21518#65292#20998#26512#26080#32454#33740#29983#38271'                    '
    FocusControl = dbe_hours
  end
  object Label14: TLabel
    Left = 35
    Top = 228
    Width = 48
    Height = 13
    Caption = #25253#21578#32773'    '
  end
  object Label12: TLabel
    Left = 395
    Top = 228
    Width = 66
    Height = 13
    Caption = #25253#21578#26085#26399'      '
    FocusControl = dbe_reportDate
  end
  object lblSdoctor: TLabel
    Left = 224
    Top = 74
    Width = 54
    Height = 12
    Caption = #37319' '#26679' '#32773' '
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lblSDate: TLabel
    Left = 395
    Top = 74
    Width = 78
    Height = 12
    Caption = #37319#26679#26085#26399'     '
    FocusControl = dbe_cydate
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Shape1: TShape
    Left = 8
    Top = 100
    Width = 558
    Height = 1
  end
  object Label20: TLabel
    Left = 202
    Top = 152
    Width = 52
    Height = 13
    Caption = 'CFU/cm^2'
    FocusControl = dbe_hours
  end
  object Label4: TLabel
    Left = 227
    Top = 228
    Width = 42
    Height = 13
    Caption = #23457#26680#32773'  '
  end
  object Shape2: TShape
    Left = 20
    Top = 217
    Width = 558
    Height = 1
  end
  object Label5: TLabel
    Left = 20
    Top = 74
    Width = 60
    Height = 12
    Caption = #22269#23478#26631#20934'  '
    FocusControl = dbe_SpecNum
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 76
    Top = 72
    Width = 14
    Height = 14
    Caption = #8804
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object dbc_Section: TDBComboBox
    Left = 283
    Top = 25
    Width = 100
    Height = 20
    DataField = 'secName'
    DataSource = dmym.dsHospital
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 2
    OnKeyPress = dbc_SectionKeyPress
  end
  object btnExtract: TButton
    Left = 138
    Top = 24
    Width = 57
    Height = 23
    Caption = #26631#26412#30331#35760
    TabOrder = 1
    OnClick = btnExtractClick
  end
  object dbe_SpecNum: TDBEdit
    Left = 78
    Top = 25
    Width = 57
    Height = 20
    DataField = 'specNum'
    DataSource = dmym.dsHospital
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnClick = dbe_SpecNumClick
    OnKeyPress = dbe_SpecNumKeyPress
  end
  object dbc_samplingMan: TDBComboBox
    Left = 285
    Top = 70
    Width = 80
    Height = 20
    DataField = 'cyys'
    DataSource = dmym.dsHospital
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 6
    OnKeyPress = dbc_samplingManKeyPress
  end
  object dbe_cydate: TDBEdit
    Left = 467
    Top = 70
    Width = 102
    Height = 20
    DataField = 'cyDate'
    DataSource = dmym.dsHospital
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object RadioButton1: TRadioButton
    Left = 16
    Top = 116
    Width = 57
    Height = 17
    Caption = #32463#22521#20859
    Checked = True
    TabOrder = 8
    TabStop = True
  end
  object dbe_hours: TDBEdit
    Left = 88
    Top = 114
    Width = 137
    Height = 21
    DataField = 'hhour'
    DataSource = dmym.dsHospital
    TabOrder = 9
  end
  object CheckBox1: TCheckBox
    Left = 294
    Top = 150
    Width = 64
    Height = 17
    Caption = #32454#33740#21517
    TabOrder = 12
    OnKeyPress = CheckBox1KeyPress
  end
  object dbe_gname: TDBEdit
    Left = 358
    Top = 148
    Width = 177
    Height = 21
    DataField = 'germName'
    DataSource = dmym.dsHospital
    TabOrder = 13
  end
  object dbe_totalNum: TDBEdit
    Left = 92
    Top = 148
    Width = 105
    Height = 21
    DataField = 'anum'
    DataSource = dmym.dsHospital
    TabOrder = 11
    OnChange = dbe_totalNumChange
  end
  object dbe_totalNum2: TDBEdit
    Left = 514
    Top = 161
    Width = 73
    Height = 21
    DataField = 'anum'
    DataSource = dmym.dsHospital
    TabOrder = 20
    Visible = False
  end
  object RadioButton3: TRadioButton
    Left = 408
    Top = 164
    Width = 104
    Height = 17
    Caption = #33740#33853#24635#25968
    TabOrder = 19
    Visible = False
    OnClick = RadioButton3Click
  end
  object RadioButton2: TRadioButton
    Left = 16
    Top = 150
    Width = 78
    Height = 17
    Caption = #33740#33853#24635#25968
    TabOrder = 10
  end
  object dbcBG: TDBComboBox
    Left = 83
    Top = 224
    Width = 106
    Height = 21
    DataField = 'reporter'
    DataSource = dmym.dsHospital
    ItemHeight = 13
    Items.Strings = (
      #40664#35748#29992#25143)
    TabOrder = 16
    OnKeyPress = dbcBGKeyPress
  end
  object btnPrint: TBitBtn
    Left = 415
    Top = 258
    Width = 82
    Height = 25
    Caption = #25253#34920'(&R)'
    TabOrder = 24
    OnClick = btnPrintClick
  end
  object dbe_reportDate: TDBEdit
    Left = 461
    Top = 224
    Width = 112
    Height = 21
    DataField = 'reportDate'
    DataSource = dmym.dsHospital
    TabOrder = 18
  end
  object btnSave: TBitBtn
    Left = 333
    Top = 258
    Width = 75
    Height = 25
    Caption = #23384#30424'(&S)'
    TabOrder = 23
    OnClick = btnSaveClick
  end
  object btnClose: TBitBtn
    Left = 503
    Top = 258
    Width = 75
    Height = 25
    Caption = #36864#20986'(&C)'
    TabOrder = 25
    OnClick = btnCloseClick
  end
  object dbc_pinming: TDBComboBox
    Left = 466
    Top = 25
    Width = 80
    Height = 20
    DataField = 'room'
    DataSource = dmym.dsHospital
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 3
    OnKeyPress = dbc_pinmingKeyPress
  end
  object dbc_shys: TDBComboBox
    Left = 278
    Top = 224
    Width = 74
    Height = 21
    Style = csDropDownList
    DataField = 'shys'
    DataSource = dmym.dsHospital
    ItemHeight = 13
    TabOrder = 17
    OnKeyPress = dbc_shysKeyPress
  end
  object dbc_jcjg: TDBEdit
    Left = 218
    Top = 241
    Width = 56
    Height = 21
    DataField = 'YgbbJC'
    DataSource = dmym.dsHospital
    TabOrder = 26
    Visible = False
  end
  object RadioButton4: TRadioButton
    Left = 408
    Top = 173
    Width = 101
    Height = 17
    Caption = #33740#33853#24635#25968
    TabOrder = 21
    Visible = False
    OnClick = RadioButton4Click
  end
  object dbe_totalNum3: TDBEdit
    Left = 514
    Top = 172
    Width = 73
    Height = 21
    DataField = 'anum'
    DataSource = dmym.dsHospital
    TabOrder = 22
    Visible = False
  end
  object RadioButton5: TRadioButton
    Left = 16
    Top = 186
    Width = 17
    Height = 17
    Caption = 'RadioButton5'
    TabOrder = 14
  end
  object ComboBox1: TDBComboBox
    Left = 38
    Top = 184
    Width = 537
    Height = 21
    DataField = 'memo'
    DataSource = dmym.dsHospital
    ItemHeight = 13
    TabOrder = 15
    OnKeyPress = ComboBox1KeyPress
  end
  object DBEdit1: TDBEdit
    Left = 216
    Top = 264
    Width = 121
    Height = 21
    TabOrder = 27
    Visible = False
  end
  object ComboBox4: TComboBox
    Left = 160
    Top = 68
    Width = 61
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    OnChange = ComboBox4Change
    Items.Strings = (
      'CFU/cm^2'
      'CFU/100cm^2'
      'CFU/m^3'
      'CFU/ml'
      'CFU/'#20010
      'CFU/'#20214)
  end
  object dbc_gjbz: TDBComboBox
    Left = 92
    Top = 68
    Width = 69
    Height = 21
    DataField = 'YgbbGB'
    DataSource = dmym.dsHospital
    ItemHeight = 13
    Items.Strings = (
      #26080#32454#33740#29983#38271)
    TabOrder = 4
    OnChange = dbc_gjbzChange
    OnExit = dbc_gjbzExit
  end
  object Button1: TButton
    Left = 136
    Top = 24
    Width = 33
    Height = 23
    Caption = #32534#30721
    TabOrder = 28
    Visible = False
    OnClick = Button1Click
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
    Left = 52
    Top = 251
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    Left = 92
    Top = 251
  end
  object rvYgQt: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsHospital
    Left = 132
    Top = 251
  end
  object ZFX_QT: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 536
    Top = 106
  end
  object ZFX_YX: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 488
    Top = 102
  end
end
