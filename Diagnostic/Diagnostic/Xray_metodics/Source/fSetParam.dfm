object frmSetParam: TfrmSetParam
  Left = 245
  Top = 99
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
  ClientHeight = 140
  ClientWidth = 589
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
    Width = 583
    Height = 84
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 9
      Top = 16
      Caption = #1052#1077#1090#1086#1076#1080#1082#1072':'
    end
    object cxNameMetodic: TcxTextEdit
      Left = 74
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
      Width = 416
    end
    object bbSetMetodic: TcxButton
      Left = 496
      Top = 13
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100'...'
      TabOrder = 2
      OnClick = bbSetMetodicClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxLabel2: TcxLabel
      Left = 233
      Top = 49
      Caption = #1055#1077#1088#1080#1086#1076' '#1089':'
    end
    object cxDateBeg: TcxDateEdit
      Left = 298
      Top = 48
      Properties.DateButtons = [btnNow, btnToday]
      Properties.ShowTime = False
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.ButtonStyle = btsDefault
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 4
      Width = 81
    end
    object cxLabel3: TcxLabel
      Left = 385
      Top = 49
      Caption = #1087#1086':'
    end
    object cxDateEnd: TcxDateEdit
      Left = 411
      Top = 48
      Properties.DateButtons = [btnNow, btnToday]
      Properties.ImmediatePost = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 6
      Width = 79
    end
    object bbSetPeriod: TcxButton
      Left = 496
      Top = 46
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100'...'
      TabOrder = 7
      OnClick = bbSetPeriodClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 90
    Width = 583
    Height = 47
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitTop = 96
    ExplicitHeight = 48
    object bCancel: TcxButton
      Left = 496
      Top = 10
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bOk: TcxButton
      Left = 415
      Top = 10
      Width = 75
      Height = 25
      Action = aSet
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object alOkCancel: TActionList
    Images = frmMain.ilMain
    Left = 72
    Top = 64
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
