object frmSetKabinet: TfrmSetKabinet
  Left = 371
  Top = 133
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1082#1072#1073#1080#1085#1077#1090#1072
  ClientHeight = 473
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grKab: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 354
    Height = 436
    Margins.Top = 0
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    ExplicitTop = 32
    ExplicitHeight = 438
    object tvKab: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsKab
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvKabColumn1: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
      end
    end
    object grKabLevel1: TcxGridLevel
      GridView = tvKab
    end
  end
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 354
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 96
    Top = 144
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1082#1072#1073#1080#1085#1077#1090
      ImageIndex = 2
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aEsc: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 1
      ShortCut = 27
      OnExecute = aEscExecute
    end
  end
  object odsKab: TOracleDataSet
    SQL.Strings = (
      'select * from asu.tkabinet'
      'order by fc_name')
    Optimize = False
    Session = frmMain.osMain
    Left = 224
    Top = 120
  end
  object dsKab: TDataSource
    DataSet = odsKab
    Left = 224
    Top = 176
  end
  object BM: TdxBarManager
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
    Left = 144
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
      Caption = 'OkCancel'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 321
      FloatTop = 133
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbOk'
        end
        item
          Visible = True
          ItemName = 'bbEsc'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbOk: TdxBarButton
      Action = aOk
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEsc: TdxBarButton
      Action = aEsc
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
end
