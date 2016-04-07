object frmSysSpr: TfrmSysSpr
  Left = 218
  Top = 55
  Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1085#1099#1081' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
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
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 856
    Height = 467
    Align = alClient
    BevelOuter = bvNone
    Color = clCream
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 241
      Height = 467
      Align = alLeft
      BevelOuter = bvNone
      Color = clCream
      ParentBackground = False
      TabOrder = 0
      object tlSpr: TcxDBTreeList
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 238
        Height = 461
        Margins.Right = 0
        Align = alClient
        Bands = <
          item
          end>
        BufferedPaint = False
        DataController.DataSource = dsTree
        DataController.ParentField = 'FK_OWNER'
        DataController.KeyField = 'FK_ID'
        LookAndFeel.SkinName = 'Caramel'
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Indicator = True
        RootValue = -1
        TabOrder = 0
        object trColName: TcxDBTreeListColumn
          Caption.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_NAME'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object Panel3: TPanel
      Left = 249
      Top = 0
      Width = 607
      Height = 467
      Align = alClient
      BevelOuter = bvNone
      Color = clCream
      ParentBackground = False
      TabOrder = 1
      object dxBarDockControl1: TdxBarDockControl
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 604
        Height = 26
        Margins.Left = 0
        Align = dalTop
        BarManager = BM
        SunkenBorder = False
        UseOwnSunkenBorder = True
      end
      object grList: TcxGrid
        AlignWithMargins = True
        Left = 0
        Top = 32
        Width = 604
        Height = 432
        Margins.Left = 0
        Margins.Top = 0
        Align = alClient
        TabOrder = 1
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
          object VLIST_NAME: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_NAME'
            Width = 347
          end
          object VLIST_SYN: TcxGridDBColumn
            Caption = #1057#1080#1085#1086#1085#1080#1084
            DataBinding.FieldName = 'FC_SYNONIM'
            Width = 238
          end
        end
        object grListLevel1: TcxGridLevel
          GridView = TVLIST
        end
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 241
      Top = 0
      Width = 8
      Height = 467
      HotZoneClassName = 'TcxXPTaskBarStyle'
      HotZone.SizePercent = 59
      Control = Panel2
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
    Left = 435
    Top = 139
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
      FloatTop = 55
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
    object bbClose: TdxBarButton
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefresh: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object AL: TActionList
    Images = frmMain.IL
    Left = 436
    Top = 187
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1089#1085#1086#1074#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1085#1099#1081' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 4
      ShortCut = 115
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 0
      ShortCut = 114
      OnExecute = aEditExecute
    end
    object aDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 1
      ShortCut = 119
      OnExecute = aDelExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 5
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aXLS: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' Excel'
      ImageIndex = 6
      OnExecute = aXLSExecute
    end
  end
  object odsTree: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name, fc_synonim, fk_owner'
      '  from taxi.tss'
      ' where level <> 1'
      '   and fl_del = 0'
      'start with fk_id = 0'
      'connect by prior fk_id = fk_owner')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F53594E4F4E494D01000000000008000000
      464B5F4F574E4552010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterScroll = odsTreeAfterScroll
    Left = 100
    Top = 195
  end
  object dsTree: TDataSource
    DataSet = odsTree
    Left = 100
    Top = 243
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select * '
      '  from taxi.tss'
      ' where fk_owner = :pfk_owner'
      '   and fl_del = 0')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464B5F4F574E455203000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F53594E4F4E494D01000000000008000000
      464B5F4F574E4552010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsListAfterOpen
    Left = 588
    Top = 139
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 588
    Top = 187
  end
  object pmTV: TPopupMenu
    Images = frmMain.IL
    Left = 352
    Top = 138
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
    Left = 353
    Top = 187
  end
end
