object frmImportPDF: TfrmImportPDF
  Left = 0
  Top = 0
  Caption = #1048#1084#1087#1086#1088#1090
  ClientHeight = 428
  ClientWidth = 675
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
  object cxLabel1: TcxLabel
    Left = 6
    Top = 9
    Caption = 'PatientID :'
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    Transparent = True
  end
  object tePatientID: TcxTextEdit
    Left = 155
    Top = 8
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.TextColor = clBlack
    Style.TextStyle = []
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 1
    Width = 250
  end
  object cxLabel2: TcxLabel
    Left = 6
    Top = 109
    Caption = #1044#1072#1090#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103' :'
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    Transparent = True
  end
  object cxLabel3: TcxLabel
    Left = 6
    Top = 134
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103' :'
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    Transparent = True
  end
  object teOpisStudy: TcxTextEdit
    Left = 155
    Top = 133
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.TextColor = clBlack
    Style.TextStyle = []
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 8
    Width = 496
  end
  object cxLabel4: TcxLabel
    Left = 6
    Top = 159
    Caption = #1060#1048#1054' '#1074#1088#1072#1095#1072' :'
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    Transparent = True
  end
  object teDoctor: TcxTextEdit
    Left = 155
    Top = 158
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.TextColor = clBlack
    Style.TextStyle = []
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 9
    Width = 496
  end
  object cxLabel5: TcxLabel
    Left = 6
    Top = 34
    Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072' :'
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    Transparent = True
  end
  object teFIOpac: TcxTextEdit
    Left = 155
    Top = 33
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.TextColor = clBlack
    Style.TextStyle = []
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 2
    Width = 496
  end
  object cxLabel7: TcxLabel
    Left = 6
    Top = 84
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103' '#1087#1072#1094#1080#1077#1085#1090#1072' :'
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    Transparent = True
  end
  object cxLabel8: TcxLabel
    Left = 6
    Top = 59
    Caption = #1055#1086#1083' '#1087#1072#1094#1080#1077#1085#1090#1072' :'
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    Transparent = True
  end
  object lbFile: TcxLabel
    Left = 6
    Top = 319
    Caption = #1060#1072#1081#1083' :'
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    Transparent = True
  end
  object bteditFile: TcxButtonEdit
    Left = 154
    Top = 315
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = bteditFilePropertiesButtonClick
    TabOrder = 12
    Width = 499
  end
  object btnSave: TcxButton
    Left = 293
    Top = 367
    Width = 74
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 13
    OnClick = btnSaveClick
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Green'
  end
  object btnCancel: TcxButton
    Left = 374
    Top = 367
    Width = 74
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 14
    OnClick = btnCancelClick
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Green'
  end
  object cxPolMan: TcxRadioButton
    Left = 155
    Top = 58
    Width = 76
    Height = 17
    Caption = #1084#1091#1078#1089#1082#1086#1081
    Checked = True
    TabOrder = 3
    TabStop = True
  end
  object cxPolWoMan: TcxRadioButton
    Left = 242
    Top = 58
    Width = 76
    Height = 17
    Caption = #1078#1077#1085#1089#1082#1080#1081
    TabOrder = 4
  end
  object cxRadioButton3: TcxRadioButton
    Left = 329
    Top = 58
    Width = 76
    Height = 17
    Caption = #1080#1085#1086#1077
    TabOrder = 5
    Visible = False
  end
  object deDateBorn: TcxDateEdit
    Left = 155
    Top = 83
    ParentShowHint = False
    Properties.DateButtons = [btnToday]
    Properties.DateOnError = deToday
    Properties.ImmediatePost = True
    Properties.PostPopupValueOnTab = True
    Properties.ShowTime = False
    ShowHint = True
    Style.BorderStyle = ebsOffice11
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.ButtonStyle = btsOffice11
    Style.ButtonTransparency = ebtNone
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 6
    Width = 125
  end
  object deStudyDate: TcxDateEdit
    Left = 155
    Top = 108
    ParentShowHint = False
    Properties.DateButtons = [btnToday]
    Properties.DateOnError = deToday
    Properties.ImmediatePost = True
    Properties.PostPopupValueOnTab = True
    Properties.ShowTime = False
    ShowHint = True
    Style.BorderStyle = ebsOffice11
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.ButtonStyle = btsOffice11
    Style.ButtonTransparency = ebtNone
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 7
    Width = 125
  end
  object GroupBox1: TGroupBox
    Left = 154
    Top = 229
    Width = 497
    Height = 76
    Caption = #1058#1080#1087' '#1092#1072#1081#1083#1072
    TabOrder = 22
    object rbPDF: TRadioButton
      Left = 122
      Top = 24
      Width = 113
      Height = 17
      Caption = 'PDF'
      TabOrder = 0
    end
    object rbBMP: TRadioButton
      Left = 12
      Top = 24
      Width = 113
      Height = 17
      Caption = 'BMP'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object rbJPEG: TRadioButton
      Left = 12
      Top = 47
      Width = 113
      Height = 17
      Caption = 'JPEG'
      TabOrder = 2
    end
    object rbFRM: TRadioButton
      Left = 231
      Top = 24
      Width = 113
      Height = 17
      Caption = 'FRM'
      TabOrder = 3
      Visible = False
    end
    object rbAVI: TRadioButton
      Left = 122
      Top = 47
      Width = 113
      Height = 17
      Caption = 'AVI'
      TabOrder = 4
    end
  end
  object cxLabel21: TcxLabel
    Left = 6
    Top = 185
    Caption = #1052#1086#1076#1072#1083#1100#1085#1086#1089#1090#1100' :'
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    Transparent = True
  end
  object cxMod1: TcxComboBox
    Left = 155
    Top = 183
    ParentShowHint = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.Items.Strings = (
      'CR'
      'CT'
      'MR'
      'NM'
      'US'
      'OT'
      'BI'
      'DG'
      'ES'
      'LS'
      'PT'
      'RG'
      'TG'
      'XA'
      'RF'
      'RTIMAGE'
      'RTDOSE'
      'RTSTRUCT'
      'RTPLAN'
      'RTRECORD'
      'HC'
      'DX'
      'MG'
      'IO'
      'PX'
      'GM'
      'SM'
      'XC'
      'PR'
      'AU'
      'ECG'
      'EPS'
      'HD'
      'SR'
      'IVUS'
      'OP'
      'SMR'
      'AR'
      'KER'
      'VA'
      'SRF'
      'OCT'
      'LEN'
      'OPV'
      'OPM'
      'OAM'
      'RESP'
      'KO'
      'SEG'
      'REG'
      'OPT'
      'BDUS'
      'BMD'
      'DOC'
      'FID'
      'PLAN'
      'IOL'
      'IVOCT')
    Properties.PostPopupValueOnTab = True
    ShowHint = True
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 10
    Text = 'US'
    Width = 125
  end
  object cxLabel20: TcxLabel
    Left = 6
    Top = 209
    Caption = 'AccessionNumber :'
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    Transparent = True
  end
  object cxAccessionNumber1: TcxTextEdit
    Left = 155
    Top = 208
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.TextColor = clBlack
    Style.TextStyle = []
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 11
    Width = 250
  end
  object pbAVI: TProgressBar
    Left = 0
    Top = 412
    Width = 675
    Height = 16
    Align = alBottom
    TabOrder = 25
    Visible = False
  end
  object FileOpenDialog1: TFileOpenDialog
    DefaultExtension = '*.pdf'
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 496
    Top = 72
  end
end
