object FrmBackUp: TFrmBackUp
  Left = 333
  Top = 132
  BorderStyle = bsDialog
  Caption = #1056#1077#1079#1077#1088#1074#1085#1086#1077' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1041#1044' (Backup)'
  ClientHeight = 455
  ClientWidth = 859
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000008888880777777777777088808880000888
    8888077000077777708880888000088888880770880777777088808880000888
    8888077088077777708880888000088888880770880777777088808880000888
    8888077088077777708880888000088888880770000777777088808880000888
    8888077777777777708880888000088888880000000000000000008880000888
    8888888888888888888888888000088888888888888888888888888880000888
    8888888888888888888888888000088800000000000000000000008880000888
    0FFFFFFFFFFFFFFFFFFFF088800008880FFFFFFFFFFFFFFFFFFFF08880000888
    0FFFFFFFFFFFFFFFFFFFF088800008880FFFFFFFFFFFFFFFFFFFF08880000888
    0FFFFFFFFFFFFFFFFFFFF088800008880FFFFFFFFFFFFFFFFFFFF08880000888
    0FFFFFFFFFFFFFFFFFFFF088800008880FFFFFFFFFFFFFFFFFFFF08880000888
    0FFFFFFFFFFFFFFFFFFFF088800008880FFFFFFFFFFFFFFFFFFFF08880000888
    0FFFFFFFFFFFFFFFFFFFF088800008880FFFFFFFFFFFFFFFFFFFF08080000888
    0FFFFFFFFFFFFFFFFFFFF080800008880FFFFFFFFFFFFFFFFFFFF08880000888
    0FFFFFFFFFFFFFFFFFFFF088800000000000000000000000000000000000FFFF
    FFFFFFFFFFFFC000000780000003000000030000000300000003000000030000
    0003000000030000000300000003000000030000000300000003000000030000
    0003000000030000000300000003000000030000000300000003000000030000
    000300000003000000030000000300000003000000030000000380000007}
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object jvpnl2: TJvPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 853
    Height = 47
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    FlatBorderColor = clGradientActiveCaption
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object cxlbl3: TcxLabel
      Left = 13
      Top = 16
      Caption = #1055#1091#1090#1100':'
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.SkinName = 'Black'
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.SkinName = 'Black'
    end
    object cxtxtdtBD: TcxTextEdit
      Left = 53
      Top = 15
      Enabled = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.SkinName = 'Black'
      Style.IsFontAssigned = True
      StyleDisabled.BorderColor = clBlack
      StyleDisabled.BorderStyle = ebsNone
      StyleDisabled.Color = clBtnFace
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 1
      Text = '--'
      Width = 652
    end
    object btnBackUp: TcxButton
      Left = 711
      Top = 12
      Width = 134
      Height = 25
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077
      Action = actSave
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object cxmBackUp: TcxMemo
    AlignWithMargins = True
    Left = 3
    Top = 53
    Margins.Top = 0
    Align = alClient
    Properties.ScrollBars = ssVertical
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 1
    Height = 399
    Width = 853
  end
  object fibBackUp: TpFIBBackupService
    LoginPrompt = False
    Verbose = True
    BlockingFactor = 0
    Options = []
    Left = 56
    Top = 88
  end
  object actlstal: TActionList
    Left = 200
    Top = 128
    object actSave: TAction
      Caption = 'actSave'
      ShortCut = 113
      OnExecute = actSaveExecute
    end
    object actDisable: TAction
      Caption = 'actDisable'
      ShortCut = 27
      OnExecute = actDisableExecute
    end
  end
end
