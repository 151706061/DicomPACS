object frmFilter: TfrmFilter
  Left = 393
  Top = 101
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1092#1080#1083#1100#1090#1088#1072' '#1078#1091#1088#1085#1072#1083#1072
  ClientHeight = 382
  ClientWidth = 348
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
  object JvPanel1: TJvPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 342
    Height = 330
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
    object cxGroupBox1: TcxGroupBox
      Left = 16
      Top = 16
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1089#1086#1073#1099#1090#1080#1103#1084
      Style.BorderStyle = ebsOffice11
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      Height = 177
      Width = 313
      object rbAll: TcxRadioButton
        Left = 11
        Top = 24
        Width = 281
        Height = 17
        Caption = #1042#1089#1077' '#1089#1086#1073#1099#1090#1080#1103
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object rbStart: TcxRadioButton
        Tag = 1
        Left = 11
        Top = 47
        Width = 281
        Height = 17
        Caption = #1047#1072#1087#1091#1089#1082' '#1089#1077#1088#1074#1077#1088#1072
        TabOrder = 1
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object rbStop: TcxRadioButton
        Tag = 2
        Left = 11
        Top = 70
        Width = 281
        Height = 17
        Caption = #1054#1089#1090#1072#1085#1086#1074#1082#1072' '#1089#1077#1088#1074#1077#1088#1072
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object rbError: TcxRadioButton
        Tag = 3
        Left = 11
        Top = 93
        Width = 281
        Height = 17
        Caption = #1054#1096#1080#1073#1082#1080
        TabOrder = 3
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object rbEvents: TcxRadioButton
        Tag = 4
        Left = 11
        Top = 116
        Width = 281
        Height = 17
        Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077' '#1089#1086#1073#1099#1090#1080#1103
        TabOrder = 4
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object rbParamEdit: TcxRadioButton
        Tag = 5
        Left = 11
        Top = 139
        Width = 281
        Height = 17
        Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1089#1077#1088#1074#1077#1088#1072
        TabOrder = 5
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
    end
    object cbDate: TcxCheckBox
      Left = 16
      Top = 208
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1072#1084
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
      Properties.OnEditValueChanged = cbDatePropertiesEditValueChanged
      State = cbsGrayed
      Style.BorderStyle = ebsOffice11
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Width = 262
    end
    object paDate: TJvPanel
      Left = 16
      Top = 238
      Width = 313
      Height = 75
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      FlatBorderColor = clGradientActiveCaption
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object cxLabel1: TcxLabel
        Left = 27
        Top = 9
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072':'
      end
      object cxLabel2: TcxLabel
        Left = 9
        Top = 38
        Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103':'
      end
      object deBegin: TcxDateEdit
        Left = 100
        Top = 8
        ParentShowHint = False
        Properties.DateButtons = [btnToday]
        Properties.DateOnError = deToday
        Properties.ImmediatePost = True
        Properties.PostPopupValueOnTab = True
        Properties.ShowTime = False
        ShowHint = True
        Style.BorderStyle = ebsOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.ButtonStyle = btsOffice11
        Style.ButtonTransparency = ebtNone
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 2
        Width = 109
      end
      object deEnd: TcxDateEdit
        Left = 101
        Top = 37
        ParentShowHint = False
        Properties.DateButtons = [btnToday]
        Properties.DateOnError = deToday
        Properties.ImmediatePost = True
        Properties.PostPopupValueOnTab = True
        Properties.ShowTime = False
        ShowHint = True
        Style.BorderStyle = ebsOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.ButtonStyle = btsOffice11
        Style.ButtonTransparency = ebtNone
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 3
        Width = 108
      end
      object bEditDates: TcxButton
        Left = 225
        Top = 34
        Width = 75
        Height = 25
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
        TabOrder = 4
        OnClick = bEditDatesClick
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
      end
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 336
    Width = 342
    Height = 43
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bSave: TcxButton
      Left = 173
      Top = 8
      Width = 75
      Height = 25
      Action = aSave
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bClose: TcxButton
      Left = 254
      Top = 8
      Width = 75
      Height = 25
      Action = aClose
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 290
    Top = 217
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100', '#1085#1077' '#1089#1086#1093#1088#1072#1085#1103#1103
      ShortCut = 27
      OnExecute = aCloseExecute
    end
  end
end
