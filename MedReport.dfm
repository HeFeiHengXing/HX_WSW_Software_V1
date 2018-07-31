object MedReportForm: TMedReportForm
  Left = 192
  Top = 115
  Width = 404
  Height = 469
  BorderStyle = bsSizeToolWin
  Caption = #33647#25935#32467#26524#8212#26368#22823#21270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 401
    Height = 496
    Align = alCustom
    Color = clSkyBlue
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ypid'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ypmc'
        Title.Caption = #33647#21697#21517#31216
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mic'
        Title.Caption = 'ug/ml'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mg'
        Title.Caption = #33647#25935#32467#26524
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bz'
        Title.Caption = #20998#32452
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 56
    Top = 412
  end
  object ADODataSet1: TADODataSet
    Connection = dmym.conn
    CommandText = 'select * from yp order by ypid'
    Parameters = <>
    Left = 20
    Top = 412
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 92
    Top = 412
  end
end
