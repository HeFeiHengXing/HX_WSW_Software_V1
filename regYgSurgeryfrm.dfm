object RegSurgeryform: TRegSurgeryform
  Left = 511
  Top = 352
  BorderStyle = bsDialog
  Caption = #38498#20869#24863#26579#26631#26412#30331#35760'--'#25163#26415#23460
  ClientHeight = 460
  ClientWidth = 551
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
  object Label11: TLabel
    Left = 6
    Top = 432
    Width = 49
    Height = 13
    Caption = 'Label11'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 6
    Top = 220
    Width = 537
    Height = 209
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
    Left = 6
    Top = 2
    Width = 537
    Height = 137
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 54
      Height = 13
      Caption = #26631' '#26412' '#21495'    '
      Transparent = True
    end
    object Label2: TLabel
      Left = 16
      Top = 62
      Width = 48
      Height = 13
      Caption = #25151' '#38388' '#21495'  '
      Transparent = True
    end
    object Label3: TLabel
      Left = 195
      Top = 100
      Width = 60
      Height = 13
      Caption = #37319#26679#31867#21035'    '
      Transparent = True
      Visible = False
    end
    object Label5: TLabel
      Left = 361
      Top = 24
      Width = 60
      Height = 13
      Caption = #31185'         '#23460'   '
      Transparent = True
    end
    object Label9: TLabel
      Left = 16
      Top = 100
      Width = 57
      Height = 13
      Caption = #37319#26679#26085#26399'   '
      Transparent = True
    end
    object Label8: TLabel
      Left = 363
      Top = 62
      Width = 51
      Height = 13
      Caption = #37319'  '#26679'  '#32773' '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object dbe_specNumber: TDBEdit
      Left = 80
      Top = 20
      Width = 80
      Height = 21
      DataField = 'specNum'
      DataSource = dmym.dsRegYg
      MaxLength = 10
      TabOrder = 0
      OnKeyPress = dbe_specNumberKeyPress
    end
    object dbe_room: TDBEdit
      Left = 80
      Top = 58
      Width = 80
      Height = 21
      DataField = 'room'
      DataSource = dmym.dsRegYg
      TabOrder = 2
      OnKeyPress = dbe_roomKeyPress
    end
    object dbc_sectionName: TDBComboBox
      Left = 432
      Top = 20
      Width = 80
      Height = 21
      DataField = 'secName'
      DataSource = dmym.dsRegYg
      ItemHeight = 13
      TabOrder = 1
      OnKeyPress = dbc_sectionNameKeyPress
    end
    object dbc_sampleDoctor: TDBComboBox
      Left = 432
      Top = 58
      Width = 80
      Height = 21
      DataField = 'cyys'
      DataSource = dmym.dsRegYg
      ItemHeight = 13
      TabOrder = 3
      OnKeyPress = dbc_sampleDoctorKeyPress
    end
    object dbe_cDate: TDBEdit
      Left = 81
      Top = 95
      Width = 80
      Height = 21
      DataField = 'cyDate'
      DataSource = dmym.dsRegYg
      TabOrder = 4
    end
    object DBComboBox1: TDBComboBox
      Left = 251
      Top = 96
      Width = 86
      Height = 21
      Style = csDropDownList
      DataField = 'CYlb'
      DataSource = dmym.dsRegYg
      ItemHeight = 13
      Items.Strings = (
        #31354#27668
        #29289#20307#34920#38754
        #21307#25252#20154#21592#25163
        #21307#30103#29992#21697
        #28040#27602#28082#19982#20445#23384#28082)
      TabOrder = 5
      Visible = False
      OnKeyPress = DBComboBox1KeyPress
    end
    object Button1: TButton
      Left = 160
      Top = 19
      Width = 31
      Height = 23
      Caption = #32534#30721
      TabOrder = 6
      Visible = False
      OnClick = Button1Click
    end
    object GroupBox3: TGroupBox
      Left = 196
      Top = 20
      Width = 145
      Height = 65
      Caption = #29615#22659#31867#21035
      TabOrder = 7
      object Label4: TLabel
        Left = 10
        Top = 20
        Width = 26
        Height = 13
        Caption = #31561#32423
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label6: TLabel
        Left = 10
        Top = 42
        Width = 26
        Height = 13
        Caption = #21306#22495
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object dbc_area: TComboBox
        Left = 45
        Top = 40
        Width = 81
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 12
        ParentFont = False
        TabOrder = 0
        OnChange = dbc_areaChange
        OnKeyPress = dbc_areaKeyPress
        Items.Strings = (
          'I'
          'II')
      end
      object dbc_grade: TComboBox
        Left = 45
        Top = 16
        Width = 81
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 12
        ParentFont = False
        TabOrder = 1
        OnChange = dbc_gradeChange
        OnKeyPress = dbc_gradeKeyPress
        Items.Strings = (
          'I'
          'II'
          'III'
          'IV')
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 6
    Top = 144
    Width = 537
    Height = 73
    TabOrder = 1
    object btnAdd: TButton
      Left = 24
      Top = 24
      Width = 81
      Height = 33
      Caption = #26032'  '#22686
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnDel: TButton
      Left = 232
      Top = 24
      Width = 73
      Height = 33
      Caption = #21024'  '#38500
      TabOrder = 2
      OnClick = btnDelClick
    end
    object btnExit: TButton
      Left = 440
      Top = 24
      Width = 81
      Height = 33
      Caption = #36864'  '#20986
      TabOrder = 4
      OnClick = btnExitClick
    end
    object btnSave: TButton
      Left = 128
      Top = 24
      Width = 73
      Height = 33
      Caption = #20445'  '#23384
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnExtract: TButton
      Left = 336
      Top = 24
      Width = 73
      Height = 33
      Caption = #25552'  '#21462
      Enabled = False
      TabOrder = 3
      OnClick = btnExtractClick
    end
  end
  object ZFX_YX: TADOQuery
    Parameters = <>
    Left = 400
    Top = 120
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 426
    Top = 120
  end
  object ADOQuery2: TADOQuery
    Parameters = <>
    Left = 452
    Top = 120
  end
end
