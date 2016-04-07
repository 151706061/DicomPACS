object frmSprTarif: TfrmSprTarif
  Left = 200
  Top = 79
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1090#1072#1088#1080#1092#1086#1074
  ClientHeight = 561
  ClientWidth = 1068
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
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1062
    Height = 555
    Align = alClient
    BevelOuter = bvNone
    Color = clCream
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 505
      Height = 555
      Align = alLeft
      BevelOuter = bvNone
      Color = clCream
      ParentBackground = False
      TabOrder = 0
      object grTaxi: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 32
        Width = 502
        Height = 520
        Margins.Top = 0
        Margins.Right = 0
        Align = alClient
        TabOrder = 0
        LookAndFeel.SkinName = 'Caramel'
        object TVTAXI: TcxGridDBTableView
          PopupMenu = pmTVTaxi
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
          object VTAXISHORT: TcxGridDBColumn
            Caption = #1050#1086#1088#1086#1090#1082#1086
            DataBinding.FieldName = 'FC_NAME_SHORT'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
          end
          object VTAXIPRICEKM: TcxGridDBColumn
            Caption = #1062#1077#1085#1072' 1 '#1082#1084', '#1088#1091#1073'.'
            DataBinding.FieldName = 'FN_PRICEKM'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
          end
          object VTAXIFREE: TcxGridDBColumn
            Caption = '% '#1089#1074#1086#1073'.'
            DataBinding.FieldName = 'FN_FREE'
          end
          object VTAXIMG: TcxGridDBColumn
            Caption = '% '#1084'/'#1075
            DataBinding.FieldName = 'FN_MG'
          end
          object VTAXIALL: TcxGridDBColumn
            Caption = '% '#1074#1089#1077
            DataBinding.FieldName = 'FN_ALL'
          end
          object VTAXITALONCAR: TcxGridDBColumn
            Caption = #1058#1072#1083#1086#1085' '#1087#1086#1076#1072#1095#1072
            DataBinding.FieldName = 'FN_COST_CAR'
          end
          object VTAXITALONMIN: TcxGridDBColumn
            Caption = #1058#1072#1083#1086#1085' '#1084#1080#1085#1091#1090#1072
            DataBinding.FieldName = 'FN_COST_MIN'
          end
        end
        object grTaxiLevel1: TcxGridLevel
          GridView = TVTAXI
        end
      end
      object dxBarDockControl2: TdxBarDockControl
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 502
        Height = 26
        Margins.Right = 0
        Align = dalTop
        BarManager = BM
        SunkenBorder = False
        UseOwnSunkenBorder = True
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 505
      Top = 0
      Width = 8
      Height = 555
      HotZoneClassName = 'TcxXPTaskBarStyle'
      HotZone.SizePercent = 59
      Control = Panel2
    end
    object Panel3: TPanel
      Left = 513
      Top = 0
      Width = 549
      Height = 555
      Align = alClient
      BevelOuter = bvNone
      Color = clCream
      ParentBackground = False
      TabOrder = 2
      object dxBarDockControl1: TdxBarDockControl
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 546
        Height = 26
        Margins.Left = 0
        Align = dalTop
        BarManager = BM
        SunkenBorder = False
        UseOwnSunkenBorder = True
      end
      object grTarif: TcxGrid
        AlignWithMargins = True
        Left = 0
        Top = 32
        Width = 546
        Height = 520
        Margins.Left = 0
        Margins.Top = 0
        Align = alClient
        TabOrder = 1
        LookAndFeel.SkinName = 'Caramel'
        object TVTARIF: TcxGridDBTableView
          PopupMenu = pmTV
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsTarif
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = VTARIF_NAME
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
          object VTARIF_NAME: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_NAME'
          end
          object VTARIF_BEG: TcxGridDBColumn
            Caption = #1053#1072#1095#1072#1083#1086
            DataBinding.FieldName = 'FD_BEGIN'
            PropertiesClassName = 'TcxTimeEditProperties'
            Properties.ImmediatePost = True
            Properties.TimeFormat = tfHourMin
            Options.Editing = False
          end
          object VTARIF_END: TcxGridDBColumn
            Caption = #1050#1086#1085#1077#1094
            DataBinding.FieldName = 'FD_END'
            PropertiesClassName = 'TcxTimeEditProperties'
            Properties.ImmediatePost = True
            Properties.TimeFormat = tfHourMin
            Options.Editing = False
          end
          object VTARIF_COST1: TcxGridDBColumn
            Caption = #1055#1086#1076#1072#1095#1072' '#1084#1072#1096#1080#1085#1099
            DataBinding.FieldName = 'FN_COST1'
          end
          object VTARIF_COST2: TcxGridDBColumn
            Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1084#1080#1085#1091#1090#1099
            DataBinding.FieldName = 'FN_COST2'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = TVTARIF
        end
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
    Left = 420
    Top = 275
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
      Caption = 'Taxi'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 168
      FloatTop = 51
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbAddTaxi'
        end
        item
          Visible = True
          ItemName = 'bbEditTaxi'
        end
        item
          Visible = True
          ItemName = 'bbDelTaxi'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefTaxi'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton1'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BMBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Tarif'
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
    object bbAddTaxi: TdxBarButton
      Action = aAddTaxi
      Category = 0
    end
    object bbAddTarif: TdxBarButton
      Action = aAddTarif
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEditTarif: TdxBarButton
      Action = aEditTarif
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDelTarif: TdxBarButton
      Action = aDelTarif
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefTarif: TdxBarButton
      Action = aRefreshTarif
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrintTarif: TdxBarButton
      Action = aPrintTarif
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbClose: TdxBarButton
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEditTaxi: TdxBarButton
      Action = aEditTaxi
      Category = 0
    end
    object bbDelTaxi: TdxBarButton
      Action = aDelTaxi
      Category = 0
    end
    object bbRefTaxi: TdxBarButton
      Action = aRefreshTaxi
      Category = 0
    end
    object dxBarButton1: TdxBarButton
      Action = aPrintTaxi
      Category = 0
    end
  end
  object odsTaxi: TOracleDataSet
    SQL.Strings = (
      'select * from taxi.ts_taxi'
      ' where fl_del = 0'
      'order by fc_name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000B00000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000006000000464C5F44454C0100000000000D00000046435F4E
      414D455F53484F52540100000000000A000000464E5F50524943454B4D010000
      0000000A00000046435F53594E4F4E494D01000000000007000000464E5F4652
      454501000000000005000000464E5F4D4701000000000006000000464E5F414C
      4C0100000000000B000000464E5F434F53545F4341520100000000000B000000
      464E5F434F53545F4D494E010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsTaxiAfterOpen
    AfterScroll = odsTaxiAfterScroll
    Left = 348
    Top = 171
  end
  object odsTarif: TOracleDataSet
    SQL.Strings = (
      'select fk_id,'
      '       fc_name,'
      '       fd_begin,'
      '       fd_end,'
      '       fn_cost1,'
      '       fn_cost2 '
      '  from taxi.ts_tarif'
      ' where fk_taxiid = :pfk_taxiid'
      '  and fl_del = 0'
      'order by fk_id')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F544158494944030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000800000046445F424547494E010000000000060000004644
      5F454E4401000000000008000000464E5F434F53543101000000000008000000
      464E5F434F53543201000000000009000000464B5F5441584949440100000000
      0006000000464C5F44454C010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsTarifAfterOpen
    Left = 412
    Top = 171
  end
  object dsTaxi: TDataSource
    DataSet = odsTaxi
    Left = 348
    Top = 123
  end
  object dsTarif: TDataSource
    DataSet = odsTarif
    Left = 412
    Top = 123
  end
  object AL: TActionList
    Images = frmMain.IL
    Left = 572
    Top = 155
    object aAddTaxi: TAction
      Category = 'Taxi'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1072#1082#1089#1080
      ImageIndex = 4
      OnExecute = aAddTaxiExecute
    end
    object aEditTaxi: TAction
      Category = 'Taxi'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1072#1082#1089#1080
      ImageIndex = 0
      OnExecute = aEditTaxiExecute
    end
    object aDelTaxi: TAction
      Category = 'Taxi'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1072#1082#1089#1080
      ImageIndex = 1
      OnExecute = aDelTaxiExecute
    end
    object aRefreshTaxi: TAction
      Category = 'Taxi'
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 5
      OnExecute = aRefreshTaxiExecute
    end
    object aAddTarif: TAction
      Category = 'Tarif'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1090#1072#1088#1080#1092
      ImageIndex = 4
      ShortCut = 115
      OnExecute = aAddTarifExecute
    end
    object aEditTarif: TAction
      Category = 'Tarif'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1090#1072#1088#1080#1092#1072
      ImageIndex = 0
      ShortCut = 114
      OnExecute = aEditTarifExecute
    end
    object aDelTarif: TAction
      Category = 'Tarif'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1072#1088#1080#1092
      ImageIndex = 1
      ShortCut = 119
      OnExecute = aDelTarifExecute
    end
    object aRefreshTarif: TAction
      Category = 'Tarif'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1090#1072#1088#1080#1092#1086#1074
      ImageIndex = 5
      ShortCut = 116
      OnExecute = aRefreshTarifExecute
    end
    object aPrintTarif: TAction
      Category = 'Tarif'
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 2
      ShortCut = 16464
      OnExecute = aPrintTarifExecute
    end
    object aClose: TAction
      Category = 'Tarif'
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1090#1072#1088#1080#1092#1086#1074
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aPrintTaxi: TAction
      Category = 'Taxi'
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1090#1072#1082#1089#1080
      ImageIndex = 2
      OnExecute = aPrintTaxiExecute
    end
    object aXLSTaxi: TAction
      Category = 'Taxi'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' Excel'
      ImageIndex = 6
      OnExecute = aXLSTaxiExecute
    end
    object aXLSTarif: TAction
      Category = 'Tarif'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' Excel'
      ImageIndex = 6
      OnExecute = aXLSTarifExecute
    end
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
    ReportOptions.LastChange = 40530.056602048610000000
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
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1038#1056#1111#1057#1026#1056#176#1056#1030#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1057#8218#1056#176#1057#1026#1056#1105#1057#8222#1056#1109#1056#1030)
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
          Width = 192.756030000000000000
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
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#8218#1056#176#1057#1026#1056#1105#1057#8222#1056#176)
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
          Font.Style = []
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
          Left = 249.448980000000000000
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
            #1056#1116#1056#176#1057#8225#1056#176#1056#187#1056#1109)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 325.039580000000000000
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
            #1056#1113#1056#1109#1056#1029#1056#181#1057#8224)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 400.630180000000000000
          Top = 52.913420000000000000
          Width = 173.858380000000000000
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
            #1056#1119#1056#1109#1056#1169#1056#176#1057#8225#1056#176' '#1056#1112#1056#176#1057#8364#1056#1105#1056#1029#1057#8249'('#1057#1026#1057#1107#1056#177'.)')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 578.268090000000000000
          Top = 52.913420000000000000
          Width = 173.858380000000000000
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
            #1056#1038#1057#8218#1056#1109#1056#1105#1056#1112#1056#1109#1057#1027#1057#8218#1057#1034' '#1056#1112#1056#1105#1056#1029#1057#1107#1057#8218#1057#8249'('#1057#1026#1057#1107#1056#177'.)')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 755.906000000000000000
        DataSet = frxDBList
        DataSetName = 'frxDBList'
        RowCount = 0
        Stretched = True
        object Memo7: TfrxMemoView
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Left = 249.448980000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clNone
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."FD_BEGIN"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 325.039580000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clNone
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."FD_END"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 400.630180000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clNone
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."FN_COST1"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 578.268090000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clNone
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."FN_COST2"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 230.551330000000000000
        Width = 755.906000000000000000
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
          Width = 457.323130000000000000
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
      'FC_NAME=FC_NAME'
      'FD_BEGIN=FD_BEGIN'
      'FD_END=FD_END'
      'FN_COST1=FN_COST1'
      'FN_COST2=FN_COST2'
      'FK_TAXIID=FK_TAXIID'
      'FL_DEL=FL_DEL')
    DataSet = odsTarif
    BCDToCurrency = False
    Left = 744
    Top = 152
  end
  object pmTV: TPopupMenu
    Images = frmMain.IL
    Left = 744
    Top = 210
    object N1: TMenuItem
      Action = aPrintTarif
    end
    object MenuItem1: TMenuItem
      Action = aXLSTarif
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
  object pmTVTaxi: TPopupMenu
    Images = frmMain.IL
    Left = 56
    Top = 98
    object MenuItem2: TMenuItem
      Action = aPrintTaxi
      Caption = #1055#1077#1095#1072#1090#1100
    end
    object MenuItem3: TMenuItem
      Action = aXLSTaxi
    end
    object MenuItem4: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 7
    end
  end
  object frxTaxi: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40516.999330289350000000
    ReportOptions.LastChange = 41115.742706307870000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 56
    Top = 144
    Datasets = <
      item
        DataSet = frxDBTaxi
        DataSetName = 'frxDBList'
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
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 49.133890000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1038#1056#1111#1057#1026#1056#176#1056#1030#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1057#8218#1056#176#1056#1108#1057#1027#1056#1105)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 30.236240000000000000
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
          Top = 30.236240000000000000
          Width = 249.448980000000000000
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
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#8218#1056#176#1056#1108#1057#1027#1056#1105)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 306.141930000000000000
          Top = 30.236240000000000000
          Width = 86.929190000000000000
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
            #1056#1038#1056#1109#1056#1108#1057#1026#1056#176#1057#8240#1056#181#1056#1029#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 396.850650000000000000
          Top = 30.236240000000000000
          Width = 120.944960000000000000
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
            #1056#166#1056#181#1056#1029#1056#176' 1 '#1056#1108#1056#1112' '#1056#1111#1056#1109' '#1056#1112'/'#1056#1110)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 521.575140000000000000
          Top = 30.236240000000000000
          Width = 68.031540000000000000
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
            '% '#1057#1027#1056#1030#1056#1109#1056#177'.')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 593.386210000000000000
          Top = 30.236240000000000000
          Width = 68.031540000000000000
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
            '% '#1056#1112'/'#1056#1110)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 665.197280000000000000
          Top = 30.236240000000000000
          Width = 68.031540000000000000
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
            '% '#1056#1030#1057#1027#1056#181)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 128.504020000000000000
        Width = 755.906000000000000000
        DataSet = frxDBTaxi
        DataSetName = 'frxDBList'
        RowCount = 0
        Stretched = True
        object Memo7: TfrxMemoView
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
        object Memo5: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."FC_NAME_SHORT"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 396.850650000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."FN_PRICEKM"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 526.134200000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."FN_FREE"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 595.386210000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."FN_MG"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 665.197280000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBList."FN_ALL"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 207.874150000000000000
        Width = 755.906000000000000000
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
          Width = 457.323130000000000000
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
  object frxDBTaxi: TfrxDBDataset
    UserName = 'frxDBList'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FK_ID=FK_ID'
      'FC_NAME=FC_NAME'
      'FL_DEL=FL_DEL'
      'FC_NAME_SHORT=FC_NAME_SHORT'
      'FN_PRICEKM=FN_PRICEKM'
      'FC_SYNONIM=FC_SYNONIM'
      'FN_FREE=FN_FREE'
      'FN_MG=FN_MG'
      'FN_ALL=FN_ALL')
    DataSet = odsTaxi
    BCDToCurrency = False
    Left = 56
    Top = 192
  end
end
