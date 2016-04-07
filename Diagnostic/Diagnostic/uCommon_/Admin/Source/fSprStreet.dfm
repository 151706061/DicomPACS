object frmSprStreet: TfrmSprStreet
  Left = 218
  Top = 55
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1091#1083#1080#1094
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
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 856
    Height = 26
    Align = dalTop
    BarManager = BM
    SunkenBorder = False
    UseOwnSunkenBorder = True
  end
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
    TabOrder = 5
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
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VLIST_NAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Width = 723
      end
      object VLIST_SHORT: TcxGridDBColumn
        Caption = #1050#1086#1088#1086#1090#1082#1086
        DataBinding.FieldName = 'FC_SHORT_NAME'
      end
      object VLIST_PREF: TcxGridDBColumn
        Caption = #1055#1088#1077#1092#1080#1082#1089
        DataBinding.FieldName = 'FC_PREFFIX'
        Width = 119
      end
      object VLISTColumn1: TcxGridDBColumn
        Caption = #1057#1087#1080#1089#1086#1082' '#1086#1090#1082#1091#1076#1072
        DataBinding.FieldName = 'FL_SHOWINFROMWHERE'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
      end
    end
    object grListLevel1: TcxGridLevel
      GridView = TVLIST
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
    Left = 560
    Top = 120
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
      Caption = 'Street'
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
          BeginGroup = True
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
    object bbRefresh: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDel: TdxBarButton
      Action = aDel
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbAdd: TdxBarButton
      Action = aAdd
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      
        'select fk_id, fc_name, fc_preffix, fc_short_name, fl_showinfromw' +
        'here'
      '  from taxi.tstreet'
      '  where fl_del = 0'
      'order by fc_name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F505245464649580100000000000D000000
      46435F53484F52545F4E414D4501000000000012000000464C5F53484F57494E
      46524F4D5748455245010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsListAfterOpen
    Left = 288
    Top = 200
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 288
    Top = 152
  end
  object AL: TActionList
    Images = frmMain.IL
    Left = 432
    Top = 240
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1083#1080#1094#1099
      ImageIndex = 0
      ShortCut = 114
      OnExecute = aEditExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1091#1083#1080#1094
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1091#1083#1080#1094
      ImageIndex = 5
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aXLS: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1089#1087#1080#1089#1082#1072' '#1074' Excel'
      ImageIndex = 6
      OnExecute = aXLSExecute
    end
    object aDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      ImageIndex = 1
      ShortCut = 119
      OnExecute = aDelExecute
    end
    object aAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1083#1080#1094#1091
      ImageIndex = 4
      ShortCut = 115
      OnExecute = aAddExecute
    end
  end
  object pmTV: TPopupMenu
    Images = frmMain.IL
    Left = 624
    Top = 202
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
  object oqDel: TOracleQuery
    SQL.Strings = (
      'update taxi.tstreet set fl_del = 1 where fk_id = :pfk_id')
    Session = frmMain.os
    Optimize = False
    Variables.Data = {0300000001000000070000003A50464B5F4944030000000000000000000000}
    Cursor = crSQLWait
    Left = 336
    Top = 200
  end
  object qInsert: TOracleQuery
    SQL.Strings = (
      'begin '
      '   insert into taxi.tstreet '
      
        #9'(fc_name, fc_preffix, fl_del, fc_short_name, fl_showinfromwhere' +
        ')'
      '   values'
      
        '       (:pfc_name, :pfc_preffix, 0, :pfc_short_name, :pfl_showin' +
        'fromwhere) returning fk_id into :pfk_id; '
      'end;')
    Session = frmMain.os
    Optimize = False
    Variables.Data = {
      0300000005000000070000003A50464B5F494403000000040000007509000000
      000000090000003A5046435F4E414D450500000000000000000000000C000000
      3A5046435F505245464649580500000000000000000000000F0000003A504643
      5F53484F52545F4E414D45050000000000000000000000140000003A50464C5F
      53484F57494E46524F4D5748455245030000000000000000000000}
    Cursor = crSQLWait
    Left = 368
    Top = 200
  end
  object qUpdate: TOracleQuery
    SQL.Strings = (
      'update taxi.tstreet '
      
        'set fc_name = :pfc_name, fc_short_name = :pfc_short_name, FC_PRE' +
        'FFIX = :pFC_PREFFIX, FL_SHOWINFROMWHERE = :pFL_SHOWINFROMWHERE'
      'where fk_id = :pfk_id')
    Session = frmMain.os
    Optimize = False
    Variables.Data = {
      0300000005000000070000003A50464B5F494403000000040000007509000000
      000000090000003A5046435F4E414D450500000000000000000000000C000000
      3A5046435F505245464649580500000000000000000000000F0000003A504643
      5F53484F52545F4E414D45050000000000000000000000140000003A50464C5F
      53484F57494E46524F4D5748455245030000000000000000000000}
    Cursor = crSQLWait
    Left = 400
    Top = 200
  end
end
