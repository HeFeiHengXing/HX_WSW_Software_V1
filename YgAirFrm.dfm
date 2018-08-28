object YgAirForm: TYgAirForm
  Left = 317
  Top = 156
  BorderStyle = bsDialog
  Caption = #38498#20869#24863#26579#20998#26512#65293#65293#31354#27668
  ClientHeight = 341
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 341
    Align = alClient
    TabOrder = 0
    DesignSize = (
      595
      341)
    object lblSdoctor: TLabel
      Left = 224
      Top = 66
      Width = 48
      Height = 12
      Caption = #37319' '#26679' '#32773
    end
    object Label12: TLabel
      Left = 402
      Top = 268
      Width = 48
      Height = 12
      Caption = #25253#21578#26085#26399
      FocusControl = dbe_reportDate
    end
    object Label14: TLabel
      Left = 18
      Top = 268
      Width = 36
      Height = 12
      Caption = #25253#21578#32773
    end
    object Label18: TLabel
      Left = 228
      Top = 160
      Width = 132
      Height = 12
      Caption = #23567#26102#21518#65292#20998#26512#26080#32454#33740#29983#38271
      FocusControl = dbe_hours
    end
    object Label20: TLabel
      Left = 226
      Top = 188
      Width = 42
      Height = 12
      Caption = 'CFU/m^3'
      FocusControl = dbe_hours
    end
    object lbl_cfu: TLabel
      Left = 409
      Top = 114
      Width = 24
      Height = 12
      Caption = 'CFU '
    end
    object lblEnviron: TLabel
      Left = 20
      Top = 63
      Width = 48
      Height = 12
      Caption = #29615#22659#31867#21035
    end
    object lblGermNum: TLabel
      Left = 208
      Top = 115
      Width = 72
      Height = 12
      Caption = #24179#30399#24635#33740#33853#25968
      FocusControl = dbe_gnum
    end
    object lblRoom: TLabel
      Left = 406
      Top = 28
      Width = 48
      Height = 12
      Caption = #25151' '#38388' '#21495
    end
    object lblSDate: TLabel
      Left = 407
      Top = 64
      Width = 48
      Height = 12
      Caption = #37319#26679#26085#26399
      FocusControl = dbe_cydate
    end
    object lblSecName: TLabel
      Left = 223
      Top = 29
      Width = 48
      Height = 12
      Caption = #31185'    '#23460
    end
    object lblSpecNum: TLabel
      Left = 20
      Top = 28
      Width = 48
      Height = 12
      Caption = #26631' '#26412' '#21495
      FocusControl = dbe_SpecNum
    end
    object Shape2: TShape
      Left = 12
      Top = 253
      Width = 560
      Height = 1
    end
    object Shape1: TShape
      Left = 16
      Top = 143
      Width = 558
      Height = 1
    end
    object Shape3: TShape
      Left = 16
      Top = 92
      Width = 558
      Height = 1
    end
    object Label2: TLabel
      Left = 18
      Top = 115
      Width = 60
      Height = 12
      Caption = #24179#30399#24635#25968#37327
    end
    object Label3: TLabel
      Left = 188
      Top = 113
      Width = 12
      Height = 12
      Caption = #20010
    end
    object Label4: TLabel
      Left = 223
      Top = 267
      Width = 36
      Height = 12
      Caption = #23457#26680#32773
    end
    object btnClose: TBitBtn
      Left = 503
      Top = 298
      Width = 75
      Height = 25
      Caption = #36864#20986'(&C)'
      TabOrder = 22
      OnClick = btnCloseClick
    end
    object btnExtract: TButton
      Left = 137
      Top = 22
      Width = 53
      Height = 23
      Caption = #26631#26412#30331#35760
      TabOrder = 1
      OnClick = btnExtractClick
    end
    object btnPrint: TBitBtn
      Left = 407
      Top = 298
      Width = 86
      Height = 25
      Caption = #25253#34920'(&R)'
      TabOrder = 21
      OnClick = btnPrintClick
    end
    object btnSave: TBitBtn
      Left = 323
      Top = 298
      Width = 75
      Height = 25
      Caption = #23384#30424'(&S)'
      TabOrder = 20
      OnClick = btnSaveClick
    end
    object CheckBox1: TCheckBox
      Left = 374
      Top = 186
      Width = 57
      Height = 17
      Caption = #32454#33740#21517
      TabOrder = 13
      OnKeyPress = CheckBox1KeyPress
    end
    object dbc_environ: TDBComboBox
      Left = 75
      Top = 61
      Width = 88
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
    object dbc_samplingMan: TDBComboBox
      Left = 278
      Top = 61
      Width = 107
      Height = 20
      DataField = 'cyys'
      DataSource = dmym.dsHospital
      ItemHeight = 12
      TabOrder = 5
      OnKeyPress = dbc_samplingManKeyPress
    end
    object dbcBG: TDBComboBox
      Left = 60
      Top = 264
      Width = 97
      Height = 20
      DataField = 'reporter'
      DataSource = dmym.dsHospital
      ItemHeight = 12
      Items.Strings = (
        #40664#35748#29992#25143)
      TabOrder = 17
      OnKeyPress = dbcBGKeyPress
    end
    object dbcSection: TDBComboBox
      Left = 280
      Top = 24
      Width = 103
      Height = 20
      DataField = 'secName'
      DataSource = dmym.dsHospital
      ItemHeight = 12
      TabOrder = 2
      OnKeyPress = dbcSectionKeyPress
    end
    object dbe_cydate: TDBEdit
      Left = 460
      Top = 60
      Width = 111
      Height = 20
      DataField = 'cyDate'
      DataSource = dmym.dsHospital
      TabOrder = 6
      OnKeyPress = dbe_cydateKeyPress
    end
    object dbe_gname: TDBEdit
      Left = 432
      Top = 184
      Width = 137
      Height = 20
      DataField = 'germName'
      DataSource = dmym.dsHospital
      TabOrder = 14
    end
    object dbe_gnum: TDBEdit
      Left = 286
      Top = 110
      Width = 115
      Height = 20
      Anchors = [akTop]
      DataField = 'germNum'
      DataSource = dmym.dsHospital
      TabOrder = 8
      OnChange = dbe_pmNumChange
      OnKeyPress = dbe_gnumKeyPress
    end
    object dbe_hours: TDBEdit
      Left = 92
      Top = 156
      Width = 114
      Height = 20
      DataField = 'hhour'
      DataSource = dmym.dsHospital
      TabOrder = 10
    end
    object dbe_reportDate: TDBEdit
      Left = 458
      Top = 264
      Width = 112
      Height = 20
      DataField = 'reportDate'
      DataSource = dmym.dsHospital
      TabOrder = 19
    end
    object dbe_SpecNum: TDBEdit
      Left = 75
      Top = 24
      Width = 61
      Height = 20
      DataField = 'specNum'
      DataSource = dmym.dsHospital
      MaxLength = 10
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnKeyPress = dbe_SpecNumKeyPress
    end
    object dbe_totalNum: TDBEdit
      Left = 91
      Top = 184
      Width = 113
      Height = 20
      DataField = 'anum'
      DataSource = dmym.dsHospital
      TabOrder = 12
    end
    object RadioButton2: TRadioButton
      Left = 20
      Top = 186
      Width = 69
      Height = 17
      Caption = #33740#33853#24635#25968
      TabOrder = 11
    end
    object RadioButton1: TRadioButton
      Left = 20
      Top = 157
      Width = 57
      Height = 17
      Caption = #32463#22521#20859
      Checked = True
      TabOrder = 9
      TabStop = True
    end
    object dbe_pmNum: TDBEdit
      Left = 81
      Top = 110
      Width = 100
      Height = 20
      BiDiMode = bdLeftToRight
      DataField = 'pmNum'
      DataSource = dmym.dsHospital
      ParentBiDiMode = False
      TabOrder = 7
      OnChange = dbe_pmNumChange
      OnKeyPress = dbe_pmNumKeyPress
    end
    object dbc_gjbz: TDBEdit
      Left = 448
      Top = 111
      Width = 121
      Height = 20
      DataField = 'YgbbGB'
      DataSource = dmym.dsHospital
      TabOrder = 23
      Visible = False
    end
    object dbc_jcjg: TDBEdit
      Left = 448
      Top = 128
      Width = 121
      Height = 20
      DataField = 'YgbbJC'
      DataSource = dmym.dsHospital
      TabOrder = 24
      Visible = False
    end
    object dbc_shys: TDBComboBox
      Left = 277
      Top = 263
      Width = 74
      Height = 20
      Style = csDropDownList
      DataField = 'shys'
      DataSource = dmym.dsHospital
      ItemHeight = 12
      TabOrder = 18
      OnKeyPress = dbc_shysKeyPress
    end
    object dbe_room: TDBEdit
      Left = 460
      Top = 24
      Width = 110
      Height = 20
      DataField = 'room'
      DataSource = dmym.dsHospital
      TabOrder = 3
      OnKeyPress = dbe_roomKeyPress
    end
    object RadioButton3: TRadioButton
      Left = 20
      Top = 220
      Width = 17
      Height = 17
      Caption = 'RadioButton3'
      TabOrder = 15
    end
    object ComboBox1: TDBComboBox
      Left = 36
      Top = 220
      Width = 537
      Height = 20
      DataField = 'memo'
      DataSource = dmym.dsHospital
      ItemHeight = 12
      TabOrder = 16
      OnKeyPress = ComboBox1KeyPress
    end
    object Button1: TButton
      Left = 136
      Top = 22
      Width = 33
      Height = 23
      Caption = #32534#30721
      TabOrder = 25
      Visible = False
      OnClick = Button1Click
    end
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    LoadDesigner = True
    Left = 236
    Top = 283
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
    Left = 272
    Top = 281
  end
  object rvaircon: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 193
    Top = 283
  end
  object ZFX_YX: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 160
    Top = 280
  end
end
