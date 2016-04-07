object frmSetUch: TfrmSetUch
  Left = 449
  Top = 145
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1091#1095#1072#1089#1090#1082#1072
  ClientHeight = 473
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 352
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 69
    Width = 352
    Height = 401
    Margins.Top = 0
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    object TV: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = TVCellDblClick
      DataController.DataSource = dsListUch
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      OptionsView.Indicator = True
      object VNAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAMEUCH'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = TV
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 352
    Height = 32
    Margins.Top = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 6
    object lcbType: TcxLookupComboBox
      Left = 74
      Top = 5
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsType
      Properties.PostPopupValueOnTab = True
      Properties.OnEditValueChanged = lcbTypePropertiesEditValueChanged
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      Width = 270
    end
    object cxLabel1: TcxLabel
      Left = 4
      Top = 6
      Caption = #1058#1080#1087' '#1091#1095#1072#1089#1090#1082#1072':'
    end
  end
  object actlstOkCancel: TActionList
    Images = frmMain.ilMain
    Left = 172
    Top = 193
    object actOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 10
      ShortCut = 13
      OnExecute = actOkExecute
    end
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 0
      ShortCut = 27
      OnExecute = actCloseExecute
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
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clBtnFace
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 172
    Top = 236
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
      Caption = 'OKCancel'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 404
      FloatTop = 232
      FloatClientWidth = 71
      FloatClientHeight = 44
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbSet'
        end
        item
          Visible = True
          ItemName = 'bbClose'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'OKCancel'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbSet: TdxBarButton
      Action = actOk
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbClose: TdxBarButton
      Action = actClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object odsListUch: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name, '#39#8470' '#39'||fc_name as nameuch '
      '  from asu.tdistrict_name'
      
        ' where fk_typeid = :pfk_typeid --(select fk_id from asu.tsmid wh' +
        'ere fc_synonim = '#39'THERAPIST_AREA'#39')'
      
        'order by fc_name --to_number(REGEXP_REPLACE(fc_name, '#39'[[:alpha:]' +
        '-/'#8470'\# ]'#39'))'
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F545950454944030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000070000004E414D45554348010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsListUchAfterOpen
    Left = 60
    Top = 166
  end
  object dsListUch: TDataSource
    DataSet = odsListUch
    Left = 28
    Top = 166
  end
  object dsType: TDataSource
    DataSet = odsType
    Left = 176
    Top = 120
  end
  object odsType: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name '
      '  from asu.tsmid '
      ' where fc_synonim in ('#39'THERAPIST_AREA'#39', '#39'PEDIATR_AREA'#39')'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 216
    Top = 120
  end
end
