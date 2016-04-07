object frmMedic: TfrmMedic
  Left = 351
  Top = 199
  HelpContext = 45
  Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074' '#1091#1095#1077#1090#1072
  ClientHeight = 511
  ClientWidth = 903
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnHelp = FormHelp
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 903
    Height = 50
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 44
        Width = 897
      end>
    BorderWidth = 1
    EdgeBorders = [ebTop]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 890
      Height = 44
      AutoSize = True
      ButtonHeight = 44
      ButtonWidth = 68
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton9: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = #1042#1099#1073#1088#1072#1090#1100
        ImageIndex = 30
        Style = tbsSeparator
      end
      object ToolButton6: TToolButton
        Left = 8
        Top = 0
        Width = 1
        Caption = 'ToolButton6'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object tbuSelect: TToolButton
        Left = 9
        Top = 0
        Action = acSelect
      end
      object ToolButton8: TToolButton
        Left = 77
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 85
        Top = 0
        Action = acAdd
      end
      object ToolButton2: TToolButton
        Left = 153
        Top = 0
        Action = acEdit
      end
      object ToolButton4: TToolButton
        Left = 221
        Top = 0
        Action = acDel
      end
      object tbtVisible: TToolButton
        Left = 289
        Top = 0
        Cursor = crHandPoint
        Action = acHide
      end
      object ToolButton7: TToolButton
        Left = 357
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object tbuSkladSelect: TToolButton
        Left = 365
        Top = 0
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1089#1082#1083#1072#1076
        Caption = #1058#1077#1082'. '#1089#1082#1083#1072#1076
        ImageIndex = 61
        Visible = False
        OnClick = tbuSkladSelectClick
      end
      object ToolButton5: TToolButton
        Left = 433
        Top = 0
        Action = acRefresh
        DropdownMenu = pmRefresh
        Style = tbsDropDown
      end
      object tbuExportToExcel: TToolButton
        Left = 516
        Top = 0
        Action = acExportToExcel
      end
      object ToolButton10: TToolButton
        Left = 584
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 592
        Top = 0
        Action = acClose
      end
      object ToolButton11: TToolButton
        Left = 660
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 2
        Style = tbsSeparator
      end
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 50
    Width = 903
    Height = 342
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = cxGrid1DBTableView1CellClick
      OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
      DataController.DataSource = dsMedicsList
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1050#1086#1083'-'#1074#1086': ### ### ##0'
          Kind = skCount
          FieldName = 'FC_NAME'
          Column = cxGrid1DBTableView1FC_NAME
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      Styles.ContentEven = dmMain.cxStyleGridEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridOddRow
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      Styles.Footer = dmMain.cxStyleFooter
      object cxGrid1DBTableView1FL_CHECK: TcxGridDBColumn
        Caption = #1042#1099#1073#1086#1088
        DataBinding.FieldName = 'FL_CHECK'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Visible = False
        VisibleForCustomization = False
        Width = 50
      end
      object cxGrid1DBTableView1FC_NAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Options.Editing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 158
      end
      object cxGrid1DBTableView1FC_SHORTNAME: TcxGridDBColumn
        Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_SHORTNAME'
        Visible = False
        Options.Editing = False
        Width = 80
      end
      object cxGrid1DBTableView1FC_NAME_LAT: TcxGridDBColumn
        Caption = #1051#1072#1090'. '#1085#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME_LAT'
        Options.Editing = False
        Width = 90
      end
      object cxGrid1DBTableView1FC_INTERNATIONAL_NAME: TcxGridDBColumn
        Caption = #1052#1053#1053
        DataBinding.FieldName = 'FC_INTERNATIONAL_NAME'
        Options.Editing = False
        Width = 90
      end
      object cxGrid1DBTableView1FC_UCHNAME: TcxGridDBColumn
        Caption = #1059#1095#1105#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
        DataBinding.FieldName = 'UCHGRID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'UCHGRID'
        Properties.ListColumns = <
          item
            Caption = #1059#1095#1105#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
            Width = 250
            FieldName = 'FC_FULL_UCHGR_NAME'
          end
          item
            Caption = #1050#1074#1086#1090#1072
            FieldName = 'fc_quota_code_2'
          end>
        Properties.ListSource = dsUchgr
        Properties.OnEditValueChanged = cxGrid1DBTableView1FC_UCHNAMEPropertiesEditValueChanged
        Options.Editing = False
        Width = 69
      end
      object cxGrid1DBTableView1FC_FARMNAME: TcxGridDBColumn
        Caption = #1060#1072#1088#1084#1072#1082'. '#1075#1088#1091#1087#1087#1072
        DataBinding.FieldName = 'FARMGRID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'FARMGRID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_FARMGR'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmMain.dsFarmGr
        Width = 86
      end
      object cxGrid1DBTableView1FC_PREP: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1056#1051#1057
        DataBinding.FieldName = 'FC_PREP'
        Visible = False
        Options.Editing = False
        Width = 95
      end
      object cxGrid1DBTableView1FC_EANCODE: TcxGridDBColumn
        Caption = #1050#1086#1076' EAN'
        DataBinding.FieldName = 'FC_EANCODE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.MaxLength = 13
        Visible = False
        Width = 94
      end
      object cxGrid1DBTableView1FK_ATC: TcxGridDBColumn
        Caption = #1040#1058#1061
        DataBinding.FieldName = 'FK_ATC'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmMain.dsATC
        Options.Editing = False
        Width = 90
      end
      object cxGrid1DBTableView1FC_ATC_ROOT: TcxGridDBColumn
        Caption = #1043#1088#1091#1087#1087#1072' '#1040#1058#1061
        DataBinding.FieldName = 'FK_ATC_ROOT'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmMain.dsATC
        Visible = False
        Width = 90
      end
      object cxGrid1DBTableView1FC_PROD: TcxGridDBColumn
        Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        DataBinding.FieldName = 'FC_PROD'
        Visible = False
        Width = 50
      end
      object cxGrid1DBTableView1FC_CERT: TcxGridDBColumn
        Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
        DataBinding.FieldName = 'FC_CERT'
        Visible = False
        Width = 50
      end
      object cxGrid1DBTableView1FC_OKDP: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1054#1050#1044#1055
        DataBinding.FieldName = 'FC_OKDP'
        Width = 70
      end
      object cxGrid1DBTableView1FC_UEDIZM: TcxGridDBColumn
        Caption = #1059#1087'. '#1077#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'EIID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'EIID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmMain.dsEI
        Width = 42
      end
      object cxGrid1DBTableView1FN_FPACKINUPACK: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086' '#1074' '#1091#1087#1072#1082#1086#1074#1082#1077
        DataBinding.FieldName = 'FN_FPACKINUPACK'
        Options.Editing = False
        Width = 29
      end
      object cxGrid1DBTableView1FC_FEDIZM: TcxGridDBColumn
        Caption = #1060#1072#1089'. '#1077#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FK_FPACKID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'EIID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmMain.dsEI
        Width = 42
      end
      object cxGrid1DBTableView1FN_MASS: TcxGridDBColumn
        Caption = #1052#1072#1089#1089#1072' '#1051#1060
        DataBinding.FieldName = 'FN_MASS'
        Visible = False
        Options.Editing = False
        Width = 26
      end
      object cxGrid1DBTableView1FC_MASSUNITS: TcxGridDBColumn
        Caption = #1045#1076'. '#1084#1072#1089#1089#1099' '#1051#1060
        DataBinding.FieldName = 'FC_MASSUNITS'
        Visible = False
        Options.Editing = False
        Width = 38
      end
      object cxGrid1DBTableView1FC_SPECIALMEDIC: TcxGridDBColumn
        Caption = #1053#1072#1088#1082#1086#1090#1080#1095#1077#1089#1082#1080#1077', '#1089#1080#1083#1100#1085#1086#1076#1077#1081#1089#1090#1074'. '#1080' '#1103#1076#1086#1074#1080#1090#1099#1077
        DataBinding.FieldName = 'FC_SPECIALMEDIC'
        Options.Editing = False
        Width = 42
      end
      object cxGrid1DBTableView1FC_LGOTA: TcxGridDBColumn
        Caption = #1051#1100#1075#1086#1090#1085#1099#1081
        DataBinding.FieldName = 'FC_LGOTA'
        Visible = False
        Options.Editing = False
        Width = 22
      end
      object cxGrid1DBTableView1FL_PRINT_LAT_NAME: TcxGridDBColumn
        Caption = #1055#1077#1095#1072#1090#1100' '#1083#1072#1090'. '#1080#1084#1077#1085#1080
        DataBinding.FieldName = 'FL_PRINT_LAT_NAME'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Width = 28
      end
      object cxGrid1DBTableView1FC_SOST: TcxGridDBColumn
        Caption = #1057#1086#1089#1090#1072#1074#1085#1086#1081
        DataBinding.FieldName = 'FC_SOST'
        PropertiesClassName = 'TcxLabelProperties'
        Options.Editing = False
        Width = 62
      end
      object cxGrid1DBTableView1MEDICID: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'MEDICID'
        PropertiesClassName = 'TcxSpinEditProperties'
        Visible = False
        Options.Editing = False
        Width = 65
      end
      object cxGrid1DBTableView1FL_VISIBLE_FOR_NOT_APTEKA: TcxGridDBColumn
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074#1085#1077' '#1072#1087#1090#1077#1082#1080
        DataBinding.FieldName = 'FL_VISIBLE_FOR_NOT_APTEKA'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Width = 56
      end
      object cxGrid1DBTableView1FL_EQUIPMENT: TcxGridDBColumn
        Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FL_EQUIPMENT'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        VisibleForCustomization = False
        Width = 43
      end
      object cxGrid1DBTableView1FK_GROUP_LF: TcxGridDBColumn
        Caption = #1043#1088#1091#1087#1087#1072' '#1051#1060
        DataBinding.FieldName = 'FK_GROUP_LF'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'FK_GROUP_LF_ID'
        Properties.ListColumns = <
          item
            Caption = #1043#1088#1091#1087#1087#1072' '#1051#1060
            FieldName = 'FC_GROUP_LF'
          end>
        Properties.ListSource = dmMain.dsGROUP_LF
        Visible = False
        VisibleForCustomization = False
        Width = 65
      end
      object cxGrid1DBTableView1FC_QUOTA_CODE_34: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1082#1074#1086#1090#1099' ('#1073#1077#1079' '#1086#1090#1076'. '#1080' '#1091#1095'. '#1075#1088#1091#1087#1087#1099')'
        DataBinding.FieldName = 'FC_QUOTA_CODE_34'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.AlwaysShowBlanksAndLiterals = True
        Properties.EditMask = '00-00;0;_'
        Properties.OnEditValueChanged = cxGrid1DBTableView1FC_UCHNAMEPropertiesEditValueChanged
        Width = 62
      end
      object cxGrid1DBTableView1FL_JNVLS: TcxGridDBColumn
        Caption = #1046#1053#1042#1051#1055
        DataBinding.FieldName = 'FL_JNVLS'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Width = 43
      end
      object cxGrid1DBTableView1FK_SKLAD_ID: TcxGridDBColumn
        Caption = #1057#1082#1083#1072#1076
        DataBinding.FieldName = 'FK_SKLAD_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'fk_id'
        Properties.ListColumns = <
          item
            Caption = #1057#1082#1083#1072#1076
            FieldName = 'fc_name'
          end>
        Properties.ListSource = dmMain.dsSklad
        Visible = False
        VisibleForCustomization = False
        Width = 65
      end
      object cxGrid1DBTableView1FL_MIBP: TcxGridDBColumn
        Caption = #1052#1048#1041#1055
        DataBinding.FieldName = 'FL_MIBP'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 43
      end
      object cxGrid1DBTableView1FL_FORMULAR: TcxGridDBColumn
        Caption = #1060#1086#1088#1084#1091#1083#1103#1088
        DataBinding.FieldName = 'FL_FORMULAR'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Properties.OnChange = cxGrid1DBTableView1FL_FORMULARPropertiesChange
        Width = 43
      end
      object cxGrid1DBTableView1FC_CLASS: TcxGridDBColumn
        Caption = #1050#1083#1072#1089#1089
        DataBinding.FieldName = 'FC_CLASS'
        Visible = False
        Width = 40
      end
      object cxGrid1DBTableView1FL_FORM_KOMISS: TcxGridDBColumn
        Caption = #1060#1050
        DataBinding.FieldName = 'FL_FORM_KOMISS'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Properties.OnChange = cxGrid1DBTableView1FL_FORM_KOMISSPropertiesChange
      end
      object cxGrid1DBTableView1UCHGRID: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1091#1095#1077#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099
        DataBinding.FieldName = 'UCHGRID'
        Visible = False
      end
      object cxGrid1DBTableView1FL_VRACH_KOMISS: TcxGridDBColumn
        Caption = #1042#1050
        DataBinding.FieldName = 'FL_VRACH_KOMISS'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        HeaderAlignmentHorz = taCenter
        Width = 20
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 416
    Width = 903
    Height = 95
    Align = alBottom
    TabOrder = 2
    Visible = False
    object cxGrid2DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsSostMedics
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.DataRowHeight = 20
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 20
      Styles.ContentEven = dmMain.cxStyleGridDetailEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridDetailOddRow
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      Styles.Footer = dmMain.cxStyleFooter
      object cxGrid2DBTableView1FC_NAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Options.Editing = False
        Width = 194
      end
      object cxGrid2DBTableView1FC_NAME_LAT: TcxGridDBColumn
        Caption = #1051#1072#1090'. '#1085#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME_LAT'
        Options.Editing = False
        Width = 279
      end
      object cxGrid2DBTableView1FC_UEDIZM: TcxGridDBColumn
        Caption = #1059#1087'. '#1077#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_UEDIZM'
        Options.Editing = False
        Width = 177
      end
      object cxGrid2DBTableView1FN_AMOUNT: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086
        DataBinding.FieldName = 'FN_AMOUNT'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '### ### ##0.##########'
        Options.Editing = False
        Width = 128
      end
      object cxGrid2DBTableView1FN_FPACKINUPACK: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086' '#1074' '#1091#1087#1072#1082#1086#1074#1082#1077
        DataBinding.FieldName = 'FN_FPACKINUPACK'
        Visible = False
        Options.Editing = False
        Width = 98
      end
      object cxGrid2DBTableView1FC_FEDIZM: TcxGridDBColumn
        Caption = #1060#1072#1089'. '#1077#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_FEDIZM'
        Visible = False
        Options.Editing = False
        Width = 127
      end
      object cxGrid2DBTableView1FN_MASS: TcxGridDBColumn
        Caption = #1052#1072#1089#1089#1072' '#1051#1060
        DataBinding.FieldName = 'FN_MASS'
        Visible = False
        Options.Editing = False
        Width = 20
      end
      object cxGrid2DBTableView1FC_MASSUNITS: TcxGridDBColumn
        Caption = #1045#1076'. '#1084#1072#1089#1089#1099' '#1051#1060
        DataBinding.FieldName = 'FC_MASSUNITS'
        Visible = False
        Options.Editing = False
        Width = 127
      end
      object cxGrid2DBTableView1MEDICID: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'MEDICID'
        Visible = False
      end
      object cxGrid2DBTableView1FL_TARA: TcxGridDBColumn
        Caption = #1058#1072#1088#1072
        DataBinding.FieldName = 'FL_TARA'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Options.Editing = False
        VisibleForCustomization = False
        Width = 39
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 408
    Width = 903
    Height = 8
    AlignSplitter = salBottom
    Control = cxGrid2
    Visible = False
  end
  object paVisible: TPanel
    Left = 0
    Top = 392
    Width = 903
    Height = 16
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      903
      16)
    object cbShowHidden: TCheckBox
      Left = 653
      Top = 1
      Width = 246
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1089#1082#1088#1099#1090#1099#1077' '#1086#1073#1098#1077#1082#1090#1099' '#1091#1095#1105#1090#1072
      TabOrder = 0
      OnClick = cbShowHiddenClick
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    OnUpdate = alUpdate
    Left = 138
    Top = 128
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      ImageIndex = 1
      ShortCut = 16499
      OnExecute = acCloseExecute
    end
    object acDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 22
      ShortCut = 119
      OnExecute = acDelExecute
    end
    object acEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 3
      ShortCut = 114
      OnExecute = acEditExecute
    end
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 21
      ShortCut = 115
      OnExecute = acAddExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 15
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
    object acSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 30
      ShortCut = 13
      OnExecute = acSelectExecute
    end
    object acExportToExcel: TAction
      Caption = #1074' Excel'
      ImageIndex = 44
      OnExecute = acExportToExcelExecute
    end
    object acCancelFilterEAN13: TAction
      Caption = 'acCancelFilterEAN13'
      ShortCut = 27
      OnExecute = acCancelFilterEAN13Execute
    end
    object acHide: TAction
      Caption = #1057#1082#1088#1099#1090#1100
      Hint = #1057#1082#1088#1099#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 69
      OnExecute = acHideExecute
    end
    object acSetUchGr: TAction
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1091#1095#1077#1090#1085#1091#1102' '#1075#1088#1091#1087#1087#1091
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1091#1095#1077#1090#1085#1091#1102' '#1075#1088#1091#1087#1087#1091
      OnExecute = acSetUchGrExecute
    end
    object acShow: TAction
      Caption = #1042#1077#1088#1085#1091#1090#1100
      Hint = #1042#1077#1088#1085#1091#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 70
      OnExecute = acShowExecute
    end
    object acUchGrChangesList: TAction
      Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1091#1095#1077#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099
      OnExecute = acUchGrChangesListExecute
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmMedic\'
    StoredProps.Strings = (
      'cxGrid1DBTableView1FC_FARMNAME.Visible'
      'cxGrid1DBTableView1FC_EANCODE.Visible'
      'cxGrid1DBTableView1FC_FEDIZM.Visible'
      'cxGrid1DBTableView1FC_LGOTA.Visible'
      'cxGrid1DBTableView1FC_MASSUNITS.Visible'
      'cxGrid1DBTableView1FC_NAME.Visible'
      'cxGrid1DBTableView1FC_NAME_LAT.Visible'
      'cxGrid1DBTableView1FC_PREP.Visible'
      'cxGrid1DBTableView1FC_SPECIALMEDIC.Visible'
      'cxGrid1DBTableView1FC_UCHNAME.Visible'
      'cxGrid1DBTableView1FC_UEDIZM.Visible'
      'cxGrid1DBTableView1FL_PRINT_LAT_NAME.Visible'
      'cxGrid1DBTableView1FN_FPACKINUPACK.Visible'
      'cxGrid1DBTableView1FN_MASS.Visible'
      'cxGrid1DBTableView1FC_SOST.Visible'
      'cxGrid1DBTableView1FL_VISIBLE_FOR_NOT_APTEKA.Visible'
      'cxGrid1DBTableView1FL_VISIBLE_FOR_NOT_APTEKA.Width'
      'cxGrid1DBTableView1FC_EANCODE.Width'
      'cxGrid1DBTableView1FC_FARMNAME.Width'
      'cxGrid1DBTableView1FC_FEDIZM.Width'
      'cxGrid1DBTableView1FC_LGOTA.Width'
      'cxGrid1DBTableView1FC_MASSUNITS.Width'
      'cxGrid1DBTableView1FC_NAME.Width'
      'cxGrid1DBTableView1FC_NAME_LAT.Width'
      'cxGrid1DBTableView1FC_PREP.Width'
      'cxGrid1DBTableView1FC_SOST.Width'
      'cxGrid1DBTableView1FC_SPECIALMEDIC.Width'
      'cxGrid1DBTableView1FC_UCHNAME.Width'
      'cxGrid1DBTableView1FC_UEDIZM.Width'
      'cxGrid1DBTableView1FN_FPACKINUPACK.Width'
      'cxGrid1DBTableView1FN_MASS.Width'
      'cxGrid1DBTableView1MEDICID.Visible'
      'cxGrid1DBTableView1MEDICID.Width'
      'cxGrid2DBTableView1FC_FEDIZM.Visible'
      'cxGrid2DBTableView1FC_FEDIZM.Width'
      'cxGrid2DBTableView1FC_MASSUNITS.Visible'
      'cxGrid2DBTableView1FC_MASSUNITS.Width'
      'cxGrid2DBTableView1FC_NAME.Visible'
      'cxGrid2DBTableView1FC_NAME.Width'
      'cxGrid2DBTableView1FC_NAME_LAT.Visible'
      'cxGrid2DBTableView1FC_NAME_LAT.Width'
      'cxGrid2DBTableView1FC_UEDIZM.Visible'
      'cxGrid2DBTableView1FC_UEDIZM.Width'
      'cxGrid2DBTableView1FN_AMOUNT.Visible'
      'cxGrid2DBTableView1FN_AMOUNT.Width'
      'cxGrid2DBTableView1FN_FPACKINUPACK.Visible'
      'cxGrid2DBTableView1FN_FPACKINUPACK.Width'
      'cxGrid2DBTableView1FN_MASS.Visible'
      'cxGrid2DBTableView1FN_MASS.Width'
      'cxGrid2DBTableView1MEDICID.Visible'
      'cxGrid2DBTableView1MEDICID.Width'
      'cxGrid1DBTableView1FL_EQUIPMENT.Width'
      'cxGrid1DBTableView1FL_PRINT_LAT_NAME.Width'
      'cxGrid1DBTableView1FC_INTERNATIONAL_NAME.Visible'
      'cxGrid1DBTableView1FC_INTERNATIONAL_NAME.Width'
      'cxGrid1DBTableView1FK_GROUP_LF.Visible'
      'cxGrid1DBTableView1FK_GROUP_LF.Width'
      'cxGrid1DBTableView1FC_QUOTA_CODE_34.Width'
      'cxGrid1DBTableView1FC_QUOTA_CODE_34.Visible'
      'cxGrid1DBTableView1FL_JNVLS.Width'
      'cxGrid1DBTableView1FK_SKLAD_ID.Visible'
      'cxGrid1DBTableView1FK_SKLAD_ID.Width'
      'cxGrid1DBTableView1FC_SHORTNAME.Visible'
      'cxGrid1DBTableView1FC_SHORTNAME.Width'
      'cxGrid1DBTableView1FK_ATC.Visible'
      'cxGrid1DBTableView1FK_ATC.Width'
      'cxGrid1DBTableView1FC_PROD.Width'
      'cxGrid1DBTableView1FC_PROD.Visible'
      'cxGrid1DBTableView1FC_CERT.Width'
      'cxGrid1DBTableView1FC_CERT.Visible'
      'cxGrid1DBTableView1FC_OKDP.Width'
      'cxGrid1DBTableView1FC_OKDP.Visible'
      'cxGrid1DBTableView1FC_ATC_ROOT.Width'
      'cxGrid1DBTableView1FC_ATC_ROOT.Visible'
      'cxGrid1DBTableView1FL_FORM_KOMISS.Width'
      'cxGrid1DBTableView1FL_FORM_KOMISS.Visible')
    StoredValues = <
      item
        Name = 'WState'
        Value = 1
      end>
    Left = 180
    Top = 126
  end
  object pmRefresh: TPopupMenu
    Left = 306
    Top = 282
    object N2: TMenuItem
      AutoCheck = True
      Caption = #1050#1088#1086#1084#1077' '#1076#1086#1073#1072#1074#1083#1077#1085#1085#1099#1084' '#1074#1088#1072#1095#1072#1084#1080
      Checked = True
      Hint = 
        #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1072#1082#1078#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1099', '#1076#1086#1073#1072#1074#1083#1077#1085#1085#1099#1077' '#1074#1088#1072#1095#1072#1084#1080' '#1087#1088#1080' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1080' '#1083 +
        #1077#1095#1077#1085#1080#1103
      ImageIndex = 58
      RadioItem = True
      OnClick = N2Click
    end
    object N1: TMenuItem
      Tag = 1
      AutoCheck = True
      Caption = #1042#1089#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1099
      RadioItem = True
      OnClick = N2Click
    end
  end
  object odsMedicsList: TOracleDataSet
    SQL.Strings = (
      'SELECT 0 FL_CHECK,'
      '       TMEDIC.ROWID, '
      '       TMEDIC.FC_NAME,'
      '       TMEDIC.FC_SHORTNAME,'
      '       TMEDIC.FC_NAME_LAT,'
      '       TMEDIC.MEDICID,'
      '       TMEDIC.uchgrid,'
      '--       TUCHGR.FC_UCHGR AS FC_UCHNAME, '
      '--       TFARMGR.FC_FARMGR AS FC_FARMNAME,'
      '       TMEDIC.FARMGRID,'
      '       TMEDIC.FK_ATC,'
      
        '       (SELECT max(ID) FROM rls.clsatc WHERE ID IN (SELECT ID FR' +
        'OM rls.clsatc WHERE parentid = 0 AND ID <> 0) START WITH ID = TM' +
        'EDIC.FK_ATC CONNECT BY id = PRIOR parentid AND ID <> 0) FK_ATC_R' +
        'OOT,'
      '--       DECODE(FL_PKU, 0, '#39#1053#1045#1058#39', 1, '#39#1044#1040#39') AS FL_PKU,'
      '   TMEDIC.FK_NOMEN_RLS as FK_NOMEN_RLS,'
      '-- '#1076#1083#1103' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081' '#1101#1090#1086' '#1086#1095#1077#1085#1100' '#1090#1086#1088#1084#1086#1079#1080#1090' '#1080' '#1085#1077' '#1085#1091#1078#1085#1086' '
      
        '-- '#1087#1086#1090#1086#1084' '#1086#1090#1076#1077#1083#1100#1085#1086' '#1074#1099#1079#1086#1074#1077#1084' '#1076#1083#1103' '#1086#1076#1085#1086#1075#1086' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072' '#1087#1088#1080' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072 +
        #1085#1080#1080
      '--       RLS.Get_ActmattersList(TMEDIC.FK_NOMEN_RLS) NDV,'
      '--       VPREPRLS.RESULT || VNOMENRLS.RESULT AS FC_PREP,'
      ''
      '       TMEDIC.FC_EANCODE,'
      '--       TMEDIC.FK_TYPE,'
      '--       TMEDICTYPE.FC_NAME AS FC_MEDICTYPE,'
      '--       '#9'TMEDIC.FK_PAYTYPE,'
      '--       '#9'TPAYTYPE.FC_NAME AS FC_MEDPAYTYPE,'
      '       TEI.FC_NAME AS FC_UEDIZM,'
      '       TMEDIC.EIID,'
      '       TMEDIC.FK_FPACKID,'
      '       TMEDIC.FN_FPACKINUPACK,'
      '       T2.FC_NAME AS FC_FEDIZM,'
      '       TMEDIC.FN_MASS AS FN_MASS, '
      '       TMASSUNITS.FK_ID AS FK_MASSUNITS,'
      '       TMASSUNITS.FC_SHORTNAME AS FC_MASSUNITS,'
      '       TMEDIC_TSPECIALMEDIC.FK_SPECIALMEDIC,'
      '       TSPECIALMEDIC.FC_NAME AS FC_SPECIALMEDIC,'
      
        '--       DECODE(FL_LGOTA, 0, '#39#1053#1077#1090#39', 1, '#39#1044#1072#39', '#39#1053#1077' '#1080#1079#1074#1077#1089#1090#1085#1086#39') AS F' +
        'C_LGOTA,'
      '--       to_number(null) AS FK_MEDIC_PARENT,'
      '       TMEDIC.fl_print_lat_name,'
      '       decode(NVL(SostMed.Count_,0), 0, '#39#1053#1077#1090#39', '#39#1044#1072#39') as FC_SOST,'
      '       SostMed.Count_ as FN_SostMedCount,'
      '       TMEDIC.FL_VISIBLE_FOR_NOT_APTEKA,'
      '       TMEDIC.FK_SKLAD_ID,'
      '       TMEDIC.FL_EQUIPMENT,'
      '       TMEDIC.FC_INTERNATIONAL_NAME,'
      '       TMEDIC.FK_GROUP_LF,'
      '       TMEDIC.FC_QUOTA_CODE_34,'
      '       TMEDIC.FL_JNVLS,'
      '       TMEDIC.FL_MIBP,'
      '       TMEDIC.FC_CLASS,'
      '       TMEDIC.FL_FORMULAR,'
      '       TMEDIC.FL_FORM_KOMISS,'
      '       TMEDIC.FN_MEDICPRODCERTID,'
      '       TMEDIC.FK_OKDP,'
      '       TMEDIC.FL_VRACH_KOMISS,'
      '       OKDP.FC_CODE || '#39' '#39' || OKDP.FC_NAME as FC_OKDP,'
      '       PC.FC_PROD, PC.FC_CERT'
      'FROM'
      '  MED.TMEDIC TMEDIC ,'
      '--      '#9'MED.TMEDICTYPE,'
      '--     '#9'MED.TUCHGR,'
      '--     '#9'MED.TFARMGR, '
      '--     '#9'RLS.VPREPRLS,'
      '--     '#9'RLS.VNOMENRLS,'
      '--     '#9' '#9'MED.TPAYTYPE,'
      '     '#9'MED.TEI,'
      '     '#9'MED.TEI T2,'
      '     '#9'MED.TMASSUNITS,'
      '     '#9'MED.TMEDIC_TSPECIALMEDIC,'
      '     '#9'MED.TSPECIALMEDIC,'
      '     '#9'MED.TSPRAV_OKDP OKDP,'
      
        '     (select -- pfc_value - '#1085#1072#1079#1074#1072#1085#1080#1103' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1077#1081', Sfc_value -' +
        ' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1099
      
        '        p1.FK_ID as PFK_ID, p1.fn_parent as pfn_parent, nvl(p1.f' +
        'c_value, p2.fc_value) as  FC_PROD             -- '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      
        '        ,p2.FK_ID as SFK_ID, p2.fn_parent as Sfn_parent, decode(' +
        'p1.FK_ID, null, null, p2.fc_value) as FC_CERT -- '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090
      
        '      from med.tprodcert  p1, med.tprodcert p2 where p1.fk_id(+)' +
        ' = p2.fn_parent) pc,'
      
        '--     '#9' '#9'(SELECT DISTINCT TT.FK_TUCHGRTYPE  FROM MED.TMO_TUCHGR' +
        'TYPE TT) F'
      
        '        (SELECT COUNT(1) as Count_, fk_medic as parent_medicid f' +
        'rom MED.tmedicomplex mc GROUP BY mc.fk_medic) SostMed,'
      
        '       (select c.*, p.* from med.tcross_table_check c, med.tcros' +
        's_table_params p'
      '        where (c.fk_key2 = med.pkg_medses.get_cur_mogroup) and'
      
        '              (c.fk_cross_params_id = p.fk_id) and p.fc_synonim ' +
        '= '#39'ASSORT_TUCHGR_TMO_GROUP'#39') cp'
      ''
      'WHERE --TMEDIC.FK_TYPE = TMEDICTYPE.FK_ID(+)'
      '-- '#9'AND TMEDIC.UCHGRID = TUCHGR.UCHGRID(+)'
      '-- '#9'AND TMEDIC.FARMGRID = TFARMGR.FARMGRID(+)'
      '-- '#9'AND TMEDIC.FK_NOMEN_RLS = VNOMENRLS.FK_ID(+)'
      '-- '#9'AND VNOMENRLS.FK_PREP = VPREPRLS.FK_ID(+)'
      '--     '#9' '#9'AND TUCHGR.FL_MAT(+) = f.FK_TUCHGRTYPE'
      '--     '#9' '#9'AND TMEDIC.FK_PAYTYPE = TPAYTYPE.FK_ID (+)'
      ' '#9'TMEDIC.EIID = TEI.EIID (+)'
      ' '#9'AND TMEDIC.FK_FPACKID = T2.EIID (+)'
      ' '#9'AND TMEDIC.FK_OKDP = OKDP.FK_ID (+)'
      ' '#9'AND TMEDIC.FK_MASSUNITS = TMASSUNITS.FK_ID (+)  '
      ' '#9'AND TMEDIC.MEDICID = TMEDIC_TSPECIALMEDIC.MEDICID (+)'
      
        ' '#9'AND TMEDIC_TSPECIALMEDIC.FK_SPECIALMEDIC = Tspecialmedic.Fk_Id' +
        ' (+)'
      '      and TMEDIC.FN_MEDICPRODCERTID = pc.SFK_ID(+)'
      ' '#9'AND TMEDIC.FL_VISIBLE = :pVisible'
      
        '    AND ( (instr(nvl(TMEDIC.fc_comment,'#39' '#39'),'#39#1044#1086#1073#1072#1074#1083#1077#1085#1086' '#1074#1088#1072#1095#1086#1084' ('#39 +
        ')=0) or (:MEDIC_FROM_VRACH = 1)) -- '#1089#1082#1088#1099#1074#1072#1077#1084' '#1087#1080#1089#1091#1083#1100#1082#1080' '#1082#1088#1080#1074#1086#1088#1091#1082#1080#1093 +
        ' '#1074#1088#1072#1095#1077#1081
      '    AND TMEDIC.medicid = SostMed.parent_medicid(+)'
      
        '    AND ((:PFK_SKLAD_ID = 0)or(:PFK_SKLAD_ID = TMEDIC.FK_SKLAD_I' +
        'D)or(TMEDIC.FK_SKLAD_ID is null))'
      
        '    and(TMEDIC.UCHGRID = cp.fk_key1(+)) and (nvl(cp.fn_value,1) ' +
        '= 1)'
      '    :pAdditionWhere'
      ''
      '--ORDER BY UPPER(TMEDIC.FC_NAME)')
    ReadBuffer = 300
    Optimize = False
    Variables.Data = {
      0300000004000000110000003A4D454449435F46524F4D5F5652414348030000
      000400000000000000000000000D0000003A50464B5F534B4C41445F49440300
      00000400000000000000000000000F0000003A504144444954494F4E57484552
      45010000000000000000000000090000003A5056495349424C45030000000400
      00000100000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001B0000000700000046435F4E414D45010000000000070000004D4544
      494349440100000000000C000000464B5F4E4F4D454E5F524C53010000000000
      0A00000046435F45414E434F444501000000000007000000464B5F5459504501
      00000000000C00000046435F4D45444943545950450100000000000900000046
      435F554544495A4D0100000000000A000000464B5F465041434B494401000000
      00000F000000464E5F465041434B494E555041434B0100000000000900000046
      435F464544495A4D0100000000000F000000464B5F5350454349414C4D454449
      430100000000000F00000046435F5350454349414C4D45444943010000000000
      07000000464E5F4D4153530100000000000C000000464B5F4D415353554E4954
      530100000000000C00000046435F4D415353554E4954530100000000000B0000
      0046435F4E414D455F4C415401000000000011000000464C5F5052494E545F4C
      41545F4E414D450100000000000700000046435F534F53540100000000000F00
      0000464E5F534F53544D4544434F554E54010000000000070000005543484752
      4944010000000000080000004641524D4752494401000000000019000000464C
      5F56495349424C455F464F525F4E4F545F415054454B410100000000000B0000
      00464B5F534B4C41445F49440100000000000C000000464C5F45515549504D45
      4E5401000000000004000000454949440100000000001500000046435F494E54
      45524E4154494F4E414C5F4E414D450100000000000B000000464B5F47524F55
      505F4C46010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    RefreshOptions = [roAfterUpdate, roAllFields]
    OnApplyRecord = odsMedicsListApplyRecord
    UpdatingTable = 'MED.TMEDIC'
    Session = dmMain.os
    AfterOpen = odsMedicsListAfterOpen
    BeforePost = odsMedicsListBeforePost
    AfterPost = odsMedicsListAfterPost
    AfterScroll = odsMedicsListAfterScroll
    AfterRefresh = odsMedicsListAfterOpen
    Left = 264
    Top = 132
  end
  object dsMedicsList: TDataSource
    DataSet = odsMedicsList
    Left = 338
    Top = 126
  end
  object odsSostMedics: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '       tmedicomplex.ROWID,'
      '       tmedicomplex.fl_tara,'
      '       TMEDIC.FC_NAME,'
      '       TMEDIC.FC_NAME_LAT,'
      '       TMEDIC.MEDICID,'
      '       TEI.FC_NAME AS FC_UEDIZM,'
      '       TMEDIC.FK_FPACKID,'
      '       TMEDIC.FN_FPACKINUPACK,'
      '       T2.FC_NAME AS FC_FEDIZM,'
      '       TMEDIC.FN_MASS AS FN_MASS, '
      '       TMASSUNITS.FK_ID AS FK_MASSUNITS,'
      '       TMASSUNITS.FC_SHORTNAME AS FC_MASSUNITS,'
      '       tmedicomplex.FN_AMOUNT'
      ''
      'FROM'
      '       MED.tmedicomplex,'
      '       MED.TMEDIC,'
      '     '#9'MED.TEI,'
      '     '#9'MED.TEI T2,'
      '     '#9'MED.TMASSUNITS'
      ''
      'WHERE  TMEDIC.EIID = TEI.EIID (+)'
      ' '#9'AND TMEDIC.FK_FPACKID = T2.EIID (+)'
      ' '#9'AND TMEDIC.FK_MASSUNITS = TMASSUNITS.FK_ID (+)  '
      '       AND tmedicomplex.FK_MEDICITEM = TMEDIC.MEDICID '
      '       AND tmedicomplex.FK_MEDIC = :FK_MEDIC'
      'order by tmedicomplex.FN_ORDER')
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A464B5F4D454449430300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000B0000000700000046435F4E414D45010000000000070000004D4544
      494349440100000000000900000046435F554544495A4D0100000000000A0000
      00464B5F465041434B49440100000000000F000000464E5F465041434B494E55
      5041434B0100000000000900000046435F464544495A4D010000000000070000
      00464E5F4D4153530100000000000C000000464B5F4D415353554E4954530100
      000000000C00000046435F4D415353554E4954530100000000000B0000004643
      5F4E414D455F4C415401000000000009000000464E5F414D4F554E5401000000
      0000}
    Cursor = crSQLWait
    Session = dmMain.os
    FilterOptions = [foNoPartialCompare]
    Left = 66
    Top = 280
  end
  object dsSostMedics: TDataSource
    DataSet = odsSostMedics
    Left = 148
    Top = 278
  end
  object sd: TSaveDialog
    DefaultExt = 'xls'
    FileName = #1057#1087#1080#1089#1086#1082' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074'.xls'
    Filter = 'Excel Files (*.xls)|*.xls'
    Left = 496
    Top = 45
  end
  object tmrEANCode: TTimer
    Enabled = False
    Interval = 400
    OnTimer = tmrEANCodeTimer
    Left = 406
    Top = 226
  end
  object pmGrid: TPopupMenu
    Left = 544
    Top = 200
    object N3: TMenuItem
      Action = acSetUchGr
    end
    object N_ChngUchGrp: TMenuItem
      Action = acUchGrChangesList
    end
  end
  object odsUchgr: TOracleDataSet
    SQL.Strings = (
      
        'SELECT ug.FC_UCHGR, ug.UCHGRID, ug.FL_MAT, ug.FK_PHARM, ug.FK_SK' +
        'LAD_ID, ug.fc_quota_code_2, ug.PARENTID,'
      '    TUCHGRTYPE.FC_NAME AS FL_MAT,'
      
        '    med.PKGTMEDIC.GetUchgrFullPathName( ug.UCHGRID) as FC_FULL_U' +
        'CHGR_NAME'
      '  FROM med.TUCHGR ug, med.TUCHGRTYPE'
      '  WHERE UG.FL_MAT = TUCHGRTYPE.FK_ID (+)')
    Optimize = False
    Session = dmMain.os
    Left = 728
    Top = 152
  end
  object dsUchgr: TDataSource
    DataSet = odsUchgr
    Left = 680
    Top = 152
  end
end
