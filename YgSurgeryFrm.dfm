object YgSurgeryForm: TYgSurgeryForm
  Left = 539
  Top = 188
  BorderStyle = bsDialog
  Caption = #38498#20869#24863#26579#20998#26512#65293#65293#25163#26415#23460
  ClientHeight = 425
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
    Height = 425
    Align = alClient
    TabOrder = 0
    object lblSdoctor: TLabel
      Left = 224
      Top = 66
      Width = 48
      Height = 12
      Caption = #37319' '#26679' '#32773
    end
    object Label12: TLabel
      Left = 378
      Top = 352
      Width = 48
      Height = 12
      Caption = #25253#21578#26085#26399
      FocusControl = dbe_reportDate
    end
    object Label14: TLabel
      Left = 18
      Top = 352
      Width = 36
      Height = 12
      Caption = #25253#21578#32773
    end
    object Label18: TLabel
      Left = 228
      Top = 240
      Width = 132
      Height = 12
      Caption = #23567#26102#21518#65292#20998#26512#26080#32454#33740#29983#38271
      FocusControl = dbe_hours
    end
    object labunit3: TLabel
      Left = 227
      Top = 268
      Width = 24
      Height = 12
      Caption = #21333#20301
      FocusControl = dbe_hours
    end
    object lblRoom: TLabel
      Left = 406
      Top = 28
      Width = 48
      Height = 12
      Caption = #25151' '#38388' '#21495
    end
    object lblSDate: TLabel
      Left = 406
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
      Left = 10
      Top = 343
      Width = 565
      Height = 1
    end
    object Shape1: TShape
      Left = 10
      Top = 223
      Width = 565
      Height = 1
    end
    object Shape3: TShape
      Left = 10
      Top = 116
      Width = 565
      Height = 1
    end
    object Label4: TLabel
      Left = 215
      Top = 351
      Width = 36
      Height = 12
      Caption = #23457#26680#32773
    end
    object Label1: TLabel
      Left = 20
      Top = 64
      Width = 48
      Height = 12
      Caption = #29615#22659#31867#21035
      FocusControl = dbe_SpecNum
    end
    object btnClose: TBitBtn
      Left = 503
      Top = 382
      Width = 75
      Height = 25
      Caption = #36864#20986'(&C)'
      TabOrder = 19
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
      Top = 382
      Width = 86
      Height = 25
      Caption = #25253#34920'(&R)'
      TabOrder = 18
      OnClick = btnPrintClick
    end
    object btnSave: TBitBtn
      Left = 323
      Top = 382
      Width = 75
      Height = 25
      Caption = #20445#23384'(&S)'
      TabOrder = 17
      OnClick = btnSaveClick
    end
    object CheckBox1: TCheckBox
      Left = 53
      Top = 288
      Width = 57
      Height = 17
      Caption = #32454#33740#21517
      TabOrder = 10
      OnKeyPress = CheckBox1KeyPress
    end
    object dbc_samplingMan: TDBComboBox
      Left = 278
      Top = 61
      Width = 107
      Height = 20
      DataField = 'cyys'
      DataSource = dmym.dsHospital
      ItemHeight = 12
      TabOrder = 4
      OnKeyPress = dbc_samplingManKeyPress
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
      TabOrder = 5
      OnKeyPress = dbe_cydateKeyPress
    end
    object dbe_gname: TDBEdit
      Left = 117
      Top = 286
      Width = 140
      Height = 20
      DataField = 'germName'
      DataSource = dmym.dsHospital
      TabOrder = 11
    end
    object dbe_hours: TDBEdit
      Left = 84
      Top = 236
      Width = 137
      Height = 20
      DataField = 'hhour'
      DataSource = dmym.dsHospital
      TabOrder = 7
    end
    object dbe_reportDate: TDBEdit
      Left = 434
      Top = 348
      Width = 112
      Height = 20
      DataField = 'reportDate'
      DataSource = dmym.dsHospital
      TabOrder = 16
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
      Left = 116
      Top = 264
      Width = 105
      Height = 20
      DataField = 'anum'
      DataSource = dmym.dsHospital
      TabOrder = 9
    end
    object RadioButton2: TRadioButton
      Left = 20
      Top = 266
      Width = 97
      Height = 17
      Caption = #32454#33740#24635#33740#33853#25968
      TabOrder = 8
    end
    object RadioButton1: TRadioButton
      Left = 20
      Top = 237
      Width = 57
      Height = 17
      Caption = #32463#22521#20859
      Checked = True
      TabOrder = 6
      TabStop = True
    end
    object dbc_gjbz: TDBEdit
      Left = 20
      Top = 379
      Width = 121
      Height = 20
      DataField = 'YgbbGB'
      DataSource = dmym.dsHospital
      TabOrder = 20
      Visible = False
    end
    object dbc_jcjg: TDBEdit
      Left = 144
      Top = 380
      Width = 121
      Height = 20
      DataField = 'YgbbJC'
      DataSource = dmym.dsHospital
      TabOrder = 21
      Visible = False
    end
    object dbc_shys: TDBComboBox
      Left = 257
      Top = 347
      Width = 74
      Height = 20
      Style = csDropDownList
      DataField = 'shys'
      DataSource = dmym.dsHospital
      ItemHeight = 12
      TabOrder = 15
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
      Top = 316
      Width = 17
      Height = 17
      Caption = 'RadioButton3'
      TabOrder = 12
    end
    object ComboBox1: TDBComboBox
      Left = 36
      Top = 316
      Width = 501
      Height = 20
      DataField = 'memo'
      DataSource = dmym.dsHospital
      ItemHeight = 12
      TabOrder = 13
      OnKeyPress = ComboBox1KeyPress
    end
    object Button1: TButton
      Left = 136
      Top = 22
      Width = 33
      Height = 23
      Caption = #32534#30721
      TabOrder = 22
      Visible = False
      OnClick = Button1Click
    end
    object dbcBG: TDBComboBox
      Left = 60
      Top = 348
      Width = 97
      Height = 20
      DataField = 'reporter'
      DataSource = dmym.dsHospital
      ItemHeight = 12
      Items.Strings = (
        #40664#35748#29992#25143)
      TabOrder = 14
      OnKeyPress = dbcBGKeyPress
    end
    object GroupBox1: TGroupBox
      Left = 76
      Top = 52
      Width = 141
      Height = 61
      TabOrder = 23
      object Label6: TLabel
        Left = 7
        Top = 18
        Width = 24
        Height = 12
        Caption = #31561#32423
      end
      object Label7: TLabel
        Left = 7
        Top = 39
        Width = 24
        Height = 12
        Caption = #21306#22495
      end
    end
    object GroupBox2: TGroupBox
      Left = 20
      Top = 120
      Width = 553
      Height = 97
      TabOrder = 24
      object labunit1: TLabel
        Left = 197
        Top = 25
        Width = 114
        Height = 12
        Caption = 'cfu/(30min'#183#934'90'#30399')'
      end
      object labunit2: TLabel
        Left = 197
        Top = 69
        Width = 42
        Height = 12
        Caption = 'cfu/m^3'
      end
      object RadioButton4: TRadioButton
        Left = 8
        Top = 24
        Width = 61
        Height = 17
        Caption = #27785#38477#27861
        TabOrder = 0
        OnClick = RadioButton4Click
        OnKeyPress = RadioButton4KeyPress
      end
      object RadioButton5: TRadioButton
        Left = 8
        Top = 68
        Width = 61
        Height = 17
        Caption = #28014#28216#27861
        TabOrder = 1
        OnClick = RadioButton5Click
        OnKeyPress = RadioButton5KeyPress
      end
      object Edit1: TEdit
        Left = 72
        Top = 24
        Width = 121
        Height = 20
        TabOrder = 2
        OnChange = Edit1Change
        OnKeyPress = Edit1KeyPress
      end
      object Edit2: TEdit
        Left = 72
        Top = 64
        Width = 121
        Height = 20
        TabOrder = 3
        OnChange = Edit2Change
        OnKeyPress = Edit2KeyPress
      end
    end
    object dbc_grade: TComboBox
      Left = 112
      Top = 64
      Width = 88
      Height = 20
      ItemHeight = 12
      TabOrder = 25
      OnChange = dbc_gradeChange
      OnKeyPress = dbc_gradeKeyPress
      Items.Strings = (
        'I'
        'II'
        'III'
        'IV')
    end
    object dbc_area: TComboBox
      Left = 112
      Top = 88
      Width = 88
      Height = 20
      ItemHeight = 12
      TabOrder = 26
      OnChange = dbc_gradeChange
      OnKeyPress = dbc_areaKeyPress
      Items.Strings = (
        'I'
        'II')
    end
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    LoadDesigner = True
    Left = 28
    Top = 1
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
    Left = 76
    Top = 1
  end
  object rvsurgery: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsHospital
    Left = 161
    Top = 1
  end
  object ZFX_YX: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 120
    Top = 65533
  end
end
