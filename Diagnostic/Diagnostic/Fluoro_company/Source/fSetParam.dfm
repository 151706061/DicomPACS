object frmSetParam: TfrmSetParam
  Left = 367
  Top = 119
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
  ClientHeight = 137
  ClientWidth = 304
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
    Width = 298
    Height = 78
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitTop = 31
    ExplicitWidth = 330
    object cxLabel2: TcxLabel
      Left = 12
      Top = 44
      Caption = #1043#1086#1076':'
    end
    object cxLabel1: TcxLabel
      Left = 12
      Top = 14
      Caption = #1052#1077#1089#1103#1094':'
    end
    object cxName: TcxTextEdit
      Left = 57
      Top = 13
      TabStop = False
      Enabled = False
      Properties.HideSelection = False
      Properties.IncrementalSearch = False
      Properties.ReadOnly = True
      Style.BorderStyle = ebsOffice11
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.BorderColor = clBlack
      StyleDisabled.Color = clWhite
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 2
      Width = 148
    end
    object bbSetName: TcxButton
      Left = 211
      Top = 10
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100'...'
      TabOrder = 3
      OnClick = bbSetNameClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxYear: TcxSpinEdit
      Left = 57
      Top = 44
      Properties.AssignedValues.MinValue = True
      Properties.MaxValue = 9999.000000000000000000
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 4
      Width = 84
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 84
    Width = 298
    Height = 50
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 160
    ExplicitTop = 144
    ExplicitWidth = 185
    ExplicitHeight = 41
    object cxButton1: TcxButton
      Left = 130
      Top = 11
      Width = 75
      Height = 25
      Action = aSet
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton2: TcxButton
      Left = 211
      Top = 11
      Width = 75
      Height = 25
      Action = aCancel
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
