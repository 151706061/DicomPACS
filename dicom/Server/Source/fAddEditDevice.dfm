object frmAddEditDevice: TfrmAddEditDevice
  Left = 521
  Top = 203
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1091#1076#1072#1083#1077#1085#1085#1086#1075#1086' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
  ClientHeight = 183
  ClientWidth = 300
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
  object pcParam: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 294
    Height = 130
    ActivePage = cxTabSheet1
    Align = alClient
    HideTabs = True
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Green'
    ParentShowHint = False
    ShowHint = True
    Style = 11
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 309
    ExplicitHeight = 137
    ClientRectBottom = 129
    ClientRectLeft = 1
    ClientRectRight = 293
    ClientRectTop = 1
    object cxTabSheet1: TcxTabSheet
      ImageIndex = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 309
      ExplicitHeight = 137
      object teTitle: TcxTextEdit
        Left = 69
        Top = 17
        Properties.CharCase = ecUpperCase
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.TextColor = clBlack
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 0
        Width = 217
      end
      object cxLabel1: TcxLabel
        Left = 4
        Top = 15
        Caption = 'AE Title:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel2: TcxLabel
        Left = 4
        Top = 52
        Caption = 'IP-'#1072#1076#1088#1077#1089':'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Transparent = True
      end
      object teIP: TcxTextEdit
        Left = 69
        Top = 54
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.TextColor = clBlack
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 3
        Width = 217
      end
      object cxLabel3: TcxLabel
        Left = 4
        Top = 88
        Caption = #1055#1086#1088#1090':'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Transparent = True
      end
      object mePort: TcxMaskEdit
        Left = 69
        Top = 90
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d+'
        Properties.MaxLength = 0
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 5
        Width = 121
      end
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 139
    Width = 294
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 168
    ExplicitTop = 184
    ExplicitWidth = 185
    object cxButton1: TcxButton
      Left = 5
      Top = 8
      Width = 75
      Height = 25
      Action = aAdd
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bSave: TcxButton
      Left = 131
      Top = 8
      Width = 75
      Height = 25
      Action = aSave
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bClose: TcxButton
      Left = 212
      Top = 8
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 104
    Top = 136
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100', '#1085#1077' '#1089#1086#1093#1088#1072#1085#1103#1103
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1077' '#1091#1076#1072#1083#1077#1085#1085#1086#1077' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1086
      ShortCut = 115
      OnExecute = aAddExecute
    end
  end
end
