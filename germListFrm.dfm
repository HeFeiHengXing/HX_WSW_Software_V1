object germListForm: TgermListForm
  Left = 241
  Top = 196
  BorderStyle = bsDialog
  Caption = #31995#32479#37096#20998#21487#26816#32454#33740#21015#34920
  ClientHeight = 359
  ClientWidth = 559
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
  object DBGrid1: TDBGrid
    Left = 24
    Top = 16
    Width = 513
    Height = 321
    DataSource = dmym.dsGermName
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'js'
        Title.Caption = #33740#23646
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = #32454#33740#21517#31216
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ename'
        Title.Caption = #33521#25991#21517#31216
        Width = 287
        Visible = True
      end>
  end
end
