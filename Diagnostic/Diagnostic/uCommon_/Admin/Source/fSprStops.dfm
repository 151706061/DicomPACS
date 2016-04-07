object frmSprStops: TfrmSprStops
  Left = 218
  Top = 51
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1090#1086#1103#1085#1086#1082
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
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 856
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
    Width = 856
    Height = 438
    Margins.Top = 0
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    LookAndFeel.Kind = lfUltraFlat
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
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
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
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        PropertiesClassName = 'TcxTextEditProperties'
      end
      object VLIST_FNAME: TcxGridDBColumn
        Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME_FULL'
      end
      object VLIST_PLAT: TcxGridDBColumn
        Caption = #1055#1083#1072#1090#1085#1072#1103
        DataBinding.FieldName = 'PLAT_SPR'
      end
      object VLIST_COMMENT: TcxGridDBColumn
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
        DataBinding.FieldName = 'FC_COMMENT'
      end
      object VLIST_COST: TcxGridDBColumn
        Caption = #1053#1072#1076#1073#1072#1074#1082#1072'('#1088#1091#1073'.)'
        DataBinding.FieldName = 'FN_COST'
      end
      object VLIST_RAION: TcxGridDBColumn
        Caption = #1056#1072#1081#1086#1085
        DataBinding.FieldName = 'RAIONNAME'
      end
    end
    object grListLevel1: TcxGridLevel
      GridView = TVLIST
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
    Left = 272
    Top = 144
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
      FloatLeft = 168
      FloatTop = 51
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbAdd'
        end
        item
          Visible = True
          ItemName = 'bbEdit'
        end
        item
          Visible = True
          ItemName = 'bbDel'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrint'
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
    object bbAdd: TdxBarButton
      Action = aAdd
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEdit: TdxBarButton
      Action = aEdit
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDel: TdxBarButton
      Action = aDel
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefresh: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrint: TdxBarButton
      Action = aPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbClose: TdxBarButton
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 427
    Top = 107
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select fk_id,'
      '       fc_name,'
      '       fc_name_full,'
      '       fl_plat, decode(fl_plat, 0, '#39#1053#1045#1058#39', 1, '#39#1044#1040#39') as plat_spr,'
      '       fc_comment,'
      '       fn_cost,'
      '       fk_raionid,   '
      
        '       (select fc_name from taxi.ts_raion where fk_id = ts_place' +
        's.fk_raionid) as raionname'
      '  from taxi.ts_places'
      ' where fl_del = 0'
      'order by fc_name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000900000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000C00000046435F4E414D455F46554C4C0100000000000700
      0000464C5F504C41540100000000000A00000046435F434F4D4D454E54010000
      00000008000000504C41545F53505201000000000007000000464E5F434F5354
      0100000000000A000000464B5F5241494F4E4944010000000000090000005241
      494F4E4E414D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsListAfterOpen
    Left = 427
    Top = 155
  end
  object AL: TActionList
    Images = frmMain.IL
    Left = 427
    Top = 243
    object aAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1089#1090#1086#1103#1085#1082#1091
      ImageIndex = 4
      ShortCut = 115
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1086' '#1089#1090#1086#1103#1085#1082#1077
      ImageIndex = 0
      ShortCut = 114
      OnExecute = aEditExecute
    end
    object aDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1086#1103#1085#1082#1091
      ImageIndex = 1
      ShortCut = 119
      OnExecute = aDelExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1090#1086#1103#1085#1086#1082
      ImageIndex = 2
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1090#1086#1103#1085#1086#1082
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1090#1086#1103#1085#1086#1082
      ImageIndex = 5
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aExcel: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel'
      ImageIndex = 6
      OnExecute = aExcelExecute
    end
  end
  object pmTV: TPopupMenu
    Images = frmMain.IL
    Left = 656
    Top = 138
    object N1: TMenuItem
      Action = aPrint
    end
    object MenuItem1: TMenuItem
      Action = aExcel
    end
    object N2: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 7
      OnClick = N2Click
    end
  end
  object sdPopUp: TSaveDialog
    Left = 657
    Top = 187
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
    ReportOptions.LastChange = 40530.997557523150000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 720
    Top = 136
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
        Height = 52.913420000000000000
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
            #1056#1038#1056#1111#1057#1026#1056#176#1056#1030#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1057#1027#1057#8218#1056#1109#1057#1039#1056#1029#1056#1109#1056#1108)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 34.015770000000010000
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
          Top = 34.015770000000000000
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
            #1056#1116#1056#176#1056#183#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 230.551330000000000000
          Top = 34.015770000000000000
          Width = 272.126160000000000000
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
            #1056#1119#1056#1109#1056#187#1056#1029#1056#1109#1056#181' '#1056#1029#1056#176#1056#183#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 506.457020000000000000
          Top = 34.015770000000000000
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
            #1056#1119#1056#187#1056#176#1057#8218#1056#1029#1056#176#1057#1039)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 582.047620000000000000
          Top = 34.015770000000000000
          Width = 396.850650000000000000
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
            #1056#1113#1056#1109#1056#1112#1056#1112#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#1105)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 982.677800000000000000
          Top = 34.015770000000000000
          Width = 98.267780000000000000
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
            #1056#1116#1056#176#1056#1169#1056#177#1056#176#1056#1030#1056#1108#1056#176)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 132.283550000000000000
        Width = 1084.725110000000000000
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
          Width = 173.858380000000000000
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
          Left = 230.551330000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBList."FC_NAME_FULL"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 506.457020000000000000
          Width = 71.811070000000000000
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
            '[frxDBList."PLAT_SPR"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 582.047620000000000000
          Width = 396.850650000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBList."FC_COMMENT"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 982.677800000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBList."FN_COST"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 211.653680000000000000
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
      'FC_NAME_FULL=FC_NAME_FULL'
      'FL_PLAT=FL_PLAT'
      'PLAT_SPR=PLAT_SPR'
      'FC_COMMENT=FC_COMMENT'
      'FN_COST=FN_COST')
    DataSet = odsList
    BCDToCurrency = False
    Left = 720
    Top = 184
  end
end
