object EdtWLForm: TEdtWLForm
  Left = 0
  Top = 0
  ClientHeight = 470
  ClientWidth = 593
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
  object gbReservBD: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 0
    Margins.Top = 0
    Align = alTop
    Caption = #1044#1072#1085#1085#1099#1077' '#1087#1072#1094#1080#1077#1085#1090#1072
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.SkinName = 'Black'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Black'
    StyleFocused.LookAndFeel.SkinName = 'Black'
    StyleHot.LookAndFeel.SkinName = 'Black'
    TabOrder = 0
    Height = 113
    Width = 587
    object dtP_DATEBORN: TcxDateEdit
      Left = 457
      Top = 74
      Enabled = False
      ParentFont = False
      Properties.DateButtons = [btnToday]
      Properties.DateOnError = deToday
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Black'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 4
      Width = 114
    end
    object cxLabel1: TcxLabel
      Left = 10
      Top = 51
      Caption = 'N '#1084#1077#1076#1082#1072#1088#1090#1099':'
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
      Left = 338
      Top = 76
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel3: TcxLabel
      Left = 10
      Top = 76
      Caption = #1055#1086#1083' (M = male F = female O = other):'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxlbl1: TcxLabel
      Left = 10
      Top = 27
      Caption = #1055#1072#1094#1080#1077#1085#1090':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object teP_ENAME: TcxTextEdit
      Left = 128
      Top = 27
      Enabled = False
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Black'
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 0
      Width = 443
    end
    object teP_PID: TcxTextEdit
      Left = 128
      Top = 51
      Enabled = False
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Black'
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 1
      Width = 443
    end
    object teP_SEX: TcxComboBox
      Left = 204
      Top = 75
      Enabled = False
      Properties.Items.Strings = (
        'M'
        'F'
        'O')
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Black'
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 2
      Text = 'M'
      Width = 45
    end
  end
  object cxGroupBox2: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 116
    Margins.Top = 0
    Align = alTop
    Caption = #1044#1072#1085#1085#1099#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.SkinName = 'Black'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Black'
    StyleFocused.LookAndFeel.SkinName = 'Black'
    StyleHot.LookAndFeel.SkinName = 'Black'
    TabOrder = 1
    Height = 309
    Width = 587
    object deEndDateWorklist: TcxDateEdit
      Left = 183
      Top = 42
      Enabled = False
      ParentFont = False
      Properties.DateButtons = [btnToday]
      Properties.DateOnError = deToday
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Black'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 3
      Width = 103
    end
    object cxLabel18: TcxLabel
      Left = 338
      Top = 42
      Caption = #1042#1088#1077#1084#1103' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel21: TcxLabel
      Left = 10
      Top = 65
      Caption = 'STUDYUID:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel22: TcxLabel
      Left = 10
      Top = 88
      Caption = 'ACCESSIONNUMBER:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel23: TcxLabel
      Left = 10
      Top = 133
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
    object cxLabel24: TcxLabel
      Left = 10
      Top = 111
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
    object cxLabel25: TcxLabel
      Left = 10
      Top = 42
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel26: TcxLabel
      Left = 338
      Top = 19
      Caption = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel28: TcxLabel
      Left = 10
      Top = 19
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object teSTUDYUID: TcxTextEdit
      Left = 128
      Top = 65
      Enabled = False
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Black'
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 5
      Width = 443
    end
    object teAccessionNumber: TcxTextEdit
      Left = 128
      Top = 88
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Black'
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 6
      Width = 443
    end
    object tePhysiciansName: TcxTextEdit
      Left = 128
      Top = 133
      Enabled = False
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Black'
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 7
      Width = 443
    end
    object teStationName: TcxTextEdit
      Left = 163
      Top = 156
      Enabled = False
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Black'
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 8
      Width = 408
    end
    object teStepStartTime: TcxTextEdit
      Left = 507
      Top = 19
      Enabled = False
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Black'
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 1
      Width = 64
    end
    object teStepFinishTime: TcxTextEdit
      Left = 507
      Top = 42
      Enabled = False
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Black'
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 4
      Width = 64
    end
    object teStationAETitle: TcxTextEdit
      Left = 128
      Top = 179
      Enabled = False
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Black'
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 9
      Width = 443
    end
    object deStartDateWorklist: TcxDateEdit
      Left = 183
      Top = 19
      Enabled = False
      ParentFont = False
      Properties.DateButtons = [btnToday]
      Properties.DateOnError = deToday
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Black'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 0
      Width = 103
    end
    object cxLabel29: TcxLabel
      Left = 10
      Top = 250
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel30: TcxLabel
      Left = 10
      Top = 156
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
    object cxLabel31: TcxLabel
      Left = 10
      Top = 179
      Caption = 'AETitle '#1072#1087#1087#1072#1088#1072#1090#1072':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel32: TcxLabel
      Left = 10
      Top = 202
      Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel33: TcxLabel
      Left = 10
      Top = 273
      Caption = #1057#1090#1072#1090#1091#1089':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel34: TcxLabel
      Left = 10
      Top = 227
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1096#1072#1075#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object teProcPriority: TcxTextEdit
      Left = 128
      Top = 202
      Enabled = False
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Black'
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 10
      Width = 443
    end
    object teStepDescription: TcxTextEdit
      Left = 175
      Top = 227
      Enabled = False
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Black'
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 11
      Width = 396
    end
    object teProcDescription: TcxTextEdit
      Left = 175
      Top = 250
      Enabled = False
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Black'
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 12
      Width = 396
    end
    object teModality: TcxComboBox
      Left = 128
      Top = 111
      Enabled = False
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
      Style.LookAndFeel.SkinName = 'Black'
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 26
      Width = 69
    end
    object teSTATUS: TcxComboBox
      Left = 128
      Top = 273
      Enabled = False
      Properties.Items.Strings = (
        ''
        'IN PROGRESS'
        'DISCONTINUED'
        'COMPLETED')
      Properties.ReadOnly = False
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.Shadow = False
      Style.PopupBorderStyle = epbsDefault
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 27
      Width = 158
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 428
    Align = alClient
    Style.LookAndFeel.SkinName = 'Black'
    StyleDisabled.LookAndFeel.SkinName = 'Black'
    StyleFocused.LookAndFeel.SkinName = 'Black'
    StyleHot.LookAndFeel.SkinName = 'Black'
    TabOrder = 2
    Height = 42
    Width = 593
    object btnClose: TcxButton
      Left = 499
      Top = 9
      Width = 75
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cbSet: TcxButton
      Left = 418
      Top = 9
      Width = 75
      Height = 25
      Caption = #1053#1072#1079#1085#1072#1095#1080#1090#1100
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = cbSetClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
end
