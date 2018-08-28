object Ygtxy: TYgtxy
  Left = 550
  Top = 302
  BorderStyle = bsDialog
  Caption = #38498#20869#24863#26579#20998#26512#65293#65293#36879#26512#28082
  ClientHeight = 292
  ClientWidth = 624
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
  object Shape1: TShape
    Left = 6
    Top = 130
    Width = 613
    Height = 1
  end
  object Label10: TLabel
    Left = 142
    Top = 142
    Width = 132
    Height = 12
    Caption = #23567#26102#21518#65292#20998#26512#26080#32454#33740#29983#38271
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 228
    Top = 166
    Width = 36
    Height = 13
    Caption = 'CFU/ml'
  end
  object Shape2: TShape
    Left = 6
    Top = 220
    Width = 611
    Height = 1
  end
  object Label12: TLabel
    Left = 416
    Top = 230
    Width = 48
    Height = 12
    Caption = #25253#21578#26085#26399
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 10
    Top = 230
    Width = 36
    Height = 12
    Caption = #25253#21578#32773
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 216
    Top = 230
    Width = 36
    Height = 12
    Caption = #23457#26680#32773
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object dbe_hours: TDBEdit
    Left = 67
    Top = 138
    Width = 72
    Height = 20
    DataField = 'hhour'
    DataSource = dmym.dsHospital
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object RadioButton1: TRadioButton
    Left = 6
    Top = 140
    Width = 59
    Height = 17
    Caption = #32463#22521#20859
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object RadioButton2: TRadioButton
    Left = 6
    Top = 164
    Width = 69
    Height = 17
    Caption = #33740#33853#24635#25968
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object RadioButton3: TRadioButton
    Left = 6
    Top = 190
    Width = 23
    Height = 17
    TabOrder = 7
  end
  object dbe_totalnum: TDBEdit
    Left = 76
    Top = 162
    Width = 141
    Height = 20
    DataField = 'anum'
    DataSource = dmym.dsHospital
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBComboBox5: TDBComboBox
    Left = 24
    Top = 188
    Width = 553
    Height = 20
    DataField = 'memo'
    DataSource = dmym.dsHospital
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 8
    OnKeyPress = DBComboBox5KeyPress
  end
  object Panel1: TPanel
    Left = 4
    Top = 2
    Width = 613
    Height = 123
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 20
      Width = 48
      Height = 12
      Caption = #26631' '#26412' '#21495
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 14
      Top = 54
      Width = 48
      Height = 12
      Caption = #21830'    '#26631
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 14
      Top = 82
      Width = 48
      Height = 12
      Caption = #37319' '#26679' '#32773
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 242
      Top = 20
      Width = 48
      Height = 12
      Caption = #31185'    '#23460
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 242
      Top = 50
      Width = 48
      Height = 12
      Caption = #25209'    '#21495
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 242
      Top = 82
      Width = 48
      Height = 12
      Caption = #37319#26679#26085#26399
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 418
      Top = 22
      Width = 48
      Height = 12
      Caption = #21697'    '#21517
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 418
      Top = 50
      Width = 48
      Height = 12
      Caption = #21830#21697#31867#22411
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object dbe_specnum: TDBEdit
      Left = 68
      Top = 16
      Width = 73
      Height = 20
      DataField = 'specnum'
      DataSource = dmym.dsHospital
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      OnClick = dbe_specnumClick
      OnKeyPress = dbe_specnumKeyPress
    end
    object dbe_brand: TDBEdit
      Left = 68
      Top = 48
      Width = 87
      Height = 20
      DataField = 'brand'
      DataSource = dmym.dsHospital
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnKeyPress = dbe_brandKeyPress
    end
    object dbc_samplingman: TDBComboBox
      Left = 68
      Top = 78
      Width = 91
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
      TabOrder = 7
      OnKeyPress = dbc_samplingmanKeyPress
    end
    object dbc_section: TDBComboBox
      Left = 296
      Top = 20
      Width = 103
      Height = 20
      DataField = 'secname'
      DataSource = dmym.dsHospital
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 12
      ParentFont = False
      TabOrder = 2
      OnKeyPress = dbc_sectionKeyPress
    end
    object dbe_ph: TDBEdit
      Left = 298
      Top = 48
      Width = 101
      Height = 20
      DataField = 'spph'
      DataSource = dmym.dsHospital
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnKeyPress = dbe_phKeyPress
    end
    object dbe_cydate: TDBEdit
      Left = 296
      Top = 78
      Width = 101
      Height = 20
      DataField = 'cydate'
      DataSource = dmym.dsHospital
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object dbc_pinming: TDBComboBox
      Left = 476
      Top = 20
      Width = 95
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
    object dbc_type: TDBComboBox
      Left = 476
      Top = 48
      Width = 95
      Height = 20
      DataField = 'sptype'
      DataSource = dmym.dsHospital
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 12
      Items.Strings = (
        #20837#21475#28082
        #20986#21475#28082
        #21453#28183#27700
        #36879#26512#29992#27700
        #36879#26512'A'#28082
        #36879#26512'B'#28082
        'B'#24178#31881
        #37197#28082#26742)
      ParentFont = False
      TabOrder = 6
      OnChange = dbc_typeChange
      OnKeyPress = dbc_typeKeyPress
    end
    object btnextract: TButton
      Left = 143
      Top = 16
      Width = 58
      Height = 23
      Caption = #26631#26412#30331#35760
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnExtractClick
    end
    object Button1: TButton
      Left = 141
      Top = 16
      Width = 37
      Height = 23
      Caption = #32534#30721
      TabOrder = 9
      Visible = False
      OnClick = Button1Click
    end
  end
  object dbc_reporter: TDBComboBox
    Left = 54
    Top = 226
    Width = 73
    Height = 20
    DataField = 'reporter'
    DataSource = dmym.dsHospital
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 9
  end
  object dbc_shys: TDBComboBox
    Left = 260
    Top = 226
    Width = 93
    Height = 20
    Style = csDropDownList
    DataField = 'shys'
    DataSource = dmym.dsHospital
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 10
  end
  object dbe_reportdate: TDBEdit
    Left = 472
    Top = 226
    Width = 105
    Height = 20
    DataField = 'reportdate'
    DataSource = dmym.dsHospital
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 11
  end
  object btnprint: TButton
    Left = 422
    Top = 256
    Width = 83
    Height = 25
    Caption = #25253#34920'(&R)'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnClick = btnprintClick
  end
  object btnsave: TButton
    Left = 340
    Top = 256
    Width = 75
    Height = 25
    Caption = #23384#30424'(&S)'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = btnsaveClick
  end
  object BtnClose: TButton
    Left = 512
    Top = 256
    Width = 75
    Height = 25
    Caption = #36864#20986#65288'&C'#65289
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnClick = BtnCloseClick
  end
  object ygBBJC: TDBEdit
    Left = 280
    Top = 136
    Width = 73
    Height = 21
    DataField = 'YgBBjc'
    DataSource = dmym.dsHospital
    TabOrder = 15
    Visible = False
  end
  object ygbbgb: TDBEdit
    Left = 356
    Top = 136
    Width = 65
    Height = 21
    DataField = 'ygBBgb'
    DataSource = dmym.dsHospital
    TabOrder = 16
    Visible = False
  end
  object dbe_gname: TDBEdit
    Left = 340
    Top = 162
    Width = 121
    Height = 20
    DataField = 'germname'
    DataSource = dmym.dsHospital
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object CheckBox1: TCheckBox
    Left = 278
    Top = 164
    Width = 63
    Height = 17
    Caption = #32454#33740#21517
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = CheckBox1Click
    OnKeyPress = CheckBox1KeyPress
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    Left = 12
    Top = 248
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
    Left = 48
    Top = 248
  end
  object RvDataSetConnection1: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsHospital
    Left = 84
    Top = 248
  end
  object ZFX_YX: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 118
    Top = 248
  end
end
