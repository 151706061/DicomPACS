object frmGetPeriod: TfrmGetPeriod
  Left = 337
  Top = 189
  HelpContext = 43
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1042#1074#1086#1076' '#1087#1077#1088#1080#1086#1076#1072
  ClientHeight = 612
  ClientWidth = 437
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
    Width = 437
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
      Top = 182
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
    object RadioGroup1: TRadioGroup
      Left = 280
      Top = 8
      Width = 145
      Height = 73
      Caption = #1043#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086':'
      ItemIndex = 0
      Items.Strings = (
        #1059#1095#1077#1090#1085#1099#1084' '#1075#1088#1091#1087#1087#1072#1084
        #1058#1080#1087#1091' '#1091#1095#1077#1090#1085#1099#1093' '#1075#1088#1091#1087#1087)
      TabOrder = 19
      OnClick = RadioGroup1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 303
    Width = 437
    Height = 36
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 1
    TabOrder = 1
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
      Left = 262
      Top = 11
      Width = 15
      Height = 13
      Hint = #1042#1074#1086#1076' '#1082#1086#1085#1077#1095#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
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
      Left = 118
      Top = 7
      Width = 127
      Height = 21
      Hint = #1042#1074#1086#1076' '#1085#1072#1095#1072#1083#1100#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
      CheckOnExit = True
      DefaultToday = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageKind = ikEllipsis
      ButtonWidth = 16
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Weekends = [Sun, Sat]
      YearDigits = dyFour
      TabOrder = 0
    end
    object dDate2: TJvDateEdit
      Left = 290
      Top = 7
      Width = 127
      Height = 21
      Hint = #1042#1074#1086#1076' '#1082#1086#1085#1077#1095#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
      CheckOnExit = True
      DefaultToday = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageKind = ikEllipsis
      ButtonWidth = 16
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
    Width = 437
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 431
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 424
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
      OnDblClick = ToolBar1DblClick
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
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 339
    Width = 437
    Height = 36
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 3
    DesignSize = (
      437
      36)
    object Label3: TLabel
      Left = 5
      Top = 10
      Width = 208
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1100#1085#1086' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1093' '#1083#1080#1094':'
    end
    object lcbMO_GROUP: TDBLookupComboBox
      Left = 224
      Top = 7
      Width = 192
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'GROUPID'
      ListField = 'FC_GROUP'
      ListSource = dsGroupMo
      TabOrder = 0
      OnCloseUp = lcbCloseUp
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 375
    Width = 437
    Height = 68
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 4
    object lbType: TLabel
      Left = 50
      Top = 10
      Width = 103
      Height = 13
      Caption = #1058#1080#1087' '#1091#1095#1077#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099':'
      Enabled = False
    end
    object lbType2: TLabel
      Left = 59
      Top = 42
      Width = 91
      Height = 13
      Alignment = taRightJustify
      Caption = #1043#1088#1091#1087#1087#1072' '#1091#1095#1077#1090#1085#1086#1089#1090#1080':'
    end
    object lcbUchgrtype: TDBLookupComboBox
      Left = 158
      Top = 7
      Width = 259
      Height = 21
      Enabled = False
      KeyField = 'FK_ID'
      ListField = 'FC_NAME'
      ListSource = dsUchGrType
      TabOrder = 0
      OnCloseUp = lcbCloseUp
    end
    object lcbUchGr: TDBLookupComboBox
      Left = 158
      Top = 39
      Width = 259
      Height = 21
      KeyField = 'UCHGRID'
      ListField = 'FC_UCHGR'
      ListSource = dsUchGr
      TabOrder = 1
      OnCloseUp = lcbCloseUp
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 443
    Align = alTop
    Caption = ' '#1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093' '#1086' '#1089#1086#1089#1090#1072#1074#1080#1090#1077#1083#1077' '
    TabOrder = 5
    DesignSize = (
      437
      84)
    Height = 84
    Width = 437
    object lbJobTitle: TLabel
      Left = 6
      Top = 57
      Width = 61
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
    end
    object lbFam: TLabel
      Left = 9
      Top = 25
      Width = 52
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103':'
    end
    object edJobTitleCompiler: TEdit
      Left = 76
      Top = 53
      Width = 341
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object edFamCompiler: TEdit
      Left = 76
      Top = 21
      Width = 341
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 527
    Align = alTop
    Caption = ' '#1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093' '#1086' '#1087#1088#1086#1074#1077#1088#1103#1102#1097#1077#1084
    TabOrder = 6
    DesignSize = (
      437
      84)
    Height = 84
    Width = 437
    object Label4: TLabel
      Left = 6
      Top = 57
      Width = 61
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
    end
    object Label5: TLabel
      Left = 9
      Top = 25
      Width = 52
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103':'
    end
    object edJobTitleChecker: TEdit
      Left = 76
      Top = 53
      Width = 341
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object edFamChecker: TEdit
      Left = 76
      Top = 21
      Width = 341
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  object ilImages: TImageList
    Left = 288
    Top = 64
    Bitmap = {
      494C0101020004000C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 1
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
  object frDBdsRep: TfrxDBDataset
    UserName = 'odsRep'
    CloseDataSource = False
    DataSet = odsRep
    BCDToCurrency = False
    Left = 188
    Top = 88
  end
  object frPrihDoc: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38540.632613379600000000
    ReportOptions.LastChange = 41247.492081516200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frPrihDocGetValue
    OnUserFunction = frPrihDocMedUserFunction
    Left = 188
    Top = 32
    Datasets = <
      item
        DataSet = frxDBDataset2
        DataSetName = 'odsGroupMo'
      end
      item
        DataSet = frDBdsRep
        DataSetName = 'odsRep'
      end
      item
        DataSet = frDBodsRepMed
        DataSetName = 'odsRepMed'
      end
      item
        DataSet = frxDBDataset1
        DataSetName = 'odsUchGr'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 1
      ColumnWidth = 190.000000000000000000
      ColumnPositions.Strings = (
        '0')
      PrintOnPreviousPage = True
      object Memo1: TfrxMemoView
        Align = baWidth
        ShiftMode = smWhenOverlapped
        Top = 220.000000000000000000
        Width = 718.110700000000000000
        Height = 57.000000000000000000
        ShowHint = False
        StretchMode = smActualHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8 = (
          '[var_receiver]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo30: TfrxMemoView
        Align = baWidth
        ShiftMode = smWhenOverlapped
        Top = 421.000000000000000000
        Width = 718.110700000000000000
        Height = 25.000000000000000000
        ShowHint = False
        StretchMode = smActualHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8 = (
          
            #1056#8220#1057#1026#1057#1107#1056#1111#1056#1111#1056#176' '#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109' '#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1057#8230' '#1056 +
            #187#1056#1105#1057#8224': [odsGroupMo."fc_group"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo50: TfrxMemoView
        Align = baWidth
        ShiftMode = smWhenOverlapped
        Top = 372.000000000000000000
        Width = 718.110700000000000000
        Height = 20.000000000000000000
        ShowHint = False
        StretchMode = smActualHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8 = (
          #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [Date1] '#1056#1111#1056#1109' [Date2]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo52: TfrxMemoView
        Align = baWidth
        ShiftMode = smWhenOverlapped
        Top = 304.000000000000000000
        Width = 718.110700000000000000
        Height = 20.000000000000000000
        ShowHint = False
        StretchMode = smActualHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8 = (
          
            #1056#8220#1057#1026#1057#1107#1056#1111#1056#1111#1056#1105#1057#1026#1056#1109#1056#1030#1056#1109#1057#8225#1056#1029#1056#176#1057#1039' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1057#1034' '#1056#1111#1056#1109' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056 +
            #176#1056#1112#1056#181#1056#1029#1057#8218#1056#176#1056#1112)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo8: TfrxMemoView
        Align = baWidth
        ShiftMode = smWhenOverlapped
        Top = 336.000000000000000000
        Width = 718.110700000000000000
        Height = 20.000000000000000000
        ShowHint = False
        StretchMode = smActualHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8 = (
          #1056#1118#1056#1105#1056#1111' '#1057#1107#1057#8225#1056#181#1057#8218#1056#1029#1056#1109#1056#8470' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111#1057#8249': [odsUchGrType."FC_NAME"]')
        ParentFont = False
        VAlign = vaCenter
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 1
      ColumnWidth = 190.000000000000000000
      ColumnPositions.Strings = (
        '0')
      object MasterData1: TfrxMasterData
        Height = 17.000000000000000000
        Top = 266.000000000000000000
        Width = 718.110700000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        DataSet = frDBdsRep
        DataSetName = 'odsRep'
        RowCount = 0
        Stretched = True
        object Memo12: TfrxMemoView
          Left = 30.000000000000000000
          Width = 129.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          Memo.UTF8 = (
            '[odsRep."FC_LONGNAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 193.000000000000000000
          Width = 120.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRep."FN_KOLOSTBEGIN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Width = 30.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[LINE#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 313.000000000000000000
          Width = 120.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRep."FN_KOLPRIH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 433.000000000000000000
          Width = 41.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRep."FN_KOLRASH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 474.000000000000000000
          Width = 79.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haRight
          Memo.UTF8 = (
            '[FORMATFLOAT('#39'###0.00'#39',<odsRep."FN_SUMRASH">)]')
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 553.000000000000000000
          Width = 132.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRep."FN_KOLOSTEND"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 159.000000000000000000
          Width = 34.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRep."FC_EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.000000000000000000
        Top = 992.000000000000000000
        Width = 718.110700000000000000
        object Memo25: TfrxMemoView
          Left = 609.000000000000000000
          Top = 2.000000000000000000
          Width = 75.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [PAGE#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterFooter1: TfrxFooter
        Height = 18.000000000000000000
        Top = 317.000000000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Width = 474.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 474.000000000000000000
          Width = 211.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          Memo.UTF8 = (
            '[FORMATFLOAT('#39'###0.00'#39',sum(<odsRep."FN_SUMRASH">))]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 250.000000000000000000
        Top = 392.000000000000000000
        Width = 718.110700000000000000
        object Memo17: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 413.000000000000000000
          Top = 17.000000000000000000
          Width = 96.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1038#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1056#187':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 413.000000000000000000
          Top = 41.000000000000000000
          Width = 271.000000000000000000
          Height = 68.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034': [JobTitleCompiler]'
            #1056#164#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039': [FamCompiler]')
        end
        object Memo29: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 413.000000000000000000
          Top = 109.000000000000000000
          Width = 96.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1105#1056#187':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 413.000000000000000000
          Top = 129.000000000000000000
          Width = 271.000000000000000000
          Height = 73.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034': [JobTitleChecker]'
            #1056#164#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039': [FamChecker]')
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 413.000000000000000000
          Top = 203.000000000000000000
          Width = 271.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          AutoWidth = True
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#187#1056#1109#1056#182#1056#181#1056#1029#1056#1105#1056#181' '#1056#1029#1056#176' [PAGE#] '#1056#187#1056#1105#1057#1027#1057#8218#1056#176#1057#8230)
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 413.000000000000000000
          Top = 224.000000000000000000
          Width = 271.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Memo.UTF8 = (
            #1056#1038#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1109': [DATE]')
          VAlign = vaCenter
        end
      end
      object MasterHeader1: TfrxHeader
        Height = 72.000000000000000000
        Top = 156.000000000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        object Memo45: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 30.000000000000000000
          Top = 22.000000000000000000
          Width = 129.000000000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181', '#1056#1169#1056#1109#1056#183#1056#1105#1057#1026#1056#1109#1056#1030#1056#1108#1056#176', '#1057#8222'/'#1056#1030', '#1057#8224#1056#181#1056#1029#1056#176' '#1057#1026 +
              '.,  ('#1074#8222#8211' '#1056#1111#1056#176#1057#1026#1057#8218#1056#1105#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 193.000000000000000000
          Top = 22.000000000000000000
          Width = 120.000000000000000000
          Height = 33.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' '#1056#1029#1056#176' '#1056#1029#1056#176#1057#8225#1056#176#1056#187#1056#1109' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169#1056#176' [Date1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 313.000000000000000000
          Top = 22.000000000000000000
          Width = 120.000000000000000000
          Height = 33.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 433.000000000000000000
          Top = 22.000000000000000000
          Width = 120.000000000000000000
          Height = 33.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8230#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 22.000000000000000000
          Width = 30.000000000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 553.000000000000000000
          Top = 22.000000000000000000
          Width = 132.000000000000000000
          Height = 33.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' '#1056#1029#1056#176' '#1056#1108#1056#1109#1056#1029#1056#181#1057#8224' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169#1056#176' [Date2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 313.000000000000000000
          Top = 55.000000000000000000
          Width = 120.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 553.000000000000000000
          Top = 55.000000000000000000
          Width = 132.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 193.000000000000000000
          Top = 55.000000000000000000
          Width = 120.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 433.000000000000000000
          Top = 55.000000000000000000
          Width = 41.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 474.000000000000000000
          Top = 55.000000000000000000
          Width = 79.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 6.000000000000000000
          Top = 1.000000000000000000
          Width = 679.000000000000000000
          Height = 19.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.300000011920929000
          Memo.UTF8 = (
            '[var_receiver]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 159.000000000000000000
          Top = 22.000000000000000000
          Width = 34.000000000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object os: TOracleSession
    LogonUsername = 'ASU'
    LogonPassword = 'ASU'
    LogonDatabase = 'ASU'
    Left = 289
    Top = 152
  end
  object odsRep: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      
        'B.FC_NAME||'#39', '#39'||TRIM(to_char(B.FN_PRICE,'#39'B9G999G999G990D99'#39','#39'NL' +
        'S_NUMERIC_CHARACTERS = '#39#39'. '#39#39' '#39'))||CASE WHEN B.FN_PRICE = 0 THEN' +
        ' 0 ELSE NULL END||'#39' '#1088'.'#39
      
        '||CASE WHEN B.FN_PARTY_NUM IS NULL THEN NULL ELSE '#39',('#39'||B.FN_PAR' +
        'TY_NUM||'#39')'#39' END AS FC_LONGNAME,'
      'B.*--,'
      
        '--  CASE WHEN C.FC_NAME IS NOT NULL THEN '#39#1058#1080#1087' '#1091#1095#1077#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099': '#39' ' +
        '|| C.FC_NAME'
      '--       ELSE '#39#39
      '--  END FC_GROUP'
      ''
      'FROM ('
      'SELECT'
      'A.FC_NAME,'
      'A.FN_PARTY_NUM, '
      'SUM(A.FN_KOLOSTBEGIN) AS FN_KOLOSTBEGIN, '
      'SUM(A.FN_SUMOSTBEGIN) AS FN_SUMOSTBEGIN,'
      'SUM(A.FN_KOLPRIH) AS FN_KOLPRIH,'
      'SUM(A.FN_SUMPRIH) AS FN_SUMPRIH,'
      'SUM(A.FN_KOLRASH) AS FN_KOLRASH,'
      'SUM(A.FN_SUMRASH) AS FN_SUMRASH,'
      
        'SUM(A.FN_KOLOSTBEGIN) + SUM(A.FN_KOLPRIH) - SUM(A.FN_KOLRASH) AS' +
        ' FN_KOLOSTEND,'
      
        'SUM(A.FN_SUMOSTBEGIN) + SUM(A.FN_SUMPRIH) - SUM(A.FN_SUMRASH) AS' +
        ' FN_SUMOSTEND,'
      
        '--DECODE(SUM(A.FN_KOLOSTBEGIN) + SUM(A.FN_KOLPRIH) - SUM(A.FN_KO' +
        'LRASH),0,0,(SUM(A.FN_SUMOSTBEGIN) + SUM(A.FN_SUMPRIH) - SUM(A.FN' +
        '_SUMRASH))/(SUM(A.FN_KOLOSTBEGIN) + SUM(A.FN_KOLPRIH) - SUM(A.FN' +
        '_KOLRASH))) AS FN_PRICE,'
      'A.FN_PRICE,'
      'A.FC_EDIZM, '
      '--A.FK_PAYTYPE,'
      '--A.FC_PAYTYPE,'
      
        '--MED.PKGMEDKART.GET_KARTSERIALLST(A.MEDICID,:DATE2,:MOID) AS FC' +
        '_SERIAL'
      #39#39' as FC_SERIAL'
      'FROM ('
      'SELECT '
      'K.KARTID,'
      'K.FN_PARTY_NUM,'
      'K.FN_PRICE,'
      '--K.MEDICID,'
      'M.FC_NAME,'
      
        'CASE WHEN TRUNC(D.FD_DATA) < TRUNC(:DATE1) THEN C.FN_KOL*D.mnoj ' +
        'ELSE 0 END AS FN_KOLOSTBEGIN,'
      
        'CASE WHEN TRUNC(D.FD_DATA) < TRUNC(:DATE1) THEN C.FN_KOL*K.FN_PR' +
        'ICE*D.Mnoj ELSE 0 END AS FN_SUMOSTBEGIN,'
      ''
      
        'CASE WHEN D.mnoj>0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AN' +
        'D TRUNC(:DATE2) THEN C.FN_KOL ELSE 0 END AS FN_KOLPRIH,'
      
        'CASE WHEN D.mnoj>0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AN' +
        'D TRUNC(:DATE2) THEN C.FN_KOL*K.FN_PRICE ELSE 0 END AS FN_SUMPRI' +
        'H,'
      
        'CASE WHEN D.mnoj<0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AN' +
        'D TRUNC(:DATE2) THEN C.FN_KOL ELSE 0 END AS FN_KOLRASH,  '
      
        'CASE WHEN D.mnoj<0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AN' +
        'D TRUNC(:DATE2) THEN C.FN_KOL*K.FN_PRICE ELSE 0 END AS FN_SUMRAS' +
        'H,'
      ''
      'E.FC_NAME AS FC_EDIZM,'
      '--P.FK_ID AS FK_PAYTYPE, P.FC_NAME AS FC_PAYTYPE,'
      'MT.FK_ID AS FK_MEDICTYPENAME,MT.FC_NAME AS FC_MEDICTYPENAME'
      'FROM (SELECT TDOCS.*, '
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUP_ID )' +
        ' as mnoj             '
      '      FROM MED.TDOCS '
      
        '      WHERE TDOCS.FD_DATA BETWEEN TO_DATE('#39'01.01.2000'#39', '#39'DD.MM.Y' +
        'YYY'#39') AND TRUNC(:DATE2)'
      '        AND TDOCS.FL_EDIT = 0'
      
        '        AND :MOGROUP_ID in (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGR' +
        'OUPID_FROM) '
      '      ) D,'
      ''
      
        'MED.TDPC C, MED.TKART K, MED.TMEDIC M, MED.TEI E, MED.TMEDICTYPE' +
        ' MT--,  MED.TPAYTYPE P'
      'WHERE D.DPID = C.DPID'
      '  AND C.KARTID = K.KARTID'
      '  AND K.MEDICID = M.MEDICID'
      '  AND M.EIID = E.EIID(+)'
      '  AND M.FK_TYPE = MT.FK_ID'
      '--  AND M.FK_PAYTYPE = P.FK_ID'
      '  AND K.FL_DEL = 0'
      '  AND MT.FK_TUCHGRTYPE = NVL(:FK_TUCHGRTYPE,MT.FK_TUCHGRTYPE)'
      '  AND M.FL_VISIBLE = 1'
      '  ) A'
      
        'GROUP BY KARTID,FN_PARTY_NUM, FC_NAME, FN_PRICE, FC_EDIZM,FK_MED' +
        'ICTYPENAME,FC_MEDICTYPENAME/*,FK_PAYTYPE,FC_PAYTYPE*/) B,'
      
        '(SELECT T.FC_NAME FROM MED.Tuchgrtype T WHERE T.FK_ID=NVL(:FK_TU' +
        'CHGRTYPE,-1)) C'
      
        'WHERE (B.FN_KOLPRIH > 0) OR (B.FN_KOLRASH > 0) OR (B.FN_KOLOSTBE' +
        'GIN > 0) OR (B.FN_KOLOSTEND > 0)'
      'ORDER BY LOWER(B.FC_NAME), B.FN_PARTY_NUM'
      ''
      '--ORDER BY FC_PAYTYPE, B.FC_NAME'
      ''
      ''
      ''
      '/*'
      'SELECT '
      
        'B.FC_NAME||'#39', '#39'||TRIM(to_char(B.FN_PRICE,'#39'B9G999G999G990D99'#39','#39'NL' +
        'S_NUMERIC_CHARACTERS = '#39#39'. '#39#39' '#39'))||CASE WHEN B.FN_PRICE = 0 THEN' +
        ' 0 ELSE NULL END||'#39' '#1088'.'#39
      
        '||CASE WHEN FC_SERIAL IS NULL THEN NULL ELSE '#39',('#39'||FC_SERIAL||'#39')' +
        #39' END AS FC_LONGNAME,'
      'B.*,'
      
        '  CASE WHEN C.FC_NAME IS NOT NULL THEN '#39#1058#1080#1087' '#1091#1095#1077#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099': '#39' ||' +
        ' C.FC_NAME'
      '       ELSE '#39#39
      '  END FC_GROUP'
      ''
      'FROM ('
      'SELECT'
      'A.FC_NAME, '
      'SUM(A.FN_KOLOSTBEGIN) AS FN_KOLOSTBEGIN, '
      'SUM(A.FN_SUMOSTBEGIN) AS FN_SUMOSTBEGIN,'
      'SUM(A.FN_KOLPRIH) AS FN_KOLPRIH,'
      'SUM(A.FN_SUMPRIH) AS FN_SUMPRIH,'
      'SUM(A.FN_KOLRASH) AS FN_KOLRASH,'
      'SUM(A.FN_SUMRASH) AS FN_SUMRASH,'
      
        'SUM(A.FN_KOLOSTBEGIN) + SUM(A.FN_KOLPRIH) - SUM(A.FN_KOLRASH) AS' +
        ' FN_KOLOSTEND,'
      
        'SUM(A.FN_SUMOSTBEGIN) + SUM(A.FN_SUMPRIH) - SUM(A.FN_SUMRASH) AS' +
        ' FN_SUMOSTEND,'
      
        'DECODE(SUM(A.FN_KOLOSTBEGIN) + SUM(A.FN_KOLPRIH) - SUM(A.FN_KOLR' +
        'ASH),0,0,(SUM(A.FN_SUMOSTBEGIN) + SUM(A.FN_SUMPRIH) - SUM(A.FN_S' +
        'UMRASH))/(SUM(A.FN_KOLOSTBEGIN) + SUM(A.FN_KOLPRIH) - SUM(A.FN_K' +
        'OLRASH))) AS FN_PRICE,'
      'A.FC_EDIZM, '
      'A.FK_PAYTYPE,'
      'A.FC_PAYTYPE,'
      
        'PKGMEDKART.GET_KARTSERIALLST(A.MEDICID,:DATE2,:MOID) AS FC_SERIA' +
        'L'
      'FROM ('
      'SELECT '
      'K.MEDICID,'
      'K.FC_NAME,'
      
        'CASE WHEN MOTOID = :MOID AND FP_VID IN (1,3) AND FP_VIDMOVE IN (' +
        '1,5,6,7) AND FD_DATA BETWEEN TO_DATE('#39'01.01.2000'#39', '#39'DD.MM.YYYY'#39')' +
        ' AND TRUNC(:DATE1) - 1/(24*60*60) THEN C.FN_KOL '
      
        '     WHEN MOFROMID = :MOID AND FP_VID = 3 AND FP_VIDMOVE IN (4,5' +
        ',6,7)AND FD_DATA BETWEEN TO_DATE('#39'01.01.2000'#39', '#39'DD.MM.YYYY'#39') AND' +
        ' TRUNC(:DATE1) - 1/(24*60*60) THEN -C.FN_KOL ELSE 0 END AS FN_KO' +
        'LOSTBEGIN,'
      
        'CASE WHEN MOTOID = :MOID AND FP_VID IN (1,3) AND FP_VIDMOVE IN (' +
        '1,5,6,7) AND FD_DATA BETWEEN TO_DATE('#39'01.01.2000'#39', '#39'DD.MM.YYYY'#39')' +
        ' AND TRUNC(:DATE1) - 1/(24*60*60) THEN C.FN_SUMM'
      
        '     WHEN MOFROMID = :MOID AND FP_VID = 3 AND FP_VIDMOVE IN (4,5' +
        ',6,7) AND FD_DATA BETWEEN TO_DATE('#39'01.01.2000'#39', '#39'DD.MM.YYYY'#39') AN' +
        'D TRUNC(:DATE1) - 1/(24*60*60) THEN -C.FN_SUMM ELSE 0 END AS FN_' +
        'SUMOSTBEGIN,'
      
        'CASE WHEN MOTOID = :MOID AND FP_VID IN (1,3) AND FP_VIDMOVE IN (' +
        '1,5,6,7) AND FD_DATA BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) + 1' +
        ' - 1/(24*60*60) THEN C.FN_KOL ELSE 0 END AS FN_KOLPRIH,'
      
        'CASE WHEN MOTOID = :MOID AND FP_VID IN (1,3) AND FP_VIDMOVE IN (' +
        '1,5,6,7) AND FD_DATA BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) + 1' +
        ' - 1/(24*60*60) THEN C.FN_SUMM ELSE 0 END AS FN_SUMPRIH,'
      
        'CASE WHEN MOFROMID = :MOID AND FP_VID = 3 AND FP_VIDMOVE IN (4,5' +
        ',6,7) AND FD_DATA BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) + 1 - ' +
        '1/(24*60*60) THEN C.FN_KOL ELSE 0 END AS FN_KOLRASH,  '
      
        'CASE WHEN MOFROMID = :MOID AND FP_VID = 3 AND FP_VIDMOVE IN (4,5' +
        ',6,7) AND FD_DATA BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) + 1 - ' +
        '1/(24*60*60) THEN C.FN_SUMM ELSE 0 END AS FN_SUMRASH,'
      'E.FC_NAME AS FC_EDIZM,'
      'P.FK_ID AS FK_PAYTYPE, P.FC_NAME AS FC_PAYTYPE,'
      'MT.FK_ID AS FK_MEDICTYPENAME,MT.FC_NAME AS FC_MEDICTYPENAME'
      
        'FROM TDOCS D, TDPC C, TKART K, TMEDIC M, TEI E,  TPAYTYPE P, TME' +
        'DICTYPE MT'
      'WHERE D.DPID = C.DPID'
      '  AND C.KARTID = K.KARTID'
      '  AND K.MEDICID = M.MEDICID'
      '  AND M.EIID = E.EIID'
      '  AND M.FK_TYPE = MT.FK_ID'
      '  AND M.FK_PAYTYPE = P.FK_ID'
      
        '  AND D.FD_DATA BETWEEN TO_DATE('#39'01.01.2000'#39', '#39'DD.MM.YYYY'#39') AND ' +
        'TRUNC(:DATE2) + 1 - 1/(24*60*60)'
      '  AND K.FL_DEL = 0'
      '  AND D.FL_EDIT = 0'
      '  AND MT.FK_TUCHGRTYPE = NVL(:FK_TUCHGRTYPE,MT.FK_TUCHGRTYPE)'
      
        '  AND (CASE WHEN FP_VID = 3 AND FP_VIDMOVE IN (4,5,6,7) THEN MOF' +
        'ROMID END = :MOID   -- '#1048#1044#1045#1058' '#1042' '#1052#1048#1053#1059#1057' ('#1056#1040#1057#1061#1054#1044')'
      
        '  OR CASE WHEN FP_VID IN (1,3) AND FP_VIDMOVE IN (1,5,6,7) THEN ' +
        'MOTOID END = :MOID) -- '#1048#1044#1045#1058' '#1042' '#1055#1051#1070#1057' ('#1055#1056#1048#1061#1054#1044')'
      '  AND M.FL_VISIBLE = 1'
      '  ) A'
      
        'GROUP BY MEDICID,FC_NAME,FC_EDIZM,FK_MEDICTYPENAME,FC_MEDICTYPEN' +
        'AME,FK_PAYTYPE,FC_PAYTYPE) B,'
      
        '(SELECT T.FC_NAME FROM Tuchgrtype T WHERE T.FK_ID=NVL(:FK_TUCHGR' +
        'TYPE,-1)) C'
      
        'WHERE (B.FN_KOLPRIH > 0) OR (B.FN_KOLRASH > 0) OR (B.FN_KOLOSTBE' +
        'GIN > 0) OR (B.FN_KOLOSTEND > 0)'
      'ORDER BY FC_PAYTYPE, B.FC_NAME'
      ''
      '*/')
    Optimize = False
    Variables.Data = {
      0300000004000000060000003A44415445320C00000000000000000000000600
      00003A44415445310C00000000000000000000000E0000003A464B5F54554348
      4752545950450300000000000000000000000B0000003A4D4F47524F55505F49
      44050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000700000046435F4E414D450100000000000E000000464E5F
      4B4F4C4F5354424547494E0100000000000E000000464E5F53554D4F53544245
      47494E0100000000000A000000464E5F4B4F4C505249480100000000000A0000
      00464E5F53554D505249480100000000000A000000464E5F4B4F4C5241534801
      00000000000A000000464E5F53554D524153480100000000000C000000464E5F
      4B4F4C4F5354454E440100000000000C000000464E5F53554D4F5354454E4401
      00000000000800000046435F4544495A4D0100000000000B00000046435F4C4F
      4E474E414D4501000000000008000000464E5F50524943450100000000000900
      000046435F53455249414C0100000000000C000000464E5F50415254595F4E55
      4D010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 190
    Top = 126
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
    Left = 112
    Top = 226
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
  object odsUchGrType: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM MED.Tuchgrtype')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Session = os
    AfterOpen = odsUchGrTypeAfterOpen
    Left = 319
    Top = 377
  end
  object dsUchGrType: TDataSource
    DataSet = odsUchGrType
    Left = 244
    Top = 377
  end
  object oq: TOracleQuery
    SQL.Strings = (
      'SELECT FC_NAME FROM TPAYTYPE'
      'ORDER BY FC_NAME')
    Session = os
    Optimize = False
    Left = 288
    Top = 226
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
    Left = 245
    Top = 250
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
    Left = 178
    Top = 246
  end
  object odsUchGr: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      '  FROM MED.TUCHGR'
      ' where parentid = 0'
      '  ORDER BY UPPER(FC_UCHGR)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000060000000800000046435F5543484752010000000000070000005543
      484752494401000000000006000000464C5F4D41540100000000000800000046
      4B5F504841524D0100000000000B000000464B5F534B4C41445F494401000000
      00000F00000046435F51554F54415F434F44455F32010000000000}
    Session = os
    AfterOpen = odsUchGrAfterOpen
    Left = 82
    Top = 403
  end
  object dsUchGr: TDataSource
    DataSet = odsUchGr
    Left = 20
    Top = 403
  end
  object odsRepMed: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      
        'B.FC_NAME||'#39', '#39'||TRIM(to_char(B.FN_PRICE,'#39'B9G999G999G990D99'#39','#39'NL' +
        'S_NUMERIC_CHARACTERS = '#39#39'. '#39#39' '#39'))||CASE WHEN B.FN_PRICE = 0 THEN' +
        ' 0 ELSE NULL END||'#39' '#1088'.'#39
      
        '||CASE WHEN B.FN_PARTY_NUM IS NULL THEN NULL ELSE '#39',('#39'||B.FN_PAR' +
        'TY_NUM||'#39')'#39' END AS FC_LONGNAME,'
      'B.*/*,'
      
        '  CASE WHEN C.FC_NAME IS NOT NULL THEN '#39#1058#1080#1087' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074': '#39' || C' +
        '.FC_NAME'
      '       ELSE '#39#39
      '  END FC_GROUP*/'
      ''
      'FROM ('
      'SELECT'
      'A.FC_NAME, '
      'A.FN_PARTY_NUM,'
      'SUM(A.FN_KOLOSTBEGIN) AS FN_KOLOSTBEGIN, '
      'SUM(A.FN_SUMOSTBEGIN) AS FN_SUMOSTBEGIN,'
      'SUM(A.FN_KOLPRIH) AS FN_KOLPRIH,'
      'SUM(A.FN_SUMPRIH) AS FN_SUMPRIH,'
      'SUM(A.FN_KOLRASH) AS FN_KOLRASH,'
      'SUM(A.FN_SUMRASH) AS FN_SUMRASH,'
      
        'SUM(A.FN_KOLOSTBEGIN) + SUM(A.FN_KOLPRIH) - SUM(A.FN_KOLRASH) AS' +
        ' FN_KOLOSTEND,'
      
        'SUM(A.FN_SUMOSTBEGIN) + SUM(A.FN_SUMPRIH) - SUM(A.FN_SUMRASH) AS' +
        ' FN_SUMOSTEND,'
      
        '--DECODE(SUM(A.FN_KOLOSTBEGIN) + SUM(A.FN_KOLPRIH) - SUM(A.FN_KO' +
        'LRASH),0,0,(SUM(A.FN_SUMOSTBEGIN) + SUM(A.FN_SUMPRIH) - SUM(A.FN' +
        '_SUMRASH))/(SUM(A.FN_KOLOSTBEGIN) + SUM(A.FN_KOLPRIH) - SUM(A.FN' +
        '_KOLRASH))) AS FN_PRICE,'
      'A.FN_PRICE,'
      'A.FC_EDIZM, '
      '--A.FK_PAYTYPE,'
      '--A.FC_PAYTYPE,'
      '0 as FK_PAYTYPE,'
      #39#39' as FC_PAYTYPE,'
      
        '--MED.PKGMEDKART.GET_KARTSERIALLST(A.MEDICID,:DATE2,:MOID) AS FC' +
        '_SERIAL'
      #39#39' as FC_SERIAL'
      'FROM ('
      'SELECT '
      'K.KARTID,'
      'K.FN_PARTY_NUM,'
      'K.FN_PRICE,'
      '--K.MEDICID,'
      'M.FC_NAME,'
      
        'CASE WHEN TRUNC(D.FD_DATA) < TRUNC(:DATE1) THEN C.FN_KOL*D.mnoj ' +
        'ELSE 0 END AS FN_KOLOSTBEGIN,'
      
        'CASE WHEN TRUNC(D.FD_DATA) < TRUNC(:DATE1) THEN C.FN_KOL*K.FN_PR' +
        'ICE*D.Mnoj ELSE 0 END AS FN_SUMOSTBEGIN,'
      ''
      
        'CASE WHEN D.mnoj>0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AN' +
        'D TRUNC(:DATE2) THEN C.FN_KOL ELSE 0 END AS FN_KOLPRIH,'
      
        'CASE WHEN D.mnoj>0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AN' +
        'D TRUNC(:DATE2) THEN C.FN_KOL*K.FN_PRICE ELSE 0 END AS FN_SUMPRI' +
        'H,'
      
        'CASE WHEN D.mnoj<0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AN' +
        'D TRUNC(:DATE2) THEN C.FN_KOL ELSE 0 END AS FN_KOLRASH,  '
      
        'CASE WHEN D.mnoj<0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AN' +
        'D TRUNC(:DATE2) THEN C.FN_KOL*K.FN_PRICE ELSE 0 END AS FN_SUMRAS' +
        'H,'
      ''
      ''
      'E.FC_NAME AS FC_EDIZM,'
      '--P.FK_ID AS FK_PAYTYPE, P.FC_NAME AS FC_PAYTYPE,'
      '--MT.FK_ID AS FK_MEDICTYPENAME, MT.FC_NAME AS FC_MEDICTYPENAME'
      'UG.FC_UCHGR'
      ''
      'FROM (SELECT TDOCS.*, '
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUP_ID )' +
        ' as mnoj             '
      '      FROM MED.TDOCS '
      
        '      WHERE TDOCS.FD_DATA BETWEEN TO_DATE('#39'01.01.2000'#39', '#39'DD.MM.Y' +
        'YYY'#39') AND TRUNC(:DATE2) + 1 - 1/(24*60*60)'
      '        AND TDOCS.FL_EDIT = 0'
      
        '        AND :MOGROUP_ID in (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGR' +
        'OUPID_FROM) '
      '      ) D,'
      ''
      
        'MED.TDPC C, MED.TKART K, MED.TMEDIC M, MED.TEI E, MED.TUCHGR UG ' +
        '--MED.TMEDICTYPE MT--,  MED.TPAYTYPE P'
      'WHERE D.DPID = C.DPID'
      '  AND C.KARTID = K.KARTID'
      '  AND K.MEDICID = M.MEDICID'
      '  AND M.EIID = E.EIID(+)'
      '--  AND M.FK_TYPE = MT.FK_ID'
      '--  AND M.FK_PAYTYPE = P.FK_ID'
      '  AND K.FL_DEL = 0'
      '--  AND M.fk_type = :TMEDICTYPE'
      '  AND #uchgrid# = UG.UCHGRID'
      
        '  AND UG.UCHGRID in (select uchgrid from med.tuchgr connect by p' +
        'rior uchgrid = parentid start with uchgrid = :UCHGROUPID)'
      
        '--  AND MT.FK_TUCHGRTYPE = NVL(:FK_TUCHGRTYPE,MT.FK_TUCHGRTYPE)-' +
        '- OR 1=1)'
      '  AND M.FL_VISIBLE = 1'
      '  ) A'
      'GROUP BY KARTID, FN_PARTY_NUM,'
      
        'FC_NAME, FN_PRICE, FC_EDIZM/*,FK_MEDICTYPENAME,FC_MEDICTYPENAME/' +
        '*,FK_PAYTYPE,FC_PAYTYPE*/) B/*,'
      
        '(SELECT T.FC_NAME FROM MED.TMEDICTYPE T WHERE T.FK_ID=NVL(:TMEDI' +
        'CTYPE,0)) C*/'
      
        'WHERE (B.FN_KOLPRIH > 0) OR (B.FN_KOLRASH > 0) OR (B.FN_KOLOSTBE' +
        'GIN > 0) OR (B.FN_KOLOSTEND > 0)'
      'ORDER BY LOWER(B.FC_NAME), B.FN_PARTY_NUM'
      ''
      '--ORDER BY FC_PAYTYPE, B.FC_NAME')
    Optimize = False
    Variables.Data = {
      0300000004000000060000003A44415445320C00000000000000000000000600
      00003A44415445310C00000000000000000000000B0000003A4D4F47524F5550
      5F49440300000000000000000000000B0000003A55434847524F555049440300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000100000000700000046435F4E414D450100000000000E000000464E5F
      4B4F4C4F5354424547494E0100000000000E000000464E5F53554D4F53544245
      47494E0100000000000A000000464E5F4B4F4C505249480100000000000A0000
      00464E5F53554D505249480100000000000A000000464E5F4B4F4C5241534801
      00000000000A000000464E5F53554D524153480100000000000C000000464E5F
      4B4F4C4F5354454E440100000000000C000000464E5F53554D4F5354454E4401
      00000000000800000046435F4544495A4D0100000000000A000000464B5F5041
      59545950450100000000000A00000046435F504159545950450100000000000B
      00000046435F4C4F4E474E414D4501000000000008000000464E5F5052494345
      0100000000000900000046435F53455249414C0100000000000C000000464E5F
      50415254595F4E554D010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 126
    Top = 126
  end
  object frDBodsRepMed: TfrxDBDataset
    UserName = 'odsRepMed'
    CloseDataSource = False
    DataSet = odsRepMed
    BCDToCurrency = False
    Left = 124
    Top = 88
  end
  object frPrihDocMed: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38540.632613379600000000
    ReportOptions.LastChange = 41247.491850578710000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo8OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo8, Engine do'
      '  begin'
      '// [odsRepMED."FC_GROUP"]'
      '  end'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frPrihDocGetValue
    OnUserFunction = frPrihDocMedUserFunction
    Left = 125
    Top = 32
    Datasets = <
      item
        DataSet = frxDBDataset2
        DataSetName = 'odsGroupMo'
      end
      item
        DataSet = frDBdsRep
        DataSetName = 'odsRep'
      end
      item
        DataSet = frDBodsRepMed
        DataSetName = 'odsRepMed'
      end
      item
        DataSet = frxDBDataset1
        DataSetName = 'odsUchGr'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 1
      ColumnWidth = 190.000000000000000000
      ColumnPositions.Strings = (
        '0')
      PrintOnPreviousPage = True
      object Memo1: TfrxMemoView
        Top = 220.000000000000000000
        Width = 686.000000000000000000
        Height = 57.000000000000000000
        ShowHint = False
        StretchMode = smMaxHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8 = (
          '[var_receiver]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo30: TfrxMemoView
        Top = 421.000000000000000000
        Width = 686.000000000000000000
        Height = 25.000000000000000000
        ShowHint = False
        StretchMode = smMaxHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8 = (
          
            #1056#8220#1057#1026#1057#1107#1056#1111#1056#1111#1056#176' '#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109' '#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1057#8230' '#1056 +
            #187#1056#1105#1057#8224': [odsGroupMo."fc_group"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo50: TfrxMemoView
        Top = 372.000000000000000000
        Width = 686.000000000000000000
        Height = 20.000000000000000000
        ShowHint = False
        StretchMode = smMaxHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8 = (
          #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [Date1] '#1056#1111#1056#1109' [Date2]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo52: TfrxMemoView
        Top = 304.000000000000000000
        Width = 686.000000000000000000
        Height = 20.000000000000000000
        ShowHint = False
        StretchMode = smMaxHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8 = (
          
            #1056#8220#1057#1026#1057#1107#1056#1111#1056#1111#1056#1105#1057#1026#1056#1109#1056#1030#1056#1109#1057#8225#1056#1029#1056#176#1057#1039' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1057#1034' '#1056#1111#1056#1109' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056 +
            #176#1056#1112#1056#181#1056#1029#1057#8218#1056#176#1056#1112)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo8: TfrxMemoView
        Top = 336.000000000000000000
        Width = 686.000000000000000000
        Height = 20.000000000000000000
        OnBeforePrint = 'Memo8OnBeforePrint'
        ShowHint = False
        StretchMode = smMaxHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8 = (
          #1056#8220#1057#1026#1057#1107#1056#1111#1056#1111#1056#176' '#1057#1107#1057#8225#1056#181#1057#8218#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105': [odsUchGr."FC_UCHGR"]')
        ParentFont = False
        VAlign = vaCenter
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 1
      ColumnWidth = 190.000000000000000000
      ColumnPositions.Strings = (
        '0')
      object MasterData1: TfrxMasterData
        Height = 17.000000000000000000
        Top = 113.385900000000000000
        Width = 718.110700000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        DataSet = frDBodsRepMed
        DataSetName = 'odsRepMed'
        RowCount = 0
        Stretched = True
        object Memo12: TfrxMemoView
          Left = 30.000000000000000000
          Width = 129.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          Memo.UTF8 = (
            '[odsRepMED."FC_LONGNAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 193.000000000000000000
          Width = 120.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRepMED."FN_KOLOSTBEGIN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Width = 30.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[LINE#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 313.000000000000000000
          Width = 120.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRepMED."FN_KOLPRIH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 433.000000000000000000
          Width = 41.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRepMED."FN_KOLRASH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 474.000000000000000000
          Width = 79.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haRight
          Memo.UTF8 = (
            '[FORMATFLOAT('#39'###0.00'#39',<odsRepMED."FN_SUMRASH">)]')
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 553.000000000000000000
          Width = 132.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRepMED."FN_KOLOSTEND"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 159.000000000000000000
          Width = 34.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRepMED."FC_EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.000000000000000000
        Top = 453.543600000000000000
        Width = 718.110700000000000000
        object Memo25: TfrxMemoView
          Left = 609.000000000000000000
          Top = 2.000000000000000000
          Width = 75.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [PAGE#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterFooter1: TfrxFooter
        Height = 18.000000000000000000
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Width = 474.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 474.000000000000000000
          Width = 211.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          Memo.UTF8 = (
            '[FORMATFLOAT('#39'###0.00'#39',sum(<odsRepMED."FN_SUMRASH">))]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 198.000000000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        object Memo17: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 413.000000000000000000
          Top = 17.000000000000000000
          Width = 96.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1038#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1056#187':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 413.000000000000000000
          Top = 41.000000000000000000
          Width = 271.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034': [JobTitleCompiler]'
            #1056#164#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039': [FamCompiler]')
        end
        object Memo29: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 413.000000000000000000
          Top = 82.000000000000000000
          Width = 96.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1105#1056#187':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 413.000000000000000000
          Top = 102.000000000000000000
          Width = 271.000000000000000000
          Height = 41.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034': [JobTitleChecker]'
            #1056#164#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039': [FamChecker]')
        end
        object Memo36: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 413.000000000000000000
          Top = 151.000000000000000000
          Width = 271.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          AutoWidth = True
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#187#1056#1109#1056#182#1056#181#1056#1029#1056#1105#1056#181' '#1056#1029#1056#176' [PAGE#] '#1056#187#1056#1105#1057#1027#1057#8218#1056#176#1057#8230)
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 413.000000000000000000
          Top = 172.000000000000000000
          Width = 271.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Memo.UTF8 = (
            #1056#1038#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1109': [DATE]')
          VAlign = vaCenter
        end
      end
      object MasterHeader1: TfrxHeader
        Height = 72.000000000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        Stretched = True
        object Memo45: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 30.000000000000000000
          Top = 22.000000000000000000
          Width = 129.000000000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181', '#1056#1169#1056#1109#1056#183#1056#1105#1057#1026#1056#1109#1056#1030#1056#1108#1056#176', '#1057#8222'/'#1056#1030', '#1057#8224#1056#181#1056#1029#1056#176' '#1057#1026 +
              '.,  ('#1074#8222#8211' '#1056#1111#1056#176#1057#1026#1057#8218#1056#1105#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 193.000000000000000000
          Top = 22.000000000000000000
          Width = 120.000000000000000000
          Height = 33.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' '#1056#1029#1056#176' '#1056#1029#1056#176#1057#8225#1056#176#1056#187#1056#1109' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169#1056#176' [Date1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 313.000000000000000000
          Top = 22.000000000000000000
          Width = 120.000000000000000000
          Height = 33.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 433.000000000000000000
          Top = 22.000000000000000000
          Width = 120.000000000000000000
          Height = 33.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8230#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 22.000000000000000000
          Width = 30.000000000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 553.000000000000000000
          Top = 22.000000000000000000
          Width = 132.000000000000000000
          Height = 33.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' '#1056#1029#1056#176' '#1056#1108#1056#1109#1056#1029#1056#181#1057#8224' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169#1056#176' [Date2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 313.000000000000000000
          Top = 55.000000000000000000
          Width = 120.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 553.000000000000000000
          Top = 55.000000000000000000
          Width = 132.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 193.000000000000000000
          Top = 55.000000000000000000
          Width = 120.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 433.000000000000000000
          Top = 55.000000000000000000
          Width = 41.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 474.000000000000000000
          Top = 55.000000000000000000
          Width = 79.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 6.000000000000000000
          Top = 1.000000000000000000
          Width = 679.000000000000000000
          Height = 19.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.300000011920929000
          Memo.UTF8 = (
            '[var_receiver]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 159.000000000000000000
          Top = 22.000000000000000000
          Width = 34.000000000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
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
      'ORDER BY FN_ORDER, UPPER(fc_group) '
      ''
      '/*'
      'select * from vchmo'
      'order by fc_name'
      '*/')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C010000000000}
    Session = os
    AfterOpen = odsGroupMoAfterOpen
    Left = 36
    Top = 331
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
    Left = 116
    Top = 331
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'odsUchGr'
    CloseDataSource = False
    DataSet = odsUchGr
    BCDToCurrency = False
    Left = 84
    Top = 435
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'odsGroupMo'
    CloseDataSource = False
    DataSet = odsGroupMo
    BCDToCurrency = False
    Left = 35
    Top = 369
  end
  object oqTSMini: TOracleQuery
    SQL.Strings = (
      'begin'
      '  if :pValue is null then'
      '    if :pdefault is null then :pdefault := '#39#39'; end if;'
      ''
      
        '    :pValue := asu.PKG_SMINI.readstring(:psection,:pident,:pdefa' +
        'ult);'
      '  else'
      '    asu.PKG_SMINI.WRITESTRING( :psection, :pident, :pvalue);'
      '  end if;'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000004000000070000003A5056414C554505000000000000000000000009
      0000003A5044454641554C54050000000000000000000000090000003A505345
      4354494F4E050000000000000000000000070000003A504944454E5405000000
      0000000000000000}
    Left = 384
    Top = 128
  end
end
