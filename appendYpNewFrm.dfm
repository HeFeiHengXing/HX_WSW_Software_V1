object AppendYpNewForm: TAppendYpNewForm
  Left = 344
  Top = 172
  Width = 356
  Height = 194
  Caption = #33647#25935#38468#21152#32467#26524'--'#26032#22686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 24
    Height = 12
    Caption = #33647#21697
  end
  object Label2: TLabel
    Left = 8
    Top = 52
    Width = 24
    Height = 12
    Caption = #32467#26524
  end
  object Label3: TLabel
    Left = 192
    Top = 52
    Width = 18
    Height = 12
    Caption = 'MIC'
  end
  object Label5: TLabel
    Left = 8
    Top = 84
    Width = 24
    Height = 24
    Caption = #34917#20805#35828#26126
    WordWrap = True
  end
  object DBEdit1: TDBEdit
    Left = 40
    Top = 16
    Width = 297
    Height = 20
    DataField = 'ypmc'
    DataSource = dmym.dsaddTemp
    TabOrder = 0
    OnKeyPress = DBEdit1KeyPress
  end
  object DBComboBox1: TDBComboBox
    Left = 40
    Top = 48
    Width = 129
    Height = 20
    DataField = 'mg'
    DataSource = dmym.dsaddTemp
    ItemHeight = 12
    Items.Strings = (
      #25935#24863
      #20013#20171
      #32784#33647)
    TabOrder = 1
    OnKeyPress = DBComboBox1KeyPress
  end
  object DBEdit2: TDBEdit
    Left = 216
    Top = 48
    Width = 121
    Height = 20
    DataField = 'mic'
    DataSource = dmym.dsaddTemp
    TabOrder = 2
    OnKeyPress = DBEdit2KeyPress
  end
  object DBEdit3: TDBEdit
    Left = 40
    Top = 88
    Width = 297
    Height = 20
    DataField = 'bcsm'
    DataSource = dmym.dsaddTemp
    TabOrder = 3
  end
  object Button1: TButton
    Left = 160
    Top = 120
    Width = 81
    Height = 25
    Caption = #30830#35748
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 256
    Top = 120
    Width = 81
    Height = 25
    Caption = #21462#28040
    TabOrder = 5
    OnClick = Button2Click
  end
end
