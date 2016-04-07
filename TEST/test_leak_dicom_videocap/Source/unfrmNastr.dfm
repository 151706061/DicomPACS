object frmNastr: TfrmNastr
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 456
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma,204'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox3: TGroupBox
    Left = 0
    Top = 388
    Width = 653
    Height = 68
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 217
      Top = 20
      Width = 82
      Height = 24
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = cxButton1Click
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Black'
    end
    object cxButton2: TcxButton
      Left = 329
      Top = 20
      Width = 82
      Height = 24
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Black'
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 653
    Height = 388
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'PACS server'
      object cxECHO: TcxButton
        Left = 114
        Top = 328
        Width = 82
        Height = 24
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
        Caption = 'ECHO'
        TabOrder = 0
        OnClick = cxECHOClick
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Black'
      end
      object cxLabel12: TcxLabel
        Left = 19
        Top = 86
        Caption = #1055#1086#1088#1090' QUERY:'
        Transparent = True
      end
      object cxLabel13: TcxLabel
        Left = 19
        Top = 149
        Caption = 'Called AE Title:'
        Transparent = True
      end
      object cxLabel14: TcxLabel
        Left = 19
        Top = 208
        Caption = 'Calling AE Title:'
        Transparent = True
      end
      object cxLabel15: TcxLabel
        Left = 19
        Top = 268
        Caption = #1051#1086#1082#1072#1083#1100#1085#1099#1081' '#1087#1086#1088#1090':'
        Transparent = True
      end
      object cxLabel18: TcxLabel
        Left = 19
        Top = 118
        Caption = #1055#1086#1088#1090' STORE:'
        Transparent = True
      end
      object cxLabel9: TcxLabel
        Left = 19
        Top = 29
        Caption = #1057#1077#1088#1074#1077#1088':'
        Transparent = True
      end
      object teCalled: TcxTextEdit
        Left = 19
        Top = 176
        TabOrder = 7
        Width = 238
      end
      object teCalling: TcxTextEdit
        Left = 19
        Top = 236
        TabOrder = 8
        Width = 238
      end
      object teHost: TcxTextEdit
        Left = 19
        Top = 53
        TabOrder = 9
        Width = 238
      end
      object teLocalPort: TcxTextEdit
        Left = 19
        Top = 296
        TabOrder = 10
        Width = 238
      end
      object tePort: TcxTextEdit
        Left = 115
        Top = 85
        TabOrder = 11
        Width = 82
      end
      object tePortStore: TcxTextEdit
        Left = 114
        Top = 117
        TabOrder = 12
        Width = 82
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'WORKLIST server'
      ImageIndex = 1
      object cxButton3: TcxButton
        Left = 113
        Top = 328
        Width = 82
        Height = 24
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
        Caption = 'ECHO'
        TabOrder = 0
        OnClick = cxButton3Click
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Black'
      end
      object cxLabel1: TcxLabel
        Left = 35
        Top = 25
        Caption = #1057#1077#1088#1074#1077#1088':'
        Transparent = True
      end
      object cxLabel19: TcxLabel
        Left = 35
        Top = 86
        Caption = #1055#1086#1088#1090':'
        Transparent = True
      end
      object cxLabel20: TcxLabel
        Left = 35
        Top = 116
        Caption = 'Called AE Title:'
        Transparent = True
      end
      object cxLabel21: TcxLabel
        Left = 35
        Top = 175
        Caption = 'Calling AE Title:'
        Transparent = True
      end
      object teWLCalled: TcxTextEdit
        Left = 35
        Top = 143
        TabOrder = 5
        Width = 238
      end
      object teWLCalling: TcxTextEdit
        Left = 35
        Top = 203
        TabOrder = 6
        Width = 238
      end
      object teWLHost: TcxTextEdit
        Left = 35
        Top = 53
        TabOrder = 7
        Width = 238
      end
      object teWLPort: TcxTextEdit
        Left = 81
        Top = 85
        TabOrder = 8
        Width = 82
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
      ImageIndex = 3
      object cxLabel24: TcxLabel
        Left = 17
        Top = 23
        Caption = 'MODALITY:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Transparent = True
      end
      object teModality: TcxComboBox
        Left = 170
        Top = 23
        Properties.Items.Strings = (
          ''
          'CT'
          'CR'
          'DR'
          'OT'
          'US'
          'XA'
          'VR'
          'MR'
          'MG'
          'NM'
          'SC'
          'DX'
          'ES')
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 1
        Width = 87
      end
      object cxLabel23: TcxLabel
        Left = 17
        Top = 46
        Caption = #1042#1088#1072#1095':'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Transparent = True
      end
      object tePhysiciansName: TcxTextEdit
        Left = 170
        Top = 46
        Style.BorderStyle = ebsNone
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 3
        Width = 191
      end
      object cxLabel30: TcxLabel
        Left = 17
        Top = 73
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1073'.'#1089#1090#1072#1085#1094#1080#1080':'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Transparent = True
      end
      object teStationName: TcxTextEdit
        Left = 170
        Top = 70
        Style.BorderStyle = ebsNone
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 5
        Width = 191
      end
      object cxLabel29: TcxLabel
        Left = 17
        Top = 94
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Transparent = True
      end
      object teProcDescription: TcxTextEdit
        Left = 170
        Top = 94
        Style.BorderStyle = ebsNone
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 7
        Width = 439
      end
      object cbCheckedImages: TcxCheckBox
        Left = 17
        Top = 146
        Caption = #1088#1072#1073#1086#1090#1072#1090#1100' '#1089' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1084#1080
        ParentShowHint = False
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        ShowHint = True
        State = cbsGrayed
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Black'
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Black'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Black'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Black'
        TabOrder = 8
        Transparent = True
        Width = 159
      end
      object cbShNastr: TcxCheckBox
        Left = 17
        Top = 168
        Caption = #1087#1086#1082#1072#1079#1072#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '
        ParentShowHint = False
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        ShowHint = True
        State = cbsGrayed
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Black'
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Black'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Black'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Black'
        TabOrder = 9
        Transparent = True
        Width = 159
      end
      object cbSaveRazmer: TcxCheckBox
        Left = 17
        Top = 190
        Caption = #1047#1072#1087#1086#1084#1085#1080#1090#1100' '#1088#1072#1079#1084#1077#1088' '#1092#1086#1088#1084#1099' '#1074#1080#1076#1077#1086#1079#1072#1093#1074#1072#1090#1072
        ParentShowHint = False
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        ShowHint = True
        State = cbsGrayed
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Black'
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Black'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Black'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Black'
        TabOrder = 10
        Transparent = True
        Width = 240
      end
      object cbAutoSend: TcxCheckBox
        Left = 17
        Top = 214
        Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1072#1103' '#1086#1090#1087#1088#1072#1074#1082#1072' '#1085#1072' '#1087#1072#1082#1089' ('#1092#1086#1088#1084#1072' '#1085#1077' '#1079#1072#1082#1088#1099#1074#1072#1077#1090#1089#1103')'
        ParentShowHint = False
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        ShowHint = True
        State = cbsGrayed
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Black'
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Black'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Black'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Black'
        TabOrder = 11
        Transparent = True
        Width = 344
      end
      object cbCloseFormSnd: TcxCheckBox
        Left = 17
        Top = 238
        Caption = #1047#1072#1082#1088#1099#1090#1080#1077' '#1092#1086#1088#1084#1099' '#1087#1086#1089#1083#1077' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1085#1072' '#1087#1072#1082#1089
        ParentShowHint = False
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        ShowHint = True
        State = cbsGrayed
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Black'
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Black'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Black'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Black'
        TabOrder = 12
        Transparent = True
        Width = 344
      end
      object cbNotShowMsg: TcxCheckBox
        Left = 17
        Top = 262
        Caption = #1059#1073#1088#1072#1090#1100' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1086#1073' '#1091#1089#1087#1077#1096#1085#1086#1081' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1089#1085#1080#1084#1082#1086#1074' '#1085#1072' '#1087#1072#1082#1089
        ParentShowHint = False
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        ShowHint = True
        State = cbsGrayed
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Black'
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Black'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Black'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Black'
        TabOrder = 13
        Transparent = True
        Width = 344
      end
    end
    object TabSheet5: TTabSheet
      Caption = '"'#1043#1086#1088#1103#1095#1080#1077'" '#1082#1083#1072#1074#1080#1096#1080
      ImageIndex = 4
      object cxLabel2: TcxLabel
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
      object hkKadr: THotKey
        Left = 138
        Top = 26
        Width = 121
        Height = 20
        Modifiers = []
        TabOrder = 1
      end
      object cxLabel3: TcxLabel
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
      object hkStartVideo: THotKey
        Left = 138
        Top = 57
        Width = 121
        Height = 20
        Modifiers = []
        TabOrder = 3
      end
      object cxLabel4: TcxLabel
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
      object hkStopVideo: THotKey
        Left = 138
        Top = 90
        Width = 121
        Height = 20
        Modifiers = []
        TabOrder = 5
      end
    end
  end
end
