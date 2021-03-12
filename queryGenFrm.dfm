object queryGenForm: TqueryGenForm
  Left = 430
  Top = 208
  Width = 541
  Height = 377
  Caption = #26597#35810#26465#20214#29983#25104
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 273
    Height = 193
    Caption = #22522#26412#26597#35810#26465#20214
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 136
      Top = 80
      Width = 12
      Height = 12
      Caption = #36215
      Transparent = True
    end
    object Label2: TLabel
      Left = 136
      Top = 104
      Width = 12
      Height = 12
      Caption = #27490
      Transparent = True
    end
    object dblGerm: TDBLookupComboBox
      Left = 112
      Top = 23
      Width = 145
      Height = 20
      KeyField = 'GermType'
      ListField = 'GermType'
      ListSource = dmym.dsgermtype
      TabOrder = 0
    end
    object cb1: TCheckBox
      Left = 40
      Top = 24
      Width = 57
      Height = 17
      Caption = #33740#23646
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnKeyPress = cb1KeyPress
    end
    object cb2: TCheckBox
      Left = 40
      Top = 48
      Width = 73
      Height = 17
      Caption = #26631#26412#31867#22411
      TabOrder = 2
      OnKeyPress = cb2KeyPress
    end
    object startdate: TDateTimePicker
      Left = 160
      Top = 77
      Width = 97
      Height = 20
      Date = 36978.811258333300000000
      Time = 36978.811258333300000000
      TabOrder = 3
    end
    object enddate: TDateTimePicker
      Left = 160
      Top = 101
      Width = 97
      Height = 20
      Date = 36978.811258333300000000
      Time = 36978.811258333300000000
      TabOrder = 4
    end
    object cb3: TCheckBox
      Left = 40
      Top = 80
      Width = 73
      Height = 17
      Caption = #36215#27490#26102#38388
      TabOrder = 5
      OnKeyPress = cb3KeyPress
    end
    object cbBB: TComboBox
      Left = 112
      Top = 48
      Width = 145
      Height = 20
      ItemHeight = 12
      TabOrder = 6
    end
    object cb7: TCheckBox
      Left = 40
      Top = 128
      Width = 73
      Height = 17
      Caption = #36865#26816#30446#30340
      TabOrder = 7
      OnKeyPress = cb7KeyPress
    end
    object sjmd: TComboBox
      Left = 112
      Top = 128
      Width = 145
      Height = 20
      ItemHeight = 12
      TabOrder = 8
    end
  end
  object GroupBox2: TGroupBox
    Left = 280
    Top = 16
    Width = 249
    Height = 145
    Caption = #34917#20805#26597#35810#26465#20214
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 1
    object Label3: TLabel
      Left = 32
      Top = 24
      Width = 24
      Height = 12
      Caption = #26465#20214
      Transparent = True
    end
    object Label4: TLabel
      Left = 104
      Top = 24
      Width = 12
      Height = 12
      Caption = #20540
      Transparent = True
    end
    object Bevel1: TBevel
      Left = 10
      Top = 16
      Width = 217
      Height = 25
    end
    object Splitter1: TSplitter
      Left = 2
      Top = 14
      Width = 1
      Height = 129
    end
    object cb4: TCheckBox
      Left = 8
      Top = 48
      Width = 59
      Height = 17
      Caption = #21697#31181
      TabOrder = 0
      OnKeyPress = cb4KeyPress
    end
    object cb5: TCheckBox
      Left = 8
      Top = 80
      Width = 47
      Height = 17
      Caption = #24615#21035
      TabOrder = 1
      OnKeyPress = cb5KeyPress
    end
    object cb6: TCheckBox
      Left = 8
      Top = 114
      Width = 67
      Height = 17
      Caption = #32454#33740#21517#31216
      TabOrder = 2
      OnKeyPress = cb6KeyPress
    end
    object Edit3: TEdit
      Left = 86
      Top = 112
      Width = 137
      Height = 20
      TabOrder = 3
    end
    object cbSection: TComboBox
      Left = 86
      Top = 48
      Width = 137
      Height = 20
      ItemHeight = 12
      TabOrder = 4
    end
    object cbo2: TComboBox
      Left = 86
      Top = 80
      Width = 137
      Height = 20
      ItemHeight = 12
      TabOrder = 5
      Text = #30007
      Items.Strings = (
        #30007
        #22899)
    end
  end
  object Button1: TButton
    Left = 280
    Top = 296
    Width = 75
    Height = 25
    Caption = #26465#20214#29983#25104
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 360
    Top = 296
    Width = 75
    Height = 25
    Caption = #25191#34892'(&O)'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 440
    Top = 296
    Width = 73
    Height = 25
    Caption = #25918#24323'(&C)'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 240
    Width = 513
    Height = 57
    Lines.Strings = (
      '')
    TabOrder = 5
  end
  object rstemp: TADODataSet
    Connection = dmym.conn
    Parameters = <>
    Left = 136
    Top = 232
  end
end
