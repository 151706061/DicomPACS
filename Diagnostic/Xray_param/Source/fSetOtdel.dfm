object frmSetOtdel: TfrmSetOtdel
  Left = 419
  Top = 56
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1086#1090#1076#1077#1083#1077#1085#1080#1103
  ClientHeight = 473
  ClientWidth = 361
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
  object cxGrOtdel: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 355
    Height = 436
    Margins.Top = 0
    Align = alClient
    TabOrder = 4
    LookAndFeel.Kind = lfFlat
    object TVOTDEL: TcxGridDBTableView
      OnKeyDown = TVOTDELKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = TVOTDELCellDblClick
      DataController.DataSource = dsOtdel
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'FK_ID'
          Column = TVOTDELNAME
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
      object TVOTDELNAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
      end
    end
    object cxGrOtdelLevel1: TcxGridLevel
      GridView = TVOTDEL
    end
  end
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 355
    Height = 28
    Align = dalTop
    BarManager = dxBM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object actlstOkCancel: TActionList
    Images = frmMain.ilMain
    Left = 176
    Top = 152
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
    Left = 176
    Top = 104
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
      Caption = 'OkCancel'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 335
      FloatTop = 114
      FloatClientWidth = 82
      FloatClientHeight = 44
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbSet'
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
    object bbSet: TdxBarButton
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
  object odsOtdel: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM asu.TOTDEL'
      'ORDER BY FC_NAME')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000A000000464B5F4F57
      4E455249440100000000000700000046435F4E414D4501000000000006000000
      464C5F44454C010000000000}
    Session = frmMain.osMain
    Left = 152
    Top = 320
  end
  object dsOtdel: TDataSource
    DataSet = odsOtdel
    Left = 152
    Top = 272
  end
end
