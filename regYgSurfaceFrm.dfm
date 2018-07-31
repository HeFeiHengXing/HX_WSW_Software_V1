object regYgSurfaceForm: TregYgSurfaceForm
  Left = 366
  Top = 230
  BorderStyle = bsDialog
  Caption = #38498#20869#24863#26579#26631#26412#30331#35760'---'#29289#20307#34920#38754
  ClientHeight = 373
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
    Left = 0
    Top = 350
    Width = 36
    Height = 12
    Caption = 'Label6'
  end
  object Label7: TLabel
    Left = 404
    Top = 64
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 202
    Width = 537
    Height = 145
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
        Width = 60
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
        Width = 56
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
    Top = 2
    Width = 537
    Height = 129
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 24
      Width = 66
      Height = 12
      Caption = #26631' '#26412' '#21495'   '
      Transparent = True
    end
    object Label2: TLabel
      Left = 19
      Top = 56
      Width = 48
      Height = 12
      Caption = #29289'    '#20307
      Transparent = True
    end
    object Label3: TLabel
      Left = 195
      Top = 94
      Width = 72
      Height = 12
      Caption = #37319#26679#31867#21035'    '
      Transparent = True
      Visible = False
    end
    object Label4: TLabel
      Left = 195
      Top = 24
      Width = 72
      Height = 12
      Caption = #29615#22659#31867#21035'    '
      Transparent = True
    end
    object Label5: TLabel
      Left = 371
      Top = 24
      Width = 48
      Height = 12
      Caption = #31185'    '#23460
      Transparent = True
    end
    object Label9: TLabel
      Left = 19
      Top = 94
      Width = 48
      Height = 12
      Caption = #37319#26679#26085#26399
      Transparent = True
    end
    object Label8: TLabel
      Left = 371
      Top = 56
      Width = 60
      Height = 12
      Caption = #37319' '#26679' '#32773'  '
      Transparent = True
    end
    object lblGlass: TLabel
      Left = 196
      Top = 56
      Width = 48
      Height = 12
      Caption = #37319#26679#38754#31215
      Transparent = True
    end
    object Label10: TLabel
      Left = 336
      Top = 56
      Width = 12
      Height = 12
      Caption = 'cm'
    end
    object Label11: TLabel
      Left = 348
      Top = 52
      Width = 6
      Height = 12
      Caption = '2'
    end
    object dbe_specNumber: TDBEdit
      Left = 76
      Top = 20
      Width = 81
      Height = 20
      DataField = 'specNum'
      DataSource = dmym.dsRegYg
      MaxLength = 10
      TabOrder = 0
      OnKeyPress = dbe_specNumberKeyPress
    end
    object dbe_room: TDBEdit
      Left = 76
      Top = 52
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
        'I'
        'II'
        'III'
        'IV')
      TabOrder = 1
      OnKeyPress = dbc_etypeKeyPress
    end
    object dbc_sectionName: TDBComboBox
      Left = 431
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
      Left = 431
      Top = 52
      Width = 80
      Height = 20
      DataField = 'cyys'
      DataSource = dmym.dsRegYg
      ItemHeight = 12
      TabOrder = 5
      OnKeyPress = dbc_sampleDoctorKeyPress
    end
    object dbe_cDate: TDBEdit
      Left = 76
      Top = 90
      Width = 80
      Height = 20
      DataField = 'cyDate'
      DataSource = dmym.dsRegYg
      TabOrder = 6
    end
    object DBComboBox1: TDBComboBox
      Left = 256
      Top = 90
      Width = 80
      Height = 20
      DataField = 'CYlb'
      DataSource = dmym.dsRegYg
      ItemHeight = 12
      Items.Strings = (
        #31354#27668
        #29289#20307#34920#38754
        #21307#25252#20154#21592#25163
        #21307#30103#29992#21697
        #28040#27602#28082#19982#20445#23384#28082)
      TabOrder = 7
      Visible = False
      OnKeyPress = DBComboBox1KeyPress
    end
    object dbe_area: TDBEdit
      Left = 255
      Top = 52
      Width = 80
      Height = 20
      DataField = 'Area'
      DataSource = dmym.dsHospital
      TabOrder = 4
      OnKeyPress = dbe_areaKeyPress
    end
    object Button1: TButton
      Left = 157
      Top = 18
      Width = 33
      Height = 23
      Caption = #32534#30721
      TabOrder = 8
      Visible = False
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 130
    Width = 537
    Height = 73
    TabOrder = 1
    object btnAdd: TButton
      Left = 16
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
      TabOrder = 3
      OnClick = btnExtractClick
    end
  end
  object ADOQuery1: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 24
    Top = 120
  end
end
