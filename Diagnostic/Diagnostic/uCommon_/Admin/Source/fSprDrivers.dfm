object frmSprDrivers: TfrmSprDrivers
  Left = 218
  Top = 51
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1090#1072#1082#1089#1080#1089#1090#1086#1074
  ClientHeight = 473
  ClientWidth = 862
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 249
    Height = 473
    Align = alLeft
    BevelOuter = bvNone
    Color = clCream
    ParentBackground = False
    TabOrder = 1
    object grTaxi: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 32
      Width = 243
      Height = 438
      Margins.Top = 0
      Align = alClient
      TabOrder = 0
      LookAndFeel.SkinName = 'Caramel'
      object TVTAXI: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsTaxi
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = VTAXI_NAME
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object VTAXI_NAME: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_NAME'
        end
      end
      object grTaxiLevel1: TcxGridLevel
        GridView = TVTAXI
      end
    end
    object dxBarDockControl1: TdxBarDockControl
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 243
      Height = 26
      Align = dalTop
      BarManager = BM
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 249
    Top = 0
    Width = 8
    Height = 473
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 59
    Control = Panel1
  end
  object Panel2: TPanel
    Left = 257
    Top = 0
    Width = 605
    Height = 473
    Align = alClient
    BevelOuter = bvNone
    Color = clCream
    ParentBackground = False
    TabOrder = 6
    object dxBarDockControl2: TdxBarDockControl
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 599
      Height = 26
      Align = dalTop
      BarManager = BM
      SunkenBorder = False
      UseOwnSunkenBorder = True
    end
    object grList: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 32
      Width = 599
      Height = 438
      Margins.Top = 0
      Align = alClient
      TabOrder = 1
      LookAndFeel.SkinName = 'Caramel'
      object TVLIST: TcxGridDBTableView
        PopupMenu = pmTV
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsList
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = VLIST_NAME
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object VLIST_NAME: TcxGridDBColumn
          Caption = #1055#1086#1079#1099#1074#1085#1086#1081
          DataBinding.FieldName = 'FC_NAME_BT'
        end
        object VLIST_FIO: TcxGridDBColumn
          Caption = #1060#1048#1054' '#1090#1072#1082#1089#1080#1089#1090#1072
          DataBinding.FieldName = 'FC_FIO'
        end
        object VLIST_AUTO: TcxGridDBColumn
          Caption = #1052#1072#1088#1082#1072' '#1072#1074#1090#1086' '#1080' '#1085#1086#1084#1077#1088
          DataBinding.FieldName = 'FC_AUTO'
        end
        object VLIST_YEAR: TcxGridDBColumn
          Caption = #1043#1086#1076' '#1074#1099#1087#1091#1089#1082#1072
          DataBinding.FieldName = 'FC_YEAR'
        end
        object VLIST_IN: TcxGridDBColumn
          Caption = #1055#1088#1080#1085#1103#1090
          DataBinding.FieldName = 'FD_IN'
        end
        object VLIST_OUT: TcxGridDBColumn
          Caption = #1059#1074#1086#1083#1077#1085
          DataBinding.FieldName = 'FD_OUT'
        end
        object VLIST_MED: TcxGridDBColumn
          Caption = #1052#1077#1076' '#1089#1087#1088#1072#1074#1082#1072
          DataBinding.FieldName = 'FD_MED'
        end
        object VLIST_LIC: TcxGridDBColumn
          Caption = #1051#1080#1094#1077#1085#1079#1080#1103
          DataBinding.FieldName = 'FD_LICENSE'
        end
        object VLIST_20: TcxGridDBColumn
          Caption = '20 '#1095#1072#1089#1086#1074
          DataBinding.FieldName = 'FD_20HOURS'
        end
        object VLIST_PHONE: TcxGridDBColumn
          Caption = #1052#1086#1073'. '#1090#1077#1083#1077#1092#1086#1085
          DataBinding.FieldName = 'FC_PHONE'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = TVLIST
      end
    end
  end
  object odsTaxi: TOracleDataSet
    SQL.Strings = (
      'select * from taxi.ts_taxi'
      ' where fl_del = 0'
      'order by fc_name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000006000000464C5F44454C010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterScroll = odsTaxiAfterScroll
    Left = 100
    Top = 139
  end
  object dsTaxi: TDataSource
    DataSet = odsTaxi
    Left = 100
    Top = 91
  end
  object AL: TActionList
    Images = frmMain.IL
    Left = 572
    Top = 155
    object aAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1090#1072#1082#1089#1080#1089#1090#1072
      ImageIndex = 4
      ShortCut = 115
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1090#1072#1082#1089#1080#1089#1090#1072
      ImageIndex = 0
      ShortCut = 114
      OnExecute = aEditExecute
    end
    object aDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1072#1082#1089#1080#1089#1090#1072
      ImageIndex = 1
      ShortCut = 119
      OnExecute = aDelExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1090#1072#1082#1089#1080#1089#1090#1086#1074
      ImageIndex = 5
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 2
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1090#1072#1082#1089#1080#1089#1090#1086#1074
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aXLS: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' Excel'
      ImageIndex = 6
      OnExecute = aXLSExecute
    end
    object aFind: TAction
      Caption = #1055#1086#1080#1089#1082
      Hint = #1055#1086#1080#1089#1082' '#1090#1072#1082#1089#1080#1089#1090#1072
      ImageIndex = 9
      ShortCut = 16454
      OnExecute = aFindExecute
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
      #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clBtnFace
    ImageOptions.Images = frmMain.IL
    LookAndFeel.SkinName = 'Caramel'
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 388
    Top = 275
    DockControlHeights = (
      0
      0
      0
      0)
    object BMBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Main'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 168
      FloatTop = 51
      FloatClientWidth = 78
      FloatClientHeight = 156
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbAddTarif'
        end
        item
          Visible = True
          ItemName = 'bbEditTarif'
        end
        item
          Visible = True
          ItemName = 'bbDelTarif'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefTarif'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrintTarif'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbClose'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BMBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Find'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 168
      FloatTop = 51
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbFind'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbAddTaxi: TdxBarButton
      Caption = 'aAddTaxi'
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1072#1082#1089#1080
      Visible = ivAlways
      ImageIndex = 4
    end
    object bbAddTarif: TdxBarButton
      Action = aAdd
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEditTarif: TdxBarButton
      Action = aEdit
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDelTarif: TdxBarButton
      Action = aDel
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefTarif: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrintTarif: TdxBarButton
      Action = aPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbClose: TdxBarButton
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEditTaxi: TdxBarButton
      Caption = 'aEditTaxi'
      Category = 0
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1072#1082#1089#1080
      Visible = ivAlways
      ImageIndex = 0
    end
    object bbDelTaxi: TdxBarButton
      Caption = 'aDelTaxi'
      Category = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1072#1082#1089#1080
      Visible = ivAlways
      ImageIndex = 1
    end
    object bbRefTaxi: TdxBarButton
      Caption = 'aRefreshTaxi'
      Category = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      Visible = ivAlways
      ImageIndex = 5
    end
    object dxBarButton1: TdxBarButton
      Caption = 'aPrintTaxi'
      Category = 0
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1090#1072#1082#1089#1080
      Visible = ivAlways
      ImageIndex = 2
    end
    object bbFind: TdxBarButton
      Action = aFind
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object pmTV: TPopupMenu
    Images = frmMain.IL
    Left = 744
    Top = 210
    object N1: TMenuItem
      Action = aPrint
    end
    object MenuItem1: TMenuItem
      Action = aXLS
    end
    object N2: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 7
      OnClick = N2Click
    end
  end
  object sdPopUp: TSaveDialog
    Left = 745
    Top = 259
  end
  object frxList: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40516.999330289350000000
    ReportOptions.LastChange = 40537.611515300920000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxListGetValue
    Left = 744
    Top = 104
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
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 1084.725110000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 1084.725110000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1038#1056#1111#1057#1026#1056#176#1056#1030#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1057#8218#1056#176#1056#1108#1057#1027#1056#1105#1057#1027#1057#8218#1056#1109#1056#1030)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 52.913420000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 52.913420000000000000
          Top = 52.913420000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#183#1057#8249#1056#1030#1056#1029#1056#1109#1056#8470)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 22.677180000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1118#1056#176#1056#1108#1057#1027#1056#1105':')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 52.913420000000000000
          Top = 22.677180000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[TAXI]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 132.283550000000000000
          Top = 52.913420000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#152#1056#1115' '#1057#8218#1056#176#1056#1108#1057#1027#1056#1105#1057#1027#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 427.086890000000000000
          Top = 52.913420000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#1026#1056#1108#1056#176' '#1056#176#1056#1030#1057#8218#1056#1109' '#1056#1105' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 582.047620000000000000
          Top = 52.913420000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8220#1056#1109#1056#1169' '#1056#1030#1057#8249#1056#1111#1057#1107#1057#1027#1056#1108#1056#176)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 676.535870000000000000
          Top = 52.913420000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#1029#1057#1039#1057#8218)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 752.126470000000000000
          Top = 52.913420000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1056#1030#1056#1109#1056#187#1056#181#1056#1029)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 827.717070000000000000
          Top = 52.913420000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#181#1056#1169' '#1057#1027#1056#1111#1057#1026#1056#176#1056#1030#1056#1108#1056#176)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 922.205320000000000000
          Top = 52.913420000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8250#1056#1105#1057#8224#1056#181#1056#1029#1056#183#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 1005.354980000000000000
          Top = 52.913420000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '20 '#1057#8225#1056#176#1057#1027#1056#1109#1056#1030)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 1084.725110000000000000
        DataSet = frxDBList
        DataSetName = 'frxDBList'
        RowCount = 0
        Stretched = True
        object Memo7: TfrxMemoView
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 52.913420000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBList."FC_NAME"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 132.283550000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clNone
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBList."FC_FIO"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 427.086890000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clNone
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBList."FC_AUTO"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 582.047620000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clNone
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBList."FC_YEAR"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 676.535870000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clNone
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBList."FD_IN"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 752.126470000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clNone
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBList."FD_OUT"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 827.717070000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clNone
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBList."FD_MED"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 922.205320000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clNone
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBList."FD_LICENSE"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 1005.354980000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clNone
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBList."FD_20HOURS"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 230.551330000000000000
        Width = 1084.725110000000000000
        object Memo12: TfrxMemoView
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1106#1056#160#1056#1114' "'#1056#1106#1056#1169#1056#1112#1056#1105#1056#1029#1056#1105#1057#1027#1057#8218#1057#1026#1056#176#1057#8218#1056#1109#1057#1026'" [Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 298.582870000000000000
          Width = 782.362710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBList: TfrxDBDataset
    UserName = 'frxDBList'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FK_ID=FK_ID'
      'FC_FIO=FC_FIO'
      'FC_AUTO=FC_AUTO'
      'FC_NAME=FC_NAME'
      'FC_YEAR=FC_YEAR'
      'FD_IN=FD_IN'
      'FD_OUT=FD_OUT'
      'FD_MED=FD_MED'
      'FD_LICENSE=FD_LICENSE'
      'FD_20HOURS=FD_20HOURS'
      'FL_DEL=FL_DEL'
      'FK_TAXIID=FK_TAXIID')
    DataSet = odsList
    BCDToCurrency = False
    Left = 744
    Top = 152
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      
        'select fk_id, fc_fio, fc_auto, fc_name||fc_bag||fc_tros as fc_na' +
        'me_bt, fc_name, fc_year, fd_in, fd_out, fd_med, fd_license, fd_2' +
        '0hours,'
      '       fl_del, fk_taxiid, fc_phone, fc_comment, fc_bag, fc_tros'
      '  from taxi.ts_drivers'
      ' where fk_taxiid = :pfk_taxiid'
      '  and fl_del = 0'
      'order by to_number(fc_name)')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F544158494944030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000001100000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000009000000464B5F5441584949440100000000000600000046
      4C5F44454C0100000000000600000046435F46494F0100000000000700000046
      435F4155544F0100000000000700000046435F59454152010000000000050000
      0046445F494E0100000000000600000046445F4F555401000000000006000000
      46445F4D45440100000000000A00000046445F4C4943454E5345010000000000
      0A00000046445F3230484F5552530100000000000800000046435F50484F4E45
      0100000000000A00000046435F4E414D455F42540100000000000A0000004643
      5F434F4D4D454E540100000000000600000046435F4241470100000000000700
      000046435F54524F53010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsListAfterOpen
    Left = 412
    Top = 171
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 412
    Top = 123
  end
end
