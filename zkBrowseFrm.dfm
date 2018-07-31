object zkBrowseForm: TzkBrowseForm
  Left = 468
  Top = 123
  BorderStyle = bsDialog
  Caption = #36136#25511#26631#26412#24635#35272
  ClientHeight = 367
  ClientWidth = 714
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
    Left = 4
    Top = 344
    Width = 36
    Height = 12
    Caption = 'Label1'
  end
  object DBGrid1: TDBGrid
    Left = 4
    Top = 92
    Width = 713
    Height = 249
    DataSource = dmym.dsBaseZk
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'bbh'
        Title.Caption = #26631#26412#21495
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sj'
        Title.Caption = #21457#26631#21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bb'
        Title.Caption = #26631#26412#31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'repdate'
        Title.Caption = #25253#21578#26085#26399
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cydate'
        Title.Caption = #36865#26679#26085#26399
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jzname'
        Title.Caption = #33740#31181#21517#31216
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'js'
        Title.Caption = #33740#23646
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bc'
        Title.Caption = #34917#20805#35828#26126
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'useid'
        Title.Caption = #24052#26031#24503#27861
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 2
    Top = 2
    Width = 713
    Height = 89
    Caption = #25191#34892#21160#20316
    TabOrder = 1
    object btndetail: TButton
      Left = 16
      Top = 32
      Width = 97
      Height = 33
      Caption = #36827#20837#20998#26512#30028#38754
      TabOrder = 0
      OnClick = btndetailClick
    end
    object btnDel: TButton
      Left = 256
      Top = 32
      Width = 97
      Height = 33
      Caption = #21024#38500#35760#24405
      TabOrder = 1
      OnClick = btnDelClick
    end
    object btnPrint: TButton
      Left = 380
      Top = 32
      Width = 97
      Height = 33
      Caption = #25171#21360#25253#34920
      TabOrder = 2
      OnClick = btnPrintClick
    end
    object Button1: TButton
      Left = 140
      Top = 32
      Width = 93
      Height = 33
      Caption = #26597#30475#35814#32454
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object Edit1: TEdit
    Left = 504
    Top = 16
    Width = 121
    Height = 20
    TabOrder = 2
    Text = 'Edit1'
    Visible = False
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    Left = 448
    Top = 56
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
    Left = 488
    Top = 56
  end
  object rvZkAll: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmym.rsBaseZk
    Left = 536
    Top = 56
  end
  object DelectYP: TADOQuery
    Connection = conn
    Parameters = <>
    Left = 80
    Top = 216
  end
  object conn: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 80
    Top = 168
  end
end
