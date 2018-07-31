object YgMedForm: TYgMedForm
  Left = 326
  Top = 139
  BorderStyle = bsDialog
  Caption = #38498#20869#24863#26579#20998#26512#65293#65293#21307#30103#29992#21697
  ClientHeight = 346
  ClientWidth = 595
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
    Left = 223
    Top = 28
    Width = 48
    Height = 12
    Caption = #31185'    '#23460
  end
  object lblRoom: TLabel
    Left = 399
    Top = 28
    Width = 48
    Height = 12
    Caption = #21697'    '#21517
  end
  object lblEnviron: TLabel
    Left = 24
    Top = 60
    Width = 48
    Height = 12
    Caption = #21830'    '#26631
  end
  object lblGlass: TLabel
    Left = 223
    Top = 60
    Width = 48
    Height = 12
    Caption = #25209'    '#21495
  end
  object lblStime: TLabel
    Left = 401
    Top = 60
    Width = 48
    Height = 12
    Caption = #21830#21697#31867#22411
  end
  object lblSdoctor: TLabel
    Left = 25
    Top = 92
    Width = 66
    Height = 12
    Caption = #37319' '#26679' '#32773'   '
  end
  object lblSDate: TLabel
    Left = 223
    Top = 92
    Width = 48
    Height = 12
    Caption = #37319#26679#26085#26399
    FocusControl = dbe_cydate
  end
  object Label12: TLabel
    Left = 386
    Top = 287
    Width = 60
    Height = 12
    Caption = #25253#21578#26085#26399'  '
    FocusControl = dbe_reportDate
  end
  object Label14: TLabel
    Left = 24
    Top = 288
    Width = 54
    Height = 12
    Caption = #25253#21578#32773'   '
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
    Top = 168
    Width = 30
    Height = 12
    Caption = 'CFU/g'
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
    Top = 275
    Width = 560
    Height = 1
  end
  object Label1: TLabel
    Left = 190
    Top = 198
    Width = 78
    Height = 12
    Caption = 'CFU/100cm    '
    FocusControl = dbe_hours
  end
  object Label4: TLabel
    Left = 206
    Top = 286
    Width = 36
    Height = 12
    Caption = #23457#26680#32773
  end
  object Label2: TLabel
    Left = 189
    Top = 224
    Width = 66
    Height = 12
    Caption = 'CFU/'#20214'     '
    FocusControl = dbe_hours
  end
  object Label3: TLabel
    Left = 244
    Top = 196
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
    Width = 59
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
    Left = 281
    Top = 88
    Width = 80
    Height = 20
    DataField = 'cyDate'
    DataSource = dmym.dsHospital
    TabOrder = 8
  end
  object dbe_reportDate: TDBEdit
    Left = 450
    Top = 283
    Width = 112
    Height = 20
    DataField = 'reportDate'
    DataSource = dmym.dsHospital
    TabOrder = 23
  end
  object btnClose: TBitBtn
    Left = 499
    Top = 311
    Width = 75
    Height = 25
    Caption = #36864#20986'(&C)'
    TabOrder = 26
    OnClick = btnCloseClick
  end
  object btnPrint: TBitBtn
    Left = 401
    Top = 311
    Width = 92
    Height = 25
    Caption = #25253#34920'(&R)'
    TabOrder = 25
    OnClick = btnPrintClick
  end
  object dbcSection: TDBComboBox
    Left = 281
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
    Left = 70
    Top = 283
    Width = 97
    Height = 20
    DataField = 'reporter'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    Items.Strings = (
      #40664#35748#29992#25143)
    TabOrder = 21
    OnKeyPress = dbcBGKeyPress
  end
  object dbe_hours: TDBEdit
    Left = 80
    Top = 140
    Width = 137
    Height = 20
    DataField = 'hhour'
    DataSource = dmym.dsHospital
    TabOrder = 10
  end
  object dbe_gname: TDBEdit
    Left = 320
    Top = 164
    Width = 177
    Height = 20
    DataField = 'germName'
    DataSource = dmym.dsHospital
    TabOrder = 18
  end
  object dbe_totalNum: TDBEdit
    Left = 112
    Top = 163
    Width = 73
    Height = 20
    DataField = 'anum'
    DataSource = dmym.dsHospital
    TabOrder = 12
  end
  object RadioButton1: TRadioButton
    Left = 16
    Top = 142
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
    Width = 97
    Height = 17
    Caption = #32454#33740#24635#33740#33853#25968
    TabOrder = 11
    OnClick = RadioButton2Click
  end
  object CheckBox1: TCheckBox
    Left = 256
    Top = 166
    Width = 57
    Height = 17
    Caption = #32454#33740#21517
    TabOrder = 17
    OnKeyPress = CheckBox1KeyPress
  end
  object btnSave: TBitBtn
    Left = 321
    Top = 311
    Width = 75
    Height = 25
    Caption = #23384#30424'(&S)'
    TabOrder = 24
    OnClick = btnSaveClick
  end
  object btnExtract: TButton
    Left = 136
    Top = 24
    Width = 54
    Height = 23
    Caption = #26631#26412#30331#35760
    TabOrder = 1
    OnClick = btnExtractClick
  end
  object dbc_samplingMan: TDBComboBox
    Left = 80
    Top = 88
    Width = 80
    Height = 20
    DataField = 'cyys'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    TabOrder = 7
    OnKeyPress = dbc_samplingManKeyPress
  end
  object dbe_ph: TDBEdit
    Left = 281
    Top = 56
    Width = 80
    Height = 20
    DataField = 'Spph'
    DataSource = dmym.dsHospital
    TabOrder = 5
    OnKeyPress = dbe_phKeyPress
  end
  object dbe_brand: TDBEdit
    Left = 80
    Top = 56
    Width = 77
    Height = 20
    DataField = 'Brand'
    DataSource = dmym.dsHospital
    TabOrder = 4
    OnKeyPress = dbe_brandKeyPress
  end
  object dbc_type: TDBComboBox
    Left = 459
    Top = 56
    Width = 100
    Height = 20
    DataField = 'Sptype'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    Items.Strings = (
      #39640#24230#21361#38505#24615
      #20013#24230#21361#38505#24615
      #20302#24230#21361#38505#24615)
    TabOrder = 6
    OnChange = dbc_typeChange
    OnKeyPress = dbc_typeKeyPress
  end
  object dbe_totalNum2: TDBEdit
    Left = 112
    Top = 192
    Width = 73
    Height = 20
    DataField = 'anum'
    DataSource = dmym.dsHospital
    TabOrder = 14
  end
  object RadioButton3: TRadioButton
    Left = 16
    Top = 192
    Width = 97
    Height = 17
    Caption = #32454#33740#24635#33740#33853#25968
    TabOrder = 13
    OnClick = RadioButton3Click
  end
  object dbc_shys: TDBComboBox
    Left = 247
    Top = 282
    Width = 106
    Height = 20
    Style = csDropDownList
    DataField = 'shys'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    TabOrder = 22
    OnKeyPress = dbc_shysKeyPress
  end
  object dbc_jcjg: TDBEdit
    Left = 344
    Top = 221
    Width = 65
    Height = 20
    DataField = 'YgbbJC'
    DataSource = dmym.dsHospital
    TabOrder = 27
    Visible = False
  end
  object dbc_gjbz: TDBEdit
    Left = 412
    Top = 219
    Width = 121
    Height = 20
    DataField = 'YgbbGB'
    DataSource = dmym.dsHospital
    TabOrder = 28
    Visible = False
  end
  object CheckBox2: TCheckBox
    Left = 20
    Top = 315
    Width = 21
    Height = 17
    TabOrder = 29
    Visible = False
    OnClick = CheckBox2Click
  end
  object dbe_totalNum3: TDBEdit
    Left = 111
    Top = 219
    Width = 73
    Height = 20
    DataField = 'anum'
    DataSource = dmym.dsHospital
    TabOrder = 16
  end
  object RadioButton4: TRadioButton
    Left = 16
    Top = 220
    Width = 93
    Height = 17
    Caption = #32454#33740#24635#33740#33853#25968
    TabOrder = 15
    OnClick = RadioButton4Click
  end
  object RadioButton5: TRadioButton
    Left = 16
    Top = 248
    Width = 17
    Height = 17
    Caption = 'RadioButton5'
    TabOrder = 19
  end
  object ComboBox1: TDBComboBox
    Left = 32
    Top = 248
    Width = 537
    Height = 20
    DataField = 'memo'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    TabOrder = 20
    OnKeyPress = ComboBox1KeyPress
  end
  object DBEdit1: TDBEdit
    Left = 360
    Top = 136
    Width = 121
    Height = 20
    TabOrder = 30
    Visible = False
  end
  object dbc_pinming: TDBComboBox
    Left = 460
    Top = 24
    Width = 99
    Height = 20
    DataField = 'room'
    DataSource = dmym.dsHospital
    ItemHeight = 12
    TabOrder = 3
    OnKeyPress = dbc_pinmingKeyPress
  end
  object Button1: TButton
    Left = 136
    Top = 24
    Width = 33
    Height = 23
    Caption = #32534#30721
    TabOrder = 31
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
    Left = 200
    Top = 317
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    Left = 248
    Top = 317
  end
  object rvMed: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsHospital
    Left = 288
    Top = 317
  end
  object ZFX_YX: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 398
    Top = 82
  end
end
