object queryPatientForm: TqueryPatientForm
  Left = 505
  Top = 278
  BorderStyle = bsDialog
  Caption = #30149#21592#20449#24687#26597#35810
  ClientHeight = 221
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 84
    Height = 12
    Caption = #35831#36873#25321#26597#35810#21517#31216
  end
  object Label2: TLabel
    Left = 24
    Top = 40
    Width = 48
    Height = 12
    Caption = #26597#35810#20869#23481
  end
  object BitBtn1: TBitBtn
    Left = 128
    Top = 176
    Width = 113
    Height = 25
    Caption = #36827#20837#20998#26512#30028#38754
    ModalResult = 1
    TabOrder = 3
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 264
    Top = 176
    Width = 75
    Height = 25
    Caption = #25918#24323
    TabOrder = 4
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object cbQueryName: TComboBox
    Left = 136
    Top = 8
    Width = 209
    Height = 20
    ItemHeight = 12
    TabOrder = 0
    Items.Strings = (
      #30149#21382#21495
      #23456#29289#22995#21517
      #26631#26412#21495)
  end
  object Edit1: TEdit
    Left = 136
    Top = 32
    Width = 209
    Height = 20
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 64
    Width = 337
    Height = 97
    DataSource = dmym.dsBase
    TabOrder = 5
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
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = #23456#29289#21517
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'zyh'
        Title.Caption = #30149#21382#21495
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'repdate'
        Title.Caption = #25253#21578#26085#26399
        Width = 73
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 32
    Top = 176
    Width = 75
    Height = 25
    Caption = #26597#25214
    TabOrder = 2
    OnClick = Button1Click
  end
end
