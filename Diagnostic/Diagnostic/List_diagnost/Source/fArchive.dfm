object frmArchive: TfrmArchive
  Left = 199
  Top = 19
  HelpContext = 12
  Caption = #1040#1088#1093#1080#1074
  ClientHeight = 677
  ClientWidth = 1017
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1011
    Height = 28
    Align = dalTop
    BarManager = BMArchive
    SunkenBorder = True
    UseOwnColor = True
    UseOwnSunkenBorder = True
  end
  object cxGrArch: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 1011
    Height = 640
    Margins.Top = 0
    Align = alClient
    PopupMenu = pmTVArch
    TabOrder = 1
    ExplicitTop = 33
    ExplicitHeight = 641
    object TVARCHIVE: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = TVARCHIVECellDblClick
      DataController.DataSource = dsArchive
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = TVFIOPAC
        end
        item
          Kind = skSum
          FieldName = 'DOZA_PAC'
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      object TVIMAGE: TcxGridDBColumn
        Caption = '_'
        DataBinding.FieldName = 'COUNTIMAGE'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = ilImages
        Properties.Items = <
          item
          end
          item
            ImageIndex = 1
            Tag = 1
            Value = 1
          end
          item
            ImageIndex = 1
            Tag = 2
            Value = 2
          end
          item
            ImageIndex = 1
            Tag = 3
            Value = 3
          end
          item
            ImageIndex = 1
            Tag = 4
            Value = 4
          end
          item
            ImageIndex = 1
            Tag = 5
            Value = 5
          end
          item
            ImageIndex = 1
            Tag = 6
            Value = 6
          end
          item
            ImageIndex = 1
            Tag = 7
            Value = 7
          end
          item
            ImageIndex = 1
            Tag = 8
            Value = 8
          end
          item
            ImageIndex = 1
            Tag = 9
            Value = 9
          end
          item
            ImageIndex = 1
            Tag = 10
            Value = 10
          end
          item
            ImageIndex = 1
            Tag = 11
            Value = 11
          end
          item
            ImageIndex = 1
            Tag = 12
            Value = 12
          end
          item
            ImageIndex = 1
            Tag = 13
            Value = 13
          end
          item
            ImageIndex = 1
            Tag = 14
            Value = 14
          end>
        Properties.ReadOnly = True
        MinWidth = 64
        Options.Editing = False
        Options.ShowEditButtons = isebNever
        Options.HorzSizing = False
        Options.Moving = False
      end
      object TVDATE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'FD_DATE'
        Options.Editing = False
        Width = 50
      end
      object TVFIOPAC: TcxGridDBColumn
        Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
        DataBinding.FieldName = 'PACFIO'
        Options.Editing = False
        Width = 148
      end
      object TVDATEROJD: TcxGridDBColumn
        Caption = #1043#1086#1076' '#1088#1086#1078#1076
        DataBinding.FieldName = 'FD_ROJD'
        Options.Editing = False
        Width = 57
      end
      object TVKEMNAPR: TcxGridDBColumn
        Caption = #1050#1077#1084' '#1085#1072#1087#1088#1072#1074#1083#1077#1085
        DataBinding.FieldName = 'KEM'
        Options.Editing = False
        Width = 84
      end
      object TVSMIDNAME: TcxGridDBColumn
        Caption = #1042#1080#1076
        DataBinding.FieldName = 'SMIDNAME'
        Options.Editing = False
        Width = 47
      end
      object TVFC_NAME: TcxGridDBColumn
        Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Options.Editing = False
        Width = 89
      end
      object TVVRACHFIO: TcxGridDBColumn
        Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
        DataBinding.FieldName = 'VRACHFIO'
        Options.Editing = False
        Width = 92
      end
      object TVSTATE: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1091#1089
        DataBinding.FieldName = 'STATE'
        Width = 68
      end
      object TVOTDEL: TcxGridDBColumn
        Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1077
        DataBinding.FieldName = 'OTDEL'
        Width = 304
      end
    end
    object cxGrArchLevel1: TcxGridLevel
      GridView = TVARCHIVE
    end
  end
  object BMArchive: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = IL
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 32
    Top = 160
    DockControlHeights = (
      0
      0
      0
      0)
    object BMArchiveBar1: TdxBar
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
      FloatTop = 344
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbParam'
        end
        item
          Visible = True
          ItemName = 'bbRefreshArchive'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbResultArchive'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrintArch'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbCloseArchive'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = #1055#1072#1085#1077#1083#1100'_1'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbRefreshArchive: TdxBarButton
      Action = aRefreshArchive
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbCloseArchive: TdxBarButton
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbResultArchive: TdxBarButton
      Action = aProsmotr
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrintArch: TdxBarButton
      Action = aPrintArch
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbParam: TdxBarButton
      Action = aParam
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000794141733F3F763F3F
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000914747844A4A5C636300000085
        4D4DBC8B8B7F4C4C784343624343733B3B713939773B3B000000000000000000
        000000000000000000000000000000000000000000000000713636804C4C8D5A
        5A814A4A7F4B4B956262E6C7C7AB7E7E774242703B3BC28E8EAE7C7C713A3A00
        0000000000000000000000000000000000000000000000000000000000000000
        8D5656AF8888D5B4B4A47070C49090EDC0C0DEC0C0D4B0B0B07D7DD3A2A2E3BC
        BCCBA4A4743D3D00000000000000000000000000000000000000000000000000
        0000000000000000935959A77C7CEBD3D3E4CBCBE2C5C5E1C6C6E3C8C8E4CACA
        E3C8C8DBBABADDBABAA57979744040782F2F9400000000000000000000000000
        000000000000000000000000009B6060905F5F895555CFAFAFE5CCCCE1C6C6E3
        C9C9E2C6C6E0C4C4E0C4C4E4CDCDE0C0C0B588888A55558C5B5B7A4646000000
        000000000000000000000000000000000000000000936060AF7A7AA26B6BE3CC
        CCE1C5C5E7D0D0E6CDCDD6B0B0DBB2B2E1C0C0DFC0C0E6CDCDD9B7B7D3A7A7EB
        C1C1804C4C7D4747000000000000000000000000000000000000000000A47474
        F3DEDEECD8D8E3CACAE6D1D1EBD7D7AD7C7CC28B8BD9A4A4DAA5A5E0BEBEDFC2
        C2E2C5C5DFBDBDD9B6B6855353803E3E00000000000000000000000000000000
        0000000000A97B7BE9D7D7F3E5E5E1C3C3EDDDDDDEC7C78F5757000000000000
        D19A9AD6AEAEE1C4C4E4C8C8BC94947E4A4A8249490000000000000000000000
        00000000000000000000000000AB7575A36C6CBB9191E6CECEEBD8D8F0E1E185
        50508B5555A06767AB7777DDC0C0E2C6C6E3C6C6B68B8B834F4F875454000000
        000000000000000000000000000000000000000000000000B78181B17D7DF3E8
        E8DEBEBEF2E5E5E5D0D0BF9696C9A1A1E6CECEE6CFCFE2C5C5E2C5C5DFC1C1B1
        8484835050713B3B7039397C3D3D000000000000000000000000000000000000
        BD8383F8EEEEF8F0F0EBD8D8E0C2C2F0E2E2F1E1E1EDDCDCEAD5D5E2C7C7E2C5
        C5D1B2B2DDBFBFAB7F7F784646916464A06F6F733C3C00000000000000000000
        0000000000000000C28888DFC9C9D7B8B8D1AFAFEAD8D8E0C1C1E0C2C2E0C2C2
        DFC1C1E5CBCBB389899660608E5858956161A36E6ED9B6B6DFBBBB713B3B7540
        40753B3B6A3C3C000000000000000000D19999C99191C68E8EBB8686C79D9DF7
        EEEEE2CBCBCCAAAAD9BEBEEFDDDDB48989D4B2B2DCC0C0E2BCBCE4C5C5E1C6C6
        DFBFBFAD7F7FB380809B68686D38380000000000000000000000000000000000
        00CF9595CA9F9FF0E2E2B68080B77C7CA97575CDABABA47373AB8181ECD7D7E6
        CECEE8D2D2E4CBCBE6D0D0E2C6C6DFBBBBCCA4A4703B3B000000000000000000
        000000000000000000AB7171D39A9AC89090D09797000000C58B8B9F6A6AA36D
        6DCDA9A9E7D1D1E7D1D1C79898D5A2A2E3B4B4E3CACADFBEBE7F4B4B73414100
        0000000000000000000000000000000000000000000000000000000000000000
        000000A97171F8E1E1F1E2E2E4CACAD1B4B4A56D6DB57A7AD29E9EE1C5C5E4C5
        C5814C4C7F4B4B00000000000000000000000000000000000000000000000000
        0000000000000000000000AF7777DAC3C3F0E4E4E2C6C6DFCACAA26C6CBA8686
        DCBABADFC1C1E1C2C2C198987F4C4C0000000000000000000000000000000000
        00000000000000000000000000000000000000C08787AC7575B78888F0DFDFE1
        C2C2EEDCDCEED9D9E2C4C4DCBDBDD3B0B0B58B8B824F4F000000000000000000
        000000000000000000000000000000000000000000000000000000000000C48A
        8AC39797FBF6F6ECDBDBDFC0C0DEBDBDE3C7C7A471719A6363985F5F995C5C00
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000DA9B9BC69898D7B7B7B98484B27E7ED3B3B3E2C9C9A86E6E0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000D19A9AC39090C17E7E9A7F7FB07B7B
        A57373AD77770000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
  end
  object alArchive: TActionList
    Images = IL
    Left = 32
    Top = 208
    object aRefreshArchive: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      ShortCut = 116
      OnExecute = aRefreshArchiveExecute
    end
    object aProsmotr: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      ImageIndex = 2
      ShortCut = 118
      OnExecute = aProsmotrExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 1
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aSearchDate: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100'...'
      Hint = #1042#1099#1073#1088#1072#1090#1100'...'
      ImageIndex = 10
    end
    object aPref: TAction
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      Hint = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 8
      ShortCut = 16462
    end
    object aText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 5
      OnExecute = aTextExecute
    end
    object aWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 6
      OnExecute = aWebExecute
    end
    object aXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 7
      OnExecute = aXMLExecute
    end
    object aXLS: TAction
      Caption = #1058#1072#1073#1083#1080#1094#1072' MS Excel'
      ImageIndex = 8
      OnExecute = aXLSExecute
    end
    object aPrintArch: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100
      ImageIndex = 0
      ShortCut = 16464
      OnExecute = aPrintArchExecute
    end
    object aSnimok: TAction
      Caption = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
      Hint = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
      ImageIndex = 19
      ShortCut = 16416
      SecondaryShortCuts.Strings = (
        'ctrl+enter')
      OnExecute = aSnimokExecute
    end
    object aParam: TAction
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      Hint = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1073#1086#1088#1082#1080' '#1072#1088#1093#1080#1074#1072
      OnExecute = aParamExecute
    end
  end
  object odsArchive: TOracleDataSet
    SQL.Strings = (
      'SELECT TNAZIS.ROWID, '
      '       TNAZIS.FK_ID,'
      '       TNAZIS.FK_PACID, '
      '       TNAZIS.FK_NAZSOSID,'
      '       TRUNC(TNAZIS.FD_RUN) FD_DATE,'
      '       GET_FULLPATH_SHA(TNAZIS.FK_SMID) FC_NAME, '
      
        '       GET_SMIDNAME(GET_OWNER_FROM_SMID(TNAZIS.FK_SMID)) SMIDNAM' +
        'E, '
      '       0 AS "FK_OWNER", '
      
        '       PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(TNAZIS.FK_PACID) PACFI' +
        'O, '
      '       DO_VRACHFIO(TNAZIS.FK_VRACHID) KEM, '
      '       DO_VRACHFIO(TNAZIS.FK_ISPOLID) VRACHFIO,'
      
        '       (SELECT FD_ROJD FROM TPEOPLES WHERE FK_ID = (SELECT FK_PE' +
        'PLID FROM TKARTA WHERE FK_ID = TNAZIS.FK_PACID '
      '                                                    UNION '
      
        '                                                    SELECT FK_PE' +
        'PLID FROM TAMBULANCE WHERE FK_ID = TNAZIS.FK_PACID)) FD_ROJD,'
      '       (SELECT COUNT(*) '
      '          FROM ASU.TRICHVIEWDATA, ASU.THTMLIMAGES '
      '         WHERE TRICHVIEWDATA.FK_PACID = TNAZIS.FK_ID'
      
        '           AND THTMLIMAGES.FK_RICHVIEW=TRICHVIEWDATA.FK_ID) COUN' +
        'TIMAGE,'
      
        '       DECODE(TNAZIS.FK_NAZSOSID, 2, '#39#1053#1045' '#1042#1067#1055'.'#39', 1, '#39#1042#1067#1055'.'#39', -11, ' +
        #39#1042#1067#1055'. '#1052#1051'. '#1057#1054#1058#1056'.'#39', 89, '#39#1056#1045#1050#1054#1052#1045#1053#1044#1054#1042#1040#1053#1054#39', 23, '#39#1054#1058#1052#1045#1053#1045#1053#1054#39') STATE,'
      
        '       PKG_REGIST_PACFUNC.GET_PAC_FCOTDEL(TNAZIS.FK_PACID) AS OT' +
        'DEL    '
      ''
      '  FROM (SELECT FK_ID, FK_SMID FROM TSMID_RIGHTS '
      '         WHERE FK_SOTRID=:PSOTR '
      
        '           AND PKG_SMID.GETROOTLEVELID1(FK_SMID) IN (GET_PROCID,' +
        'GET_KONSID,GET_ISSLEDID,GET_ANALID)) SM,'
      '        TNAZIS '
      ' WHERE TNAZIS.FK_SMID=SM.FK_SMID'
      '   AND TRUNC(TNAZIS.FD_RUN) >= :PFD_DATE1 '
      '   AND TRUNC(TNAZIS.FD_RUN) <=:PFD_DATE2'
      '   AND TNAZIS.FK_NAZSOSID IN (GET_VIPNAZ, GET_NAZCANCEL)'
      '   '
      ' ORDER BY TRUNC(TNAZIS.FD_RUN) ASC'
      '')
    Optimize = False
    Variables.Data = {
      03000000030000000A0000003A5046445F44415445310C000000000000000000
      00000A0000003A5046445F44415445320C000000000000000000000006000000
      3A50534F5452030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000700000046435F4E414D4501000000000005000000464B5F
      494401000000000008000000464B5F4F574E45520100000000000B000000464B
      5F4E415A534F53494401000000000008000000565241434846494F0100000000
      000700000046445F444154450100000000000600000050414346494F01000000
      00000700000046445F524F4A44010000000000030000004B454D010000000000
      0A000000434F554E54494D41474501000000000008000000534D49444E414D45
      01000000000008000000464B5F50414349440100000000000500000053544154
      45010000000000050000004F5444454C010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsArchiveBeforeOpen
    AfterOpen = odsArchiveAfterOpen
    AfterScroll = odsArchiveAfterScroll
    Left = 160
    Top = 176
    object odsArchiveFK_ID: TFloatField
      FieldName = 'FK_ID'
      Required = True
    end
    object odsArchiveFK_PACID: TFloatField
      FieldName = 'FK_PACID'
    end
    object odsArchiveFK_NAZSOSID: TFloatField
      FieldName = 'FK_NAZSOSID'
    end
    object odsArchiveFD_DATE: TDateTimeField
      FieldName = 'FD_DATE'
    end
    object odsArchiveFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Size = 4000
    end
    object odsArchiveSMIDNAME: TStringField
      FieldName = 'SMIDNAME'
      Size = 4000
    end
    object odsArchiveFK_OWNER: TFloatField
      FieldName = 'FK_OWNER'
    end
    object odsArchivePACFIO: TStringField
      FieldName = 'PACFIO'
      Size = 4000
    end
    object odsArchiveKEM: TStringField
      FieldName = 'KEM'
      Size = 4000
    end
    object odsArchiveVRACHFIO: TStringField
      FieldName = 'VRACHFIO'
      Size = 4000
    end
    object odsArchiveFD_ROJD: TDateTimeField
      FieldName = 'FD_ROJD'
    end
    object odsArchiveCOUNTIMAGE: TFloatField
      FieldName = 'COUNTIMAGE'
    end
    object odsArchiveSTATE: TStringField
      FieldName = 'STATE'
      Size = 14
    end
    object odsArchiveOTDEL: TStringField
      FieldName = 'OTDEL'
      Size = 4000
    end
  end
  object dsArchive: TDataSource
    DataSet = odsArchive
    Left = 208
    Top = 176
  end
  object sdPopUpArch: TSaveDialog
    Left = 33
    Top = 259
  end
  object pmTVArch: TPopupMenu
    Images = IL
    Left = 32
    Top = 306
    object N1: TMenuItem
      Action = aPrintArch
    end
    object MenuItem3: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 4
      object MenuItem4: TMenuItem
        Action = aText
      end
      object MenuItem5: TMenuItem
        Action = aWeb
      end
      object MenuItem6: TMenuItem
        Action = aXML
      end
      object MenuItem7: TMenuItem
        Action = aXLS
      end
    end
    object N2: TMenuItem
      Action = aSnimok
    end
    object N3: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FDF1
        E500FDF1E500FFEDD500FFE9CE00FFE3C500FEDEBC00FFDAB100FFD5A600FFD1
        9F00FFCC9800FFD8A100BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FBF3
        EA00FBF3EA00FFEFDC00FFEDD500FEE5CA00FFE3C500FFDAB100FFDAB100FFD5
        A600FFCC9800FFD8A100BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF6
        F000FBF3EA00FDF1E500FFEDD500FFE9CE00FFE3C500FEDEBC00FFDAB100FED7
        AB00FFD5A600FFD5A600BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FBF3EA00FDF1E500FFEDD500FEE5CA00FFE3C500FEDEBC00FFDA
        B100FFD8A100FED7AB00BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FCF8F700FDF1E500FFEFDC00FFEDD500FEE5CA00FFE9C200DEC2
        B100DEBDA600FFE9B200BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FCF8F700FCF8F700FBF3EA00FDF1E500FFF2D700D9C2C100090A
        9000090A9000D5BBAC00BC4B0000FF00FF00090A900000028F00BC4B0000FAEF
        E500FBF3EA00FBF3EA00FDF1E500FAE7D400FEE5CA00FFE3C500C1A5A700090A
        9000112DEA00090A900065416600090A90000622EB0000039200BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000EF9037009754
        3D00090A90001933E200090A9000122DE50000039200FF00FF00FF00FF00BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
        000045265800090A90003C66FF00090A9000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00090A9000354CE000090A90002C46E700090A9000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00090A
        90004F65E70006099000FF00FF00090A90002C46E70006099000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00090A
        9000090A9000FF00FF00FF00FF00FF00FF000609900000028F00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      OnClick = N3Click
    end
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
    ReportOptions.CreateDate = 39022.437743958300000000
    ReportOptions.LastChange = 40040.590664965280000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 560
    Top = 216
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 85.047310000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo14: TfrxMemoView
          Left = 13.858276670000000000
          Top = 7.559059999999999000
          Width = 95.748093330000000000
          Height = 40.314986670000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 113.385900000000000000
          Top = 7.559059999999999000
          Width = 337.638013330000000000
          Height = 40.314986670000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#160#1056#181#1056#183#1057#1107#1056#187#1057#1034#1057#8218#1056#176#1057#8218' '#1056#1109#1057#8218#1056#177#1056#1109#1057#1026#1056#176' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#8470'.')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 117.165430000000000000
          Top = 58.472480000000000000
          Width = 249.448980000000000000
          Height = 26.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            ' '#1056#164#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039' '#1056#152#1056#1112#1057#1039' '#1056#1115#1057#8218#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 366.614410000000000000
          Top = 58.692950000000000000
          Width = 113.385900000000000000
          Height = 26.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            ' '#1056#8220#1056#1109#1056#1169' '#1057#1026#1056#1109#1056#182#1056#1169)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 480.000310000000000000
          Top = 58.472480000000000000
          Width = 222.992270000000000000
          Height = 26.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            ' '#1056#1113#1056#181#1056#1112' '#1056#1029#1056#176#1056#1111#1057#1026#1056#176#1056#1030#1056#187#1056#181#1056#1029)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 703.213050000000000000
          Top = 58.692950000000000000
          Width = 207.874150000000000000
          Height = 26.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            ' '#1056#152#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.000000000000000000
          Top = 58.472480000000000000
          Width = 114.385900000000000000
          Height = 26.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            ' '#1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 910.866730000000000000
          Top = 58.472480000000000000
          Width = 128.504020000000000000
          Height = 26.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            ' '#1056#8217#1057#1026#1056#176#1057#8225)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 46.252010000000000000
        Top = 166.299320000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo8: TfrxMemoView
          Left = 2.779530000000000000
          Top = 0.677179999999992800
          Width = 114.385900000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            ' [frxDBDataset1."FD_DATE"]')
        end
        object Memo9: TfrxMemoView
          Left = 117.165430000000000000
          Top = 0.677179999999992800
          Width = 249.448980000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            ' [frxDBDataset1."PACFIO"]')
        end
        object Memo10: TfrxMemoView
          Left = 366.614410000000000000
          Top = 0.677179999999992800
          Width = 113.385900000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            ' [frxDBDataset1."FD_ROJD"]')
        end
        object Memo11: TfrxMemoView
          Left = 480.000310000000000000
          Top = 0.897649999999998700
          Width = 222.992270000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            ' [frxDBDataset1."KEM"]')
        end
        object Memo12: TfrxMemoView
          Left = 702.992580000000000000
          Top = 0.677179999999992800
          Width = 207.874150000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."FC_NAME"]')
        end
        object Memo13: TfrxMemoView
          Left = 910.866730000000000000
          Top = 0.677179999999992800
          Width = 128.504020000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."VRACHFIO"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.456710000000000000
        Top = 328.819110000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 933.603122640000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page#]')
        end
      end
      object Footer1: TfrxFooter
        Height = 34.015770000000010000
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        object Memo16: TfrxMemoView
          Width = 367.874253330000000000
          Height = 21.417336670000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#8470': [COUNT(MasterData1)]')
          ParentFont = False
          WordBreak = True
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FD_DATE=FD_DATE'
      'FC_NAME=FC_NAME'
      'FK_ID=FK_ID'
      'FK_OWNER=FK_OWNER'
      'PACFIO=PACFIO'
      'FK_NAZSOSID=FK_NAZSOSID'
      'KEM=KEM'
      'VRACHFIO=VRACHFIO'
      'FD_ROJD=FD_ROJD')
    DataSet = odsArchive
    BCDToCurrency = False
    Left = 480
    Top = 216
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CNT=CNT')
    BCDToCurrency = False
    Left = 480
    Top = 272
  end
  object odsImages: TOracleDataSet
    SQL.Strings = (
      
        'SELECT ROWNUM, THTMLIMAGES.FC_NAME||'#39'.JPG'#39' SFILENAME, THTMLIMAGE' +
        'S.FB_BLOB '
      '  FROM ASU.TRICHVIEWDATA, ASU.THTMLIMAGES '
      ' WHERE TRICHVIEWDATA.FK_PACID = :PFK_PACID'
      '   AND THTMLIMAGES.FK_RICHVIEW=TRICHVIEWDATA.FK_ID')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464B5F504143494403000000000000000000
      0000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 208
    Top = 272
  end
  object ilImages: TImageList
    Left = 184
    Top = 360
    Bitmap = {
      494C010102000400180010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A6A8A900A6A8A900A6A8
      A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8
      A900A6A8A900A6A8A900A6A8A90000000000000000004F4F500053565700393A
      3A005356570066696A00666A6B005C5F5F0056585800505152004C4F4F004548
      4900414142003A3B3C0030303000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009EB7E1009DC1FB009EBF
      FA009FBFFA00A0BFFB00A1C3FD00A7C5FF00A9C6FF00A9C8FF00ADC8FF00AAC8
      FF00AAC8FF00A8C6FF0096A8C90000000000000000002F2F3000373745004246
      74003E3740003F363F003C3A40003E4048003D3E460039363F003E414900474D
      5C003F3C46003E3C46002F2F3000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099B0D6009DBAEF009BB7
      EB0097B5E9009DB8EC009EB9EE00A2B8EE00A2B8EE00A6C0F000ADC2F400ADC3
      F500ABC2F400AAC3F50096A7C4000000000000000000373737003A4C71003C77
      AC003A425B0036323C00417297005CC3D90064D3E50042678600383C46003A38
      43003F3B46004A47700037373700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000097B0D5009ABAED0096B3
      E80096B4E80099B4E80098B2E70099AFE5009BB1E600A2B9EA00A8BAED00AABF
      F200A8C0F200ABC5F60098AAC50000000000000000003B3C3C00414D5E003A6A
      8F004487B100322B370057DFEC007CEEF00077EEEF0042A3DB00437699003C42
      4D003E3C47004A4D68003B3C3C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000095AED30093B4E5008FA9
      E00090A8E300859ED5008293D0008EA1DB00899CD100828CC7008090C6008599
      CD008B9FD6008CAADF00909EBD00000000000000000044444500424D5B00417E
      9A004257650034363F00437AA4006DDFEE0065DBED0041A4D900384152003D46
      50005086940052A6C00044444500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000889FC700889CDE008297
      D2008A9DD700A0ACDC008499C2004A6E9D004F6D9B0061789D00B0BBDA0098A3
      DC007D8ECC006E82BF00808AAC0000000000000000004949490051585C004D78
      83005C7D8600557B86002E2B37004E9CCC004B8FBE00426A9200393D4D004970
      790059868F0055A3C20049494900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094A9D500808FD8009AAC
      DF00ADBCE200DAE2F200637CA500525DB0005E50AF00AEBFE500767E9E00D3DB
      EF00BDC6E700828AC3006E7C9A0000000000000000004B4C4C004E5B5F004150
      54004A5D5E00465C670031344D004BA7DA004A749D0030353E00343942005B8E
      8C005877710057736F004B4C4C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000092A8D3007E93D9009AAD
      DB00CCD5EA00BEC8E2008C9DBF004C41A30047369000A2A9D5007E86A200D5DE
      F200CCD5EA00586093007283A00000000000000000004D4D4D00556E6F004964
      6A0048605F003E4449003F8ABB004A98D4004EB0E50033374100393E45005471
      6C0057736F00618F8E004D4D4D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008A9CC7008CA5E500889F
      DD00899BCC00C1CAE0007F8AA700595CAD006455BB00727EAA0078799800686D
      8C00606590006880B1008497BA00000000000000000052525300558A95005283
      8800527E82004D6C7A0062D4EE0060C9ED006FDBEE003A3A43004C5A610072A9
      A60071ADAD0082D5E50052525300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009CAFD6008FA9E2009AB6
      EC009BBAEF008AA1DA006E7DB300556195004458890051608E00576492007D93
      C900809ACF008BAEE4008FA6C300000000000000000059595A0064B0D7006EC7
      E10087DAEC0075C7DC0061C8EB0060C1E50058B6E100393E480056777F0081C5
      CF0084C9DC0093F1F30059595A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009FB8D80096B8EA0090AD
      E60093AFE80094B3EB0096B2EF0093AFE60082A1DA008BA8E10088A7E10094B2
      E7009EBBEF00A8C6F60098ACC7000000000000000000505050007DD2F1007CCD
      F00089D7F10094DDF3006ED3E90080E4F1005BA8D7004A48530096DCEF0099E5
      F3009DE7F4009FEAF40050505000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009FB9D8009EC1F20092B1
      E70090AEE6008FAEE8008FAFEB0091AFEA008CABE7008EAEE70094B3EA00A1C1
      F100A8C7F500B1CFFB009CAFC800000000000000000049494A006B97A90079A2
      B90085B0C40093C1D7005F7588005F88A10058616F0059565C0097CDE40099CD
      E80098D5E8009BD9EE0049494A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5C1E500A7CFFF00A6CA
      FF00A3C6FF009FC8FF00A0CDFF00A5CCFF00A6CDFF00AAD1FF00B3D8FF00B4DA
      FF00BCE0FF00C1E3FF00A4BAD20000000000000000004F5050004F4F50004F4F
      50004F4F50004F4F50004F4F50004F4F50004F4F50004F4F50004F4F50005E5F
      5F0062636300535353004F505000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A6A8A900A6A8A900A6A8
      A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8
      A900A6A8A900A6A8A900A6A8A900000000000000000000000000000000000000
      0000000000000000000097979700000000000000000097979700000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001FDBF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object IL: TImageList
    Left = 184
    Top = 416
    Bitmap = {
      494C010109000C00180010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF00008400000084
      0000008400000084000000840000008400000084000000840000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF00008400000084
      000000840000C6C6C60000840000008400000084000000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF00FFFFFF000084
      0000C6C6C600008400000084000000840000FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF0000840000C6C6
      C600008400000084000000840000FFFFFF00FFFFFF0000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF00C6C6C6000084
      000000840000008400000084000000840000FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF00008400000084
      0000FFFFFF00FFFFFF000084000000840000FFFFFF0000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000FFFFFF00FFFF
      FF0084848400FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000FF00FF000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000007777
      7700555555005555550055555500555555005555550055555500555555005555
      55005555550055555500555555000000000086868600FFFFFF00F1F1F100FFFF
      FF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFF
      FF00F1F1F100FFFFFF0000000000FF00FF000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000007777
      7700CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00555555000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1
      F100FFFFFF00F1F1F10000000000FF00FF000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000CC3333007777
      7700FFFFFF00EAEAEA00EAEAEA00D6E7E700D6E7E700EAEAEA00D6E7E700D6E7
      E700D6E7E700CCCCCC00555555000000000086868600FFFFFF00F1F1F1009966
      3300996633009966330099663300996633009966330099663300996633009966
      3300F1F1F100FFFFFF0000000000FF00FF000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C0000000000000000000000000000000000000000000CC333300000000000404
      040004040400996600009966000099660000EAEAEA00D6E7E700EAEAEA00D6E7
      E700D6E7E700CCCCCC00555555000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1
      F100FFFFFF00F1F1F10000000000FF00FF000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C0000000000000000000000000000000000000808000CC33330066333300CC33
      3300FF663300FF663300FF663300FF66330099660000EAEAEA00D6E7E700EAEA
      EA00D6E7E700CCCCCC00555555000000000086868600FFFFFF00F1F1F1009966
      3300996633009966330099663300996633009966330099663300996633009966
      3300F1F1F100FFFFFF0000000000FF00FF000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000080800000808000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000005F5F5F006699990099330000FF66
      3300FF663300C0C0C000C0C0C000CC333300FF66330099660000EAEAEA00D6E7
      E700D6E7E700CCCCCC00555555000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1
      F100FFFFFF00F1F1F10000000000FF00FF000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00000000000000000000000000000000000777777006699CC00CC663300FF66
      3300CC660000F0FBFF00F0FBFF00F1F1F100F0FBFF00EAEAEA00D6E7E700EAEA
      EA00D6E7E700CCCCCC00555555000000000086868600FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF00800000008000000080000000FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF0000000000FF00FF000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C00000000000000000000000000000000000000000007777770099CCFF00FF66
      3300CC660000CC660000CC660000CC660000CC660000CC660000EAEAEA00D6E7
      E700D6E7E700CCCCCC00555555000000000086868600FFFFFF00F0CAA6009900
      0000FFFFFF00FF663300FF99330000993300FF00000080000000FFFFFF009900
      0000F0CAA600F1F1F10000000000FF00FF000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C0000000000000000000000000000000000000000000800000006699990099FF
      FF00CC660000F0FBFF00F0FBFF00CC333300FFCC0000CC660000F1F1F100EAEA
      EA00D6E7E700CCCCCC00555555000000000086868600F0CAA60099000000FFFF
      FF00F1F1F10080800000FFFF3300FFCC33000099330080000000F1F1F100FFFF
      FF0099000000F0CAA60000000000FF00FF000000000000000000008080000000
      0000000000000000000000000000808000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000800000009999
      6600CCCC9900CC333300CC333300FFFF6600CC660000F1F1F100F0FBFF00EAEA
      EA00CCCCCC0099999900555555000000000086868600FFFFFF00F0CAA6009900
      0000FFFFFF0080800000FFFFFF00FFFF3300FF99330080000000FFFFFF009900
      0000F0CAA600F1F1F10000000000FF00FF000000000000000000008080000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000008000
      0000CC660000CC660000CC660000CC660000F0FBFF00FF663300F1F1F100CCCC
      CC009999990077777700555555000000000086868600FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF008080000080800000FF663300FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF0000000000FF00FF000000000000000000008080000000
      0000000000000000000080800000000000008080000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000008686
      8600FFFFFF00F0FBFF00F0FBFF00CC660000CC660000F0FBFF00F0FBFF005555
      55003333330033333300333333000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF000000
      0000000000000000000000000000FF00FF000000000000000000000000000000
      00000000000080800000FFFFFF00000000000000000080800000000000000000
      00000000000000000000000000000000000080808000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000008686
      8600FFFFFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF009999
      9900FFFFFF0055555500000000000000000086868600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F100FFFFFF00F1F1F100C0C0
      C000FFFFFF0086868600FF00FF00FF00FF000000000000000000000000000000
      000080800000FFFFFF00FFFFFF00000000000000000080800000808000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      8000FFFFFF0080808000FFFFFF0080808000FFFFFF0080808000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008686
      8600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009999
      99005555550000000000000000000000000086868600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00086868600FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008686
      8600868686008686860086868600868686008686860086868600868686008686
      8600000000000000000000000000000000008686860086868600868686008686
      8600868686008686860086868600868686008686860086868600868686008686
      8600FF00FF00FF00FF00FF00FF00FF00FF000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      000000000000000000000000000000000000000000000000000092635D00A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B009C4B4C00B64B4C009F4B4C004E1E1F0000000000000000000000
      000000000000000000000000000000000000000000000000000092635D00EEDE
      CB00FCEAD700FCEAD700FCEAD700FCEAD700FCEAD700FCEAD700FCEAD700FCEA
      D700EBD9C100A467690000000000000000000000000000000000000000000000
      00000000000000000000FFCE8400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000824B4B009A4D
      4E00AF4E4F00C04D4E00BF4C4D009F4B4C004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B0000000000000000000000000092635D00EFE0
      CE00FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD
      8200EBD9C100A467690000000000000000000000000000000000000000008484
      84008484840084848400FFCE8400FF0000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00CC57
      5800CB565700C9545500C7535400A34E4F004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B0000000000000000000000000092635D00EFE2
      D400FCEAD700FCEAD700FCEAD700FCEAD700FCEAD700FCEAD700FCEAD700FCEA
      D700EAD8C000A46769000000000000000000000000000000000084848400FF00
      0000FF000000FF000000FF000000FF000000FF00000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00D05A
      5B00CF595A00CC575800CB565700A55050004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B0000000000000000000000000092635D00E7DC
      CF00FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD
      8200E1CFB800A4676900000000000000000000000000FFDEAD00FF000000FF00
      0000FFCE8400FFCE8400FF000000FF000000FF000000FF000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000FF0084848400000000000000
      0000848484000000000084848400000000000000000000000000824B4B00D962
      6300D8606200D55E5F00D45D5E00A95354004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B00000000000000000000000000895F5600A099
      9300A0989100A0978E009F978C009E958A009D9389009C9286009C9284009C90
      82009C8F81008E595B000000000000000000FFDEAD00FF000000FF000000FF00
      00000000000000000000FFCE8400FF000000FF00000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000824B4B00DD65
      6600DC646500D9626300D8606200AB5555004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B00000000008C3816008C3816008C3816008C38
      16008C3816008C3816008C3816008C3816008C3816008C3816008C3816008C38
      16008C3816008C3816008C3816008C381600FFDEAD00FF000000848484000000
      00000000000000000000FFCE8400FF000000848484000000000000000000FF00
      0000848484000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000008484840000000000000000000000000000000000824B4B00E66C
      6D00E56B6C00EEA6A700FFFFFF00AF5859004E1E1F00B7EBAA005ED3770045CA
      670045CA6700F7B5B600824B4B00000000008C38160000000000A7756800D1CA
      C500CC5A2A00CC5A2A00CC5A2A00CC5A2A00CC5A2A00CC5A2A00CC5A2A00CC5A
      2A00C9BCAD00A4676900000000008C381600FFDEAD00FF000000848484000000
      00000000000000000000FFCE840084848400000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000824B4B00EA6F
      7000E96E6F00F2A9AA00FFFFFF00B15A5A004E1E1F00FFFFD300FFFFD300FFFF
      D300D9F6BD00F7B5B600824B4B00000000008C38160000000000996D5C00A3A0
      9C00F3BB9F00F3BB9F00F3BB9F00F3BB9F00F3BB9F00F3BB9F00F3BB9F00F3BB
      9F009D958A008E595B00000000008C381600FFDEAD00FF000000848484000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000000000000000000000000000824B4B00F377
      7800F2767700EF747500EE737400B55D5D004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000000000000000000B17E6B00FFFE
      FC00FFFEFC00FFFEFC00FAF4EF00F8F2EA00F8F2EA00F6EDE500F4EDE200F3E6
      D900F3E6D900A46769000000000000000000FFDEAD00FF000000848484000000
      00000000000000000000FF00000084848400000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000824B4B00F77A
      7B00F6797A00F3777800F2767700B75F5F004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000000000000000000BB846E00FCFB
      F800FCEAD700FCEAD700FCEAD700FCEAD700FCEAD700FCEAD700FCEAD700FCEA
      D700F2E6DA00A4676900000000000000000000000000FFA5A500FF0000000000
      000000000000FF000000FF000000848484000000000000000000FF000000FF00
      0000848484000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000824B4B00FF81
      8200FE808100FC7F8000FB7E7F00BB6363004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000000000000000000C58C7000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F4EDE200A467690000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000848484008484840084848400FF000000FF00
      0000848484000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000824B4B00FF81
      8200FF818200FF818200FE808100BD6565004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000000000000000000CB917300FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FEFAF600FBF7F300FAF4EF00F8F3ED00F7EF
      E900F7EEE600A46769000000000000000000000000000000000000000000FFCE
      8400FF000000FF000000FF000000FF000000FF000000FF000000FF0000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000824B4B00AF5E
      5F00D56F7000FF818200FF818200BF6666004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000000000000000000D4987500FFFF
      FF00FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD
      8200F8F3ED00A467690000000000000000000000000000000000000000000000
      0000FFCE8400FF000000FF000000FFCE8400FFCE8400FFCE8400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B00B6626300EE7A7B00BF6666004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000D4987500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEFBF800FBF7
      F300FAF6F000A467690000000000000000000000000000000000000000000000
      000000000000FFCE8400FF000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987600CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E68009566620000000000000000000000000000000000000000000000
      00000000000000000000FFCE8400848484000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00E000000000000000E000000000000000
      E000000000000000E00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000000000
      E003000000000000E007000000000000C001800FFFFFFFFE80310007E0010002
      80310007E001000280310007C001000280010007A00100028001000700010002
      80010007000100028FF10007000100028FF10007800100028C71000780010002
      8C710007C00100028C710007E001000289350007E001001E81810007E0030000
      E18F800FE0070000E00FD55FE00F0000C00FFE7FC003FFFFC007E07FC003FC7F
      8003C001C003E03FBFF3C001C003C01FBFF3C001C003801FBE31C001C0030C3F
      8001C00100001C678001C00140021CE3C001C00140021FE3E001C001C0031CE3
      F003C001C00398C7F00FC001C003F007F00FC001C003E00FF00FC001C003F03F
      F007E001C003F8FFF807FE7FC003FCFF00000000000000000000000000000000
      000000000000}
  end
  object oqThread: TOracleQuery
    SQL.Strings = (
      'SELECT FK_ID,'
      
        '       FD_RUN, TO_CHAR(FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN_T' +
        'IME,'
      '       FK_NAZSOSID,'
      
        '       (SELECT FC_NAME FROM TKABINET WHERE FK_ID = TNAZIS.FK_ROO' +
        'MID) AS KABINET,'
      '       GET_NAME_RGISSL(FK_SMID) AS FC_NAME,'
      '       PKG_REGIST_PACFUNC.GET_PAC_FIO(FK_PACID) FIOPAC,'
      '       DECODE(FK_NAZSOSID, '
      '              ASU.GET_NEVIP, '#39#1053#1045' '#1042#1067#1055'.'#39', '
      
        '              ASU.GET_VIPNAZ, '#39#1042#1067#1055'.'#39'||'#39': '#39'||DO_VRACHFIO(FK_ISPOL' +
        'ID), '
      '              ASU.GET_NEYAV, '#39#1053#1045#1071#1042#1050#1040#39','
      
        '              ASU.GET_LABVIP, '#39#1042#1067#1055'. '#1056#1051#39'||'#39': '#39'||DO_VRACHFIO(FK_IS' +
        'POLID), '
      '              ASU.GET_RECOMEND, '#39#1056#1045#1050#1054#1052#1045#1053#1044#1054#1042#1040#1053#1054#39', '
      
        '              ASU.GET_NAZCANCEL, '#39#1054#1058#1052#1045#1053#1045#1053#1054#39'||'#39': '#39'||DO_VRACHFIO(F' +
        'K_ISPOLID)) STATE,'
      
        '       (SELECT FD_ROJD FROM TPEOPLES WHERE FK_ID = (SELECT FK_PE' +
        'PLID FROM TKARTA WHERE FK_ID = TNAZIS.FK_PACID '
      '                                                    UNION '
      
        '                                                    SELECT FK_PE' +
        'PLID FROM TAMBULANCE WHERE FK_ID = TNAZIS.FK_PACID)) FD_ROJD,'
      
        '       (SELECT MAX(FN_NUM) FROM TIB WHERE FK_PACID = TNAZIS.FK_I' +
        'D AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA'
      '       '
      'FROM TNAZIS'
      ' WHERE FK_SMID = :PFK_SMID'
      '   AND FD_RUN >= :PFD_DATE1 '
      '   AND FD_RUN <= :PFD_DATE2'
      
        '   AND ((FK_NAZSOSID <> GET_NAZCANCEL) AND (FK_NAZSOSID <> GET_R' +
        'ECOMEND) AND (FK_NAZSOSID <> GET_NEVIP) AND (FK_NAZSOSID <> GET_' +
        'NEYAV)) '
      'ORDER BY FD_RUN')
    Optimize = False
    Variables.Data = {
      0300000003000000090000003A50464B5F534D49440300000000000000000000
      000A0000003A5046445F44415445310C00000000000000000000000A0000003A
      5046445F44415445320C0000000000000000000000}
    Cursor = crSQLWait
    Threaded = True
    Left = 360
    Top = 328
  end
  object dxMemData1: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Option = poLoad
    SortOptions = []
    Left = 360
    Top = 384
    object dxMemData1FK_ID: TIntegerField
      FieldName = 'FK_ID'
    end
    object dxMemData1KABNAME: TStringField
      FieldName = 'KABNAME'
      Size = 100
    end
    object dxMemData1FD_RUN: TStringField
      FieldName = 'FD_RUN'
      Size = 100
    end
    object dxMemData1FIOPAC: TStringField
      FieldName = 'FIOPAC'
      Size = 100
    end
    object dxMemData1ISSLNAME: TStringField
      FieldName = 'ISSLNAME'
      Size = 100
    end
    object dxMemData1STATE: TStringField
      FieldName = 'STATE'
      Size = 100
    end
    object dxMemData1FK_NAZSOSID: TIntegerField
      FieldName = 'FK_NAZSOSID'
    end
    object dxMemData1FD_RUN_TIME: TStringField
      FieldName = 'FD_RUN_TIME'
      Size = 100
    end
  end
end
