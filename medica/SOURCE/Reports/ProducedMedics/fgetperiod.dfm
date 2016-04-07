object frmGetPeriod: TfrmGetPeriod
  Left = 338
  Top = 190
  HelpContext = 42
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1046#1091#1088#1085#1072#1083' '#1056#1055#1054
  ClientHeight = 377
  ClientWidth = 351
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
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 351
    Height = 263
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 1
    TabOrder = 0
    DesignSize = (
      351
      263)
    object Bevel1: TBevel
      Left = 166
      Top = 11
      Width = 9
      Height = 241
      Anchors = [akTop, akRight]
      Shape = bsLeftLine
    end
    object Bevel2: TBevel
      Left = 175
      Top = 120
      Width = 145
      Height = 8
      Anchors = [akTop, akRight]
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
      Left = 181
      Top = 6
      Width = 97
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 1-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Anchors = [akTop, akRight]
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
      Left = 181
      Top = 27
      Width = 97
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 2-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Anchors = [akTop, akRight]
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
      Left = 181
      Top = 49
      Width = 97
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 3-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Anchors = [akTop, akRight]
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
      Left = 181
      Top = 70
      Width = 97
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 4-'#1081' '#1082#1074#1072#1088#1090#1072#1083
      Anchors = [akTop, akRight]
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
      Left = 181
      Top = 134
      Width = 115
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 1-'#1077' '#1087#1086#1083#1091#1075#1086#1076#1080#1077
      Anchors = [akTop, akRight]
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
      Left = 181
      Top = 155
      Width = 115
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - 2-'#1077' '#1087#1086#1083#1091#1075#1086#1076#1080#1077
      Anchors = [akTop, akRight]
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
      Left = 181
      Top = 198
      Width = 115
      Height = 17
      Hint = #1055#1077#1088#1080#1086#1076' - '#1074#1077#1089#1100' '#1075#1086#1076
      Anchors = [akTop, akRight]
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
    Width = 351
    Height = 36
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 1
    TabOrder = 1
    DesignSize = (
      351
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
      Left = 236
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
      Left = 143
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
      Left = 255
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
    Width = 351
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 347
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 338
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 46
      Caption = 'ToolBar1'
      Images = ilImages
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      OnDblClick = ToolBar1DblClick
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acApply
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton2: TToolButton
        Left = 46
        Top = 0
        Action = acCancel
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 339
    Width = 351
    Height = 36
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 3
    object Label3: TLabel
      Left = 5
      Top = 10
      Width = 86
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090'. '#1086#1090#1074'.:'
    end
    object lcbMO_GROUP: TDBLookupComboBox
      Left = 94
      Top = 7
      Width = 250
      Height = 21
      KeyField = 'GROUPID'
      ListField = 'FC_GROUP'
      ListSource = dsGroupMo
      TabOrder = 0
      OnCloseUp = lcbCloseUp
    end
  end
  object ilImages: TImageList
    Left = 288
    Top = 56
    Bitmap = {
      494C010102002000200010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      Caption = #1055#1077#1095#1072#1090#1100
      Enabled = False
      ImageIndex = 0
      ShortCut = 13
      OnExecute = acApplyExecute
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
    LogonUsername = 'ASU'
    LogonPassword = 'ASU'
    LogonDatabase = 'ASU'
    Left = 289
    Top = 152
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 184
    Top = 144
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    OpenExcelAfterExport = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    RowsCount = 0
    Split = ssNotSplit
    Left = 112
    Top = 264
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    ExportPictures = False
    OpenExcelAfterExport = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = False
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 112
    Top = 312
  end
  object frKart: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38715.621342592600000000
    ReportOptions.LastChange = 41248.687247175930000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var      '
      '  i_FK_ID_MASTER1,'
      '    i_FK_ID_MASTER2,      '
      '  i_row_num_detail1,'
      '  i_row_num_master1,'
      '  Ucenka_summ,'
      '  Nacenka_summ,'
      '  VidanoSumm,'
      '  PoluchenoSumm,'
      '  i_row_num_detail2,'
      '  i_row_num_master2,'
      '  IngrSumm,'
      '  DocsCount'
      '  '
      ''
      '    '
      '   :double;                    '
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with ReportTitle1, Engine do'
      '  begin'
      
        '  i_FK_ID_MASTER1 := 0; // '#1085#1086#1084#1077#1088'  <odsSelDocPrihRep."FK_ID_MASTE' +
        'R">'
      '  i_row_num_detail1 := 0; // '#1085#1086#1084#1077#1088' '#1089#1090#1088#1086#1082#1080' detail'
      '  i_row_num_master1 := 0; //'#1085#1086#1084#1077#1088' '#1089#1090#1088#1086#1082#1080' master'
      '  Ucenka_summ := 0;'
      '  Nacenka_summ := 0;'
      '  VidanoSumm := 0;'
      '  PoluchenoSumm := 0;'
      '  end'
      'end;'
      ''
      'procedure GroupHeader2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with GroupHeader2, Engine do'
      '  begin'
      
        '  GroupHeader2.Visible := i_FK_ID_MASTER1 <> 0; //(DocsCount <> ' +
        '0);  // '#1072#1094#1094#1082#1072#1103' '#1093#1080#1090#1088#1086#1089#1090#1100' - '#1089#1082#1088#1099#1074#1072#1077#1084' '#1087#1077#1088#1074#1091#1102' '#1085#1077#1085#1091#1078#1085#1091#1102' '#1089#1091#1084#1084#1091' '#1087#1086' '#1080#1085#1075#1088 +
        #1080#1076#1080#1077#1085#1090#1072#1084
      '  end'
      'end;'
      ''
      'procedure Memo70OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo70, Engine do'
      '  begin'
      
        '  if i_FK_ID_MASTER1<><odsProducedMedics."FK_ID_MASTER"> then //' +
        #1085#1086#1074#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1096#1077#1083', '#1085#1072#1076#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1088#1080#1089#1086#1074#1072#1085#1080#1077' '#1085#1077#1082#1086#1090#1086#1088#1099#1093' '#1084#1077#1084#1086
      '  Begin'
      '    Memo70.Font.Color := clBlack;'
      
        '    Ucenka_summ := Ucenka_summ + <odsProducedMedics."FN_UCHENKA"' +
        '> ;'
      '  end'
      
        '  else   //'#1101#1090#1086' '#1089#1087#1080#1089#1086#1082' detail, '#1090'.'#1077'. '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1074#1085#1091#1090#1088#1080' '#1084#1072#1089 +
        #1090#1077#1088#1072
      '  Begin'
      '    Memo70.Font.Color := clWhite;'
      '  end;'
      '  end'
      'end;'
      ''
      'procedure Memo69OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo69, Engine do'
      '  begin'
      
        '   if i_FK_ID_MASTER1<><odsProducedMedics."FK_ID_MASTER"> then /' +
        '/'#1085#1086#1074#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1096#1077#1083', '#1085#1072#1076#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1088#1080#1089#1086#1074#1072#1085#1080#1077' '#1085#1077#1082#1086#1090#1086#1088#1099#1093' '#1084#1077#1084#1086
      '  Begin'
      '    Memo69.Font.Color := clBlack;'
      
        '    Nacenka_summ := Nacenka_summ + <odsProducedMedics."FN_NACHEN' +
        'KA">;'
      '  end'
      
        '  else   //'#1101#1090#1086' '#1089#1087#1080#1089#1086#1082' detail, '#1090'.'#1077'. '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1074#1085#1091#1090#1088#1080' '#1084#1072#1089 +
        #1090#1077#1088#1072
      '  Begin'
      '    Memo69.Font.Color := clWhite;'
      '  end;'
      '  end'
      'end;'
      ''
      'procedure Memo63OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo63, Engine do'
      '  begin'
      
        '  if i_FK_ID_MASTER1<><odsProducedMedics."FK_ID_MASTER"> then //' +
        #1085#1086#1074#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1096#1077#1083', '#1085#1072#1076#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1088#1080#1089#1086#1074#1072#1085#1080#1077' '#1085#1077#1082#1086#1090#1086#1088#1099#1093' '#1084#1077#1084#1086
      '  Begin'
      '     Memo63.Font.Color := clBlack;'
      '  end'
      
        '  else   //'#1101#1090#1086' '#1089#1087#1080#1089#1086#1082' detail, '#1090'.'#1077'. '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1074#1085#1091#1090#1088#1080' '#1084#1072#1089 +
        #1090#1077#1088#1072
      '  Begin'
      '    Memo63.Font.Color := clWhite;'
      '  end;'
      '  end'
      'end;'
      ''
      'procedure Memo65OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo65, Engine do'
      '  begin'
      
        '  if i_FK_ID_MASTER1<><odsProducedMedics."FK_ID_MASTER"> then //' +
        #1085#1086#1074#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1096#1077#1083', '#1085#1072#1076#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1088#1080#1089#1086#1074#1072#1085#1080#1077' '#1085#1077#1082#1086#1090#1086#1088#1099#1093' '#1084#1077#1084#1086
      '  Begin'
      '    Memo65.Font.Color := clBlack;'
      '  end'
      
        '  else   //'#1101#1090#1086' '#1089#1087#1080#1089#1086#1082' detail, '#1090'.'#1077'. '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1074#1085#1091#1090#1088#1080' '#1084#1072#1089 +
        #1090#1077#1088#1072
      '  Begin'
      '    Memo65.Font.Color := clWhite;'
      '  end;'
      '  end'
      'end;'
      ''
      'procedure Memo66OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo66, Engine do'
      '  begin'
      
        '  if i_FK_ID_MASTER1<><odsProducedMedics."FK_ID_MASTER"> then //' +
        #1085#1086#1074#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1096#1077#1083', '#1085#1072#1076#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1088#1080#1089#1086#1074#1072#1085#1080#1077' '#1085#1077#1082#1086#1090#1086#1088#1099#1093' '#1084#1077#1084#1086
      '  Begin'
      '     Memo66.Font.Color := clBlack;'
      '  end'
      
        '  else   //'#1101#1090#1086' '#1089#1087#1080#1089#1086#1082' detail, '#1090'.'#1077'. '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1074#1085#1091#1090#1088#1080' '#1084#1072#1089 +
        #1090#1077#1088#1072
      '  Begin'
      '    Memo66.Font.Color := clWhite;'
      '  end;'
      '  end'
      'end;'
      ''
      'procedure Memo67OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo67, Engine do'
      '  begin'
      
        '  if i_FK_ID_MASTER1<><odsProducedMedics."FK_ID_MASTER"> then //' +
        #1085#1086#1074#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1096#1077#1083', '#1085#1072#1076#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1088#1080#1089#1086#1074#1072#1085#1080#1077' '#1085#1077#1082#1086#1090#1086#1088#1099#1093' '#1084#1077#1084#1086
      '  Begin'
      '     Memo67.Font.Color := clBlack;'
      '  end'
      
        '  else   //'#1101#1090#1086' '#1089#1087#1080#1089#1086#1082' detail, '#1090'.'#1077'. '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1074#1085#1091#1090#1088#1080' '#1084#1072#1089 +
        #1090#1077#1088#1072
      '  Begin'
      '    Memo67.Font.Color := clWhite;'
      '  end;'
      '  end'
      'end;'
      ''
      'procedure Memo68OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo68, Engine do'
      '  begin'
      
        '  if i_FK_ID_MASTER1<><odsProducedMedics."FK_ID_MASTER"> then //' +
        #1085#1086#1074#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1096#1077#1083', '#1085#1072#1076#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1088#1080#1089#1086#1074#1072#1085#1080#1077' '#1085#1077#1082#1086#1090#1086#1088#1099#1093' '#1084#1077#1084#1086
      '  Begin'
      '    Memo68.Font.Color := clBlack;'
      
        '    PoluchenoSumm := PoluchenoSumm + <odsProducedMedics."FN_SUMM' +
        'A">;'
      '  end'
      
        '  else   //'#1101#1090#1086' '#1089#1087#1080#1089#1086#1082' detail, '#1090'.'#1077'. '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1074#1085#1091#1090#1088#1080' '#1084#1072#1089 +
        #1090#1077#1088#1072
      '  Begin'
      '    Memo68.Font.Color := clWhite;'
      '  end;'
      '  end'
      'end;'
      ''
      'procedure Memo61OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo61, Engine do'
      '  begin'
      
        'if i_FK_ID_MASTER1<><odsProducedMedics."FK_ID_MASTER"> then //'#1085#1086 +
        #1074#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1096#1077#1083', '#1085#1072#1076#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1088#1080#1089#1086#1074#1072#1085#1080#1077' '#1085#1077#1082#1086#1090#1086#1088#1099#1093' '#1084#1077#1084#1086
      '  Begin'
      '   i_FK_ID_MASTER1 := <odsProducedMedics."FK_ID_MASTER">;'
      '   i_row_num_detail1 := 1;'
      '   i_row_num_master1 := i_row_num_master1 + 1;'
      ''
      '   Line1.Visible := True;'
      '   Memo61.Font.Color := clBlack;'
      '  end'
      
        'else   //'#1101#1090#1086' '#1089#1087#1080#1089#1086#1082' detail, '#1090'.'#1077'. '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1074#1085#1091#1090#1088#1080' '#1084#1072#1089#1090#1077 +
        #1088#1072
      '  Begin'
      '   i_row_num_detail1 := i_row_num_detail1 + 1;'
      '   Line1.Visible := False;'
      '   Memo61.Font.Color := clWhite;'
      '  end;'
      '  end'
      'end;'
      ''
      'procedure Memo38OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo38, Engine do'
      '  begin'
      
        '  if i_FK_ID_MASTER1<><odsProducedMedics."FK_ID_MASTER"> then //' +
        #1085#1086#1074#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1096#1077#1083', '#1085#1072#1076#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1088#1080#1089#1086#1074#1072#1085#1080#1077' '#1085#1077#1082#1086#1090#1086#1088#1099#1093' '#1084#1077#1084#1086
      '  Begin'
      '    Memo38.Font.Color := clBlack;'
      '  end'
      
        '  else   //'#1101#1090#1086' '#1089#1087#1080#1089#1086#1082' detail, '#1090'.'#1077'. '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1074#1085#1091#1090#1088#1080' '#1084#1072#1089 +
        #1090#1077#1088#1072
      '  Begin'
      '    Memo38.Font.Color := clWhite;'
      '  end;'
      '  end'
      'end;'
      ''
      'procedure Memo42OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo42, Engine do'
      '  begin'
      
        '  if i_FK_ID_MASTER1<><odsProducedMedics."FK_ID_MASTER"> then //' +
        #1085#1086#1074#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1096#1077#1083', '#1085#1072#1076#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1088#1080#1089#1086#1074#1072#1085#1080#1077' '#1085#1077#1082#1086#1090#1086#1088#1099#1093' '#1084#1077#1084#1086
      '  Begin'
      '    Memo42.Font.Color := clBlack;'
      '  end'
      
        '  else   //'#1101#1090#1086' '#1089#1087#1080#1089#1086#1082' detail, '#1090'.'#1077'. '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1074#1085#1091#1090#1088#1080' '#1084#1072#1089 +
        #1090#1077#1088#1072
      '  Begin'
      '    Memo42.Font.Color := clWhite;'
      '  end;'
      '  end'
      'end;'
      ''
      'procedure Memo46OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo46, Engine do'
      '  begin'
      
        '  if i_FK_ID_MASTER1<><odsProducedMedics."FK_ID_MASTER"> then //' +
        #1085#1086#1074#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1096#1077#1083', '#1085#1072#1076#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1088#1080#1089#1086#1074#1072#1085#1080#1077' '#1085#1077#1082#1086#1090#1086#1088#1099#1093' '#1084#1077#1084#1086
      '  Begin'
      '    Memo46.Font.Color := clBlack;'
      '  end'
      
        '  else   //'#1101#1090#1086' '#1089#1087#1080#1089#1086#1082' detail, '#1090'.'#1077'. '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1074#1085#1091#1090#1088#1080' '#1084#1072#1089 +
        #1090#1077#1088#1072
      '  Begin'
      '    Memo46.Font.Color := clWhite;'
      '  end;'
      '  end'
      'end;'
      ''
      'procedure Band1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Band1, Engine do'
      '  begin'
      
        '  i_FK_ID_MASTER2 := 0; // '#1085#1086#1084#1077#1088'  <odsSelDocPrihRep."FK_ID_MASTE' +
        'R">'
      '  i_row_num_detail2 := 0; // '#1085#1086#1084#1077#1088' '#1089#1090#1088#1086#1082#1080' detail'
      '  i_row_num_master2 := 0; //'#1085#1086#1084#1077#1088' '#1089#1090#1088#1086#1082#1080' master'
      '  VidanoSumm := 0;'
      '  IngrSumm := 0;'
      '  DocsCount := 0;'
      '  end'
      'end;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with GroupHeader1, Engine do'
      '  begin'
      
        '  GroupHeader1.Visible := (i_FK_ID_MASTER2 <> 0);  // '#1072#1094#1094#1082#1072#1103' '#1093#1080#1090 +
        #1088#1086#1089#1090#1100' - '#1089#1082#1088#1099#1074#1072#1077#1084' '#1087#1077#1088#1074#1091#1102' '#1085#1077#1085#1091#1078#1085#1091#1102' '#1089#1091#1084#1084#1091' '#1087#1086' '#1080#1085#1075#1088#1080#1076#1080#1077#1085#1090#1072#1084
      '  end'
      'end;'
      ''
      'procedure Memo77OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo77, Engine do'
      '  begin'
      
        '  if i_FK_ID_MASTER2<><odsProducedMedics."FK_ID_MASTER"> then //' +
        #1085#1086#1074#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1096#1077#1083', '#1085#1072#1076#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1088#1080#1089#1086#1074#1072#1085#1080#1077' '#1085#1077#1082#1086#1090#1086#1088#1099#1093' '#1084#1077#1084#1086
      '  Begin'
      '    Memo77.Font.Color := clBlack;'
      '  end'
      
        '  else   //'#1101#1090#1086' '#1089#1087#1080#1089#1086#1082' detail, '#1090'.'#1077'. '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1074#1085#1091#1090#1088#1080' '#1084#1072#1089 +
        #1090#1077#1088#1072
      '  Begin'
      '    Memo77.Font.Color := clWhite;'
      '  end;'
      '  end'
      'end;'
      ''
      'procedure Memo81OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo81, Engine do'
      '  begin'
      
        'if i_FK_ID_MASTER2<><odsProducedMedics."FK_ID_MASTER"> then //'#1085#1086 +
        #1074#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1096#1077#1083', '#1085#1072#1076#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1088#1080#1089#1086#1074#1072#1085#1080#1077' '#1085#1077#1082#1086#1090#1086#1088#1099#1093' '#1084#1077#1084#1086
      '  Begin'
      '   i_FK_ID_MASTER2 := <odsProducedMedics."FK_ID_MASTER">;'
      '   i_row_num_detail2 := 1;'
      '   i_row_num_master2 := i_row_num_master2 + 1;'
      '   line4.visible := True;'
      '   Memo81.Font.Color := clBlack;'
      '   IngrSumm :=  0;'
      '   DocsCount := DocsCount + 1;'
      
        '//   i_FN_PRICE_MASTER := i_FN_PRICE_MASTER + <odsSelDocPoMedic.' +
        '"FN_PRICE_MASTER">;'
      '  end'
      
        'else   //'#1101#1090#1086' '#1089#1087#1080#1089#1086#1082' detail, '#1090'.'#1077'. '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1074#1085#1091#1090#1088#1080' '#1084#1072#1089#1090#1077 +
        #1088#1072
      '  Begin'
      '   i_row_num_detail2 := i_row_num_detail2 + 1;'
      '   line4.visible := False;'
      '   Memo81.Font.Color := clWhite;'
      '  end;'
      '  end'
      'end;'
      ''
      'procedure Memo82OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo82, Engine do'
      '  begin'
      '  VidanoSumm := VidanoSumm + <odsProducedMedics."FN_SUMMA_2">;'
      
        '  if i_FK_ID_MASTER2<><odsProducedMedics."FK_ID_MASTER"> then //' +
        #1085#1086#1074#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1096#1077#1083', '#1085#1072#1076#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1088#1080#1089#1086#1074#1072#1085#1080#1077' '#1085#1077#1082#1086#1090#1086#1088#1099#1093' '#1084#1077#1084#1086
      '  Begin'
      '    IngrSumm := <odsProducedMedics."FN_SUMMA_2">;'
      '  end'
      
        '  else   //'#1101#1090#1086' '#1089#1087#1080#1089#1086#1082' detail, '#1090'.'#1077'. '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1074#1085#1091#1090#1088#1080' '#1084#1072#1089 +
        #1090#1077#1088#1072
      '  Begin'
      '    IngrSumm := IngrSumm + <odsProducedMedics."FN_SUMMA_2">;'
      '  end;'
      '  end'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frKartGetValue
    OnUserFunction = frKartUserFunction
    Left = 184
    Top = 192
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'odsGroupMo'
      end
      item
        DataSet = frDBProducedMedics
        DataSetName = 'odsProducedMedics'
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
      LeftMargin = 15.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 1
      ColumnWidth = 275.000000000000000000
      ColumnPositions.Strings = (
        '0')
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 109.000000000000000000
        Top = 36.000000000000000000
        Visible = False
        Width = 1039.370750000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo1: TfrxMemoView
          Top = 12.000000000000000000
          Width = 679.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#8211#1057#1107#1057#1026#1056#1029#1056#176#1056#187' '#1056#187#1056#176#1056#177#1056#1109#1057#1026#1056#176#1057#8218#1056#1109#1057#1026#1056#1029#1056#1109'-'#1057#8222#1056#176#1057#1027#1056#1109#1056#1030#1056#1109#1057#8225#1056#1029#1057#8249#1057#8230' '#1057#1026#1056#176#1056#177#1056 +
              #1109#1057#8218' '#1056#1111#1056#1109' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#181' '#1056#1115#1056#1119#1056#8216)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Top = 40.000000000000000000
          Width = 679.000000000000000000
          Height = 68.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [Date1] '#1056#1111#1056#1109' [Date2]'
            '[odsGroupMo."fc_group"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 704.000000000000000000
        Width = 1039.370750000000000000
        object Memo22: TfrxMemoView
          Left = 887.000000000000000000
          Width = 96.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [PAGE#]')
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.000000000000000000
        Top = 300.000000000000000000
        Width = 1039.370750000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frDBProducedMedics
        DataSetName = 'odsProducedMedics'
        RowCount = 0
        object Memo70: TfrxMemoView
          Left = 639.000000000000000000
          Width = 40.000000000000000000
          Height = 18.000000000000000000
          OnBeforePrint = 'Memo70OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsProducedMedics."FN_UCHENKA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 598.000000000000000000
          Width = 40.000000000000000000
          Height = 18.000000000000000000
          OnBeforePrint = 'Memo69OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsProducedMedics."FN_NACHENKA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 30.000000000000000000
          Width = 318.000000000000000000
          Height = 18.000000000000000000
          OnBeforePrint = 'Memo63OnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Memo.UTF8 = (
            '[odsProducedMedics."FC_NAME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 348.000000000000000000
          Width = 50.000000000000000000
          Height = 18.000000000000000000
          OnBeforePrint = 'Memo65OnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsProducedMedics."FC_UEDIZM"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 448.000000000000000000
          Width = 66.000000000000000000
          Height = 18.000000000000000000
          OnBeforePrint = 'Memo66OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsProducedMedics."FN_PRICE_FOR_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 515.000000000000000000
          Width = 82.000000000000000000
          Height = 18.000000000000000000
          OnBeforePrint = 'Memo67OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsProducedMedics."FN_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 399.000000000000000000
          Width = 48.000000000000000000
          Height = 18.000000000000000000
          OnBeforePrint = 'Memo68OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.#######'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsProducedMedics."FN_AMOUNT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Width = 30.000000000000000000
          Height = 18.000000000000000000
          OnBeforePrint = 'Memo61OnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsProducedMedics."FN_NUMBER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 679.000000000000000000
          Width = 100.000000000000000000
          Height = 18.000000000000000000
          OnBeforePrint = 'Memo38OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 779.000000000000000000
          Width = 100.000000000000000000
          Height = 18.000000000000000000
          OnBeforePrint = 'Memo42OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 879.000000000000000000
          Width = 100.000000000000000000
          Height = 18.000000000000000000
          OnBeforePrint = 'Memo46OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Width = 979.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object MasterFooter1: TfrxFooter
        Height = 22.000000000000000000
        Top = 412.000000000000000000
        Width = 1039.370750000000000000
        object Line13: TfrxLineView
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line2: TfrxLineView
          Left = 679.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Memo24: TfrxMemoView
          Left = 639.000000000000000000
          Width = 40.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 598.000000000000000000
          Width = 40.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 30.000000000000000000
          Width = 318.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 348.000000000000000000
          Width = 50.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 448.000000000000000000
          Width = 66.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 515.000000000000000000
          Width = 82.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 399.000000000000000000
          Width = 48.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Width = 30.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 679.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 779.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 879.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line12: TfrxLineView
          Top = 20.000000000000000000
          Width = 979.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object MasterData2: TfrxMasterData
        Height = 128.000000000000000000
        Top = 500.000000000000000000
        Width = 1039.370750000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 0
        object Memo50: TfrxMemoView
          Top = 44.000000000000000000
          Width = 839.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          WordWrap = False
        end
        object Memo51: TfrxMemoView
          Top = 64.000000000000000000
          Width = 839.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          WordWrap = False
        end
        object Memo52: TfrxMemoView
          Top = 84.000000000000000000
          Width = 839.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          WordWrap = False
        end
        object Memo53: TfrxMemoView
          Top = 104.000000000000000000
          Width = 839.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          WordWrap = False
        end
        object Memo64: TfrxMemoView
          Top = 24.000000000000000000
          Width = 839.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          WordWrap = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 20.000000000000000000
        Top = 248.000000000000000000
        Width = 1039.370750000000000000
        OnBeforePrint = 'GroupHeader2OnBeforePrint'
        Condition = '[odsProducedMedics."FK_ID_MASTER"]'
        object Memo17: TfrxMemoView
          Left = 30.000000000000000000
          Width = 318.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Memo.UTF8 = (
            '')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 348.000000000000000000
          Width = 50.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 448.000000000000000000
          Width = 66.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 515.000000000000000000
          Width = 82.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 399.000000000000000000
          Width = 48.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Width = 30.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 679.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 779.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 879.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 598.000000000000000000
          Width = 40.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 639.000000000000000000
          Width = 40.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        Height = 60.000000000000000000
        Top = 168.000000000000000000
        Width = 1039.370750000000000000
        object Memo4: TfrxMemoView
          Top = 18.000000000000000000
          Width = 679.000000000000000000
          Height = 24.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8222#1056#176#1057#1027#1056#1109#1056#1030#1056#176#1056#1029#1056#1109' '#1056#1105' '#1057#1027#1056#1169#1056#176#1056#1029#1056#1109)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 30.000000000000000000
          Top = 42.000000000000000000
          Width = 318.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 348.000000000000000000
          Top = 42.000000000000000000
          Width = 50.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'.'#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 399.000000000000000000
          Top = 42.000000000000000000
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 448.000000000000000000
          Top = 42.000000000000000000
          Width = 66.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 515.000000000000000000
          Top = 42.000000000000000000
          Width = 82.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Top = 42.000000000000000000
          Width = 30.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 679.000000000000000000
          Top = 42.000000000000000000
          Width = 100.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#1027#1056#1111#1056#1109#1056#187#1056#1029#1056#1105#1056#187)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 779.000000000000000000
          Top = 42.000000000000000000
          Width = 100.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1105#1056#187)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 879.000000000000000000
          Top = 42.000000000000000000
          Width = 100.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#1029#1057#1039#1056#187' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1057#1107)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 598.000000000000000000
          Top = 42.000000000000000000
          Width = 40.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '+')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 639.000000000000000000
          Top = 42.000000000000000000
          Width = 40.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
    object Page2: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 7.000000000000000000
      RightMargin = 15.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 1
      ColumnWidth = 275.000000000000000000
      ColumnPositions.Strings = (
        '0')
      object Band1: TfrxReportTitle
        Height = 109.000000000000000000
        Top = 52.000000000000000000
        Visible = False
        Width = 1039.370750000000000000
        OnBeforePrint = 'Band1OnBeforePrint'
        object Memo14: TfrxMemoView
          Top = 12.000000000000000000
          Width = 679.000000000000000000
          Height = 20.000000000000000000
          Visible = False
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#8211#1057#1107#1057#1026#1056#1029#1056#176#1056#187' '#1056#187#1056#176#1056#177#1056#1109#1057#1026#1056#176#1057#8218#1056#1109#1057#1026#1056#1029#1056#1109'-'#1057#8222#1056#176#1057#1027#1056#1109#1056#1030#1056#1109#1057#8225#1056#1029#1057#8249#1057#8230' '#1057#1026#1056#176#1056#177#1056 +
              #1109#1057#8218' '#1056#1111#1056#1109' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#181' '#1056#1115#1056#1119#1056#8216)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Top = 40.000000000000000000
          Width = 679.000000000000000000
          Height = 68.000000000000000000
          Visible = False
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [Date1] '#1056#1111#1056#1109' [Date2]'
            '[odsGroupMo."fc_group"]')
          ParentFont = False
        end
      end
      object Band2: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 660.000000000000000000
        Width = 1039.370750000000000000
        object Memo49: TfrxMemoView
          Top = 1.000000000000000000
          Width = 96.000000000000000000
          Height = 18.000000000000000000
          Visible = False
          ShowHint = False
          StretchMode = smMaxHeight
          AllowExpressions = False
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [PAGE# -(TOTALPAGES# / 2)]')
          VAlign = vaCenter
        end
      end
      object Band3: TfrxMasterData
        Height = 18.000000000000000000
        Top = 320.000000000000000000
        Width = 1039.370750000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frDBProducedMedics
        DataSetName = 'odsProducedMedics'
        RowCount = 0
        object Memo76: TfrxMemoView
          Left = 228.000000000000000000
          Width = 458.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[odsProducedMedics."TKART_NAME_2"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 30.000000000000000000
          Width = 71.000000000000000000
          Height = 18.000000000000000000
          OnBeforePrint = 'Memo77OnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsProducedMedics."FD_DATA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 686.000000000000000000
          Width = 75.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsProducedMedics."FC_UEDIZM_2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 761.000000000000000000
          Width = 50.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.#######'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsProducedMedics."FN_AMOUNT_2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 811.000000000000000000
          Width = 73.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsProducedMedics."FN_PRICE_2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Width = 30.000000000000000000
          Height = 18.000000000000000000
          OnBeforePrint = 'Memo81OnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsProducedMedics."FN_NUMBER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 884.000000000000000000
          Width = 85.000000000000000000
          Height = 18.000000000000000000
          OnBeforePrint = 'Memo82OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsProducedMedics."FN_SUMMA_2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = -21.000000000000000000
          Width = 16.000000000000000000
          Height = 18.000000000000000000
          Visible = False
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[i_row_num_master2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          Width = 969.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line5: TfrxLineView
          Left = -1.000000000000000000
          Height = 18.000000000000000000
          Visible = False
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line6: TfrxLineView
          Left = 969.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Memo62: TfrxMemoView
          Left = 101.000000000000000000
          Width = 127.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[odsProducedMedics."FC_SERIAL_2"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Band4: TfrxMasterData
        Height = 128.000000000000000000
        Top = 464.000000000000000000
        Width = 1039.370750000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 0
        object Memo56: TfrxMemoView
          Top = 24.000000000000000000
          Width = 839.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8217#1057#8249#1056#1169#1056#176#1056#1029#1056#1109' '#1056#1111#1057#1026#1056#1109#1056#1169#1057#1107#1056#1108#1057#8224#1056#1105#1056#1105': [FORMATFLOAT('#39'0.00 '#1057#1026#39', [Vidano' +
              'Summ])]')
          ParentFont = False
          WordWrap = False
        end
        object Memo57: TfrxMemoView
          Top = 44.000000000000000000
          Width = 839.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#181#1056#1029#1056#1109' '#1056#1111#1057#1026#1056#1109#1056#1169#1057#1107#1056#1108#1057#8224#1056#1105#1056#1105': [FORMATFLOAT('#39'0.00 '#1057#1026#39', [Vi' +
              'danoSumm+Nacenka_summ-Ucenka_summ])]')
          ParentFont = False
          WordWrap = False
        end
        object Memo58: TfrxMemoView
          Top = 84.000000000000000000
          Width = 839.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1116#1056#176#1057#8224#1056#181#1056#1029#1056#1108#1056#176': [FORMATFLOAT('#39'0.00 '#1057#1026#39', [Nacenka_summ])]')
          ParentFont = False
          WordWrap = False
        end
        object Memo59: TfrxMemoView
          Top = 104.000000000000000000
          Width = 839.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1032#1057#8224#1056#181#1056#1029#1056#1108#1056#176': [FORMATFLOAT('#39'0.00 '#1057#1026#39', [Ucenka_summ])]')
          ParentFont = False
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Top = 64.000000000000000000
          Width = 839.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1057#1027#1056#181#1057#1026#1056#1105#1056#8470': [DocsCount]')
          ParentFont = False
          WordWrap = False
        end
      end
      object Band6: TfrxFooter
        Height = 22.000000000000000000
        Top = 396.000000000000000000
        Width = 1039.370750000000000000
        object Memo35: TfrxMemoView
          Width = 969.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 884.000000000000000000
          Width = 85.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[IngrSumm]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 20.000000000000000000
        Top = 276.000000000000000000
        Visible = False
        Width = 1039.370750000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = '[odsProducedMedics."FK_ID_MASTER"]'
        object Memo36: TfrxMemoView
          Width = 969.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 884.000000000000000000
          Width = 85.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[IngrSumm]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line11: TfrxLineView
          Left = 969.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
      end
      object ColumnHeader2: TfrxColumnHeader
        Height = 60.000000000000000000
        Top = 192.000000000000000000
        Width = 1039.370750000000000000
        object Memo54: TfrxMemoView
          Top = 18.000000000000000000
          Width = 969.000000000000000000
          Height = 24.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#8249#1056#1169#1056#176#1056#1029#1056#1109' '#1056#1030' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1057#1107)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 228.000000000000000000
          Top = 42.000000000000000000
          Width = 458.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 101.000000000000000000
          Top = 42.000000000000000000
          Width = 127.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#181#1057#1026#1056#1105#1057#1039)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 686.000000000000000000
          Top = 42.000000000000000000
          Width = 75.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'.'#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 761.000000000000000000
          Top = 42.000000000000000000
          Width = 50.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 811.000000000000000000
          Top = 42.000000000000000000
          Width = 73.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 884.000000000000000000
          Top = 42.000000000000000000
          Width = 85.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Top = 42.000000000000000000
          Width = 30.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 30.000000000000000000
          Top = 42.000000000000000000
          Width = 71.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object ods: TOracleDataSet
    SQL.Strings = (
      'select (to_char(sysdate,'#39'mm'#39')) m from dual')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {0400000001000000010000004D010000000000}
    Session = os
    Left = 288
    Top = 106
    object odsM: TStringField
      FieldName = 'M'
      Size = 2
    end
  end
  object odsGroupMo: TOracleDataSet
    SQL.Strings = (
      'SELECT * from'
      '(SELECT groupid, fc_group, fl_del, 0 as FN_ORDER'
      
        'FROM med.tmo_group WHERE (fl_del = 0) and (UPPER(fc_group) like ' +
        #39'%'#1040#1055#1058#1045#1050#1040'%'#39')'
      'UNION'
      'SELECT groupid, fc_group, fl_del, 1 as FN_ORDER'
      
        'FROM med.tmo_group WHERE fl_del = 0 and (not (UPPER(fc_group) li' +
        'ke '#39'%'#1040#1055#1058#1045#1050#1040'%'#39'))'
      ')'
      'ORDER BY FN_ORDER, UPPER(fc_group)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000040000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C0100000000000800000046
      4E5F4F52444552010000000000}
    Session = os
    AfterOpen = odsGroupMoAfterOpen
    Left = 26
    Top = 335
    object odsGroupMoGROUPID: TFloatField
      FieldName = 'GROUPID'
      Required = True
    end
    object odsGroupMoFC_GROUP: TStringField
      FieldName = 'FC_GROUP'
      Size = 100
    end
    object odsGroupMoFL_DEL: TFloatField
      FieldName = 'FL_DEL'
    end
  end
  object dsGroupMo: TDataSource
    DataSet = odsGroupMo
    Left = 108
    Top = 333
  end
  object odsProducedMedics: TOracleDataSet
    SQL.Strings = (
      'SELECt * FROM'
      '('
      'SELECT '
      '    ROWNUM,'
      '    FK_ID AS FK_ID_MASTER,'
      '    FD_DATA,'
      '    FK_MEDICID,'
      '    FC_NAME,'
      '    FC_SERIAL,'
      '    FN_NUMBER,'
      '    FC_UEDIZM, '
      '    FN_AMOUNT,'
      '    FN_PRICE_FOR_1,'
      '    FN_SUMMA_TRUNCED,'
      '    FN_SUMMA,'
      '    FN_SUMMA_FOR_INGRIDIENTS,'
      '    CASE WHEN FN_SUMMA_TRUNCED<=FN_SUMMA'
      '     THEN FN_SUMMA-FN_SUMMA_TRUNCED'
      '     ELSE 0 end FN_UCHENKA,'
      '    CASE WHEN FN_SUMMA_TRUNCED>FN_SUMMA'
      '     THEN FN_SUMMA_TRUNCED-FN_SUMMA'
      '     ELSE 0 end FN_NACHENKA,'
      
        '    FN_AMOUNT AS FN_AMOUNT_POLUCHENO -- '#1055#1054#1051#1059#1063#1045#1053#1054#1045' '#1050#1054#1051'-'#1042#1054', '#1053#1054' '#1058#1040#1050 +
        ' '#1050#1040#1050' '#1059' '#1053#1040#1057' '#1053#1045' '#1052#1054#1046#1045#1058' '#1041#1067#1058#1068' '#1076#1077#1083#1092#1080' '#1085#1077' '#1076#1072#1089#1090' '#1089#1086#1079#1076#1072#1090#1100' '#1073#1086#1083#1100#1096#1077' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1084 +
        #1086#1075#1086' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072', '#1095#1077#1084' '#1077#1089#1090#1100' '#1076#1083#1103' '#1085#1077#1075#1086' '#1080#1085#1075#1088#1080#1076#1080#1077#1085#1090#1086#1074', '#1090#1086' '#1082#1086#1083'-'#1074#1086' '#1080' '#1087#1086#1083 +
        #1091#1095#1077#1085#1086' '#1088#1072#1074#1085#1086'.'
      'FROM'
      '('
      'SELECT'
      '    ROWNUM,'
      '    FK_ID,'
      '    FD_DATA,'
      '    FK_MEDICID,'
      '    FC_NAME,'
      '    FC_SERIAL,'
      '    FC_UEDIZM, '
      '    FN_AMOUNT,'
      '    FN_NUMBER,'
      ''
      '    DETAIL2.FN_SUMMA_FOR_INGRIDIENTS,'
      
        '    Round(DETAIL2.FN_SUMMA_FOR_INGRIDIENTS/FN_AMOUNT,2) AS FN_PR' +
        'ICE_FOR_1,'
      
        '    Round(DETAIL2.FN_SUMMA_FOR_INGRIDIENTS/FN_AMOUNT,2)*FN_AMOUN' +
        'T AS FN_SUMMA_TRUNCED, -- '#1054#1050#1056#1059#1043#1051#1045#1053#1053#1040#1071
      '    FN_SUMMA_FOR_INGRIDIENTS AS FN_SUMMA'
      '  FROM'
      '   ('
      'SELECT'
      '    ROWNUM,'
      '    KS.FK_ID,'
      '    KS.FD_DATA,'
      '    KS.FK_MEDICID,'
      '    M.FC_NAME,'
      '    KS.FC_SERIAL,'
      '    TEI.FC_NAME AS FC_UEDIZM, '
      '    KS.FN_AMOUNT,'
      '    KS.FN_NUMBER'
      '        '
      '  FROM MED.TKARTCOMPOS KS, MED.TMEDIC M, MED.TEI'
      '  WHERE KS.FK_MEDICID=M.MEDICID (+)'
      '    AND M.EIID = TEI.EIID (+)'
      '    AND KS.fl_edit = 0'
      
        '    AND TRUNC(KS.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2' +
        ')'
      '   :FK_PRODUCE_TYPE'
      '  ORDER BY ROWNUM'
      '   )MASTER2,'
      '   ('
      'SELECT  '
      '    FK_TKARTCOMPOSID,'
      '    SUM(FN_SUMMA) AS FN_SUMMA_FOR_INGRIDIENTS '
      '  FROM  '
      '   ('
      '    SELECT '
      '       K_ITEM.FK_TKARTCOMPOSID,'
      '       K_ITEM.FK_KART_ITEM,'
      '       K_ITEM.FN_AMOUNT,'
      '       k.KARTID,'
      '       TMEDIC.FN_FPACKINUPACK,'
      '        k.FN_PRICE,'
      '        k.FN_PRICE * k_item.FN_AMOUNT AS FN_SUMMA    '
      ''
      
        '     FROM MED.TKARTCO_ITEM K_ITEM, MED.TKARTCOMPOS KS,  MED.TKAR' +
        'T k, MED.TMEDIC'
      '     WHERE KS.FK_ID=K_ITEM.FK_TKARTCOMPOSID(+)'
      '       AND k.MEDICID = TMEDIC.MEDICID'
      '       AND K_ITEM.FK_KART_ITEM = k.KARTID'
      
        '       AND TRUNC(KS.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC(:DA' +
        'TE2)'
      '       :FK_PRODUCE_TYPE'
      '   ) DETAIL1'
      'GROUP BY FK_TKARTCOMPOSID  '
      '    '
      '      '
      '   ) DETAIL2'
      '  WHERE DETAIL2.FK_TKARTCOMPOSID = MASTER2.FK_ID '
      ') '
      ') ProducedMedic,'
      ''
      '('
      'SELECT'
      '        ROWNUM as ROWNUM_2,'
      '        M.MEDICID FK_MEDICID_2,'
      '        K_ITEM.FK_ID AS FK_ID_2,'
      '        K_ITEM.FK_TKARTCOMPOSID as FK_TKARTCOMPOSID_2,'
      '        K_ITEM.FK_KART_ITEM as FK_KART_ITEM_2,'
      
        '        M.FC_NAME ||'#39' ('#1087'. '#39'||K.FN_PARTY_NUM||'#39')'#39'  AS TKART_NAME_' +
        '2 ,'
      '        K.FC_SERIAL as FC_SERIAL_2,'
      '        TEI.FC_NAME AS FC_UEDIZM_2,'
      '        K_ITEM.FN_AMOUNT as FN_AMOUNT_2,'
      '        K.FN_PRICE as FN_PRICE_2,'
      '        K.FN_PRICE * K_ITEM.FN_AMOUNT  AS FN_SUMMA_2'
      '      FROM'
      
        '        MED.TMEDIC M, MED.TEI, MED.TKART K, MED.TKARTCO_ITEM K_I' +
        'TEM'
      '      WHERE /*K_ITEM.FK_TKARTCOMPOSID = :FK_ID_MASTER'
      '        AND*/ K_ITEM.FK_KART_ITEM = K.KARTID'
      '        AND K.MEDICID = M.MEDICID'
      '        AND M.EIID = TEI.EIID (+)'
      '--        AND M.FL_VISIBLE = 1'
      '    ORDER BY ROWNUM, M.FC_NAME, TEI.FC_NAME   '
      ') IngridientsForProduce'
      ''
      
        'WHERE ProducedMedic.FK_ID_MASTER = IngridientsForProduce.FK_TKAR' +
        'TCOMPOSID_2'
      
        'ORDER BY ProducedMedic.FN_NUMBER, ProducedMedic.FK_ID_MASTER --P' +
        'roducedMedic.FD_DATA DESC, LOWER(ProducedMedic.FC_NAME), Produce' +
        'dMedic.FK_ID_MASTER')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445310C00000000000000000000000600
      00003A44415445320C0000000000000000000000100000003A464B5F50524F44
      5543455F54595045010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001A0000000700000046445F444154410100000000000900000046435F
      554544495A4D0100000000000A000000464B5F4D454449434944010000000000
      0700000046435F4E414D4501000000000009000000464E5F414D4F554E540100
      0000000006000000524F574E554D0100000000000E000000464E5F5052494345
      5F464F525F3101000000000008000000464E5F53554D4D410100000000000B00
      0000464E5F4E414348454E4B410100000000000A000000464E5F554348454E4B
      4101000000000013000000464E5F414D4F554E545F504F4C554348454E4F0100
      0000000018000000464E5F53554D4D415F464F525F494E4752494449454E5453
      0100000000000900000046435F53455249414C0100000000000C000000464B5F
      49445F4D415354455201000000000010000000464E5F53554D4D415F5452554E
      43454401000000000008000000524F574E554D5F320100000000000700000046
      4B5F49445F3201000000000012000000464B5F544B415254434F4D504F534944
      5F320100000000000E000000464B5F4B4152545F4954454D5F32010000000000
      0C000000544B4152545F4E414D455F320100000000000B00000046435F534552
      49414C5F320100000000000B00000046435F554544495A4D5F32010000000000
      0B000000464E5F414D4F554E545F320100000000000A000000464E5F50524943
      455F320100000000000A000000464E5F53554D4D415F32010000000000090000
      00464E5F4E554D424552010000000000}
    Session = os
    Left = 130
    Top = 112
  end
  object frDBProducedMedics: TfrxDBDataset
    UserName = 'odsProducedMedics'
    CloseDataSource = False
    DataSet = odsProducedMedics
    BCDToCurrency = False
    Left = 128
    Top = 166
  end
  object odsChild: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '        ROWNUM,'
      '        K_ITEM.FK_ID,'
      '        K_ITEM.FK_TKARTCOMPOSID,'
      '        K_ITEM.FK_KART_ITEM,'
      '        M.FC_NAME AS TKART_NAME,'
      '        K.FC_SERIAL,'
      '        TEI.FC_NAME AS FC_UEDIZM,'
      '        K_ITEM.FN_AMOUNT'
      '      FROM'
      
        '        MED.TMEDIC M, MED.TEI, MED.TKART K, MED.TKARTCO_ITEM K_I' +
        'TEM'
      '      WHERE K_ITEM.FK_TKARTCOMPOSID = :FK_ID_MASTER'
      '        AND K_ITEM.FK_KART_ITEM = K.KARTID'
      '        AND K.MEDICID = M.MEDICID'
      '        AND M.EIID = TEI.EIID (+)'
      '--        AND M.FL_VISIBLE = 1'
      '    ORDER BY ROWNUM, M.FC_NAME, TEI.FC_NAME')
    Optimize = False
    Variables.Data = {
      03000000010000000D0000003A464B5F49445F4D415354455203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A00000005000000464B5F494401000000000010000000464B5F544B
      415254434F4D504F5349440100000000000C000000464B5F4B4152545F495445
      4D0100000000000A000000544B4152545F4E414D450100000000000900000046
      435F53455249414C01000000000009000000464E5F414D4F554E540100000000
      0006000000524F574E554D01000000000008000000464E5F5052494345010000
      00000008000000464E5F53554D4D410100000000000900000046435F55454449
      5A4D010000000000}
    Master = odsProducedMedics
    MasterFields = 'FK_ID_MASTER'
    Session = os
    Left = 120
    Top = 58
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'odsGroupMo'
    CloseDataSource = False
    DataSet = odsGroupMo
    BCDToCurrency = False
    Left = 136
    Top = 217
  end
end
