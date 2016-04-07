object frmSetUsl: TfrmSetUsl
  Left = 447
  Top = 93
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1091#1089#1083#1091#1075#1080
  ClientHeight = 512
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 412
    Height = 28
    Align = dalTop
    BarManager = dxBM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object grList: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 78
    Width = 412
    Height = 431
    Margins.Top = 0
    Align = alClient
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
    ExplicitLeft = -2
    ExplicitTop = 74
    ExplicitHeight = 435
    object tvList: TcxGridDBTableView
      OnDblClick = tvListDblClick
      OnKeyDown = tvListKeyDown
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'FK_ID'
          Column = VNAME
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
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VNAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Width = 172
      end
    end
    object grListLevel1: TcxGridLevel
      GridView = tvList
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 412
    Height = 41
    Margins.Top = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 6
    ExplicitLeft = 0
    ExplicitTop = 30
    ExplicitWidth = 418
    object teFilter: TcxTextEdit
      Left = 148
      Top = 10
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 119
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      OnClick = teFilterClick
      OnEnter = teFilterEnter
      OnKeyUp = teFilterKeyUp
      Width = 257
    end
    object cxLabel1: TcxLabel
      Left = 7
      Top = 11
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102
      Transparent = True
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
    ImageOptions.Images = frmMain.ILMain
    LookAndFeel.Kind = lfFlat
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 208
    Top = 200
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
  object al: TActionList
    Images = frmMain.ILMain
    Left = 208
    Top = 152
    object actSet: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      ImageIndex = 3
      ShortCut = 113
      OnExecute = actSetExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 4
      ShortCut = 27
      OnExecute = actCancelExecute
    end
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name, upper(fc_name) as fc_name_up'
      ' from asu.tsmid '
      ' where fl_showanal = 1'
      'start with fc_synonim = '#39'PROC_FIZTER'#39
      'connect by prior fk_id = fk_owner'
      'order by fc_name'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000600000046435F4641
      4D0100000000000700000046435F4E414D45010000000000080000004E414D45
      5350454301000000000006000000464C5F44454C010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 72
    Top = 200
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 112
    Top = 200
  end
end
