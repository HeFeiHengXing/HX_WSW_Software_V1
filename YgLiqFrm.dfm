object YgLiqForm: TYgLiqForm
  Left = 590
  Top = 198
  BorderStyle = bsDialog
  Caption = #38498#20869#24863#26579#20998#26512#65293#65293#28040#27602#28082#19982#20445#23384#28082
  ClientHeight = 312
  ClientWidth = 598
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
    Left = 18
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
    Left = 400
    Top = 28
    Width = 48
    Height = 12
    Caption = #21697'    '#21517
  end
  object lblEnviron: TLabel
    Left = 18
    Top = 64
    Width = 48
    Height = 12
    Caption = #21830'    '#26631
  end
  object lblGlass: TLabel
    Left = 227
    Top = 64
    Width = 48
    Height = 12
    Caption = #25209'    '#21495
  end
  object lblStime: TLabel
    Left = 401
    Top = 64
    Width = 48
    Height = 12
    Caption = #21830#21697#31867#22411
  end
  object lblSdoctor: TLabel
    Left = 18
    Top = 100
    Width = 48
    Height = 12
    Caption = #37319' '#26679' '#32773
  end
  object lblSDate: TLabel
    Left = 227
    Top = 100
    Width = 48
    Height = 12
    Caption = #37319#26679#26085#26399
    FocusControl = dbe_cydate
  end
  object Label12: TLabel
    Left = 398
    Top = 244
    Width = 48
    Height = 12
    Caption = #25253#21578#26085#26399
    FocusControl = dbe_reportDate
  end
  object Label14: TLabel
    Left = 28
    Top = 242
    Width = 48
    Height = 12
    Caption = #25253#21578#32773'  '
  end
  object Label18: TLabel
    Left = 224
    Top = 136
    Width = 132
    Height = 12
    Caption = #23567#26102#21518#65292#20998#26512#26080#32454#33740#29983#38271
    FocusControl = dbe_hours
  end
  object Label20: TLabel
    Left = 190
    Top = 170
    Width = 36
    Height = 12
    Caption = 'CFU/ml'
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
    Top = 232
    Width = 560
    Height = 1
  end
  object Label4: TLabel
    Left = 229
    Top = 242
    Width = 36
    Height = 12
    Caption = #23457#26680#32773
  end
  object dbe_SpecNum: TDBEdit
    Left = 76
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
  object dbe_cydate: TDBEdit
    Left = 283
    Top = 96
    Width = 80
    Height = 20
    DataField = 'cyDate'
    DataSource = dmym.dsHospital
    TabOrder = 8
  end
  object dbe_reportDate: TDBEdit
    Left = 454
    Top = 240
    Width = 105
    Height = 20
    DataField = 'reportDate'
    DataSource = dmym.dsHospital
    TabOrder = 19
  end
  object btnClose: TBitBtn
    Left = 495
    Top = 276
    Width = 75
    Height = 25
    Caption = #36864#20986'(&C)'
    TabOrder = 22
    OnClick = btnCloseClick
  end
  object btnPrint: TBitBtn
    Left = 401
    Top = 276
    Width = 84
    Height = 25
    Caption = #25253#34920'(&R)'
    TabOrder = 21
    OnClick = btnPrintClick
  end
  object dbcSection: TDBComboBox
    Left = 283
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
    Left = 76
    Top = 238
    Width = 80
    Height = 20
    DataField = 'reporter'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    Items.Strings = (
      #40664#35748#29992#25143)
    TabOrder = 17
    OnKeyPress = dbcBGKeyPress
  end
  object dbe_hours: TDBEdit
    Left = 87
    Top = 132
    Width = 100
    Height = 20
    DataField = 'hhour'
    DataSource = dmym.dsHospital
    TabOrder = 10
  end
  object dbe_gname: TDBEdit
    Left = 308
    Top = 163
    Width = 177
    Height = 20
    DataField = 'germName'
    DataSource = dmym.dsHospital
    TabOrder = 14
  end
  object dbe_totalNum: TDBEdit
    Left = 86
    Top = 165
    Width = 100
    Height = 20
    DataField = 'anum'
    DataSource = dmym.dsHospital
    TabOrder = 12
  end
  object RadioButton1: TRadioButton
    Left = 16
    Top = 134
    Width = 57
    Height = 17
    Caption = #32463#22521#20859
    Checked = True
    TabOrder = 9
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 16
    Top = 168
    Width = 62
    Height = 17
    Caption = #26579#33740#37327
    TabOrder = 11
  end
  object CheckBox1: TCheckBox
    Left = 248
    Top = 166
    Width = 57
    Height = 17
    Caption = #32454#33740#21517
    TabOrder = 13
    OnKeyPress = CheckBox1KeyPress
  end
  object btnSave: TBitBtn
    Left = 317
    Top = 276
    Width = 75
    Height = 25
    Caption = #23384#30424'(&S)'
    TabOrder = 20
    OnClick = btnSaveClick
  end
  object btnExtract: TButton
    Left = 141
    Top = 22
    Width = 54
    Height = 23
    Caption = #26631#26412#30331#35760
    TabOrder = 1
    OnClick = btnExtractClick
  end
  object dbc_samplingMan: TDBComboBox
    Left = 76
    Top = 96
    Width = 80
    Height = 20
    DataField = 'cyys'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    TabOrder = 7
    OnKeyPress = dbc_samplingManKeyPress
  end
  object dbe_ph: TDBEdit
    Left = 283
    Top = 60
    Width = 80
    Height = 20
    DataField = 'Spph'
    DataSource = dmym.dsHospital
    TabOrder = 5
    OnKeyPress = dbe_phKeyPress
  end
  object dbe_brand: TDBEdit
    Left = 76
    Top = 60
    Width = 80
    Height = 20
    DataField = 'Brand'
    DataSource = dmym.dsHospital
    TabOrder = 4
    OnKeyPress = dbe_brandKeyPress
  end
  object dbc_type: TDBComboBox
    Left = 459
    Top = 60
    Width = 94
    Height = 20
    DataField = 'Sptype'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    Items.Strings = (
      #20351#29992#20013#28040#27602#21058
      #26080#33740#22120#26800#20445#23384#28082
      #28781#33740#29992#28040#27602#28082
      #30382#32932#40655#33180#28040#27602#21058)
    TabOrder = 6
    OnChange = dbc_typeChange
    OnKeyPress = dbc_typeKeyPress
  end
  object dbc_shys: TDBComboBox
    Left = 277
    Top = 238
    Width = 80
    Height = 20
    Style = csDropDownList
    DataField = 'shys'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    TabOrder = 18
    OnKeyPress = dbc_shysKeyPress
  end
  object dbc_jcjg: TDBEdit
    Left = 376
    Top = 132
    Width = 57
    Height = 20
    DataField = 'YgbbJC'
    DataSource = dmym.dsHospital
    TabOrder = 23
    Visible = False
  end
  object dbc_gjbz: TDBEdit
    Left = 448
    Top = 135
    Width = 121
    Height = 20
    DataField = 'YgbbGB'
    DataSource = dmym.dsHospital
    TabOrder = 24
    Visible = False
  end
  object CheckBox2: TCheckBox
    Left = -5
    Top = 238
    Width = 22
    Height = 22
    TabOrder = 25
    Visible = False
    OnClick = CheckBox2Click
  end
  object RadioButton3: TRadioButton
    Left = 16
    Top = 200
    Width = 17
    Height = 17
    Caption = 'RadioButton3'
    TabOrder = 15
  end
  object ComboBox1: TDBComboBox
    Left = 32
    Top = 200
    Width = 537
    Height = 20
    DataField = 'memo'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    TabOrder = 16
    OnKeyPress = ComboBox1KeyPress
  end
  object DBEdit1: TDBEdit
    Left = 488
    Top = 160
    Width = 81
    Height = 20
    TabOrder = 26
    Visible = False
  end
  object dbc_pinming: TDBComboBox
    Left = 460
    Top = 24
    Width = 93
    Height = 20
    DataField = 'room'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    TabOrder = 3
    OnKeyPress = dbc_pinmingKeyPress
  end
  object Button1: TButton
    Left = 140
    Top = 22
    Width = 30
    Height = 23
    Caption = #32534#30721
    TabOrder = 27
    Visible = False
    OnClick = Button1Click
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    Left = 96
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
    Left = 152
    Top = 280
  end
  object rvLiq: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsHospital
    Left = 200
    Top = 280
  end
  object ZFX_YX: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 244
    Top = 278
  end
end
