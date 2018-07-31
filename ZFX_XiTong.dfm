object ZFX_YPDY: TZFX_YPDY
  Left = 326
  Top = 176
  Width = 515
  Height = 399
  Caption = #33647#21697#23450#20041
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 507
    Height = 367
    Align = alClient
    Color = clGradientActiveCaption
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 21
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #33740#23646
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 48
      Width = 489
      Height = 289
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
          FieldName = 'ypmc'
          Title.Caption = #33647#21697#21517#31216
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'isprint'
          PickList.Strings = (
            'yes'
            'no')
          Title.Caption = #26159#21542#25171#21360#23450#24615#32467#26524
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ypid'
          Title.Caption = #33647#21697#32534#21495
          Visible = True
        end>
    end
    object ZFX_Jsname: TComboBox
      Left = 40
      Top = 16
      Width = 104
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = ZFX_JsnameChange
      OnClick = ZFX_JsnameClick
      Items.Strings = (
        '')
    end
    object ZFX_Xjname: TComboBox
      Left = 230
      Top = 15
      Width = 101
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      OnChange = ZFX_XjnameChange
      OnClick = ZFX_XjnameClick
      Items.Strings = (
        #24535#36154#33740'ABC'#32676
        #27931#33778#19981#21160#26438#33740)
    end
    object ZFX_bblx: TComboBox
      Left = 408
      Top = 14
      Width = 89
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      OnClick = ZFX_bblxClick
    end
    object cb_xjname: TCheckBox
      Left = 154
      Top = 19
      Width = 76
      Height = 17
      Caption = #32454#33740#21517#31216
      TabOrder = 4
      OnClick = cb_xjnameClick
    end
    object cb_bblx: TCheckBox
      Left = 333
      Top = 18
      Width = 73
      Height = 17
      Caption = #26631#26412#31867#22411
      TabOrder = 5
      OnClick = cb_bblxClick
    end
    object Button1: TButton
      Left = 424
      Top = 344
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 6
      OnClick = Button1Click
    end
  end
  object ADODataSet1: TADODataSet
    Connection = dmym.conn
    Parameters = <>
    Left = 120
    Top = 160
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 168
    Top = 160
  end
  object ZFX_xjcx: TADOQuery
    Connection = dmym.conn
    Parameters = <>
    Left = 216
    Top = 160
  end
end
