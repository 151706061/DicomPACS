object frmRegistrAmbPacFlu: TfrmRegistrAmbPacFlu
  Left = 321
  Top = 83
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1085#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
  ClientHeight = 562
  ClientWidth = 845
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
    Width = 839
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 34
    Width = 845
    Height = 528
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object paSex: TPanel
      Left = 0
      Top = 73
      Width = 845
      Height = 88
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object cxLabel2: TcxLabel
        Left = 4
        Top = 3
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
      object cxMale: TcxRadioButton
        Left = 102
        Top = 62
        Width = 74
        Height = 17
        Caption = #1052#1091#1078#1089#1082#1086#1081
        TabOrder = 4
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
      end
      object cxFemale: TcxRadioButton
        Left = 186
        Top = 62
        Width = 79
        Height = 17
        Caption = #1046#1077#1085#1089#1082#1080#1081
        TabOrder = 5
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
      end
      object cxdeRojd: TcxDateEdit
        Left = 102
        Top = 3
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Properties.DateOnError = deToday
        Properties.ImmediatePost = True
        Properties.PostPopupValueOnTab = True
        Properties.SaveTime = False
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
        TabOrder = 0
        OnKeyDown = cxdeRojdKeyDown
        Width = 121
      end
      object cxLabel3: TcxLabel
        Left = 4
        Top = 30
        Caption = #1042#1086#1079#1088#1072#1089#1090':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel4: TcxLabel
        Left = 310
        Top = 4
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
        Left = 310
        Top = 32
        Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxVidOplat: TcxLookupComboBox
        Left = 413
        Top = 33
        Hint = #1057#1087#1086#1089#1086#1073' '#1086#1087#1083#1072#1090#1099
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
        TabOrder = 6
        Width = 140
      end
      object cxKorennoe: TcxLookupComboBox
        Left = 413
        Top = 6
        Hint = #1043#1088#1091#1087#1087#1099' '#1076#1080#1072#1075#1085#1086#1079#1086#1074
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
        TabOrder = 2
        Width = 140
      end
      object cxCompDogovor: TcxLookupComboBox
        Left = 413
        Top = 60
        Hint = #1043#1088#1091#1087#1087#1099' '#1076#1080#1072#1075#1085#1086#1079#1086#1074
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
        TabOrder = 7
        Visible = False
        Width = 242
      end
      object cxLabel18: TcxLabel
        Left = 4
        Top = 60
        Caption = #1055#1086#1083':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxAge: TcxLabel
        Left = 102
        Top = 30
        Caption = '--'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object lbCompany: TcxLabel
        Left = 310
        Top = 59
        Caption = #1050#1086#1084#1087#1072#1085#1080#1103':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Visible = False
      end
      object bVozrast: TcxButton
        Left = 227
        Top = 1
        Width = 29
        Height = 27
        Hint = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1074#1086#1079#1088#1072#1089#1090' '#1087#1072#1094#1080#1077#1085#1090#1072
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
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
      object cxNum: TcxTextEdit
        Left = 702
        Top = 0
        Hint = #1053#1086#1084#1077#1088' '#1052#1077#1076#1080#1094#1080#1085#1089#1082#1086#1081' '#1050#1072#1088#1090#1099' '#1087#1072#1094#1080#1077#1085#1090#1072
        AutoSize = False
        ParentFont = False
        ParentShowHint = False
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.CharCase = ecUpperCase
        ShowHint = True
        Style.BorderStyle = ebsOffice11
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.IsFontAssigned = True
        StyleDisabled.BorderColor = clBtnText
        StyleDisabled.Color = clBtnFace
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.TextColor = clBtnText
        StyleFocused.BorderColor = clInactiveCaptionText
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 3
        Height = 30
        Width = 137
      end
      object cxLabel19: TcxLabel
        Left = 659
        Top = 5
        Caption = #8470' '#1052#1050':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
    end
    object paAddress: TPanel
      Left = 0
      Top = 161
      Width = 845
      Height = 213
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object cxLabel5: TcxLabel
        Left = 4
        Top = 4
        Caption = #1055#1088#1086#1078#1080#1074#1072#1077#1090':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel6: TcxLabel
        Left = 4
        Top = 71
        Hint = #1040#1076#1088#1077#1089' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1075#1086' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103
        Caption = #1040#1076#1088#1077#1089' '#1092#1072#1082#1090'.:'
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
      object cxProjivaet: TcxLookupComboBox
        Left = 102
        Top = 6
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
        TabOrder = 0
        Width = 176
      end
      object cxlKontaktPhone: TcxLabel
        Left = 310
        Top = 4
        Caption = #1058#1077#1083#1077#1092#1086#1085':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxTelefon: TcxTextEdit
        Left = 413
        Top = 6
        Properties.MaxLength = 20
        Properties.ReadOnly = False
        Style.BorderStyle = ebsOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 1
        Width = 140
      end
      object cxLabel14: TcxLabel
        Left = 4
        Top = 129
        Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxCompany: TcxMemo
        Left = 102
        Top = 131
        Enabled = False
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.BorderColor = clBtnText
        StyleDisabled.Color = clBtnHighlight
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.TextColor = clBtnText
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 7
        Height = 44
        Width = 737
      end
      object bbCompany: TcxButton
        Left = 74
        Top = 150
        Width = 25
        Height = 25
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1082#1086#1084#1087#1072#1085#1080#1102
        TabOrder = 2
        OnClick = bbCompanyClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000170AC00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000275B0000E88C0000275B000096EA1000174
          AF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000275B000279FDA001379B0005FE3FF0070EFFC005DD4
          E5000C699A000275B0000275B000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000275B0003FC7FF00147FBA001682BB0052D7FF006CEBFE007FFE
          FF0086FFFF008AFFFF005FD7E6000275B0000275B0000473AD00FF00FF00FF00
          FF000275B0003EC4FC003BC2FF00117DB6003FC4F80047CCFB0063E3FC007BF8
          FF007FFBFF0080FEFF007EFBFC001D84AF002DA5D9000679B400FF00FF000275
          B00056D9FF0048CCFB0042C5F800128BC5003FC4F8003FC4F8005ADCFB0077F4
          FF0082FFFF0073EDF3001D84AF0032B1ED000174AF00FF00FF000275B00076F4
          FF0064E5FE005DDEFB005FD7E6000377B1003BC1FE003ABFFA0051D4FB0072F2
          FF0064DCEA001D84AF0035B7F30038BDFB000174AF00FF00FF000275B0008BFF
          FF0077F3FE005FD7E6000375B0001C8EC700015703002EACE60048C9F40048BF
          DE002B9AC70051D4FA004FD3FE000174AF00FF00FF00FF00FF000275B0008EFF
          FF005FD7E6000070AD000172AC00006BA400015703000183BD000C8CC2005AD5
          E70075F6FF0001570300015703000D87BC00FF00FF00FF00FF000275B0005FD7
          E600006FAC000377B1000378B200006CA7000157030005730A0007A7E0006DEB
          F40084FFFF00015703000E78130001570300FF00FF00FF00FF000376B0000275
          B0000377B1000378B2000472AA0003669E0001570300047F0A00015703000157
          030001570300015703003CD56A00168B230001570300FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000378B2000379B4000279B4000157030006980F000793
          110011A022001FAF37002FC6550041E073001FA0350001570300FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015703000378
          0400088E0C0013A1230022B63F0035D15D0023A5360001570300FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000157
          0300015703000157030016AA29001086160001570300FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0001570300056D000001570300FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000157030001570300FF00FF00FF00FF00FF00FF00}
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
      end
      object cxAddress: TMemo
        Left = 99
        Top = 60
        Width = 744
        Height = 37
        Hint = #1040#1076#1088#1077#1089' '#1087#1088#1086#1087#1080#1089#1082#1080
        TabStop = False
        BorderStyle = bsNone
        Lines.Strings = (
          '')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
      end
      object cxLabel23: TcxLabel
        Left = 4
        Top = 181
        Caption = #1044#1088#1091#1075#1086#1077':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object teAnother: TcxTextEdit
        Left = 102
        Top = 183
        Properties.OnChange = teAnotherPropertiesChange
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 10
        Width = 737
      end
      object cxLabel24: TcxLabel
        Left = 4
        Top = 103
        Hint = #1040#1076#1088#1077#1089' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1087#1086' '#1084#1077#1089#1090#1091' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
        Caption = #1040#1076#1088#1077#1089' '#1088#1077#1075#1080#1089#1090#1088'.:'
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
      object teAdrR: TcxTextEdit
        Left = 107
        Top = 105
        Enabled = False
        Properties.ReadOnly = True
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.TextColor = clBlack
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 12
        Width = 732
      end
      object l1: TcxLabel
        Left = 3
        Top = 32
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
        Left = 99
        Top = 33
        Properties.PopupControl = pnlFilter
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
        TabOrder = 14
        Width = 365
      end
      object l2: TcxLabel
        Left = 476
        Top = 32
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
        Left = 581
        Top = 33
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
        TabOrder = 16
        Text = #1057#1040#1052#1054#1054#1041#1056#1040#1065#1045#1053#1048#1045
        Width = 193
      end
      object pnlFilter: TPanel
        Left = 912
        Top = -6
        Width = 360
        Height = 219
        Caption = 'pnlFilter'
        TabOrder = 17
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
          object tlc1: TcxDBTreeListColumn
            Caption.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_NAME'
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
        end
        object pnl1: TPanel
          Left = 1
          Top = 1
          Width = 358
          Height = 24
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          object l3: TcxLabel
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
            OnClick = teFilterEnter
            OnEnter = teFilterEnter
            OnKeyUp = teFilterKeyUp
            Width = 299
          end
        end
      end
    end
    object paLaborant: TPanel
      Left = 0
      Top = 415
      Width = 845
      Height = 113
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 4
      object cxLabel13: TcxLabel
        Left = 310
        Top = 5
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
        Left = 413
        Top = 6
        Hint = #1062#1077#1083#1100
        ParentShowHint = False
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
        ShowHint = True
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 1
        Width = 140
      end
      object cxLabel10: TcxLabel
        Left = 4
        Top = 5
        Caption = #1055#1088#1080#1105#1084':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxPriem: TcxLookupComboBox
        Left = 102
        Top = 6
        Hint = #1042#1080#1076' '#1087#1088#1080#1077#1084#1072
        ParentShowHint = False
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
        Properties.ListSource = dsPriem
        Properties.ReadOnly = False
        Properties.OnChange = cxPriemPropertiesChange
        ShowHint = True
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 0
        Width = 161
      end
      object cxLabel11: TcxLabel
        Left = 310
        Top = 30
        Caption = #1040#1087#1087#1072#1088#1072#1090':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxApparat: TcxLookupComboBox
        Left = 413
        Top = 31
        Hint = #1040#1087#1087#1072#1088#1072#1090
        ParentShowHint = False
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
        Properties.ListSource = dsApparat
        Properties.ReadOnly = False
        ShowHint = True
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 2
        Width = 140
      end
      object cxlbOtdel: TcxLabel
        Left = 102
        Top = 33
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1090#1076#1077#1083#1077#1085#1080#1103
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Visible = False
      end
      object cxLabel15: TcxLabel
        Left = 4
        Top = 33
        Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1077':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Visible = False
      end
      object cxLabel17: TcxLabel
        Left = 310
        Top = 59
        Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Visible = False
      end
      object cxPeriod: TcxLookupComboBox
        Left = 413
        Top = 60
        Hint = #1055#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100' '#1092#1083#1102#1086#1088#1086#1075#1088#1072#1092#1080#1095#1077#1089#1082#1080#1093' '#1086#1089#1084#1086#1090#1088#1086#1074
        ParentShowHint = False
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
        Properties.ListSource = dsPeriod
        Properties.ReadOnly = False
        ShowHint = True
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.ButtonTransparency = ebtHideInactive
        StyleDisabled.BorderStyle = ebsNone
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.TextColor = clBlack
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 3
        Visible = False
        Width = 140
      end
      object cxLabel28: TcxLabel
        Left = 581
        Top = 5
        Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1090#1086#1088':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxRgLaborant: TcxLookupComboBox
        Left = 673
        Top = 6
        Hint = #1043#1088#1091#1087#1087#1099' '#1076#1080#1072#1075#1085#1086#1079#1086#1074
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
        TabOrder = 4
        Width = 166
      end
      object cxLabel9: TcxLabel
        Left = 599
        Top = 30
        Caption = #1051#1072#1073#1086#1088#1072#1085#1090':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLaborant: TcxLookupComboBox
        Left = 673
        Top = 31
        Hint = #1043#1088#1091#1087#1087#1099' '#1076#1080#1072#1075#1085#1086#1079#1086#1074
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
        Properties.ListSource = dsLaborant
        Properties.ReadOnly = False
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 5
        Width = 166
      end
      object lbTub: TcxLabel
        Left = 4
        Top = 83
        Caption = #1059#1095#1077#1090
        ParentColor = False
        ParentFont = False
        Style.Color = clBtnFace
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -13
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Visible = False
      end
      object cxLabel8: TcxLabel
        Left = 4
        Top = 58
        Caption = #1059#1095#1072#1089#1090#1086#1082':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object lbUch: TcxLabel
        Left = 103
        Top = 61
        Caption = 'lbUch'
      end
    end
    object paIssl: TPanel
      Left = 0
      Top = 374
      Width = 845
      Height = 41
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object cxLabel16: TcxLabel
        Left = 4
        Top = 8
        Caption = #1059#1089#1083#1091#1075#1072':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxNaz: TcxLabel
        Left = 102
        Top = 6
        Cursor = crHandPoint
        Caption = '<...>'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -19
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clTeal
        Style.IsFontAssigned = True
        OnClick = cxNazClick
      end
    end
    object paFIO: TPanel
      Left = 0
      Top = 0
      Width = 845
      Height = 73
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object cxLabel12: TcxLabel
        Left = 4
        Top = 8
        Caption = #8470' '#1060#1043':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = []
        Style.IsFontAssigned = True
      end
      object cxLabel1: TcxLabel
        Left = 4
        Top = 39
        Caption = #1055#1072#1094#1080#1077#1085#1090':'
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
      end
      object cxFam: TcxTextEdit
        Left = 102
        Top = 35
        Hint = #1060#1072#1084#1080#1083#1080#1103' '#1087#1072#1094#1080#1077#1085#1090#1072
        AutoSize = False
        ParentFont = False
        ParentShowHint = False
        Properties.Alignment.Vert = taVCenter
        Properties.CharCase = ecUpperCase
        ShowHint = True
        Style.BorderStyle = ebsOffice11
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clTeal
        Style.Font.Height = -16
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.IsFontAssigned = True
        StyleDisabled.BorderColor = clBtnText
        StyleDisabled.Color = clBtnFace
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.TextColor = clTeal
        StyleFocused.BorderColor = clInactiveCaptionText
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 0
        Text = 'FAM'
        OnClick = cxFamClick
        OnEnter = cxFamEnter
        OnKeyPress = cxFamKeyPress
        Height = 30
        Width = 245
      end
      object cxName: TcxTextEdit
        Left = 348
        Top = 35
        Hint = #1048#1084#1103' '#1087#1072#1094#1080#1077#1085#1090#1072
        AutoSize = False
        ParentFont = False
        ParentShowHint = False
        Properties.Alignment.Vert = taVCenter
        Properties.CharCase = ecUpperCase
        ShowHint = True
        Style.BorderStyle = ebsOffice11
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clTeal
        Style.Font.Height = -16
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.IsFontAssigned = True
        StyleDisabled.BorderColor = clBtnText
        StyleDisabled.Color = clBtnFace
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.TextColor = clTeal
        StyleFocused.BorderColor = clInactiveCaptionText
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 1
        Text = 'NAME'
        OnClick = cxNameClick
        OnEnter = cxNameEnter
        OnKeyPress = cxNameKeyPress
        Height = 30
        Width = 245
      end
      object cxOtch: TcxTextEdit
        Left = 594
        Top = 35
        Hint = #1054#1090#1095#1077#1089#1090#1074#1086' '#1087#1072#1094#1080#1077#1085#1090#1072
        AutoSize = False
        ParentFont = False
        ParentShowHint = False
        Properties.Alignment.Vert = taVCenter
        Properties.CharCase = ecUpperCase
        ShowHint = True
        Style.BorderStyle = ebsOffice11
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clTeal
        Style.Font.Height = -16
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.IsFontAssigned = True
        StyleDisabled.BorderColor = clBtnText
        StyleDisabled.Color = clBtnFace
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.TextColor = clTeal
        StyleFocused.BorderColor = clInactiveCaptionText
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 2
        Text = 'OTCH'
        OnClick = cxOtchClick
        OnEnter = cxOtchEnter
        OnKeyPress = cxOtchKeyPress
        Height = 30
        Width = 245
      end
      object cxLabel20: TcxLabel
        Left = 294
        Top = 17
        Caption = #1060#1072#1084#1080#1083#1080#1103
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel21: TcxLabel
        Left = 566
        Top = 17
        Caption = #1048#1084#1103
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel22: TcxLabel
        Left = 789
        Top = 17
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        ParentFont = False
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxNumIssl: TcxMaskEdit
        Left = 102
        Top = 10
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d+'
        Properties.MaxLength = 0
        Style.BorderStyle = ebsOffice11
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 8
        Width = 120
      end
    end
  end
  object BM: TdxBarManager
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = False
    Left = 736
    Top = 288
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
          ItemName = 'bbHistory'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbZakl'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbAgree'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbSend'
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
    object bbSend: TdxBarButton
      Action = actSend
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000007E18007C16007B1500791300781100761000750E00730D
        00700A006F08006D07006C05006A040068010000000000000000000000000000
        0000000000000000000000000000000000831C00CE8A55D58C48D38131D2781C
        D47614D7770EDA7709DD7803E07A00E47E00E78100DA75036C06000000000000
        00000000000000000000000000000000000000000000000000872100D2925ED8
        9351D68738D57D21D77B17DA7B11DD7C0CE17D06E47F02E88301EC8803E17D06
        710B000000000000000000000000000000000000000000000000000000000000
        008B2600D19363D69357D48740D27D28D37719D67814D9790FE6A254E9A452EC
        A751EFA952E7A252BE8E86000000000000000000000000000000000000000000
        000000000000000000912A00D1966BD59660D28A4AD08034D07720D27618D577
        13E4A1571F8B0B1D96281991241A8B21168321057F0800000000000000000000
        0000000000000000000000000000000000952E00D29B75D59A6CD28F57D08543
        CF7C30CF7620D17519E2A05B18981C75F4A642E27A44E17B43E07D0D8C190000
        00000000000000000000000000000000000000000000000000983200D4A281D6
        A17BD39666D08C53CF8442CF7D33CF7926DFA06117981B7CF2A640DD7443DC76
        42DC790C8C170000000000000000000000000000000000000000000000000000
        00983200D2A183D5A281D1986FCE8E5ECD8750CC8143CD7D38DDA36E169C1C85
        F6AD43E17845DE7847DF7C0C8E17000000000000000000000000000000000000
        000000000000000000983100983200993300993300993300993100CD9D85CD9C
        85CC9B8513981A8FF7B548E57C49E37D4AE27E0C8E1600000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000029106099D1017A7261CA93067F3994FE9834CE67F4AE27E1590260F99
        1E089410028B0500000000000000000000000000000000000000000000000000
        00000000000000000000000000000290056BE78A93FFC051F18853EC864FE882
        4DE78151EF8B3AD465028C050000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000028E055EDF7984
        FEB153F08852EC8653ED8A39D15F028C05000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000290065BDC7685FDB258F6913BD662028E0500000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000291065CE07958E27A0290050000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000028D06029005
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
    object bbZakl: TdxBarButton
      Action = aZakl
      Category = 0
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
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
      StyleEdit = frmMain.stSumDoza
    end
    object dxBarButton1: TdxBarButton
      Action = aAgree
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = aAgreeProc
      Category = 0
    end
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 768
    Top = 290
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
    object aHistory: TAction
      Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
      Hint = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1087#1086' '#1087#1072#1094#1080#1077#1085#1090#1091
      ShortCut = 16450
      OnExecute = aHistoryExecute
    end
    object actSend: TAction
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
      Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1085#1072' '#1072#1087#1087#1072#1088#1072#1090
      ShortCut = 120
      OnExecute = actSendExecute
    end
    object aZakl: TAction
      Caption = #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1077' '#1074#1088#1072#1095#1072
      ImageIndex = 25
      ShortCut = 118
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
      '  FROM asu.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM ' +
        '= '#39'AMBTALON_OPL'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F524445520100000000000A0000004643
      5F53594E4F4E494D010000000000}
    Session = frmMain.os
    Left = 1101
    Top = 103
  end
  object dsVidOplat: TDataSource
    DataSet = odsVidOplat
    Left = 1133
    Top = 103
  end
  object odsRegPrin: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FC_SYNONIM, FK_OWNER, FN_ORDER, FL_DEL  '
      '  FROM asu.TSMID '
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM ' +
        '= '#39'PD_MZ'#39')'
      '   AND FL_SHOWPRINT = 1 '
      '   AND FL_DEL = 0'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FC_SYNONIM, FK_OWNER, FN_ORDER, FL_DEL  '
      '  FROM asu.TSMID '
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
    Left = 1104
    Top = 232
  end
  object dsRegPrin: TDataSource
    DataSet = odsRegPrin
    Left = 1136
    Top = 233
  end
  object dsKorennoe: TDataSource
    DataSet = odsKorennoe
    Left = 1138
    Top = 195
  end
  object odsKorennoe: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER '
      '  FROM asu.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM ' +
        '= '#39'KOREN_NASEL'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Left = 1106
    Top = 195
  end
  object odsTarget: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER '
      '  FROM asu.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM ' +
        '= '#39'ISSL_TARGET'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Left = 1106
    Top = 43
  end
  object dsTarget: TDataSource
    DataSet = odsTarget
    Left = 1138
    Top = 43
  end
  object odsVidDoc: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_VIDDOCID '
      '  FROM asu.TDOCOBSL, asu.TAMBULANCE'
      ' WHERE TDOCOBSL.FK_ID = TAMBULANCE.FK_DOCOBSL'
      '   AND TAMBULANCE.FK_ID = :PFK_ID'
      ''
      '')
    Optimize = False
    Variables.Data = {0300000001000000070000003A50464B5F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000B000000464B5F564944444F434944010000000000}
    Session = frmMain.os
    BeforeOpen = odsVidDocBeforeOpen
    Left = 762
    Top = 203
  end
  object odsRgLaborant: TOracleDataSet
    SQL.Strings = (
      'SELECT 1 AS FK_ID, '#39' '#39' AS FC_FAM, FC_NAME'
      'FROM asu.TSMID'
      
        'WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM =' +
        ' '#39'RG_LABORANT'#39')'
      '  AND FL_DEL = 0'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_FAM, FC_FAM || '#39' '#39' || '
      
        '       DECODE(asu.VarcharIsNUll(FC_NAME), 1, '#39#39', SUBSTR(FC_NAME,' +
        ' 0, 1) || '#39'. '#39' || '
      
        '       DECODE (asu.VarcharIsNUll(FC_OTCH), 1, '#39#39', SUBSTR(FC_OTCH' +
        ', 0, 1) || '#39'. '#39')) AS FC_NAME'
      ' FROM asu.TSOTR '
      ' WHERE FK_OTDELID = :PFK_OTDELID'
      '   AND FK_SPRAVID = asu.GET_REGISTRATOR_FLUORO '
      '   AND FL_DEL = 0'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_FAM, FC_FAM || '#39' '#39' || '
      
        '       DECODE(asu.VarcharIsNUll(FC_NAME), 1, '#39#39', SUBSTR(FC_NAME,' +
        ' 0, 1) || '#39'. '#39' || '
      
        '       DECODE (asu.VarcharIsNUll(FC_OTCH), 1, '#39#39', SUBSTR(FC_OTCH' +
        ', 0, 1) || '#39'. '#39')) AS FC_NAME'
      ' FROM asu.TSOTR '
      ' WHERE FK_OTDELID = :PFK_OTDELID'
      
        '   AND (SELECT FC_NAME FROM asu.TS_SPRAV WHERE TS_SPRAV.FK_ID = ' +
        'TSOTR.FK_SPRAVID) = '#39#1052#1077#1076#1080#1094#1080#1085#1089#1082#1080#1081' '#1088#1077#1075#1080#1089#1090#1088#1072#1090#1086#1088#39
      '   AND FL_DEL = 0'
      ''
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
    Left = 1106
    Top = 291
  end
  object dsRgLaborant: TDataSource
    DataSet = odsRgLaborant
    Left = 1138
    Top = 291
  end
  object odsPeriod: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER '
      '  FROM asu.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM ' +
        '= '#39'XRAY_PERIOD_OSMOTROV'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Left = 1105
    Top = 339
  end
  object dsPeriod: TDataSource
    DataSet = odsPeriod
    Left = 1137
    Top = 339
  end
  object odsPriem: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER '
      '  FROM asu.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM ' +
        '= '#39'XRAY_PRIEM'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Left = 1107
    Top = 383
  end
  object dsPriem: TDataSource
    DataSet = odsPriem
    Left = 1139
    Top = 383
  end
  object odsApparat: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER '
      '  FROM asu.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM ' +
        '= '#39'XRAY_APPARAT'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Left = 1105
    Top = 150
  end
  object dsApparat: TDataSource
    DataSet = odsApparat
    Left = 1137
    Top = 150
  end
  object odsLaborant: TOracleDataSet
    SQL.Strings = (
      'SELECT 1 AS FK_ID, '#39' '#39' AS FC_FAM, FC_NAME'
      'FROM asu.TSMID'
      
        'WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM =' +
        ' '#39'RG_LABORANT'#39')'
      '  AND FL_DEL = 0'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_FAM, FC_FAM || '#39' '#39' || '
      
        '       DECODE(asu.VarcharIsNUll(FC_NAME), 1, '#39#39', SUBSTR(FC_NAME,' +
        ' 0, 1) || '#39'. '#39' || '
      
        '       DECODE (asu.VarcharIsNUll(FC_OTCH), 1, '#39#39', SUBSTR(FC_OTCH' +
        ', 0, 1) || '#39'. '#39')) AS FC_NAME'
      ' FROM asu.TSOTR '
      ' WHERE FK_OTDELID = :PFK_OTDELID'
      '   AND FK_SPRAVID = asu.GET_XRAY_LABORANT'
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
    BeforeOpen = odsLaborantBeforeOpen
    Left = 810
    Top = 155
  end
  object dsLaborant: TDataSource
    DataSet = odsLaborant
    Left = 842
    Top = 155
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
    Left = 1002
    Top = 139
  end
  object dsCompanyName: TDataSource
    DataSet = odsCompanyName
    Left = 1034
    Top = 139
  end
  object ApplicationEvents1: TApplicationEvents
    OnDeactivate = ApplicationEvents1Deactivate
    Left = 344
    Top = 216
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
    Left = 737
    Top = 152
  end
  object dxBarPopupMenu1: TdxBarPopupMenu
    BarManager = BM
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton1'
      end
      item
        Visible = True
        ItemName = 'dxBarButton2'
      end>
    UseOwnFont = False
    Left = 664
    Top = 200
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
    ReportOptions.LastChange = 41076.664357071760000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frAgreeProcGetValue
    Left = 584
    Top = 193
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
    Left = 1106
    Top = 427
  end
  object dsKemNapravlen: TDataSource
    DataSet = odsKemNapravlen
    Left = 1138
    Top = 427
  end
end
