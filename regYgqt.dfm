object regYgqtForm: TregYgqtForm
  Left = 410
  Top = 184
  BorderStyle = bsDialog
  Caption = #38498#20869#24863#26579#26631#26412#30331#35760'('#20854#20182')'
  ClientHeight = 356
  ClientWidth = 554
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
  object Label4: TLabel
    Left = 6
    Top = 320
    Width = 32
    Height = 13
    Caption = 'Label4'
  end
  object DBGrid1: TDBGrid
    Left = 6
    Top = 156
    Width = 537
    Height = 162
    TabStop = False
    DataSource = dmym.dsRegYg
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'specNum'
        Title.Caption = #26631#26412#21495
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'secName'
        Title.Caption = '  '#31185#23460
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'room'
        Title.Caption = #26631#26412#26469#28304
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CYlb'
        Title.Caption = #37319#26679#31867#21035
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hjlb'
        Title.Caption = #29615#22659#31867#21035
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'glass'
        Title.Caption = #24179#30399#22411#21495
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ctime'
        Title.Caption = #37319#26679#26102#38388
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cysl'
        Title.Caption = #37319#26679#25968#37327
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Area'
        Title.Caption = #37319#26679#38754#31215
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cyys'
        Title.Caption = #37319#26679#21307#24072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cydate'
        Title.Caption = #37319#26679#26085#26399
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Brand'
        Title.Caption = 'brand'
        Visible = True
      end>
  end
  object GroupBox2: TGroupBox
    Left = 6
    Top = 90
    Width = 537
    Height = 65
    TabOrder = 1
    object btnAdd: TButton
      Left = 24
      Top = 24
      Width = 81
      Height = 33
      Caption = #26032'   '#22686
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnDel: TButton
      Left = 240
      Top = 24
      Width = 73
      Height = 33
      Caption = #21024'  '#38500
      TabOrder = 2
      OnClick = btnDelClick
    end
    object btnExit: TButton
      Left = 448
      Top = 24
      Width = 81
      Height = 33
      Caption = #36864'  '#20986
      TabOrder = 4
      OnClick = btnExitClick
    end
    object btnSave: TButton
      Left = 136
      Top = 24
      Width = 73
      Height = 33
      Caption = #20445'  '#23384
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnExtract: TButton
      Left = 344
      Top = 24
      Width = 73
      Height = 33
      Caption = #25552'  '#21462
      TabOrder = 3
      OnClick = btnExtractClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 2
    Width = 537
    Height = 89
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 30
      Width = 66
      Height = 12
      Caption = #26631' '#26412' '#21495'   '
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 358
      Top = 30
      Width = 48
      Height = 12
      Caption = #21697'    '#21517
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 358
      Top = 60
      Width = 48
      Height = 12
      Caption = #37319#26679#31867#21035
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object Label5: TLabel
      Left = 184
      Top = 28
      Width = 72
      Height = 12
      Caption = #31185'    '#23460'    '
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 185
      Top = 60
      Width = 66
      Height = 12
      Caption = #37319#26679#26085#26399'   '
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 14
      Top = 62
      Width = 60
      Height = 12
      Caption = #37319' '#26679' '#32773'  '
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblEnviron: TLabel
      Left = 293
      Top = 90
      Width = 36
      Height = 13
      Caption = #21830'    '#26631
      Visible = False
    end
    object lblGlass: TLabel
      Left = 122
      Top = 120
      Width = 36
      Height = 13
      Caption = #25209'    '#21495
      Visible = False
    end
    object lblStime: TLabel
      Left = 293
      Top = 123
      Width = 48
      Height = 13
      Caption = #21830#21697#31867#22411
      Visible = False
    end
    object dbe_specNumber: TDBEdit
      Left = 68
      Top = 26
      Width = 75
      Height = 21
      DataField = 'specNum'
      DataSource = dmym.dsRegYg
      MaxLength = 10
      TabOrder = 0
      OnKeyPress = dbe_specNumberKeyPress
    end
    object dbc_sectionName: TDBComboBox
      Left = 246
      Top = 26
      Width = 97
      Height = 21
      DataField = 'secName'
      DataSource = dmym.dsRegYg
      ItemHeight = 13
      TabOrder = 1
      OnKeyPress = dbc_sectionNameKeyPress
    end
    object dbc_sampleDoctor: TDBComboBox
      Left = 67
      Top = 56
      Width = 80
      Height = 21
      DataField = 'cyys'
      DataSource = dmym.dsRegYg
      ItemHeight = 13
      TabOrder = 3
      OnKeyPress = dbc_sampleDoctorKeyPress
    end
    object dbe_cDate: TDBEdit
      Left = 246
      Top = 58
      Width = 95
      Height = 21
      DataField = 'cyDate'
      DataSource = dmym.dsRegYg
      TabOrder = 4
    end
    object DBComboBox1: TDBComboBox
      Left = 425
      Top = 58
      Width = 98
      Height = 21
      DataField = 'CYlb'
      DataSource = dmym.dsRegYg
      ItemHeight = 13
      Items.Strings = (
        #31354#27668
        #29289#20307#34920#38754
        #21307#25252#20154#21592#25163
        #21307#30103#29992#21697
        #28040#27602#28082#19982#20445#23384#28082
        #20854#20182)
      TabOrder = 5
      Visible = False
    end
    object dbe_brand: TDBEdit
      Left = 346
      Top = 88
      Width = 105
      Height = 21
      DataField = 'Brand'
      DataSource = dmym.dsHospital
      TabOrder = 6
      Visible = False
    end
    object dbe_ph: TDBEdit
      Left = 193
      Top = 115
      Width = 81
      Height = 21
      DataField = 'Spph'
      DataSource = dmym.dsHospital
      TabOrder = 7
      Visible = False
    end
    object dbc_type: TDBComboBox
      Left = 348
      Top = 115
      Width = 102
      Height = 21
      DataField = 'Sptype'
      DataSource = dmym.dsHospital
      ItemHeight = 13
      Items.Strings = (
        #26080#25509#35302#30340#21307#30103#29992#21697
        #25509#35302#31896#33180#30340#21307#30103#29992#21697
        #25509#35302#30382#32932#30340#21307#30103#29992#21697)
      TabOrder = 8
      Visible = False
    end
    object dbc_pinming: TDBComboBox
      Left = 426
      Top = 26
      Width = 97
      Height = 21
      DataField = 'room'
      DataSource = dmym.dsRegYg
      ItemHeight = 13
      TabOrder = 2
      OnKeyPress = dbc_pinmingKeyPress
    end
    object Button1: TButton
      Left = 143
      Top = 23
      Width = 33
      Height = 25
      Caption = #32534#30721
      TabOrder = 9
      Visible = False
      OnClick = Button1Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 42
    Top = 320
  end
end
