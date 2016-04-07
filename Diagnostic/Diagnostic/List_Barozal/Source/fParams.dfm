object frmParams: TfrmParams
  Left = 352
  Top = 100
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 493
  ClientWidth = 645
  Color = clCream
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
  object tvTree: TcxTreeView
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 105
    Height = 487
    Align = alLeft
    ParentShowHint = False
    ShowHint = True
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.SkinName = 'Black'
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.SkinName = 'Black'
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.SkinName = 'Black'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.SkinName = 'Black'
    TabOrder = 0
    Items.NodeData = {
      010200000029000000000000000000000000000000FFFFFFFF00000000000000
      00081E0441043D043E0432043D043E0435042F00000000000000010000000100
      0000FFFFFFFF00000000000000000B21043F044004300432043E0447043D0438
      043A043804}
    RowSelect = True
    OnChange = tvTreeChange
    ExplicitLeft = -2
    ExplicitTop = -3
    ExplicitHeight = 473
  end
  object pcParam: TcxPageControl
    AlignWithMargins = True
    Left = 114
    Top = 3
    Width = 528
    Height = 487
    ActivePage = cxTabSheet2
    Align = alClient
    HideTabs = True
    LookAndFeel.SkinName = 'Caramel'
    TabOrder = 1
    ExplicitLeft = 120
    ExplicitTop = 192
    ExplicitWidth = 289
    ExplicitHeight = 193
    ClientRectBottom = 486
    ClientRectLeft = 1
    ClientRectRight = 527
    ClientRectTop = 1
    object cxTabSheet1: TcxTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1086#1077
      ImageIndex = 0
      object lbCap: TcxLabel
        Left = 16
        Top = 16
        Caption = #1055#1077#1088#1080#1086#1076' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1078#1091#1088#1085#1072#1083#1072
        Style.TextColor = clTeal
        Style.TextStyle = [fsBold]
      end
      object cxLabel1: TcxLabel
        Left = 32
        Top = 39
        Caption = #1085#1072#1095#1080#1085#1072#1103' '#1089' '#1095#1080#1089#1083#1072' :'
        Style.TextColor = clTeal
        Style.TextStyle = [fsBold]
      end
      object cxLabel2: TcxLabel
        Left = 32
        Top = 64
        Caption = #1079#1072#1082#1072#1085#1095#1080#1074#1072#1103' '#1095#1080#1089#1083#1086#1084' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072' :'
        Style.TextColor = clTeal
        Style.TextStyle = [fsBold]
      end
      object seNum1: TcxSpinEdit
        Left = 286
        Top = 39
        Properties.CanEdit = False
        Properties.ImmediatePost = True
        Properties.MaxValue = 31.000000000000000000
        Properties.OnChange = seNum1PropertiesChange
        Style.LookAndFeel.SkinName = 'Coffee'
        StyleDisabled.LookAndFeel.SkinName = 'Coffee'
        StyleFocused.LookAndFeel.SkinName = 'Coffee'
        StyleHot.LookAndFeel.SkinName = 'Coffee'
        TabOrder = 3
        Width = 67
      end
      object seNum2: TcxSpinEdit
        Left = 286
        Top = 64
        Properties.CanEdit = False
        Properties.ImmediatePost = True
        Properties.MaxValue = 31.000000000000000000
        Properties.OnChange = seNum2PropertiesChange
        Style.LookAndFeel.SkinName = 'Coffee'
        StyleDisabled.LookAndFeel.SkinName = 'Coffee'
        StyleFocused.LookAndFeel.SkinName = 'Coffee'
        StyleHot.LookAndFeel.SkinName = 'Coffee'
        TabOrder = 4
        Width = 67
      end
      object bSave: TcxButton
        Left = 366
        Top = 457
        Width = 75
        Height = 25
        Action = aSave
        TabOrder = 5
        LookAndFeel.SkinName = 'Caramel'
      end
      object cxButton2: TcxButton
        Left = 452
        Top = 457
        Width = 75
        Height = 25
        Action = aClose
        TabOrder = 6
        LookAndFeel.SkinName = 'Caramel'
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      ImageIndex = 1
      ExplicitLeft = 3
      ExplicitTop = 27
      ExplicitWidth = 742
      ExplicitHeight = 434
      object pcSprav: TcxPageControl
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 523
        Height = 479
        Margins.Left = 0
        ActivePage = cxTabSheet7
        Align = alClient
        LookAndFeel.SkinName = 'Office2007Green'
        Style = 11
        TabOrder = 0
        ExplicitLeft = 144
        ExplicitTop = 64
        ExplicitWidth = 289
        ExplicitHeight = 193
        ClientRectBottom = 473
        ClientRectLeft = 3
        ClientRectRight = 517
        ClientRectTop = 26
        object cxTabSheet3: TcxTabSheet
          Caption = #1041#1072#1088#1086#1082#1072#1084#1077#1088#1099
          ImageIndex = 0
          object dxBarDockControl1: TdxBarDockControl
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 508
            Height = 28
            Align = dalTop
            BarManager = BM
            SunkenBorder = True
            UseOwnSunkenBorder = True
          end
          object gr1: TcxGrid
            AlignWithMargins = True
            Left = 3
            Top = 34
            Width = 508
            Height = 410
            Margins.Top = 0
            Align = alClient
            TabOrder = 1
            LookAndFeel.Kind = lfFlat
            LookAndFeel.SkinName = ''
            object tvGr1: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsGr1
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
                  Column = tvGr1_Name
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
              object tvGr1_Name: TcxGridDBColumn
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'FC_NAME'
              end
            end
            object gr1Level1: TcxGridLevel
              GridView = tvGr1
            end
          end
        end
        object cxTabSheet4: TcxTabSheet
          Caption = #1050#1086#1084#1087#1088#1077#1089#1089#1080#1103
          ImageIndex = 1
          object dxBarDockControl2: TdxBarDockControl
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 508
            Height = 28
            Align = dalTop
            BarManager = BM
            SunkenBorder = True
            UseOwnSunkenBorder = True
          end
          object gr2: TcxGrid
            AlignWithMargins = True
            Left = 3
            Top = 34
            Width = 508
            Height = 209
            Margins.Top = 0
            Align = alTop
            TabOrder = 1
            LookAndFeel.Kind = lfFlat
            LookAndFeel.SkinName = ''
            object tvGr2: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsGr2
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
                  Column = tvGr2_Name
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
              object tvGr2_Name: TcxGridDBColumn
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'FC_NAME'
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = tvGr2
            end
          end
          object gr5: TcxGrid
            AlignWithMargins = True
            Left = 3
            Top = 280
            Width = 508
            Height = 173
            Margins.Top = 0
            Align = alTop
            TabOrder = 2
            LookAndFeel.Kind = lfFlat
            LookAndFeel.SkinName = ''
            object tvGr5: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsGr5
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
                  Column = tvGr5_Name
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
              object tvGr5_Name: TcxGridDBColumn
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'FC_NAME'
              end
            end
            object cxGridLevel4: TcxGridLevel
              GridView = tvGr5
            end
          end
          object dxBarDockControl5: TdxBarDockControl
            AlignWithMargins = True
            Left = 3
            Top = 249
            Width = 508
            Height = 28
            Align = dalTop
            BarManager = BM
            SunkenBorder = True
            UseOwnSunkenBorder = True
          end
        end
        object cxTabSheet5: TcxTabSheet
          Caption = #1048#1079#1086#1087#1088#1077#1089#1089#1080#1103
          ImageIndex = 2
          object dxBarDockControl3: TdxBarDockControl
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 508
            Height = 28
            Align = dalTop
            BarManager = BM
            SunkenBorder = True
            UseOwnSunkenBorder = True
          end
          object gr3: TcxGrid
            AlignWithMargins = True
            Left = 3
            Top = 34
            Width = 508
            Height = 201
            Margins.Top = 0
            Align = alTop
            TabOrder = 1
            LookAndFeel.Kind = lfFlat
            LookAndFeel.SkinName = ''
            object tvGr3: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsGr3
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
                  Column = tvGr3_Name
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
              object tvGr3_Name: TcxGridDBColumn
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'FC_NAME'
              end
            end
            object cxGridLevel2: TcxGridLevel
              GridView = tvGr3
            end
          end
          object gr6: TcxGrid
            AlignWithMargins = True
            Left = 3
            Top = 272
            Width = 508
            Height = 181
            Margins.Top = 0
            Align = alTop
            TabOrder = 2
            LookAndFeel.Kind = lfFlat
            LookAndFeel.SkinName = ''
            object tvGr6: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsGr6
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
                  Column = cxGridDBColumn2
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
              object cxGridDBColumn2: TcxGridDBColumn
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'FC_NAME'
              end
            end
            object cxGridLevel5: TcxGridLevel
              GridView = tvGr6
            end
          end
          object dxBarDockControl6: TdxBarDockControl
            AlignWithMargins = True
            Left = 3
            Top = 241
            Width = 508
            Height = 28
            Align = dalTop
            BarManager = BM
            SunkenBorder = True
            UseOwnSunkenBorder = True
          end
        end
        object cxTabSheet6: TcxTabSheet
          Caption = #1044#1077#1082#1086#1084#1087#1088#1077#1089#1089#1080#1103
          ImageIndex = 3
          object dxBarDockControl4: TdxBarDockControl
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 508
            Height = 28
            Align = dalTop
            BarManager = BM
            SunkenBorder = True
            UseOwnSunkenBorder = True
          end
          object gr4: TcxGrid
            AlignWithMargins = True
            Left = 3
            Top = 34
            Width = 508
            Height = 201
            Margins.Top = 0
            Align = alTop
            TabOrder = 1
            LookAndFeel.Kind = lfFlat
            LookAndFeel.SkinName = ''
            object tvGr4: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsGr4
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
                  Column = tvGr4_Name
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
              object tvGr4_Name: TcxGridDBColumn
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'FC_NAME'
              end
            end
            object cxGridLevel3: TcxGridLevel
              GridView = tvGr4
            end
          end
          object gr7: TcxGrid
            AlignWithMargins = True
            Left = 3
            Top = 272
            Width = 508
            Height = 181
            Margins.Top = 0
            Align = alTop
            TabOrder = 2
            LookAndFeel.Kind = lfFlat
            LookAndFeel.SkinName = ''
            object tvGr7: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsGr7
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
                  Column = cxGridDBColumn3
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
              object cxGridDBColumn3: TcxGridDBColumn
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'FC_NAME'
              end
            end
            object cxGridLevel6: TcxGridLevel
              GridView = tvGr7
            end
          end
          object dxBarDockControl7: TdxBarDockControl
            AlignWithMargins = True
            Left = 3
            Top = 241
            Width = 508
            Height = 28
            Align = dalTop
            BarManager = BM
            SunkenBorder = True
            UseOwnSunkenBorder = True
          end
        end
        object cxTabSheet7: TcxTabSheet
          Caption = #1044#1072#1074#1083#1077#1085#1080#1077
          ImageIndex = 4
          object dxBarDockControl8: TdxBarDockControl
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 508
            Height = 28
            Align = dalTop
            BarManager = BM
            SunkenBorder = True
            UseOwnSunkenBorder = True
          end
          object gr8: TcxGrid
            AlignWithMargins = True
            Left = 3
            Top = 34
            Width = 508
            Height = 410
            Margins.Top = 0
            Align = alClient
            TabOrder = 1
            LookAndFeel.Kind = lfFlat
            LookAndFeel.SkinName = ''
            object tvGr8: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsGr8
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
                  Column = cxGridDBColumn1
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
              object cxGridDBColumn1: TcxGridDBColumn
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'FC_NAME'
              end
            end
            object cxGridLevel7: TcxGridLevel
              GridView = tvGr8
            end
          end
        end
      end
    end
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
    ImageOptions.Images = frmMain.IL
    LookAndFeel.Kind = lfFlat
    LookAndFeel.SkinName = ''
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 157
    Top = 188
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
      Caption = '1'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 202
      FloatTop = 104
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbAdd1'
        end
        item
          Visible = True
          ItemName = 'bbEdit1'
        end
        item
          Visible = True
          ItemName = 'bbDel1'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefresh1'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BMBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = '2'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 202
      FloatTop = 104
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cxBarEditItem1'
        end
        item
          Visible = True
          ItemName = 'bbAdd2'
        end
        item
          Visible = True
          ItemName = 'bbEdit2'
        end
        item
          Visible = True
          ItemName = 'bbDel2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefresh2'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BMBar3: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = '3'
      CaptionButtons = <>
      DockControl = dxBarDockControl3
      DockedDockControl = dxBarDockControl3
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 202
      FloatTop = 104
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cxBarEditItem2'
        end
        item
          Visible = True
          ItemName = 'bbAdd3'
        end
        item
          Visible = True
          ItemName = 'bbEdit3'
        end
        item
          Visible = True
          ItemName = 'bbDel3'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefresh3'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BMBar4: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = '4'
      CaptionButtons = <>
      DockControl = dxBarDockControl4
      DockedDockControl = dxBarDockControl4
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 202
      FloatTop = 104
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cxBarEditItem3'
        end
        item
          Visible = True
          ItemName = 'bbAdd4'
        end
        item
          Visible = True
          ItemName = 'bbEdit4'
        end
        item
          Visible = True
          ItemName = 'bbDel4'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefresh4'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BMBar5: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'CTime'
      CaptionButtons = <>
      DockControl = dxBarDockControl5
      DockedDockControl = dxBarDockControl5
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 302
      FloatTop = 100
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cxBarEditItem4'
        end
        item
          Visible = True
          ItemName = 'bbAdd5'
        end
        item
          Visible = True
          ItemName = 'bbEdit5'
        end
        item
          Visible = True
          ItemName = 'bbDel5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefresh5'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BMBar6: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'ITime'
      CaptionButtons = <>
      DockControl = dxBarDockControl6
      DockedDockControl = dxBarDockControl6
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1294
      FloatTop = 10
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cxBarEditItem5'
        end
        item
          Visible = True
          ItemName = 'bbAdd6'
        end
        item
          Visible = True
          ItemName = 'bbEdit6'
        end
        item
          Visible = True
          ItemName = 'bbDel6'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefresh6'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BMBar7: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'DTime'
      CaptionButtons = <>
      DockControl = dxBarDockControl7
      DockedDockControl = dxBarDockControl7
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1294
      FloatTop = 10
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cxBarEditItem6'
        end
        item
          Visible = True
          ItemName = 'bbAdd7'
        end
        item
          Visible = True
          ItemName = 'bbEdit7'
        end
        item
          Visible = True
          ItemName = 'bbDel7'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefresh7'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BMBar8: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Pressure'
      CaptionButtons = <>
      DockControl = dxBarDockControl8
      DockedDockControl = dxBarDockControl8
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 302
      FloatTop = 100
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton4'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbAdd1: TdxBarButton
      Action = aAdd1
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEdit1: TdxBarButton
      Action = aEdit1
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefresh1: TdxBarButton
      Action = aRefresh1
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDel1: TdxBarButton
      Action = aDel1
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbAdd2: TdxBarButton
      Action = aAdd2
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEdit2: TdxBarButton
      Action = aEdit2
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDel2: TdxBarButton
      Action = aDel2
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefresh2: TdxBarButton
      Action = aRefresh2
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbAdd3: TdxBarButton
      Action = aAdd3
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEdit3: TdxBarButton
      Action = aEdit3
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDel3: TdxBarButton
      Action = aDel3
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefresh3: TdxBarButton
      Action = aRefresh3
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbAdd4: TdxBarButton
      Action = aAdd4
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEdit4: TdxBarButton
      Action = aEdit4
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDel4: TdxBarButton
      Action = aDel4
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefresh4: TdxBarButton
      Action = aRefresh4
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object cxBarEditItem1: TcxBarEditItem
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100
      Category = 0
      Hint = #1057#1082#1086#1088#1086#1089#1090#1100
      Style = stBold
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
      StyleEdit = stBold
    end
    object cxBarEditItem2: TcxBarEditItem
      Caption = #1044#1072#1074#1083#1077#1085#1080#1077
      Category = 0
      Hint = #1044#1072#1074#1083#1077#1085#1080#1077
      Style = stBold
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
      StyleEdit = stBold
    end
    object cxBarEditItem3: TcxBarEditItem
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100
      Category = 0
      Hint = #1057#1082#1086#1088#1086#1089#1090#1100
      Style = stBold
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
      StyleEdit = stBold
    end
    object cxBarEditItem4: TcxBarEditItem
      Caption = #1042#1088#1077#1084#1103
      Category = 0
      Hint = #1042#1088#1077#1084#1103
      Style = stBold
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
      StyleEdit = stBold
    end
    object bbAdd5: TdxBarButton
      Action = aAdd5
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEdit5: TdxBarButton
      Action = aEdit5
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDel5: TdxBarButton
      Action = aDel5
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefresh5: TdxBarButton
      Action = aRefresh5
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object cxBarEditItem5: TcxBarEditItem
      Caption = #1042#1088#1077#1084#1103
      Category = 0
      Hint = #1042#1088#1077#1084#1103
      Style = stBold
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
      StyleEdit = stBold
    end
    object bbAdd6: TdxBarButton
      Action = aAdd6
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEdit6: TdxBarButton
      Action = aEdit6
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDel6: TdxBarButton
      Action = aDel6
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefresh6: TdxBarButton
      Action = aRefresh6
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object cxBarEditItem6: TcxBarEditItem
      Caption = #1042#1088#1077#1084#1103
      Category = 0
      Hint = #1042#1088#1077#1084#1103
      Style = stBold
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
      StyleEdit = stBold
    end
    object bbAdd7: TdxBarButton
      Action = aAdd7
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEdit7: TdxBarButton
      Action = aEdit7
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDel7: TdxBarButton
      Action = aDel7
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefresh7: TdxBarButton
      Action = aRefresh7
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton1: TdxBarButton
      Action = aAdd8
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton2: TdxBarButton
      Action = aEdit8
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton3: TdxBarButton
      Action = aDel8
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton4: TdxBarButton
      Action = aRefresh8
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object al: TActionList
    Images = frmMain.IL
    Left = 157
    Top = 244
    object aAdd1: TAction
      Category = '1'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      OnExecute = aAdd1Execute
    end
    object aEdit1: TAction
      Category = '1'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 6
      OnExecute = aEdit1Execute
    end
    object aDel1: TAction
      Category = '1'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = aDel1Execute
    end
    object aRefresh1: TAction
      Category = '1'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      OnExecute = aRefresh1Execute
    end
    object aAdd2: TAction
      Category = '2'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      OnExecute = aAdd2Execute
    end
    object aEdit2: TAction
      Category = '2'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 6
      OnExecute = aEdit2Execute
    end
    object aDel2: TAction
      Category = '2'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = aDel2Execute
    end
    object aRefresh2: TAction
      Category = '2'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      OnExecute = aRefresh2Execute
    end
    object aAdd3: TAction
      Category = '3'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      OnExecute = aAdd3Execute
    end
    object aEdit3: TAction
      Category = '3'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 6
      OnExecute = aEdit3Execute
    end
    object aDel3: TAction
      Category = '3'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = aDel3Execute
    end
    object aRefresh3: TAction
      Category = '3'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      OnExecute = aRefresh3Execute
    end
    object aAdd4: TAction
      Category = '4'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      OnExecute = aAdd4Execute
    end
    object aEdit4: TAction
      Category = '4'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 6
      OnExecute = aEdit4Execute
    end
    object aDel4: TAction
      Category = '4'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = aDel4Execute
    end
    object aRefresh4: TAction
      Category = '4'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      OnExecute = aRefresh4Execute
    end
    object aAdd5: TAction
      Category = '5'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      OnExecute = aAdd5Execute
    end
    object aEdit5: TAction
      Category = '5'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 6
      OnExecute = aEdit5Execute
    end
    object aDel5: TAction
      Category = '5'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = aDel5Execute
    end
    object aRefresh5: TAction
      Category = '5'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      OnExecute = aRefresh5Execute
    end
    object aAdd6: TAction
      Category = '6'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      OnExecute = aAdd6Execute
    end
    object aEdit6: TAction
      Category = '6'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 6
      OnExecute = aEdit6Execute
    end
    object aDel6: TAction
      Category = '6'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = aDel6Execute
    end
    object aRefresh6: TAction
      Category = '6'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      OnExecute = aRefresh6Execute
    end
    object aAdd7: TAction
      Category = '7'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      OnExecute = aAdd7Execute
    end
    object aEdit7: TAction
      Category = '7'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 6
      OnExecute = aEdit7Execute
    end
    object aDel7: TAction
      Category = '7'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = aDel7Execute
    end
    object aRefresh7: TAction
      Category = '7'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      OnExecute = aRefresh7Execute
    end
    object aSave: TAction
      Category = 'Buttons'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnExecute = aSaveExecute
    end
    object aClose: TAction
      Category = 'Buttons'
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aAdd8: TAction
      Category = '8'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      OnExecute = aAdd8Execute
    end
    object aEdit8: TAction
      Category = '8'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 6
      OnExecute = aEdit8Execute
    end
    object aDel8: TAction
      Category = '8'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = aDel8Execute
    end
    object aRefresh8: TAction
      Category = '8'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      OnExecute = aRefresh8Execute
    end
  end
  object odsGr1: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      '   and fl_del = 0'
      'start with fc_synonim = '#39'BAROZAL_NUMCAMERS'#39
      'connect by prior fk_id = fk_owner ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 56
    Top = 79
  end
  object dsGr1: TDataSource
    DataSet = odsGr1
    Left = 24
    Top = 79
  end
  object odsGr2: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      '   and fl_del = 0'
      'start with fc_synonim = '#39'BAROZAL_COMPR_SPEED'#39
      'connect by prior fk_id = fk_owner ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 56
    Top = 127
  end
  object dsGr2: TDataSource
    DataSet = odsGr2
    Left = 24
    Top = 127
  end
  object odsGr3: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      '   and fl_del = 0'
      'start with fc_synonim = '#39'BAROZAL_IZO_PRESSURE'#39
      'connect by prior fk_id = fk_owner ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 56
    Top = 175
  end
  object dsGr3: TDataSource
    DataSet = odsGr3
    Left = 24
    Top = 175
  end
  object odsGr4: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      '   and fl_del = 0'
      'start with fc_synonim = '#39'BAROZAL_DECOMPR_SPEED'#39
      'connect by prior fk_id = fk_owner ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 56
    Top = 223
  end
  object dsGr4: TDataSource
    DataSet = odsGr4
    Left = 24
    Top = 223
  end
  object stRep: TcxStyleRepository
    Left = 160
    Top = 295
    PixelsPerInch = 96
    object stBold: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
    end
  end
  object dsGr5: TDataSource
    DataSet = odsGr5
    Left = 24
    Top = 271
  end
  object odsGr5: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      '   and fl_del = 0'
      'start with fc_synonim = '#39'BAROZAL_COMPR_TIME'#39
      'connect by prior fk_id = fk_owner ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 56
    Top = 271
  end
  object dsGr6: TDataSource
    DataSet = odsGr6
    Left = 24
    Top = 319
  end
  object odsGr6: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      '   and fl_del = 0'
      'start with fc_synonim = '#39'BAROZAL_IZO_TIME'#39
      'connect by prior fk_id = fk_owner ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 56
    Top = 319
  end
  object dsGr7: TDataSource
    DataSet = odsGr7
    Left = 24
    Top = 367
  end
  object odsGr7: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      '   and fl_del = 0'
      'start with fc_synonim = '#39'BAROZAL_DECOMPR_TIME'#39
      'connect by prior fk_id = fk_owner ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 56
    Top = 367
  end
  object dsGr8: TDataSource
    DataSet = odsGr8
    Left = 24
    Top = 415
  end
  object odsGr8: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      '   and fl_del = 0'
      'start with fc_synonim = '#39'BAROZAL_PRESSURE'#39
      'connect by prior fk_id = fk_owner ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 56
    Top = 415
  end
end
