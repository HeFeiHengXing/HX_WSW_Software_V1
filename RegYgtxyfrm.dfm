object RegYgtxyform: TRegYgtxyform
  Left = 344
  Top = 228
  BorderStyle = bsDialog
  Caption = #38498#20869#24863#26579#26631#26412#30331#35760'--'#36879#26512#28082
  ClientHeight = 394
  ClientWidth = 563
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 376
    Width = 36
    Height = 12
    Caption = 'Label4'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 226
    Width = 537
    Height = 145
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
        Width = 61
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 4
    Width = 537
    Height = 145
    TabOrder = 0
    object Label1: TLabel
      Left = 18
      Top = 24
      Width = 48
      Height = 12
      Caption = #26631' '#26412' '#21495
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 354
      Top = 26
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
      Left = 353
      Top = 100
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
      Left = 188
      Top = 24
      Width = 48
      Height = 12
      Caption = #31185'    '#23460
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 188
      Top = 102
      Width = 48
      Height = 12
      Caption = #37319#26679#26085#26399
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 20
      Top = 102
      Width = 48
      Height = 12
      Caption = #37319' '#26679' '#32773
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblEnviron: TLabel
      Left = 18
      Top = 62
      Width = 48
      Height = 12
      Caption = #21830'    '#26631
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblGlass: TLabel
      Left = 188
      Top = 62
      Width = 48
      Height = 12
      Caption = #25209'    '#21495
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblStime: TLabel
      Left = 354
      Top = 62
      Width = 48
      Height = 12
      Caption = #21830#21697#31867#22411
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object dbe_specNumber: TDBEdit
      Left = 73
      Top = 20
      Width = 77
      Height = 20
      DataField = 'specNum'
      DataSource = dmym.dsRegYg
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      OnKeyPress = dbe_specNumberKeyPress
    end
    object dbc_sectionName: TDBComboBox
      Left = 249
      Top = 20
      Width = 80
      Height = 20
      DataField = 'secName'
      DataSource = dmym.dsRegYg
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 12
      ParentFont = False
      TabOrder = 1
      OnKeyPress = dbc_sectionNameKeyPress
    end
    object dbc_sampleDoctor: TDBComboBox
      Left = 74
      Top = 98
      Width = 77
      Height = 20
      DataField = 'cyys'
      DataSource = dmym.dsRegYg
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 12
      ParentFont = False
      TabOrder = 6
      OnKeyPress = dbc_sampleDoctorKeyPress
    end
    object dbe_cDate: TDBEdit
      Left = 249
      Top = 98
      Width = 80
      Height = 20
      DataField = 'cyDate'
      DataSource = dmym.dsRegYg
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object DBComboBox1: TDBComboBox
      Left = 415
      Top = 98
      Width = 88
      Height = 20
      DataField = 'CYlb'
      DataSource = dmym.dsRegYg
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 12
      Items.Strings = (
        #31354#27668
        #29289#20307#34920#38754
        #21307#25252#20154#21592#25163
        #21307#30103#29992#21697
        #28040#27602#28082#19982#20445#23384#28082)
      ParentFont = False
      TabOrder = 8
      Visible = False
    end
    object dbe_brand: TDBEdit
      Left = 74
      Top = 58
      Width = 77
      Height = 20
      DataField = 'Brand'
      DataSource = dmym.dsHospital
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = dbe_brandKeyPress
    end
    object dbe_ph: TDBEdit
      Left = 248
      Top = 60
      Width = 80
      Height = 20
      DataField = 'Spph'
      DataSource = dmym.dsHospital
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnKeyPress = dbe_phKeyPress
    end
    object dbc_type: TDBComboBox
      Left = 413
      Top = 58
      Width = 92
      Height = 20
      DataField = 'Sptype'
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
      TabOrder = 5
      OnKeyPress = dbc_typeKeyPress
    end
    object dbc_pinming: TDBComboBox
      Left = 414
      Top = 22
      Width = 89
      Height = 20
      DataField = 'room'
      DataSource = dmym.dsRegYg
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 12
      ParentFont = False
      TabOrder = 2
      OnKeyPress = dbc_pinmingKeyPress
    end
    object Button1: TButton
      Left = 151
      Top = 18
      Width = 32
      Height = 25
      Caption = #32534#30721
      TabOrder = 9
      Visible = False
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 150
    Width = 537
    Height = 73
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
      Left = 450
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
  object ADOQuery1: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 48
    Top = 372
  end
end
