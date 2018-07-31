object YgQueryForm: TYgQueryForm
  Left = 339
  Top = 224
  BorderStyle = bsDialog
  Caption = #25171#21360#25253#34920
  ClientHeight = 425
  ClientWidth = 451
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
  object Label2: TLabel
    Left = 108
    Top = 50
    Width = 48
    Height = 12
    Caption = #36215#22987#26085#26399
  end
  object Label3: TLabel
    Left = 254
    Top = 50
    Width = 48
    Height = 12
    Caption = #32467#26463#26085#26399
  end
  object btnQuery: TBitBtn
    Left = 16
    Top = 356
    Width = 97
    Height = 25
    Caption = #25191#34892#26597#35810'(&Q)'
    TabOrder = 7
    OnClick = btnQueryClick
  end
  object BitBtn2: TBitBtn
    Left = 16
    Top = 391
    Width = 97
    Height = 25
    Caption = #25171#21360#21015#34920'(&P)'
    TabOrder = 8
    OnClick = BitBtn2Click
  end
  object btndetail: TBitBtn
    Left = 316
    Top = 355
    Width = 97
    Height = 25
    Caption = #26597#30475#32534#36753'(&D)'
    TabOrder = 9
    OnClick = btndetailClick
  end
  object BitBtn4: TBitBtn
    Left = 164
    Top = 356
    Width = 97
    Height = 25
    Caption = #21024#38500#35760#24405'(&E)'
    TabOrder = 10
    OnClick = BitBtn4Click
  end
  object cbSection: TComboBox
    Left = 70
    Top = 18
    Width = 115
    Height = 20
    Enabled = False
    ItemHeight = 12
    TabOrder = 2
  end
  object begdate: TDateTimePicker
    Left = 164
    Top = 46
    Width = 89
    Height = 20
    Date = 37114.754971180600000000
    Time = 37114.754971180600000000
    TabOrder = 5
  end
  object enddate: TDateTimePicker
    Left = 306
    Top = 46
    Width = 91
    Height = 20
    Date = 37114.754995949100000000
    Time = 37114.754995949100000000
    TabOrder = 6
  end
  object chk1: TCheckBox
    Left = 8
    Top = 20
    Width = 57
    Height = 17
    Caption = #31185' '#23460
    TabOrder = 1
    OnClick = chk1Click
    OnKeyPress = chk1KeyPress
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 88
    Width = 437
    Height = 265
    DataSource = dmym.dsHospital
    ReadOnly = True
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'specNum'
        Title.Caption = #26631#26412#32534#21495
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'secName'
        Title.Caption = #31185#21035
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'room'
        Title.Caption = #26631#26412#26469#28304
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CYlb'
        Title.Caption = #37319#26679#31867#21035
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reportDate'
        Title.Caption = #25253#21578#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'germName'
        Title.Caption = #32454#33740#21517#31216
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'anum'
        Title.Caption = #33740#33853#25968
        Width = 51
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 316
    Top = 390
    Width = 97
    Height = 25
    Caption = #36864#20986
    TabOrder = 0
    OnClick = Button1Click
  end
  object cbStyle: TComboBox
    Left = 280
    Top = 20
    Width = 113
    Height = 20
    Enabled = False
    ItemHeight = 12
    TabOrder = 4
    Items.Strings = (
      #31354#27668
      #29289#20307#34920#38754
      #21307#25252#20154#21592#25163
      #21307#30103#29992#21697
      #28040#27602#28082#19982#20445#23384#28082
      #36879#26512#28082
      #25163#26415#23460
      #20854#20182)
  end
  object CheckBox1: TCheckBox
    Left = 200
    Top = 20
    Width = 77
    Height = 17
    Caption = #37319#26679#31867#21035
    TabOrder = 3
    OnClick = CheckBox1Click
    OnKeyPress = CheckBox1KeyPress
  end
  object CheckBox2: TCheckBox
    Left = 8
    Top = 48
    Width = 89
    Height = 17
    Caption = #20840#37096#26631#26412
    TabOrder = 12
  end
  object BitBtn1: TBitBtn
    Left = 164
    Top = 392
    Width = 97
    Height = 25
    Caption = #23548#20986'EXCEL'
    TabOrder = 13
    OnClick = BitBtn1Click
  end
  object Button2: TButton
    Left = 8
    Top = 68
    Width = 117
    Height = 21
    Caption = #25353#26631#26412#32534#21495#25490#24207
    TabOrder = 14
    OnClick = Button2Click
  end
  object rvproject1: TRvProject
    Engine = RvSystem1
    Left = 32
    Top = 256
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
    Left = 96
    Top = 256
  end
  object Rvquery: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsHospital
    Left = 64
    Top = 256
  end
end
