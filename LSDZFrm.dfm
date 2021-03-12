object LSDZForm: TLSDZForm
  Left = 224
  Top = 213
  Width = 771
  Height = 382
  Caption = #21382#21490#23545#29031
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 2
    Top = 316
    Width = 36
    Height = 12
    Caption = 'Label1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 64
    Width = 761
    Height = 249
    DataSource = dmym.LSDataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'bbh'
        Title.Caption = #26631#26412#21495
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = #23456#29289#21517
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sex'
        Title.Caption = #24615#21035
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'old'
        Title.Caption = #24180#40836
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bb'
        Title.Caption = #26631#26412#31867#22411
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kb'
        Title.Caption = #21697#31181
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lczd'
        Title.Caption = #20020#24202#35786#26029
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jzname'
        Title.Caption = #32454#33740#21517#31216
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bc'
        Title.Caption = #34917#20805#35828#26126
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'repdate'
        Title.Caption = #25253#21578#26085#26399
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cydate'
        Title.Caption = #36865#26816#26085#26399
        Width = 103
        Visible = True
      end>
  end
  object btnDetail: TBitBtn
    Left = 16
    Top = 16
    Width = 96
    Height = 25
    Caption = #26597#30475#35814#32454'(&D)'
    TabOrder = 1
    OnClick = btnDetailClick
  end
  object btnTotalRec: TButton
    Left = 336
    Top = 16
    Width = 96
    Height = 25
    Caption = #20840#37096#35760#24405'(&R)'
    TabOrder = 2
    OnClick = btnTotalRecClick
  end
  object btnDel: TBitBtn
    Left = 168
    Top = 16
    Width = 96
    Height = 25
    Caption = #21024#38500#35760#24405'(&E)'
    TabOrder = 3
    OnClick = btnDelClick
  end
  object ADOQuery1: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 24
    Top = 120
  end
end
