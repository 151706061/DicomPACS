object frmKalibr: TfrmKalibr
  Left = 407
  Top = 237
  BorderStyle = bsDialog
  Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1082#1072
  ClientHeight = 131
  ClientWidth = 274
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
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 268
    Height = 86
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object cxLabel4: TcxLabel
      Left = 8
      Top = 9
      Caption = #1042#1074#1077#1089#1090#1080' '#1076#1083#1080#1085#1091':'
    end
    object cxSpinEdit1: TcxSpinEdit
      Left = 87
      Top = 8
      Properties.OnChange = cxSpinEdit1PropertiesChange
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Value = 10
      Width = 121
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 36
      Caption = #1052#1072#1089#1096#1090#1072#1073':'
    end
    object cxTextEdit1: TcxTextEdit
      Left = 87
      Top = 35
      Properties.ReadOnly = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 3
      Width = 121
    end
    object cxLabel2: TcxLabel
      Left = 214
      Top = 36
      Caption = #1084#1084'/'#1087#1080#1082#1089
    end
    object cxLabel3: TcxLabel
      Left = 214
      Top = 9
      Caption = #1084#1084
    end
    object cbToSeria: TcxCheckBox
      Left = 8
      Top = 62
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1082#1086' '#1074#1089#1077#1084' '#1089#1085#1080#1084#1082#1072#1084' '#1089#1077#1088#1080#1080
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 6
      Width = 195
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 92
    Width = 268
    Height = 36
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bOk: TcxButton
      Left = 104
      Top = 7
      Width = 75
      Height = 25
      Action = aOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 185
      Top = 7
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 27
    Top = 91
    object aOk: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1083#1080#1073#1088#1086#1074#1082#1091
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
