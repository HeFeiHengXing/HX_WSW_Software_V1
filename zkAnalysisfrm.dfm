object zkAnalysisForm: TzkAnalysisForm
  Left = 329
  Top = 160
  BorderStyle = bsDialog
  Caption = #36136#25511#37492#23450#20998#26512
  ClientHeight = 565
  ClientWidth = 851
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
    Left = 32
    Top = 18
    Width = 54
    Height = 12
    Caption = #26631#26412#21495'   '
  end
  object Label6: TLabel
    Left = 232
    Top = 19
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
    Left = 8
    Top = 184
    Width = 649
    Height = 377
    Visible = False
  end
  object gbNameInfo: TGroupBox
    Left = 26
    Top = 40
    Width = 345
    Height = 129
    Caption = #22522#26412#20449#24687
    TabOrder = 4
    object Label4: TLabel
      Left = 20
      Top = 28
      Width = 60
      Height = 12
      Caption = #24180'    '#40836'  '
      Transparent = True
    end
    object Label10: TLabel
      Left = 20
      Top = 64
      Width = 48
      Height = 12
      Caption = #26631#26412#31867#22411
      Transparent = True
    end
    object Label11: TLabel
      Left = 204
      Top = 28
      Width = 48
      Height = 12
      Caption = #24615'   '#21035' '
      Transparent = True
    end
    object Label12: TLabel
      Left = 20
      Top = 99
      Width = 48
      Height = 12
      Caption = #20020#24202#35786#26029
      Transparent = True
    end
    object dbe_age: TDBEdit
      Left = 85
      Top = 24
      Width = 44
      Height = 20
      DataField = 'old'
      DataSource = dmym.dsBaseZk
      TabOrder = 0
      OnKeyPress = dbe_ageKeyPress
    end
    object dbc_bb: TDBComboBox
      Left = 84
      Top = 61
      Width = 77
      Height = 20
      DataField = 'bb'
      DataSource = dmym.dsBaseZk
      ItemHeight = 12
      TabOrder = 3
      OnKeyPress = dbc_bbKeyPress
    end
    object dbc_sex: TDBComboBox
      Left = 260
      Top = 24
      Width = 65
      Height = 20
      DataField = 'sex'
      DataSource = dmym.dsBaseZk
      ItemHeight = 12
      TabOrder = 2
      OnKeyPress = dbc_sexKeyPress
    end
    object dbc_age: TDBComboBox
      Left = 132
      Top = 24
      Width = 41
      Height = 20
      DataField = 'age'
      DataSource = dmym.dsBaseZk
      ItemHeight = 12
      Items.Strings = (
        #23681
        #26376
        #22825
        #23567#26102
        #20998#38047)
      TabOrder = 1
      OnKeyPress = dbc_ageKeyPress
    end
    object dbc_lczd: TDBComboBox
      Left = 84
      Top = 96
      Width = 241
      Height = 20
      DataField = 'lczd'
      DataSource = dmym.dsBaseZk
      ItemHeight = 12
      TabOrder = 4
      OnKeyPress = dbc_lczdKeyPress
    end
  end
  object dbe_bbh: TDBEdit
    Left = 74
    Top = 14
    Width = 70
    Height = 20
    DataField = 'bbh'
    DataSource = dmym.dsBaseZk
    MaxLength = 10
    TabOrder = 0
    OnKeyPress = dbe_bbhKeyPress
  end
  object btnExtract: TButton
    Left = 142
    Top = 12
    Width = 57
    Height = 25
    Caption = #26631#26412#30331#35760
    TabOrder = 1
    OnClick = btnExtractClick
  end
  object Panel1: TPanel
    Left = 24
    Top = 192
    Width = 625
    Height = 193
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Color = clSkyBlue
    TabOrder = 8
    object Label2: TLabel
      Left = 1
      Top = 23
      Width = 18
      Height = 12
      Caption = '(A)'
    end
    object Label3: TLabel
      Left = 1
      Top = 106
      Width = 18
      Height = 12
      Caption = '(B)'
    end
    object gbInput: TGroupBox
      Left = 444
      Top = 2
      Width = 177
      Height = 185
      Caption = #20154#24037#36755#20837
      TabOrder = 0
    end
    object ZFX_sexdb: TDBEdit
      Left = 320
      Top = 16
      Width = 121
      Height = 20
      DataField = 'sex'
      DataSource = ZFX_zks
      TabOrder = 1
      Visible = False
    end
    object ZFX_bblxdb: TDBEdit
      Left = 320
      Top = 48
      Width = 121
      Height = 20
      DataField = 'bbName'
      DataSource = ZFX_zkb
      TabOrder = 2
      Visible = False
    end
    object ZFX_bgrydb: TDBEdit
      Left = 320
      Top = 80
      Width = 121
      Height = 20
      DataField = 'Name'
      DataSource = ZFX_bgrys
      TabOrder = 3
      Visible = False
    end
    object ZFX_sjmddb: TDBEdit
      Left = 320
      Top = 112
      Width = 121
      Height = 20
      DataField = 'ZT_sjmd'
      DataSource = ZFX_sjmds
      TabOrder = 4
      Visible = False
    end
    object ZFX_shrydb: TDBEdit
      Left = 320
      Top = 144
      Width = 121
      Height = 20
      DataField = 'Name'
      DataSource = ZFX_shrys
      TabOrder = 5
      Visible = False
    end
    object ZFX_junshudb: TDBEdit
      Left = 112
      Top = 96
      Width = 121
      Height = 20
      DataField = 'GermType'
      DataSource = ZFX_junshus
      TabOrder = 6
      Visible = False
    end
  end
  object GroupBox1: TGroupBox
    Left = 672
    Top = 387
    Width = 177
    Height = 166
    Color = clAppWorkSpace
    ParentColor = False
    TabOrder = 6
    object btnStartScan: TBitBtn
      Left = 8
      Top = 56
      Width = 73
      Height = 25
      Caption = #24320#22987#26816#26597
      TabOrder = 2
      OnClick = btnStartScanClick
    end
    object btnAnalysis: TButton
      Left = 8
      Top = 96
      Width = 73
      Height = 25
      Caption = #32454#33740#20998#26512
      TabOrder = 3
      OnClick = btnAnalysisClick
    end
    object btnYmAnalysis: TButton
      Left = 8
      Top = 136
      Width = 73
      Height = 25
      Caption = #33647#25935#20998#26512
      TabOrder = 4
      OnClick = btnYmAnalysisClick
    end
    object btnPrint: TButton
      Left = 96
      Top = 96
      Width = 69
      Height = 25
      Caption = #25253#34920
      TabOrder = 6
      OnClick = btnPrintClick
    end
    object chkInput: TCheckBox
      Left = 8
      Top = 16
      Width = 73
      Height = 17
      Caption = #20154#24037#36755#20837
      Color = clMoneyGreen
      Ctl3D = True
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 0
      OnClick = chkInputClick
      OnKeyPress = chkInputKeyPress
    end
    object btnSave: TButton
      Left = 96
      Top = 56
      Width = 69
      Height = 25
      Caption = #23384#30424
      TabOrder = 5
      OnClick = btnSaveClick
    end
    object CheckBox1: TCheckBox
      Left = 88
      Top = 16
      Width = 81
      Height = 17
      Caption = #19981#32463#20202#22120
      Color = clMoneyGreen
      ParentColor = False
      TabOrder = 1
      OnClick = CheckBox1Click
      OnKeyPress = CheckBox1KeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 368
    Top = 40
    Width = 481
    Height = 129
    TabOrder = 5
    object Label13: TLabel
      Left = 9
      Top = 28
      Width = 48
      Height = 12
      Caption = #36865#26816#26085#26399
      Transparent = True
    end
    object Label14: TLabel
      Left = 227
      Top = 26
      Width = 48
      Height = 12
      Caption = #25253#21578#26085#26399
      Transparent = True
    end
    object Label15: TLabel
      Left = 11
      Top = 64
      Width = 48
      Height = 12
      Caption = #36865#26816#21333#20301
      Transparent = True
    end
    object Label16: TLabel
      Left = 226
      Top = 64
      Width = 48
      Height = 12
      Caption = #25253' '#21578' '#32773
      Transparent = True
    end
    object Label17: TLabel
      Left = 9
      Top = 99
      Width = 48
      Height = 12
      Caption = #36865#26816#30446#30340
      Transparent = True
    end
    object Label18: TLabel
      Left = 227
      Top = 99
      Width = 48
      Height = 12
      Caption = #23457' '#26680' '#32773
      Transparent = True
    end
    object dbe_cydate: TDBEdit
      Left = 64
      Top = 26
      Width = 153
      Height = 20
      DataField = 'cydate'
      DataSource = dmym.dsBaseZk
      TabOrder = 0
    end
    object dbe_repdate: TDBEdit
      Left = 280
      Top = 24
      Width = 121
      Height = 20
      DataField = 'repdate'
      DataSource = dmym.dsBaseZk
      TabOrder = 1
    end
    object dbc_reporter: TDBComboBox
      Left = 280
      Top = 62
      Width = 121
      Height = 20
      Style = csDropDownList
      DataField = 'bgys'
      DataSource = dmym.dsBaseZk
      ItemHeight = 12
      TabOrder = 3
      OnKeyPress = dbc_reporterKeyPress
    end
    object dbc_sjmd: TDBComboBox
      Left = 63
      Top = 97
      Width = 154
      Height = 20
      DataField = 'sjmd'
      DataSource = dmym.dsBaseZk
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
      TabOrder = 4
      OnKeyPress = dbc_sjmdKeyPress
    end
    object dbc_shys: TDBComboBox
      Left = 280
      Top = 97
      Width = 121
      Height = 20
      Style = csDropDownList
      DataField = 'shys'
      DataSource = dmym.dsBaseZk
      ItemHeight = 12
      TabOrder = 5
      OnKeyPress = dbc_shysKeyPress
    end
    object dbe_sj: TDBEdit
      Left = 64
      Top = 60
      Width = 153
      Height = 20
      DataField = 'sj'
      DataSource = dmym.dsBaseZk
      TabOrder = 2
      OnKeyPress = dbe_sjKeyPress
    end
  end
  object Panel2: TPanel
    Left = 24
    Top = 392
    Width = 377
    Height = 161
    BevelInner = bvLowered
    Color = clSkyBlue
    TabOrder = 9
  end
  object btnExit: TBitBtn
    Left = 768
    Top = 523
    Width = 73
    Height = 25
    Caption = #36864#20986
    TabOrder = 10
    OnClick = btnExitClick
  end
  object cb_germtype: TComboBox
    Left = 272
    Top = 16
    Width = 73
    Height = 20
    ItemHeight = 12
    TabOrder = 2
    OnClick = cb_germtypeClick
    OnExit = cb_germtypeExit
    OnKeyPress = cb_germtypeKeyPress
  end
  object GroupBox5: TGroupBox
    Left = 672
    Top = 186
    Width = 177
    Height = 199
    Caption = #29983#21270#21453#24212#26816#39564#32467#26524
    TabOrder = 7
    object lbGermStdCode: TLabel
      Left = 8
      Top = 128
      Width = 48
      Height = 12
      Caption = #32454#33740#32534#30721
      Transparent = True
    end
    object lbJzName: TLabel
      Left = 8
      Top = 152
      Width = 72
      Height = 12
      Caption = #32454#33740#26816#39564#32467#26524
      Transparent = True
    end
    object lblCode: TLabel
      Left = 64
      Top = 128
      Width = 30
      Height = 12
      Caption = '00000'
      Color = clYellow
      ParentColor = False
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 16
      Width = 153
      Height = 105
      DataSource = dmym.dsCheck
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'name'
          Title.Caption = #32454#33740#21517#31216
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'gl'
          Title.Caption = #27010#29575
          Width = 38
          Visible = True
        end>
    end
    object dbe_jzname: TDBEdit
      Left = 11
      Top = 172
      Width = 156
      Height = 20
      DataField = 'jzname'
      DataSource = dmym.dsBaseZk
      TabOrder = 1
      OnChange = dbe_jznameChange
      OnClick = dbe_jznameClick
    end
  end
  object GroupBox6: TGroupBox
    Left = 408
    Top = 392
    Width = 249
    Height = 161
    Caption = #33647#25935#23454#39564#32467#26524
    TabOrder = 11
    object sGrid: TStringGrid
      Left = 0
      Top = 16
      Width = 225
      Height = 145
      Color = clSkyBlue
      Ctl3D = False
      FixedColor = clSkyBlue
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      ParentCtl3D = False
      TabOrder = 1
      ColWidths = (
        20
        70
        41
        49
        37)
    end
    object btnappend: TBitBtn
      Left = 224
      Top = 8
      Width = 25
      Height = 153
      Caption = #38468#21152#33647#21697
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnappendClick
    end
  end
  object Button1: TButton
    Left = 342
    Top = 14
    Width = 153
    Height = 23
    Caption = #33740#23646#29983#21270#21453#24212#39068#33394#21442#29031
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 142
    Top = 12
    Width = 32
    Height = 25
    Caption = #32534#30721
    TabOrder = 12
    Visible = False
    OnClick = Button2Click
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    ProjectFile = 'D:\DephiProject\myproject\ym2\ymOutput.rav'
    Left = 392
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
    Left = 432
    Top = 8
  end
  object rvZk: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsBaseZk
    Left = 480
    Top = 8
  end
  object rvyp2: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = rsYptable
    Left = 520
    Top = 8
  end
  object rsYptable: TADODataSet
    Connection = dmym.conn
    CursorType = ctStatic
    AfterOpen = rsYptableAfterOpen
    CommandText = 'select * from yp  order by  bz '
    Parameters = <>
    Left = 560
    Top = 8
  end
  object ZFX_zk: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 272
    Top = 208
  end
  object ZFX_zks: TDataSource
    DataSet = ZFX_zk
    Left = 312
    Top = 208
  end
  object ZFX_zkb: TDataSource
    DataSet = ZFX_zkbb
    Left = 312
    Top = 240
  end
  object ZFX_zkbb: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 272
    Top = 240
  end
  object ZFX_shrys: TDataSource
    DataSet = ZFX_shryq
    Left = 312
    Top = 336
  end
  object ZFX_sjmds: TDataSource
    DataSet = ZFX_sjmdq
    Left = 312
    Top = 304
  end
  object ZFX_bgrys: TDataSource
    DataSet = ZFX_bgryq
    Left = 312
    Top = 272
  end
  object ZFX_bgryq: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 272
    Top = 272
  end
  object ZFX_sjmdq: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 272
    Top = 304
  end
  object ZFX_shryq: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 272
    Top = 336
  end
  object ZFX_junshuq: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 72
    Top = 288
  end
  object ZFX_junshus: TDataSource
    DataSet = ZFX_junshuq
    Left = 104
    Top = 288
  end
  object ADOQuery1: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 592
    Top = 8
  end
  object rvaddtemp: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsAddTemp
    Left = 624
    Top = 8
  end
  object ZFX_YX: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 664
    Top = 8
  end
end
