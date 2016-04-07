object frmAddEditApparat: TfrmAddEditApparat
  Left = 383
  Top = 123
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1087#1087#1072#1088#1072#1090
  ClientHeight = 193
  ClientWidth = 464
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
    Width = 458
    Height = 135
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 16
      Top = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object cxLabel2: TcxLabel
      Left = 16
      Top = 43
      Caption = 'AE Title'
    end
    object cxLabel3: TcxLabel
      Left = 16
      Top = 70
      Caption = 'IP-'#1072#1076#1088#1077#1089
    end
    object cxLabel4: TcxLabel
      Left = 16
      Top = 98
      Caption = #1050#1072#1073#1080#1085#1077#1090
    end
    object teName: TcxTextEdit
      Left = 99
      Top = 15
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 4
      Width = 342
    end
    object teAE: TcxTextEdit
      Left = 99
      Top = 42
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 5
      Width = 342
    end
    object teIP: TcxTextEdit
      Left = 99
      Top = 69
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 6
      Width = 342
    end
    object beKab: TcxButtonEdit
      Left = 99
      Top = 96
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ViewStyle = vsHideCursor
      Properties.OnButtonClick = beKabPropertiesButtonClick
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 7
      Width = 342
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 141
    Width = 458
    Height = 49
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bCancel: TcxButton
      Left = 366
      Top = 11
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bOk: TcxButton
      Left = 285
      Top = 11
      Width = 75
      Height = 25
      Action = aOk
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 243
    Top = 40
    object aOk: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
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
