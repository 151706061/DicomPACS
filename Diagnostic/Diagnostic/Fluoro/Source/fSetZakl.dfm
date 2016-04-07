object frmRepZakl: TfrmRepZakl
  Left = 175
  Top = 84
  Caption = #1042#1099#1073#1086#1088' '#1087#1086' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1102
  ClientHeight = 473
  ClientWidth = 1078
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1072
    Height = 28
    Align = dalTop
    BarManager = dxBM
    SunkenBorder = True
    UseOwnSunkenBorder = True
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 1078
  end
  object cxGrZakl: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 91
    Width = 1072
    Height = 379
    Margins.Top = 0
    Align = alClient
    PopupMenu = pmTV
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    ExplicitLeft = 0
    ExplicitTop = 85
    ExplicitWidth = 1078
    ExplicitHeight = 388
    object TVZAKL: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = VZAKLFIO
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object VZAKLFIO: TcxGridDBColumn
        Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
        DataBinding.FieldName = 'PACFIO'
        Width = 227
      end
      object VZAKLDATEROJD: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
        DataBinding.FieldName = 'DATEROJD'
        Width = 68
      end
      object VZAKLADDRESS: TcxGridDBColumn
        Caption = #1040#1076#1088#1077#1089
        DataBinding.FieldName = 'ADDRESS'
        Width = 299
      end
      object VZAKLWORKPLACE: TcxGridDBColumn
        Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
        DataBinding.FieldName = 'WORKPLACE'
        Width = 290
      end
      object VZAKLDATERUN: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1074#1099#1087'.'
        DataBinding.FieldName = 'RUNDATE'
        Width = 53
      end
      object VZAKLNAMEISSL: TcxGridDBColumn
        Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAMEISSL'
        Width = 70
      end
    end
    object cxGrZaklLevel1: TcxGridLevel
      GridView = TVZAKL
    end
  end
  object paParams: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 1072
    Height = 49
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 6
    Visible = False
    ExplicitLeft = 0
    ExplicitTop = 28
    ExplicitWidth = 1078
    object cxLabel1: TcxLabel
      Left = 15
      Top = 4
      Caption = #1044#1072#1090#1099' '#1089':'
    end
    object lbDate1: TcxLabel
      Left = 92
      Top = 3
      Caption = 'Date1'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel3: TcxLabel
      Left = 160
      Top = 3
      Caption = #1087#1086':'
    end
    object lbDate2: TcxLabel
      Left = 186
      Top = 3
      Caption = 'Date2'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object lbNameZakl: TcxLabel
      Left = 15
      Top = 26
      Caption = #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077':'
    end
    object lbZakl: TcxLabel
      Left = 92
      Top = 26
      Caption = 'Zakl'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel2: TcxLabel
      Left = 551
      Top = 3
      Caption = #1042#1099#1073#1088#1072#1085#1086' '#1079#1072#1087#1080#1089#1077#1081':'
    end
    object lbKolvo: TcxLabel
      Left = 649
      Top = 3
      Caption = 'Kolvo'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 83
    Width = 1078
    Height = 8
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 59
    AlignSplitter = salTop
    Control = paParams
    Visible = False
    ExplicitTop = 77
    ExplicitWidth = 8
  end
  object actlstZakl: TActionList
    Images = frmMain.ilMain
    Left = 328
    Top = 128
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 0
      ShortCut = 27
      OnExecute = actCloseExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 1
      ShortCut = 16464
      OnExecute = actPrintExecute
    end
    object actCopyFIO: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1060#1048#1054
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1060#1048#1054
      ImageIndex = 12
      OnExecute = actCopyFIOExecute
    end
    object actText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      Hint = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      ImageIndex = 14
      OnExecute = actTextExecute
    end
    object actWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 15
      OnExecute = actWebExecute
    end
    object actXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 16
      OnExecute = actXMLExecute
    end
    object actXLS: TAction
      Caption = 'XLS-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = 'XLS-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 17
      OnExecute = actXLSExecute
    end
    object actPrintNaprav: TAction
      Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      Enabled = False
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1080' '#1087#1077#1095#1072#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103' ('#1086#1073#1084#1077#1085#1085#1086#1081' '#1082#1072#1088#1090#1099')'
      ImageIndex = 23
      Visible = False
      OnExecute = actPrintNapravExecute
    end
    object aParams: TAction
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      Hint = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1073#1086#1088#1082#1080' '#1078#1091#1088#1085#1072#1083#1072
      ImageIndex = 24
      OnExecute = aParamsExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1078#1091#1088#1085#1072#1083
      ImageIndex = 29
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
  end
  object dxBM: TdxBarManager
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
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 328
    Top = 176
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBMBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Journal_custom'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 222
      FloatTop = 133
      FloatClientWidth = 156
      FloatClientHeight = 97
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbParams'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrintNaprav'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbClose'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
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
    object bbPrint: TdxBarButton
      Action = actPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrintNaprav: TdxBarButton
      Action = actPrintNaprav
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbParams: TdxBarButton
      Action = aParams
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bRefresh: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT TNAZIS.FK_ID,'
      '       TO_CHAR(TNAZIS.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS RUNDATE,'
      
        '       ASU.PKG_REGIST_PACFUNC.GET_PAC_FIO(TNAZIS.FK_PACID) AS PA' +
        'CFIO,'
      
        '       ASU.PKG_REGIST_PACFUNC.GET_PAC_BITH(TNAZIS.FK_PACID) AS D' +
        'ATEROJD,'
      
        '       ASU.PKG_REGIST_PACFUNC.GET_PAC_ADRFULL(TNAZIS.FK_PACID) A' +
        'S ADDRESS,'
      
        '       (SELECT asu.GET_PACCOMPANY(FK_COMPANYID)||'#39' '#39'||asu.GET_PA' +
        'CCOMPANY_OTDEL(FK_OTDEL)||'#39' '#39'||FC_RABOTA FROM asu.TPEOPLES WHERE' +
        ' FK_ID = asu.GET_PEPLID(tnazis.FK_PACID)) AS WORKPLACE,'
      '       ASU.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS NAMEISSL'
      ''
      '  FROM ASU.TNAZIS, ASU.TIB'
      ''
      ' WHERE TNAZIS.FK_ID = TIB.FK_PACID'
      '   AND TIB.FK_BID = :PFK_SMID'
      '   AND TNAZIS.FK_NAZSOSID = ASU.GET_VIPNAZ'
      '   AND TRUNC(FD_RUN) >= :PDATE1'
      '   AND TRUNC(FD_RUN) <= :PDATE2'
      ''
      'ORDER BY PACFIO ')
    Optimize = False
    Variables.Data = {
      0300000003000000070000003A5044415445310C000000000000000000000007
      0000003A5044415445320C0000000000000000000000090000003A50464B5F53
      4D4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000005000000464B5F49440100000000000700000052554E4441
      54450100000000000600000050414346494F0100000000000800000044415445
      524F4A4401000000000007000000414444524553530100000000000900000057
      4F524B504C414345010000000000080000004E414D454953534C010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsListAfterOpen
    Left = 512
    Top = 184
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 512
    Top = 232
  end
  object frxRepNapr: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39595.645055150460000000
    ReportOptions.LastChange = 40234.389567222220000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepNaprGetValue
    Left = 656
    Top = 200
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 210.000000000000000000
      PaperHeight = 148.000000000000000000
      PaperSize = 11
      object ReportTitle1: TfrxReportTitle
        Height = 519.134200000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        object Memo1: TfrxMemoView
          Left = 113.385900000000000000
          Top = 35.354360000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1115#1056#177#1056#1112#1056#181#1056#1029#1056#1029#1056#176#1057#1039' '#1056#1108#1056#176#1057#1026#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 113.385900000000000000
          Top = 61.811070000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1111#1057#1026#1056#176#1056#1030#1056#187#1057#1039#1056#181#1057#8218#1057#1027#1057#1039' '#1056#1110#1057#1026'. [PACFIO]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 521.575140000000000000
          Top = 80.708720000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1169#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169'.: [DATEROJD]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 113.385900000000000000
          Top = 103.385900000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8221#1056#187#1057#1039' '#1056#1108#1056#187#1056#1105#1056#1029#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1056#1109#1056#177#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039' '#1056#1105' '#1056#187#1056#181 +
              #1057#8225#1056#181#1056#1029#1056#1105#1057#1039'.')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 113.385900000000000000
          Top = 137.401670000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1114#1056#181#1057#1027#1057#8218#1056#1109' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1057#8249' : [WORKPLACE]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 113.385900000000000000
          Top = 175.196970000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#1112#1056#176#1057#8364#1056#1029#1056#1105#1056#8470' '#1056#176#1056#1169#1057#1026#1056#181#1057#1027' : [ADDRESS]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 113.385900000000000000
          Top = 231.889920000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#8221#1056#176#1056#1029#1056#1029#1057#8249#1056#181' '#1057#1026#1056#181#1056#1029#1057#8218#1056#1110#1056#181#1056#1029#1056#1109#1056#1030#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1056#1108#1056#1109#1056#1029#1057#8218#1057#1026#1056#1109#1056#187#1057#1039)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 113.385900000000000000
          Top = 250.787570000000000000
          Width = 566.929500000000000000
          Height = 230.551330000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[ZAKL]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 113.385900000000000000
          Top = 8.897650000000000000
          Width = 566.929500000000000000
          Height = 15.118120000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[NAMEORG]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 113.385900000000000000
          Top = 492.677490000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DATESYS]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 585.827150000000000000
          Top = 492.677490000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SOTR]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 597.165740000000000000
        Width = 793.701300000000000000
      end
      object Memo24: TfrxMemoView
        Left = 30.236240000000000000
        Top = 540.472790000000000000
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
    object Page2: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 210.000000000000000000
      PaperHeight = 148.000000000000000000
      PaperSize = 11
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle2: TfrxReportTitle
        Height = 430.866420000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo14: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559059999999999000
          Width = 702.992580000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1030#1056#181#1057#8218' '#1056#187#1056#181#1057#8225#1056#181#1056#177#1056#1029#1056#1109#1056#1110#1056#1109' '#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 113.385900000000000000
          Top = 60.472479999999990000
          Width = 585.827150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8221#1056#176#1057#8218#1056#176' '#1057#1039#1056#1030#1056#1108#1056#1105' '#1056#1030' '#1056#187#1056#181#1057#8225'. '#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1056#181':______________' +
              '________________________________________')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 113.385900000000000000
          Top = 90.708720000000000000
          Width = 585.827150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8221#1056#176#1057#8218#1056#176' '#1056#1030#1056#183#1057#1039#1057#8218#1056#1105#1057#1039' '#1056#1029#1056#176' '#1057#1107#1057#8225#1056#181#1057#8218' ('#1057#8218#1057#1107#1056#177#1056#1169#1056#1105#1057#1027#1056#1111#1056#176#1056#1029#1057#1027#1056#181#1057#1026#1056#1109#1056 +
              #1112'):______________________________________________')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#187#1056#1105#1056#1029#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1105#1056#8470' '#1056#1169#1056#1105#1056#176#1056#1110#1056#1029#1056#1109#1056#183':')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 113.385900000000000000
          Top = 245.669450000000000000
          Width = 585.827150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8220#1057#1026#1057#1107#1056#1111#1056#1111#1056#176' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176':________________________________________' +
              '___________________________')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 377.953000000000000000
          Top = 377.953000000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034':___________________________________')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 113.385900000000000000
          Top = 272.126160000000000000
          Width = 585.827150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#160#1056#181#1056#1108#1056#1109#1056#1112#1056#181#1056#1029#1056#1169#1056#176#1057#8224#1056#1105#1056#1105' ('#1056#1108#1057#1026#1056#176#1057#8218#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034' '#1056#164#1056#8220' '#1056#1109#1056#177#1057#1027#1056#187#1056#181#1056#1169#1056#1109 +
              #1056#1030#1056#176#1056#1029#1056#1105#1056#8470'): ________________________________________')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 113.385900000000000000
          Top = 294.803340000000000000
          Width = 585.827150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1057#8249' '#1057#1027':____________ '#1056#1111#1056#1109': ____________')
          ParentFont = False
        end
      end
      object Memo25: TfrxMemoView
        Left = 3.779530000000000000
        Top = 544.252320000000000000
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
      object Memo26: TfrxMemoView
        Top = 472.441250000000000000
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
  object pmTV: TPopupMenu
    Images = frmMain.ilMain
    Left = 444
    Top = 182
    object N1: TMenuItem
      Action = actPrint
    end
    object MenuItem3: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 13
      object MenuItem4: TMenuItem
        Action = actText
      end
      object MenuItem5: TMenuItem
        Action = actWeb
      end
      object MenuItem6: TMenuItem
        Action = actXML
      end
      object MenuItem7: TMenuItem
        Action = actXLS
      end
    end
    object N3: TMenuItem
      Action = actCopyFIO
    end
    object N2: TMenuItem
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
      OnClick = N2Click
    end
  end
  object dlgSavePopUp: TSaveDialog
    Left = 441
    Top = 235
  end
  object frxList: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39596.401664131950000000
    ReportOptions.LastChange = 39994.671537858800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxListGetValue
    Left = 656
    Top = 256
    Datasets = <
      item
        DataSet = frxDBList
        DataSetName = 'frxDBList'
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
      LeftMargin = 5.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 105.826840000000000000
        Top = 18.897650000000000000
        Width = 1077.166050000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 442.205010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#1038#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#1109#1056#1030' '#1056#1111#1056#1109' '#1056#183#1056#176#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1056#1105#1057#1039#1056#1112'. '#1056#8212#1056 +
              #176#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1056#1105#1056#181' - "[ZAKL]"')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 60.472480000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027': [DATE1] '#1056#1111#1056#1109': [DATE2]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 83.149660000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#8470':')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 978.898270000000000000
          Top = 83.149660000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[DATESYS]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 922.205320000000000000
          Top = 60.472480000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1056#1109#1057#8218#1057#1026#1057#1107#1056#1169#1056#1029#1056#1105#1056#1108': [SOTR]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Width = 1069.606990000000000000
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
        end
        object Memo22: TfrxMemoView
          Left = 181.417440000000000000
          Top = 83.149660000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[KOLVOISSL]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 230.551330000000000000
        Width = 1077.166050000000000000
        DataSet = frxDBList
        DataSetName = 'frxDBList'
        RowCount = 0
        Stretched = True
        object Memo13: TfrxMemoView
          Left = 52.913420000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBList."PACFIO"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 230.551330000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."DATEROJD"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 309.921460000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBList."ADDRESS"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 555.590910000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBList."WORKPLACE"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 752.126470000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."RUNDATE"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 823.937540000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBList."NAMEISSL"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 3.779530000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 22.677180000000000000
        Top = 185.196970000000000000
        Width = 1077.166050000000000000
        object Memo7: TfrxMemoView
          Left = 52.913420000000000000
          Top = 3.779529999999994000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039' '#1056#152#1056#1112#1057#1039' '#1056#1115#1057#8218#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 230.551330000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169'.')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 309.921460000000000000
          Top = 3.779529999999994000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1106#1056#1169#1057#1026#1056#181#1057#1027)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 555.590910000000000000
          Top = 3.779529999999994000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#181#1057#1027#1057#8218#1056#1109' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1057#8249)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 752.126470000000000000
          Top = 3.779529999999994000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
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
        end
        object Memo12: TfrxMemoView
          Left = 823.937540000000000000
          Top = 3.779529999999994000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
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
        end
        object Memo20: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
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
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 34.015770000000000000
        Top = 309.921460000000000000
        Width = 1077.166050000000000000
        object Memo19: TfrxMemoView
          Left = 3.779530000000000000
          Width = 1069.606990000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
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
  object frxDBList: TfrxDBDataset
    UserName = 'frxDBList'
    CloseDataSource = False
    DataSet = odsList
    Left = 656
    Top = 312
  end
end
