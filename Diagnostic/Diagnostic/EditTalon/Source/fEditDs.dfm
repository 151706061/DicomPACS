object frmEditDs: TfrmEditDs
  Left = 351
  Top = 155
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1080#1072#1075#1085#1086#1079#1072
  ClientHeight = 138
  ClientWidth = 685
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
  object memDs: TcxMemo
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    Properties.ScrollBars = ssBoth
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 0
    Height = 89
    Width = 679
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 95
    Width = 679
    Height = 40
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 152
    ExplicitTop = 96
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bOk: TcxButton
      Left = 518
      Top = 7
      Width = 75
      Height = 25
      Action = aSave
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 596
      Top = 7
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 320
    Top = 24
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
