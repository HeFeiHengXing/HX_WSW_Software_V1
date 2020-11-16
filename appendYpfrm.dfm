object appendYpForm: TappendYpForm
  Left = 498
  Top = 285
  BorderStyle = bsDialog
  Caption = #38468#21152#33647#25935#20449#24687
  ClientHeight = 268
  ClientWidth = 589
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
  object DBGrid1: TDBGrid
    Left = 4
    Top = 40
    Width = 585
    Height = 221
    DataSource = dmym.dsaddTemp
    Options = [dgTitles, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ypmc'
        Title.Caption = #33647#21697#21517#31216
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mic'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mg'
        Title.Caption = #32467#26524
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bcsm'
        Title.Caption = #34917#20805#35828#26126
        Width = 209
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 4
    Top = 8
    Width = 81
    Height = 25
    Caption = #26032' '#22686
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 100
    Top = 8
    Width = 81
    Height = 25
    Caption = #20462' '#25913
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 196
    Top = 8
    Width = 81
    Height = 25
    Caption = #21024' '#38500
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 292
    Top = 8
    Width = 89
    Height = 25
    Caption = #30830#23450
    TabOrder = 4
    OnClick = Button4Click
  end
end
