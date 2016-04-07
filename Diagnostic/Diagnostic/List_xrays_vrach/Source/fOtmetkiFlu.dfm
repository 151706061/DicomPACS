object frmOtmetkiFlu: TfrmOtmetkiFlu
  Left = 261
  Top = 201
  BorderStyle = bsDialog
  Caption = #1054#1090#1084#1077#1090#1082#1080' '#1074#1088#1072#1095#1072' '#1060#1083#1102#1086#1088#1086#1075#1088#1072#1092#1080#1080
  ClientHeight = 264
  ClientWidth = 867
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
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 861
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 861
    Height = 33
    Margins.Top = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitTop = 33
    object cxLabel1: TcxLabel
      Left = 228
      Top = 5
      Caption = #1053#1086#1084#1077#1088' '#1082#1072#1076#1088#1072':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxLabel7: TcxLabel
      Left = 32
      Top = 5
      Caption = #1044#1072#1090#1072' '#1074#1099#1087'.:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxLbDays: TcxLabel
      Left = 405
      Top = 10
      Caption = #1055#1088#1077#1076#1091#1087#1088#1077#1078#1076#1077#1085#1080#1077'!'
      Style.TextColor = clRed
      Visible = False
    end
    object cxNumIssl: TcxLabel
      Left = 325
      Top = 6
      Caption = '--'
      ParentFont = False
      PopupMenu = pmNum
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Book Antiqua'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      OnMouseLeave = cxNumIsslMouseLeave
      OnMouseMove = cxNumIsslMouseMove
    end
    object cxDateRun: TcxLabel
      Left = 109
      Top = 6
      Caption = '--'
      ParentFont = False
      PopupMenu = pmDate
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Book Antiqua'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      OnMouseLeave = cxDateRunMouseLeave
      OnMouseMove = cxDateRunMouseMove
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 70
    Width = 861
    Height = 89
    Margins.Top = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 0
    ExplicitWidth = 859
    object cxLabel3: TcxLabel
      Left = 11
      Top = 5
      Caption = #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077'1:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxResume1: TcxRichEdit
      Left = 104
      Top = 5
      ParentFont = False
      Properties.MaxLength = 2500
      Properties.ScrollBars = ssVertical
      Style.BorderStyle = ebsOffice11
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Book Antiqua'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      Height = 51
      Width = 749
    end
    object cxLabel6: TcxLabel
      Left = 55
      Top = 60
      Caption = #1042#1088#1072#1095'1:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxSotr1: TcxLookupComboBox
      Left = 104
      Top = 63
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
      Properties.ListSource = dsSotr1
      Properties.ReadOnly = False
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 2
      Width = 159
    end
    object bbResume1: TcxButton
      Left = 74
      Top = 31
      Width = 25
      Height = 25
      Action = actResume1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
    object cxDate1: TcxDateEdit
      Left = 319
      Top = 63
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 5
      Width = 81
    end
    object cxLabel2: TcxLabel
      Left = 274
      Top = 61
      Caption = #1044#1072#1090#1072'1:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object lbTub: TcxLabel
      Left = 405
      Top = 59
      Caption = #1059#1095#1077#1090
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = 'Book Antiqua'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Visible = False
    end
    object bDelZakl1: TcxButton
      Left = 44
      Top = 31
      Width = 25
      Height = 25
      Action = aDelResume1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000206B0030AAE0000A600000000000000
        00000000000000000000A700009A0000A70000000000000000000000000000A9
        1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
        B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
        00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
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
        B80000B500000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 162
    Width = 861
    Height = 99
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 7
    ExplicitLeft = 0
    ExplicitTop = 169
    ExplicitWidth = 859
    ExplicitHeight = 111
    object cxLabel4: TcxLabel
      Left = 11
      Top = 5
      Caption = #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077'2:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxResume2: TcxRichEdit
      Left = 104
      Top = 6
      ParentFont = False
      Properties.MaxLength = 2500
      Properties.ScrollBars = ssVertical
      Style.BorderStyle = ebsOffice11
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Book Antiqua'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      Height = 51
      Width = 749
    end
    object cxLabel5: TcxLabel
      Left = 55
      Top = 63
      Caption = #1042#1088#1072#1095'2:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxSotr2: TcxLookupComboBox
      Left = 104
      Top = 65
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
      Properties.ListSource = dsSotr2
      Properties.ReadOnly = False
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 2
      Width = 159
    end
    object bbResume2: TcxButton
      Left = 74
      Top = 32
      Width = 25
      Height = 25
      Action = actResume2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
    object cxDate2: TcxDateEdit
      Left = 319
      Top = 65
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 5
      Width = 81
    end
    object cxLabel8: TcxLabel
      Left = 274
      Top = 62
      Caption = #1044#1072#1090#1072'2:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object bDelZakl2: TcxButton
      Left = 44
      Top = 32
      Width = 25
      Height = 25
      Action = aDelResume2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000206B0030AAE0000A600000000000000
        00000000000000000000A700009A0000A70000000000000000000000000000A9
        1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
        B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
        00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
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
        B80000B500000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object BM: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
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
    UseSystemFont = True
    Left = 571
    Top = 74
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
          ItemName = 'bbPrint'
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
    object bbPrint: TdxBarButton
      Action = actPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 635
    Top = 75
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 32
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 31
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object actResume1: TAction
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1081
      OnExecute = actResume1Execute
    end
    object actResume2: TAction
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1081
      OnExecute = actResume2Execute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1086#1090#1084#1077#1090#1086#1082
      ImageIndex = 10
      ShortCut = 16464
      OnExecute = actPrintExecute
    end
    object aDelResume1: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1077' 1'
      OnExecute = aDelResume1Execute
    end
    object aDelResume2: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1077' 2'
      OnExecute = aDelResume2Execute
    end
  end
  object odsSotr1: TOracleDataSet
    SQL.Strings = (
      'SELECT 1 AS FK_ID, '#39' '#39' AS FC_FAM, FC_NAME'
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'O' +
        'TMETKI_FLU_VRACH1'#39')'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_FAM, FC_FAM || '#39' '#39' || '
      
        '       DECODE(VarcharIsNUll(FC_NAME), 1, '#39#39', SUBSTR(FC_NAME, 0, ' +
        '1) || '#39'. '#39' || '
      
        '       DECODE (VarcharIsNUll(FC_OTCH), 1, '#39#39', SUBSTR(FC_OTCH, 0,' +
        ' 1) || '#39'. '#39')) AS FC_NAME'
      '  FROM TSOTR '
      ' WHERE FK_OTDELID = :PFK_OTDELID'
      '   AND FK_SPRAVID IN (GET_XRAY_VRACH, GET_ZAVOTDEL)'
      '   AND FL_DEL = 0'
      'ORDER BY FC_FAM')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A50464B5F4F5444454C49440300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000600000046435F46414D010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsSotr1BeforeOpen
    Left = 531
    Top = 145
  end
  object dsSotr1: TDataSource
    DataSet = odsSotr1
    Left = 578
    Top = 145
  end
  object pmZakl2: TPopupMenu
    Left = 712
    Top = 74
  end
  object dsSotr2: TDataSource
    DataSet = odsSotr2
    Left = 580
    Top = 195
  end
  object odsSotr2: TOracleDataSet
    SQL.Strings = (
      'SELECT 1 AS FK_ID, '#39' '#39' AS FC_FAM, FC_NAME'
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'O' +
        'TMETKI_FLU_VRACH1'#39')'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_FAM, FC_FAM || '#39' '#39' || '
      
        '       DECODE(VarcharIsNUll(FC_NAME), 1, '#39#39', SUBSTR(FC_NAME, 0, ' +
        '1) || '#39'. '#39' || '
      
        '       DECODE (VarcharIsNUll(FC_OTCH), 1, '#39#39', SUBSTR(FC_OTCH, 0,' +
        ' 1) || '#39'. '#39')) AS FC_NAME'
      '  FROM TSOTR '
      ' WHERE FK_OTDELID = :PFK_OTDELID '
      '   AND FK_SPRAVID IN (GET_XRAY_VRACH, GET_ZAVOTDEL)'
      '   AND FL_DEL = 0'
      'ORDER BY FC_FAM')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A50464B5F4F5444454C49440300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000600000046435F46414D010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsSotr2BeforeOpen
    Left = 533
    Top = 195
  end
  object frxRepOtmetkiFlu: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39563.605315567130000000
    ReportOptions.LastChange = 40040.548940740740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepOtmetkiFluGetValue
    Left = 527
    Top = 76
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
      LeftMargin = 5.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 344.260050000000000000
        Top = 18.897650000000000000
        Width = 748.346940000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 41.574830000000000000
          Width = 740.787880000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1112#1056#181#1057#8218#1056#1108#1056#1105' '#1057#1026#1056#181#1056#1029#1057#8218#1056#1110#1056#181#1056#1029#1056#1109#1056#187#1056#1109#1056#1110#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 7.559060000000000000
          Top = 102.047310000000000000
          Width = 135.289400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039':')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 34.015770000000000000
          Top = 83.149660000000000000
          Width = 108.867990000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1108#1056#176#1056#1169#1057#1026#1056#176':')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 37.795300000000000000
          Top = 130.606370000000000000
          Width = 107.399060000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1056#1105#1056#181'1:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 147.401670000000000000
          Top = 130.606370000000000000
          Width = 597.165740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[ZAKL1]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 45.354360000000000000
          Top = 157.063080000000000000
          Width = 102.880000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#176#1057#8225'1:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 442.205010000000000000
          Top = 157.063080000000000000
          Width = 53.564700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176'1:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 45.354360000000000000
          Top = 194.858380000000000000
          Width = 99.840000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1056#1105#1056#181'2:')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 147.401670000000000000
          Top = 194.858380000000000000
          Width = 597.165740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[ZAKL2]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 45.354360000000000000
          Top = 223.094620000000000000
          Width = 102.880000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#176#1057#8225'2:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 442.205010000000000000
          Top = 223.315090000000000000
          Width = 53.564700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176'2:')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 3.779530000000000000
          Width = 740.787880000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]'
            '[OTDELNAME]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 147.401670000000000000
          Top = 102.047310000000000000
          Width = 86.155510000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[DATE_ISSL]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 147.401670000000000000
          Top = 83.149660000000000000
          Width = 93.714570000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[NUM_KADR]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 151.181200000000000000
          Top = 157.740260000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[VRACH1]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 498.897960000000000000
          Top = 157.740260000000000000
          Width = 246.320730000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[DATE1]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 151.181200000000000000
          Top = 222.992270000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[VRACH1]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 498.897960000000000000
          Top = 222.992270000000000000
          Width = 246.320730000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[DATE2]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 423.307360000000000000
        Width = 748.346940000000000000
        object Memo13: TfrxMemoView
          Left = 3.779530000000000000
          Width = 740.787880000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADESIGN]')
          ParentFont = False
        end
      end
    end
  end
  object pmDate: TPopupMenu
    Left = 680
    Top = 14
    object N1: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00914413009144
        1300914413009144130091441300914413009144130091441300FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00F7E6DA00F5E0
        D100F3DAC800F1D3BE00EFCDB500EDC7AC00EDC7AC0091441300FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00F9EDE500F7E6
        DA00F5E0D100F3DAC800F2D6C300F0D0BA00EECAB00091441300FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00FCF5F000D383
        5700D3835700D3835700D3835700D3835700F0D0BA0091441300FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00FFFFFF00FDF8
        F500FAF1EA00F8EADF00F6E3D500F4DDCC00F2D6C30091441300CEB8AA007A5A
        46007A5A46007A5A46007A5A46007A5A46007A5A4600E0A98B00FFFFFF00D383
        5700D3835700D3835700D3835700D3835700F4DDCC0091441300CEB8AA00EFE7
        E300EBE1DC00E7DBD500E3D5CD00DFCFC600DBC9BF00E0A98B00FFFFFF00FFFF
        FF00FFFFFF00FDF8F500FAF1EA00F8EADF00F6E3D50091441300CEB8AA00F4EE
        EB00EFE7E300EBE1DC00E7DBD500E5D8D100E1D2CA00E0A98B00FFFFFF00D383
        5700D3835700FFFFFF00E0A98B00AB542800AB542800AB542800CEB8AA00F9F5
        F300DFA98300DFA98300DFA98300DFA98300DFA98300E0A98B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E0A98B00F3EBE600AB542800FF00FF00CEB8AA00FFFF
        FF00FBF8F700F6F1EF00F1EAE700EDE4DF00E9DED800E0A98B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E8A98B00C56A3100FF00FF00FF00FF00CEB8AA00FFFF
        FF00DFA98300DFA98300DFA98300DFA98300DFA98300E0A98B00E0A98B00E0A9
        8B00E0A98B00E0A98B00E0A98B00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
        FF00FFFFFF00FFFFFF00FBF8F700F6F1EF00F1EAE700EDE4DF0069473100FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
        FF00DFA98300DFA98300FFFFFF00CEB8AA00694731006947310069473100FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00CEB8AA00F3EBE60069473100FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00CEB8AA0069473100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00CEB8
        AA00CEB8AA00CEB8AA00CEB8AA00CEB8AA00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' "'#1044#1072#1090#1072' '#1074#1099#1087'."'
      OnClick = N1Click
    end
  end
  object pmNum: TPopupMenu
    Left = 736
    Top = 16
    object N2: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00914413009144
        1300914413009144130091441300914413009144130091441300FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00F7E6DA00F5E0
        D100F3DAC800F1D3BE00EFCDB500EDC7AC00EDC7AC0091441300FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00F9EDE500F7E6
        DA00F5E0D100F3DAC800F2D6C300F0D0BA00EECAB00091441300FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00FCF5F000D383
        5700D3835700D3835700D3835700D3835700F0D0BA0091441300FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00FFFFFF00FDF8
        F500FAF1EA00F8EADF00F6E3D500F4DDCC00F2D6C30091441300CEB8AA007A5A
        46007A5A46007A5A46007A5A46007A5A46007A5A4600E0A98B00FFFFFF00D383
        5700D3835700D3835700D3835700D3835700F4DDCC0091441300CEB8AA00EFE7
        E300EBE1DC00E7DBD500E3D5CD00DFCFC600DBC9BF00E0A98B00FFFFFF00FFFF
        FF00FFFFFF00FDF8F500FAF1EA00F8EADF00F6E3D50091441300CEB8AA00F4EE
        EB00EFE7E300EBE1DC00E7DBD500E5D8D100E1D2CA00E0A98B00FFFFFF00D383
        5700D3835700FFFFFF00E0A98B00AB542800AB542800AB542800CEB8AA00F9F5
        F300DFA98300DFA98300DFA98300DFA98300DFA98300E0A98B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E0A98B00F3EBE600AB542800FF00FF00CEB8AA00FFFF
        FF00FBF8F700F6F1EF00F1EAE700EDE4DF00E9DED800E0A98B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E8A98B00C56A3100FF00FF00FF00FF00CEB8AA00FFFF
        FF00DFA98300DFA98300DFA98300DFA98300DFA98300E0A98B00E0A98B00E0A9
        8B00E0A98B00E0A98B00E0A98B00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
        FF00FFFFFF00FFFFFF00FBF8F700F6F1EF00F1EAE700EDE4DF0069473100FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
        FF00DFA98300DFA98300FFFFFF00CEB8AA00694731006947310069473100FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00CEB8AA00F3EBE60069473100FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00CEB8AA0069473100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00CEB8
        AA00CEB8AA00CEB8AA00CEB8AA00CEB8AA00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' "'#1053#1086#1084#1077#1088' '#1082#1072#1076#1088#1072'"'
      OnClick = N2Click
    end
  end
end
