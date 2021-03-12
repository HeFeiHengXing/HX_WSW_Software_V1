object reportConfirmForm: TreportConfirmForm
  Left = 837
  Top = 322
  Width = 196
  Height = 248
  Caption = #30830#35748#25171#21360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object CheckBox1: TCheckBox
    Left = 24
    Top = 10
    Width = 149
    Height = 49
    Caption = #38236#26816#32467#26524'/'#32454#33740#29983#38271
    TabOrder = 0
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 25
    Top = 64
    Width = 113
    Height = 49
    Caption = #21307#29983#35780#35821
    TabOrder = 1
    OnClick = CheckBox2Click
  end
  object CheckBox3: TCheckBox
    Left = 25
    Top = 118
    Width = 113
    Height = 49
    Caption = #38468#21152#33647#21697
    TabOrder = 2
    Visible = False
    OnClick = CheckBox3Click
  end
  object Button1: TButton
    Left = 24
    Top = 168
    Width = 57
    Height = 33
    Caption = #25171#21360
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 168
    Width = 49
    Height = 33
    Caption = #21462#28040
    TabOrder = 4
    OnClick = Button2Click
  end
end
