object fmZatrebList: TfmZatrebList
  Left = 0
  Top = 0
  Caption = #1047#1072#1090#1088#1077#1073#1086#1074#1072#1085#1086
  ClientHeight = 272
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxGridTreb: TcxGrid
    Left = 0
    Top = 44
    Width = 458
    Height = 228
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabStop = False
    LookAndFeel.Kind = lfFlat
    ExplicitLeft = -256
    ExplicitTop = -21
    ExplicitWidth = 581
    ExplicitHeight = 161
    object cxGridTrebDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsZatrebovano
      DataController.Filter.MaxValueListCount = 1000
      DataController.Filter.Active = True
      DataController.KeyFieldNames = 'ROWNUM'
      DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0'
          Kind = skCount
          Column = cxGridTrebDBTableView1NAMEKART
        end>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnPopup.MaxDropDownItemCount = 12
      OptionsBehavior.CellHints = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      Preview.AutoHeight = False
      Preview.MaxLineCount = 2
      Styles.ContentEven = dmMain.cxStyleGridDetailEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridDetailOddRow
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      object cxGridTrebDBTableView1ROWNUM: TcxGridDBColumn
        Caption = #8470' '#1087'/'#1087
        DataBinding.FieldName = 'ROWNUM'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Width = 66
      end
      object cxGridTrebDBTableView1NAMEKART: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
        DataBinding.FieldName = 'NAMEKART'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        MinWidth = 50
        Options.Editing = False
        Width = 193
      end
      object cxGridTrebDBTableView1FN_TREBKOL: TcxGridDBColumn
        Caption = #1047#1072#1090#1088#1077#1073#1086#1074#1072#1085#1086':'
        DataBinding.FieldName = 'FN_TREBKOL'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '### ### ### ##0.#######'
        Width = 96
      end
      object cxGridTrebDBTableView1FN_KOL: TcxGridDBColumn
        Caption = #1054#1090#1087#1091#1097#1077#1085#1086':'
        DataBinding.FieldName = 'FN_KOL'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.DisplayFormat = '### ### ### ##0.#######'
        Properties.MaxValue = 100000000.000000000000000000
        Properties.ReadOnly = True
        MinWidth = 53
        Width = 82
      end
      object cxGridTrebDBTableView1FC_EDIZM: TcxGridDBColumn
        Caption = #1045#1076'. '#1048#1079#1084'.'
        DataBinding.FieldName = 'FC_EDIZM'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 99
      end
      object cxGridTrebDBTableView1SUMM: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072':'
        DataBinding.FieldName = 'SUMM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.DisplayFormat = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
        Properties.Nullable = False
        Properties.ReadOnly = True
        Visible = False
        Options.Editing = False
        VisibleForCustomization = False
        Width = 106
      end
      object cxGridTrebDBTableView1ODR: TcxGridDBColumn
        DataBinding.FieldName = 'ODR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Visible = False
        VisibleForCustomization = False
        Width = 54
      end
      object cxGridTrebDBTableView1FN_KOLOST: TcxGridDBColumn
        Caption = #1053#1072#1083#1080#1095#1080#1077
        DataBinding.FieldName = 'FN_KOLOST'
        PropertiesClassName = 'TcxSpinEditProperties'
        Options.Editing = False
      end
      object cxGridTrebDBTableView1FC_NAZN_NAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1086
        DataBinding.FieldName = 'FC_NAZN_NAME'
        Visible = False
        MinWidth = 50
        VisibleForCustomization = False
      end
      object cxGridTrebDBTableView1FN_NAZN_KOL_F: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086' ('#1092#1072#1089'.)'
        DataBinding.FieldName = 'FN_NAZN_KOL_F'
        Visible = False
        VisibleForCustomization = False
      end
      object cxGridTrebDBTableView1FC_NAZN_ED_IZM: TcxGridDBColumn
        Caption = #1053#1072#1079#1085'. '#1077#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_NAZN_ED_IZM'
        Visible = False
        VisibleForCustomization = False
      end
      object cxGridTrebDBTableView1FK_ID: TcxGridDBColumn
        Caption = #1050#1086#1076' FK_TREBDPC'
        DataBinding.FieldName = 'FK_ID'
        Visible = False
      end
      object cxGridTrebDBTableView1FD_CREATE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
        DataBinding.FieldName = 'FD_CREATE'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.DateButtons = []
        Properties.Kind = ckDateTime
        Properties.ReadOnly = True
        Visible = False
      end
      object cxGridTrebDBTableView1FK_CREATE_MO_ID: TcxGridDBColumn
        Caption = #1050#1090#1086' '#1089#1086#1079#1076#1072#1083
        DataBinding.FieldName = 'FK_CREATE_MO_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.IncrementalFiltering = False
        Properties.KeyFieldNames = 'MOID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmMain.dsMO
        Properties.ReadOnly = True
        Visible = False
      end
      object cxGridTrebDBTableView1FD_EDIT: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        DataBinding.FieldName = 'FD_EDIT'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.DateButtons = []
        Properties.Kind = ckDateTime
        Properties.ReadOnly = True
        Visible = False
      end
      object cxGridTrebDBTableView1FK_EDIT_MO_ID: TcxGridDBColumn
        Caption = #1050#1090#1086' '#1074#1085#1077#1089' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        DataBinding.FieldName = 'FK_EDIT_MO_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'MOID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmMain.dsMO
        Properties.ReadOnly = True
        Visible = False
      end
      object cxGridTrebDBTableView1MEDICID: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'MEDICID'
        Visible = False
      end
    end
    object cxGridTrebLevel1: TcxGridLevel
      GridView = cxGridTrebDBTableView1
    end
  end
  object CoolBar2: TCoolBar
    Left = 0
    Top = 0
    Width = 458
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 40
        Width = 458
      end>
    EdgeBorders = [ebTop, ebBottom]
    ExplicitLeft = -250
    ExplicitWidth = 630
    object ToolBar2: TToolBar
      Left = 9
      Top = 0
      Width = 449
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 51
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ShowCaptions = True
      TabOrder = 0
      object tbuSelect: TToolButton
        Left = 0
        Top = 0
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1091
        Caption = #1042#1099#1073#1088#1072#1090#1100
        ImageIndex = 9
        ParentShowHint = False
        ShowHint = True
        OnClick = tbuSelectClick
      end
      object tbuCancel: TToolButton
        Left = 51
        Top = 0
        Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1099#1073#1086#1088
        Caption = #1054#1090#1084#1077#1085#1072
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = tbuCancelClick
      end
    end
  end
  object dsZatrebovano: TDataSource
    Left = 252
    Top = 65534
  end
end
