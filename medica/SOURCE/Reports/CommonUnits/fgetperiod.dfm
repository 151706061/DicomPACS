object frmGetPeriod: TfrmGetPeriod
  Left = 479
  Top = 176
  HelpContext = 35
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1088#1072#1085#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
  ClientHeight = 88
  ClientWidth = 246
  Color = clBtnFace
  Constraints.MaxHeight = 115
  Constraints.MaxWidth = 254
  Constraints.MinHeight = 115
  Constraints.MinWidth = 254
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
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
  ShowHint = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object abuSetDocPeriod: TJvArrowButton
    Left = 224
    Top = 2
    Width = 15
    Height = 26
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076' '#1080#1079' '#1089#1087#1080#1089#1082#1072
    ArrowWidth = 15
    DropDown = pmDocsFilterPeriod
    Flat = True
    FillFont.Charset = DEFAULT_CHARSET
    FillFont.Color = clWindowText
    FillFont.Height = -11
    FillFont.Name = 'MS Sans Serif'
    FillFont.Style = []
  end
  object Label2: TLabel
    Left = 111
    Top = 10
    Width = 15
    Height = 13
    Hint = #1042#1074#1086#1076' '#1082#1086#1085#1077#1095#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
    Caption = #1087#1086':'
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
  object Label1: TLabel
    Left = 6
    Top = 10
    Width = 6
    Height = 13
    Hint = #1042#1074#1086#1076' '#1082#1086#1085#1077#1095#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
    Caption = 'c'
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
  object dDate2: TJvDateEdit
    Left = 129
    Top = 6
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
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Weekends = [Sun, Sat]
    YearDigits = dyFour
    TabOrder = 0
  end
  object dDate1: TJvDateEdit
    Left = 18
    Top = 6
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
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Weekends = [Sun, Sat]
    YearDigits = dyFour
    TabOrder = 1
  end
  object Button1: TButton
    Left = 6
    Top = 50
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 164
    Top = 50
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = Button2Click
  end
  object pmDocsFilterPeriod: TPopupMenu
    Left = 106
    Top = 46
    object miPeriodCurMonth: TMenuItem
      Caption = #1058#1077#1082'. '#1084#1077#1089#1103#1094
      OnClick = miPeriodCurMonthClick
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N20: TMenuItem
      Tag = 1
      Caption = #1071#1085#1074#1072#1088#1100
      OnClick = miPeriodCurMonthClick
    end
    object N18: TMenuItem
      Tag = 2
      Caption = #1060#1077#1074#1088#1072#1083#1100
      OnClick = miPeriodCurMonthClick
    end
    object N16: TMenuItem
      Tag = 3
      Caption = #1052#1072#1088#1090
      OnClick = miPeriodCurMonthClick
    end
    object N17: TMenuItem
      Tag = 4
      Caption = #1040#1087#1088#1077#1083#1100
      OnClick = miPeriodCurMonthClick
    end
    object N15: TMenuItem
      Tag = 5
      Caption = #1052#1072#1081
      OnClick = miPeriodCurMonthClick
    end
    object N1: TMenuItem
      Tag = 6
      Caption = #1048#1102#1085#1100
      OnClick = miPeriodCurMonthClick
    end
    object N3: TMenuItem
      Tag = 7
      Caption = #1048#1102#1083#1100
      OnClick = miPeriodCurMonthClick
    end
    object N4: TMenuItem
      Tag = 8
      Caption = #1040#1074#1075#1091#1089#1090
      OnClick = miPeriodCurMonthClick
    end
    object N5: TMenuItem
      Tag = 9
      Caption = #1057#1077#1085#1090#1103#1073#1088#1100
      OnClick = miPeriodCurMonthClick
    end
    object N6: TMenuItem
      Tag = 10
      Caption = #1054#1082#1090#1103#1073#1088#1100
      OnClick = miPeriodCurMonthClick
    end
    object N7: TMenuItem
      Tag = 11
      Caption = #1053#1086#1103#1073#1088#1100
      OnClick = miPeriodCurMonthClick
    end
    object N8: TMenuItem
      Tag = 12
      Caption = #1044#1077#1082#1072#1073#1088#1100
      OnClick = miPeriodCurMonthClick
    end
  end
end
