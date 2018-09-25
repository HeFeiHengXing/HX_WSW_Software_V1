object regBBForm: TregBBForm
  Left = 354
  Top = 174
  BorderStyle = bsDialog
  Caption = #20020#24202#26631#26412#30331#35760
  ClientHeight = 459
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label13: TLabel
    Left = 16
    Top = 430
    Width = 42
    Height = 12
    Caption = 'Label13'
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 8
    Width = 574
    Height = 185
    Color = clBtnFace
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 27
      Width = 66
      Height = 12
      Caption = #26631' '#26412' '#21495'   '
      Color = clBtnFace
      ParentColor = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 24
      Top = 59
      Width = 66
      Height = 12
      Caption = #22995'    '#21517'   '
      Color = clBtnFace
      ParentColor = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 211
      Top = 27
      Width = 66
      Height = 12
      Caption = #20303' '#38498' '#21495'   '
      Color = clBtnFace
      ParentColor = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 211
      Top = 59
      Width = 60
      Height = 12
      Caption = #24615'    '#21035'  '
      Color = clBtnFace
      ParentColor = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 380
      Top = 27
      Width = 72
      Height = 12
      Caption = #31185'    '#21035'    '
      Color = clBtnFace
      ParentColor = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 380
      Top = 59
      Width = 66
      Height = 12
      Caption = #24180'    '#40836'   '
      Color = clBtnFace
      ParentColor = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 24
      Top = 91
      Width = 72
      Height = 12
      Caption = #26631#26412#31867#22411'    '
      Color = clBtnFace
      ParentColor = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 211
      Top = 91
      Width = 66
      Height = 12
      Caption = #24202'    '#21495'   '
      Color = clBtnFace
      ParentColor = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 24
      Top = 121
      Width = 72
      Height = 12
      Caption = #20020#24202#35786#26029'    '
      Color = clBtnFace
      ParentColor = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 380
      Top = 91
      Width = 72
      Height = 12
      Caption = #36865#26816#30446#30340'    '
      Color = clBtnFace
      ParentColor = False
      Transparent = True
    end
    object Label11: TLabel
      Left = 24
      Top = 154
      Width = 66
      Height = 12
      Caption = #36865' '#26816' '#32773'   '
      Color = clBtnFace
      ParentColor = False
      Transparent = True
    end
    object Label12: TLabel
      Left = 379
      Top = 121
      Width = 72
      Height = 12
      Caption = #36865#26816#26085#26399'    '
      Color = clBtnFace
      ParentColor = False
      Transparent = True
    end
    object dbe_specNumber: TDBEdit
      Left = 96
      Top = 22
      Width = 81
      Height = 20
      DataField = 'bbh'
      DataSource = dmym.dsRegBB
      MaxLength = 10
      TabOrder = 0
      OnKeyPress = dbe_specNumberKeyPress
    end
    object dbe_patientName: TDBEdit
      Left = 96
      Top = 55
      Width = 81
      Height = 20
      DataField = 'name'
      DataSource = dmym.dsRegBB
      TabOrder = 3
      OnKeyPress = dbe_patientNameKeyPress
    end
    object dbc_sex: TDBComboBox
      Left = 267
      Top = 56
      Width = 72
      Height = 20
      DataField = 'sex'
      DataSource = dmym.dsRegBB
      ItemHeight = 12
      TabOrder = 4
      OnKeyPress = dbc_sexKeyPress
    end
    object dbe_caseNumber: TDBEdit
      Left = 267
      Top = 21
      Width = 70
      Height = 20
      DataField = 'zyh'
      DataSource = dmym.dsRegBB
      TabOrder = 1
      OnKeyPress = dbe_caseNumberKeyPress
    end
    object dbc_sectionName: TDBComboBox
      Left = 444
      Top = 22
      Width = 109
      Height = 20
      DataField = 'kb'
      DataSource = dmym.dsRegBB
      ItemHeight = 12
      TabOrder = 2
      OnExit = dbc_sectionNameExit
      OnKeyPress = dbc_sectionNameKeyPress
    end
    object dbe_age: TDBEdit
      Left = 444
      Top = 56
      Width = 53
      Height = 20
      DataField = 'old'
      DataSource = dmym.dsRegBB
      TabOrder = 5
      OnKeyPress = dbe_ageKeyPress
    end
    object dbc_specType: TDBComboBox
      Left = 96
      Top = 88
      Width = 81
      Height = 20
      DataField = 'bb'
      DataSource = dmym.dsRegBB
      ItemHeight = 12
      TabOrder = 7
      OnKeyPress = dbc_specTypeKeyPress
    end
    object dbe_bedNum: TDBEdit
      Left = 267
      Top = 88
      Width = 68
      Height = 20
      DataField = 'bed'
      DataSource = dmym.dsRegBB
      TabOrder = 8
      OnKeyPress = dbe_bedNumKeyPress
    end
    object dbc_checkPurpose: TDBComboBox
      Left = 444
      Top = 88
      Width = 107
      Height = 20
      DataField = 'sjmd'
      DataSource = dmym.dsRegBB
      ItemHeight = 12
      Items.Strings = (
        #32454#33740#22521#20859#65291#33647#25935
        #32454#33740#22521#20859
        #28034#29255#26597#32454#33740
        #25239#37240#26579#33394
        'L'#22411#32454#33740#22521#20859#65291#33647#25935
        #30495#33740#22521#20859
        #30495#33740#22521#20859#65291#33647#25935
        #28034#29255#26597#30495#33740)
      TabOrder = 9
      OnKeyPress = dbc_checkPurposeKeyPress
    end
    object dbc_checkDoctor: TDBComboBox
      Left = 95
      Top = 152
      Width = 125
      Height = 20
      DataField = 'sj'
      DataSource = dmym.dsRegBB
      ItemHeight = 12
      TabOrder = 12
      OnKeyPress = dbc_checkDoctorKeyPress
    end
    object dbe_checkDate: TDBEdit
      Left = 443
      Top = 117
      Width = 106
      Height = 20
      DataField = 'cydate'
      DataSource = dmym.dsRegBB
      TabOrder = 11
    end
    object dbe_diagnose: TDBComboBox
      Left = 95
      Top = 117
      Width = 231
      Height = 20
      DataField = 'lczd'
      DataSource = dmym.dsRegBB
      ItemHeight = 12
      TabOrder = 10
      OnKeyPress = dbe_diagnoseKeyPress
    end
    object DBCage: TDBComboBox
      Left = 499
      Top = 56
      Width = 54
      Height = 20
      DataField = 'age'
      DataSource = dmym.dsRegBB
      ItemHeight = 12
      Items.Strings = (
        #23681
        #26376
        #22825
        #23567#26102
        #20998#38047)
      TabOrder = 6
      OnKeyPress = DBCageKeyPress
    end
    object Button1: TButton
      Left = 177
      Top = 20
      Width = 32
      Height = 25
      Caption = #32534#30721
      TabOrder = 13
      Visible = False
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 280
    Width = 577
    Height = 145
    TabStop = False
    DataSource = dmym.dsRegBB
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'bbh'
        Title.Caption = #26631#26412#21495
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = #22995#21517
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kb'
        Title.Caption = #31185#21035
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lczd'
        Title.Caption = #20020#24202#35786#26029
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sex'
        Title.Caption = #24615#21035
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'zyh'
        Title.Caption = #20303#38498#21495
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bb'
        Title.Caption = #26631#26412
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'old'
        Title.Caption = #24180#40836
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bed'
        Title.Caption = #24202#21495
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sj'
        Title.Caption = #36865#26816#20154#21592
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cydate'
        Title.Caption = #36865#26816#26085#26399
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sjmd'
        Title.Caption = #36865#26816#30446#30340
        Width = 73
        Visible = True
      end>
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 200
    Width = 576
    Height = 73
    Color = clBtnFace
    ParentColor = False
    TabOrder = 1
    object btnAdd: TButton
      Left = 16
      Top = 24
      Width = 65
      Height = 33
      Caption = #26032'   '#22686
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnDel: TButton
      Left = 231
      Top = 24
      Width = 65
      Height = 33
      Caption = #21024'  '#38500
      TabOrder = 2
      OnClick = btnDelClick
    end
    object btnExit: TButton
      Left = 460
      Top = 24
      Width = 65
      Height = 33
      Caption = #36864'  '#20986
      TabOrder = 4
      OnClick = btnExitClick
    end
    object btnSave: TButton
      Left = 120
      Top = 24
      Width = 65
      Height = 33
      Caption = #20445#23384
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnExtract: TButton
      Left = 343
      Top = 24
      Width = 65
      Height = 33
      Caption = #25552#21462
      Enabled = False
      TabOrder = 3
      OnClick = btnExtractClick
    end
  end
  object bbdj_bbxb: TDBEdit
    Left = 432
    Top = 328
    Width = 121
    Height = 20
    DataField = 'sex'
    DataSource = zfx_bbxbs
    TabOrder = 3
    Visible = False
  end
  object bbdj_bblx: TDBEdit
    Left = 432
    Top = 352
    Width = 121
    Height = 20
    DataField = 'bbName'
    DataSource = zfx_bblxs
    TabOrder = 4
    Visible = False
  end
  object bbdj_bbkb: TDBEdit
    Left = 432
    Top = 304
    Width = 121
    Height = 20
    DataField = 'secname'
    DataSource = zfx_bbkbs
    TabOrder = 5
    Visible = False
  end
  object bbdj_sjmd: TDBEdit
    Left = 432
    Top = 376
    Width = 121
    Height = 20
    DataField = 'ZT_sjmd'
    DataSource = zfx_sjmds
    TabOrder = 6
    Visible = False
  end
  object bbdj_sjys: TDBEdit
    Left = 432
    Top = 392
    Width = 121
    Height = 20
    DataField = 'Name'
    DataSource = zfx_sjyss
    TabOrder = 7
    Visible = False
  end
  object zfx_bblx: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 328
    Top = 320
  end
  object zfx_bblxs: TDataSource
    DataSet = zfx_bblx
    Left = 328
    Top = 352
  end
  object zfx_bbxb: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 296
    Top = 320
  end
  object zfx_bbxbs: TDataSource
    DataSet = zfx_bbxb
    Left = 296
    Top = 352
  end
  object zfx_bbkb: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 264
    Top = 320
  end
  object zfx_sjys: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 392
    Top = 320
  end
  object zfx_sjmd: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 360
    Top = 320
  end
  object zfx_bbkbs: TDataSource
    DataSet = zfx_bbkb
    Left = 264
    Top = 352
  end
  object zfx_sjmds: TDataSource
    DataSet = zfx_sjmd
    Left = 360
    Top = 352
  end
  object zfx_sjyss: TDataSource
    DataSet = zfx_sjys
    Left = 392
    Top = 352
  end
  object ADOQuery1: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 162
    Top = 322
  end
  object ADOQuery2: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 194
    Top = 322
  end
  object ADOQuery3: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 226
    Top = 322
  end
  object ZFX_YX: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 122
    Top = 322
  end
end
