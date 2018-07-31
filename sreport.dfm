object sreportform: Tsreportform
  Left = 480
  Top = 254
  BorderStyle = bsSingle
  Caption = #24555#36895#25171#21360
  ClientHeight = 199
  ClientWidth = 239
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RadioButton1: TRadioButton
    Left = 56
    Top = 20
    Width = 150
    Height = 17
    Caption = #24555#36895#25171#21360
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object RadioButton3: TRadioButton
    Left = 56
    Top = 124
    Width = 150
    Height = 17
    Caption = #23548#20986#21040'Word'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 48
    Top = 164
    Width = 59
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 104
    Top = 164
    Width = 57
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = Button3Click
  end
  object RadioButton2: TRadioButton
    Left = 56
    Top = 69
    Width = 150
    Height = 17
    Caption = #25171#21360#39044#35272
    TabOrder = 4
  end
  object Button2: TButton
    Left = 160
    Top = 164
    Width = 75
    Height = 25
    Caption = #35774#20026#40664#35748
    TabOrder = 5
    OnClick = Button2Click
  end
end
