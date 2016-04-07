object frmJurWU: TfrmJurWU
  Left = 313
  Top = 78
  Caption = #1043#1086#1088#1086#1076#1089#1082#1080#1077' '#1073#1077#1079' '#1091#1095#1072#1089#1090#1082#1072
  ClientHeight = 442
  ClientWidth = 912
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
    Width = 906
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object cxGr: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 906
    Height = 405
    Margins.Top = 0
    Align = alClient
    PopupMenu = pmGrid
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
    object tvList: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = tvListFam
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
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvListFam: TcxGridDBColumn
        Caption = #1060#1072#1084#1080#1083#1080#1103
        DataBinding.FieldName = 'fc_fam'
      end
      object tvListIm: TcxGridDBColumn
        Caption = #1048#1084#1103
        DataBinding.FieldName = 'fc_im'
      end
      object tvListOtch: TcxGridDBColumn
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        DataBinding.FieldName = 'fc_otch'
      end
      object tvListRojd: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        DataBinding.FieldName = 'fd_rojd'
      end
      object tvListSex: TcxGridDBColumn
        Caption = #1055#1086#1083
        DataBinding.FieldName = 'sex'
      end
    end
    object cxGrLevel1: TcxGridLevel
      GridView = tvList
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
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 440
    Top = 128
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
      FloatLeft = 227
      FloatTop = 89
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbRef'
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
    object bbRef: TdxBarButton
      Action = aRef
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbClose: TdxBarButton
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrint: TdxBarButton
      Action = aPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 448
    Top = 184
    object aRef: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 29
      ShortCut = 116
      OnExecute = aRefExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1078#1091#1088#1085#1072#1083
      ImageIndex = 0
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aXLS: TAction
      Caption = 'Excel-'#1092#1072#1081#1083
      ImageIndex = 17
      OnExecute = aXLSExecute
    end
    object aText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      ImageIndex = 14
      OnExecute = aTextExecute
    end
    object aWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 15
      OnExecute = aWebExecute
    end
    object aXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 16
      OnExecute = aXMLExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 18
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 328
    Top = 152
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'SELECT tp.ROWID,'
      '       tp.fK_ID,'
      '       tp.fc_fam,'
      '       tp.fc_im, '
      '       tp.fc_otch, '
      '       tp.fd_rojd, '
      '       decode(tp.fp_sex, 1, '#39#1052#1091#1078'.'#39', 0, '#39#1046#1077#1085'.'#39', '#39#39') as sex'
      '  from asu.tpeoples tp, asu.tadress ta, asu.tkladr tk'
      ' where tp.fk_id = ta.fk_pacid '
      '   and ta.fk_kladr = tk.fk_id '
      '   and tk.fk_owner = asu.GET_CURR_CITY_KLADR_ID '
      '   and ta.fk_type = asu.GET_REGISTID'
      
        '   and not EXISTS (select 1 from asu.tdistrict_pacient where fk_' +
        'peplid = tp.fk_id)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F49440100000000000600000046435F4641
      4D0100000000000500000046435F494D0100000000000700000046435F4F5443
      480100000000000700000046445F524F4A440100000000000300000053455801
      0000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsListAfterOpen
    Left = 328
    Top = 200
  end
  object pmGrid: TPopupMenu
    Images = frmMain.ilMain
    Left = 624
    Top = 168
    object N1: TMenuItem
      Action = aPrint
    end
    object N2: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 13
      object N5: TMenuItem
        Action = aText
      end
      object Web1: TMenuItem
        Action = aWeb
      end
      object XML1: TMenuItem
        Action = aXML
      end
      object Excel1: TMenuItem
        Action = aXLS
      end
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 32
      OnClick = N4Click
    end
  end
  object dlgSavePopUp: TSaveDialog
    Left = 329
    Top = 251
  end
  object frxList: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40556.357598101850000000
    ReportOptions.LastChange = 40870.413490127310000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxListGetValue
    Left = 696
    Top = 168
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
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 1084.725110000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 1084.725110000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baWidth
          Top = 15.897650000000000000
          Width = 1084.725110000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[OTDELNAME]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baWidth
          Top = 32.015770000000000000
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
            #1056#8211#1056#1032#1056#160#1056#1116#1056#1106#1056#8250' "'#1056#8220#1056#1115#1056#160#1056#1115#1056#8221#1056#1038#1056#1113#1056#152#1056#8226' '#1056#8216#1056#8226#1056#8212' '#1056#1032#1056#167#1056#1106#1056#1038#1056#1118#1056#1113#1056#1106'"')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 56.692950000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
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
        object Memo8: TfrxMemoView
          Left = 49.133890000000000000
          Top = 56.692950000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 336.378170000000000000
          Top = 56.692950000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1056#1112#1057#1039)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 495.118430000000000000
          Top = 56.692950000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 718.110700000000000000
          Top = 56.692950000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039
            '')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 857.953310000000000000
          Top = 56.692950000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 154.960730000000000000
        Width = 1084.725110000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo14: TfrxMemoView
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 49.133890000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBDataset1."FC_FAM"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 336.378170000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBDataset1."FC_IM"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 495.118430000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBDataset1."FC_OTCH"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 718.110700000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."FD_ROJD"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 857.953310000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."SEX"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 234.330860000000000000
        Width = 1084.725110000000000000
        object Memo21: TfrxMemoView
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[MEDOTRADESIGN], [DATESYS]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 604.724800000000000000
          Width = 480.000310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clMaroon
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FK_ID=FK_ID'
      'FC_FAM=FC_FAM'
      'FC_IM=FC_IM'
      'FC_OTCH=FC_OTCH'
      'FD_ROJD=FD_ROJD'
      'SEX=SEX')
    DataSet = odsList
    Left = 696
    Top = 216
  end
end
