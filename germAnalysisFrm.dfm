object germAnalysisForm: TgermAnalysisForm
  Left = 309
  Top = 57
  Align = alCustom
  BorderStyle = bsDialog
  Caption = #37492#23450#20998#26512
  ClientHeight = 637
  ClientWidth = 837
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 18
    Top = 18
    Width = 54
    Height = 12
    Caption = #26631#26412#21495'   '
  end
  object Label6: TLabel
    Left = 242
    Top = 18
    Width = 36
    Height = 12
    Caption = #33740#23646'  '
  end
  object Bevel1: TBevel
    Left = 0
    Top = 176
    Width = 793
    Height = 1
  end
  object Image1: TImage
    Left = 0
    Top = 180
    Width = 601
    Height = 455
    Visible = False
  end
  object gbNameInfo: TGroupBox
    Left = 8
    Top = 40
    Width = 297
    Height = 129
    Caption = #22522#26412#20449#24687
    TabOrder = 5
    object Label2: TLabel
      Left = 16
      Top = 32
      Width = 36
      Height = 12
      Caption = #22995#21517'  '
      Transparent = True
    end
    object Label4: TLabel
      Left = 109
      Top = 29
      Width = 36
      Height = 12
      Caption = #24180#40836'  '
      Transparent = True
    end
    object Label7: TLabel
      Left = 4
      Top = 90
      Width = 36
      Height = 12
      Caption = #20303#38498#21495
      Transparent = True
    end
    object Label8: TLabel
      Left = 16
      Top = 64
      Width = 24
      Height = 12
      Caption = #24202#21495
      Transparent = True
    end
    object Label9: TLabel
      Left = 109
      Top = 62
      Width = 30
      Height = 12
      Caption = #31185#21035' '
      Transparent = True
    end
    object Label10: TLabel
      Left = 108
      Top = 89
      Width = 24
      Height = 24
      Caption = #26631#26412#31867#22411
      Transparent = True
      WordWrap = True
    end
    object Label11: TLabel
      Left = 219
      Top = 29
      Width = 30
      Height = 12
      Caption = #24615#21035' '
      Transparent = True
    end
    object Label3: TLabel
      Left = 108
      Top = 112
      Width = 24
      Height = 24
      Caption = #33740#33853#35745#25968
      Transparent = True
      Visible = False
      WordWrap = True
    end
    object Label5: TLabel
      Left = 247
      Top = 112
      Width = 36
      Height = 12
      Caption = 'CFU/ml'
      Visible = False
    end
    object dbe_name: TDBEdit
      Left = 48
      Top = 24
      Width = 49
      Height = 20
      DataField = 'name'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 0
      OnKeyPress = dbe_nameKeyPress
    end
    object dbe_age: TDBEdit
      Left = 135
      Top = 24
      Width = 38
      Height = 20
      DataField = 'old'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 1
      OnKeyPress = dbe_ageKeyPress
    end
    object dbe_zyh: TDBEdit
      Left = 48
      Top = 85
      Width = 49
      Height = 20
      DataField = 'zyh'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 7
      OnKeyPress = dbe_zyhKeyPress
    end
    object dbe_bed: TDBEdit
      Left = 47
      Top = 56
      Width = 49
      Height = 20
      DataField = 'bed'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 4
      OnKeyPress = dbe_bedKeyPress
    end
    object dbc_section: TDBComboBox
      Left = 138
      Top = 59
      Width = 146
      Height = 20
      DataField = 'kb'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 12
      TabOrder = 5
      OnExit = dbc_sectionExit
      OnKeyPress = dbc_sectionKeyPress
    end
    object dbc_bb: TDBComboBox
      Left = 168
      Top = 88
      Width = 115
      Height = 20
      DataField = 'bb'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 12
      TabOrder = 9
      OnClick = dbc_bbClick
      OnKeyPress = dbc_bbKeyPress
    end
    object dbc_sex: TDBComboBox
      Left = 245
      Top = 24
      Width = 41
      Height = 20
      DataField = 'sex'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 12
      TabOrder = 3
      OnKeyPress = dbc_sexKeyPress
    end
    object Edit12: TEdit
      Left = 32
      Top = 108
      Width = 70
      Height = 20
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 6
      Visible = False
    end
    object DBC_age: TDBComboBox
      Left = 175
      Top = 24
      Width = 43
      Height = 20
      DataField = 'age'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 12
      Items.Strings = (
        #23681
        #26376
        #22825
        #23567#26102
        #20998#38047)
      TabOrder = 2
      OnKeyPress = DBC_ageKeyPress
    end
    object Edit1: TDBEdit
      Left = 168
      Top = 108
      Width = 72
      Height = 20
      DataField = 'cfu'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 8
      Visible = False
      OnKeyPress = Edit1KeyPress
    end
  end
  object dbe_bbh: TDBEdit
    Left = 57
    Top = 14
    Width = 73
    Height = 20
    Ctl3D = True
    DataField = 'bbh'
    DataSource = dmym.dsBase
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    MaxLength = 10
    ParentCtl3D = False
    TabOrder = 0
    OnKeyPress = dbe_bbhKeyPress
  end
  object btnExtract: TButton
    Left = 129
    Top = 12
    Width = 74
    Height = 23
    Caption = #26631#26412#30331#35760
    TabOrder = 1
    OnClick = btnExtractClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 184
    Width = 594
    Height = 246
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Color = clSkyBlue
    TabOrder = 11
    object Label19: TLabel
      Left = 2
      Top = 22
      Width = 18
      Height = 12
      Caption = '(A)'
    end
    object Label20: TLabel
      Left = 2
      Top = 116
      Width = 18
      Height = 12
      Caption = '(B)'
    end
    object gbInput: TGroupBox
      Left = 453
      Top = 0
      Width = 137
      Height = 233
      Caption = #20154#24037#36755#20837
      ParentBackground = False
      TabOrder = 0
    end
    object ZFX_jsdbe: TDBEdit
      Left = 96
      Top = 16
      Width = 121
      Height = 20
      DataField = 'GermType'
      DataSource = DataSource1
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 1
      Visible = False
    end
    object ZFX_xingbieDBE: TDBEdit
      Left = 96
      Top = 40
      Width = 121
      Height = 20
      DataField = 'sex'
      DataSource = DataSource8
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 2
      Visible = False
    end
    object ZFX_sjryDBE: TDBEdit
      Left = 96
      Top = 72
      Width = 121
      Height = 20
      DataField = 'Name'
      DataSource = DataSource7
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 3
      Visible = False
    end
    object ZFX_bgryDBE: TDBEdit
      Left = 96
      Top = 104
      Width = 121
      Height = 20
      DataField = 'Name'
      DataSource = DataSource6
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 4
      Visible = False
    end
    object ZFX_kebieDBE: TDBEdit
      Left = 296
      Top = 15
      Width = 121
      Height = 20
      DataField = 'secname'
      DataSource = DataSource5
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 5
      Visible = False
    end
    object ZFX_sjmdDBE: TDBEdit
      Left = 296
      Top = 47
      Width = 121
      Height = 20
      DataField = 'ZT_sjmd'
      DataSource = DataSource4
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 6
      Visible = False
    end
    object ZFX_shryDBE: TDBEdit
      Left = 296
      Top = 79
      Width = 121
      Height = 20
      DataField = 'Name'
      DataSource = DataSource3
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 7
      Visible = False
    end
    object ZFX_bblxDBE: TDBEdit
      Left = 296
      Top = 111
      Width = 121
      Height = 20
      DataField = 'bbName'
      DataSource = DataSource2
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 8
      Visible = False
    end
  end
  object GroupBox1: TGroupBox
    Left = 640
    Top = 437
    Width = 177
    Height = 176
    Color = clAppWorkSpace
    ParentColor = False
    TabOrder = 9
    object btnStartScan: TBitBtn
      Left = 8
      Top = 44
      Width = 159
      Height = 26
      Caption = #24320#22987#26816#26597
      TabOrder = 2
      OnClick = btnStartScanClick
    end
    object btnAnalysis: TButton
      Left = 9
      Top = 80
      Width = 74
      Height = 25
      Caption = #32454#33740#20998#26512
      Enabled = False
      TabOrder = 3
      OnClick = btnAnalysisClick
    end
    object btnYmAnalysis: TButton
      Left = 9
      Top = 113
      Width = 74
      Height = 26
      Caption = #33647#25935#20998#26512
      Enabled = False
      TabOrder = 4
      OnClick = btnYmAnalysisClick
    end
    object btnPrint: TButton
      Left = 90
      Top = 113
      Width = 78
      Height = 25
      Caption = #25253'   '#34920
      TabOrder = 7
      OnClick = btnPrintClick
    end
    object chkInput: TCheckBox
      Left = 8
      Top = 16
      Width = 65
      Height = 17
      Caption = #20154#24037#36755#20837
      Color = clInactiveCaptionText
      Ctl3D = True
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 0
      OnClick = chkInputClick
      OnKeyPress = chkInputKeyPress
    end
    object btnSave: TButton
      Left = 9
      Top = 146
      Width = 75
      Height = 25
      Caption = #23384'   '#30424
      Enabled = False
      TabOrder = 5
      OnClick = btnSaveClick
    end
    object CheckBox1: TCheckBox
      Left = 87
      Top = 16
      Width = 73
      Height = 17
      Caption = #19981#32463#20202#22120
      Color = clInactiveCaptionText
      ParentColor = False
      TabOrder = 1
      OnClick = CheckBox1Click
      OnKeyPress = CheckBox1KeyPress
    end
    object Button1: TButton
      Left = 90
      Top = 80
      Width = 78
      Height = 25
      Caption = #31185#23460#20449#24687#35774#32622
      TabOrder = 6
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 314
    Top = 40
    Width = 289
    Height = 129
    TabOrder = 6
    object Label12: TLabel
      Left = 8
      Top = 20
      Width = 48
      Height = 12
      Caption = #20020#24202#35786#26029
      Transparent = True
    end
    object Label13: TLabel
      Left = 8
      Top = 100
      Width = 48
      Height = 12
      Caption = #36865#26816#26085#26399
      Transparent = True
    end
    object Label14: TLabel
      Left = 144
      Top = 100
      Width = 48
      Height = 12
      Caption = #25253#21578#26085#26399
      Transparent = True
    end
    object Label15: TLabel
      Left = 9
      Top = 46
      Width = 48
      Height = 12
      Caption = #36865' '#26816' '#32773
      Transparent = True
    end
    object Label16: TLabel
      Left = 145
      Top = 46
      Width = 48
      Height = 12
      Caption = #25253' '#21578' '#32773
      Transparent = True
    end
    object Label17: TLabel
      Left = 9
      Top = 73
      Width = 48
      Height = 12
      Caption = #36865#26816#30446#30340
      Transparent = True
    end
    object Label18: TLabel
      Left = 145
      Top = 73
      Width = 48
      Height = 12
      Caption = #23457' '#26680' '#32773
      Transparent = True
    end
    object dbe_repdate: TDBEdit
      Left = 199
      Top = 97
      Width = 73
      Height = 20
      DataField = 'repdate'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 6
    end
    object dbc_sj: TDBComboBox
      Left = 64
      Top = 41
      Width = 74
      Height = 20
      DataField = 'sj'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 12
      TabOrder = 1
      OnKeyPress = dbc_sjKeyPress
    end
    object dbc_reporter: TDBComboBox
      Left = 199
      Top = 42
      Width = 74
      Height = 20
      DataField = 'bgys'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 12
      TabOrder = 2
      OnKeyPress = dbc_reporterKeyPress
    end
    object dbc_sjmd: TDBComboBox
      Left = 62
      Top = 71
      Width = 74
      Height = 20
      DataField = 'sjmd'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 12
      TabOrder = 3
      OnKeyPress = dbc_sjmdKeyPress
    end
    object dbc_shys: TDBComboBox
      Left = 199
      Top = 69
      Width = 74
      Height = 20
      Style = csDropDownList
      DataField = 'shys'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 12
      TabOrder = 4
      OnKeyPress = dbc_shysKeyPress
    end
    object dbe_lczd: TDBComboBox
      Left = 64
      Top = 14
      Width = 209
      Height = 20
      DataField = 'lczd'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 12
      TabOrder = 0
      OnKeyPress = dbe_lczdKeyPress
    end
    object dbe_cydate: TDBEdit
      Left = 64
      Top = 97
      Width = 69
      Height = 20
      DataField = 'cydate'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 5
    end
  end
  object GroupBox3: TGroupBox
    Left = 614
    Top = 44
    Width = 211
    Height = 81
    TabOrder = 7
    object dbm_jj: TDBMemo
      Left = 10
      Top = 28
      Width = 182
      Height = 45
      DataField = 'jjjg'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 0
    end
    object RadioButton1: TRadioButton
      Left = 7
      Top = 7
      Width = 85
      Height = 17
      Caption = #38236#26816#32467#26524#65306
      TabOrder = 1
    end
    object RadioButton2: TRadioButton
      Left = 88
      Top = 7
      Width = 89
      Height = 17
      Caption = #32454#33740#29983#38271#65306
      TabOrder = 2
    end
  end
  object GroupBox4: TGroupBox
    Left = 614
    Top = 128
    Width = 211
    Height = 69
    Caption = #26816#39564#32773#35780#35821#65306
    TabOrder = 8
    object dbm_conclusion: TDBMemo
      Left = 7
      Top = 21
      Width = 184
      Height = 40
      DataField = 'yspy'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 432
    Width = 369
    Height = 193
    BevelInner = bvLowered
    Color = clSkyBlue
    TabOrder = 12
  end
  object btnExit: TBitBtn
    Left = 730
    Top = 583
    Width = 77
    Height = 25
    Caption = #36864'   '#20986
    TabOrder = 10
    OnClick = btnExitClick
  end
  object GroupBox5: TGroupBox
    Left = 616
    Top = 200
    Width = 209
    Height = 225
    Caption = #29983#21270#21453#24212#26816#39564#32467#26524
    TabOrder = 13
    object lbGermStdCode: TLabel
      Left = 8
      Top = 168
      Width = 48
      Height = 12
      Caption = #32454#33740#32534#30721
      Transparent = True
    end
    object lbJzName: TLabel
      Left = 8
      Top = 189
      Width = 78
      Height = 12
      Caption = #32454#33740#26816#39564#32467#26524':'
      Transparent = True
    end
    object lblCode: TLabel
      Left = 64
      Top = 168
      Width = 30
      Height = 12
      Caption = '00000'
      Color = clYellow
      ParentColor = False
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 16
      Width = 185
      Height = 145
      DataSource = dmym.dsCheck
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'name'
          Title.Caption = #32454#33740#21517#31216
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'gl'
          Title.Caption = #27010#29575
          Width = 62
          Visible = True
        end>
    end
    object dbe_jzname: TDBEdit
      Left = 8
      Top = 204
      Width = 185
      Height = 20
      DataField = 'jzname'
      DataSource = dmym.dsBase
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 1
      OnChange = dbe_jznameChange
      OnClick = dbe_jznameClick
    end
  end
  object GroupBox6: TGroupBox
    Left = 384
    Top = 428
    Width = 244
    Height = 201
    Caption = #33647#25935#23454#39564#32467#26524
    TabOrder = 14
    object sGrid: TStringGrid
      Left = 2
      Top = 14
      Width = 216
      Height = 185
      Align = alCustom
      Color = clSkyBlue
      Ctl3D = False
      FixedColor = clSkyBlue
      FixedCols = 0
      ParentCtl3D = False
      TabOrder = 0
      OnSelectCell = sGridSelectCell
      OnTopLeftChanged = sGridTopLeftChanged
      ColWidths = (
        21
        71
        39
        56
        24)
    end
    object btnAppend: TBitBtn
      Left = 218
      Top = 8
      Width = 24
      Height = 187
      Caption = #38468#21152#33647#21697
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnAppendClick
    end
    object BitBtn1: TBitBtn
      Left = 82
      Top = -3
      Width = 57
      Height = 17
      Caption = #25918#22823
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F003000000000000000000000000000000000000D1ADADD1ADAD
        D1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1AD
        ADD1ADADD1ADADD1ADADD1ADADD1ADAD0000D1ADADD1ADADD1ADADD1ADADD1AD
        ADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1
        ADADD1ADADD1ADAD0000D1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1
        ADADD1ADADD1ADADD1ADAD31515A21495A293039313C4AD1ADADD1ADADD1ADAD
        0000D1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADAD
        294D5A294D5A398AA5318EB5313C4A527D94D1ADADD1ADAD0000D1ADADD1ADAD
        D1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADAD294D5A294D5A2986B539B6
        E794DFEF94CFDE5A8EA5D1ADADD1ADAD0000D1ADADD1ADADD1ADADD1ADAD6361
        5A5A5D5A5A59525255525255524251522982A539B6E794DFF794DFEF6396AD5A
        8A9CD1ADADD1ADAD0000D1ADADD1ADAD9C928C6B69639C928CC6B2A5E7C7B5E7
        C3ADC6A6948C827352514A84BECE9CDBEF6396AD5A8A9CD1ADADD1ADADD1ADAD
        0000D1ADADD1ADAD73716BB5AEA5FFE7DEFFDFCEF7D7C6F7D3BDF7CFB5F7CFB5
        A592845255525A86945A8A9CD1ADADD1ADADD1ADADD1ADAD0000D1ADAD7B7973
        ADA6A5FFF7F7FFEFE7FFE7DE7B5D4A7B5D4AF7D3BDF7CFB5F7CFB58C8273525D
        5AD1ADADD1ADADD1ADADD1ADADD1ADAD0000D1ADAD847D73D6D3D6FFFBFFFFF7
        F7FFEFE784695284614AF7D7C6F7D3BDF7CFB5C6A694525552D1ADADD1ADADD1
        ADADD1ADADD1ADAD0000D1ADAD84827BF7F3F7FFFFFFA58A739C826B9479638C
        6D5A8465527B5D4AF7D3BDE7C3AD5A5952D1ADADD1ADADD1ADADD1ADADD1ADAD
        0000D1ADAD8C827BF7F3F7FFFFFFA58E7BA58E7B9C8673947D6B8C715A846952
        F7D7C6E7C7B55A5D5AD1ADADD1ADADD1ADADD1ADADD1ADAD0000D1ADAD8C867B
        DED7D6FFFFFFFFFFFFFFFFFFA58E7BA58A73FFEFE7FFE7DEFFDFCEC6B2A56361
        5AD1ADADD1ADADD1ADADD1ADADD1ADAD0000D1ADAD8C867BB5B2ADFFFFFFFFFF
        FFFFFFFFA58E7BA58E7BFFF7F7FFEFE7FFE7DE9C928C636563D1ADADD1ADADD1
        ADADD1ADADD1ADAD0000D1ADADD1ADAD8C867BC6C3BDFFFFFFFFFFFFFFFFFFFF
        FFFFFFFBFFFFF7F7BDB2AD736D6BD1ADADD1ADADD1ADADD1ADADD1ADADD1ADAD
        0000D1ADADD1ADAD9C928C8C867BB5B2ADDED7D6F7F3F7F7F3F7D6D7D6ADAAA5
        7B75739C928CD1ADADD1ADADD1ADADD1ADADD1ADADD1ADAD0000D1ADADD1ADAD
        D1ADADD1ADAD8C867B8C867B8C867B84827B848273847D73D1ADADD1ADADD1AD
        ADD1ADADD1ADADD1ADADD1ADADD1ADAD0000D1ADADD1ADADD1ADADD1ADADD1AD
        ADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1ADADD1
        ADADD1ADADD1ADAD0000}
    end
    object IsPrintCombox: TComboBox
      Left = 116
      Top = 168
      Width = 101
      Height = 20
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 12
      TabOrder = 3
      Visible = False
      Items.Strings = (
        #25935#24863
        #20013#20171
        #32784#33647)
    end
    object helpedit: TEdit
      Left = 116
      Top = 144
      Width = 101
      Height = 20
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 4
      Visible = False
    end
  end
  object BtnHistory: TButton
    Left = 752
    Top = 10
    Width = 75
    Height = 25
    Caption = #21382#21490#23545#29031
    TabOrder = 4
    OnClick = BtnHistoryClick
  end
  object cb_germtype: TComboBox
    Left = 271
    Top = 14
    Width = 73
    Height = 20
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ItemHeight = 12
    TabOrder = 2
    OnClick = cb_germtypeClick
    OnExit = cb_germtypeExit
    OnKeyPress = cb_germtypeKeyPress
  end
  object Button2: TButton
    Left = 367
    Top = 10
    Width = 141
    Height = 23
    Caption = #33740#23646#29983#21270#21453#24212#39068#33394#21442#29031
    TabOrder = 3
    WordWrap = True
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 128
    Top = 12
    Width = 37
    Height = 23
    Caption = #32534#30721
    TabOrder = 15
    Visible = False
    OnClick = Button3Click
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    ProjectFile = 'E:\'#24658#26143'\'#28304#31243#24207'\20090831\ymOutput.rav'
    Left = 528
    Top = 8
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
    Left = 556
    Top = 8
  end
  object rvGermAnalysis: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsBase
    Left = 584
    Top = 8
  end
  object rvyp: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = rsYptable
    Left = 612
    Top = 8
  end
  object rsYptable: TADODataSet
    Connection = dmym.conn
    CursorType = ctStatic
    AfterOpen = rsYptableAfterOpen
    CommandText = 'select * from yp  order by bz '
    Parameters = <>
    Left = 668
    Top = 8
  end
  object rvYpAdd: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsAddTemp
    Left = 724
    Top = 8
  end
  object ZFX_PrintQuery: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 696
    Top = 8
  end
  object ADODataSet1: TADODataSet
    Connection = dmym.conn
    Parameters = <>
    Left = 760
    Top = 392
  end
  object ADOQuery1: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 472
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 760
    Top = 368
  end
  object DataSource1: TDataSource
    DataSet = ZFX_kebie
    Left = 272
    Top = 312
  end
  object ZFX_junshu: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 112
    Top = 344
  end
  object ZFX_bblx: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 80
    Top = 312
  end
  object ZFX_shry: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 80
    Top = 344
  end
  object ZFX_sjmd: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 48
    Top = 312
  end
  object ZFX_kebie: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 48
    Top = 344
  end
  object ZFX_bgry: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 144
    Top = 312
  end
  object ZFX_sjry: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 144
    Top = 344
  end
  object ZFX_xingbie: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 112
    Top = 312
  end
  object DataSource2: TDataSource
    DataSet = ZFX_bblx
    Left = 240
    Top = 344
  end
  object DataSource3: TDataSource
    DataSet = ZFX_shry
    Left = 272
    Top = 344
  end
  object DataSource4: TDataSource
    DataSet = ZFX_sjmd
    Left = 208
    Top = 344
  end
  object DataSource5: TDataSource
    DataSet = ZFX_kebie
    Left = 176
    Top = 344
  end
  object DataSource6: TDataSource
    DataSet = ZFX_bgry
    Left = 176
    Top = 312
  end
  object DataSource7: TDataSource
    DataSet = ZFX_sjry
    Left = 208
    Top = 312
  end
  object DataSource8: TDataSource
    DataSet = ZFX_xingbie
    Left = 240
    Top = 312
  end
  object ADOQuery3: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 500
    Top = 8
  end
  object ZFX_YX: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 640
    Top = 8
  end
  object ypchange: TADODataSet
    Connection = dmym.conn
    CommandText = 'select * from yp'
    Parameters = <>
    Left = 48
    Top = 384
  end
end
