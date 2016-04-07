object frmGetPeriod: TfrmGetPeriod
  Left = 422
  Top = 393
  HelpContext = 36
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076' '#1087#1077#1088#1080#1086#1076#1072
  ClientHeight = 375
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'StMedsestra.chm'
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777777777777777777777777777777FF77
    7777777777777777777777777777000000000000000000000000000000770000
    0000000000000000000000000077000F0FFFFFFFFF00FFFFFFFFF0F0007700F0
    FFFFFFFFFF00FFFFFFFFFF0F007700F0FFFFFFFFFF00FFFFFFFFFF0F007700F0
    F0000000F0000F0000000F0F007700F0FFFFFFFFF0FF0FFFFFFFFF0F007700F0
    F0000000FF00FF0000000F0F007700F0FFFFFFFFFF00FFFFFFFFFF0F007700F0
    FFFFFFFFFF00FFFFFFFFFF0F007700F0FFF1111FFF00FFF11111FF0F007700F0
    FFF1111FFF00FFF11111FF0F007700F0FFFF11FFFF00FFF11FFFFF0F007700F0
    FFFF11FFFF00FFF111FFFF0F007700F0FFFF11FFFF00FFFF111FFF0F007700F0
    FFFF11FFFF00FFFFF111FF0F007700F0FFF111FFF0000FF11F11FF0F007700F0
    FFF111FFF0FF0FF11111FF0F007700F0FFFF11FFFF00FFFF111FFF0F007700F0
    FFFFFFFFFF00FFFFFFFFFF0F0077000F0FFFFFFFFF00FFFFFFFFF0F000770000
    00000000000000000000000000FF000000000000000000000000000000FFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 387
    Height = 263
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 1
    TabOrder = 0
    object Bevel1: TBevel
      Left = 159
      Top = 11
      Width = 9
      Height = 241
      Shape = bsLeftLine
    end
    object Bevel2: TBevel
      Left = 168
      Top = 120
      Width = 145
      Height = 8
      Shape = bsTopLine
    end
    object rbM1: TRadioButton
      Left = 37
      Top = 6
      Width = 65
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1103#1085#1074#1072#1088#1100
      Caption = #1071#1085#1074#1072#1088#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = rbAllClick
    end
    object rbM2: TRadioButton
      Left = 37
      Top = 27
      Width = 73
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1092#1077#1074#1088#1072#1083#1100
      Caption = #1060#1077#1074#1088#1072#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = rbAllClick
    end
    object rbM3: TRadioButton
      Left = 37
      Top = 49
      Width = 49
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1084#1072#1088#1090
      Caption = #1052#1072#1088#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = rbAllClick
    end
    object rbM4: TRadioButton
      Left = 37
      Top = 70
      Width = 65
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1072#1087#1088#1077#1083#1100
      Caption = #1040#1087#1088#1077#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = rbAllClick
    end
    object rbM5: TRadioButton
      Left = 37
      Top = 91
      Width = 49
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1084#1072#1081
      Caption = #1052#1072#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = rbAllClick
    end
    object rbM6: TRadioButton
      Left = 37
      Top = 112
      Width = 60
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1080#1102#1085#1100
      Caption = #1048#1102#1085#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = rbAllClick
    end
    object rbM7: TRadioButton
      Left = 37
      Top = 134
      Width = 57
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1080#1102#1083#1100
      Caption = #1048#1102#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = rbAllClick
    end
    object rbM8: TRadioButton
      Left = 37
      Top = 155
      Width = 68
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1072#1074#1075#1091#1089#1090
      Caption = #1040#1074#1075#1091#1089#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = rbAllClick
    end
    object rbM9: TRadioButton
      Left = 37
      Top = 176
      Width = 84
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1089#1077#1085#1090#1103#1073#1088#1100
      Caption = #1057#1077#1085#1090#1103#1073#1088#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = rbAllClick
    end
    object rbM10: TRadioButton
      Left = 37
      Top = 198
      Width = 76
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1086#1082#1090#1103#1073#1088#1100
      Caption = #1054#1082#1090#1103#1073#1088#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = rbAllClick
    end
    object rbM11: TRadioButton
      Left = 37
      Top = 219
      Width = 65
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1085#1086#1103#1073#1088#1100
      Caption = #1053#1086#1103#1073#1088#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = rbAllClick
    end
    object rbM12: TRadioButton
      Left = 37
      Top = 240
      Width = 73
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1076#1077#1082#1072#1073#1088#1100
      Caption = #1044#1077#1082#1072#1073#1088#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = rbAllClick
    end
    object rbK1: TRadioButton
      Left = 174
      Top = 6
      Width = 97
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 1-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Caption = '1-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = rbAllClick
    end
    object rbK2: TRadioButton
      Left = 174
      Top = 27
      Width = 97
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 2-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Caption = '2-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = rbAllClick
    end
    object rbK3: TRadioButton
      Left = 174
      Top = 49
      Width = 97
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 3-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Caption = '3-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = rbAllClick
    end
    object rbK4: TRadioButton
      Left = 174
      Top = 70
      Width = 97
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 4-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Caption = '4-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnClick = rbAllClick
    end
    object rbG1: TRadioButton
      Left = 174
      Top = 134
      Width = 115
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 1-'#1077' '#1087#1086#1083#1091#1075#1086#1076#1080#1077
      Caption = '1-'#1077' '#1087#1086#1083#1091#1075#1086#1076#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      OnClick = rbAllClick
    end
    object rbG2: TRadioButton
      Left = 174
      Top = 155
      Width = 115
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 2-'#1077' '#1087#1086#1083#1091#1075#1086#1076#1080#1077
      Caption = '2-'#1077' '#1087#1086#1083#1091#1075#1086#1076#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      OnClick = rbAllClick
    end
    object rbG3: TRadioButton
      Left = 174
      Top = 198
      Width = 115
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1074#1077#1089#1100' '#1075#1086#1076
      Caption = #1042#1077#1089#1100' '#1075#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
      OnClick = rbAllClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 303
    Width = 387
    Height = 36
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 1
    TabOrder = 1
    DesignSize = (
      387
      36)
    object Label1: TLabel
      Left = 6
      Top = 11
      Width = 110
      Height = 13
      Hint = #1042#1074#1086#1076' '#1085#1072#1095#1072#1083#1100#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
      Caption = '&'#1042#1099#1073#1088#1072#1085#1085#1099#1081' '#1087#1077#1088#1080#1086#1076' '#1089':'
      FocusControl = dDate1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label2: TLabel
      Left = 273
      Top = 11
      Width = 15
      Height = 13
      Hint = #1042#1074#1086#1076' '#1082#1086#1085#1077#1095#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
      Anchors = [akTop, akRight]
      Caption = '&'#1087#1086':'
      FocusControl = dDate2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object dDate1: TJvDateEdit
      Left = 180
      Top = 7
      Width = 88
      Height = 21
      Hint = #1042#1074#1086#1076' '#1085#1072#1095#1072#1083#1100#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageKind = ikEllipsis
      ButtonWidth = 16
      Anchors = [akTop, akRight]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Weekends = [Sun, Sat]
      YearDigits = dyFour
      TabOrder = 0
    end
    object dDate2: TJvDateEdit
      Left = 292
      Top = 7
      Width = 88
      Height = 21
      Hint = #1042#1074#1086#1076' '#1082#1086#1085#1077#1095#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageKind = ikEllipsis
      ButtonWidth = 16
      Anchors = [akTop, akRight]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Weekends = [Sun, Sat]
      YearDigits = dyFour
      TabOrder = 1
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 387
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 381
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 374
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 51
      Caption = 'ToolBar1'
      Images = ilImages
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acApply
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton2: TToolButton
        Left = 51
        Top = 0
        Action = acCancel
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton3: TToolButton
        Left = 102
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 339
    Width = 387
    Height = 36
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 3
    DesignSize = (
      387
      36)
    object Label3: TLabel
      Left = 5
      Top = 10
      Width = 107
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090'. '#1086#1090#1074'. '#1083#1080#1094':'
    end
    object lcbMO_GROUP: TDBLookupComboBox
      Left = 116
      Top = 7
      Width = 264
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'GROUPID'
      ListField = 'FC_GROUP'
      ListSource = dsGroupMo
      TabOrder = 0
    end
  end
  object ilImages: TImageList
    Left = 288
    Top = 56
    Bitmap = {
      494C010102001000340010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B0000007B00
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000080000000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B000000007B00007B00
      00007B0000007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000007B00000000000000
      00007B7B7B00000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      00007B0000007B0000007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000007B0000007B000000
      00007B7B7B007B7B7B0000000000000000000000000000007B00000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      0000007B0000007B00007B0000007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000007B0000007B000000
      7B0000000000000000007B7B7B000000000000007B0000007B0000007B000000
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      0000007B0000007B0000007B00007B0000007B7B7B007B7B7B00000000000000
      000000000000000000000000000000000000000000000000FF0000007B000000
      7B0000007B00000000000000000000007B0000007B0000007B0000007B000000
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      000000FF0000007B0000007B0000007B00007B0000007B7B7B007B7B7B000000
      00000000000000000000000000000000000000000000000000000000FF000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      000000FF000000FF0000007B0000007B0000007B00007B0000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000007B0000007B0000007B0000007B0000007B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B000000000000FF0000007B0000007B0000007B00007B0000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      00000000FF0000007B0000007B0000007B0000007B007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B000000000000FF000000FF0000007B0000007B0000007B00007B00
      00007B7B7B000000000000000000000000000000000000000000000000000000
      00000000FF0000007B0000007B0000007B0000007B00000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063FF000000FF0000007B
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      FF0000007B0000007B0000007B0000007B0000007B0000007B00000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000A5FF0000007B0000007B
      00007B0000007B7B7B007B7B7B00000000000000000000000000000000000000
      FF0000007B0000007B0000007B000000FF000000FF0000007B00000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF0000007B
      0000007B00007B0000007B7B7B007B7B7B0000000000000000000000FF000000
      7B0000007B00000000007B7B7B0000000000000000000000FF0000007B000000
      7B00000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      0000007B0000007B00007B0000007B7B7B00000000000000FF0000007B000000
      7B00000000007B7B7B00000000000000000000000000000000000000FF000000
      7B0000007B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF0000007B00007B0000007B7B7B0000000000000000000000FF000000
      7B00848484000000000000000000000000000000000000000000000000000000
      FF0000007B0000007B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000007B00007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00E7FFFFFF00000000C3FF8FFF00000000
      81FF078F0000000000FF038700000000007F810700000000003F800F00000000
      001FC01F00000000001FE03F00000000040FF03F000000000407F01F00000000
      8F03E00F00000000FF01E00700000000FFC0C18300000000FFE083C300000000
      FFF0C7E100000000FFF8FFF30000000000000000000000000000000000000000
      000000000000}
  end
  object alActions: TActionList
    Images = ilImages
    Left = 288
    Top = 8
    object acApply: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Enabled = False
      ImageIndex = 0
      ShortCut = 13
      OnExecute = acApplyExecute
      OnUpdate = acApplyUpdate
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 1
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
  object os: TOracleSession
    LogonUsername = 'asu'
    LogonPassword = 'asu'
    LogonDatabase = 'asu'
    Left = 289
    Top = 152
  end
  object odsRep: TOracleDataSet
    SQL.Strings = (
      'with mogr as (select g.GROUPID,'
      '                     g.FC_GROUP,'
      '                     case '
      '                       when g.group_root_id = g.GROUPID then 1'
      '                       else 0'
      '                     end FL_ROOT_GROUP'
      '                from ( select g.GROUPID, '
      '                              g.FC_GROUP,          '
      
        '                              connect_by_root g.groupid as group' +
        '_root_id'
      
        '                         from med.TMO_GROUP g                   ' +
        '        '
      '                        start with g.GROUPID = :pMOGROUP_ID'
      
        '                      connect by nocycle prior g.GROUPID = g.FK_' +
        'PARENTID ) g )                      '
      'select s.* ,'
      
        '       row_number() over (partition by s.FC_UCHGR,s.FC_FINSOURCE' +
        ' order by lower(s.FC_MEDIC)) as ROW_NO,        '
      
        '       sum( s.FN_SUMOSTEND ) over ( partition by s.FC_UCHGR, s.F' +
        'C_FINSOURCE ) as FN_SUMMARY_OSTEND_BY_UCHGR_FIN,'
      
        '       sum( s.FN_SUMOSTEND ) over ( partition by s.FC_UCHGR ) as' +
        ' FN_SUMMARY_BY_UCHGR       '
      '  from (                      '
      '      select t.MEDICID,'
      '             t.FC_MEDIC,'
      '             t.FC_EDIZM,'
      '             t.UCHGRID,'
      '             t.FC_UCHGR,'
      
        '             coalesce ( t.FC_FINSOURCE, '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39') FC_FINSOURC' +
        'E,'
      '             t.ALL_FN_KOLOSTBEGIN, -- col 3'
      '             t.ROOT_FN_KOLPRIH_FROM_OTHER, -- col 4'
      
        '             t.CHILD_FN_KOLPRIH_FROM_OTHER, -- col 5            ' +
        '                                                           '
      
        '             (t.ROOT_FN_KOLRASH + t.CHILD_FN_KOLRASH + t.ROOT_FN' +
        '_KOLRASH_TO_OTHERS) as FN_SUMMARY_RASH, -- col 6              '
      '             t.ROOT_FN_KOLRASH, -- col 7'
      '             t.CHILD_FN_KOLOSTBEGIN, -- col 8'
      '             t.CHILD_FN_KOLPRIH, -- col 9'
      '             t.CHILD_FN_KOLRASH, -- col 10,'
      '             t.ROOT_FN_KOLRASH_TO_OTHERS, -- col 11       '
      
        '             t.ALL_FN_KOLOSTBEGIN + t.ROOT_FN_KOLPRIH_FROM_OTHER' +
        ' + t.CHILD_FN_KOLPRIH_FROM_OTHER - (t.ROOT_FN_KOLRASH + t.CHILD_' +
        'FN_KOLRASH + t.ROOT_FN_KOLRASH_TO_OTHERS) as FN_KOLOSTEND, -- co' +
        'l 12                     '
      '             -- '#1094#1077#1085#1072
      '             case'
      
        '              when t.ALL_FN_KOLOSTBEGIN + t.ROOT_FN_KOLPRIH_FROM' +
        '_OTHER + t.CHILD_FN_KOLPRIH_FROM_OTHER - (t.ROOT_FN_KOLRASH + t.' +
        'CHILD_FN_KOLRASH + t.ROOT_FN_KOLRASH_TO_OTHERS) <> 0 then       '
      
        '               ( t.FN_SUMOSTBEGIN + t.ROOT_FN_SUMKOLPRIH_FROM_OT' +
        'HER + t.CHILD_FN_SUMKOLPRIH_FROM_OTHER - (t.ROOT_FN_SUMKOLRASH +' +
        ' t.CHILD_FN_SUMKOLRASH + t.ROOT_FN_SUMKOLRASH_TO_OTHERS ) ) /'
      
        '                 ( t.ALL_FN_KOLOSTBEGIN + t.ROOT_FN_KOLPRIH_FROM' +
        '_OTHER + t.CHILD_FN_KOLPRIH_FROM_OTHER - (t.ROOT_FN_KOLRASH + t.' +
        'CHILD_FN_KOLRASH + t.ROOT_FN_KOLRASH_TO_OTHERS) )        '
      '              else t.FN_AVG_PRICE'
      '             end as FN_PRICE,'
      '            -- '#1089#1091#1084#1084#1072' '
      
        '            ( t.FN_SUMOSTBEGIN + t.ROOT_FN_SUMKOLPRIH_FROM_OTHER' +
        ' + t.CHILD_FN_SUMKOLPRIH_FROM_OTHER - (t.ROOT_FN_SUMKOLRASH + t.' +
        'CHILD_FN_SUMKOLRASH + t.ROOT_FN_SUMKOLRASH_TO_OTHERS ) ) as FN_S' +
        'UMOSTEND          '
      '            '
      
        '      /*        --'#1076#1083#1103' '#1087#1088#1086#1074#1077#1088#1082#1080': '#1074#1086#1090' '#1090#1072#1082' '#1082#1086#1088#1088#1077#1082#1090#1085#1086' '#1088#1072'c'#1089#1095#1080#1090#1099#1074#1072#1090#1100' '#1086 +
        #1089#1090#1072#1090#1086#1082' '#1085#1072' '#1082#1086#1085#1077#1094' '#1080' '#1094#1077#1085#1091' '
      
        '              , t.ALL_FN_KOLOSTBEGIN + t.ALL_FN_KOLPRIH - t.ALL_' +
        'FN_KOLRASH as FN_KOLOSTEND         '
      '              , t.ALL_FN_KOLOSTEND'
      '              ,case'
      
        '                when (t.ALL_FN_KOLOSTBEGIN + t.ALL_FN_KOLPRIH - ' +
        't.ALL_FN_KOLRASH) <> 0 then'
      
        '                 ( t.FN_SUMOSTBEGIN + t.FN_SUMPRIH - t.FN_SUMRAS' +
        'H ) / ( t.ALL_FN_KOLOSTBEGIN + t.ALL_FN_KOLPRIH - t.ALL_FN_KOLRA' +
        'SH )'
      '                else t.FN_AVG_PRICE'
      '              end FN_PRICE     '
      
        '      */                                                        ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                          '
      '        from ('
      '          SELECT M.MEDICID,'
      '                 trim ( M.FC_NAME ) FC_MEDIC,'
      '                 E.FC_NAME AS FC_EDIZM,'
      '                 UG.ROOT_UCHGRID as UCHGRID,'
      '                 UG.ROOT_FC_UCHGR as FC_UCHGR,'
      
        '                 FS.FC_NAME FC_FINSOURCE,                       ' +
        '                                              '
      
        '                 avg ( K.FN_PRICE ) FN_AVG_PRICE,               ' +
        '                                                                ' +
        '                                                                '
      '                 /* '#1086#1089#1090#1072#1090#1082#1080' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072' */'
      '                 -- '#1086#1089#1090#1072#1090#1082#1080' '#1087#1086' '#1074#1089#1077#1081' '#1074#1077#1090#1082#1077
      
        '                 sum (CASE WHEN TRUNC(D.FD_DATA) < TRUNC(:DATE1)' +
        ' THEN C.FN_KOL * D.MNOJ ELSE 0 END) AS ALL_FN_KOLOSTBEGIN, -- 3.' +
        ' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1076#1072
      
        '                 sum (CASE WHEN TRUNC(D.FD_DATA) < TRUNC(:DATE1)' +
        ' THEN C.FN_KOL * K.FN_PRICE * D.MNOJ ELSE 0 END) AS FN_SUMOSTBEG' +
        'IN,        '
      '                -- '#1086#1089#1090#1072#1090#1082#1080' '#1087#1086' '#1087#1086#1090#1086#1084#1082#1072#1084'           '
      
        '                 sum (CASE WHEN D.FL_ROOT_GROUP=0 and TRUNC(D.FD' +
        '_DATA) < TRUNC(:DATE1) THEN C.FN_KOL * D.MNOJ ELSE 0 END) AS CHI' +
        'LD_FN_KOLOSTBEGIN, -- 8. '#1086#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1086' '#1087#1086#1090#1086#1084#1082#1072#1084
      '                             '
      '                 /* '#1087#1088#1080#1093#1086#1076#1099' */'
      
        '                 sum (CASE WHEN D.MNOJ > 0 AND TRUNC(D.FD_DATA) ' +
        'BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL ELSE 0 END' +
        ') AS ALL_FN_KOLPRIH,'
      
        '                 sum(CASE WHEN D.MNOJ > 0 AND TRUNC(D.FD_DATA) B' +
        'ETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL * K.FN_PRIC' +
        'E ELSE 0 END) AS FN_SUMPRIH,'
      
        '                 -- '#1087#1088#1080#1093#1086#1076' '#1074' '#1075#1083#1072#1074#1085#1091#1102' '#1075#1088#1091#1087#1087#1091' '#1080#1079' '#1076#1088#1091#1075#1080#1093' '#1074#1077#1090#1086#1082' '#1075#1088#1091#1087 +
        #1087' '#1052#1054'                  '
      
        '                 sum (CASE WHEN D.FL_PRIH_FROM_OTHERS_MOGROUPS =' +
        ' 1 and D.FL_ROOT_GROUP =1 and D.MNOJ > 0 AND TRUNC(D.FD_DATA) BE' +
        'TWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL ELSE 0 END) ' +
        'AS ROOT_FN_KOLPRIH_FROM_OTHER, -- 4'
      
        '                 sum (CASE WHEN D.FL_PRIH_FROM_OTHERS_MOGROUPS =' +
        ' 1 and D.FL_ROOT_GROUP =1 and D.MNOJ > 0 AND TRUNC(D.FD_DATA) BE' +
        'TWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL*K.FN_PRICE E' +
        'LSE 0 END) AS ROOT_FN_SUMKOLPRIH_FROM_OTHER,            '
      
        '                 -- '#1087#1088#1080#1093#1086#1076' '#1074' '#1076#1086#1095#1077#1088#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1052#1054' '#1080#1079' '#1076#1088#1091#1075#1080#1093' '#1074#1077#1090#1086#1082' ' +
        #1075#1088#1091#1087#1087' '#1052#1054
      
        '                 sum (CASE WHEN D.FL_PRIH_FROM_OTHERS_MOGROUPS =' +
        ' 1 and D.FL_ROOT_GROUP =0 and D.MNOJ > 0 AND TRUNC(D.FD_DATA) BE' +
        'TWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL ELSE 0 END) ' +
        'AS CHILD_FN_KOLPRIH_FROM_OTHER, --5 '
      
        '                 sum (CASE WHEN D.FL_PRIH_FROM_OTHERS_MOGROUPS =' +
        ' 1 and D.FL_ROOT_GROUP =0 and D.MNOJ > 0 AND TRUNC(D.FD_DATA) BE' +
        'TWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL*K.FN_PRICE E' +
        'LSE 0 END) AS CHILD_FN_SUMKOLPRIH_FROM_OTHER,                   '
      '                 -- '#1087#1088#1080#1093#1086#1076#1099'('#1074' '#1090'.'#1095'. '#1080' '#1087#1077#1088#1077#1076#1072#1095#1080')'
      
        '                 sum (CASE WHEN D.FL_ROOT_GROUP =0 and D.MNOJ > ' +
        '0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) T' +
        'HEN C.FN_KOL ELSE 0 END) AS CHILD_FN_KOLPRIH, --9'
      
        '                 sum (CASE WHEN D.FL_ROOT_GROUP =0 and D.MNOJ > ' +
        '0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) T' +
        'HEN C.FN_KOL*K.FN_PRICE ELSE 0 END) AS CHILD_FN_SUMKOLPRIH, --9 ' +
        '                '
      '                                        '
      '                 /* '#1088#1072#1089#1093#1086#1076#1099' */'
      
        '                 sum (CASE WHEN D.MNOJ < 0 AND TRUNC(D.FD_DATA) ' +
        'BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL ELSE 0 END' +
        ' )AS ALL_FN_KOLRASH,'
      
        '                 sum (CASE WHEN D.MNOJ < 0 AND TRUNC(D.FD_DATA) ' +
        'BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL * K.FN_PRI' +
        'CE ELSE 0 END) AS FN_SUMRASH,'
      
        '                 -- '#1088#1072#1089#1093#1086#1076'('#1089#1087#1080#1089#1072#1085#1080#1103','#1073#1077#1079' '#1087#1077#1088#1077#1076#1072#1095#1080' '#1076#1088'.'#1086#1090#1076#1077#1083#1077#1085#1080#1103#1084') ' +
        #1080#1079' '#1075#1083'.'#1075#1088#1091#1087#1087#1099
      
        '                 sum (CASE when D.FL_ROOT_GROUP=1 and D.FP_VID=3' +
        ' and D.MNOJ < 0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AND T' +
        'RUNC(:DATE2) THEN C.FN_KOL ELSE 0 END )AS ROOT_FN_KOLRASH,  -- 7' +
        '                     '
      
        '                 sum (CASE WHEN D.FL_ROOT_GROUP=1 and D.FP_VID=3' +
        ' and D.MNOJ < 0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AND T' +
        'RUNC(:DATE2) THEN C.FN_KOL*K.FN_PRICE ELSE 0 END )AS ROOT_FN_SUM' +
        'KOLRASH,           '
      
        '                 -- '#1088#1072#1089#1093#1086#1076'('#1089#1087#1080#1089#1072#1085#1080#1103','#1073#1077#1079' '#1087#1077#1088#1077#1076#1072#1095#1080' '#1076#1088'.'#1086#1090#1076#1077#1083#1077#1085#1080#1103#1084') ' +
        #1080#1079' '#1076#1086#1095#1077#1088#1085#1080#1093' '#1075#1088#1091#1087#1087
      
        '                 sum (CASE WHEN D.FL_ROOT_GROUP=0 and D.FP_VID=3' +
        ' and D.MNOJ < 0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AND T' +
        'RUNC(:DATE2) THEN C.FN_KOL ELSE 0 END )AS CHILD_FN_KOLRASH, --10' +
        '                      '
      
        '                 sum (CASE WHEN D.FL_ROOT_GROUP=0 and D.FP_VID=3' +
        ' and D.MNOJ < 0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AND T' +
        'RUNC(:DATE2) THEN C.FN_KOL*K.FN_PRICE ELSE 0 END )AS CHILD_FN_SU' +
        'MKOLRASH,           '
      
        '                 -- '#1088#1072#1089#1093#1086#1076'('#1087#1077#1088#1077#1076#1072#1095#1072' '#1074' '#1076#1088'.'#1086#1090#1076#1077#1083#1077#1085#1080#1103') '#1080#1079' '#1075#1083'. '#1075#1088#1091#1087#1087 +
        #1099' '#1052#1054' '#1074' '#1076#1088#1091#1075#1080#1077' '#1074#1077#1090#1082#1080' '#1075#1088#1091#1087#1087' '#1052#1054
      
        '                 sum (CASE WHEN d.FL_RASH_TO_OTHERS_MOGROUPS = 1' +
        ' and D.FP_VID=2 and D.MNOJ < 0 AND TRUNC(D.FD_DATA) BETWEEN TRUN' +
        'C(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL ELSE 0 END )AS ROOT_FN' +
        '_KOLRASH_TO_OTHERS, --11'
      
        '                 sum (CASE WHEN d.FL_RASH_TO_OTHERS_MOGROUPS = 1' +
        ' and D.FP_VID=2  and D.MNOJ < 0 AND TRUNC(D.FD_DATA) BETWEEN TRU' +
        'NC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL*K.FN_PRICE ELSE 0 END' +
        ' )AS ROOT_FN_SUMKOLRASH_TO_OTHERS                      '
      '                 '
      '                 /* '#1076#1083#1103' '#1087#1088#1086#1074#1077#1088#1082#1080': '#1086#1089#1090#1072#1090#1082#1080' '#1085#1072' '#1082#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072' */'
      
        '                 ,sum (CASE WHEN TRUNC(D.FD_DATA) < TRUNC(:DATE2' +
        ') THEN C.FN_KOL * D.MNOJ ELSE 0 END) AS ALL_FN_KOLOSTEND        ' +
        '               '
      '            FROM (SELECT TDOCS.*,'
      
        '                         MED.PKG_PRIHRASH.GET_PRIHRASHPRIZNAK(TD' +
        'OCS.FP_VID,'
      
        '                                                              TD' +
        'OCS.FP_VIDMOVE,'
      
        '                                                              TD' +
        'OCS.FK_MOGROUPID_FROM,'
      
        '                                                              TD' +
        'OCS.FK_MOGROUPID_TO,'
      
        '                                                              mo' +
        'gr.GROUPID ) AS MNOJ,'
      
        '                         mogr.FL_ROOT_GROUP,                    ' +
        '                                 '
      
        '                         -- '#1087#1088#1080#1079#1085#1072#1082' '#1088#1072#1089#1093#1086#1076#1072' '#1080#1079' '#1075#1083#1072#1074#1085#1086#1081' '#1075#1088#1091#1087#1087#1099' '#1074' ' +
        #1076#1091#1088#1075#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1052#1054' '#1074#1085#1077' '#1074#1077#1090#1082#1080' '#1075#1083#1072#1074#1085#1086#1081' '#1075#1088#1091#1087#1087#1099
      '                         case              '
      
        '                           when mogr.GROUPID = TDOCS.FK_MOGROUPI' +
        'D_FROM and mogr.FL_ROOT_GROUP = 1 and coalesce (TDOCS.FK_MOGROUP' +
        'ID_TO, -1) > 0 and'
      
        '                                coalesce (TDOCS.FK_MOGROUPID_TO,' +
        ' -1) not in ( select g.GROUPID from med.TMO_GROUP g '
      
        '                                                                ' +
        '              start with g.FK_PARENTID = :pMOGROUP_ID'
      
        '                                                                ' +
        '            connect by nocycle prior g.GROUPID = g.FK_PARENTID )'
      '                                then 1'
      '                           else 0'
      
        '                         end FL_RASH_TO_OTHERS_MOGROUPS,        ' +
        '                       '
      
        '                         -- '#1087#1088#1080#1093#1086#1076#1072' '#1074' '#1075#1083'.'#1075#1088#1091#1087#1087#1091' '#1080' '#1077#1077' '#1087#1086#1076#1075#1088#1091#1087#1087#1099' '#1080 +
        #1079' '#1076#1088#1091#1075#1080#1093' '#1075#1088#1091#1087#1087' '#1052#1054' ('#1076#1088#1091#1075#1080#1093' '#1074#1077#1090#1086#1082'), '#1087#1088#1080#1093#1086#1076' '#1089#1086' '#1089#1082#1083#1072#1076#1072' '#1085#1077' '#1074#1093#1086#1076#1080#1090
      
        '                         case                                   ' +
        '   '
      
        '                          when mogr.GROUPID = TDOCS.FK_MOGROUPID' +
        '_TO and'
      
        '                                coalesce(TDOCS.FK_MOGROUPID_FROM' +
        ', -1) not in ( select g.GROUPID from med.TMO_GROUP g '
      
        '                                                                ' +
        '                start with g.GROUPID = :pMOGROUP_ID'
      
        '                                                                ' +
        '              connect by nocycle prior g.GROUPID = g.FK_PARENTID' +
        ' )                              '
      '                          then 1'
      '                          else 0'
      
        '                         end FL_PRIH_FROM_OTHERS_MOGROUPS       ' +
        '                                                                ' +
        '                                                                ' +
        '   '
      '                    FROM MED.TDOCS    '
      '                   inner join mogr'
      
        '                      on mogr.GROUPID IN (TDOCS.FK_MOGROUPID_TO,' +
        ' TDOCS.FK_MOGROUPID_FROM)                             '
      
        '                   WHERE TRUNC(TDOCS.FD_DATA) BETWEEN TO_DATE('#39'0' +
        '1.01.2000'#39', '#39'DD.MM.YYYY'#39') AND TRUNC(:DATE2)'
      '                     AND TDOCS.FL_EDIT = 0'
      '                     AND TDOCS.FP_VIDMOVE not IN (4, 5)'
      
        '                     AND mogr.GROUPID IN (TDOCS.FK_MOGROUPID_TO,' +
        ' TDOCS.FK_MOGROUPID_FROM)'
      '                     ) D,'
      '                 MED.TDPC C,'
      '                 MED.TKART K,'
      '                 MED.TMEDIC M,'
      '                 MED.TEI E,'
      
        '                 (select connect_by_root fc_uchgr as root_fc_uch' +
        'gr, connect_by_root uchgrid as root_uchgrid, t.* from med.tuchgr' +
        ' t connect by prior uchgrid = parentid start with parentid = 0) ' +
        'UG,'
      '                 MED.TFINSOURCE FS'
      '           WHERE D.DPID = C.DPID'
      '             AND C.KARTID = K.KARTID'
      '             AND K.MEDICID = M.MEDICID'
      '             AND M.EIID = E.EIID(+)'
      '             AND K.FL_DEL = 0'
      '             AND m.UCHGRID = UG.UCHGRID'
      '             AND K.FK_FINSOURCE_ID = FS.FK_ID(+)'
      '           GROUP BY M.MEDICID,'
      '                 trim ( M.FC_NAME ),'
      '                 E.FC_NAME,'
      '                 UG.ROOT_UCHGRID,'
      '                 UG.ROOT_FC_UCHGR,'
      '                 FS.FC_NAME ) t'
      '        where ( t.ALL_FN_KOLOSTBEGIN <> 0 ) or '
      '              ( t.ROOT_FN_KOLPRIH_FROM_OTHER <> 0 ) or '
      
        '              ( t.CHILD_FN_KOLPRIH_FROM_OTHER <> 0 ) or         ' +
        '     '
      
        '              ( t.ROOT_FN_KOLRASH <> 0 ) or                     ' +
        '     '
      
        '              ( t.CHILD_FN_KOLOSTBEGIN <> 0 ) or                ' +
        '      '
      
        '              ( t.CHILD_FN_KOLPRIH <> 0 ) or                    ' +
        '     '
      '              ( t.ROOT_FN_KOLRASH_TO_OTHERS <> 0 ) '
      '       ) s'
      
        'order by lower(s.FC_UCHGR), decode ( s.FC_FINSOURCE, '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39 +
        ', 1, 0 ),'
      '         lower(s.FC_FINSOURCE), lower(s.FC_MEDIC)')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445320C00000007000000786F0C1F0101
      0100000000060000003A44415445310C00000007000000786F01010101010000
      00000C0000003A504D4F47524F55505F49440300000004000000050100000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000700000046435F4E414D450100000000000600000046435F
      444F430100000000000900000046435F53455249414C01000000000008000000
      46435F55434847520100000000000A000000464E5F53554D5F4B4F4C01000000
      000006000000464E5F4B4F4C0100000000000800000046445F474F44454E0100
      000000000A00000046435F4D4F47525F544F01000000000006000000464E5F53
      554D0100000000000A000000464E5F53554D5F53554D010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 190
    Top = 181
  end
  object ods: TOracleDataSet
    SQL.Strings = (
      'select (to_char(sysdate,'#39'mm'#39')) m from dual')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {0400000001000000010000004D010000000000}
    Session = os
    Left = 288
    Top = 106
  end
  object odsGroupMo: TOracleDataSet
    SQL.Strings = (
      'SELECT g.groupid, g.fc_group'
      '  FROM med.tmo_group G '
      ' WHERE g.fl_del = 0  '
      '   and g.FK_PARENTID is null -- '#1090#1086#1083#1100#1082#1086' '#1082#1086#1088#1085#1077#1074#1099#1077' '#1052#1054' '#1075#1088#1091#1087#1087#1099
      ' order by upper(g.fc_group)'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C010000000000}
    Session = os
    AfterOpen = odsGroupMoAfterOpen
    Left = 214
    Top = 327
  end
  object dsGroupMo: TDataSource
    DataSet = odsGroupMo
    Left = 254
    Top = 327
  end
  object frxDBdsRep: TfrxDBDataset
    UserName = 'frxDBdsRep'
    CloseDataSource = False
    DataSet = odsRep
    BCDToCurrency = False
    Left = 122
    Top = 113
  end
  object odsTSMINI: TOracleDataSet
    SQL.Strings = (
      
        'select sm.fk_id, sm.fc_section, sm.fc_key, sm.fc_value from asu.' +
        'tsmini sm'
      'where'
      ' UPPER(sm.fc_section) = UPPER(:aSection)'
      ' AND UPPER(sm.fc_key) = UPPER(:aKey)')
    Optimize = False
    Variables.Data = {
      0300000002000000090000003A4153454354494F4E0500000000000000000000
      00050000003A414B4559050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = os
    Left = 116
    Top = 177
  end
  object oqInitMO: TOracleQuery
    SQL.Strings = (
      'begin'
      '  SELECT NVL(MAX(MOID),-1) into :nMOID FROM'
      
        '   (SELECT MOID FROM MED.TMO T WHERE T.FL_DEL <> 1 AND T.FK_SOTR' +
        'ID IN (SELECT login.GET_SOTRID(:pAppSotrID) FROM DUAL));'
      
        '  SELECT coalesce ( MAX(fk_curmogroupid), -1 ) into :nMO_GROUP F' +
        'ROM med.tmo where moid = :nMOID;'
      '  '
      '  select coalesce ( max( t.ROOT_ID ), -1)'
      '    into :nMO_ROOT_GROUP'
      '    from ( select CONNECT_BY_ROOT g.GROUPID root_id,'
      '                  g.GROUPID '
      '             from med.TMO_GROUP g'
      '            start with g.FK_PARENTID is null'
      '          connect by prior g.GROUPID = g.FK_PARENTID ) t'
      '   where t.GROUPID = :nMO_GROUP; '
      ''
      '  med.pkg_medses.set_curmo(:nMOID);'
      '  med.pkg_medses.set_curmo_group(:nMO_GROUP);'
      '  med.pkg_medses.ResetDatePeriod;'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      03000000040000000B0000003A50415050534F54524944030000000000000000
      000000060000003A4E4D4F49440300000004000000A2040000000000000A0000
      003A4E4D4F5F47524F5550030000000400000000000000000000000F0000003A
      4E4D4F5F524F4F545F47524F55500300000004000000FFFFFFFF00000000}
    Left = 286
    Top = 282
  end
  object frxRep: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41750.484267118100000000
    ReportOptions.LastChange = 41905.441241655100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepGetValue
    Left = 128
    Top = 64
    Datasets = <
      item
        DataSet = frxDBdsRep
        DataSetName = 'frxDBdsRep'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 94.488213390000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo30: TfrxMemoView
          Align = baWidth
          Top = 56.692950000000000000
          Width = 1046.929810000000000000
          Height = 37.795263390000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[FC_OTD_NAME]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baWidth
          Width = 1046.929810000000000000
          Height = 52.913420000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1115#1056#1118#1056#167#1056#8226#1056#1118' '#1056#1115' '#1056#8221#1056#8217#1056#152#1056#8211#1056#8226#1056#1116#1056#152#1056#152' '#1056#1118#1056#1114#1056#166', '#1056#1119#1056#1115#1056#8221#1056#8250#1056#8226#1056#8211#1056#1106#1056#169#1056#152#1056#1168' '#1056#8221#1056#8226 +
              #1056#1116#1056#8226#1056#8211#1056#1116#1056#1115'-'#1056#1038#1056#1032#1056#1114#1056#1114#1056#1115#1056#8217#1056#1115#1056#1114#1056#1032' '#1056#1032#1056#167#1056#8226#1056#1118#1056#1032
            #1056#1038' [DATE_FROM] '#1056#1119#1056#1115' [DATE_TO]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 582.047620000000000000
        Width = 1046.929810000000000000
        object Memo25: TfrxMemoView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 94.488250000000000000
        ParentFont = False
        Top = 173.858380000000000000
        Width = 1046.929810000000000000
        ReprintOnNewPage = True
        object Memo5: TfrxMemoView
          Width = 34.015770000000000000
          Height = 75.590563390000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 34.015770000000000000
          Width = 170.078850000000000000
          Height = 75.590600000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 321.260050000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 321.260050000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 56.692950000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1109' '#1057#1027#1056#1108#1056#187#1056#176#1056#1169#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 385.512060000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 56.692950000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038' '#1056#1169#1057#1026#1057#1107#1056#1110#1056#1105#1057#8230' '#1056#1114#1056#1115#1056#8250)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 449.764070000000000000
          Width = 75.590600000000000000
          Height = 75.590600000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109#1056#1030#1056#1109#1056#181' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 245.669450000000000000
          Width = 75.590600000000000000
          Height = 75.590563390000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' '#1056#1029#1056#176' '#1056#1029#1056#176#1057#8225#1056#176#1056#187#1056#1109' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 525.354670000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 56.692950000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 771.024120000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217' '#1056#1169#1057#1026#1057#1107#1056#1110#1056#1109#1056#181' '#1056#1114#1056#1115#1056#8250)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 831.496600000000000000
          Width = 75.590600000000000000
          Height = 75.590600000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' ('#1056#1108#1056#1109#1056#187'-'#1056#1030#1056#1109')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 971.339210000000000000
          Top = 37.795300000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 204.094620000000000000
          Width = 41.574830000000000000
          Height = 75.590600000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 525.354670000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217' '#1057#8218#1056#1109#1056#1112' '#1057#8225#1056#1105#1057#1027#1056#187#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 907.087200000000000000
          Width = 139.842610000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8216#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026#1057#1027#1056#1108#1056#176#1057#1039' '#1056#183#1056#176#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 907.087200000000000000
          Top = 37.795300000000000000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 589.606680000000000000
          Top = 18.897650000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#181#1057#1026#1056#181#1056#1169#1056#176#1057#8225#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 589.606680000000000000
          Top = 37.795300000000000000
          Width = 181.417440000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1030' '#1057#1027#1056#1030#1056#1109#1056#181' '#1056#1114#1056#1115#1056#8250)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 589.606680000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 650.079160000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 710.551640000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Top = 75.590600000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 34.015770000000000000
          Top = 75.590600000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 204.094620000000000000
          Top = 75.590600000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 245.669450000000000000
          Top = 75.590600000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 321.260050000000000000
          Top = 75.590600000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 385.512060000000000000
          Top = 75.590600000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 449.764070000000000000
          Top = 75.590600000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 525.354670000000000000
          Top = 75.590600000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '7')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 589.606680000000000000
          Top = 75.590600000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '8')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 650.079160000000000000
          Top = 75.590600000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '9')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 710.551640000000000000
          Top = 75.590600000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '10')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 771.024120000000000000
          Top = 75.590600000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '11')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 831.496600000000000000
          Top = 75.590600000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '12')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 907.087200000000000000
          Top = 75.590600000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '13')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 971.339210000000000000
          Top = 75.590600000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '14')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 374.173470000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBdsRep
        DataSetName = 'frxDBdsRep'
        RowCount = 0
        Stretched = True
        object Memo14: TfrxMemoView
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsRep."ROW_NO"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 34.015770000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBdsRep."FC_MEDIC"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          ShiftMode = smDontShift
          Left = 321.260050000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsRep."ROOT_FN_KOLPRIH_FROM_OTHER"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          ShiftMode = smDontShift
          Left = 385.512060000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsRep."CHILD_FN_KOLPRIH_FROM_OTHER"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          ShiftMode = smDontShift
          Left = 525.354670000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsRep."ROOT_FN_KOLRASH"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          ShiftMode = smDontShift
          Left = 449.764070000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsRep."FN_SUMMARY_RASH"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          ShiftMode = smDontShift
          Left = 589.606680000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsRep."CHILD_FN_KOLOSTBEGIN"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          ShiftMode = smDontShift
          Left = 831.496600000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsRep."FN_KOLOSTEND"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 204.094620000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsRep."FC_EDIZM"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          ShiftMode = smDontShift
          Left = 245.669450000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsRep."ALL_FN_KOLOSTBEGIN"]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          ShiftMode = smDontShift
          Left = 650.079160000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsRep."CHILD_FN_KOLPRIH"]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          ShiftMode = smDontShift
          Left = 710.551640000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsRep."CHILD_FN_KOLRASH"]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          ShiftMode = smDontShift
          Left = 771.024120000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsRep."ROOT_FN_KOLRASH_TO_OTHERS"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          ShiftMode = smDontShift
          Left = 907.087200000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsRep."FN_PRICE"]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          ShiftMode = smDontShift
          Left = 971.339210000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsRep."FN_SUMOSTEND"]')
          ParentFont = False
        end
      end
      object band1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 291.023810000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBdsRep."FC_UCHGR"'
        ReprintOnNewPage = True
        OutlineText = 'frxDBdsRep."FC_UCHGR"'
        Stretched = True
        object Memo39: TfrxMemoView
          Align = baWidth
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1032#1057#8225#1056#181#1057#8218#1056#1029#1056#176#1057#1039' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111#1056#176' "[frxDBdsRep."FC_UCHGR"]"')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 332.598640000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBdsRep."FC_FINSOURCE"'
        ReprintOnNewPage = True
        OutlineText = 'frxDBdsRep."FC_FINSOURCE"'
        Stretched = True
        object Memo40: TfrxMemoView
          Left = 34.015770000000000000
          Width = 1012.914040000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            
              #1056#152#1057#1027#1057#8218#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039' "[frxDBdsRep."FC_F' +
              'INSOURCE"]"')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 415.748300000000000000
        Width = 1046.929810000000000000
        object Memo57: TfrxMemoView
          ShiftMode = smDontShift
          Left = 857.953310000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsRep."FN_SUMMARY_OSTEND_BY_UCHGR_FIN"]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Width = 857.953310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            
              #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1105#1057#1027#1057#8218#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108#1057#1107' '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039' ' +
              '"[frxDBdsRep."FC_FINSOURCE"]":  ')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 457.323130000000000000
        Width = 1046.929810000000000000
        object Memo59: TfrxMemoView
          Width = 857.953310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            
              #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1107#1057#8225#1056#181#1057#8218#1056#1029#1056#1109#1056#8470' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111#1056#181' "[frxDBdsRep."FC_UCH' +
              'GR"]"')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 857.953310000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsRep."FN_SUMMARY_BY_UCHGR"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 536.693260000000000000
        Width = 1046.929810000000000000
        object Memo61: TfrxMemoView
          Width = 857.953310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#152#1056#1118#1056#1115#1056#8220#1056#1115' '#1056#1119#1056#1115' '#1056#8217#1056#8226#1056#8221#1056#1115#1056#1114#1056#1115#1056#1038#1056#1118#1056#152':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 857.953310000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBdsRep."FN_SUMOSTEND">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
end
