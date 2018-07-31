object PositiveForm: TPositiveForm
  Left = 306
  Top = 118
  BorderStyle = bsDialog
  Caption = #38451#24615#25253#21578
  ClientHeight = 463
  ClientWidth = 638
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
    Left = 33
    Top = 36
    Width = 48
    Height = 12
    Caption = #26631' '#26412' '#21495
  end
  object Label3: TLabel
    Left = 246
    Top = 37
    Width = 48
    Height = 12
    Caption = #22995'    '#21517
    FocusControl = dbe_name
  end
  object Label8: TLabel
    Left = 32
    Top = 112
    Width = 48
    Height = 12
    Caption = #26631#26412#31867#22411
  end
  object Label4: TLabel
    Left = 413
    Top = 74
    Width = 48
    Height = 12
    Caption = #31185'    '#21035
  end
  object Label10: TLabel
    Left = 246
    Top = 74
    Width = 48
    Height = 12
    Caption = #24202'    '#21495
    FocusControl = dbe_bed
  end
  object Label9: TLabel
    Left = 511
    Top = 36
    Width = 24
    Height = 12
    Caption = #24180#40836
    FocusControl = dbe_age
  end
  object Label6: TLabel
    Left = 413
    Top = 36
    Width = 48
    Height = 12
    Caption = #24615'    '#21035
  end
  object Label7: TLabel
    Left = 32
    Top = 74
    Width = 48
    Height = 12
    Caption = #20303' '#38498' '#21495
    FocusControl = dbe_custNo
  end
  object Label13: TLabel
    Left = 246
    Top = 112
    Width = 48
    Height = 12
    Caption = #36865#26816#26085#26399
  end
  object Label11: TLabel
    Left = 414
    Top = 112
    Width = 48
    Height = 12
    Caption = #36865' '#26816' '#32773
  end
  object Label12: TLabel
    Left = 32
    Top = 182
    Width = 48
    Height = 12
    Caption = #25253#21578#26085#26399
    FocusControl = dbe_reportDate
  end
  object Label14: TLabel
    Left = 244
    Top = 181
    Width = 48
    Height = 12
    Caption = #25253' '#21578' '#32773
  end
  object Label15: TLabel
    Left = 413
    Top = 181
    Width = 48
    Height = 12
    Caption = #23457' '#26680' '#32773
  end
  object Label2: TLabel
    Left = 31
    Top = 147
    Width = 48
    Height = 12
    Caption = #36865#26816#30446#30340
  end
  object Label21: TLabel
    Left = 246
    Top = 146
    Width = 48
    Height = 12
    Caption = #20020#24202#35786#26029
  end
  object Label22: TLabel
    Left = 32
    Top = 216
    Width = 48
    Height = 12
    Caption = #32463' '#22521' '#20859
  end
  object Label23: TLabel
    Left = 248
    Top = 216
    Width = 84
    Height = 12
    Caption = #20197#21518#37492#23450#20998#26512#65306
  end
  object Label27: TLabel
    Left = 210
    Top = 275
    Width = 60
    Height = 12
    Caption = #21518#26174#24494#38236#26816
  end
  object btnPrint: TBitBtn
    Left = 399
    Top = 412
    Width = 90
    Height = 25
    Caption = #25253#34920'(&R)'
    TabOrder = 30
    OnClick = btnPrintClick
  end
  object BitBtn2: TBitBtn
    Left = 315
    Top = 412
    Width = 75
    Height = 25
    Caption = #23384#30424'(&S)'
    TabOrder = 29
    OnClick = BitBtn2Click
  end
  object dbe_specnum: TDBEdit
    Left = 88
    Top = 32
    Width = 65
    Height = 20
    DataField = 'bbh'
    DataSource = dmym.dsBase
    MaxLength = 10
    TabOrder = 0
    OnClick = dbe_specnumClick
    OnKeyPress = dbe_specnumKeyPress
  end
  object dbe_name: TDBEdit
    Left = 302
    Top = 32
    Width = 85
    Height = 20
    DataField = 'name'
    DataSource = dmym.dsBase
    TabOrder = 2
    OnKeyPress = dbe_nameKeyPress
  end
  object dbc_Section: TDBComboBox
    Left = 463
    Top = 69
    Width = 152
    Height = 20
    DataField = 'kb'
    DataSource = dmym.dsBase
    ItemHeight = 12
    TabOrder = 8
    OnKeyPress = dbc_SectionKeyPress
  end
  object dbcBBtype: TDBComboBox
    Left = 88
    Top = 108
    Width = 129
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
    Left = 537
    Top = 32
    Width = 34
    Height = 20
    DataField = 'old'
    DataSource = dmym.dsBase
    TabOrder = 4
    OnKeyPress = dbe_ageKeyPress
  end
  object dbe_bed: TDBEdit
    Left = 302
    Top = 69
    Width = 85
    Height = 20
    DataField = 'bed'
    DataSource = dmym.dsBase
    TabOrder = 7
    OnKeyPress = dbe_bedKeyPress
  end
  object dbc_sex: TDBComboBox
    Left = 464
    Top = 32
    Width = 47
    Height = 20
    DataField = 'sex'
    DataSource = dmym.dsBase
    ItemHeight = 12
    TabOrder = 3
    OnKeyPress = dbc_sexKeyPress
  end
  object dbe_custNo: TDBEdit
    Left = 88
    Top = 69
    Width = 129
    Height = 20
    DataField = 'zyh'
    DataSource = dmym.dsBase
    TabOrder = 6
    OnKeyPress = dbe_custNoKeyPress
  end
  object dbe_reportDate: TDBEdit
    Left = 88
    Top = 178
    Width = 129
    Height = 20
    DataField = 'repdate'
    DataSource = dmym.dsBase
    TabOrder = 14
  end
  object dbcbg: TDBComboBox
    Left = 301
    Top = 177
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
    Top = 178
    Width = 87
    Height = 20
    Style = csDropDownList
    DataField = 'shys'
    DataSource = dmym.dsBase
    ItemHeight = 12
    TabOrder = 16
    OnKeyPress = dbcshKeyPress
  end
  object BitBtn3: TBitBtn
    Left = 495
    Top = 412
    Width = 75
    Height = 25
    Caption = #36864#20986'(&C)'
    TabOrder = 32
    OnClick = BitBtn3Click
  end
  object btn_listNumber: TButton
    Left = 154
    Top = 32
    Width = 59
    Height = 23
    Caption = #26631#26412#30331#35760
    TabOrder = 1
    OnClick = btn_listNumberClick
  end
  object dbc_checkDoctor: TDBComboBox
    Left = 464
    Top = 108
    Width = 151
    Height = 20
    DataField = 'sj'
    DataSource = dmym.dsBase
    ItemHeight = 12
    TabOrder = 11
    OnKeyPress = dbc_checkDoctorKeyPress
  end
  object dbc_checkGoal: TDBComboBox
    Left = 88
    Top = 144
    Width = 129
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
  object dbe_lczd2: TDBEdit
    Left = 422
    Top = 220
    Width = 105
    Height = 20
    DataField = 'lczd'
    DataSource = dmym.dsBase
    TabOrder = 31
    Visible = False
  end
  object edtTime: TEdit
    Left = 86
    Top = 212
    Width = 113
    Height = 20
    TabOrder = 17
    OnKeyPress = edtTimeKeyPress
  end
  object chkNormal: TCheckBox
    Left = 87
    Top = 244
    Width = 44
    Height = 17
    Caption = #26816#20986
    TabOrder = 19
    OnClick = chkNormalClick
    OnKeyPress = chkNormalKeyPress
  end
  object edtNormal: TEdit
    Left = 131
    Top = 242
    Width = 242
    Height = 20
    Enabled = False
    TabOrder = 20
    OnKeyPress = edtNormalKeyPress
  end
  object chkMicroscope: TCheckBox
    Left = 87
    Top = 272
    Width = 38
    Height = 17
    Caption = #32463
    TabOrder = 21
    OnClick = chkMicroscopeClick
    OnKeyPress = chkMicroscopeKeyPress
  end
  object cbMicroscope: TComboBox
    Left = 123
    Top = 271
    Width = 84
    Height = 20
    Enabled = False
    ItemHeight = 12
    TabOrder = 22
    OnKeyPress = cbMicroscopeKeyPress
    Items.Strings = (
      #38761#20848#27663#26579#33394
      #25239#37240#26579#33394
      #30452#25509#28034#29255)
  end
  object chkOutput: TCheckBox
    Left = 271
    Top = 272
    Width = 50
    Height = 17
    Caption = #26816#20986' '
    TabOrder = 23
    OnClick = chkOutputClick
    OnKeyPress = chkOutputKeyPress
  end
  object edtOutput: TEdit
    Left = 325
    Top = 270
    Width = 268
    Height = 20
    Enabled = False
    TabOrder = 24
    OnKeyPress = edtOutputKeyPress
  end
  object Memo1: TMemo
    Left = 83
    Top = 346
    Width = 516
    Height = 57
    Enabled = False
    TabOrder = 28
  end
  object cbTime: TComboBox
    Left = 198
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
  object DBCRemark: TComboBox
    Left = 114
    Top = 300
    Width = 485
    Height = 20
    Enabled = False
    ItemHeight = 12
    TabOrder = 26
    OnKeyPress = DBCRemarkKeyPress
  end
  object dbe_lczd: TDBComboBox
    Left = 299
    Top = 144
    Width = 300
    Height = 20
    DataField = 'lczd'
    DataSource = dmym.dsBase
    ItemHeight = 12
    TabOrder = 13
    OnKeyPress = dbe_lczdKeyPress
  end
  object dbe_checkDate: TDBEdit
    Left = 302
    Top = 106
    Width = 84
    Height = 20
    DataField = 'cydate'
    DataSource = dmym.dsBase
    TabOrder = 10
  end
  object ChkRemark: TCheckBox
    Left = 87
    Top = 301
    Width = 18
    Height = 17
    Caption = '     '
    TabOrder = 25
    OnClick = ChkRemarkClick
    OnKeyPress = ChkRemarkKeyPress
  end
  object DBComboBox1: TDBComboBox
    Left = 572
    Top = 32
    Width = 44
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
    Left = 86
    Top = 327
    Width = 81
    Height = 17
    Caption = #26816#39564#32773#35780#20215
    TabOrder = 27
    OnClick = CheckBox1Click
    OnKeyPress = CheckBox1KeyPress
  end
  object BtnHistory: TButton
    Left = 536
    Top = 0
    Width = 75
    Height = 25
    Caption = #21382#21490#23545#29031
    TabOrder = 33
    Visible = False
    OnClick = BtnHistoryClick
  end
  object Button1: TButton
    Left = 152
    Top = 32
    Width = 33
    Height = 23
    Caption = #32534#30721
    TabOrder = 34
    Visible = False
    OnClick = Button1Click
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    Left = 96
    Top = 425
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
    Left = 136
    Top = 425
  end
  object rvPositive: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsBase
    Left = 184
    Top = 425
  end
  object ZFX_YX: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 424
    Top = 224
  end
end
