object regYgHandForm: TregYgHandForm
  Left = 268
  Top = 252
  BorderStyle = bsDialog
  Caption = #38498#20869#24863#26579#26631#26412#30331#35760'---'#21307#25252#20154#21592#25163
  ClientHeight = 395
  ClientWidth = 541
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
  object Label6: TLabel
    Left = 2
    Top = 368
    Width = 42
    Height = 13
    Caption = 'Label6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 2
    Top = 196
    Width = 537
    Height = 169
    TabStop = False
    DataSource = dmym.dsRegYg
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'specNum'
        Title.Caption = #26631#26412#21495
        Width = 59
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
    Left = 2
    Top = 0
    Width = 537
    Height = 121
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 66
      Height = 12
      Caption = #26631' '#26412' '#21495'   '
      Transparent = True
    end
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 48
      Height = 12
      Caption = #21307#25252#20154#21592
      Transparent = True
    end
    object Label3: TLabel
      Left = 23
      Top = 96
      Width = 72
      Height = 12
      Caption = #37319#26679#31867#21035'    '
      Transparent = True
      Visible = False
    end
    object Label4: TLabel
      Left = 195
      Top = 24
      Width = 48
      Height = 12
      Caption = #31867'    '#21035
      Transparent = True
    end
    object Label5: TLabel
      Left = 355
      Top = 24
      Width = 72
      Height = 12
      Caption = #31185'    '#23460'    '
      Transparent = True
    end
    object Label9: TLabel
      Left = 355
      Top = 64
      Width = 66
      Height = 12
      Caption = #37319#26679#26085#26399'   '
      Transparent = True
    end
    object Label8: TLabel
      Left = 195
      Top = 64
      Width = 60
      Height = 12
      Caption = #37319' '#26679' '#32773'  '
      Transparent = True
    end
    object dbe_specNumber: TDBEdit
      Left = 80
      Top = 20
      Width = 80
      Height = 20
      DataField = 'specNum'
      DataSource = dmym.dsRegYg
      MaxLength = 10
      TabOrder = 0
      OnKeyPress = dbe_specNumberKeyPress
    end
    object dbe_room: TDBEdit
      Left = 80
      Top = 60
      Width = 80
      Height = 20
      DataField = 'room'
      DataSource = dmym.dsRegYg
      TabOrder = 3
      OnKeyPress = dbe_roomKeyPress
    end
    object dbc_etype: TDBComboBox
      Left = 256
      Top = 20
      Width = 80
      Height = 20
      DataField = 'hjlb'
      DataSource = dmym.dsRegYg
      ItemHeight = 12
      Items.Strings = (
        #21355#29983#25163
        #22806#31185#25163)
      TabOrder = 1
      OnKeyPress = dbc_etypeKeyPress
    end
    object dbc_sectionName: TDBComboBox
      Left = 416
      Top = 20
      Width = 80
      Height = 20
      DataField = 'secName'
      DataSource = dmym.dsRegYg
      ItemHeight = 12
      TabOrder = 2
      OnKeyPress = dbc_sectionNameKeyPress
    end
    object dbc_sampleDoctor: TDBComboBox
      Left = 256
      Top = 60
      Width = 80
      Height = 20
      DataField = 'cyys'
      DataSource = dmym.dsRegYg
      ItemHeight = 12
      TabOrder = 4
      OnKeyPress = dbc_sampleDoctorKeyPress
    end
    object dbe_cDate: TDBEdit
      Left = 416
      Top = 60
      Width = 80
      Height = 20
      DataField = 'cyDate'
      DataSource = dmym.dsRegYg
      TabOrder = 5
    end
    object DBComboBox1: TDBComboBox
      Left = 80
      Top = 94
      Width = 80
      Height = 20
      Style = csDropDownList
      DataField = 'CYlb'
      DataSource = dmym.dsRegYg
      ItemHeight = 12
      Items.Strings = (
        #31354#27668
        #29289#20307#34920#38754
        #21307#25252#20154#21592#25163
        #21307#30103#29992#21697
        #28040#27602#28082#19982#20445#23384#28082)
      TabOrder = 6
      Visible = False
    end
    object Button1: TButton
      Left = 160
      Top = 17
      Width = 33
      Height = 25
      Caption = #32534#30721
      TabOrder = 7
      Visible = False
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 2
    Top = 122
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
      Caption = ' '#25552'  '#21462
      TabOrder = 3
      OnClick = btnExtractClick
    end
  end
  object ADOQuery1: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 196
    Top = 88
  end
end