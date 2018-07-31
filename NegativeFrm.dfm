object NegativeForm: TNegativeForm
  Left = 208
  Top = 50
  BorderStyle = bsDialog
  Caption = #20020#24202#38452#24615#25253#21578
  ClientHeight = 593
  ClientWidth = 624
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
  object Label1: TLabel
    Left = 26
    Top = 36
    Width = 48
    Height = 12
    Caption = #26631' '#26412' '#21495
  end
  object Label3: TLabel
    Left = 232
    Top = 36
    Width = 48
    Height = 12
    Caption = #22995'    '#21517
    FocusControl = dbe_name
  end
  object Label8: TLabel
    Left = 26
    Top = 112
    Width = 48
    Height = 12
    Caption = #26631#26412#31867#22411
  end
  object Label4: TLabel
    Left = 407
    Top = 71
    Width = 48
    Height = 12
    Caption = #31185'    '#21035
  end
  object Label10: TLabel
    Left = 232
    Top = 71
    Width = 48
    Height = 12
    Caption = #24202'    '#21495
    FocusControl = dbe_bed
  end
  object Label9: TLabel
    Left = 510
    Top = 36
    Width = 24
    Height = 12
    Caption = #24180#40836
    FocusControl = dbe_age
  end
  object Label6: TLabel
    Left = 405
    Top = 36
    Width = 48
    Height = 12
    Caption = #24615'    '#21035
  end
  object Label7: TLabel
    Left = 26
    Top = 71
    Width = 48
    Height = 12
    Caption = #20303' '#38498' '#21495
    FocusControl = dbe_custNo
  end
  object Label13: TLabel
    Left = 232
    Top = 112
    Width = 48
    Height = 12
    Caption = #36865#26816#26085#26399
    FocusControl = dbe_checkDate
  end
  object Label11: TLabel
    Left = 406
    Top = 112
    Width = 48
    Height = 12
    Caption = #36865' '#26816' '#32773
  end
  object Label12: TLabel
    Left = 26
    Top = 180
    Width = 48
    Height = 12
    Caption = #25253#21578#26085#26399
    FocusControl = dbe_reportDate
  end
  object Label14: TLabel
    Left = 232
    Top = 180
    Width = 48
    Height = 12
    Caption = #25253' '#21578' '#32773
  end
  object Label15: TLabel
    Left = 407
    Top = 180
    Width = 48
    Height = 12
    Caption = #23457' '#26680' '#32773
  end
  object Label2: TLabel
    Left = 26
    Top = 146
    Width = 48
    Height = 12
    Caption = #36865#26816#30446#30340
    FocusControl = dbe_checkDate
  end
  object Label21: TLabel
    Left = 232
    Top = 146
    Width = 48
    Height = 12
    Caption = #20020#24202#35786#26029
    FocusControl = dbe_checkDate
  end
  object Label22: TLabel
    Left = 26
    Top = 216
    Width = 48
    Height = 12
    Caption = #32463' '#22521' '#20859
  end
  object Label23: TLabel
    Left = 242
    Top = 214
    Width = 84
    Height = 12
    Caption = #20197#21518#37492#23450#20998#26512#65306
  end
  object Label26: TLabel
    Left = 343
    Top = 312
    Width = 144
    Height = 12
    Caption = '('#27491#24120#33740#32676')'#65292#21576#20248#21183#29983#38271#12290
  end
  object Label27: TLabel
    Left = 168
    Top = 377
    Width = 60
    Height = 12
    Caption = #21518#26174#24494#38236#26816
  end
  object btnPrint: TBitBtn
    Left = 411
    Top = 536
    Width = 86
    Height = 25
    Caption = #25253#34920'(&R)'
    TabOrder = 39
    OnClick = btnPrintClick
  end
  object BitBtn2: TBitBtn
    Left = 327
    Top = 536
    Width = 75
    Height = 25
    Caption = #23384#30424'(&S)'
    TabOrder = 38
    OnClick = BitBtn2Click
  end
  object dbe_specnum: TDBEdit
    Left = 78
    Top = 32
    Width = 67
    Height = 20
    DataField = 'bbh'
    DataSource = dmym.dsBase
    MaxLength = 10
    TabOrder = 0
    OnClick = dbe_specnumClick
    OnKeyPress = dbe_specnumKeyPress
  end
  object dbe_name: TDBEdit
    Left = 287
    Top = 32
    Width = 85
    Height = 20
    DataField = 'name'
    DataSource = dmym.dsBase
    TabOrder = 2
    OnKeyPress = dbe_nameKeyPress
  end
  object dbc_Section: TDBComboBox
    Left = 462
    Top = 67
    Width = 151
    Height = 20
    DataField = 'kb'
    DataSource = dmym.dsBase
    ItemHeight = 12
    TabOrder = 8
    OnKeyPress = dbc_SectionKeyPress
  end
  object dbcBBtype: TDBComboBox
    Left = 78
    Top = 108
    Width = 113
    Height = 20
    DataField = 'bb'
    DataSource = dmym.dsBase
    ItemHeight = 12
    Items.Strings = (
      #34880#28082
      #39592#39635
      #30192#28082#26631#26412
      #31914#20415#26631#26412
      #23567#20415#26631#26412
      #33043#28082#26631#26412
      #40763#12289#21693#26631#26412
      #29983#27542#31995#26631#26412
      #25163#24037#25253#21578
      #33041#33034#28082
      #32966#27713
      #33145#27700
      #33016#27700
      #20851#33410#28082
      #24515#21253#28082
      #30524#20869#31359#21050#28082
      #20013#32819#31359#21050#28082
      #40763#31398#31359#21050#28082)
    TabOrder = 9
    OnKeyPress = dbcBBtypeKeyPress
  end
  object dbe_age: TDBEdit
    Left = 536
    Top = 32
    Width = 31
    Height = 20
    DataField = 'old'
    DataSource = dmym.dsBase
    TabOrder = 4
    OnKeyPress = dbe_ageKeyPress
  end
  object dbe_bed: TDBEdit
    Left = 287
    Top = 67
    Width = 85
    Height = 20
    DataField = 'bed'
    DataSource = dmym.dsBase
    TabOrder = 7
    OnKeyPress = dbe_bedKeyPress
  end
  object dbc_sex: TDBComboBox
    Left = 460
    Top = 32
    Width = 50
    Height = 20
    DataField = 'sex'
    DataSource = dmym.dsBase
    ItemHeight = 12
    TabOrder = 3
    OnKeyPress = dbc_sexKeyPress
  end
  object dbe_custNo: TDBEdit
    Left = 78
    Top = 67
    Width = 113
    Height = 20
    DataField = 'zyh'
    DataSource = dmym.dsBase
    TabOrder = 6
    OnKeyPress = dbe_custNoKeyPress
  end
  object dbe_checkDate: TDBEdit
    Left = 288
    Top = 110
    Width = 86
    Height = 20
    DataField = 'cydate'
    DataSource = dmym.dsBase
    TabOrder = 10
    OnKeyPress = dbe_checkDateKeyPress
  end
  object dbe_reportDate: TDBEdit
    Left = 78
    Top = 176
    Width = 113
    Height = 20
    DataField = 'repdate'
    DataSource = dmym.dsBase
    TabOrder = 14
  end
  object dbcbg: TDBComboBox
    Left = 287
    Top = 176
    Width = 89
    Height = 20
    DataField = 'bgys'
    DataSource = dmym.dsBase
    ItemHeight = 12
    Items.Strings = (
      #40664#35748#29992#25143)
    TabOrder = 15
    OnKeyPress = dbcbgKeyPress
  end
  object dbcsh: TDBComboBox
    Left = 462
    Top = 176
    Width = 149
    Height = 20
    Style = csDropDownList
    DataField = 'shys'
    DataSource = dmym.dsBase
    ItemHeight = 12
    TabOrder = 16
    OnKeyPress = dbcshKeyPress
  end
  object BitBtn3: TBitBtn
    Left = 507
    Top = 536
    Width = 75
    Height = 25
    Caption = #36864#20986'(&C)'
    TabOrder = 40
    OnClick = BitBtn3Click
  end
  object btn_listNumber: TButton
    Left = 144
    Top = 30
    Width = 57
    Height = 23
    Caption = #26631#26412#30331#35760
    TabOrder = 1
    OnClick = btn_listNumberClick
  end
  object dbc_checkDoctor: TDBComboBox
    Left = 462
    Top = 108
    Width = 149
    Height = 20
    DataField = 'sj'
    DataSource = dmym.dsBase
    ItemHeight = 12
    TabOrder = 11
    OnKeyPress = dbc_checkDoctorKeyPress
  end
  object dbc_checkGoal: TDBComboBox
    Left = 78
    Top = 142
    Width = 113
    Height = 20
    DataField = 'sjmd'
    DataSource = dmym.dsBase
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
    TabOrder = 12
    OnKeyPress = dbc_checkGoalKeyPress
  end
  object dbe_lczd1: TDBEdit
    Left = 328
    Top = 212
    Width = 111
    Height = 20
    DataField = 'lczd'
    DataSource = dmym.dsBase
    TabOrder = 19
    Visible = False
    OnKeyPress = dbe_lczdKeyPress
  end
  object edtTime: TEdit
    Left = 78
    Top = 212
    Width = 113
    Height = 20
    TabOrder = 17
    OnKeyPress = edtTimeKeyPress
  end
  object chkNormal: TCheckBox
    Left = 73
    Top = 246
    Width = 96
    Height = 17
    Caption = #26816#20986#27491#24120#33740#32676
    TabOrder = 20
    OnClick = chkNormalClick
    OnKeyPress = chkNormalKeyPress
  end
  object edtNormal: TEdit
    Left = 179
    Top = 244
    Width = 242
    Height = 20
    Enabled = False
    TabOrder = 21
    OnKeyPress = edtNormalKeyPress
  end
  object chkFailed: TCheckBox
    Left = 73
    Top = 280
    Width = 58
    Height = 17
    Caption = #26410#26816#20986
    TabOrder = 22
    OnClick = chkFailedClick
    OnKeyPress = chkFailedKeyPress
  end
  object edtFailed: TEdit
    Left = 143
    Top = 278
    Width = 242
    Height = 20
    Enabled = False
    TabOrder = 23
    OnKeyPress = edtFailedKeyPress
  end
  object chkGrowth: TCheckBox
    Left = 73
    Top = 308
    Width = 24
    Height = 17
    TabOrder = 24
    OnClick = chkGrowthClick
    OnKeyPress = chkGrowthKeyPress
  end
  object edtGrowth: TEdit
    Left = 109
    Top = 308
    Width = 232
    Height = 20
    Enabled = False
    TabOrder = 25
    OnKeyPress = edtGrowthKeyPress
  end
  object chkNoGrowCause: TCheckBox
    Left = 73
    Top = 342
    Width = 96
    Height = 17
    Caption = #26080#33268#30149#33740#29983#38271
    TabOrder = 26
    OnKeyPress = chkNoGrowCauseKeyPress
  end
  object chkNoGrowth: TCheckBox
    Left = 181
    Top = 342
    Width = 96
    Height = 17
    Caption = #26080#32454#33740#29983#38271
    TabOrder = 27
    OnKeyPress = chkNoGrowthKeyPress
  end
  object chkMicroscope: TCheckBox
    Left = 73
    Top = 374
    Width = 32
    Height = 17
    Caption = #32463
    TabOrder = 28
    OnClick = chkMicroscopeClick
    OnKeyPress = chkMicroscopeKeyPress
  end
  object cbMicroscope: TComboBox
    Left = 109
    Top = 373
    Width = 58
    Height = 20
    ItemHeight = 12
    TabOrder = 29
    OnKeyPress = cbMicroscopeKeyPress
    Items.Strings = (
      #38761#20848#27663#26579#33394
      #25239#37240#26579#33394
      #30452#25509#28034#29255)
  end
  object chkNoOutput: TCheckBox
    Left = 231
    Top = 374
    Width = 58
    Height = 17
    Caption = #26410#26816#20986
    TabOrder = 30
    OnClick = chkNoOutputClick
    OnKeyPress = chkNoOutputKeyPress
  end
  object edtOutput: TEdit
    Left = 291
    Top = 394
    Width = 294
    Height = 20
    Enabled = False
    TabOrder = 33
    OnKeyPress = edtOutputKeyPress
  end
  object chkOutput: TCheckBox
    Left = 231
    Top = 396
    Width = 50
    Height = 17
    Caption = #26816#20986' '
    TabOrder = 32
    OnClick = chkOutputClick
    OnKeyPress = chkOutputKeyPress
  end
  object edtNoOutput: TEdit
    Left = 291
    Top = 372
    Width = 294
    Height = 20
    Enabled = False
    TabOrder = 31
    OnKeyPress = edtNoOutputKeyPress
  end
  object Memo1: TMemo
    Left = 72
    Top = 471
    Width = 517
    Height = 57
    Enabled = False
    Lines.Strings = (
      '')
    TabOrder = 37
  end
  object cbTime: TComboBox
    Left = 192
    Top = 212
    Width = 49
    Height = 20
    ItemHeight = 12
    TabOrder = 18
    OnKeyPress = cbTimeKeyPress
    Items.Strings = (
      #23567#26102
      #22825)
  end
  object DBCRemark1: TDBComboBox
    Left = 68
    Top = 398
    Width = 73
    Height = 20
    DataSource = dmym.dsBase
    ItemHeight = 12
    TabOrder = 41
    Visible = False
    OnKeyPress = DBCRemark1KeyPress
  end
  object ChkRemark: TCheckBox
    Left = 73
    Top = 424
    Width = 17
    Height = 17
    Caption = '    '
    TabOrder = 34
    OnClick = ChkRemarkClick
    OnKeyPress = ChkRemarkKeyPress
  end
  object DBCRemark: TComboBox
    Left = 104
    Top = 422
    Width = 493
    Height = 20
    ItemHeight = 12
    TabOrder = 35
    OnKeyPress = DBCRemarkKeyPress
  end
  object dbe_lczd: TDBComboBox
    Left = 287
    Top = 142
    Width = 302
    Height = 20
    DataField = 'lczd'
    DataSource = dmym.dsBase
    ItemHeight = 12
    TabOrder = 13
    OnKeyPress = dbe_lczdKeyPress
  end
  object DBComboBox1: TDBComboBox
    Left = 568
    Top = 32
    Width = 45
    Height = 20
    DataField = 'age'
    DataSource = dmym.dsBase
    ItemHeight = 12
    Items.Strings = (
      #23681
      #26376
      #22825
      #23567#26102
      #20998#38047)
    TabOrder = 5
    OnKeyPress = DBComboBox1KeyPress
  end
  object CheckBox1: TCheckBox
    Left = 73
    Top = 450
    Width = 90
    Height = 17
    Caption = #26816#39564#32773#35780#20215
    TabOrder = 36
    OnClick = CheckBox1Click
    OnKeyPress = CheckBox1KeyPress
  end
  object BtnHistory: TButton
    Left = 539
    Top = 2
    Width = 75
    Height = 25
    Caption = #21382#21490#23545#29031
    TabOrder = 42
    Visible = False
    OnClick = BtnHistoryClick
  end
  object Button1: TButton
    Left = 144
    Top = 30
    Width = 29
    Height = 23
    Caption = #32534#30721
    TabOrder = 43
    Visible = False
    OnClick = Button1Click
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    ProjectFile = 'E:\'#24658#26143'\20090720\ymOutput.rav'
    Left = 112
    Top = 526
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
    Left = 152
    Top = 526
  end
  object rvNegative: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsBase
    Left = 200
    Top = 526
  end
  object ZFX_YX: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 252
    Top = 526
  end
end
