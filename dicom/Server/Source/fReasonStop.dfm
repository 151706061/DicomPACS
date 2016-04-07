object frmReasonStop: TfrmReasonStop
  Left = 421
  Top = 154
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1055#1088#1080#1095#1080#1085#1072' '#1086#1089#1090#1072#1085#1086#1074#1082#1080' '#1089#1077#1088#1074#1077#1088#1072
  ClientHeight = 208
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object memReason: TcxMemo
    Left = 0
    Top = 0
    Align = alTop
    Properties.OnChange = memReasonPropertiesChange
    Style.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.Kind = lfOffice11
    TabOrder = 0
    OnClick = memReasonClick
    OnEnter = memReasonEnter
    Height = 169
    Width = 375
  end
  object bSave: TcxButton
    Left = 214
    Top = 176
    Width = 75
    Height = 25
    Action = aSave
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Black'
  end
  object cxButton1: TcxButton
    Left = 295
    Top = 176
    Width = 75
    Height = 25
    Action = aCancel
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Black'
  end
  object al: TActionList
    Left = 128
    Top = 96
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1088#1080#1095#1080#1085#1091' '#1086#1089#1090#1072#1085#1086#1074#1082#1080' '#1089#1077#1088#1074#1077#1088#1072' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100', '#1085#1077' '#1089#1086#1093#1088#1072#1085#1103#1103
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
