object frmSetParam: TfrmSetParam
  Left = 348
  Top = 197
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
  ClientHeight = 146
  ClientWidth = 520
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
    Width = 514
    Height = 89
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 8
      Top = 16
      Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082'('#1074#1074#1086#1076#1080#1074#1096#1080#1081' '#1082#1086#1085#1090#1088#1072#1089#1090'):'
    end
    object cxFIOSotr: TcxTextEdit
      Left = 185
      Top = 15
      TabStop = False
      Properties.HideSelection = False
      Properties.IncrementalSearch = False
      Properties.ReadOnly = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Width = 233
    end
    object bbSetSotr: TcxButton
      Left = 424
      Top = 13
      Width = 75
      Height = 25
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      Caption = #1042#1099#1073#1088#1072#1090#1100'...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbSetSotrClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxLabel2: TcxLabel
      Left = 133
      Top = 56
      Caption = #1055#1077#1088#1080#1086#1076' '#1089':'
    end
    object cxDateBeg: TcxDateEdit
      Left = 186
      Top = 55
      Properties.DateButtons = [btnNow, btnToday]
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.ShowTime = False
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.ButtonStyle = btsDefault
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 4
      Width = 102
    end
    object cxLabel3: TcxLabel
      Left = 298
      Top = 56
      Caption = #1087#1086':'
    end
    object cxDateEnd: TcxDateEdit
      Left = 316
      Top = 55
      Properties.DateButtons = [btnNow, btnToday]
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.ShowTime = False
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 6
      Width = 102
    end
    object bbSetPeriod: TcxButton
      Left = 424
      Top = 53
      Width = 75
      Height = 25
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
      Caption = #1042#1099#1073#1088#1072#1090#1100'...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = bbSetPeriodClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 95
    Width = 514
    Height = 48
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bSet: TcxButton
      Left = 343
      Top = 10
      Width = 75
      Height = 25
      Action = aSet
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton1: TcxButton
      Left = 424
      Top = 10
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object alOkCancel: TActionList
    Images = frmMain.ILMain
    Left = 296
    Top = 8
    object aSet: TAction
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
      ShortCut = 113
      OnExecute = aSetExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
