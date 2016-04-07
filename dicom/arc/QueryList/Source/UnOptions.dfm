object fOptions: TfOptions
  Left = 0
  Top = 0
  Caption = #1054#1087#1094#1080#1080
  ClientHeight = 179
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma,204'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    Caption = '"'#1043#1086#1088#1103#1095#1080#1077'" '#1082#1083#1072#1074#1080#1096#1080
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 0
    ExplicitWidth = 276
    Height = 145
    Width = 275
    object cxLabel30: TcxLabel
      Left = 12
      Top = 29
      Caption = #1047#1072#1093#1074#1072#1090' '#1082#1072#1076#1088#1072' ('#1089#1085#1080#1084#1086#1082')'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel1: TcxLabel
      Left = 12
      Top = 60
      Caption = #1047#1072#1093#1074#1072#1090' '#1074#1080#1076#1077#1086' ('#1089#1090#1072#1088#1090')'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 12
      Top = 93
      Caption = #1047#1072#1093#1074#1072#1090' '#1074#1080#1076#1077#1086' ('#1089#1090#1086#1087')'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object hkKadr: THotKey
      Left = 138
      Top = 26
      Width = 121
      Height = 20
      Modifiers = []
      TabOrder = 3
    end
    object hkStartVideo: THotKey
      Left = 138
      Top = 57
      Width = 121
      Height = 20
      Modifiers = []
      TabOrder = 4
    end
    object hkStopVideo: THotKey
      Left = 138
      Top = 90
      Width = 121
      Height = 20
      Modifiers = []
      TabOrder = 5
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 145
    Align = alBottom
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 1
    ExplicitWidth = 276
    Height = 34
    Width = 275
    object cxECHO: TcxButton
      Left = 50
      Top = 6
      Width = 82
      Height = 24
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ModalResult = 1
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Black'
    end
    object cxButton1: TcxButton
      Left = 138
      Top = 6
      Width = 82
      Height = 24
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Black'
    end
  end
end
