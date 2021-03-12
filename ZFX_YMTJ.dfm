object ZFX_YMTJFrm: TZFX_YMTJFrm
  Left = 380
  Top = 242
  Width = 725
  Height = 415
  Caption = #33647#25935#32479#35745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 717
    Height = 381
    Align = alClient
    Color = clGradientActiveCaption
    TabOrder = 0
    object ComboBox1: TComboBox
      Left = 24
      Top = 136
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'ComboBox1'
    end
    object ComboBox2: TComboBox
      Left = 16
      Top = 80
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'ComboBox2'
    end
    object stgchk: TStringGrid
      Left = 208
      Top = 56
      Width = 495
      Height = 385
      ColCount = 8
      TabOrder = 2
      RowHeights = (
        24
        24
        24
        24
        24)
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 715
      Height = 379
      Align = alClient
      Color = clGradientActiveCaption
      TabOrder = 3
      object Label3: TLabel
        Left = 8
        Top = 61
        Width = 33
        Height = 13
        AutoSize = False
        Caption = #33740#23646
      end
      object Label4: TLabel
        Left = 8
        Top = 109
        Width = 33
        Height = 13
        AutoSize = False
        Caption = #21697#31181
      end
      object Label5: TLabel
        Left = 200
        Top = 16
        Width = 73
        Height = 13
        AutoSize = False
        Caption = #26597#35810#32467#26524
      end
      object ComboBox3: TComboBox
        Left = 48
        Top = 104
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'ComboBox1'
      end
      object ComboBox4: TComboBox
        Left = 48
        Top = 56
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = 'ComboBox2'
      end
      object StringGrid1: TStringGrid
        Left = 200
        Top = 32
        Width = 505
        Height = 321
        ColCount = 8
        TabOrder = 2
        RowHeights = (
          24
          24
          24
          24
          24)
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 192
        Width = 185
        Height = 105
        Caption = #26102#38388#33539#22260
        TabOrder = 3
        object Label1: TLabel
          Left = 10
          Top = 32
          Width = 63
          Height = 13
          AutoSize = False
          Caption = #24320#22987#26102#38388
        end
        object Label2: TLabel
          Left = 9
          Top = 75
          Width = 64
          Height = 13
          AutoSize = False
          Caption = #32467#26463#26102#38388
        end
        object dateEnd: TDateTimePicker
          Left = 72
          Top = 72
          Width = 105
          Height = 21
          Date = 0.997275995403470000
          Time = 0.997275995403470000
          TabOrder = 0
        end
        object dateStart: TDateTimePicker
          Left = 72
          Top = 28
          Width = 105
          Height = 21
          Date = 0.997245509301137700
          Time = 0.997245509301137700
          TabOrder = 1
        end
      end
      object Button1: TButton
        Left = 8
        Top = 336
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 4
      end
      object Button2: TButton
        Left = 117
        Top = 336
        Width = 75
        Height = 25
        Caption = #23548#20986#25253#34920
        TabOrder = 5
      end
    end
  end
end
