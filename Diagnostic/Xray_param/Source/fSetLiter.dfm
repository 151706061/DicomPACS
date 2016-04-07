object frmSetLiter: TfrmSetLiter
  Left = 476
  Top = 321
  BorderStyle = bsDialog
  Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1073#1091#1082#1074#1091' '#1076#1083#1103' '#1082#1072#1073#1080#1085#1077#1090#1072' '#1060#1043
  ClientHeight = 110
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 302
    Height = 70
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 16
      Top = 12
      Caption = #1050#1072#1073#1080#1085#1077#1090':'
    end
    object lbKab: TcxLabel
      Left = 73
      Top = 12
      Caption = '--'
      Style.TextStyle = [fsBold]
    end
    object cxLabel2: TcxLabel
      Left = 16
      Top = 35
      Caption = #1041#1091#1082#1074#1072':'
    end
    object teLiter: TcxTextEdit
      Left = 73
      Top = 34
      Properties.MaxLength = 1
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 3
      OnKeyPress = teLiterKeyPress
      Width = 72
    end
  end
  object bOk: TcxButton
    Left = 149
    Top = 79
    Width = 75
    Height = 25
    Action = aOk
    TabOrder = 1
    LookAndFeel.SkinName = 'Office2007Green'
  end
  object bCancel: TcxButton
    Left = 230
    Top = 79
    Width = 75
    Height = 25
    Action = aCancel
    TabOrder = 2
    LookAndFeel.SkinName = 'Office2007Green'
  end
  object al: TActionList
    Left = 83
    Top = 67
    object aOk: TAction
      Caption = #1054#1082
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1073#1091#1082#1074#1091
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
