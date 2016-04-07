object frmAdd: TfrmAdd
  Left = 276
  Top = 77
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077
  ClientHeight = 518
  ClientWidth = 707
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 701
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 13
      Top = 9
      Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
    end
    object teFio: TcxTextEdit
      Left = 113
      Top = 9
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.TextColor = clMaroon
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      OnClick = teFioClick
      OnEnter = teFioEnter
      OnKeyDown = teFioKeyDown
      Width = 376
    end
    object bFind: TcxButton
      Left = 495
      Top = 7
      Width = 29
      Height = 28
      Action = aSearch
      TabOrder = 2
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bClear: TcxButton
      Left = 530
      Top = 7
      Width = 29
      Height = 28
      Action = aClearSearch
      TabOrder = 3
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000007CB1006397
        00639700609600629300659300639200669B005B880000000000000000000000
        000000000000000000000000000000000072CE0080B9007DB8007AB50076B000
        78AE0075A5007DA70086AC008EB10091B3007E9B00758D006A8B00659B0071B2
        0000000000000000000000000000000000000000000000000074A7007FAA0083
        AC008BB10097BC009EC400B2DD00ABD500B4E000B5E200B1DC00A5CD0098BF00
        94B600728D0066990075BC000000000000000000000000000000000000000000
        0084BD0098C900A3C900B7E400B0DC00BEEE00B5E200BCEB00CBFD00B8E700C5
        F600B7E400A8D20096BC008EB2007A9B00699F00A19600000000000000000000
        00000000000000000000000085BE00BDEC00BFEF00BDED00C2F200B2E000D0FF
        00BDEC00D0FF00BEEE00BDED00ADD900A4CE008EB40087A9006F960077BB0000
        000000000000000000000000000000000000000094D8009FD300C2F100BFEE00
        BFEE00CCFF00BFEE00C8FB00C6F800C0F200C2F500B1E100A0CC0093BB0086A7
        007592007AB40000000000000000000000000000000000000000000000000089
        C200C7F900C6F700C4F600C1F300C2F300C4F700C0F300C3F600BDEF00B3E200
        A0CB008CB3007BA30070A01778A18A898A000000000000000000000000000000
        000000000000009EDA00A4D900C6F700C2F200C0F300C1F400BEF200BFF000BE
        F100BCEE00A5D40088BA0078AB4787A48A8D918D837F7B7E7C919C9C00000000
        00000000000000000000000000000000000092CD00C3F600C0F300BEEF00BDF0
        00BAEC00B4E500A7DB008AC31E84AE7597A6B2A49EA7A19D999E9E8791957254
        5564060600000000000000000000000000000000000000000000A4E500A9DD00
        BFF100B8EA00B0E20099CF0088BD4D94B4A9ACAFBFB1ABB0AFAEA7B0B39A989A
        7F4745770D009525006F07000000000000000000000000000000000000000000
        00000000009ED700A7DA0094CB1D91BE85AEC0D2C3BDC8C0BDBABEBFB2BDC49C
        807B8230218B1900A63A00AF4700B04A00771000000000000000000000000000
        00000000000000000000000000ACF64193AFAAB2B7E5D5CFD2CFCFC5CED4B8B9
        BE9A66578D2300A23200BA5000B95200B44E00B44E009D3800700D0000000000
        0000000000000000000000000000000000000000000000A89E9AACAEB0C9D6DF
        B9A29B9C4D2CA02C00BA4D00C75F00C15B00BC5600BA5400B953009A31008617
        00920000000000000000000000000000000000000000000000000000000000A8
        AFB2A06F52A43A00B74600CF6400CF6600CA6300C65E00C35D00C05A00BD5700
        9026009B1F000000000000000000000000000000000000000000000000000000
        00000000000000000000BA4500CE6900F2B96FE8A95FE0923CDD8E37DA8732CD
        7012C861009C3600931F00000000000000000000000000000000000000000000
        000000000000000000000000000000000000D50000B94A00B64C00BC5905B74F
        00B54300A63C00C3610BCF6801AD47009E2A0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        D04100B94A00B73A00000000A24100A83F00D36E02CF6800A53C00AD2D000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000AE3C00D76F00D87F21
        D67B18A33A00B031000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000000B5
        4000CF6800BD5600D3720BD16C02A73500000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000B44C00C36100B14B00AB4400D46F03AF4700A7360000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000FF0000AA4D00DA7400B95300DE7800B046
        00B63B0000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000BE4E00AB4500
        B54F00AE4600B140000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxLabel2: TcxLabel
      Left = 13
      Top = 36
      Caption = #1080#1089#1082#1072#1090#1100' '#1089#1088#1077#1076#1080':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
    end
    object cbTypePac: TcxComboBox
      Left = 113
      Top = 37
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        #1072#1084#1073#1091#1083#1072#1090#1086#1088#1085#1099#1093
        #1089#1090#1072#1094#1080#1086#1085#1072#1088#1085#1099#1093
        #1074#1089#1077#1093)
      Properties.PostPopupValueOnTab = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 5
      Width = 121
    end
  end
  object cxGr: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 71
    Width = 701
    Height = 394
    Margins.Top = 0
    Align = alTop
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    LookAndFeel.SkinName = ''
    object tvPac: TcxGridDBTableView
      OnKeyDown = tvPacKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvPacCellDblClick
      DataController.DataSource = dsPac
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'FIO'
          Column = VFIO
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Appending = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VFIO: TcxGridDBColumn
        Caption = #1060#1048#1054
        DataBinding.FieldName = 'FIO'
        VisibleForCustomization = False
        Width = 153
      end
      object VROJD: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
        DataBinding.FieldName = 'FD_ROJD'
        VisibleForCustomization = False
        Width = 185
      end
      object VNUMBER: TcxGridDBColumn
        Caption = #8470' '#1076#1086#1082'.'
        DataBinding.FieldName = 'NIB'
        Width = 181
      end
      object VTYPEDOC: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'FC_NAME'
      end
      object VSOS: TcxGridDBColumn
        Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
        DataBinding.FieldName = 'STEK_COC'
        Width = 179
      end
    end
    object cxGrLevel1: TcxGridLevel
      GridView = tvPac
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 468
    Width = 701
    Height = 47
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    ExplicitLeft = 240
    ExplicitTop = 480
    ExplicitWidth = 185
    ExplicitHeight = 41
    object cxButton2: TcxButton
      Left = 540
      Top = 11
      Width = 75
      Height = 25
      Action = aOk
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton1: TcxButton
      Left = 618
      Top = 11
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Images = frmMain.IL
    Left = 281
    Top = 226
    object aSearch: TAction
      Hint = #1055#1086#1080#1089#1082' '#1087#1072#1094#1080#1077#1085#1090#1072
      ImageIndex = 2
      ShortCut = 16397
      OnExecute = aSearchExecute
    end
    object aClearSearch: TAction
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1087#1086#1080#1089#1082#1072
      ShortCut = 119
      OnExecute = aClearSearchExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1087#1072#1094#1080#1077#1085#1090#1086#1074
      ImageIndex = 10
      ShortCut = 16464
    end
    object aText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 6
    end
    object aWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 7
    end
    object aXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 8
    end
    object aXLS: TAction
      Caption = 'Excel '#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel '#1092#1072#1081#1083
      ImageIndex = 9
    end
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object odsPac: TOracleDataSet
    SQL.Strings = (
      'SELECT TPEOPLES.FK_ID, TKARTA.FK_ID AS PACID,'
      
        '       TPEOPLES.FC_FAM||'#39' '#39'||TPEOPLES.FC_IM||'#39' '#39'|| TPEOPLES.FC_O' +
        'TCH FIO, '
      '       TPEOPLES.FD_ROJD,  '
      '       ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TPEOPLES.FK_ID) SEX,'
      '       TPEOPLES.FC_DOCSER, '
      '       TPEOPLES.FC_DOCNUM, '
      '       TPEOPLES.FD_DOCDATE, '
      '       ASU.GET_IB(TKARTA.FK_ID) AS NIB, TKARTA.FK_ID AS PACID,'
      
        '       DECODE(TKARTA.FP_TEK_COC,3,'#39#1042#1067#1055#1048#1057#1040#1053#39',2,'#39#1042' '#1057#1058#1040#1062#1048#1054#1053#1040#1056#1045#39',-2,' +
        #39#1053#1040' '#1054#1060#1054#1056#1052#1051#1045#1053#1048#1048' '#1055#1054#39','#39#39') STEK_COC,'
      '       0 AS IS_AMBULANCE,'
      '       TUSLVID.FC_NAME'
      ''
      
        '  FROM ASU.TPEOPLES, ASU.TKARTA, ASU.TPERESEL, ASU.TDOCOBSL, ASU' +
        '.TUSLVID'
      ' WHERE TKARTA.FK_PEPLID=TPEOPLES.FK_ID'
      '   AND GET_MAXPERESELID(TKARTA.FK_ID) = TPERESEL.FK_ID '
      '   AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID '
      '   AND TDOCOBSL.FK_VIDDOCID = TUSLVID.FK_ID')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000D00000005000000464B5F49440100000000000300000046494F0100
      000000000700000046445F524F4A440100000000000900000046435F444F4353
      45520100000000000900000046435F444F434E554D0100000000000A00000046
      445F444F4344415445010000000000030000004E494201000000000008000000
      5354454B5F434F43010000000000030000005345580100000000000500000050
      414349440100000000000700000050414349445F310100000000000C00000049
      535F414D42554C414E43450100000000000700000046435F4E414D4501000000
      0000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 121
    Top = 330
  end
  object dsPac: TDataSource
    DataSet = odsPac
    Left = 121
    Top = 282
  end
end
