object frmSetSotr: TfrmSetSotr
  Left = 403
  Top = 93
  BorderIcons = [biMinimize]
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
  ClientHeight = 464
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 330
    Height = 28
    Align = dalTop
    BarManager = dxBM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object cxGrZavOtdel: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 330
    Height = 427
    Margins.Top = 0
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    ExplicitLeft = 0
    ExplicitTop = 28
    ExplicitWidth = 336
    ExplicitHeight = 436
    object TVACCESS: TcxGridDBTableView
      OnKeyDown = TVACCESSKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = TVACCESSCellDblClick
      DataController.DataSource = dsSotr
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'FK_ID'
          Column = VFIO
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VFIO: TcxGridDBColumn
        Caption = #1060#1048#1054' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
        DataBinding.FieldName = 'FC_NAME'
      end
    end
    object cxGrZavOtdelLevel1: TcxGridLevel
      GridView = TVACCESS
    end
  end
  object actlst1: TActionList
    Images = frmMain.ilMain
    Left = 128
    Top = 80
    object actSet: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 2
      ShortCut = 113
      OnExecute = actSetExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 1
      ShortCut = 27
      OnExecute = actCancelExecute
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
    Left = 128
    Top = 128
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
      Caption = 'OKCancel'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 396
      FloatTop = 96
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbOk'
        end
        item
          Visible = True
          ItemName = 'bbCancel'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbOk: TdxBarButton
      Action = actSet
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbCancel: TdxBarButton
      Action = actCancel
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object odsSotr: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_FAM, FC_FAM || '#39' '#39' || '
      
        '       DECODE(VarcharIsNUll(FC_NAME), 1, '#39#39', SUBSTR(FC_NAME, 0, ' +
        '1) || '#39'. '#39' || '
      
        '       DECODE (VarcharIsNUll(FC_OTCH), 1, '#39#39', SUBSTR(FC_OTCH, 0,' +
        ' 1) || '#39'. '#39')) AS FC_NAME'
      ' FROM ASU.TSOTR '
      ' WHERE FK_OTDELID = :PFK_OTDELID '
      '   AND FL_DEL = 0'
      
        '   AND NOT EXISTS (SELECT 1 FROM ASU.TSMINI WHERE FC_SECTION = '#39 +
        'XRAY'#39' AND FC_KEY = '#39#1055#1056#1040#1042#1040'_'#1040#1044#1052#1048#1053#1048#1057#1058#1056#1040#1058#1054#1056#1040'_'#39'||TO_CHAR(TSOTR.FK_ID)' +
        ')'
      ''
      'ORDER BY FC_FAM')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A50464B5F4F5444454C49440300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000600000046435F4641
      4D0100000000000700000046435F4E414D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.osMain
    BeforeOpen = odsSotrBeforeOpen
    Left = 48
    Top = 200
  end
  object dsSotr: TDataSource
    DataSet = odsSotr
    Left = 112
    Top = 200
  end
end
