object frmNazRg1: TfrmNazRg1
  Left = 239
  Top = 110
  BorderStyle = bsDialog
  Caption = #1052#1077#1090#1086#1076#1080#1082#1080' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
  ClientHeight = 620
  ClientWidth = 889
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
  object Splitter1: TSplitter
    Left = 252
    Top = 42
    Width = 4
    Height = 578
    ExplicitLeft = 335
    ExplicitTop = 62
    ExplicitHeight = 620
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 42
    Width = 249
    Height = 575
    Margins.Top = 0
    Margins.Right = 0
    Align = alLeft
    BevelOuter = bvNone
    Constraints.MinWidth = 200
    TabOrder = 0
    object cxGrGroup: TcxGrid
      Left = 0
      Top = 0
      Width = 249
      Height = 575
      Align = alClient
      PopupMenu = pmGroup
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object TVGROUPS: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsGroups
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'FC_NAME'
            Column = VGROUPNAME
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        Styles.Inactive = cxStyle1
        Styles.Selection = cxStyle1
        object VGROUPNAME: TcxGridDBColumn
          Caption = #1043#1088#1091#1087#1087#1072
          DataBinding.FieldName = 'FC_NAME'
        end
      end
      object cxGrGroupLevel1: TcxGridLevel
        GridView = TVGROUPS
      end
    end
  end
  object Panel2: TPanel
    Left = 256
    Top = 42
    Width = 633
    Height = 578
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object cxGr: TcxGrid
      AlignWithMargins = True
      Left = 0
      Top = 31
      Width = 630
      Height = 544
      Margins.Left = 0
      Margins.Top = 0
      Align = alClient
      PopupMenu = pmMetodic
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object TV: TcxGridDBTableView
        OnKeyDown = TVKeyDown
        NavigatorButtons.ConfirmDelete = False
        OnCellDblClick = TVCellDblClick
        DataController.DataSource = ds
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'FC_NAME'
            Column = TVNAME
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GridLines = glHorizontal
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object TVNAME: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_NAME'
          Options.Editing = False
          Width = 708
        end
      end
      object cxGrLevel1: TcxGridLevel
        GridView = TV
      end
    end
    object dxBarDockControl2: TdxBarDockControl
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 630
      Height = 28
      Margins.Left = 0
      Margins.Top = 0
      Align = dalTop
      BarManager = BM
      SunkenBorder = True
      UseOwnSunkenBorder = True
    end
  end
  object Panel4: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 883
    Height = 36
    Hint = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086' '#1087#1072#1094#1080#1077#1085#1090#1072' '
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    object lbFIO: TcxLabel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Align = alLeft
      Caption = 'Pacient'
      ParentFont = False
      PopupMenu = pmFIO
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Book Antiqua'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfOffice11
      Style.Shadow = False
      Style.TextColor = clTeal
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.Kind = lfOffice11
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      OnMouseLeave = lbFIOMouseLeave
      OnMouseMove = lbFIOMouseMove
      AnchorX = 34
      AnchorY = 18
    end
    object bClose: TcxButton
      AlignWithMargins = True
      Left = 795
      Top = 2
      Width = 83
      Height = 32
      Margins.Top = 0
      Margins.Bottom = 0
      Action = aClose
      Align = alRight
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Colors.Normal = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object ds: TDataSource
    DataSet = odsChild
    Left = 280
    Top = 240
  end
  object odsChild: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_SMID, '
      
        '       ASU.GET_NAME_RGISSL(FK_SMID) ||'#39'/'#39'||TS.FC_TIME||'#39'/'#39'||TRIM' +
        '(TO_CHAR(TS.FN_NORM0, '#39'B9G999G999G990D99'#39', '#39'NLS_NUMERIC_CHARACTE' +
        'RS = '#39#39'.0'#39#39#39')) AS FC_NAME'
      '  FROM ASU.TNAZVRACH, ASU.TSMID TS'
      ' WHERE TNAZVRACH.FK_KABINETID = :PFK_KABINET'
      
        '   AND (SELECT FK_DEFAULT FROM ASU.TSMID WHERE FK_ID = TNAZVRACH' +
        '.FK_SMID) = :PFK_GROUP'
      '   AND TNAZVRACH.FK_SMID = TS.FK_ID'
      '   AND TS.FL_DEL = 0'
      '   AND TNAZVRACH.FK_SOTRID = :PFK_SOTR'
      ''
      'ORDER BY TS.FN_ORDER'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    Variables.Data = {
      03000000030000000C0000003A50464B5F4B4142494E45540300000000000000
      000000000A0000003A50464B5F47524F55500300000000000000000000000900
      00003A50464B5F534F5452030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000007000000464B5F534D49440100000000000700000046435F
      4E414D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 280
    Top = 344
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 400
    Top = 336
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aSet: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1084#1077#1090#1086#1076#1080#1082#1091' '#1080#1079' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 23
      OnExecute = aSetExecute
    end
    object aPrintGroup: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1075#1088#1091#1087#1087' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 10
      OnExecute = aPrintGroupExecute
    end
    object aText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 6
      OnExecute = aTextExecute
    end
    object aWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 7
      OnExecute = aWebExecute
    end
    object aXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 8
      OnExecute = aXMLExecute
    end
    object aXLS: TAction
      Caption = 'Excel '#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel '#1092#1072#1081#1083
      ImageIndex = 9
      OnExecute = aXLSExecute
    end
    object aTextMet: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 6
      OnExecute = aTextMetExecute
    end
    object aWebMet: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 7
      OnExecute = aWebMetExecute
    end
    object aXMLMet: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 8
      OnExecute = aXMLMetExecute
    end
    object aXLSMet: TAction
      Caption = 'Excel '#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel '#1092#1072#1081#1083
      ImageIndex = 9
      OnExecute = aXLSMetExecute
    end
    object aPrintMet: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1084#1077#1090#1086#1076#1080#1082
      ImageIndex = 10
      OnExecute = aPrintMetExecute
    end
  end
  object BM: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 520
    Top = 144
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
      Caption = 'Up_Down'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 554
      FloatTop = 363
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbSet'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'stName'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Up_Down'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object stName: TdxBarStatic
      Caption = #1043#1088#1091#1087#1087#1072
      Category = 0
      Hint = #1043#1088#1091#1087#1087#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      Visible = ivAlways
      BorderStyle = sbsEtched
      Left = 792
      Top = 160
    end
    object bbSet: TdxBarButton
      Action = aSet
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 88
    Top = 104
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clGradientActiveCaption
    end
  end
  object odsGroups: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FK_OWNER, FN_ORDER'
      '  FROM TSMID TS '
      'WHERE FK_OWNER = GET_RG_GROUP '
      '  AND FL_SHOWPRINT = 1'
      '  AND FL_DEL = 0'
      '  AND (SELECT COUNT(*) FROM TSMID, TNAZVRACH'
      '        WHERE FK_DEFAULT = TS.FK_ID'
      '          AND FK_KABINETID = :PFK_KABINET'
      '          AND TSMID.FK_ID = TNAZVRACH.FK_SMID'
      '          AND FL_DEL = 0'
      '          AND FL_SHOWPRINT = 1'
      '          AND FK_SOTRID = :PFK_SOTRID) > 0'
      ''
      'ORDER BY FN_ORDER '
      ''
      ''
      ''
      '/*SELECT FK_ID, FC_NAME, FK_OWNER, FN_ORDER'
      '  FROM TSMID '
      'WHERE FK_OWNER = GET_RG_GROUP '
      '  AND FL_SHOWPRINT = 1'
      '  AND FL_DEL = 0'
      '  AND (SELECT COUNT(*)'
      '  FROM TNAZVRACH, TSMID TS '
      ' WHERE FK_KABINETID = :PFK_KABINET'
      
        '   AND (SELECT FK_DEFAULT FROM TSMID WHERE FK_ID = TNAZVRACH.FK_' +
        'SMID) = TSMID.FK_ID'
      '   AND TNAZVRACH.FK_SMID = TS.FK_ID'
      '   AND TS.FL_DEL = 0 ) > 0'
      ''
      'ORDER BY FN_ORDER */'
      '')
    Optimize = False
    Variables.Data = {
      03000000020000000C0000003A50464B5F4B4142494E45540300000000000000
      000000000B0000003A50464B5F534F54524944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464B5F4F574E455201000000000008000000464E
      5F4F52444552010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsGroupsBeforeOpen
    AfterScroll = odsGroupsAfterScroll
    Left = 88
    Top = 157
  end
  object dsGroups: TDataSource
    DataSet = odsGroups
    Left = 88
    Top = 205
  end
  object pmGroup: TPopupMenu
    Images = frmMain.ilMain
    Left = 104
    Top = 320
    object N1: TMenuItem
      Action = aPrintGroup
    end
    object N2: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 5
      object N3: TMenuItem
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
  end
  object sdPopUp: TSaveDialog
    Left = 105
    Top = 379
  end
  object pmMetodic: TPopupMenu
    Images = frmMain.ilMain
    Left = 541
    Top = 296
    object N4: TMenuItem
      Action = aPrintMet
    end
    object N5: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 5
      object N6: TMenuItem
        Action = aTextMet
      end
      object Web2: TMenuItem
        Action = aWebMet
      end
      object XML2: TMenuItem
        Action = aXMLMet
      end
      object Excel2: TMenuItem
        Action = aXLSMet
      end
    end
  end
  object frxRepGroup: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39654.605826817090000000
    ReportOptions.LastChange = 40042.397804594900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepGroupGetValue
    Left = 176
    Top = 200
    Datasets = <
      item
        DataSet = frxDBGroup
        DataSetName = 'frxDBGroup'
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
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 748.346940000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Width = 740.787880000000000000
          Height = 34.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
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
          Top = 41.574830000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8220#1057#1026#1057#1107#1056#1111#1056#1111#1057#8249' '#1057#1026#1056#181#1056#1029#1057#8218#1056#1110#1056#181#1056#1029#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#8470)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 67.708720000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
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
        object Memo7: TfrxMemoView
          Left = 52.913420000000000000
          Top = 67.708720000000000000
          Width = 449.764070000000000000
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
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111#1057#8249)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 650.079160000000000000
          Top = 41.574830000000000000
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
            '[SYSDATE]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 166.299320000000000000
        Width = 748.346940000000000000
        DataSet = frxDBGroup
        DataSetName = 'frxDBGroup'
        KeepTogether = True
        RowCount = 0
        Stretched = True
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 52.913420000000000000
          Width = 449.764070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBGroup."FC_NAME"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 245.669450000000000000
        Width = 748.346940000000000000
        object Memo9: TfrxMemoView
          Left = 3.779530000000000000
          Width = 740.787880000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.TopLine.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
      end
    end
  end
  object frxRepMetodic: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39654.605826817090000000
    ReportOptions.LastChange = 40042.398119027780000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepMetodicGetValue
    Left = 392
    Top = 200
    Datasets = <
      item
        DataSet = frxDBMetodic
        DataSetName = 'frxDBDataset1'
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
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 748.346940000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Width = 740.787880000000000000
          Height = 34.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
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
          Top = 41.574830000000000000
          Width = 374.173470000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1038#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' '#1056#1112#1056#181#1057#8218#1056#1109#1056#1169#1056#1105#1056#1108'. '#1056#8220#1057#1026#1057#1107#1056#1111#1056#1111#1056#176': [GROUPNAME]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 67.708720000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
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
        object Memo7: TfrxMemoView
          Left = 52.913420000000000000
          Top = 67.708720000000000000
          Width = 691.653990000000000000
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
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1112#1056#181#1057#8218#1056#1109#1056#1169#1056#1105#1056#1108#1056#1105)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 650.079160000000000000
          Top = 41.574830000000000000
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
            '[SYSDATE]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 166.299320000000000000
        Width = 748.346940000000000000
        DataSet = frxDBMetodic
        DataSetName = 'frxDBDataset1'
        KeepTogether = True
        RowCount = 0
        Stretched = True
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 52.913420000000000000
          Width = 691.653990000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."FC_NAME"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 245.669450000000000000
        Width = 748.346940000000000000
        object Memo9: TfrxMemoView
          Left = 3.779530000000000000
          Width = 740.787880000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.TopLine.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBGroup: TfrxDBDataset
    UserName = 'frxDBGroup'
    CloseDataSource = False
    DataSource = dsGroups
    BCDToCurrency = False
    Left = 176
    Top = 256
  end
  object frxDBMetodic: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = odsChild
    BCDToCurrency = False
    Left = 392
    Top = 256
  end
  object pmFIO: TPopupMenu
    Left = 629
    Top = 220
    object N7: TMenuItem
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
      OnClick = N7Click
    end
  end
end
