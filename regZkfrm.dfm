object regZkform: TregZkform
  Left = 264
  Top = 168
  BorderStyle = bsDialog
  Caption = #36136#25511#26631#26412#30331#35760
  ClientHeight = 457
  ClientWidth = 599
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 22
    Top = 430
    Width = 42
    Height = 13
    Caption = 'Label6'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 284
    Width = 537
    Height = 145
    TabStop = False
    DataSource = dmym.dsRegZk
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
        FieldName = 'bbh'
        Title.Caption = #26631#26412#21495
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lczd'
        Title.Caption = '    '#20020#24202#35786#26029
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sex'
        Title.Caption = #24615#21035
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bb'
        Title.Caption = #26631#26412#31867#22411
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'old'
        Title.Caption = '  '#24180#40836
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sj'
        Title.Caption = #36865#26816#21333#20301
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cydate'
        Title.Caption = #36865#26816#26085#26399
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
    Left = 24
    Top = 8
    Width = 537
    Height = 169
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 66
      Height = 12
      Caption = #26631' '#26412' '#21495'   '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 24
      Top = 60
      Width = 78
      Height = 12
      Caption = #26631#26412#31867#22411'     '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 211
      Top = 24
      Width = 66
      Height = 12
      Caption = #24615'    '#21035'   '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 211
      Top = 60
      Width = 78
      Height = 12
      Caption = #20020#24202#35786#26029'     '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 350
      Top = 24
      Width = 60
      Height = 12
      Caption = #24180'   '#40836'   '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 24
      Top = 92
      Width = 72
      Height = 12
      Caption = #36865#26816#21333#20301'    '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 24
      Top = 126
      Width = 66
      Height = 12
      Caption = #36865#26816#26085#26399'   '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 212
      Top = 126
      Width = 54
      Height = 12
      Caption = #30331#35760#20154#21592' '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object Label10: TLabel
      Left = 211
      Top = 92
      Width = 48
      Height = 12
      Caption = #36865#26816#30446#30340
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object dbe_specNumber: TDBEdit
      Left = 96
      Top = 20
      Width = 69
      Height = 20
      DataField = 'bbh'
      DataSource = dmym.dsRegZk
      MaxLength = 10
      TabOrder = 0
      OnKeyPress = dbe_specNumberKeyPress
    end
    object dbc_btype: TDBComboBox
      Left = 96
      Top = 56
      Width = 105
      Height = 20
      DataField = 'bb'
      DataSource = dmym.dsRegZk
      ItemHeight = 12
      Items.Strings = (
        'I'
        'II'
        'III'
        'IV')
      TabOrder = 4
      OnKeyPress = dbc_btypeKeyPress
    end
    object dbc_regDoctor: TDBComboBox
      Left = 276
      Top = 122
      Width = 81
      Height = 20
      DataField = 'djys'
      DataSource = dmym.dsRegZk
      ItemHeight = 12
      TabOrder = 9
      Visible = False
      OnKeyPress = dbc_regDoctorKeyPress
    end
    object dbe_cDate: TDBEdit
      Left = 96
      Top = 122
      Width = 105
      Height = 20
      DataField = 'cyDate'
      DataSource = dmym.dsRegZk
      TabOrder = 8
    end
    object dbc_sex: TDBComboBox
      Left = 274
      Top = 20
      Width = 65
      Height = 20
      DataField = 'sex'
      DataSource = dmym.dsRegZk
      ItemHeight = 12
      TabOrder = 1
      OnKeyPress = dbc_sexKeyPress
    end
    object dbe_sj: TDBEdit
      Left = 96
      Top = 88
      Width = 105
      Height = 20
      DataField = 'sj'
      DataSource = dmym.dsRegZk
      TabOrder = 6
      OnKeyPress = dbe_sjKeyPress
    end
    object dbe_age: TDBEdit
      Left = 400
      Top = 20
      Width = 57
      Height = 20
      DataField = 'old'
      DataSource = dmym.dsRegZk
      TabOrder = 2
      OnKeyPress = dbe_ageKeyPress
    end
    object DBC_age: TDBComboBox
      Left = 459
      Top = 20
      Width = 43
      Height = 20
      DataField = 'age'
      DataSource = dmym.dsRegZk
      ItemHeight = 12
      Items.Strings = (
        #23681
        #26376
        #22825
        #23567#26102
        #20998#38047)
      TabOrder = 3
      OnKeyPress = DBC_ageKeyPress
    end
    object dbc_lczd: TDBComboBox
      Left = 274
      Top = 56
      Width = 227
      Height = 20
      DataField = 'lczd'
      DataSource = dmym.dsRegZk
      ItemHeight = 12
      TabOrder = 5
      OnKeyPress = dbc_lczdKeyPress
    end
    object dbc_sjmd: TDBComboBox
      Left = 276
      Top = 88
      Width = 225
      Height = 20
      DataField = 'sjmd'
      DataSource = dmym.dsRegZk
      ItemHeight = 12
      TabOrder = 7
      OnKeyPress = dbc_sjmdKeyPress
    end
    object Button1: TButton
      Left = 164
      Top = 16
      Width = 37
      Height = 25
      Caption = #32534#30721
      TabOrder = 10
      Visible = False
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 24
    Top = 192
    Width = 537
    Height = 73
    TabOrder = 1
    object btnAdd: TButton
      Left = 16
      Top = 24
      Width = 73
      Height = 33
      Caption = #26032'   '#22686
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnDel: TButton
      Left = 208
      Top = 24
      Width = 73
      Height = 33
      Caption = #21024'  '#38500
      TabOrder = 2
      OnClick = btnDelClick
    end
    object btnExit: TButton
      Left = 402
      Top = 24
      Width = 73
      Height = 33
      Caption = #36864'  '#20986
      TabOrder = 4
      OnClick = btnExitClick
    end
    object btnSave: TButton
      Left = 112
      Top = 24
      Width = 73
      Height = 33
      Caption = #20445#23384
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnExtract: TButton
      Left = 310
      Top = 24
      Width = 65
      Height = 33
      Caption = #25552#21462
      Enabled = False
      TabOrder = 3
      OnClick = btnExtractClick
    end
  end
  object ADOQuery3: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 440
    Top = 136
  end
  object zfx_zkbb: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 392
    Top = 136
  end
end
