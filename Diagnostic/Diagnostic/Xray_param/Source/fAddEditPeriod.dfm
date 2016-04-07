object frmAddEditPeriod: TfrmAddEditPeriod
  Left = 436
  Top = 183
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100
  ClientHeight = 167
  ClientWidth = 361
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
    Width = 355
    Height = 110
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 16
      Top = 12
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object cxLabel2: TcxLabel
      Left = 16
      Top = 52
      Caption = #1055#1088#1086#1093#1086#1078#1076#1077#1085#1080#1077' '#1092#1083#1102#1086#1088#1086#1075#1088#1072#1092#1080#1080' '#1095#1077#1088#1077#1079
    end
    object cxLabel3: TcxLabel
      Left = 300
      Top = 52
      Caption = #1076#1085#1077#1081
    end
    object cxNamePeriod: TcxTextEdit
      Left = 103
      Top = 12
      Style.BorderStyle = ebsOffice11
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 3
      Width = 242
    end
    object cxKolvoDays: TcxSpinEdit
      Left = 209
      Top = 52
      Properties.AssignedValues.MinValue = True
      Properties.ImmediatePost = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 4
      Width = 88
    end
    object cxKolvoMon: TcxSpinEdit
      Left = 209
      Top = 79
      Properties.AssignedValues.MinValue = True
      Properties.ImmediatePost = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 5
      Width = 88
    end
    object cxLabel4: TcxLabel
      Left = 300
      Top = 79
      Caption = #1084#1077#1089#1103#1094#1077#1074
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 116
    Width = 355
    Height = 48
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = -214
    ExplicitTop = 103
    ExplicitWidth = 458
    ExplicitHeight = 49
    object bCancel: TcxButton
      Left = 270
      Top = 11
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bOk: TcxButton
      Left = 189
      Top = 11
      Width = 75
      Height = 25
      Action = aSave
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object alOkCancel: TActionList
    Images = frmMain.ilMain
    Left = 240
    Top = 8
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
