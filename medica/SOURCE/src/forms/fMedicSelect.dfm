object frmMedicSelect: TfrmMedicSelect
  Left = 320
  Top = 257
  Caption = #1042#1099#1073#1086#1088' '#1086#1073#1098#1077#1082#1090#1072' '#1091#1095#1077#1090#1072
  ClientHeight = 442
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 575
    Height = 42
    BorderWidth = 1
    ButtonHeight = 36
    ButtonWidth = 51
    Caption = 'ToolBar1'
    Images = dmMain.ilMain
    ShowCaptions = True
    TabOrder = 0
    object btnSelect: TToolButton
      Left = 0
      Top = 0
      Action = acSelect
    end
    object btnClose: TToolButton
      Left = 51
      Top = 0
      Action = acClose
    end
  end
  object cxGridMedic: TcxGrid
    Left = 0
    Top = 42
    Width = 575
    Height = 400
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    object cxGridMedicDBTableView1: TcxGridDBTableView
      OnDblClick = acSelectExecute
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsMedic
      DataController.Filter.MaxValueListCount = 1000
      DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnPopup.MaxDropDownItemCount = 12
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = cxGridMedicDBTableView1FC_MEDIC
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      Preview.AutoHeight = False
      Preview.MaxLineCount = 2
      Styles.ContentEven = dmMain.cxStyleGridEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridOddRow
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      object cxGridMedicDBTableView1FK_MEDIC: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'FK_MEDIC'
        Visible = False
        Options.Editing = False
        Options.Filtering = False
        Width = 100
      end
      object cxGridMedicDBTableView1FC_MEDIC: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_MEDIC'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 255
        Properties.ReadOnly = False
        Options.Editing = False
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 378
      end
      object cxGridMedicDBTableView1FC_EI: TcxGridDBColumn
        Caption = #1045#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
        DataBinding.FieldName = 'FC_EI'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 1024
        Properties.ReadOnly = False
        Options.Editing = False
        Options.Filtering = False
        Width = 195
      end
      object cxGridMedicDBTableView1FC_UCHGR: TcxGridDBColumn
        Caption = #1059#1095#1077#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
        DataBinding.FieldName = 'FC_UCHGR'
        Visible = False
        Options.Editing = False
        Options.Filtering = False
        Width = 150
      end
    end
    object cxGridMedicLevel1: TcxGridLevel
      GridView = cxGridMedicDBTableView1
    end
  end
  object odsMedic: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '    M.MEDICID AS FK_MEDIC,'
      '    M.FC_NAME AS FC_MEDIC,'
      '    E.FC_NAME AS FC_EI,'
      '    UG.FC_UCHGR'
      '  FROM'
      '    MED.TMEDIC M,'
      '    MED.TEI E,'
      '    MED.TUCHGR UG'
      '  WHERE M.EIID = E.EIID(+)'
      '    AND M.UCHGRID = UG.UCHGRID(+)'
      
        '    AND M.MEDICID NOT IN ((SELECT DISTINCT FK_MEDICITEM FROM MED' +
        '.TMEDICOMPLEX WHERE FK_MEDIC = :FK_MEDIC))'
      '--                          UNION ALL'
      
        '--                          (SELECT DISTINCT FK_MEDIC FROM MED.T' +
        'MEDICOMPLEX))'
      '    AND M.MEDICID<>:FK_MEDIC'
      '    AND M.FL_VISIBLE = 1'
      'ORDER BY M.FC_NAME, E.FC_NAME')
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A464B5F4D4544494303000000040000007B0000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000008000000464B5F4D45444943010000000000080000004643
      5F4D454449430100000000000500000046435F4549010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 400
    Top = 80
  end
  object dsMedic: TDataSource
    DataSet = odsMedic
    Left = 448
    Top = 80
  end
  object ActionList1: TActionList
    Left = 178
    Top = 4
    object acSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 30
      ShortCut = 13
      OnExecute = acSelectExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 1
      ShortCut = 27
      OnExecute = acCloseExecute
    end
  end
end
