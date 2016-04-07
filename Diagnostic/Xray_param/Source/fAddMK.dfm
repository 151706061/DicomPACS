object frmAddMK: TfrmAddMK
  Left = 366
  Top = 78
  Caption = #1042#1099#1073#1086#1088' '#1084#1077#1090#1086#1076#1080#1082', '#1089#1074#1103#1079#1072#1085#1085#1099#1093' '#1089' '#1082#1086#1085#1090#1088#1072#1089#1090#1086#1084
  ClientHeight = 577
  ClientWidth = 695
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
  object grList: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 689
    Height = 493
    Margins.Top = 0
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    LookAndFeel.SkinName = ''
    object tvList: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsList
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = tvListName
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvListCheck: TcxGridDBColumn
        DataBinding.FieldName = 'FL_CHECK'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Options.Moving = False
        IsCaptionAssigned = True
      end
      object tvListName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Options.Editing = False
      end
      object tvListID: TcxGridDBColumn
        Caption = 'medicid'
        DataBinding.FieldName = 'FK_ID'
        Visible = False
        VisibleForCustomization = False
      end
    end
    object grListLevel1: TcxGridLevel
      GridView = tvList
    end
  end
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 689
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 530
    Width = 689
    Height = 44
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 6
    object cxLabel1: TcxLabel
      Left = 9
      Top = 11
      Caption = #1060#1080#1083#1100#1090#1088':'
    end
    object teFilter: TcxTextEdit
      Left = 56
      Top = 11
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 119
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      OnClick = teFilterClick
      OnEnter = teFilterEnter
      OnKeyUp = teFilterKeyUp
      Width = 305
    end
    object bOk: TcxButton
      Left = 526
      Top = 8
      Width = 75
      Height = 25
      Action = aOk
      TabOrder = 2
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 604
      Top = 8
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 3
      LookAndFeel.SkinName = 'Office2007Green'
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
    LookAndFeel.Kind = lfFlat
    LookAndFeel.SkinName = ''
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 336
    Top = 168
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
      FloatLeft = 181
      FloatTop = 60
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton2'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBarButton1: TdxBarButton
      Action = aCheckAll
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
        00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00
        FF000000800080808000FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
        FF000000FF000000800080808000FF00FF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000000000000000000000000000000000FF000000
        FF004080E0000000FF0000008000FF00FF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FF00FF004080E000808080000000FF000000
        8000FF00FF004080E0000000FF000000800000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000004080E0000000FF000000FF0000000000FF00
        FF00FF00FF00FF00FF004080E0000000FF0080808000FF00FF00FF00FF000000
        000000000000000000004080E0000000FF004080E0000000FF00000000000000
        00000000000000000000000000004080E0000000FF00FF00FF00FF00FF000000
        0000FF00FF00000080004080E0000000FF00808080004080E0000000FF000000
        FF008080800000000000FF00FF00FF00FF004080E000FF00FF00FF00FF000000
        00000000FF000000FF0000000000FF00FF00FF00FF00FF00FF004080E0000000
        FF000000800080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        FF000000FF004080E00000000000000000000000000000000000000000000000
        00000000FF0000008000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        FF0000008000FF00FF004080E0000000FF000000800000000000FF00FF00FF00
        FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FF00FF00FF00FF00FF00FF004080E0000000FF0080808000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000000000000000000000000000000000004080E0000000FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004080E000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton2: TdxBarButton
      Action = aUnCheckAll
      Category = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000000000000000000000000
        00000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00
        FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000
        0000000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF
        FF00FFFF00FF000000FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00
        FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF
        00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF000000
        000000000000000000FF00FFFF00FFFF00FF0000000000000000000000000000
        00000000000000FF00FFFF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF
        00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000
        FF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF00000000000000000000
        0000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000
        FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF00
        0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000
        000000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      PaintStyle = psCaptionGlyph
    end
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 176
    Top = 208
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select rowid,  '
      '       0 as fl_check, '
      '       fk_id, '
      '       fc_name, '
      '       upper(fc_name) as fc_name_up'
      '  from asu.tsmid'
      ' where fl_showanal = 1'
      '   and fk_id not in (select fk_smid from asu.tmk)'
      
        'start with fk_id in (stat.pkg_statutil.GET_SMIDID('#39'PLAT_RENTGENO' +
        'LOGIYA'#39'), stat.pkg_statutil.GET_SMIDID('#39'PLAT_MRT'#39'), stat.pkg_sta' +
        'tutil.GET_SMIDID('#39'PLAT_KT'#39'), asu.get_rg_issl)'
      'connect by prior fk_id = fk_owner  '
      'order by fc_name'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000008000000464C5F434845434B010000000000070000004643
      5F4E414D450100000000000A00000046435F4E414D455F555001000000000005
      000000464B5F4944010000000000}
    Cursor = crSQLWait
    Session = frmMain.osMain
    Left = 176
    Top = 256
    object odsListFL_CHECK: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'FL_CHECK'
    end
    object odsListFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Required = True
      Size = 255
    end
    object odsListFC_NAME_UP: TStringField
      FieldName = 'FC_NAME_UP'
      Size = 255
    end
    object odsListFK_ID: TFloatField
      FieldName = 'FK_ID'
      Required = True
    end
  end
  object al: TActionList
    Left = 296
    Top = 248
    object aOk: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aCheckAll: TAction
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
      Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
      OnExecute = aCheckAllExecute
    end
    object aUnCheckAll: TAction
      Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077
      Hint = #1057#1085#1103#1090#1100' '#1074#1089#1077
      OnExecute = aUnCheckAllExecute
    end
  end
end
