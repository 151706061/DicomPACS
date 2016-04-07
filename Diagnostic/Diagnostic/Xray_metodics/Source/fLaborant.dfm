object frmLaborant: TfrmLaborant
  Left = 392
  Top = 87
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1051#1072#1073#1086#1088#1072#1085#1090#1099'('#1082#1090#1086' '#1079#1072#1087#1086#1083#1085#1103#1083' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077')'
  ClientHeight = 464
  ClientWidth = 362
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
    Width = 356
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 362
  end
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 356
    Height = 427
    Margins.Top = 0
    Align = alClient
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
    ExplicitLeft = 0
    ExplicitTop = 30
    ExplicitWidth = 362
    ExplicitHeight = 434
    object TV: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsLab
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VDATE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103
        DataBinding.FieldName = 'FD_DATE'
        Width = 86
      end
      object VLABORANT: TcxGridDBColumn
        Caption = #1060#1048#1054' '#1083#1072#1073#1086#1088#1072#1085#1090#1072
        DataBinding.FieldName = 'LABNAME'
        Width = 262
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = TV
    end
  end
  object BM: TdxBarManager
    AllowReset = False
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
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 288
    Top = 80
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
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' 1'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 168
      FloatTop = 66
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
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
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 360
    Top = 88
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 0
      ShortCut = 27
      OnExecute = aCloseExecute
    end
  end
  object dsLab: TDataSource
    DataSet = odsLab
    Left = 136
    Top = 160
  end
  object odsLab: TOracleDataSet
    SQL.Strings = (
      'SELECT FD_DATE, '
      '       ASU.DO_VRACHFIO(FK_SOTRID) AS LABNAME'
      '  FROM ASU.TPODPISNAZ'
      ' WHERE FK_NAZID = :PFK_NAZID'
      '   AND FK_SOS = ASU.GET_LABVIP'
      'ORDER BY FD_DATE DESC')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464B5F4E415A494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000046445F44415445010000000000070000004C4142
      4E414D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsLabBeforeOpen
    Left = 136
    Top = 208
  end
end
