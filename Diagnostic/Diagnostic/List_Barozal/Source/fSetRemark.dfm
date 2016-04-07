object frmSetRemark: TfrmSetRemark
  Left = 355
  Top = 181
  BorderStyle = bsDialog
  Caption = #1054#1089#1086#1073#1077#1085#1085#1086#1089#1090#1080' '#1089#1077#1072#1085#1089#1072
  ClientHeight = 140
  ClientWidth = 417
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
  object memRemark: TcxMemo
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 0
    OnClick = memRemarkClick
    OnEnter = memRemarkEnter
    Height = 89
    Width = 411
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 95
    Width = 411
    Height = 42
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 56
    ExplicitTop = 98
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bOk: TcxButton
      Left = 251
      Top = 8
      Width = 75
      Height = 25
      Action = aOk
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 329
      Top = 8
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 88
    Top = 48
    object aOk: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
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
