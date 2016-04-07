object frmSprMG: TfrmSprMG
  Left = 248
  Top = 113
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1091#1085#1082#1090#1086#1074' '#1084#1077#1078#1075#1086#1088#1086#1076#1072
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
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
    TabOrder = 4
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
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Width = 265
      end
      object VLIST_KM: TcxGridDBColumn
        Caption = #1050#1080#1083#1086#1084#1077#1090#1088#1072#1078
        DataBinding.FieldName = 'FN_KM'
        Width = 119
      end
      object VLIST_REMARK: TcxGridDBColumn
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
        DataBinding.FieldName = 'FC_REMARK'
        Width = 458
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
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 856
    Height = 26
    Align = dalTop
    BarManager = BM
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 304
    Top = 128
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select fk_id,'
      '       fc_name,'
      '       fn_km,'
      '       fc_remark,'
      '       fl_del,'
      '       fk_raionid,'
      
        '       (select fc_name from taxi.ts_raion where fk_id = ts_mg.fk' +
        '_raionid) as RaionName        '
      '  from taxi.ts_mg'
      ' where fl_del = 0'
      'order by fc_name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000006000000464C5F44454C01000000000005000000464E5F4B
      4D0100000000000900000046435F52454D41524B010000000000090000005241
      494F4E4E414D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsListAfterOpen
    Left = 304
    Top = 176
  end
  object AL: TActionList
    Images = frmMain.IL
    Left = 432
    Top = 240
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1091#1085#1082#1090' '#1084#1077#1078#1075#1086#1088#1086#1076#1072
      ImageIndex = 0
      ShortCut = 114
      OnExecute = aEditExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 2
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1091#1085#1082#1090#1086#1074' '#1084#1077#1078#1075#1086#1088#1086#1076#1072
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1091#1085#1082#1090#1086#1074' '#1084#1077#1078#1075#1086#1088#1086#1076#1072
      ImageIndex = 5
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1087#1091#1085#1082#1090' '#1084#1077#1078#1075#1086#1088#1086#1076#1072
      ImageIndex = 4
      ShortCut = 115
      OnExecute = aAddExecute
    end
    object aDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1091#1085#1082#1090' '#1084#1077#1078#1075#1086#1088#1086#1076#1072
      ImageIndex = 1
      ShortCut = 119
      OnExecute = aDelExecute
    end
    object aXLS: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' Excel'
      ImageIndex = 6
      OnExecute = aXLSExecute
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
    Left = 528
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
      FloatClientWidth = 78
      FloatClientHeight = 156
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
    ReportOptions.LastChange = 40635.646986365740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 624
    Top = 96
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
        Height = 52.913420000000000000
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
            #1056#1038#1056#1111#1057#1026#1056#176#1056#1030#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1056#1111#1057#1107#1056#1029#1056#1108#1057#8218#1056#1109#1056#1030' '#1056#1112#1056#181#1056#182#1056#1110#1056#1109#1057#1026#1056#1109#1056#1169#1056#176)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 34.015770000000010000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
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
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 52.913420000000000000
          Top = 34.015770000000010000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
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
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 268.346630000000000000
          Top = 34.015770000000010000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
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
            #1056#1113#1056#1114)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 343.937230000000000000
          Top = 34.015770000000010000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
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
            #1056#1113#1056#1109#1056#1112#1056#1112#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#1105)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 132.283550000000000000
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
          Width = 211.653680000000000000
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
          Left = 268.346630000000000000
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
            '[frxDBList."FN_KM"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 343.937230000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBList."FC_REMARK"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 211.653680000000000000
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
      'FN_KM=FN_KM'
      'FC_REMARK=FC_REMARK'
      'FL_DEL=FL_DEL')
    DataSet = odsList
    BCDToCurrency = False
    Left = 624
    Top = 144
  end
  object pmTV: TPopupMenu
    Images = frmMain.IL
    Left = 624
    Top = 202
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
    Left = 625
    Top = 251
  end
end
