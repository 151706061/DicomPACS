object frmSprKeys: TfrmSprKeys
  Left = 229
  Top = 122
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1085#1086#1087#1086#1082
  ClientHeight = 371
  ClientWidth = 936
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
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
    Width = 930
    Height = 26
    Align = dalTop
    BarManager = BM
    SunkenBorder = False
    UseOwnSunkenBorder = True
  end
  object grKeys: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 32
    Width = 930
    Height = 336
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
    object tvKeys: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvKeysCellDblClick
      DataController.DataSource = dsKeys
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
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
      object tvKeysOID: TcxGridDBColumn
        DataBinding.FieldName = 'OID'
        Visible = False
        VisibleForCustomization = False
      end
      object tvKeysFC_KEY: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1089#1080#1084#1074#1086#1083#1072
        DataBinding.FieldName = 'FC_KEY'
        Width = 64
      end
      object tvKeysFL_SHIFT: TcxGridDBColumn
        Caption = 'SHIFT'
        DataBinding.FieldName = 'FL_SHIFT'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        HeaderAlignmentHorz = taCenter
        Width = 31
      end
      object tvKeysFL_ALT: TcxGridDBColumn
        Caption = 'ALT'
        DataBinding.FieldName = 'FL_ALT'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        HeaderAlignmentHorz = taCenter
        Width = 31
      end
      object tvKeysFL_CTRL: TcxGridDBColumn
        Caption = 'CTRL'
        DataBinding.FieldName = 'FL_CTRL'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        HeaderAlignmentHorz = taCenter
        Width = 31
      end
      object tvKeysFC_SYMBOL: TcxGridDBColumn
        Caption = #1057#1080#1084#1074#1086#1083' '#1082#1086#1076#1072
        DataBinding.FieldName = 'FC_SYMBOL'
        Width = 98
      end
      object tvKeysFC_SYNONYM: TcxGridDBColumn
        Caption = #1057#1080#1085#1086#1085#1080#1084
        DataBinding.FieldName = 'FC_SYNONYM'
        Width = 241
      end
      object tvKeysFC_NAME: TcxGridDBColumn
        Caption = #1044#1077#1081#1089#1090#1074#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Width = 239
      end
      object tvKeysFC_RAION: TcxGridDBColumn
        Caption = #1056#1072#1081#1086#1085
        DataBinding.FieldName = 'FC_RAION'
        Width = 181
      end
      object tvKeysFK_RAION: TcxGridDBColumn
        DataBinding.FieldName = 'FK_RAION'
        Visible = False
      end
    end
    object grKeysL: TcxGridLevel
      GridView = tvKeys
    end
  end
  object AL: TActionList
    Images = frmMain.IL
    OnUpdate = ALUpdate
    Left = 432
    Top = 240
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 0
      ShortCut = 114
      OnExecute = aEditExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1085#1086#1087#1086#1082
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 5
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 4
      ShortCut = 115
      OnExecute = aAddExecute
    end
    object aDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 1
      ShortCut = 119
      OnExecute = aDelExecute
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
    Left = 528
    Top = 144
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
      FloatTop = 51
      FloatClientWidth = 81
      FloatClientHeight = 147
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
    object bbPrint: TdxBarButton
      Caption = #1055#1077#1095#1072#1090#1100
      Category = 0
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
      Visible = ivAlways
      ImageIndex = 2
      PaintStyle = psCaptionGlyph
      ShortCut = 16464
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
    object bbDel: TdxBarButton
      Action = aDel
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefresh: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object dsKeys: TDataSource
    DataSet = odsKeys
    Left = 304
    Top = 128
  end
  object odsKeys: TOracleDataSet
    SQL.Strings = (
      'select s.oid,'
      '       s.fc_key,'
      '       s.fc_synonym,'
      '       s.fc_name,'
      '       s.fc_symbol,'
      '       s.fl_shift,'
      '       s.fl_alt,'
      '       s.fl_ctrl,'
      
        '       (select max(r.fc_name) from taxi.ts_raion r where r.fk_id' +
        ' = s.fk_raion) fc_raion,'
      '       s.fk_raion'
      '  from taxi.ttaxidispetcherkey s')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000700000046435F4E414D45010000000000030000004F4944
      0100000000000600000046435F4B45590100000000000A00000046435F53594E
      4F4E594D0100000000000900000046435F53594D424F4C010000000000080000
      00464C5F534849465401000000000006000000464C5F414C5401000000000007
      000000464C5F4354524C0100000000000800000046435F5241494F4E01000000
      000008000000464B5F5241494F4E010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 304
    Top = 168
  end
end
