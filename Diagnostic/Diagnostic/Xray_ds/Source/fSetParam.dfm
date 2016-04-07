object frmSetParam: TfrmSetParam
  Left = 431
  Top = 114
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
  ClientHeight = 129
  ClientWidth = 621
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
    Width = 615
    Height = 75
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 26
    ExplicitWidth = 612
    ExplicitHeight = 83
    object cxLabel1: TcxLabel
      Left = 13
      Top = 14
      Caption = #1044#1080#1072#1075#1085#1086#1079':'
    end
    object cxDs: TcxTextEdit
      Left = 69
      Top = 13
      TabStop = False
      Properties.HideSelection = False
      Properties.IncrementalSearch = False
      Properties.ReadOnly = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Width = 456
    end
    object bbSetDs: TcxButton
      Left = 531
      Top = 11
      Width = 75
      Height = 25
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1076#1080#1072#1075#1085#1086#1079' '#1080#1083#1080' '#1075#1088#1091#1087#1087#1091' '#1076#1080#1072#1075#1085#1086#1079#1086#1074
      Caption = #1042#1099#1073#1088#1072#1090#1100'...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbSetDsClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxLabel2: TcxLabel
      Left = 9
      Top = 47
      Caption = #1055#1077#1088#1080#1086#1076' '#1089':'
    end
    object cxDateBeg: TcxDateEdit
      Left = 69
      Top = 46
      Properties.DateButtons = [btnClear, btnNow, btnToday]
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
      Left = 156
      Top = 47
      Caption = #1087#1086':'
    end
    object cxDateEnd: TcxDateEdit
      Left = 182
      Top = 46
      Properties.DateButtons = [btnClear, btnNow, btnToday]
      Properties.ImmediatePost = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 6
      Width = 79
    end
    object bbSetPeriod: TcxButton
      Left = 267
      Top = 44
      Width = 75
      Height = 25
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
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
    Top = 81
    Width = 615
    Height = 45
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 328
    ExplicitTop = 112
    ExplicitWidth = 185
    ExplicitHeight = 41
    object cxButton1: TcxButton
      Left = 531
      Top = 9
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton2: TcxButton
      Left = 450
      Top = 9
      Width = 75
      Height = 25
      Action = aSet
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object alOkCancel: TActionList
    Images = frmMain.ilMain
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
