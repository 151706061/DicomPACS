object frmPac: TfrmPac
  Left = 424
  Top = 130
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = #1055#1072#1094#1080#1077#1085#1090' ('#1057#1087#1080#1089#1086#1082' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081')'
  ClientHeight = 473
  ClientWidth = 459
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
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 76
    Width = 453
    Height = 394
    Margins.Top = 0
    Align = alClient
    PopupMenu = pmGrid
    TabOrder = 0
    object TVLIST: TcxGridDBTableView
      OnDblClick = TVLISTDblClick
      OnKeyDown = TVLISTKeyDown
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'DOZA'
          Column = VDOZA
        end
        item
          Kind = skCount
          FieldName = 'FK_ID'
          Column = VLISTRUN
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnSorting = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VLISTRUN: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'FD_RUN'
        Width = 73
      end
      object VLISTNAME: TcxGridDBColumn
        Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Width = 270
      end
      object VDOZA: TcxGridDBColumn
        Caption = #1044#1086#1079#1072'('#1084#1047#1074')'
        DataBinding.FieldName = 'DOZA'
        Width = 54
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = TVLIST
    end
  end
  object Panel4: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 453
    Height = 36
    Hint = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086' '#1087#1072#1094#1080#1077#1085#1090#1072' '
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object lbFIO: TcxLabel
      Left = 4
      Top = 4
      Caption = 'Pacient'
      ParentFont = False
      PopupMenu = pmFIO
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Book Antiqua'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfOffice11
      Style.Shadow = False
      Style.TextColor = clMaroon
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.Kind = lfOffice11
      Transparent = True
      OnMouseLeave = lbFIOMouseLeave
      OnMouseMove = lbFIOMouseMove
    end
    object bClose: TcxButton
      AlignWithMargins = True
      Left = 365
      Top = 2
      Width = 83
      Height = 32
      Margins.Top = 0
      Margins.Bottom = 0
      Action = actClose
      Align = alRight
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Colors.Normal = clWhite
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 42
    Width = 453
    Height = 31
    Margins.Top = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 6
    object cxLabel1: TcxLabel
      Left = 4
      Top = 4
      Caption = #1057#1087#1080#1089#1086#1082' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Book Antiqua'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfOffice11
      Style.Shadow = False
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.Kind = lfOffice11
      Transparent = True
    end
    object Panel2: TPanel
      Left = 149
      Top = 2
      Width = 302
      Height = 27
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object dxBarDockControl1: TdxBarDockControl
        Left = 0
        Top = -1
        Width = 302
        Height = 28
        Align = dalBottom
        BarManager = BM
        SunkenBorder = True
        UseOwnSunkenBorder = True
      end
    end
  end
  object BM: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clBtnFace
    ImageOptions.Images = IL
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 177
    Top = 183
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
      Caption = 'Pac'
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
          ItemName = 'bbRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbProsmotr'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrint'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Pac'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbClose: TdxBarButton
      Action = actClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbProsmotr: TdxBarButton
      Action = actProsmotr
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrint: TdxBarButton
      Action = actPrint
      Category = 0
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      PaintStyle = psCaptionGlyph
    end
    object bbRefresh: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object actlstPac: TActionList
    Images = IL
    Left = 176
    Top = 136
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 2
      ShortCut = 27
      OnExecute = actCloseExecute
    end
    object actProsmotr: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
      ImageIndex = 0
      ShortCut = 118
      OnExecute = actProsmotrExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100
      ImageIndex = 1
      ShortCut = 16464
      OnExecute = actPrintExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 3
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWNUM,'
      '       TNAZIS.FK_ID,'
      '       TNAZIS.FK_NAZSOSID, '
      '       TNAZIS.FK_SMID,'
      '       TNAZIS.FK_PACID, '
      '       TO_CHAR(TNAZIS.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       TNAZIS.FD_RUN AS DATE_RUN, '
      '       GET_NAME_RGISSL(TNAZIS.FK_SMID) AS FC_NAME, '
      
        '       DECODE(TNAZIS.FK_NAZSOSID, 2, '#39#1053#1045' '#1042#1067#1055'.'#39', 1, '#39#1042#1067#1055'.'#39', -11, ' +
        #39#1042#1067#1055'. '#1052#1051'. '#1057#1054#1058#1056'.'#39', 89, '#39#1056#1045#1050#1054#1052#1045#1053#1044#1054#1042#1040#1053#1054#39', 23, '#39#1054#1058#1052#1045#1053#1045#1053#1054#39') STATE,'
      
        '       (SELECT MAX(FN_NUM) FROM TIB WHERE FK_PACID = TNAZIS.FK_I' +
        'D AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       TKARTA.FD_ROJD,'
      '       ASU.GET_IB(TKARTA.FK_ID) AS NUMIB'
      '  FROM TNAZIS, TKARTA'
      
        ' WHERE GET_OWNER_FROM_SMID(GET_ID_RGVIDISSL(FK_SMID)) IN (GET_RG' +
        '_ISSL) '
      '   AND TNAZIS.FK_NAZSOSID = GET_VIPNAZ'
      '   AND TNAZIS.FK_PACID = TKARTA.FK_ID'
      '   AND TKARTA.FK_PEPLID = :PFK_PACID'
      '    '
      'UNION ALL'
      ''
      'SELECT ROWNUM,'
      '       TNAZIS.FK_ID, '
      '       TNAZIS.FK_NAZSOSID,'
      '       TNAZIS.FK_SMID,'
      '       TNAZIS.FK_PACID,'
      '       TO_CHAR(TNAZIS.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       TNAZIS.FD_RUN AS DATE_RUN,'
      '       GET_NAME_RGISSL(TNAZIS.FK_SMID) AS FC_NAME,  '
      
        '       DECODE(TNAZIS.FK_NAZSOSID, 2, '#39#1053#1045' '#1042#1067#1055'.'#39', 1, '#39#1042#1067#1055'.'#39', -11, ' +
        #39#1042#1067#1055'. '#1052#1051'. '#1057#1054#1058#1056'.'#39', 89, '#39#1056#1045#1050#1054#1052#1045#1053#1044#1054#1042#1040#1053#1054#39', 23, '#39#1054#1058#1052#1045#1053#1045#1053#1054#39') STATE,'
      
        '       (SELECT MAX(FN_NUM) FROM TIB WHERE FK_PACID = TNAZIS.FK_I' +
        'D AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       TAMBULANCE.FD_ROJD,'
      '       ASU.GET_IB(TAMBULANCE.FK_ID) AS NUMIB'
      '  FROM TNAZIS, TAMBULANCE'
      
        ' WHERE GET_OWNER_FROM_SMID(GET_ID_RGVIDISSL(FK_SMID)) IN (GET_RG' +
        '_ISSL) '
      '   AND TNAZIS.FK_NAZSOSID = GET_VIPNAZ'
      '   AND TNAZIS.FK_PACID = TAMBULANCE.FK_ID'
      '   AND TAMBULANCE.FK_PEPLID = :PFK_PACID'
      ''
      'ORDER BY DATE_RUN DESC  ')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464B5F504143494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000C0000000600000046445F52554E0100000000000700000046435F4E
      414D4501000000000005000000464B5F49440100000000000B000000464B5F4E
      415A534F53494401000000000005000000535441544501000000000007000000
      464B5F534D494401000000000008000000464B5F504143494401000000000008
      000000444154455F52554E01000000000004000000444F5A4101000000000006
      000000524F574E554D0100000000000700000046445F524F4A44010000000000
      050000004E554D4942010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsListBeforeOpen
    AfterOpen = odsListAfterOpen
    Left = 71
    Top = 227
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 71
    Top = 187
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
    ReportOptions.CreateDate = 39299.753055555600000000
    ReportOptions.LastChange = 40040.588659421290000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 178
    Top = 235
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
        Height = 287.244280000000000000
        Top = 18.897650000000000000
        Width = 748.346940000000000000
        StartNewPage = True
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Width = 739.488770000000000000
          Height = 34.015770000000010000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]'
            '[OTDELNAME]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 49.133890000000010000
          Width = 120.960000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218': [PACFIO]')
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 69.811070000000000000
          Width = 192.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039': [DATE_ROJD]')
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 90.488250000000000000
          Width = 200.320000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1112#1056#181#1056#1169#1056#1105#1057#8224#1056#1105#1056#1029#1057#1027#1056#1108#1056#1109#1056#8470' '#1056#1108#1056#176#1057#1026#1057#8218#1057#8249': [NUMIB]')
        end
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 124.724490000000000000
          Width = 257.440000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1057#8218#1056#1109#1056#1108#1056#1109#1056#187' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039' '#1074#8222#8211' [NUMISSL]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 147.401670000000000000
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
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 170.078850000000000000
          Width = 740.787880000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Top = 175.078850000000000000
          Width = 739.597280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Memo.UTF8 = (
            '[TEXTISSL]')
          WordBreak = True
        end
        object Memo9: TfrxMemoView
          Left = 3.779530000000000000
          Top = 222.992270000000000000
          Width = 109.760000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#173#1056#8221' = [DOZA] '#1056#1112#1056#8212#1056#1030)
        end
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Top = 249.448980000000000000
          Width = 112.640000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176': [DATEISSL]')
        end
        object Memo12: TfrxMemoView
          Left = 453.543600000000000000
          Top = 249.448980000000000000
          Width = 86.240000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#176#1057#8225': [SOTR]')
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 34.015770000000000000
        Top = 366.614410000000000000
        Width = 748.346940000000000000
        object Memo5: TfrxMemoView
          Width = 744.567410000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
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
  object frxDBPrintList: TfrxDBDataset
    UserName = 'frxDBPrintList'
    CloseDataSource = False
    DataSource = dsList
    BCDToCurrency = False
    Left = 238
    Top = 288
  end
  object frxPrintList: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39325.633441655100000000
    ReportOptions.LastChange = 40040.588932291670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxPrintListGetValue
    Left = 178
    Top = 288
    Datasets = <
      item
        DataSet = frxDBPrintList
        DataSetName = 'frxDBPrintList'
      end>
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
        Height = 105.826840000000000000
        Top = 18.897650000000000000
        Width = 748.346940000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 360.774830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#1038#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#8470' '#1056#1111#1056#1109' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1057#1107'. '#1056#164#1056 +
              #152#1056#1115': [PACFIO]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 147.401670000000000000
          Top = 86.929190000000000000
          Width = 536.872060000000100000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 86.929190000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 684.094930000000000000
          Top = 86.929190000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#183#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 56.692950000000010000
          Top = 86.929190000000000000
          Width = 90.360940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1030#1057#8249#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 570.709030000000000000
          Top = 60.472479999999990000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          HAlign = haRight
          Memo.UTF8 = (
            '[SYSDATE]')
        end
        object Memo21: TfrxMemoView
          Left = 4.559059999999999000
          Top = 60.472479999999990000
          Width = 167.040000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' - [KOLVONAZ]')
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Width = 740.787880000000000000
          Height = 34.015770000000010000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]'
            '[OTDELNAME]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 185.196970000000000000
        Width = 748.346940000000000000
        DataSet = frxDBPrintList
        DataSetName = 'frxDBPrintList'
        KeepTogether = True
        RowCount = 0
        object Memo9: TfrxMemoView
          Left = 147.401670000000000000
          Width = 536.872060000000100000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBPrintList."FC_NAME"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 684.094742050000000000
          Width = 60.472443390000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBPrintList."DOZA"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 56.692725430000000000
          Width = 90.360940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBPrintList."FD_RUN"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 34.015770000000000000
        Top = 264.567100000000000000
        Width = 748.346940000000000000
        object Memo6: TfrxMemoView
          Left = 971.339210000000000000
          Width = 72.640000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page]')
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Width = 740.787880000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
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
  object pmGrid: TPopupMenu
    Images = IL
    Left = 308
    Top = 171
    object N1: TMenuItem
      Action = actPrint
    end
    object C1: TMenuItem
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
      Caption = 'C'#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      OnClick = C1Click
    end
  end
  object pmFIO: TPopupMenu
    Left = 312
    Top = 112
    object N3: TMenuItem
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
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
      OnClick = N3Click
    end
  end
  object IL: TImageList
    Left = 72
    Top = 304
    Bitmap = {
      494C010104000800140010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B009C4B4C00B64B4C009F4B4C004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE8400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000824B4B009A4D
      4E00AF4E4F00C04D4E00BF4C4D009F4B4C004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000000000008484
      84008484840084848400FFCE8400FF0000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00CC57
      5800CB565700C9545500C7535400A34E4F004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B0000000000000000000000000084848400FF00
      0000FF000000FF000000FF000000FF000000FF00000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000008484840000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00D05A
      5B00CF595A00CC575800CB565700A55050004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B000000000000000000FFDEAD00FF000000FF00
      0000FFCE8400FFCE8400FF000000FF000000FF000000FF000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000FF0084848400000000000000
      0000848484000000000084848400000000000000000000000000824B4B00D962
      6300D8606200D55E5F00D45D5E00A95354004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B0000000000FFDEAD00FF000000FF000000FF00
      00000000000000000000FFCE8400FF000000FF00000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000824B4B00DD65
      6600DC646500D9626300D8606200AB5555004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B0000000000FFDEAD00FF000000848484000000
      00000000000000000000FFCE8400FF000000848484000000000000000000FF00
      0000848484000000000000000000000000000000000084848400000000000000
      000000000000000000000000000000000000FFFFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000008484840000000000000000000000000000000000824B4B00E66C
      6D00E56B6C00EEA6A700FFFFFF00AF5859004E1E1F00B7EBAA005ED3770045CA
      670045CA6700F7B5B600824B4B0000000000FFDEAD00FF000000848484000000
      00000000000000000000FFCE840084848400000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000824B4B00EA6F
      7000E96E6F00F2A9AA00FFFFFF00B15A5A004E1E1F00FFFFD300FFFFD300FFFF
      D300D9F6BD00F7B5B600824B4B0000000000FFDEAD00FF000000848484000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000000000000000000000000000824B4B00F377
      7800F2767700EF747500EE737400B55D5D004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B0000000000FFDEAD00FF000000848484000000
      00000000000000000000FF00000084848400000000000000000000000000FFCE
      8400FF000000848484000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000824B4B00F77A
      7B00F6797A00F3777800F2767700B75F5F004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B000000000000000000FFA5A500FF0000000000
      000000000000FF000000FF000000848484000000000000000000FF000000FF00
      000084848400000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000824B4B00FF81
      8200FE808100FC7F8000FB7E7F00BB6363004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000000000000000000000000000000
      0000FF000000FF000000FF000000848484008484840084848400FF000000FF00
      000084848400000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000824B4B00FF81
      8200FF818200FF818200FE808100BD6565004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B0000000000000000000000000000000000FFCE
      8400FF000000FF000000FF000000FF000000FF000000FF000000FF0000008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000824B4B00AF5E
      5F00D56F7000FF818200FF818200BF6666004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000000000000000000000000000000
      0000FFCE8400FF000000FF000000FFCE8400FFCE8400FFCE8400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B00B6626300EE7A7B00BF6666004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000000000000000
      000000000000FFCE8400FF000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE8400848484000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFC00FFE7FFFFFFFF7C007E07FFC7F
      FFE78003C001E03FFFC7BFF3C001C01FF00FBFF3C001801FE61FBE31C0010C3F
      CE3F8001C0011C679F1F8001C0011CE39F9FC001C0011FE3BFDFE001C0011CE3
      AFDFF003C00198C7AF9FF00FC001F007879FF00FC001E00FC3BFF00FC001F03F
      E77FF007E001F8FFF07FF807FE7FFCFF00000000000000000000000000000000
      000000000000}
  end
end
