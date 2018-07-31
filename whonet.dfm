object whonetform: Twhonetform
  Left = 485
  Top = 254
  Width = 754
  Height = 679
  Caption = #23548#20986#21040'WHONET'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 7
    Top = 26
    Width = 579
    Height = 391
    Caption = #23548#20986#37197#32622
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 8
      Top = 20
      Width = 558
      Height = 364
      ActivePage = TabSheet1
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #22522#26412#20449#24687
        ImageIndex = 2
        object Label4: TLabel
          Left = 8
          Top = 14
          Width = 138
          Height = 12
          Caption = 'Whonet'#23454#39564#23460#20195#30721#65288'3'#20301#65289
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 8
          Top = 66
          Width = 72
          Height = 12
          Caption = #23548#20986#26102#38388#33539#22260
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 115
          Top = 90
          Width = 12
          Height = 12
          Caption = #33267
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object DateTimePicker1: TDateTimePicker
          Left = 8
          Top = 86
          Width = 107
          Height = 21
          Date = 40431.000000000000000000
          Time = 40431.000000000000000000
          DateFormat = dfLong
          TabOrder = 0
        end
        object DateTimePicker2: TDateTimePicker
          Left = 130
          Top = 86
          Width = 133
          Height = 21
          Date = 40431.000000000000000000
          Time = 40431.000000000000000000
          DateFormat = dfLong
          TabOrder = 1
        end
        object edt_labcode: TEdit
          Left = 8
          Top = 33
          Width = 103
          Height = 21
          MaxLength = 3
          TabOrder = 2
        end
      end
      object TabSheet2: TTabSheet
        Caption = #31185#21035#21305#37197
        ImageIndex = 1
        object Label9: TLabel
          Left = 4
          Top = 4
          Width = 132
          Height = 12
          Caption = #24658#26143#24494#29983#29289#20998#26512#31995#32479#31185#23460
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 327
          Top = 4
          Width = 60
          Height = 12
          Caption = 'WHONET'#31185#23460
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 0
          Top = 189
          Width = 48
          Height = 12
          Caption = #21305#37197#20851#31995
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object ListBox_Sec_W: TListBox
          Left = 330
          Top = 20
          Width = 210
          Height = 312
          ItemHeight = 16
          TabOrder = 0
        end
        object ListBox_Sec_Y: TListBox
          Left = 0
          Top = 20
          Width = 241
          Height = 163
          ItemHeight = 16
          TabOrder = 1
        end
        object BtnSec: TButton
          Left = 246
          Top = 83
          Width = 75
          Height = 25
          Caption = '< = >'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = BtnSecClick
        end
        object ListBox_Sec_C: TListBox
          Left = 0
          Top = 209
          Width = 241
          Height = 123
          ItemHeight = 16
          TabOrder = 3
        end
        object BtnMarch_Sec: TButton
          Left = 246
          Top = 258
          Width = 75
          Height = 26
          Caption = '  '#8800
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = BtnMarch_SecClick
        end
      end
      object TabSheet3: TTabSheet
        Caption = #26631#26412#31867#22411#21305#37197
        ImageIndex = 2
        object Label13: TLabel
          Left = 4
          Top = 4
          Width = 156
          Height = 12
          Caption = #24658#26143#24494#29983#29289#20998#26512#31995#32479#26631#26412#31867#22411
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 327
          Top = 4
          Width = 84
          Height = 12
          Caption = 'WHONET'#26631#26412#31867#22411
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 0
          Top = 189
          Width = 48
          Height = 12
          Caption = #21305#37197#20851#31995
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object ListBox_Type_W: TListBox
          Left = 330
          Top = 20
          Width = 210
          Height = 312
          ItemHeight = 16
          TabOrder = 0
        end
        object BtnType: TButton
          Left = 246
          Top = 83
          Width = 75
          Height = 25
          Caption = '< = >'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = BtnTypeClick
        end
        object Listbox_Type_Y: TListBox
          Left = 0
          Top = 20
          Width = 241
          Height = 163
          ItemHeight = 16
          TabOrder = 2
        end
        object Listbox_Type_C: TListBox
          Left = 0
          Top = 209
          Width = 241
          Height = 123
          ItemHeight = 16
          TabOrder = 3
        end
        object BtnMarch_Type: TButton
          Left = 246
          Top = 258
          Width = 75
          Height = 26
          Caption = '  '#8800
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = BtnMarch_TypeClick
        end
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 7
    Top = 423
    Width = 579
    Height = 85
    Caption = #25191#34892
    TabOrder = 1
    object ProgressBar1: TProgressBar
      Left = 9
      Top = 54
      Width = 557
      Height = 17
      TabOrder = 0
    end
    object BtnTrans: TButton
      Left = 9
      Top = 19
      Width = 70
      Height = 25
      Caption = #23548#20986
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnTransClick
    end
  end
  object Button3: TButton
    Left = 526
    Top = 2
    Width = 60
    Height = 20
    Caption = #35835#21462#37197#32622
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button1: TButton
    Left = 462
    Top = 2
    Width = 59
    Height = 20
    Caption = #20445#23384#37197#32622
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 400
    Top = 20
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 456
    Top = 20
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 432
    Top = 20
  end
  object SaveDialog1: TSaveDialog
    Filter = #31243#24207#37197#32622#25991#20214'(*.ini)|*.ini|'#25152#26377#25991#20214'(*.*)|*.*'
    Left = 368
    Top = 20
  end
  object OpenDialog2: TOpenDialog
    Left = 344
    Top = 20
  end
end
