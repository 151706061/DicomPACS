object frmRegistrAmbPac: TfrmRegistrAmbPac
  Left = 279
  Top = 31
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1085#1072' '#1056#1077#1085#1090#1075#1077#1085'-'#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
  ClientHeight = 656
  ClientWidth = 839
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 833
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
    ExplicitWidth = 835
  end
  object cxLabel1: TcxLabel
    Left = 7
    Top = 47
    Caption = #1055#1072#1094#1080#1077#1085#1090':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextColor = clBlack
    Style.IsFontAssigned = True
  end
  object cxFam: TcxTextEdit
    Left = 85
    Top = 46
    Hint = #1060#1072#1084#1080#1083#1080#1103' '#1087#1072#1094#1080#1077#1085#1090#1072
    AutoSize = False
    ParentFont = False
    ParentShowHint = False
    Properties.Alignment.Vert = taVCenter
    Properties.CharCase = ecUpperCase
    ShowHint = True
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clTeal
    Style.Font.Height = -16
    Style.Font.Name = 'Book Antiqua'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clBtnText
    StyleDisabled.Color = clBtnFace
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clTeal
    StyleFocused.BorderColor = clInactiveCaptionText
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 3
    Text = 'FAM'
    OnClick = cxFamClick
    OnEnter = cxFamEnter
    OnKeyPress = cxFamKeyPress
    Height = 30
    Width = 245
  end
  object cxLabel20: TcxLabel
    Left = 277
    Top = 28
    Caption = #1060#1072#1084#1080#1083#1080#1103
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Book Antiqua'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxName: TcxTextEdit
    Left = 333
    Top = 46
    Hint = #1048#1084#1103' '#1087#1072#1094#1080#1077#1085#1090#1072
    AutoSize = False
    ParentFont = False
    ParentShowHint = False
    Properties.Alignment.Vert = taVCenter
    Properties.CharCase = ecUpperCase
    ShowHint = True
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clTeal
    Style.Font.Height = -16
    Style.Font.Name = 'Book Antiqua'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clBtnText
    StyleDisabled.Color = clBtnFace
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clTeal
    StyleFocused.BorderColor = clInactiveCaptionText
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 5
    Text = 'NAME'
    OnClick = cxNameClick
    OnEnter = cxNameEnter
    OnKeyPress = cxNameKeyPress
    Height = 30
    Width = 245
  end
  object cxLabel21: TcxLabel
    Left = 551
    Top = 28
    Caption = #1048#1084#1103
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Book Antiqua'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxOtch: TcxTextEdit
    Left = 581
    Top = 46
    Hint = #1054#1090#1095#1077#1089#1090#1074#1086' '#1087#1072#1094#1080#1077#1085#1090#1072
    AutoSize = False
    ParentFont = False
    ParentShowHint = False
    Properties.Alignment.Vert = taVCenter
    Properties.CharCase = ecUpperCase
    ShowHint = True
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clTeal
    Style.Font.Height = -16
    Style.Font.Name = 'Book Antiqua'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clBtnText
    StyleDisabled.Color = clBtnFace
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clTeal
    StyleFocused.BorderColor = clInactiveCaptionText
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 8
    Text = 'OTCH'
    OnClick = cxOtchClick
    OnEnter = cxOtchEnter
    OnKeyPress = cxOtchKeyPress
    Height = 30
    Width = 254
  end
  object cxLabel22: TcxLabel
    Left = 785
    Top = 28
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Book Antiqua'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel2: TcxLabel
    Left = 7
    Top = 83
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.:'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextColor = clBlack
    Style.IsFontAssigned = True
  end
  object cxdeRojd: TcxDateEdit
    Left = 85
    Top = 84
    ParentFont = False
    Properties.DateButtons = [btnToday]
    Properties.DateOnError = deToday
    Properties.ImmediatePost = True
    Properties.PostPopupValueOnTab = True
    Properties.ShowTime = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Book Antiqua'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.ButtonTransparency = ebtHideInactive
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clBtnText
    StyleDisabled.BorderStyle = ebsNone
    StyleDisabled.Color = clBtnFace
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clBtnText
    StyleDisabled.TextStyle = [fsBold]
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 9
    OnKeyDown = cxdeRojdKeyDown
    Width = 121
  end
  object bVozrast: TcxButton
    Left = 210
    Top = 84
    Width = 29
    Height = 27
    Hint = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1074#1086#1079#1088#1072#1089#1090' '#1087#1072#1094#1080#1077#1085#1090#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = bVozrastClick
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000F00A0000F00A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000A6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008700009800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000084000A9314009B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000081003FC4
      730B9315009C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000007E003CC26E3FC1710D9617009F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000750041D07340CA7142BF720E9B1800A300000000
      000000000000000000000000000000000000000000000000006E01097E10077E
      0F077E0E0B84160C86170D88180E89180D8A190C851448E37C49E87F44CD7244
      C073109E1B00AA00000000000000000000000000000000000000000000000000
      0378093FCB7736BE6739BF6A3AC06B3CBF6C3DBE6C3EBF6D3EBE6E3EBD6C3FC1
      6B4BE67F4DE98047D07647BF7513A21F00AC0000000000000000000000000000
      000000000000000001750454E6893AD76F3DDA7240DC7442DE7644E17846E37A
      48E57C4AE77E4AE67E4CE67F4CE67F51ED854AD37949BF7615A52100B0000000
      0000000000000000000000000000000000740464E79439D56E3ED77140D97342
      DB7544DD7746DF7948E17B4AE37D4DE6804DE6804FE88250EA8354F0874ED67C
      4CBF7818A92600B50000000000000000000000000000000000760472ECA03AD6
      6D40D97342DB7544DD7746DF7948E17B4AE37D4CE57F4EE7814FE88251EA8454
      ED8755EF8858F48C51DC804FC27D20B03100A900000000000000000000000000
      00780579EEA542D97441DA7443DC7645DE7848E17B4AE37D4CE57F4EE78150E9
      8352EB8553EC8655EE8856EF8959F38C5FFE9556CD8624B23800AA0000000000
      000000000000000000780578EFA64FDC7E3CDB7142DE7644E07845E27947E47B
      4BE77F4DE9814FEB8353ED8755EE8857F08A5AF38D5DF6926BFFA61EAF2D00B5
      000000000000000000000000000000000078057CEFA871E4985EE18961E38D67
      E7916AE9956BEB966FED9870EF9B75EF9E64F09457F18B59F28C5EF7936BFFA5
      22C13400B000000000000000000000000000000000000000017B0774F7A782F1
      AC85F2AF88F4B18CF6B48EF8B591F8B893FABA93FABAA3F9C075F49F58F38D5E
      F7936BFFA720BD3100AA00000000000000000000000000000000000000000000
      0075010C8A180A8915098A1510961F119922129B23139D24139E250C9A1C7FF7
      A865F4945CF7926BFFA61EB82C00AB0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000770083F9AC5BFA936AFFA41BB62B00A9000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000810076FFA869FFA318B22700A600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000086006DFFA915AD2200A40000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000008A0016B0
      2300A80000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000910000AA000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000B100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Green'
  end
  object cxLabel3: TcxLabel
    Left = 7
    Top = 108
    Caption = #1042#1086#1079#1088#1072#1089#1090':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxAge: TcxLabel
    Left = 85
    Top = 110
    Caption = '--'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Book Antiqua'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxLabel16: TcxLabel
    Left = 7
    Top = 130
    Caption = #1055#1086#1083':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxMale: TcxRadioButton
    Left = 85
    Top = 135
    Width = 74
    Height = 17
    Caption = #1052#1091#1078#1089#1082#1086#1081
    TabOrder = 14
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Green'
  end
  object cxFemale: TcxRadioButton
    Left = 165
    Top = 135
    Width = 79
    Height = 17
    Caption = #1046#1077#1085#1089#1082#1080#1081
    TabOrder = 18
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Green'
  end
  object cxLabel4: TcxLabel
    Left = 288
    Top = 82
    Caption = #1050#1052#1053#1057':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel7: TcxLabel
    Left = 288
    Top = 107
    Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object lbCompany: TcxLabel
    Left = 288
    Top = 133
    Caption = #1050#1086#1084#1087#1072#1085#1080#1103':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxKorennoe: TcxLookupComboBox
    Left = 371
    Top = 82
    Hint = #1050#1086#1088#1077#1085#1085#1086#1077' '#1085#1072#1089#1077#1083#1077#1085#1080#1077
    Properties.AutoSelect = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.HideSelection = False
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'FK_ID'
    Properties.ListColumns = <
      item
        FieldName = 'FC_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsKorennoe
    Properties.ReadOnly = False
    Properties.OnChange = cxKorennoePropertiesChange
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.BorderColor = clBtnText
    StyleDisabled.Color = clBtnHighlight
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clBtnText
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 19
    Width = 122
  end
  object cxVidOplat: TcxLookupComboBox
    Left = 371
    Top = 107
    Properties.AutoSelect = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.HideSelection = False
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'FK_ID'
    Properties.ListColumns = <
      item
        FieldName = 'FC_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsVidOplat
    Properties.ReadOnly = False
    Properties.OnChange = cxVidOplatPropertiesChange
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.BorderColor = clBtnText
    StyleDisabled.Color = clBtnHighlight
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clBtnText
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 20
    Width = 122
  end
  object cxCompDogovor: TcxLookupComboBox
    Left = 371
    Top = 132
    Properties.AutoSelect = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.HideSelection = False
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'FK_ID'
    Properties.ListColumns = <
      item
        FieldName = 'FC_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsCompanyName
    Properties.ReadOnly = False
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.BorderColor = clBtnText
    StyleDisabled.Color = clBtnHighlight
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clBtnText
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 22
    Visible = False
    Width = 195
  end
  object cxLabel15: TcxLabel
    Left = 645
    Top = 87
    Caption = #8470' '#1052#1050':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextColor = clBlack
    Style.IsFontAssigned = True
  end
  object cxNum: TcxTextEdit
    Left = 689
    Top = 81
    Hint = #1053#1086#1084#1077#1088' '#1052#1077#1076#1080#1094#1080#1085#1089#1082#1086#1081' '#1050#1072#1088#1090#1099' '#1087#1072#1094#1080#1077#1085#1090#1072
    AutoSize = False
    ParentFont = False
    ParentShowHint = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Properties.CharCase = ecUpperCase
    ShowHint = True
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Book Antiqua'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clBtnText
    StyleDisabled.Color = clBtnFace
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clBtnText
    StyleFocused.BorderColor = clInactiveCaptionText
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 24
    Height = 30
    Width = 146
  end
  object cxLabel5: TcxLabel
    Left = 7
    Top = 159
    Caption = #1055#1088#1086#1078#1080#1074#1072#1077#1090':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxProjivaet: TcxLookupComboBox
    Left = 85
    Top = 160
    Hint = #1055#1088#1086#1078#1080#1074#1072#1077#1090' '#1087#1086#1089#1090#1086#1103#1085#1085#1086
    Properties.AutoSelect = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.HideSelection = False
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'FK_ID'
    Properties.ListColumns = <
      item
        FieldName = 'FC_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsRegPrin
    Properties.ReadOnly = False
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.BorderColor = clBtnText
    StyleDisabled.Color = clBtnHighlight
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clBtnText
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 26
    Width = 191
  end
  object cxLabel6: TcxLabel
    Left = 7
    Top = 200
    Hint = #1040#1076#1088#1077#1089' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1087#1086' '#1084#1077#1089#1090#1091' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
    Caption = #1040#1076#1088#1077#1089':'
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxAddress: TMemo
    Left = 85
    Top = 187
    Width = 750
    Height = 37
    Hint = #1040#1076#1088#1077#1089' '#1087#1088#1086#1087#1080#1089#1082#1080
    TabStop = False
    BorderStyle = bsNone
    Lines.Strings = (
      '')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 27
  end
  object cxOnPhone: TcxCheckBox
    Left = 288
    Top = 158
    Caption = #1079#1072#1087#1080#1089#1072#1085' '#1087#1086' '#1090#1077#1083#1077#1092#1086#1085#1091
    ParentFont = False
    Properties.DisplayChecked = '-1'
    Properties.DisplayUnchecked = '0'
    Properties.DisplayGrayed = 'null'
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = -1
    Properties.ValueGrayed = False
    Properties.ValueUnchecked = 0
    Properties.OnChange = cxOnPhonePropertiesChange
    Style.BorderStyle = ebsOffice11
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 29
    Width = 167
  end
  object cxlKontaktPhone: TcxLabel
    Left = 443
    Top = 157
    Caption = #1058#1077#1083#1077#1092#1086#1085':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Visible = False
  end
  object cxTelefon: TcxTextEdit
    Left = 511
    Top = 159
    Properties.MaxLength = 20
    Properties.ReadOnly = False
    Style.BorderStyle = ebsOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 31
    Visible = False
    Width = 142
  end
  object cxLabel8: TcxLabel
    Left = 7
    Top = 230
    Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxKem: TcxPopupEdit
    Left = 85
    Top = 231
    Properties.PopupControl = paFilter
    Properties.PopupSysPanelStyle = True
    Style.BorderStyle = ebsUltraFlat
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.ButtonStyle = btsDefault
    StyleDisabled.BorderColor = clBtnText
    StyleDisabled.BorderStyle = ebsNone
    StyleDisabled.Color = clBtnFace
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clBtnText
    StyleDisabled.TextStyle = [fsBold]
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 33
    Width = 365
  end
  object cxLabel9: TcxLabel
    Left = 462
    Top = 230
    Caption = #1053#1072#1087#1088#1072#1074#1080#1074#1096#1080#1081':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxVrach: TcxTextEdit
    Left = 567
    Top = 231
    Properties.CharCase = ecUpperCase
    Style.BorderStyle = ebsOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.BorderColor = clBtnText
    StyleDisabled.BorderStyle = ebsNone
    StyleDisabled.Color = clBtnFace
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clBtnText
    StyleDisabled.TextStyle = [fsBold]
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 35
    Width = 193
  end
  object cxLabel19: TcxLabel
    Left = 7
    Top = 255
    Caption = #1044#1080#1072#1075#1085#1086#1079':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxDS: TcxMemo
    Left = 85
    Top = 257
    Hint = #1053#1072#1087#1088#1072#1074#1080#1090#1077#1083#1100#1085#1099#1081' '#1076#1080#1072#1075#1085#1086#1079
    ParentShowHint = False
    Properties.CharCase = ecUpperCase
    ShowHint = True
    Style.BorderStyle = ebsOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.BorderColor = clBtnText
    StyleDisabled.Color = clBtnHighlight
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clBtnText
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 36
    Height = 47
    Width = 750
  end
  object paMetodics: TPanel
    Left = 7
    Top = 305
    Width = 828
    Height = 144
    BevelOuter = bvNone
    TabOrder = 38
    object cxGrListNaz: TcxGrid
      AlignWithMargins = True
      Left = 32
      Top = 0
      Width = 796
      Height = 144
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object TVListNaz: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = TVListNazFocusedRecordChanged
        DataController.DataSource = dsListNaz
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
            FieldName = 'KOLVO'
          end
          item
            Kind = skSum
            FieldName = 'DOZA'
          end
          item
            Kind = skCount
            FieldName = 'FC_NAME'
            Column = VNAMEISSL
          end
          item
            Kind = skSum
            FieldName = 'TIME'
            Column = VTIME
          end
          item
            Kind = skSum
            FieldName = 'KOLVOPRSV'
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object VROWNUM: TcxGridDBColumn
          Caption = #8470' '#1087'/'#1087
          DataBinding.FieldName = 'ROWNUM'
          MinWidth = 29
          Options.Editing = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 29
        end
        object VNAMEISSL: TcxGridDBColumn
          Caption = #1052#1077#1090#1086#1076#1080#1082#1072
          DataBinding.FieldName = 'FC_NAME'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.HideSelection = False
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = VNAMEISSLPropertiesButtonClick
          Options.ShowEditButtons = isebAlways
          Width = 654
        end
        object VTIME: TcxGridDBColumn
          Caption = #1042#1088#1077#1084#1103
          DataBinding.FieldName = 'TIME'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          Width = 73
        end
      end
      object cxGrListNazLevel1: TcxGridLevel
        GridView = TVListNaz
      end
    end
    object dxBarDockControl2: TdxBarDockControl
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 29
      Height = 144
      Margins.Left = 0
      Margins.Top = 0
      Margins.Bottom = 0
      Align = dalLeft
      BarManager = BM
      SunkenBorder = True
      UseOwnSunkenBorder = True
    end
  end
  object cxLabel11: TcxLabel
    Left = 7
    Top = 452
    Caption = #1057#1088#1086#1095#1085#1086#1089#1090#1100':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxUrgent: TcxLookupComboBox
    Left = 85
    Top = 455
    Properties.AutoSelect = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.HideSelection = False
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'FK_ID'
    Properties.ListColumns = <
      item
        FieldName = 'FC_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsUrgent
    Properties.ReadOnly = False
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.BorderColor = clBlack
    StyleDisabled.Color = clWhite
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clBlack
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 40
    Width = 159
  end
  object cxLabel12: TcxLabel
    Left = 7
    Top = 475
    Caption = #1053#1072#1076#1073#1072#1074#1082#1072':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxNadbavka: TcxLookupComboBox
    Left = 85
    Top = 476
    Properties.AutoSelect = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.HideSelection = False
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'FK_ID'
    Properties.ListColumns = <
      item
        FieldName = 'FC_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsNadbavka
    Properties.ReadOnly = False
    Properties.OnChange = cxNadbavkaPropertiesChange
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.BorderColor = clBlack
    StyleDisabled.Color = clWhite
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clBlack
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 42
    Width = 159
  end
  object cxLabel13: TcxLabel
    Left = 321
    Top = 452
    Caption = #1062#1077#1083#1100':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxTarget: TcxLookupComboBox
    Left = 404
    Top = 455
    Properties.AutoSelect = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.HideSelection = False
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'FK_ID'
    Properties.ListColumns = <
      item
        FieldName = 'FC_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsTarget
    Properties.ReadOnly = False
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.BorderColor = clBlack
    StyleDisabled.Color = clWhite
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clBlack
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 43
    Width = 159
  end
  object cxCheckGroup1: TcxCheckGroup
    Left = 7
    Top = 498
    Caption = #1040#1088#1093#1080#1074
    ParentFont = False
    Properties.Items = <>
    Style.BorderStyle = ebsOffice11
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 45
    Height = 100
    Width = 237
  end
  object cxLabel27: TcxLabel
    Left = 10
    Top = 524
    Caption = #8470' '#1076#1080#1089#1082#1072':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxNumDisk: TcxTextEdit
    Left = 85
    Top = 526
    Properties.CharCase = ecUpperCase
    Properties.MaxLength = 20
    Style.BorderStyle = ebsOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 47
    Width = 151
  end
  object cxLabel28: TcxLabel
    Left = 10
    Top = 548
    Caption = #8470' '#1082#1086#1088#1086#1073#1082#1080':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxNumKorob: TcxTextEdit
    Left = 85
    Top = 550
    Properties.CharCase = ecUpperCase
    Properties.MaxLength = 20
    Style.BorderStyle = ebsOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 49
    Width = 151
  end
  object cxLabel29: TcxLabel
    Left = 10
    Top = 574
    Caption = #1040#1088#1093#1080#1074'('#1094#1080#1092#1088#1072'):'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxCifraArchive: TcxLookupComboBox
    Left = 109
    Top = 575
    Properties.AutoSelect = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.HideSelection = False
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'FK_ID'
    Properties.ListColumns = <
      item
        FieldName = 'FC_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsCifraArchive
    Properties.ReadOnly = False
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 50
    Width = 127
  end
  object cxDez: TcxCheckBox
    Left = 7
    Top = 603
    Caption = #1044#1077#1078#1091#1088#1089#1090#1074#1086
    ParentFont = False
    Properties.DisplayChecked = '-1'
    Properties.DisplayUnchecked = '0'
    Properties.DisplayGrayed = 'null'
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = -1
    Properties.ValueGrayed = False
    Properties.ValueUnchecked = 0
    Style.BorderStyle = ebsOffice11
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.TextStyle = []
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 52
    Width = 112
  end
  object cxLbDays: TcxLabel
    Left = 7
    Top = 628
    Caption = #1055#1088#1077#1076#1091#1087#1088#1077#1078#1076#1077#1085#1080#1077'!'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clRed
    Style.Font.Height = -13
    Style.Font.Name = 'Book Antiqua'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Visible = False
  end
  object cxCheckGroup2: TcxCheckGroup
    Left = 320
    Top = 498
    Caption = #1050#1086#1084#1091' '#1074#1099#1076#1072#1085#1086
    ParentFont = False
    Properties.Items = <>
    Style.BorderStyle = ebsOffice11
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.SkinName = 'Office2007Green'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 54
    Height = 100
    Width = 515
  end
  object cxLabel25: TcxLabel
    Left = 329
    Top = 523
    Caption = #1050#1086#1083'-'#1074#1086' '#1083#1080#1089#1090#1086#1074':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxKolvoVidano: TcxSpinEdit
    Left = 429
    Top = 525
    Properties.AssignedValues.MinValue = True
    Properties.CanEdit = False
    Properties.MaxValue = 99.000000000000000000
    Style.BorderStyle = ebsUltraFlat
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 56
    Width = 41
  end
  object cxLabel: TcxLabel
    Left = 478
    Top = 524
    Caption = #1050#1091#1076#1072' '#1074#1099#1076#1072#1085#1086':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxOtdelVydano: TcxLookupComboBox
    Left = 571
    Top = 525
    Hint = #1042#1099#1076#1072#1085#1086' '#1074' '#1086#1090#1076#1077#1083#1077#1085#1080#1077
    Properties.AutoSelect = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.HideSelection = False
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'FK_ID'
    Properties.ListColumns = <
      item
        FieldName = 'FC_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsOtdelVydano
    Properties.ReadOnly = False
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 58
    Width = 251
  end
  object cxLabel26: TcxLabel
    Left = 330
    Top = 547
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxRemark: TcxTextEdit
    Left = 429
    Top = 549
    Properties.CharCase = ecUpperCase
    Properties.MaxLength = 40
    Style.BorderStyle = ebsOffice11
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 60
    Width = 393
  end
  object cxLabel30: TcxLabel
    Left = 330
    Top = 572
    Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxDateVydano: TcxDateEdit
    Left = 429
    Top = 574
    Properties.ImmediatePost = True
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.BorderColor = clBtnText
    StyleDisabled.Color = clBtnHighlight
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clBtnText
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 62
    OnKeyDown = cxdeRojdKeyDown
    Width = 121
  end
  object cxLabel31: TcxLabel
    Left = 588
    Top = 572
    Caption = #1044#1072#1090#1072' '#1074#1086#1079#1074#1088#1072#1090#1072':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxDateVozvrat: TcxDateEdit
    Left = 687
    Top = 574
    Properties.ImmediatePost = True
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.BorderColor = clBtnText
    StyleDisabled.Color = clBtnHighlight
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clBtnText
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 64
    OnKeyDown = cxdeRojdKeyDown
    Width = 135
  end
  object cxLabel14: TcxLabel
    Left = 557
    Top = 603
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1090#1086#1088':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxRegistrator: TcxLookupComboBox
    Left = 670
    Top = 604
    Properties.AutoSelect = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.HideSelection = False
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'FK_ID'
    Properties.ListColumns = <
      item
        FieldName = 'FC_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsRegistrator
    Properties.ReadOnly = False
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 66
    Width = 165
  end
  object cxLabel23: TcxLabel
    Left = 557
    Top = 628
    Caption = #1056#1077#1085#1090#1075#1077#1085#1083#1072#1073#1086#1088#1072#1085#1090':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxRgLaborant: TcxLookupComboBox
    Left = 670
    Top = 629
    Properties.AutoSelect = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.HideSelection = False
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'FK_ID'
    Properties.ListColumns = <
      item
        FieldName = 'FC_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsRgLaborant
    Properties.ReadOnly = False
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 67
    Width = 165
  end
  object paFilter: TPanel
    Left = 912
    Top = 47
    Width = 360
    Height = 219
    Caption = 'paFilter'
    TabOrder = 69
    object cxKemNapravlen: TcxDBTreeList
      Left = 1
      Top = 25
      Width = 358
      Height = 193
      Align = alClient
      Bands = <
        item
        end>
      BufferedPaint = False
      DataController.DataSource = dsKemNapravlen
      DataController.ParentField = 'FK_OWNER'
      DataController.KeyField = 'FK_ID'
      LookAndFeel.Kind = lfFlat
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Headers = False
      OptionsView.Indicator = True
      RootValue = -1
      TabOrder = 0
      OnDblClick = cxKemNapravlenDblClick
      OnKeyDown = cxKemNapravlenKeyDown
      object cxDBTreeListColumn1: TcxDBTreeListColumn
        Caption.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 358
      Height = 24
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object cxLabel24: TcxLabel
        Left = 8
        Top = 3
        Caption = #1060#1080#1083#1100#1090#1088':'
      end
      object teFilter: TcxTextEdit
        Left = 54
        Top = 2
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 1
        OnClick = teFilterClick
        OnEnter = teFilterEnter
        OnKeyUp = teFilterKeyUp
        Width = 299
      end
    end
  end
  object cxLabel32: TcxLabel
    Left = 574
    Top = 453
    Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxGra: TcxLookupComboBox
    Left = 676
    Top = 454
    Hint = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
    Properties.AutoSelect = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.HideSelection = False
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'FK_ID'
    Properties.ListColumns = <
      item
        FieldName = 'FC_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsGra
    Properties.ReadOnly = False
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.BorderColor = clBlack
    StyleDisabled.Color = clWhite
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clBlack
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 71
    Width = 159
  end
  object cxLabel33: TcxLabel
    Left = 574
    Top = 475
    Caption = #1057#1086#1094'. '#1089#1090#1072#1090#1091#1089':'
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxStatus: TcxLookupComboBox
    Left = 676
    Top = 476
    Hint = #1057#1086#1094#1080#1072#1083#1100#1085#1099#1081' '#1089#1090#1072#1090#1091#1089
    Properties.AutoSelect = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.HideSelection = False
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'FK_ID'
    Properties.ListColumns = <
      item
        FieldName = 'FC_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsStatus
    Properties.ReadOnly = False
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.BorderColor = clBlack
    StyleDisabled.Color = clWhite
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.TextColor = clBlack
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 73
    Width = 159
  end
  object lbKons: TcxLabel
    Left = 109
    Top = 606
    Caption = #1050#1086#1085#1089#1091#1083#1100#1090#1072#1090#1080#1074#1085#1072#1103'!'
    ParentColor = False
    ParentFont = False
    Style.Color = clBtnFace
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clRed
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Visible = False
  end
  object pueVidOplat: TcxPopupEdit
    Left = 371
    Top = 106
    Properties.PopupControl = grVidOplat
    Properties.PopupSysPanelStyle = True
    Properties.OnChange = pueVidOplatPropertiesChange
    TabOrder = 74
    Width = 195
  end
  object grVidOplat: TcxGrid
    Left = 848
    Top = 371
    Width = 353
    Height = 200
    TabOrder = 77
    object grdbtvVidOplat: TcxGridDBTableView
      OnDblClick = grdbtvVidOplatDblClick
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsVidOpl
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Preview.Column = grdbtvVidOplatFC_NAME
      Preview.Visible = True
      object grdbtvVidOplatFK_ID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_ID'
        Visible = False
        VisibleForCustomization = False
      end
      object grdbtvVidOplatFK_PEPLID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_PEPLID'
        Visible = False
        VisibleForCustomization = False
      end
      object grdbtvVidOplatFC_TYPEDOC: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'FC_TYPEDOC'
        Width = 93
      end
      object grdbtvVidOplatSER_NUM: TcxGridDBColumn
        Caption = #1057#1077#1088#1080#1103' '#1053#1086#1084#1077#1088
        DataBinding.FieldName = 'SER_NUM'
        Width = 114
      end
      object grdbtvVidOplatFC_DOGOVOR: TcxGridDBColumn
        DataBinding.FieldName = 'FC_DOGOVOR'
        Visible = False
        VisibleForCustomization = False
      end
      object grdbtvVidOplatFL_OLD: TcxGridDBColumn
        DataBinding.FieldName = 'FL_OLD'
        Visible = False
        VisibleForCustomization = False
      end
      object grdbtvVidOplatFD_DATE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1086#1090#1082#1088#1099#1090#1080#1103
        DataBinding.FieldName = 'FD_DATE'
        Width = 48
      end
      object grdbtvVidOplatFD_END: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103
        DataBinding.FieldName = 'FD_END'
        Width = 48
      end
      object grdbtvVidOplatFC_NAME: TcxGridDBColumn
        DataBinding.FieldName = 'FC_NAME'
      end
      object grdbtvVidOplatFN_ORDER: TcxGridDBColumn
        DataBinding.FieldName = 'FN_ORDER'
        Visible = False
        VisibleForCustomization = False
      end
      object grdbtvVidOplatFL_NOTDOC: TcxGridDBColumn
        DataBinding.FieldName = 'FL_NOTDOC'
        Visible = False
        VisibleForCustomization = False
      end
      object grdbtvVidOplatFC_SYNONIM: TcxGridDBColumn
        DataBinding.FieldName = 'FC_SYNONIM'
        Visible = False
        VisibleForCustomization = False
      end
      object grdbtvVidOplatTYPEID: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEID'
        Visible = False
        VisibleForCustomization = False
      end
      object grdbtvVidOplatTYPEOPL: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEOPL'
        Visible = False
        VisibleForCustomization = False
      end
      object grdbtvVidOplatFC_FULL_STRAH: TcxGridDBColumn
        DataBinding.FieldName = 'FC_FULL_STRAH'
        Visible = False
        VisibleForCustomization = False
      end
      object grdbtvVidOplatFK_COMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_COMPANYID'
        Visible = False
        VisibleForCustomization = False
        Width = 48
      end
      object grdbtvVidOplatISSERTIFICAT: TcxGridDBColumn
        DataBinding.FieldName = 'ISSERTIFICAT'
        Visible = False
        VisibleForCustomization = False
      end
    end
    object grlVidOplat: TcxGridLevel
      GridView = grdbtvVidOplat
    end
  end
  object teNumNapravl: TcxTextEdit
    Left = 689
    Top = 132
    TabOrder = 80
    Visible = False
    Width = 146
  end
  object lNumNapravl: TcxLabel
    Left = 583
    Top = 133
    Caption = #8470' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taRightJustify
    Visible = False
    AnchorX = 683
  end
  object BM: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = False
    Left = 688
    Top = 280
    DockControlHeights = (
      0
      0
      0
      0)
    object BMBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Main'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 404
      FloatTop = 232
      FloatClientWidth = 23
      FloatClientHeight = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbSave'
        end
        item
          Visible = True
          ItemName = 'bbCancel'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbHistory'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbAgree'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'lbDoza'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Main'
      OneOnRow = True
      Row = 0
      UseOwnFont = True
      Visible = True
      WholeRow = True
    end
    object BMBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Metodics'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 229
      FloatTop = 31
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bAdd'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bDel'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton3'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbSave: TdxBarButton
      Action = aSave
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbCancel: TdxBarButton
      Action = aCancel
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrint: TdxBarButton
      Action = aPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbHistory: TdxBarButton
      Action = aHistory
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000A56E6E
        9B67679A6666976565A16E6E0000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000008C
        0000A77676C59292C99797B27F7FAA7676A06E6EA16B6BA46D6DA56E6EA46E6E
        0000000000000000000000000000000000000000000000000000000000000000
        00000000DD9393A07272CA9B9BFFDFDFCA9797C39A9AD3B0B0C08F8FB37E7EAF
        7A7AA773739F6A6AA26A6AA26C6CA66D6D000000000000000000000000000000
        000000000000000000B26868A26E6ED1A6A6FFDFDFFFD9D9CB9A9ACFAEAEFFFF
        FFFFFBFBFEEEEEE7CACAD4ACACC29090B58080AC797998646400000000000000
        0000000000000000000000000000C88484A67272DAB3B3FFE3E3FFD8D8FFD9D9
        CF9C9CCDADADFFFDFDFFF6F6FFF6F6FFF7F7FFF8F8FFF8F8FEE3E3B27D7D9864
        64000000000000000000000000000000000000BA7F7FAA7575E2BFBFFFE7E7FF
        DCDCFFD9D9FFD8D8D0A2A2CCABABFFFFFFFFF8F8FFFBFBFFFAFAFFF7F7FFF5F5
        FFEEEEB07C7C966464000000000000000000000000000000000000AE7A7AE5C5
        C5FFEAEAFFE1E1FFDCDCFFD9D9FFD8D8D4A5A5CAAAAAFFFFFFFFFFFFC1A4A4D5
        BCBCF3E2E2FFF7F7FFF1F1B37D7D996666000000000000000000000000000000
        000000AD7878F9DBDBFFE4E4FFE0E0FFDBDBFFD8D8FFD8D8D8AAAACBACACFFFF
        FFFFFFFF794949B09191A98787FFFEFEFFF6F6B37D7D9A676700000000000000
        0000000000000000000000AF7979F8DBDBFFE0E0FFDCDCFFD9D9FFD6D6FFD6D6
        DBAFAFBD8F8FD5BABAE7DADACDBBBBFFFFFFBC9F9FFFFFFFFFFDFDB480809B69
        69000000000000000000000000000000000000AF7B7BFBD9D9FFDDDDFFDADAFF
        D7D7FFD5D5FFD5D5DEB2B2C59191C28B8BC18989BA8383BE8F8FCEACACDBC1C1
        F1E3E3B783839E6A6A000000000000000000000000000000000000B27E7EFDD9
        D9FFDADAFFD7D7FFD5D5FFD2D2FFD2D2E0B5B5DBBDBDFFFBFBF1DCDCE4C5C5DA
        AEAECD9999C28C8CBD8686C18E8E9E6D6D000000000000000000000000000000
        000000B28080FED6D6FFD5D5FFD4D4FFD2D2FFD0D0FFCECEE4BBBBD7BABAFFFB
        FBFFF7F7FFF8F8FFF8F8FFF7F7FFEEEEF7D9D9C896969F6D6D00000000000000
        0000000000000000000000B68181FFD3D3FFD3D3FFD0D0FFCFCFFECDCDFFCCCC
        E6BFBFD7B9B9FFFDFDFFF7F7FFF8F8FFF6F6FFF4F4FFF3F3FFF6F6CA9696A36F
        6F000000000000000000000000000000000000B68282FFD1D1FFCECEFECDCDFF
        CDCDFCC9C9FBC7C7E9C2C2D6B8B8FFFFFFFFFCFCEDDEDEFCEFEFFFFDFDFFF5F5
        FFF7F7CA9595A47171000000000000000000000000000000000000BB8686FFCF
        CFFECCCCFCC9C9FAC7C7F8C5C5F7C4C4EDC7C7D5B8B8FFFFFFFFFFFF90686885
        5959B69696FFF5F5FFFAFAC89494A67373000000000000000000000000000000
        000000BB8A8AFECBCBFAC6C6F7C5C5F6C3C3F4C1C1F2C1C1EFCBCBCFB2B2FFFF
        FFFFFFFF906868FFFFFFAA8686FDF4F4FFFFFFC89494AA777700000000000000
        0000000000000000000000BF8C8CF8C7C7F4C1C1F3C0C0F1BEBEEFBCBCEEBDBD
        F6DADAD7A5A5C68F8FCB9D9DD4B2B2D9BFBFDAC4C4F2E7E7FFFFFFC79595AC79
        79000000000000000000000000000000000000C19090F4C0C0EFBCBCEEBBBBEC
        B7B7F3CECEFDE8E8FFE5E5FFE8E8FFE6E6FBD9D9F4CCCCEAC0C0DFB0B0CC9898
        C08A8AC99696AD7A7A000000000000000000000000000000000000C69393EEBA
        BAE9B4B4EFC3C3FBE6E6FFEAEAFFE4E4FFE2E2FFE0E0FFDEDEFFDCDCFFDBDBFF
        DADAFFDCDCFFDEDEF4C7C7C69595B17C7C000000000000000000000000000000
        000000C89494ECBDBDF9E2E2FFF3F3FFECECFFE9E9FFE6E6FFE4E4FFE2E2FFDF
        DFFFDFDFFFE0E0FAD3D3DBADADC08B8BB98282C3868698747400000000000000
        0000000000000000000000C69494D9B1B1DEBBBBE5C3C3EBCCCCF3D6D6F9E0E0
        FFE7E7FFE8E8FFE0E0E4BDBDCA9A9AC08989C38A8AD290900000000000000000
        00000000000000000000000000000000000000C99191C29393C38E8EC49191C1
        8C8CBF8C8CBE8989BE8888C29090BD8888B88585C88F8F000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
    object bbAgree: TdxBarButton
      Action = aAgree
      Category = 0
      ButtonStyle = bsDropDown
      DropDownMenu = dxBarPopupMenu1
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000DA6600CC6600C86000CA6200CC6700D06D06
        DC9144987D615E58515D575259545056524F52514F4242424040403C3C3C3535
        35000000000000000000000000000000EE7300DF7205DA801DD57714E79E44EE
        AF59F0B15CEFB05AF6D09B67625CFAF7F3FEFCF8FEFBF7EBCBB9F3F0ECFEFAF7
        FFFDFCF7F7F7393939000000000000000000000000000000E67D10EDAE53EFAF
        58E09034E9A34EF1B262F0B262F1B566F6C99166615EFBF5EEFEFAF4F5E5D9AD
        460DC5A18DFCF7F0FCF6EFFCFBF93D3D3D000000000000000000000000000000
        E3770BEEAF56EEAD59F1B465F3B66BF4B86EF6BC76E39641EAA46360606AF9F1
        EAFCF6EDC87D4FA33D00B05117DFD5CBFBF4EAFCF9F73F3F3F00000000000000
        0000000000000000DF6D00EFB05EF1B262F2B56BF4BB74F8C382DC872EE49034
        CFA38660606EEFE9EAE7B89AA84101A53F00AA4200BC7A4FF3EADEFCFAF84343
        43000000000000000000000000000000DF6900EAA34EF2B56AF5B972F9C384DE
        8933E49746FFC57EBC968C646472EAD8D5B05113AA4501D59C76AF4503B34802
        C7A68DFBFBFB464646000000000000000000000000000000EB6F00DB8426F5BB
        71F7BD78EEAB62DD8833FFD4A3EC9C45CDBEC1676572BF713BAC4600D28A54F8
        E9DAD89664AF4800BB5916D1CCC84A4A4A000000000000000000000000000000
        000000DB6A00F0B063F8C281F5BA79D67A20FFD5A5DA7913E1E6F6925633AD47
        00BA611DF7E3CDF5E2CEF9E7D0BE6521B54D00BA6B3246464600000000000000
        0000000000000000000000ED7500D2710AE1913AD47717E39140FDC68BDD8B35
        D3D9F8AA561EB14E04886954757069736C65736D6683654EB65001BB51007E43
        14000000000000000000000000000000000000000000E67300CE6600D77E22FC
        C27CF4993ABDB2A375A1F9A87665E9C6AAEEB370F1C38AE3A566F6C597000000
        D6894ABA5300C35700672C000000000000000000000000000000000000000000
        00DC4200DD6100BE68124596E73AA5FF60B6FF9BC4E866B8FF7A7F84DD5F00E7
        6B00000000000000000000C46A1CBE5800C05700B25200000000000000000000
        00000000000000000000000023A7FF2B9DFF5BB6FF67B9FF68B9FF75C0FF64B8
        FF41A9FF29A9FF000000000000000000000000000000C26009C15B00D5640000
        000000000000000000000000000000000000000034A5FF5EB4FF6CBCFF70C0FF
        73C0FF71BFFF6CBCFF69BAFF38A5FF0000000000000000000000000000000000
        00C65E02D466000000000000000000000000000000000000000070AA3B9EF873
        C1FF77C2FF7DC6FF81C8FF7FC8FF78C4FF70C0FF47A7FF33A7FF000000000000
        000000000000000000000000D269000000000000000000000000000000000000
        00006CA2419ADB489FDA81CAFF88CEFF8FD1FF8ACFFF80C9FF76C3FF51ABFF34
        A6FF000000000000000000000000000000000000000000000000000000000000
        0000000000000000000071A80C6DA2005C8D8AD1FF90D3FF9BDAFF93D4FF86CD
        FF7BC6FF52ACFF30A3FF00000000000000000000000000000000000000000000
        00000000000000000000000000000000000079A80076A90070A353A3D996D9FF
        9EDCFF91D3FF76C0F466B4EE4AA8FF37A9FF0000000000000000000000000000
        000000000000000000000000000000000000000000000000000078B0008FC200
        8CBF0072A600699C00699C00669900689A00689A00679A006BAC000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000070A80094C7008FC2008EC1008ABD0086B90082B5007DB0007AAD006DA100
        77B1000000000000000000000000000000000000000000000000000000000000
        0000000000000000000073AF007FB20095C8008FC2008ABD0086B90083B6007E
        B1007AAD006EA600000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000071AC0075AA0095C8008EC1
        008ABD0085B80078AB006A9B0079AF0000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        69A300679B006FA2006EA10067990064980059A0000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
    object lbDoza: TcxBarEditItem
      Caption = #1044#1086#1079#1072
      Category = 0
      Hint = #1044#1086#1079#1072
      Style = frmMain.stSumDoza
      Visible = ivNever
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000AB9000BB10312B90311B6
        010EB6020DB3020EB2020CB1020BB0020BAF0004A30000A50000000000000000
        00000000000000000000000000000000000000000000000000000AD2000CB812
        3DF1174DFF154BFF164AFF1549FF1248FF1147FF1046FF1046FF0A33EC0005A5
        0000BE000000000000000000000000000000000000000000000000000000000A
        D2000FBB1440F1194DFF1949FF1748FF1647FF1546FF1345FF1244FF1143FF0F
        43FF0F43FF0A32EC0004A50000BE000000000000000000000000000000000000
        000000000ADE0011BF1843F21C50FF1B4CFF1A4BFF194AFF1849FF1748FF1547
        FF1446FF1345FF1143FF1042FF0F43FF0A34ED0006A70000BE00000000000000
        00000000000000000017DD0013C61A45F32053FF1E4FFF1D4EFF1C4DFF1B4CFF
        1A4BFF194AFF1749FF1648FF1547FF1345FF1244FF1042FF0F44FF0A34ED0006
        A90000BE0000000000000000000014DD0016CA1C48F42355FF2252FF2051FF1F
        50FF1E4FFF1D4FFF1C4DFF1B4CFF194BFF184AFF1748FF1547FF1345FF1244FF
        1042FF0F43FF0A33ED0007AA0000B20000000000000018CD1E4AF52758FF2356
        FF2354FF2253FF2152FF2052FF1F51FF1E4FFF1D4EFF1B4DFF1A4BFF184AFF17
        49FF1547FF1345FF1244FF1043FF0F43FF0A34EE0009AC0000000000000422D6
        2B5DFF2657FF2254FF174CFF154AFF1C50FF2053FF1649FF174BFF1D4FFF1549
        FF0D41FF0D43FF1547FF0C40FF0B3FFF1245FF1143FF0F43FF1046FF0210B800
        00000000000322D72C60FF2656FF5078FFE6ECFFF2F5FF7998FF1147FFDDE5FF
        9FB3FF1044FF7A97FFF3F5FFD2DBFF1347FFBBCAFFB6C6FF0B3FFF1345FF1143
        FF1045FF0211BB0000000000000524DA3061FF2155FFCCD8FFDFE6FFB5C6FFFF
        FFFF053DFFFFFFFFBFCDFF033DFFFFFFFFBECDFFFFFFFF7190FFDFE7FFDDE5FF
        0137FF1346FF1244FF1146FF0213BD0000000000000427DE3263FF2A5BFF4973
        FF85A2FFFBFDFFE6EBFF0840FFFFFFFFBDCAFF033BFFFFFFFFABBEFFFFFFFF79
        97FFDAE1FFEBF0FF6586FF1547FF1244FF1247FF0214C10000000000000427E2
        3465FF285AFF8BA6FFFFFFFFE5EBFF3564FF1248FFFFFFFFBBCBFF033CFFFFFF
        FFADBFFFFFFFFF7998FFD9E0FFEEF2FFFFFFFF8EA6FF0D40FF1548FF0115C200
        00000000000529E33869FF2659FFDFE6FFE0E8FF90AAFFA7BCFF2E5EFFFFFFFF
        C6D3FF1C4FFFFFFFFFACBFFFFFFFFF7997FFDBE3FFC5D2FFDFE7FF96ADFF0D40
        FF1649FF0117C7000000000000052CE7396BFF2E5EFF97AFFFFFFFFFFFFFFF8F
        A9FFF1F4FFFFFFFFFFFFFFB6C6FFAFC2FFFFFFFFFFFFFF2D5CFFECF1FFFFFFFF
        FFFFFF567BFF1244FF154AFF0318C8000000000000052DEA3E6EFF3767FF2D60
        FF3262FF3363FF3162FF3261FF2D5FFF285AFF2557FF1C4FFF2759FF1B4DFF1C
        4FFF1348FF0D42FF0B40FF1446FF1849FF174CFF0319CC0000000000000026EA
        305FFB3C6DFF3868FF3867FF3B6AFF406DFF4672FF4671FF3F6BFF3563FF2C5C
        FF2859FF2657FF2355FF2152FF1F50FF1D4EFF1B4CFF194DFF123FF50015C800
        00000000000027FF0026ED315FFA3D6EFF3A69FF3D6BFF426FFF4874FF4973FF
        406DFF3664FF2D5DFF295AFF2757FF2455FF2253FF2051FF1E4FFF1C50FF1441
        F50018CF0015DD0000000000000000000029FF0027EE3260FB3E6DFF3D6BFF42
        6FFF446FFF436EFF3D6BFF3564FF2D5DFF2A5AFF2858FF2556FF2354FF2252FF
        1F53FF1744F6001AD30016EA0000000000000000000000000000000029FF0029
        F13260FB3E6DFF3D6BFF3F6BFF3C6AFF3966FF3161FF2D5DFF2B5BFF2859FF26
        57FF2356FF2355FF1A46F7001DD70015F7000000000000000000000000000000
        0000000000000029FF0029F2315FFC3D6CFF3868FF3666FF3363FF3060FF2E5E
        FF2B5CFF2959FF2657FF2758FF1C49F9001FDD0022F700000000000000000000
        00000000000000000000000000000000000029FF002BF33060FC3E6DFF396AFF
        3868FF3464FF3262FF3060FF2C5FFF2C5DFF1E4CFA0021E10022F60000000000
        000000000000000000000000000000000000000000000000000000000026FF00
        2BF30532F30530F10530F0042FEF042EED052DED032CEA042CEA0024E5001FF2
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ShowCaption = True
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
      CanSelect = False
      StyleEdit = frmMain.stSumDoza
    end
    object bbAgree1: TdxBarButton
      Action = aAgree
      Category = 0
    end
    object bbAgreeProc: TdxBarButton
      Action = aAgreeProc
      Category = 0
    end
    object bAdd: TdxBarButton
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1077#1090#1086#1076#1080#1082#1091' '#1074' '#1089#1087#1080#1089#1086#1082
      Visible = ivAlways
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00C6C6C6008484840084848400848484008484
        8400C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00C6C6C6008484840000840000008400008484
        8400C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00C6C6C6008484840000840000008400008484
        8400C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00C6C6C6008484840000840000008400008484
        8400C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C6008484840000840000008400008484
        8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
        8400848484008484840084848400848484008484840000840000008400008484
        84008484840084848400848484008484840084848400C6C6C600C6C6C6000084
        0000008400000084000000840000008400000084000000840000008400000084
        00000084000000840000008400000084000000840000C6C6C60000FF00000084
        0000008400000084000000840000008400000084000000840000008400000084
        0000008400000084000000840000008400000084000000FF000000FF00000084
        0000008400000084000000840000008400000084000000840000008400000084
        0000008400000084000000840000008400000084000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF00000084000000840000008400000084
        000000FF000000FF000000FF000000FF000000FF000000FF0000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000FF00000084000000840000008400000084
        000000FF0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000FF00000084000000840000008400000084
        000000FF0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000FF00000084000000840000008400000084
        000000FF0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000FF00000084000000840000008400000084
        000000FF0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000FF000000FF000000FF000000FF000000FF
        000000FF0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      OnClick = bAddClick
    end
    object bDel: TdxBarButton
      Category = 0
      Hint = 
        #1059#1076#1072#1083#1080#1090#1100' '#1084#1077#1090#1086#1076#1080#1082#1091' '#1080#1079' '#1089#1087#1080#1089#1082#1072#13#10#1042#1085#1080#1084#1072#1085#1080#1077'!'#13#10#1059#1076#1072#1083#1080#1090#1100' '#1084#1077#1090#1086#1076#1080#1082#1091' '#1084#1086#1078#1077#1090' '#1090#1086 +
        #1083#1100#1082#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082', '#1089#1086#1079#1076#1072#1074#1096#1080#1081' '#1077#1105'!'
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000A40206B0030AAE0000A600009800000000
        00000000000000000000A700009A0000A70000000000000000000000000000A9
        1844F6194DF81031D20102AB0000B60000000000000000B10928D7092ED70313
        B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
        00B00000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
        1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
        F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
        52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
        0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
        AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
        5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
        0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
        A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
        6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
        0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
        C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
        13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
        000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
        FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
        00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
        0000000000000000CF0000C00000CE0000000000000000000000000000C40001
        B80000B500007700000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      OnClick = bDelClick
    end
    object dxBarButton3: TdxBarButton
      Action = aZakl
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00303030FF858A
        8BFFE2EBEEFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008F8F8FFF4F4F
        4FFF739BA6FF9EE4FFFF98E1FFFF87D8FFFF638EA8FFFF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009C9D9DFF7C7C
        7CFFB5EEFFFFB4EDFFFFB5EDFFFFB2ECFFFF73C8FEFF546A7BFFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B8D2DBFFB7EC
        FFFFC3F1FFFFC3F1FFFFC3F1FFFFC0F0FFFF92DBFEFF6FC6FEFF5F7383FFFF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B4E9
        FFFFD1F6FFFFD1F6FFFFD0F5FFFFBAECFFFF71CBF5FF8EDBFCFF73C8FEFF555B
        62FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A0DF
        FFFFDBF8FFFFDAF8FFFFC5EFFFFF5EB7FDFF5EBCF8FF6EC8F5FF8CDAFBFF79CC
        FFFF62DCEEFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0072A6
        BCFFB0E6FEFF89D1FBFF3CA3FAFF3DA2FEFF4DACFEFF5DBBF9FF6DC8F5FF8BD9
        FAFF7DCEFFFF35474AFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF007DB6D5FF1898E9FF249AF2FF309CF9FF3CA0FEFF4BABFEFF5CB9F9FF6BC6
        F5FF88D8F9FF81D1FFFF7C6156FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00B1CDDEFF1798E9FF239AF2FF2F9CF9FF3AA0FEFF4AAAFEFF5BB8
        FAFF6AC6F5FF85D7F9FF82D0FCFFC59782FFFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00AFB8BCFF1797E6FF2299F0FF2E9BF8FF3A9FFEFF49A9
        FEFF59B7FAFF68C4F6FF82D5F8FF3E494EFF8A7D78FFFF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001C95DEFF2099F0FF2D9BF8FF399F
        FDFF47A8FEFF58B5FBFF6AB2D8FF393939FF444443FFF8F7F7FFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002D95D3FF1F99EFFF2C9B
        F7FF389FFDFF62B4FEFFBBBBBFFF4F4F50FF464551FF827DC6FFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003D8AB8FF2099
        EDFF6D97BAFFB3B3B6FF8F8F91FFC1C1C5FF7D6FDAFF938ACEFFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B2B8
        BCFFBCBCBCFF7F7F7FFFCAC9CDFFA48FDBFF846BC9FFDDD8EEFFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF009C999FFF7B63A6FF9478BDFF8667B4FF846EB2FFFF00FF00}
    end
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 720
    Top = 282
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1086' '#1087#1072#1094#1080#1077#1085#1090#1077
      ImageIndex = 23
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 22
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Enabled = False
      Hint = #1055#1077#1095#1072#1090#1100
      ImageIndex = 10
      ShortCut = 16464
      Visible = False
      OnExecute = aPrintExecute
    end
    object aHistory: TAction
      Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
      Hint = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1087#1086' '#1087#1072#1094#1080#1077#1085#1090#1091
      ShortCut = 16450
      OnExecute = aHistoryExecute
    end
    object aZakl: TAction
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1077', '#1087#1086#1089#1090#1072#1074#1083#1077#1085#1085#1086#1077' '#1074#1088#1072#1095#1086#1084
      OnExecute = aZaklExecute
    end
    object aAgree: TAction
      Caption = #1057#1086#1075#1083#1072#1089#1080#1077
      Hint = #1057#1086#1075#1083#1072#1089#1080#1077' '#1087#1072#1094#1080#1077#1085#1090#1072
      ShortCut = 16467
      OnExecute = aAgreeExecute
    end
    object aAgreeProc: TAction
      Caption = #1057#1086#1075#1083#1072#1089#1080#1077' '#1087#1072#1094#1080#1077#1085#1090#1072' '#1085#1072' '#1083#1091#1095#1077#1074#1091#1102' '#1087#1088#1086#1094#1077#1076#1091#1088#1091
      Hint = #1057#1086#1075#1083#1072#1089#1080#1077' '#1087#1072#1094#1080#1077#1085#1090#1072' '#1085#1072' '#1083#1091#1095#1077#1074#1091#1102' '#1087#1088#1086#1094#1077#1076#1091#1088#1091
      OnExecute = aAgreeProcExecute
    end
  end
  object odsVidOplat: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER, FC_SYNONIM '
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'A' +
        'MBTALON_OPL'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F524445520100000000000A0000004643
      5F53594E4F4E494D010000000000}
    Session = frmMain.os
    Left = 1162
    Top = 83
  end
  object dsVidOplat: TDataSource
    DataSet = odsVidOplat
    Left = 1194
    Top = 83
  end
  object dsUrgent: TDataSource
    DataSet = odsUrgent
    Left = 1194
    Top = 163
  end
  object odsUrgent: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER '
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'N' +
        'AZN_TYPES'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Left = 1162
    Top = 163
  end
  object dsNadbavka: TDataSource
    DataSet = odsNadbavka
    Left = 1194
    Top = 123
  end
  object odsNadbavka: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER '
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'T' +
        'IME_NORMA_ISSL'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Left = 1162
    Top = 123
  end
  object odsRegPrin: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FC_SYNONIM, FK_OWNER, FN_ORDER, FL_DEL  '
      '  FROM TSMID '
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'P' +
        'D_MZ'#39')'
      '   AND FL_SHOWPRINT = 1 '
      '   AND FL_DEL = 0'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FC_SYNONIM, FK_OWNER, FN_ORDER, FL_DEL  '
      '  FROM TSMID '
      ' WHERE FC_SYNONIM = '#39'LIVEIN_SELO'#39
      '   AND FL_SHOWPRINT = 1 '
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER   ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F53594E4F4E494D01000000000008000000
      464B5F4F574E455201000000000008000000464E5F4F52444552010000000000
      06000000464C5F44454C010000000000}
    Session = frmMain.os
    Left = 1160
    Top = 240
  end
  object dsRegPrin: TDataSource
    DataSet = odsRegPrin
    Left = 1192
    Top = 241
  end
  object dsKorennoe: TDataSource
    DataSet = odsKorennoe
    Left = 1194
    Top = 203
  end
  object odsKorennoe: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER '
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'K' +
        'OREN_NASEL'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Left = 1162
    Top = 203
  end
  object odsTarget: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER '
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'I' +
        'SSL_TARGET'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Left = 1162
    Top = 51
  end
  object dsTarget: TDataSource
    DataSet = odsTarget
    Left = 1194
    Top = 51
  end
  object odsVidDoc: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_VIDDOCID '
      '  FROM TDOCOBSL, TAMBULANCE'
      ' WHERE TDOCOBSL.FK_ID = TAMBULANCE.FK_DOCOBSL'
      '   AND TAMBULANCE.FK_ID = :PFK_ID')
    Optimize = False
    Variables.Data = {0300000001000000070000003A50464B5F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000B000000464B5F564944444F434944010000000000}
    Session = frmMain.os
    BeforeOpen = odsVidDocBeforeOpen
    Left = 834
    Top = 291
  end
  object odsRgLaborant: TOracleDataSet
    SQL.Strings = (
      'SELECT 1 AS FK_ID, '#39' '#39' AS FC_FAM, FC_NAME'
      'FROM TSMID'
      
        'WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'RG' +
        '_LABORANT'#39')'
      '  AND FL_DEL = 0'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_FAM, FC_FAM || '#39' '#39' || '
      
        '       DECODE(VarcharIsNUll(FC_NAME), 1, '#39#39', SUBSTR(FC_NAME, 0, ' +
        '1) || '#39'. '#39' || '
      
        '       DECODE (VarcharIsNUll(FC_OTCH), 1, '#39#39', SUBSTR(FC_OTCH, 0,' +
        ' 1) || '#39'. '#39')) AS FC_NAME'
      ' FROM TSOTR '
      ' WHERE FK_OTDELID = :PFK_OTDELID'
      '   AND FK_SPRAVID = GET_XRAY_LABORANT'
      '   AND FL_DEL = 0'
      'ORDER BY FC_FAM'
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A50464B5F4F5444454C49440300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000046435F4E414D4501000000000005000000464B5F
      49440100000000000600000046435F46414D010000000000}
    Session = frmMain.os
    BeforeOpen = odsRgLaborantBeforeOpen
    Left = 1162
    Top = 299
  end
  object dsRgLaborant: TDataSource
    DataSet = odsRgLaborant
    Left = 1194
    Top = 299
  end
  object odsCifraArchive: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FK_OWNER, FN_ORDER '
      '  FROM TSMID'
      ' WHERE FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0 '
      
        '   AND FK_ID <> (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'CIF' +
        'RA_ARCHIVE'#39') '
      
        'START WITH FK_ID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39 +
        'CIFRA_ARCHIVE'#39')'
      'CONNECT BY PRIOR FK_ID = FK_OWNER '
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464B5F4F574E455201000000000008000000464E
      5F4F52444552010000000000}
    Session = frmMain.os
    Left = 1162
    Top = 355
  end
  object dsCifraArchive: TDataSource
    DataSet = odsCifraArchive
    Left = 1194
    Top = 355
  end
  object dsOtdelVydano: TDataSource
    DataSet = odsOtdelVydano
    Left = 1194
    Top = 403
  end
  object odsOtdelVydano: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME '
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'O' +
        'TDEL_VYDANO'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      ''
      '/*UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME FROM TOTDEL OTD '
      'WHERE OTD.FK_ID <> GET_STOTDEL'
      
        '  AND (SELECT COUNT(*) FROM TOTDEL WHERE TOTDEL.FK_OWNERID = OTD' +
        '.FK_ID) = 0'
      'START WITH OTD.FK_ID = GET_STOTDEL'
      'CONNECT BY PRIOR OTD.FK_ID = OTD.FK_OWNERID'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME FROM TOTDEL OTD '
      'WHERE OTD.FK_ID <> GET_POLIKOTDEL'
      
        '  AND (SELECT COUNT(*) FROM TOTDEL WHERE TOTDEL.FK_OWNERID = OTD' +
        '.FK_ID) = 0'
      'START WITH OTD.FK_ID = GET_POLIKOTDEL'
      'CONNECT BY PRIOR OTD.FK_ID = OTD.FK_OWNERID */'
      ''
      'ORDER BY FC_NAME'
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000046435F4E414D4501000000000005000000464B5F
      4944010000000000}
    Session = frmMain.os
    Left = 1162
    Top = 403
  end
  object frxReport1: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39300.405691006900000000
    ReportOptions.LastChange = 39300.431589259260000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 642
    Top = 291
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 434.645950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 173.794150000000000000
          Width = 374.560000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1116#1056#1106#1056#1119#1056#160#1056#1106#1056#8217#1056#8250#1056#8226#1056#1116#1056#152#1056#8226' '#1056#1116#1056#1106' '#1056#160#1056#8226#1056#1116#1056#1118#1056#8220#1056#8226#1056#1116'-'#1056#152#1056#1038#1056#1038#1056#8250#1056#8226#1056#8221#1056#1115#1056#8217#1056#1106#1056#1116#1056 +
              #152#1056#8226)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 225.920000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#160#1056#181#1056#1029#1057#8218#1056#1110#1056#181#1056#1029'-'#1056#187#1056#176#1056#177#1056#1109#1057#1026#1056#176#1056#1029#1057#8218':[RG_LABORANT]')
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 56.692949999999990000
          Width = 128.320000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218': [FIO_PAC]')
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 79.370130000000000000
          Width = 192.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039': [DATE_ROJD]')
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 102.047310000000000000
          Width = 223.520000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#1113#1056#1109#1057#1026#1056#181#1056#1029#1056#1029#1056#1109#1056#181' '#1056#1029#1056#176#1057#1027#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181': [KORENNOE]')
        end
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 124.724490000000000000
          Width = 228.800000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1056#182#1056#1105#1056#1030#1056#176#1056#181#1057#8218' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#1109#1057#1039#1056#1029#1056#1029#1056#1109': [PROJIVAET]')
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 147.401670000000000000
          Width = 244.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#1106#1056#1169#1057#1026#1056#181#1057#1027', '#1057#8218#1056#181#1056#187#1056#181#1057#8222#1056#1109#1056#1029': [ADDRESS], [PHONE]')
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Top = 170.078850000000000000
          Width = 167.680000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#152#1057#1027#1057#8218#1056#1109#1057#1026#1056#1105#1057#1039' '#1056#177#1056#1109#1056#187#1056#181#1056#183#1056#1029#1056#1105': [NUMIB]')
        end
        object Memo9: TfrxMemoView
          Left = 3.779530000000000000
          Top = 192.756030000000000000
          Width = 203.200000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1111#1057#1026#1056#176#1056#1030#1056#187#1056#181#1056#1029': [KEM_NAPRAVLEN]')
        end
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Top = 215.433210000000000000
          Width = 256.160000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1111#1057#1026#1056#176#1056#1030#1056#1105#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1057#8249#1056#8470' '#1056#1169#1056#1105#1056#176#1056#1110#1056#1029#1056#1109#1056#183': [NAPRAV_DS]')
        end
        object Memo11: TfrxMemoView
          Left = 3.779530000000000000
          Top = 238.110390000000000000
          Width = 132.320000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#1038#1057#1026#1056#1109#1057#8225#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034': [SROCH]')
        end
        object Memo12: TfrxMemoView
          Left = 3.779530000000000000
          Top = 260.787570000000000000
          Width = 255.840000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1169#1056#177#1056#176#1056#1030#1056#1108#1056#176' '#1056#1108' '#1056#1030#1057#1026#1056#181#1056#1112#1056#181#1056#1029#1056#1105': [NADBAVKA_TIME]')
        end
        object Memo13: TfrxMemoView
          Left = 3.779530000000000000
          Top = 298.582870000000000000
          Width = 209.280000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039': [NUMISSL]')
        end
        object Memo14: TfrxMemoView
          Left = 3.779530000000000000
          Top = 321.260050000000000000
          Width = 81.280000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[NAMEISSL]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 377.953000000000000000
          Top = 75.590600000000000000
          Width = 96.480000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#8217#1056#1109#1056#183#1057#1026#1056#176#1057#1027#1057#8218': [AGE]')
        end
        object Memo16: TfrxMemoView
          Left = 377.953000000000000000
          Top = 98.267780000000000000
          Width = 69.920000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187': [SEX]')
        end
        object Memo17: TfrxMemoView
          Left = 377.953000000000000000
          Top = 170.078850000000000000
          Width = 195.520000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#1038#1056#1111#1056#1109#1057#1027#1056#1109#1056#177' '#1056#1109#1056#1111#1056#187#1056#176#1057#8218#1057#8249': [VID_OPLATA]')
        end
        object Memo18: TfrxMemoView
          Left = 377.953000000000000000
          Top = 192.756030000000000000
          Width = 256.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1111#1057#1026#1056#176#1056#1030#1056#1105#1056#1030#1057#8364#1056#1105#1056#8470' '#1056#1030#1057#1026#1056#176#1057#8225': [VRACH_NAPRAVIL]')
        end
        object Memo19: TfrxMemoView
          Left = 377.953000000000000000
          Top = 238.110390000000000000
          Width = 104.640000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#166#1056#181#1056#187#1057#1034': [TARGET]')
        end
      end
    end
  end
  object odsKemNapravlen: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, '
      '       FC_NAME, '
      '       upper(fc_name) as fc_upper, '
      '       FK_OWNER, '
      '       FN_ORDER,'
      '       0 AS LPU_XMAO  '
      '  FROM ASU.TSMID'
      ' WHERE FL_SHOWPRINT = 1 '
      '   and fl_del = 0'
      '   and level <> 1'
      
        '   and fk_id <> (select fk_id from ASU.TSMID WHERE FC_SYNONIM = ' +
        #39'KEM_NAPRAVLEN'#39') '
      
        'START WITH FK_ID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM' +
        ' = '#39'KEM_NAPRAVLEN'#39')'
      'CONNECT BY PRIOR FK_ID = FK_OWNER '
      ''
      'UNION ALL'
      ''
      'select fk_id, '
      '       decode(level, 1, '#39#1051#1055#1059' '#1061#1052#1040#1054#39', fc_name) as fc_name, '
      '       upper(fc_name) as fc_upper, '
      '       fk_owner, '
      '       100000 as fn_order,'
      '       1 as LPU_XMAO'
      '  from asu.tsmid'
      ' where fl_showprint = 1'
      '   and fl_del = 0'
      'start with fc_synonim = '#39'PD_NAPRAVIV_YCH'#39
      'connect by prior fk_id = fk_owner '
      'ORDER BY fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464B5F4F574E455201000000000008000000464E
      5F4F52444552010000000000}
    Session = frmMain.os
    Left = 1162
    Top = 451
  end
  object dsKemNapravlen: TDataSource
    DataSet = odsKemNapravlen
    Left = 1194
    Top = 451
  end
  object odsListNaz: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWNUM, T.* '
      '  FROM (SELECT FK_ID,'
      '               FK_DOCID, '
      '               FK_NAZSOSID,'
      '               FK_NAZTYPEID,'
      '               FK_SMID, '
      '               FC_TYPE,'
      '               FK_VRACHID,    '
      '               ASU.GET_SMIDNAME(FK_SMID) AS FC_NAME,'
      '               ASU.GET_TIME_FOR_RG_ISSL(FK_ID) AS TIME,'
      
        '               (select 1 from asu.tkonsult_uslug where fk_nazid ' +
        '= tnazis.fk_id) as konsid        '
      '          FROM ASU.TNAZIS'
      '         WHERE FC_TYPE = :PFC_TYPE'
      '           AND FK_PACID = :PFK_PACID'
      
        '           AND FK_NAZSOSID NOT IN (ASU.GET_NAZCANCEL, ASU.GET_PA' +
        'SS_REGISTRATOR)'
      '        ORDER BY FK_ID) T')
    Optimize = False
    Variables.Data = {
      0300000002000000090000003A5046435F545950450500000000000000000000
      000A0000003A50464B5F5041434944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B00000005000000464B5F494401000000000007000000464B5F534D
      49440100000000000700000046435F4E414D450100000000000400000054494D
      4501000000000006000000524F574E554D01000000000008000000464B5F444F
      4349440100000000000B000000464B5F4E415A534F5349440100000000000700
      000046435F545950450100000000000A000000464B5F56524143484944010000
      0000000C000000464B5F4E415A545950454944010000000000060000004B4F4E
      534944010000000000}
    LockingMode = lmNone
    OnApplyRecord = odsListNazApplyRecord
    Session = frmMain.os
    BeforeOpen = odsListNazBeforeOpen
    AfterOpen = odsListNazAfterOpen
    Left = 440
    Top = 338
    object odsListNazROWNUM: TFloatField
      FieldName = 'ROWNUM'
    end
    object odsListNazFK_DOCID: TFloatField
      FieldName = 'FK_DOCID'
    end
    object odsListNazFK_NAZSOSID: TFloatField
      FieldName = 'FK_NAZSOSID'
    end
    object odsListNazFK_ID: TFloatField
      FieldName = 'FK_ID'
      Required = True
    end
    object odsListNazFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Size = 4000
    end
    object odsListNazFK_SMID: TFloatField
      FieldName = 'FK_SMID'
    end
    object odsListNazFC_TYPE: TStringField
      FieldName = 'FC_TYPE'
      Size = 50
    end
    object odsListNazTIME: TFloatField
      FieldName = 'TIME'
    end
    object odsListNazFK_VRACHID: TFloatField
      FieldName = 'FK_VRACHID'
    end
    object odsListNazFK_NAZTYPEID: TFloatField
      FieldName = 'FK_NAZTYPEID'
    end
    object odsListNazKONSID: TFloatField
      FieldName = 'KONSID'
    end
  end
  object dsListNaz: TDataSource
    DataSet = odsListNaz
    Left = 389
    Top = 337
  end
  object odsCompanyName: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER, FC_SYNONIM '
      '  FROM asu.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM ' +
        '= '#39'XRAY_COMPANY_DOGOVOR'#39')'
      '   AND FL_SHOWPRINT = 1'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F524445520100000000000A0000004643
      5F53594E4F4E494D010000000000}
    Session = frmMain.os
    Left = 738
    Top = 187
  end
  object dsCompanyName: TDataSource
    DataSet = odsCompanyName
    Left = 770
    Top = 187
  end
  object odsRegistrator: TOracleDataSet
    SQL.Strings = (
      'SELECT 1 AS FK_ID, '#39' '#39' AS FC_FAM, FC_NAME'
      'FROM TSMID'
      
        'WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'RG' +
        '_REGISTRATOR'#39')'
      '  AND FL_DEL = 0'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_FAM, FC_FAM || '#39' '#39' || '
      
        '       DECODE(VarcharIsNUll(FC_NAME), 1, '#39#39', SUBSTR(FC_NAME, 0, ' +
        '1) || '#39'. '#39' || '
      
        '       DECODE (VarcharIsNUll(FC_OTCH), 1, '#39#39', SUBSTR(FC_OTCH, 0,' +
        ' 1) || '#39'. '#39')) AS FC_NAME'
      ' FROM TSOTR TS'
      ' WHERE FK_OTDELID = :PFK_OTDELID'
      
        '   AND (SELECT FC_NAME FROM TS_SPRAV WHERE TS_SPRAV.FK_ID = TS.F' +
        'K_SPRAVID) = '#39#1052#1077#1076#1080#1094#1080#1085#1089#1082#1080#1081' '#1088#1077#1075#1080#1089#1090#1088#1072#1090#1086#1088#39
      '   AND FL_DEL = 0'
      'ORDER BY FC_FAM'
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A50464B5F4F5444454C49440300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000046435F4E414D4501000000000005000000464B5F
      49440100000000000600000046435F46414D010000000000}
    Session = frmMain.os
    BeforeOpen = odsRegistratorBeforeOpen
    Left = 1146
    Top = 531
  end
  object dsRegistrator: TDataSource
    DataSet = odsRegistrator
    Left = 1178
    Top = 531
  end
  object odsGra: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER '
      '  FROM asu.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM ' +
        '= '#39'LD_GRAGZ'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Left = 1146
    Top = 587
  end
  object dsGra: TDataSource
    DataSet = odsGra
    Left = 1178
    Top = 587
  end
  object odsStatus: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER '
      '  FROM asu.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM ' +
        '= '#39'LD_SOC_POL'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Left = 1146
    Top = 635
  end
  object dsStatus: TDataSource
    DataSet = odsStatus
    Left = 1178
    Top = 635
  end
  object odsCntOut: TOracleDataSet
    SQL.Strings = (
      'select max(fn_count) as cnt_out '
      '  from (select count(te.id_ill) as fn_count       '
      '          from (select max(t.fk_id) fk_id,'
      '                       t.lpu_id,'
      '                       t.person_idl,'
      '                       t.id_ill,'
      '                       t.p_id_ill,'
      '                       nvl(max(t.fl_cancel), 0) fl_cancel,'
      '                       count(*) fn_count'
      '                  from asu.texsluch t'
      '                 where t.id_ill = :pTalonID'
      
        '                group by t.lpu_id, t.person_idl, t.id_ill, t.p_i' +
        'd_ill) tem'
      
        '                inner join asu.texsluch te on te.fk_id = tem.fk_' +
        'id'
      '                 where tem.fl_cancel = 0'
      '        union all'
      '        select count(*) as fn_count'
      '          from exch43.toutpaclog l '
      '         where l.fp_result = 0 '
      '           and l.fc_function = '#39'ADD_CASE'#39' '
      '           and l.fk_pacid = :pTalonID'
      
        '           and not exists (select fk_id from asu.tchange_loaded_' +
        'sluch c where c.fk_sluch = l.fk_pacid and c.fd_todate > sysdate)' +
        ')')
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A5054414C4F4E49440300000000000000000000
      00}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 281
    Top = 344
  end
  object dxBarPopupMenu1: TdxBarPopupMenu
    BarManager = BM
    ItemLinks = <
      item
        Visible = True
        ItemName = 'bbAgree1'
      end
      item
        Visible = True
        ItemName = 'bbAgreeProc'
      end>
    UseOwnFont = False
    Left = 536
    Top = 344
  end
  object frAgreeProc: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41076.610402812500000000
    ReportOptions.LastChange = 41076.663123831020000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frAgreeProcGetValue
    Left = 184
    Top = 361
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 148.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 11
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 661.417750000000000000
        Top = 18.897650000000000000
        Width = 521.575140000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 521.575140000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#152#1056#1029#1057#8222#1056#1109#1057#1026#1056#1112#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1029#1056#1109#1056#181' '#1057#1027#1056#1109#1056#1110#1056#187#1056#176#1057#1027#1056#1105#1056#181' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#176 +
              ' '#1056#1029#1056#176' '#1056#187#1057#1107#1057#8225#1056#181#1056#1030#1057#1107#1057#1035' '#1056#1169#1056#1105#1056#176#1056#1110#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1057#1107#1057#1035' '#1056#1111#1057#1026#1056#1109#1057#8224#1056#181#1056#1169 +
              #1057#1107#1057#1026#1057#1107' ('#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181') "____"___________________ 20__' +
              ' '#1056#1110'.')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baWidth
          Top = 41.574830000000000000
          Width = 521.575140000000000000
          Height = 49.133890000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '   '#1056#1116#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#181#1056#181' '#1056#1169#1056#1109#1056#177#1057#1026#1056#1109#1056#1030#1056#1109#1056#187#1057#1034#1056#1029#1056#1109#1056#181' '#1057#1027#1056#1109#1056#1110#1056#187#1056#176#1057#1027#1056#1105#1056#181' ' +
              #1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1109' '#1056#1030' '#1057#1027#1056#1109#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#1105#1056#1105' '#1057#1027#1056#1109' '#1057#1027#1057#8218'. 30, ' +
              '31, 32, 33 '#1056#1115#1057#1027#1056#1029#1056#1109#1056#1030' '#1056#183#1056#176#1056#1108#1056#1109#1056#1029#1056#1109#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034#1057#1027#1057#8218#1056#1030#1056#176' '#1056#160#1056#164' '#1056#1109#1056#177 +
              ' '#1056#1109#1057#8230#1057#1026#1056#176#1056#1029#1056#181' '#1056#183#1056#1169#1056#1109#1057#1026#1056#1109#1056#1030#1057#1034#1057#1039' '#1056#1110#1057#1026#1056#176#1056#182#1056#1169#1056#176#1056#1029' '#1056#1109#1057#8218' 22 '#1056#1105#1057#1035#1056#1029#1057#1039' 1' +
              '993 '#1056#1110'. '#1074#8222#8211' 5487-1.')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baWidth
          Top = 94.488250000000000000
          Width = 521.575140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '1. '#1056#1114#1056#1029#1056#181' ('#1056#164'.'#1056#152'.'#1056#1115'. '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#176' '#1056#1105#1056#187#1056#1105' '#1056#181#1056#1110#1056#1109' '#1056#183#1056#176#1056#1108#1056#1109#1056#1029#1056#1029 +
              #1056#1109#1056#1110#1056#1109' '#1056#1111#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1057#8218#1056#181#1056#187#1057#1039') [PACFIO]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baWidth
          Top = 117.165430000000000000
          Width = 521.575140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#152#1057#1027#1057#8218#1056#1109#1057#1026#1056#1105#1057#1039' '#1056#177#1056#1109#1056#187#1056#181#1056#183#1056#1029#1056#1105' ('#1056#176#1056#1112#1056#177#1057#1107#1056#187#1056#176#1057#8218#1056#1109#1057#1026#1056#1029#1056#176#1057#1039' '#1056#1108#1056#176#1057#1026#1057#8218 +
              #1056#176') '#1074#8222#8211' [NUMIB]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baWidth
          Top = 136.063080000000000000
          Width = 521.575140000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1057#1026#1056#176#1056#183#1057#1033#1057#1039#1057#1027#1056#1029#1056#181#1056#1029#1057#8249' '#1056#1105' '#1056#1111#1056#1109#1056#1029#1057#1039#1057#8218#1056#1029#1057#8249' '#1057#1027#1057#1107#1057#8218#1057#1034' '#1056#1112#1056#1109#1056#181#1056#1110#1056#1109' '#1056#183#1056#176#1056 +
              #177#1056#1109#1056#187#1056#181#1056#1030#1056#176#1056#1029#1056#1105#1057#1039' '#1056#1105' '#1056#1109#1056#1111#1056#176#1057#1027#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105', '#1057#1027#1056#1030#1057#1039#1056#183#1056#176#1056#1029#1056#1029#1057#8249#1056#181' '#1057#1027' '#1056 +
              #181#1056#1110#1056#1109' '#1056#1169#1056#176#1056#187#1057#1034#1056#1029#1056#181#1056#8470#1057#8364#1056#1105#1056#1112' '#1057#1026#1056#176#1056#183#1056#1030#1056#1105#1057#8218#1056#1105#1056#181#1056#1112'.')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          Top = 177.637910000000000000
          Width = 521.575140000000000000
          Height = 52.913420000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '2. '#1056#1031' '#1056#1111#1056#1109#1056#1029#1056#1105#1056#1112#1056#176#1057#1035' '#1056#1105' '#1056#1111#1057#1026#1056#1105#1056#183#1056#1029#1056#176#1057#1035' '#1056#1029#1056#181#1056#1109#1056#177#1057#8230#1056#1109#1056#1169#1056#1105#1056#1112#1056#1109#1057#1027#1057#8218#1057 +
              #1034' '#1056#1030#1057#8249#1056#1111#1056#1109#1056#187#1056#1029#1056#181#1056#1029#1056#1105#1057#1039' '#1057#1027#1056#187#1056#181#1056#1169#1057#1107#1057#1035#1057#8240#1056#1105#1057#8230' '#1056#1169#1056#1105#1056#176#1056#1110#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105#1057#8225#1056#181 +
              #1057#1027#1056#1108#1056#1105#1057#8230' '#1056#1105#1056#187#1056#1105' '#1056#187#1056#181#1057#8225#1056#181#1056#177#1056#1029#1056#1109'-'#1056#1169#1056#1105#1056#176#1056#1110#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1105#1057#8230' '#1056#1111 +
              #1057#1026#1056#1109#1057#8224#1056#181#1056#1169#1057#1107#1057#1026' '#1057#1027' '#1056#1105#1057#1027#1056#1111#1056#1109#1056#187#1057#1034#1056#183#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181#1056#1112' '#1056#187#1057#1107#1057#8225#1056#181#1056#1030#1057#8249#1057#8230' '#1056#1112 +
              #1056#181#1057#8218#1056#1109#1056#1169#1056#1109#1056#1030': [METODS]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 234.330860000000000000
          Width = 521.575140000000000000
          Height = 49.133890000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '3. '#1056#1114#1056#1029#1056#181' '#1057#1026#1056#176#1056#183#1057#1033#1057#1039#1057#1027#1056#1029#1056#181#1056#1029#1057#8249' '#1056#1105' '#1056#1111#1056#1109#1056#1029#1057#1039#1057#8218#1056#1029#1057#8249' '#1057#1026#1056#1105#1057#1027#1056#1108', '#1056#1030#1056#1109#1056 +
              #183#1056#1112#1056#1109#1056#182#1056#1029#1057#8249#1056#181' '#1056#1109#1057#1027#1056#187#1056#1109#1056#182#1056#1029#1056#181#1056#1029#1056#1105#1057#1039' '#1056#1105' '#1056#1111#1056#1109#1057#1027#1056#187#1056#181#1056#1169#1057#1027#1057#8218#1056#1030#1056#1105#1057#1039' '#1056#1105#1057 +
              #1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039'('#1056#1105#1056#8470'), '#1056#1108#1056#1109#1057#8218#1056#1109#1057#1026#1057#8249#1056#181' '#1056#1112#1056#1109#1056#1110#1057#1107#1057#8218' '#1056#1111#1056#1109#1057#8218#1057#1026#1056 +
              #181#1056#177#1056#1109#1056#1030#1056#176#1057#8218#1057#1034' '#1056#1169#1056#1109#1056#1111#1056#1109#1056#187#1056#1029#1056#1105#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1057#8249#1057#8230' '#1056#1030#1056#1112#1056#181#1057#8364#1056#176#1057#8218#1056#181#1056#187#1057#1034#1057#1027#1057 +
              #8218#1056#1030' '#1056#1105#1056#187#1056#1105' '#1056#187#1056#181#1057#8225#1056#181#1056#1029#1056#1105#1057#1039'.')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Align = baWidth
          Top = 287.244280000000000000
          Width = 521.575140000000000000
          Height = 64.252010000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '4. '#1056#1031' '#1057#1107#1056#1111#1056#1109#1056#187#1056#1029#1056#1109#1056#1112#1056#1109#1057#8225#1056#1105#1056#1030#1056#176#1057#1035' '#1056#1030#1057#1026#1056#176#1057#8225#1056#181#1056#8470', '#1056#1105#1056#1112#1056#181#1057#1035#1057#8240#1056#1105#1057#8230' '#1057#1027 +
              #1056#1109#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1057#1107#1057#1035#1057#8240#1057#1107#1057#1035' '#1056#1111#1056#1109#1056#1169#1056#1110#1056#1109#1057#8218#1056#1109#1056#1030#1056#1108#1057#1107' '#1056#1105' '#1057#1027#1056#181#1057#1026#1057#8218#1056#1105#1057 +
              #8222#1056#1105#1056#1108#1056#176#1057#8218', '#1056#1030#1057#8249#1056#1111#1056#1109#1056#187#1056#1029#1057#1039#1057#8218#1057#1034' '#1057#1107#1056#1108#1056#176#1056#183#1056#176#1056#1029#1056#1029#1057#8249#1056#181' '#1056#1111#1057#1026#1056#1109#1057#8224#1056#181#1056#1169#1057#1107#1057 +
              #1026#1057#8249', '#1056#176' '#1056#1030' '#1057#1027#1056#187#1057#1107#1057#8225#1056#176#1056#181' '#1056#1030#1056#1109#1056#183#1056#1029#1056#1105#1056#1108#1056#1029#1056#1109#1056#1030#1056#181#1056#1029#1056#1105#1057#1039' '#1056#1109#1057#1027#1056#187#1056#1109#1056#182#1056#1029#1056 +
              #181#1056#1029#1056#1105#1056#8470' '#1056#1109#1057#1027#1057#1107#1057#8240#1056#181#1057#1027#1057#8218#1056#1030#1056#1105#1057#8218#1057#1034' '#1056#1029#1056#181#1056#1109#1056#177#1057#8230#1056#1109#1056#1169#1056#1105#1056#1112#1057#8249#1056#181' '#1056#1112#1056#181#1056#1169#1056#1105#1057#8224 +
              #1056#1105#1056#1029#1057#1027#1056#1108#1056#1105#1056#181' '#1056#1169#1056#181#1056#8470#1057#1027#1057#8218#1056#1030#1056#1105#1057#1039' '#1056#1169#1056#187#1057#1039' '#1057#1107#1056#187#1057#1107#1057#8225#1057#8364#1056#181#1056#1029#1056#1105#1057#1039' '#1056#1112#1056#1109#1056#181#1056#1110 +
              #1056#1109' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#1109#1057#1039#1056#1029#1056#1105#1057#1039'.')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baWidth
          Top = 355.275820000000000000
          Width = 521.575140000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1038#1056#1109#1056#1169#1056#181#1057#1026#1056#182#1056#176#1056#1029#1056#1105#1056#181' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#181#1056#1110#1056#1109' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176' '#1056#1112#1056 +
              #1029#1056#1109#1057#1035' '#1056#1111#1057#1026#1056#1109#1057#8225#1056#1105#1057#8218#1056#176#1056#1029#1056#1109', '#1057#1026#1056#176#1056#183#1057#1033#1057#1039#1057#1027#1056#1029#1056#181#1056#1029#1056#1109' '#1056#1112#1056#1029#1056#181' '#1056#1030#1057#1026#1056#176#1057#8225#1056#1109 +
              #1056#1112' '#1056#1105' '#1056#1111#1056#1109#1056#187#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034#1057#1035' '#1056#1112#1056#1029#1056#181' '#1056#1111#1056#1109#1056#1029#1057#1039#1057#8218#1056#1029#1056#1109', '#1057#8225#1057#8218#1056#1109' '#1057#1039' '#1056#1105' '#1057#1107#1056 +
              #1169#1056#1109#1057#1027#1057#8218#1056#1109#1056#1030#1056#181#1057#1026#1057#1039#1057#1035' '#1057#1027#1056#1030#1056#1109#1056#181#1056#8470' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035'.')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baWidth
          Top = 396.850650000000000000
          Width = 521.575140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#176' /____________________//[PACFIO]/')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baWidth
          Top = 419.527830000000000000
          Width = 521.575140000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1115#1057#8218' '#1056#1111#1057#1026#1056#1109#1056#1030#1056#181#1056#1169#1056#181#1056#1029#1056#1105#1057#1039' '#1057#1107#1056#1108#1056#176#1056#183#1056#176#1056#1029#1056#1029#1057#8249#1057#8230' '#1056#1030' '#1056#1111'. 2 '#1056#1105#1057#1027#1057#1027#1056#187#1056#181 +
              #1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#8470' '#1056#1109#1057#8218#1056#1108#1056#176#1056#183#1057#8249#1056#1030#1056#176#1057#1035#1057#1027#1057#1034', '#1057#8225#1057#8218#1056#1109' '#1056#1105' '#1057#1107#1056#1169#1056#1109#1057#1027#1057#8218#1056#1109#1056#1030#1056 +
              #181#1057#1026#1057#1039#1057#1035' '#1057#1027#1056#1030#1056#1109#1056#181#1056#8470' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035'.')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Align = baWidth
          Top = 461.102660000000000000
          Width = 521.575140000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1114#1056#1029#1056#181' '#1057#1026#1056#176#1056#183#1057#1033#1057#1039#1057#1027#1056#1029#1056#181#1056#1029#1057#8249' '#1056#1030#1056#1109#1056#183#1056#1112#1056#1109#1056#182#1056#1029#1057#8249#1056#181' '#1056#1111#1056#1109#1057#1027#1056#187#1056#181#1056#1169#1057#1027#1057#8218#1056 +
              #1030#1056#1105#1057#1039' '#1056#1109#1057#8218#1056#1108#1056#176#1056#183#1056#176' '#1056#1109#1057#8218' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039', '#1056#176' '#1056#1105#1056#1112#1056#181#1056#1029#1056#1029#1056 +
              #1109' '#1056#1111#1056#1109#1056#183#1056#1169#1056#1029#1057#1039#1057#1039' '#1056#1105#1056#187#1056#1105' '#1056#1029#1056#181#1056#1111#1057#1026#1056#176#1056#1030#1056#1105#1056#187#1057#1034#1056#1029#1056#176#1057#1039' '#1056#1169#1056#1105#1056#176#1056#1110#1056#1029#1056#1109#1057#1027#1057 +
              #8218#1056#1105#1056#1108#1056#176' '#1056#183#1056#176#1056#177#1056#1109#1056#187#1056#181#1056#1030#1056#176#1056#1029#1056#1105#1057#1039', '#1056#1029#1056#181#1057#8218#1057#1026#1057#1107#1056#1169#1056#1109#1057#1027#1056#1111#1056#1109#1057#1027#1056#1109#1056#177#1056#1029#1056#1109#1057#1027 +
              #1057#8218#1057#1034', '#1057#1027#1056#1112#1056#181#1057#1026#1057#8218#1057#1034'.')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Align = baWidth
          Top = 498.897960000000000000
          Width = 521.575140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#176' ('#1056#1105#1056#187#1056#1105' '#1056#181#1056#1110#1056#1109' '#1056#183#1056#176#1056#1108#1056#1109#1056#1029#1056#1029#1056#1109#1056#1110#1056 +
              #1109' '#1056#1111#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1057#8218#1056#181#1056#187#1057#1039')')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Align = baWidth
          Top = 532.913730000000000000
          Width = 521.575140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#164'.'#1056#152'.'#1056#1115'. _______________________________/______________________' +
              '________/')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Align = baWidth
          Top = 563.149970000000000000
          Width = 521.575140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034' '#1056#1030#1057#1026#1056#176#1057#8225#1056#176' ____________________________/_________' +
              '_________________/')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Align = baWidth
          Top = 593.386210000000000000
          Width = 521.575140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034' '#1057#8218#1057#1026#1056#181#1057#8218#1057#1034#1056#181#1056#1110#1056#1109' '#1056#187#1056#1105#1057#8224#1056#176' _______________________' +
              '/________________________/')
          ParentFont = False
        end
      end
    end
  end
  object odsVidOpl: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID,'
      '       FK_PEPLID,'
      '       trim(FC_SER ||'#39' '#39'|| FC_NUM) ser_num,'
      '       FC_DOGOVOR,'
      '       DECODE(FD_NULL, NULL, FL_OLD, 1) AS FL_OLD,'
      '       FD_DATE,'
      '       FD_END,'
      '       FC_NAME,'
      '       FC_TYPEDOC,'
      '       FN_ORDER,'
      '       --DECODE(FK_ID, :PCURAMBINS, 1, 0) ISAMBINS,'
      '       FL_NOTDOC,'
      
        '       FC_SYNONIM,TYPEID,asu.get_sootv_typeopl_smid(TYPEID,0) ty' +
        'peopl,'
      '       FC_NAME ||'
      
        '       DECODE(FC_SHORT, '#39#39', '#39#39', NULL, '#39#39', '#39' ('#39' || FC_SHORT || '#39')' +
        ', '#39') ||'
      
        '       DECODE(FC_COUNTRY, '#39#39', '#39#39', NULL, '#39#39', FC_COUNTRY || '#39','#39') |' +
        '|'
      '       DECODE(FC_REGION, '#39#39', '#39#39', NULL, '#39#39', FC_REGION || '#39','#39') ||'
      
        '       DECODE(FC_TOWN, '#39#39', '#39#39', NULL, '#39#39', FC_TOWN || '#39','#39') || FC_A' +
        'DR AS FC_FULL_STRAH,'
      '       FK_COMPANYID,'
      '       ISSERTIFICAT'
      '  FROM (SELECT FK_ID,'
      '               FK_PEPLID,'
      '               FC_SER,'
      '               FC_NUM,'
      '               FC_DOGOVOR,'
      '               CASE'
      
        '                 WHEN COALESCE(FD_END, TI_FD_END, SYSDATE + 1) >' +
        ' SYSDATE THEN'
      '                  0'
      '                 ELSE'
      '                  1'
      '               END FL_OLD,'
      '               FD_DATE,'
      '               FD_END,'
      '               FC_NAME,'
      '               FC_SHORT,'
      '               FC_ADR,'
      '               FC_COUNTRY,'
      '               FC_REGION,'
      '               FC_TOWN,'
      '               FC_TYPEDOC,'
      '               FN_ORDER,'
      '               0 FL_NOTDOC,'
      '               FC_SYNONIM,TYPEID,'
      '               FD_NULL,'
      '               FK_COMPANYID,'
      '               ISSERTIFICAT'
      '        '
      '          FROM (SELECT TINSURDOCS.FK_ID,'
      '                       TINSURDOCS.FK_PEPLID,'
      '                       TINSURDOCS.FC_SER,'
      '                       TINSURDOCS.FC_NUM,'
      '                       '#39#39' FC_DOGOVOR,'
      '                       TINSURDOCS.FD_BEGIN FD_DATE,'
      '                       CASE'
      
        '                         WHEN TINSURDOCS.FD_PROLONG > TINSURDOCS' +
        '.FD_END THEN'
      '                          TINSURDOCS.FD_PROLONG'
      '                         ELSE'
      '                          TINSURDOCS.FD_END'
      '                       END FD_END,'
      '                       TCOMPANY.FC_NAME,'
      '                       TCOMPANY.FC_SHORT,'
      '                       TCOMPANY.FC_ADR,'
      '                       TCOUNTRY.FC_NAME FC_COUNTRY,'
      '                       TREGION.FC_NAME FC_REGION,'
      '                       TTOWN.FC_NAME FC_TOWN,'
      '                       TTYPEDOC.FK_ID TYPEID,'
      '                       TTYPEDOC.FC_NAME FC_TYPEDOC,'
      '                       TTYPEDOC.FN_ORDER,'
      '                       TTYPEDOC.FC_SYNONIM,'
      '                       TINSURDOCS.FD_NULL,'
      '                       TINSURDOCS.FK_COMPANYID,'
      
        '                       (TINSURDOCS.FK_TYPEDOCID - ASU.GET_SERTIF' +
        'IKATID) AS ISSERTIFICAT,'
      '                       TINSUR_DOGOVOR.FD_END AS TI_FD_END'
      '                  FROM ASU.TTYPEDOC,'
      '                       ASU.TINSURDOCS,'
      '                       ASU.TCOMPANY,'
      '                       ASU.TCOUNTRY,'
      '                       ASU.TREGION,'
      '                       ASU.TTOWN,'
      '                       ASU.TINSUR_DOGOVOR'
      '                '
      '                 WHERE TTYPEDOC.FK_ID = TINSURDOCS.FK_TYPEDOCID'
      '                   AND TINSURDOCS.FK_PEPLID = :FK_PEPLID'
      
        '                   AND TCOMPANY.FK_ID(+) = TINSURDOCS.FK_COMPANY' +
        'ID'
      '                   AND TCOUNTRY.FK_ID(+) = TCOMPANY.FK_COUNTRYID'
      '                   AND TREGION.FK_ID(+) = TCOMPANY.FK_REGIONID'
      '                   AND TTOWN.FK_ID(+) = TCOMPANY.FK_TOWNID'
      
        '                   AND TINSURDOCS.FK_DOGOVORID = TINSUR_DOGOVOR.' +
        'FK_ID(+)'
      '                 ORDER BY FD_END DESC)'
      '        UNION ALL'
      '        SELECT TINSURNOTDOCS.FK_INSURID,'
      '               :FK_PEPLID FK_PEPLID,'
      '               '#39#39' FC_SER,'
      '               '#39#39' FC_NUM,'
      '               '#39#39' FC_DOGOVOR,'
      '               0 FL_OLD,'
      '               TO_DATE(NULL) FD_DATE,'
      '               TO_DATE(NULL) FD_END,'
      '               '#39#39' FC_NAME,'
      '               '#39#39' FC_SHORT,'
      '               '#39#39' FC_ADR,'
      '               '#39#39' FC_COUNTRY,'
      '               '#39#39' FC_REGION,'
      '               '#39#39' FC_TOWN,'
      '               TTYPEDOC.FC_NAME FC_TYPEDOC,'
      '               -1 FN_ORDER,'
      '               FL_NOTDOC,'
      '               TTYPEDOC.FC_SYNONIM,ttypedoc.fk_id TYPEID,'
      '               NULL AS FD_NULL,'
      '               -1 AS FK_COMPANYID,'
      '               1 AS ISSERTIFICAT'
      '          FROM ASU.TTYPEDOC, ASU.TINSURNOTDOCS'
      '         WHERE TTYPEDOC.FL_NOTDOC = 1'
      '           AND TINSURNOTDOCS.FK_TYPEDOC = TTYPEDOC.FK_ID)'
      ' ORDER BY FD_END DESC')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A464B5F5045504C4944030000000400000049F0
      7F0300000000}
    QBEDefinition.QBEFieldDefs = {
      040000001100000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F524445520100000000000A0000004643
      5F53594E4F4E494D01000000000009000000464B5F5045504C49440100000000
      000A00000046435F444F474F564F5201000000000006000000464C5F4F4C4401
      00000000000700000046445F444154450100000000000600000046445F454E44
      0100000000000A00000046435F54595045444F4301000000000009000000464C
      5F4E4F54444F4301000000000006000000545950454944010000000000070000
      00545950454F504C0100000000000D00000046435F46554C4C5F535452414801
      00000000000C000000464B5F434F4D50414E5949440100000000000C00000049
      5353455254494649434154010000000000070000005345525F4E554D01000000
      0000}
    Session = frmMain.os
    Left = 962
    Top = 307
  end
  object dsVidOpl: TDataSource
    DataSet = odsVidOpl
    Left = 994
    Top = 307
  end
end
