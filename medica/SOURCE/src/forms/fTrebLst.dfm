object frmTrebLst: TfrmTrebLst
  Left = 354
  Top = 172
  Caption = #1057#1087#1080#1089#1086#1082' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1081
  ClientHeight = 396
  ClientWidth = 903
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 903
    Height = 356
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object cxSplitter1: TcxSplitter
      Left = 0
      Top = 184
      Width = 903
      Height = 4
      AlignSplitter = salBottom
      Control = cxGridTrebDpc
    end
    object cxGridTrebDpc: TcxGrid
      Left = 0
      Top = 188
      Width = 903
      Height = 168
      Align = alBottom
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      object cxGridTrebDpcDBTableView1: TcxGridDBTableView
        OnDblClick = cxGridTrebDpcDBTableView1DblClick
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsMedic
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.KeyFieldNames = 'FK_ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = #1050#1086#1083'-'#1074#1086': 0'
            Kind = skCount
            Column = cxGridTrebDpcDBTableView1FC_MEDIC
          end>
        DataController.Summary.SummaryGroups = <>
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnSorting = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Editing = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        Preview.MaxLineCount = 2
        Styles.ContentEven = dmMain.cxStyleGridDetailEvenRow
        Styles.ContentOdd = dmMain.cxStyleGridDetailOddRow
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        object cxGridTrebDpcDBTableView1ROWNUM: TcxGridDBColumn
          Caption = #8470' '#1087'/'#1087
          DataBinding.FieldName = 'ROWNUM'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Width = 50
        end
        object cxGridTrebDpcDBTableView1FC_MEDIC: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_MEDIC'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Width = 288
        end
        object cxGridTrebDpcDBTableView1FC_INTERNATIONAL_NAME: TcxGridDBColumn
          Caption = #1052#1077#1078#1076#1091#1085#1072#1088#1086#1076#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_INTERNATIONAL_NAME'
          Visible = False
          Width = 150
        end
        object cxGridTrebDpcDBTableView1FC_NAME_LAT: TcxGridDBColumn
          Caption = #1051#1072#1090'. '#1085#1072#1079#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_NAME_LAT'
          Visible = False
          Width = 100
        end
        object cxGridTrebDpcDBTableView1FC_EDIZM: TcxGridDBColumn
          Caption = #1045#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'FC_EDIZM'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Width = 83
        end
        object cxGridTrebDpcDBTableView1FN_KOL: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086
          DataBinding.FieldName = 'FN_KOL'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Width = 103
        end
        object cxGridTrebDpcDBTableView1FK_ID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'FK_ID'
          Visible = False
        end
        object cxGridTrebDpcDBTableView1FD_CREATE: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
          DataBinding.FieldName = 'FD_CREATE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DateButtons = []
          Properties.Kind = ckDateTime
          Properties.ReadOnly = True
          Visible = False
        end
        object cxGridTrebDpcDBTableView1FK_CREATE_MO_ID: TcxGridDBColumn
          Caption = #1050#1090#1086' '#1089#1086#1079#1076#1072#1083
          DataBinding.FieldName = 'FK_CREATE_MO_ID'
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
        object cxGridTrebDpcDBTableView1FD_EDIT: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          DataBinding.FieldName = 'FD_EDIT'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DateButtons = []
          Properties.Kind = ckDateTime
          Properties.ReadOnly = True
          Visible = False
        end
        object cxGridTrebDpcDBTableView1FK_EDIT_MO_ID: TcxGridDBColumn
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
      end
      object cxGridTrebDpcLevel1: TcxGridLevel
        GridView = cxGridTrebDpcDBTableView1
      end
    end
    object cxGridTrebLst: TcxGrid
      Left = 0
      Top = 0
      Width = 903
      Height = 184
      Align = alClient
      TabOrder = 2
      LookAndFeel.Kind = lfUltraFlat
      object cxGridTrebLstDBTableView1: TcxGridDBTableView
        OnDblClick = dbTrebLstDblClick
        NavigatorButtons.ConfirmDelete = False
        OnCellClick = cxGridTrebLstDBTableView1CellClick
        OnCustomDrawCell = cxGridTrebLstDBTableView1CustomDrawCell
        DataController.DataSource = dsTreb
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Active = True
        DataController.KeyFieldNames = 'FK_ID'
        DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = #1050#1086#1083'-'#1074#1086': 0'
            Kind = skCount
            Column = cxGridTrebLstDBTableView1FD_DATE
          end>
        DataController.Summary.SummaryGroups = <>
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        OptionsBehavior.CellHints = True
        OptionsBehavior.ImmediateEditor = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Editing = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        Preview.MaxLineCount = 2
        Styles.ContentEven = dmMain.cxStyleGridEvenRow
        Styles.ContentOdd = dmMain.cxStyleGridOddRow
        Styles.Inactive = dmMain.cxStyleGridSelectedRow
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        object cxGridTrebLstDBTableView1FD_DATE: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          DataBinding.FieldName = 'FD_DATE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DateButtons = [btnClear, btnToday]
          Properties.DateOnError = deToday
          Properties.Kind = ckDateTime
          SortIndex = 0
          SortOrder = soDescending
          Width = 46
        end
        object cxGridTrebLstDBTableView1FC_TREB: TcxGridDBColumn
          Caption = #8470' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103
          DataBinding.FieldName = 'FC_TREB'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 100
          Properties.ReadOnly = True
          Width = 57
        end
        object cxGridTrebLstDBTableView1FC_MOFROM: TcxGridDBColumn
          Caption = #1054#1090#1082#1091#1076#1072
          DataBinding.FieldName = 'FC_GROUPFROM_WITH_NAME'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 50
          Properties.ReadOnly = True
          Width = 82
        end
        object cxGridTrebLstDBTableView1FC_MOTO: TcxGridDBColumn
          Caption = #1050#1091#1076#1072
          DataBinding.FieldName = 'FC_GROUPTO_WITH_NAME'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 50
          Properties.ReadOnly = True
          Width = 83
        end
        object cxGridTrebLstDBTableView1FC_COMMENT: TcxGridDBColumn
          Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
          DataBinding.FieldName = 'FC_COMMENT'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 250
          Properties.ReadOnly = True
          Width = 140
        end
        object cxGridTrebLstDBTableView1_FL_RPO: TcxGridDBColumn
          Caption = #1074' '#1056#1055#1054
          DataBinding.FieldName = 'FL_RPO'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Width = 41
        end
        object cxGridTrebLstDBTableView1FC_PROCESSED: TcxGridDBColumn
          Caption = #1057#1090#1072#1090#1091#1089
          DataBinding.FieldName = 'FC_PROCESSED'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 20
          Properties.ReadOnly = True
          Width = 37
        end
        object cxGridTrebLstDBTableView1FL_CITO: TcxGridDBColumn
          Caption = #1057#1088#1086#1095#1085#1086#1077
          DataBinding.FieldName = 'FL_CITO'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Visible = False
        end
        object cxGridTrebLstDBTableView1FK_ID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'FK_ID'
          Visible = False
        end
        object cxGridTrebLstDBTableView1FK_FINSOURCE_ID: TcxGridDBColumn
          Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
          DataBinding.FieldName = 'FK_FINSOURCE_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'FK_ID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_NAME'
            end>
          Properties.ListSource = dmMain.dsTFinSource
          Visible = False
          VisibleForCustomization = False
          Width = 78
        end
        object cxGridTrebLstDBTableView1_FL_ECP1: TcxGridDBColumn
          Caption = #1069#1062#1055' 1'
          DataBinding.FieldName = 'FL_ECP1'
          PropertiesClassName = 'TcxSpinEditProperties'
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
          Width = 40
        end
        object cxGridTrebLstDBTableView1_FL_ECP2: TcxGridDBColumn
          Caption = #1069#1062#1055' 2'
          DataBinding.FieldName = 'FL_ECP2'
          PropertiesClassName = 'TcxSpinEditProperties'
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
          Width = 40
        end
        object cxGridTrebLstDBTableView1_FL_ECP3: TcxGridDBColumn
          Caption = #1069#1062#1055' 3'
          DataBinding.FieldName = 'FL_ECP3'
          PropertiesClassName = 'TcxSpinEditProperties'
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
          Width = 40
        end
        object cxGridTrebLstDBTableView1_ECP1_NOTE: TcxGridDBColumn
          Caption = #1055#1086#1076#1087#1080#1089#1100' 1'
          DataBinding.FieldName = 'ECP1_NOTE'
          Options.Editing = False
          VisibleForCustomization = False
          Width = 64
        end
        object cxGridTrebLstDBTableView1_ECP2_NOTE: TcxGridDBColumn
          Caption = #1055#1086#1076#1087#1080#1089#1100' 2'
          DataBinding.FieldName = 'ECP2_NOTE'
          Options.Editing = False
          VisibleForCustomization = False
          Width = 63
        end
        object cxGridTrebLstDBTableView1_ECP3_NOTE: TcxGridDBColumn
          Caption = #1055#1086#1076#1087#1080#1089#1100' 3'
          DataBinding.FieldName = 'ECP3_NOTE'
          Options.Editing = False
          VisibleForCustomization = False
          Width = 64
        end
        object cxGridTrebLstDBTableView1_ECP1_FK_ID: TcxGridDBColumn
          DataBinding.FieldName = 'ECP1_FK_ID'
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
        end
        object cxGridTrebLstDBTableView1_ECP2_FK_ID: TcxGridDBColumn
          DataBinding.FieldName = 'ECP2_FK_ID'
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
        end
        object cxGridTrebLstDBTableView1_ECP3_FK_ID: TcxGridDBColumn
          DataBinding.FieldName = 'ECP3_FK_ID'
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
        end
        object cxGridTrebLstDBTableView1FL_EDIT: TcxGridDBColumn
          Caption = #1055#1086#1076#1087#1080#1089#1100
          DataBinding.FieldName = 'FC_PODPIS'
          Width = 30
        end
        object cxGridTrebLstDBTableView1fc_num_doc_str: TcxGridDBColumn
          Caption = #1056#1072#1089#1093'.'#1076#1086#1082#1091#1084#1077#1085#1090
          DataBinding.FieldName = 'fc_num_doc_str'
        end
      end
      object cxGridTrebLstLevel1: TcxGridLevel
        GridView = cxGridTrebLstDBTableView1
      end
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 903
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 899
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 890
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 73
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object tbuSelect: TToolButton
        Left = 0
        Top = 0
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1077
        Caption = #1042#1099#1073#1088#1072#1090#1100
        ImageIndex = 30
        OnClick = tbuSelectClick
      end
      object ToolButton11: TToolButton
        Left = 73
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbuAdd: TToolButton
        Left = 81
        Top = 0
        Action = acAdd
        DropdownMenu = pmTreb
        Style = tbsDropDown
      end
      object tbuEdit: TToolButton
        Left = 167
        Top = 0
        Action = acEdit
      end
      object tbuDel: TToolButton
        Left = 240
        Top = 0
        Action = acDelete
      end
      object ToolButton4: TToolButton
        Left = 313
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 47
        Style = tbsSeparator
      end
      object tbuPrint: TToolButton
        Left = 321
        Top = 0
        Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1077
        Caption = #1055#1077#1095#1072#1090#1100
        DropdownMenu = pmPrint
        ImageIndex = 32
        Style = tbsDropDown
        OnClick = acPrintTrebExecute
      end
      object ToolButton8: TToolButton
        Left = 407
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbuQuota: TToolButton
        Left = 415
        Top = 0
        Action = acQuota
        Visible = False
      end
      object tbuQuotaSep: TToolButton
        Left = 488
        Top = 0
        Width = 8
        ImageIndex = 2
        Style = tbsSeparator
        Visible = False
      end
      object tbuSign: TToolButton
        Left = 496
        Top = 0
        Action = acSign
      end
      object tbuSignSep: TToolButton
        Left = 569
        Top = 0
        Width = 8
        Caption = 'tbuSignSep'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbuRefresh: TToolButton
        Left = 577
        Top = 0
        Action = acRefresh
      end
      object ToolButton1: TToolButton
        Left = 650
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object Panel2: TPanel
        Left = 658
        Top = 0
        Width = 109
        Height = 36
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object abuSetDocPeriod: TJvArrowButton
          Left = 95
          Top = 0
          Width = 14
          Height = 36
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076' '#1080#1079' '#1089#1087#1080#1089#1082#1072
          Align = alRight
          ArrowWidth = 15
          DropDown = pmTrebFilterPeriod
          Flat = True
          FillFont.Charset = DEFAULT_CHARSET
          FillFont.Color = clWindowText
          FillFont.Height = -11
          FillFont.Name = 'MS Sans Serif'
          FillFont.Style = []
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 95
          Height = 36
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object dedDate1: TcxDateEdit
            Left = 18
            Top = 0
            Hint = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
            EditValue = 0d
            Enabled = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DateButtons = [btnToday]
            Properties.InputKind = ikMask
            Properties.PostPopupValueOnTab = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnEditValueChanged = dedDate1PropertiesEditValueChanged
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            OnKeyDown = dedDate1KeyDown
            Width = 77
          end
          object dedDate2: TcxDateEdit
            Left = 18
            Top = 16
            Hint = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
            EditValue = 0d
            Enabled = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DateButtons = [btnToday]
            Properties.InputKind = ikMask
            Properties.PostPopupValueOnTab = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnEditValueChanged = dedDate1PropertiesEditValueChanged
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 3
            OnKeyDown = dedDate1KeyDown
            Width = 77
          end
          object chbDate1: TcxCheckBox
            Left = 0
            Top = 0
            ParentColor = False
            Style.Color = clBtnFace
            TabOrder = 0
            OnClick = chbDate1Click
            Width = 21
          end
          object chbDate2: TcxCheckBox
            Left = 0
            Top = 16
            ParentColor = False
            Style.Color = clBtnFace
            TabOrder = 2
            OnClick = chbDate2Click
            Width = 21
          end
        end
      end
      object ToolButton9: TToolButton
        Left = 767
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbuClose: TToolButton
        Left = 775
        Top = 0
        Action = acClose
      end
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 434
    Top = 74
    object acAddByNaznList: TAction
      Caption = #1055#1086' '#1083#1080#1089#1090#1072#1084' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1081
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074' '#1087#1086' '#1083#1080#1089#1090#1072#1084' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1081' '#1074#1088#1072#1095#1077#1081
      OnExecute = acAddByNaznListExecute
    end
    object acAddManual: TAction
      Caption = #1048#1079' '#1089#1087#1080#1089#1082#1072' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074
      OnExecute = acAddManualExecute
    end
    object acFillMinZapas: TAction
      Caption = #1053#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1077' '#1084#1080#1085'. '#1079#1072#1087#1072#1089#1072
      Hint = #1053#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1077' '#1084#1080#1085'. '#1079#1072#1087#1072#1089#1072
      OnExecute = acFillMinZapasExecute
    end
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103
      ImageIndex = 48
      ShortCut = 115
      OnExecute = acAddExecute
    end
    object acEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103
      ImageIndex = 47
      ShortCut = 114
      OnExecute = acEditExecute
    end
    object acDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103
      ImageIndex = 22
      ShortCut = 119
      OnExecute = acDeleteExecute
    end
    object acPrintTreb: TAction
      Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1077
      ImageIndex = 32
      ShortCut = 120
      OnExecute = acPrintTrebExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 1
      ShortCut = 27
      OnExecute = acCloseExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1089#1087#1080#1089#1082#1072' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1081
      ImageIndex = 15
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
    object acSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1077
      ImageIndex = 30
      ShortCut = 13
      OnExecute = acSelectExecute
    end
    object acAddTrebByPattern: TAction
      Caption = #1055#1086' '#1086#1073#1088#1072#1079#1094#1091
      OnExecute = acAddTrebByPatternExecute
    end
    object acNewClearTreb: TAction
      Caption = #1053#1086#1074#1086#1077
      Enabled = False
      ImageIndex = 48
      Visible = False
      OnExecute = acNewClearTrebExecute
    end
    object acPrintTrebNakl: TAction
      Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077'-'#1085#1072#1082#1083#1072#1076#1085#1072#1103
      OnExecute = acPrintTrebNaklExecute
    end
    object acQuota: TAction
      Caption = #1050#1074#1086#1090#1072
      ImageIndex = 65
      OnExecute = acQuotaExecute
    end
    object acAddForRPO: TAction
      Caption = #1076#1083#1103' '#1056#1055#1054
      Hint = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1056#1055#1054
      Visible = False
      OnExecute = acAddForRPOExecute
    end
    object acSign: TAction
      Caption = '  '#1059#1090#1074#1077#1088#1076#1080#1090#1100'  '
      ImageIndex = 47
      OnExecute = acSignExecute
    end
  end
  object pmTreb: TPopupMenu
    Left = 10
    Top = 72
    object N1: TMenuItem
      Action = acAddByNaznList
    end
    object acAddManual1: TMenuItem
      Action = acAddManual
      Caption = #1048#1079' '#1072#1089#1089#1086#1088#1090#1080#1084#1077#1085#1090#1072
    end
    object N9: TMenuItem
      Action = acAddForRPO
    end
    object N2: TMenuItem
      Action = acFillMinZapas
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Action = acAddTrebByPattern
    end
  end
  object odsTreb: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  T.rowid,'
      '  T.*,'
      '  decode(T.FL_EDIT,0,'#39#1044#1072#39','#39#1053#1077#1090#39') FC_PODPIS,'
      '  TRUNC(T.FD_DATE) as TRUNC_DATE,'
      '  MED.GET_TREBSTATUS(T.fk_id) AS FK_PROCESSED,'
      
        '  decode(MED.GET_TREBSTATUS(T.fk_id),-1,'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39',0,'#39#1053#1077' '#1086#1090#1087 +
        #1091#1097#1077#1085#1086#39',1,'#39#1050#1086#1088#1088#1077#1082#1090#1080#1088#1091#1077#1090#1089#1103#39',2,'#39#1054#1090#1087#1091#1097#1077#1085#1086#39') AS FC_PROCESSED,'
      '  T.FL_RPO,'
      ' '
      '  NVL(TMO.FC_NAME,'#39#39') as FC_MOTO,'
      '  NVL(M2.FC_NAME,'#39#39')  AS FC_MOFROM,'
      
        '  decode(NVL(TMO.FC_NAME,'#39#39'), '#39#39', MOGR_TO.FC_GROUP, MOGR_TO.FC_G' +
        'ROUP||'#39' ('#39'||TMO.FC_NAME||'#39')'#39' ) AS FC_GROUPTO_WITH_NAME,'
      
        '  decode(NVL(M2.FC_NAME,'#39#39'), '#39#39', MOGR_FROM.FC_GROUP, MOGR_FROM.F' +
        'C_GROUP||'#39' ('#39'||M2.FC_NAME||'#39')'#39' ) AS FC_GROUPFROM_WITH_NAME,'
      '  MOGR_FROM.FC_GROUP as FC_GROUPFROM,'
      '  '
      
        '  decode(t.fk_dpid,NULL,'#39#39','#39'N '#39'||d.fc_doc||'#39' '#1086#1090' '#39'||to_char(d.fd_' +
        'data,'#39'dd.mm.yyyy'#39') ) as fc_num_doc_str,'
      ''
      
        '  :ECP1_RULE_ID as ECP1_RULE_ID, :ECP2_RULE_ID as ECP2_RULE_ID, ' +
        ':ECP3_RULE_ID as ECP3_RULE_ID'
      '--ECP  ,ECP1.fk_id as ECP1_FK_ID, ECP1.ECP1_NOTE, 0 as FL_ECP1 '
      '--ECP  ,ECP2.fk_id as ECP2_FK_ID, ECP2.ECP2_NOTE, 0 as FL_ECP2'
      '--ECP  ,ECP3.fk_id as ECP3_FK_ID, ECP3.ECP3_NOTE, 0 as FL_ECP3 '
      ''
      ''
      
        ' FROM MED.TTREB T, MED.TMO, MED.TMO M2, MED.TMO_GROUP MOGR_FROM,' +
        ' MED.TMO_GROUP MOGR_TO, med.tdocs d'
      ' '
      
        '--ECP ,(SELECT ds.fk_maintableid, ds.fk_id,  --, ds.fd_date, ds.' +
        'fk_sotrid, ds.fk_peopleid, ds.fk_keyid,  '
      
        '--ECP          s.fc_fam||'#39' '#39'||substr(s.FC_NAME, 1,1)||'#39'. '#39'||subs' +
        'tr(s.FC_OTCH, 1,1)||'#39'.  '#39'||TO_CHAR(ds.fd_date, '#39'dd.mm.yyyy HH24:' +
        'MI:SS'#39') as ECP1_NOTE'
      
        '--ECP   FROM asu.tdigital_signature ds, login.tsotr s, med.ttreb' +
        ' t1'
      '--ECP   WHERE ds.fk_sotrid = s.fk_id'
      '--ECP     and t1.fk_id = ds.fk_maintableid'
      
        '--ECP     AND TRUNC(MED.PKG_MEDSES.GET_DATA1) <= T1.FD_DATE AND ' +
        'T1.FD_DATE < TRUNC(MED.PKG_MEDSES.GET_DATA2+1)'
      
        '--ECP     AND MED.PKG_MEDSES.get_cur_mogroup_by_cur_mo in (T1.fk' +
        '_mogroupid_from, T1.fk_mogroupid_to)'
      '--ECP     and ds.fk_sql_ruleid = :ECP1_RULE_ID  '
      '--ECP  ) ECP1'
      ''
      
        '--ECP ,(SELECT ds.fk_maintableid, ds.fk_id,  --, ds.fd_date, ds.' +
        'fk_sotrid, ds.fk_peopleid, ds.fk_keyid,  '
      
        '--ECP         s.fc_fam||'#39' '#39'||substr(s.FC_NAME, 1,1)||'#39'. '#39'||subst' +
        'r(s.FC_OTCH, 1,1)||'#39'.  '#39'||TO_CHAR(ds.fd_date, '#39'dd.mm.yyyy HH24:M' +
        'I:SS'#39') as ECP2_NOTE'
      
        '--ECP   FROM asu.tdigital_signature ds, login.tsotr s, med.ttreb' +
        ' t2'
      '--ECP   WHERE ds.fk_sotrid = s.fk_id'
      '--ECP     and t2.fk_id = ds.fk_maintableid'
      
        '--ECP     AND TRUNC(MED.PKG_MEDSES.GET_DATA1) <= T2.FD_DATE AND ' +
        'T2.FD_DATE < TRUNC(MED.PKG_MEDSES.GET_DATA2+1)'
      
        '--ECP     AND MED.PKG_MEDSES.get_cur_mogroup_by_cur_mo in (T2.fk' +
        '_mogroupid_from, T2.fk_mogroupid_to)'
      '--ECP     and ds.fk_sql_ruleid = :ECP2_RULE_ID  ) ECP2'
      '   '
      
        '--ECP ,(SELECT ds.fk_maintableid, ds.fk_id,  --, ds.fd_date, ds.' +
        'fk_sotrid, ds.fk_peopleid, ds.fk_keyid,  '
      
        '--ECP          s.fc_fam||'#39' '#39'||substr(s.FC_NAME, 1,1)||'#39'. '#39'||subs' +
        'tr(s.FC_OTCH, 1,1)||'#39'.  '#39'||TO_CHAR(ds.fd_date, '#39'dd.mm.yyyy HH24:' +
        'MI:SS'#39') as ECP3_NOTE'
      
        '--ECP   FROM asu.tdigital_signature ds, login.tsotr s, med.ttreb' +
        ' t3'
      '--ECP   WHERE ds.fk_sotrid = s.fk_id'
      '--ECP    and t3.fk_id = ds.fk_maintableid'
      
        '--ECP    AND TRUNC(MED.PKG_MEDSES.GET_DATA1) <= T3.FD_DATE AND T' +
        '3.FD_DATE < TRUNC(MED.PKG_MEDSES.GET_DATA2+1)'
      
        '--ECP    AND MED.PKG_MEDSES.get_cur_mogroup_by_cur_mo in (T3.fk_' +
        'mogroupid_from, T3.fk_mogroupid_to) '
      '--ECP    and ds.fk_sql_ruleid = :ECP3_RULE_ID ) ECP3'
      '      '
      ' WHERE T.FK_MOTOID = TMO.MOID (+)'
      '  AND T.FK_MOFROMID = M2.MOID (+)'
      '  AND T.fk_mogroupid_from = MOGR_FROM.GROUPID'
      '  AND T.fk_mogroupid_to   = MOGR_TO.GROUPID'
      ''
      '  and t.fk_dpid = d.dpid(+)'
      ''
      '--ECP  AND t.fk_id = ECP1.fk_maintableid(+)'
      '--ECP  AND t.fk_id = ECP2.fk_maintableid(+)'
      '--ECP  AND t.fk_id = ECP3.fk_maintableid(+)'
      ''
      
        '  AND MED.PKG_MEDSES.get_cur_mogroup_by_cur_mo in (T.fk_mogroupi' +
        'd_from, T.fk_mogroupid_to)'
      
        '--  AND TRUNC(MED.PKG_MEDSES.GET_DATA1) <= T.FD_DATE AND T.FD_DA' +
        'TE < TRUNC(MED.PKG_MEDSES.GET_DATA2+1) '
      
        '  AND ((TRUNC(:DATE1) <= T.FD_DATE  or :FILTERED_BY_DATE1 = 0) a' +
        'nd (T.FD_DATE < TRUNC(:DATE2+1) or :FILTERED_BY_DATE2 = 0))'
      ''
      ' ORDER BY FD_DATE DESC, FC_TREB ASC')
    Optimize = False
    Variables.Data = {
      03000000070000000D0000003A454350315F52554C455F494403000000000000
      00000000000D0000003A454350325F52554C455F494403000000000000000000
      00000D0000003A454350335F52554C455F494403000000000000000000000006
      0000003A44415445310C0000000000000000000000120000003A46494C544552
      45445F42595F4441544531030000000000000000000000060000003A44415445
      320C0000000000000000000000120000003A46494C54455245445F42595F4441
      544532030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000140000000A00000046435F434F4D4D454E5401000000000005000000
      464B5F49440100000000000700000046435F5452454201000000000007000000
      46445F444154450100000000000C000000464B5F4D4F4F574E45524944010000
      00000009000000464B5F4D4F544F49440100000000000B000000464B5F4D4F46
      524F4D494401000000000007000000464B5F445049440100000000000C000000
      46435F50524F4345535345440100000000000700000046435F4D4F544F010000
      0000000900000046435F4D4F46524F4D0100000000000C000000464B5F50524F
      4345535345440100000000000C000000464B5F4D4F47524F5550494401000000
      000011000000464B5F4D4F47524F555049445F46524F4D0100000000000F0000
      00464B5F4D4F47524F555049445F544F01000000000007000000464C5F434954
      4F0100000000000C00000046435F47524F555046524F4D010000000000140000
      0046435F47524F5550544F5F574954485F4E414D450100000000001600000046
      435F47524F555046524F4D5F574954485F4E414D450100000000000A00000054
      52554E435F44415445010000000000}
    Cursor = crSQLWait
    OnApplyRecord = odsTrebApplyRecord
    Session = dmMain.os
    AfterScroll = odsTrebAfterScroll
    Left = 118
    Top = 80
  end
  object dsTreb: TDataSource
    DataSet = odsTreb
    Left = 117
    Top = 132
  end
  object odsReport: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWNUM, A.*'
      'FROM'
      '(SELECT ALL_MEDICS.MEDICID,'
      
        '       DECODE(M.FL_PRINT_LAT_NAME, 1,M.FC_NAME_LAT, M.FC_NAME) a' +
        's FC_MEDIC_NAME,'
      '       E.FC_NAME as FC_EDIZM_NAME,'
      '       TREB_MEDICS.FN_TREB_KOL,'
      
        '--       ASU.get_countstr(NVL(TREB_MEDICS.FN_TREB_KOL, 0)) AS FC' +
        '_TREB_KOL,'
      '--       null as FN_VIDANO_KOL,'
      '       VIDANO_MEDICS.FN_VIDANO_KOL,'
      '       '
      '       VIDANO_MEDICS.FN_VIDANO_SUM, '
      
        '       DECODE(VIDANO_MEDICS.FN_VIDANO_KOL, 0,0, ROUND((VIDANO_ME' +
        'DICS.FN_VIDANO_SUM/VIDANO_MEDICS.FN_VIDANO_KOL),2)) as FN_AVG_PR' +
        'ICE,'
      '       T.fk_dpid'
      '       '
      'FROM'
      '('
      'SELECT td.fk_medicid as MEDICID  '
      'FROM  MED.TTreb t, MED.TTreb_Dpc td'
      'WHERE --t.fk_dpid = :ADPID'
      '      t.fk_id = :FK_TREBID'
      '  AND td.fk_trebid = t.fk_id'
      'UNION'
      'SELECT  K.medicid as MEDICID'
      'FROM'
      'MED.TDPC DPC, MED.TKART K, MED.TTreb t'
      'WHERE --DPC.dpid = :ADPID'
      '      t.fk_id = :FK_TREBID'
      '  AND DPC.dpid = t.fk_dpid'
      '  AND DPC.kartid = K.kartid  '
      ') ALL_MEDICS, -- '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099', '#1079#1072#1087#1088#1086#1096#1077#1085#1085#1099#1077' '#1080' '#1074#1099#1076#1072#1085#1085#1099#1077
      ''
      '(SELECT td.fk_medicid as MEDICID, sum(td.fn_kol) as FN_TREB_KOL'
      'FROM  MED.TTreb t, MED.TTreb_Dpc td'
      'WHERE --t.fk_dpid = :ADPID'
      '      t.fk_id = :FK_TREBID'
      '  AND td.fk_trebid = t.fk_id'
      
        'GROUP BY td.fk_medicid) TREB_MEDICS, -- '#1079#1072#1090#1088#1077#1073#1086#1074#1072#1085#1085#1099#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090 +
        #1099
      ''
      '(SELECT  K.medicid,'
      '        sum(DPC.fn_kol) as FN_VIDANO_KOL,'
      '        sum(DPC.fn_kol*K.fn_price) as FN_VIDANO_SUM'
      'FROM'
      'MED.TDPC DPC, MED.TKART K, MED.TTreb t'
      'WHERE t.fk_id = :FK_TREBID'
      '  AND DPC.dpid = t.fk_dpid'
      '  AND DPC.kartid = K.kartid'
      'GROUP BY K.medicid  ) VIDANO_MEDICS, -- '#1074#1099#1076#1072#1085#1085#1099#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099
      'MED.TMEDIC M, MED.TEI E, MED.TTREB T'
      ''
      'WHERE'
      '    ALL_MEDICS.MEDICID = TREB_MEDICS.MEDICID(+)'
      'AND ALL_MEDICS.MEDICID = VIDANO_MEDICS.MEDICID(+)'
      'AND ALL_MEDICS.MEDICID = M.MEDICID -- '#1076#1086#1089#1090#1072#1077#1084' '#1080#1084#1103' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
      'AND M.EIID = E.EIID(+) -- '#1080' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1091#1087#1072#1082#1086#1074#1082#1080
      'AND T.fk_id = :FK_TREBID'
      'ORDER BY LOWER(M.FC_NAME)'
      ') A')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A464B5F54524542494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000900000006000000524F574E554D010000000000070000004D454449
      4349440100000000000D00000046435F4D454449435F4E414D45010000000000
      0D00000046435F4544495A4D5F4E414D450100000000000B000000464E5F5452
      45425F4B4F4C0100000000000D000000464E5F564944414E4F5F4B4F4C010000
      0000000D000000464E5F564944414E4F5F53554D0100000000000C000000464E
      5F4156475F505249434501000000000007000000464B5F445049440100000000
      00}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 272
    Top = 172
  end
  object frDBdsTreb: TfrDBDataSet
    DataSet = odsReport
    Left = 272
    Top = 122
  end
  object frTreb: TfrReport
    Dataset = frDBdsTreb
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    PrintIfEmpty = False
    ShowProgress = False
    StoreInDFM = True
    Title = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077
    RebuildPrinter = False
    OnGetValue = frTrebGetValue
    OnUserFunction = frTrebUserFunction
    OnObjectClick = frTrebObjectClick
    OnMouseOverObject = frTrebMouseOverObject
    Left = 272
    Top = 78
    ReportForm = {
      19000000631F0000190000FFFF01000100FFFFFFFFFF09000000340800009A0B
      00002400000024000000240000002400000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      00001C000000F6020000B50000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D004D61737465
      72486561646572310002010000000044010000F6020000320000007000040001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200E40200000B004D617374657244617461310002010000000090010000F602
      0000110000003900050001000000000000000000FFFFFF1F000000000A006672
      44426473547265620000000007000500626567696E0D77002F2F206966204649
      454C4449534E554C4C285B6F64735265706F72742E22464E5F564944414E4F5F
      4B4F4C225D29207468656E2046435F545245425F4B4F4C203A3D20272D272065
      6C73652046435F545245425F4B4F4C203A3D205B6F64735265706F72742E2246
      4E5F564944414E4F5F4B4F4C225D3B0D60002F2F20206966205B46494E414C50
      4153535D20616E6420285B50414745235D203D205B544F54414C50414745535D
      2D312920414E4420285B4652454553504143455D203C205265706F727453756D
      6D617279312E48656967687429207468656E0D0E002F2F202020204E65775061
      67653B0D1D002F2F202020207768696C6520467265655370616365203E203230
      20646F0D19002F2F20202020202053686F7742616E64284368696C6431293B0D
      0300656E6400FFFF000000000002000000010000000000000001000000C80000
      0014000000010000000000000200510300000D004D6173746572466F6F746572
      3100020100000000C0010000F602000009010000300006000100000000000000
      0000FFFFFF1F00000000000000000000000000FFFF0000000000020000000100
      00000000000001000000C800000014000000010000000000000200BC0300000B
      0050616765466F6F7465723100020100000000F4030000F60200001500000030
      00030001000000000000000000FFFFFF1F00000000000000000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      0000000000006B04000006004D656D6F3133000200240000007D000000740000
      00140000000300000001000000000000000000FFFFFF1F2C0200000000000100
      0C00D2D0C5C1CEC2C0CDC8C520B90003000500626567696E0D1400202046435F
      4E41494D5F4B4F4C203A3D2027273B0D0300656E6400FFFF0000000000020000
      0001000000010500417269616C000A00000002000000000008000000CC000200
      00000000FFFFFF0000000002000000000000000000FE04000006004D656D6F31
      34000200980000007D000000D000000014000000030000000100000000000000
      0000FFFFFF1F2C020000000000010014005B6F6473547265622E2246435F5452
      4542225D2000000000FFFF00000000000200000001000000000500417269616C
      000A00000004000000000008000000CC00020000000000FFFFFF000000000200
      00000000000000008805000006004D656D6F313900020024000000B20000004D
      000000140000000300000001000000000000000000FFFFFF1F2C020000000000
      01000B00D7E5F0E5E720EAEEE3EE3A00000000FFFF0000000000020000000100
      0000000500417269616C000A00000000000000000010000000CC000200000000
      00FFFFFF00000000020000000000000000001C06000006004D656D6F32300002
      0070000000B20000005E020000140000000300000001000000000000000000FF
      FFFF1F2C020000000000010015005B6F6473547265622E2246435F4D4F46524F
      4D225D00000000FFFF00000000000200000001000000000500417269616C000A
      00000004000000000008000000CC00020000000000FFFFFF0000000002000000
      000000000000A706000006004D656D6F343500020047000000440100001D0100
      003200000003000F002C010000000000000000FFFFFF1F2C0200000000000100
      0C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF000000000002000000010000
      00000500417269616C00090000000200000000000A000000CC00020000000000
      FFFFFF00000000020000000000000000002B07000006004D656D6F3232000200
      2400000044010000230000003200000003000F002C010000000000000000FFFF
      FF1F2C02000000000001000500B920EF2FEF00000000FFFF0000000000020000
      0001000000000500417269616C00090000000200000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000B507000006004D656D6F32
      330002001F020000440100004A0000003200000003000F002C01000000000000
      0000FFFFFF1F2C02000000000002000500D6E5EDE02C0D0300F0F3E100000000
      FFFF00000000000200000001000000000500417269616C000900000002000000
      00000A000000CC00020000000000FFFFFF000000000200000000000000000042
      08000006004D656D6F33300002008E0100004401000046000000320000000100
      0F002C010000000000000000FFFFFF1F2C02000000000002000500D2F0E5E12E
      0D0600EAEEEB2DE2EE00000000FFFF0000000000020000000100000000050041
      7269616C00090000000200000000000A000000CC00020000000000FFFFFF0000
      000002000000000000000000CF08000006004D656D6F3331000200D401000044
      0100004B0000003200000003000F002C010000000000000000FFFFFF1F2C0200
      0000000002000500D4E0EAF22E0D0600EAEEEB2DE2EE00000000FFFF00000000
      000200000001000000000500417269616C00090000000200000000000A000000
      CC00020000000000FFFFFF00000000020000000000000000005A09000006004D
      656D6F33320002006902000044010000670000003200000003000F002C010000
      000000000000FFFFFF1F2C02000000000002000600D1F3ECECE02C0D0300F0F3
      E100000000FFFF00000000000200000001000000000500417269616C00090000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000E109000006004D656D6F323600020064010000440100002A00000032
      00000007000F002C010000000000000000FFFFFF1F2C02000000000001000800
      C5E42E20E8E7EC2E00000000FFFF000000000002000000010000000005004172
      69616C00090000000200000000000A000000CC00020000000000FFFFFF000000
      0002000000000000000000990A000006004D656D6F3237000200470000009001
      00001D0100001100000003000F002C010000000000000000FFFFFF1F2C020000
      00000001001B005B6F64735265706F72742E2246435F4D454449435F4E414D45
      225D0003000500626567696E0D0E0020207354656D70203A3D2027273B0D0300
      656E6400FFFF00000000000200000001000000000500417269616C000A000000
      00000000000008000000CC00020000000000FFFFFF0000000002000000000000
      000000440B000006004D656D6F32380002002400000090010000230000001100
      000003000F002C010000000000000000FFFFFF1F2C020000000000010007005B
      4C494E45235D0003000500626567696E0D150020204E61696D4B6F6C203A3D20
      5B4C494E45235D3B0D0300656E6400FFFF000000000002000000010000000005
      00417269616C000A0000000000000000000A000000CC00020000000000FFFFFF
      0000000002000000000000000000F70B000006004D656D6F32390002001F0200
      00900100004A0000001100000003000F002C010000000000000000FFFFFF1F2C
      02030100000001001A005B6F64735265706F72742E22464E5F4156475F505249
      4345225D00000000FFFF00000000000200000001000000000500417269616C00
      0A00000000000000000009000000CC000000FFFFFF00FFFFFF1F1A005B6F6473
      5265706F72742E22464B5F44504944225D203C3D203000020000000000000000
      008F0C000006004D656D6F33350002008E010000900100004600000011000000
      01000F002C010000000000000000FFFFFF1F2C020201000000010019005B6F64
      735265706F72742E22464E5F545245425F4B4F4C225D00000000FFFF00000000
      000200000001000000000500417269616C000A0000000000000000000A000000
      CC00020000000000FFFFFF0000000002000000000000000000430D000006004D
      656D6F3336000200D4010000900100004B0000001100000003000F002C010000
      000000000000FFFFFF1F2C02020100000001001B005B6F64735265706F72742E
      22464E5F564944414E4F5F4B4F4C225D00000000FFFF00000000000200000001
      000000000500417269616C000A0000000000000000000A000000CC000000FFFF
      FF00FFFFFF1F1A005B6F64735265706F72742E22464B5F44504944225D203C3D
      20300002000000000000000000F70D000006004D656D6F333700020069020000
      90010000670000001100000003000F002C010000000000000000FFFFFF1F2C02
      030100000001001B005B6F64735265706F72742E22464E5F564944414E4F5F53
      554D225D00000000FFFF00000000000200000001000000000500417269616C00
      0A00000000000000000009000000CC000000FFFFFF00FFFFFF1F1A005B6F6473
      5265706F72742E22464B5F44504944225D203C3D203000020000000000000000
      00910E000006004D656D6F333800020064010000900100002A00000011000000
      07000F002C010000000000000000FFFFFF1F2C02000000000001001B005B6F64
      735265706F72742E2246435F4544495A4D5F4E414D45225D00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000A00
      0000CC00020000000000FFFFFF00000000020000000000000000001B0F000006
      004D656D6F343000020025000000240200004A00000014000000030000000100
      0000000000000000FFFFFF1F2C02000000000001000B00C7E0F2F0E5E1EEE2E0
      EB3A00000000FFFF00000000000200000001000000000500417269616C000900
      000000000000000008000000CC00020000000000FFFFFF000000000200000000
      0000000000A20F000006004D656D6F3431000200980100002202000042000000
      140000000300000001000000000000000000FFFFFF1F2C020000000000010008
      00CFEEEBF3F7E8EB3A00000000FFFF0000000000020000000100000000050041
      7269616C00090000000000000000000A000000CC00020000000000FFFFFF0000
      0000020000000000000000001F10000006004D656D6F34370002006D00000037
      02000064000000140000000300080001000000000000000000FFFFFF1F2C0200
      00000000000000000000FFFF0000000000020000000100000000050041726961
      6C000A0000000000000000000A000000CC00020000000000FFFFFF0000000002
      000000000000000000AA10000006004D656D6F3530000200890100005A000000
      49010000140000000300000001000000000000000000FFFFFF1F2C0200000000
      0001000C005B7661725F73656E6465725D00000000FFFF000000000002000000
      01000000020500417269616C000B00000004000000000009000000CC00020000
      000000FFFFFF00000000020000000000000000004111000006004D656D6F3531
      000200240000005A000000390100001400000003000000010000000000000000
      00FFFFFF1F2C020000000000010018005B6F6473547265622E2246435F47524F
      555046524F4D225D00000000FFFF000000000002000000010000000105004172
      69616C000B00000004000000000008000000CC00020000000000FFFFFF000000
      0002000000000000000000CE11000006004D656D6F3137000200240000003500
      0000AE020000200000000300000001000000000000000000FFFFFF1F2C020000
      00000001000E005B7661725F72656365697665725D00000000FFFF0000000000
      0200000001000000040500417269616C000B00000004000000000000000000CC
      00020000000000FFFFFF00000000020000000000000000005312000006004D65
      6D6F353200020024000000C0010000450200001100000003000F002C01000000
      0000000000FFFFFF1F2C02000000000001000600C8F2EEE3EE3A00000000FFFF
      00000000000200000001000000000500417269616C000A000000020000000000
      09000000CC00020000000000FFFFFF0000000002000000000000000000F41200
      0006004D656D6F353300020069020000C0010000670000001100000003000F00
      2C010000000000000000FFFFFF1F2C020000000000010022005B53554D285B6F
      64735265706F72742E22464E5F564944414E4F5F53554D225D295D00000000FF
      FF00000000000200000001000000000500417269616C000A0000000200000000
      0009000000CC00020000000000FFFFFF00000000020000000000000000008813
      000006004D656D6F3538000200D100000027020000B100000024000000030000
      0001000000000000000000FFFFFF1F2C020000000000010015005B6F64735472
      65622E2246435F4D4F46524F4D225D00000000FFFF0000000000020000000100
      0000000500417269616C000A00000000000000000000000000CC000200000000
      00FFFFFF00000000020000000000000000001C14000006004D656D6F36300002
      00360200002902000098000000240000000300000001000000000000000000FF
      FFFF1F2C020000000000010015005B6F6473547265622E2246435F4D4F46524F
      4D225D00000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000000000000CC00020000000000FFFFFF0000000002000000
      000000000000C714000006004D656D6F363500020022010000D4010000AF0100
      003D000000030000002C010000000000000000FFFFFF1F2C0200000000000100
      2C005B4D4F4E45595354522853554D285B6F64735265706F72742E22464E5F56
      4944414E4F5F53554D225D29295D00000000FFFF000000000002000000010000
      00000500417269616C000A00000002000000000009000000CC00020000000000
      FFFFFF00000000020000000000000000007D15000006004D656D6F3636000200
      28000000D8010000F8000000280000000300000001000000000000000000FFFF
      FF1F2C02000000000000000003000500626567696E0D2900202046435F4E4149
      4D5F4B4F4C203A3D204745545F4E41494D5F4B4F4C28204E61696D4B6F6C2029
      3B0D0300656E6400010000000000000200000001000000000500417269616C00
      0A000000000000000000000000000100020000000000FFFFFF00000000020000
      00000000000000FC15000006004D656D6F3432000200DA010000380200005800
      0000140000000300080001000000000000000000FFFFFF1F2C02000000000001
      00000000000000FFFF00000000000200000001000000000500417269616C000A
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      0000000000008B16000006004D656D6F34340002002500000043020000670000
      00140000000300000001000000000000000000FFFFFF1F2C0200000000000100
      1000C7E0E22E20EEF2E4E5EBE5EDE8E5EC3A00000000FFFF0000000000020000
      0001000000000500417269616C000900000000000000000008000000CC000200
      00000000FFFFFF00000000020000000000000000000A17000006004D656D6F34
      360002008C00000057020000F400000014000000030008000100000000000000
      0000FFFFFF1F2C0200000000000100000000000000FFFF000000000002000000
      01000000000500417269616C000A0000000000000000000A000000CC00020000
      000000FFFFFF0000000002000000000000000000A517000006004D656D6F3438
      0002002500000065020000B20000001400000003000000010000000000000000
      00FFFFFF1F2C02000000000001001C00C7E0EC2E20E3EBE0E22E20E2F0E0F7E0
      20EFEE20EFF0EEF4E8EBFE3A00000000FFFF0000000000020000000100000000
      0500417269616C000900000000000000000008000000CC00020000000000FFFF
      FF00000000020000000000000000002418000006004D656D6F3539000200D900
      000079020000A7000000140000000300080001000000000000000000FFFFFF1F
      2C0200000000000100000000000000FFFF000000000002000000010000000005
      00417269616C000A0000000000000000000A000000CC00020000000000FFFFFF
      0000000002000000000000000000C818000006004D656D6F3339000200250000
      0088020000D6000000140000000300000001000000000000000000FFFFFF1F2C
      02000000000001002500C7E0EC2E20E3EBE0E22E20E2F0E0F7E020EFEE20EBE5
      F7E5E1EDEEE920F0E0E1EEF2E5203A00000000FFFF0000000000020000000100
      0000000500417269616C000900000000000000000008000000CC000200000000
      00FFFFFF00000000020000000000000000004719000006004D656D6F34330002
      00FA0000009C02000087000000040000000300080001000000000000000000FF
      FFFF1F2C0200000000000100000000000000FFFF000000000002000000010000
      00000500417269616C000A0000000000000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000D319000006004D656D6F3637000200
      9A010000440200004F000000140000000300000001000000000000000000FFFF
      FF1F2C02000000000001000D00C7E0E22E20E0EFF2E5EAEEE93A00000000FFFF
      00000000000200000001000000000500417269616C0009000000000000000000
      08000000CC00020000000000FFFFFF0000000002000000000000000000521A00
      0006004D656D6F3638000200E901000058020000E80000001400000003000800
      01000000000000000000FFFFFF1F2C0200000000000100000000000000FFFF00
      000000000200000001000000000500417269616C000A0000000000000000000A
      000000CC00020000000000FFFFFF0000000002000000000000000000DA1A0000
      06004D656D6F36390002009A0100006602000042000000140000000300000001
      000000000000000000FFFFFF1F2C02000000000001000900CEF2EFF3F1F2E8EB
      3A00000000FFFF00000000000200000001000000000500417269616C00090000
      0000000000000008000000CC00020000000000FFFFFF00000000020000000000
      00000000591B000006004D656D6F3730000200E90100007A020000E800000014
      0000000300080001000000000000000000FFFFFF1F2C02000000000001000000
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      000A0B0054667252696368566965770000511D000006006D656D6F3737000200
      24000000D4010000FC0000003C0000000100000001000000000000000000FFFF
      FF1F2C020000000000000000000000FFFF000000000002000000010000000001
      511D00007B5C727466315C616E73695C616E7369637067313235315C64656666
      305C6465666C616E67313034397B5C666F6E7474626C7B5C66305C666E696C5C
      66636861727365743230347B5C2A5C666E616D6520417269616C3B7D41726961
      6C204359523B7D7B5C66315C666E696C5C66636861727365743020417269616C
      3B7D7B5C66325C666E696C204D532053616E732053657269663B7D7D0D0A7B5C
      636F6C6F7274626C203B5C726564305C677265656E305C626C7565303B7D0D0A
      5C766965776B696E64345C7563315C706172645C6366315C6C616E6731303333
      5C66305C667332305C2763665C2765655C2765625C2766335C2766375C276538
      5C276562205C2765645C2765305C2765385C2765635C2765355C2765645C2765
      655C2765325C2765305C2765645C2765385C2765395C6631203A0D0A5C706172
      205C756C5C6630205B46435F4E41494D5F4B4F4C5D5C756C6E6F6E6520205C27
      65645C276530205C2766315C2766335C2765635C2765635C2766333A5C6C616E
      67313034395C66325C66733136200D0A5C706172207D0D0A000000171E000005
      004D656D6F310002002400000092000000CC0000001400000003000000010000
      00000000000000FFFFFF1F2C02000000000001004800EEF2205B464F524D4154
      4441544554494D452827272722272764642727222727206D6D6D6D2079797979
      202727E32E2727272C5B6F6473547265622E2266645F64617465225D295D0000
      0000FFFF00000000000200000001000000010500417269616C000A0000000000
      00000000000000000100020000000000FFFFFF00000000020000000000000000
      00971E000009006D65436F6D6D656E7400020024000000A8020000AE02000018
      0000000300000001000000000000000000FFFFFF1F2C02000000000000000000
      0000FFFF00000000000200000001000000040500417269616C000A0000000000
      00000000080000000100020000000000FFFFFF00000000020000000000000000
      00311F000005004D656D6F32000200F8010000F4030000DC0000001400000003
      00000001000000000000000000FFFFFF1F2C02000000000001001C00D1F2F02E
      205B50414745235D20E8E7205B544F54414C50414745535D00000000FFFF0000
      0000000200000001000000000500417269616C00090000000000000000000900
      00000100020000000000FFFFFF000000000200000000000000FEFEFF00000000
      0000000000000000FC0000000000000000000000000000000058002C0F48C6F5
      D3E2406750E47AF24EE440}
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmTrebLst\'
    StoredProps.Strings = (
      'cxGridTrebDpcDBTableView1FC_EDIZM.Visible'
      'cxGridTrebDpcDBTableView1FC_EDIZM.Width'
      'cxGridTrebDpcDBTableView1FC_MEDIC.Visible'
      'cxGridTrebDpcDBTableView1FC_MEDIC.Width'
      'cxGridTrebDpcDBTableView1FN_KOL.Visible'
      'cxGridTrebDpcDBTableView1FN_KOL.Width'
      'cxGridTrebDpcDBTableView1ROWNUM.Visible'
      'cxGridTrebDpcDBTableView1ROWNUM.Width'
      'cxGridTrebLstDBTableView1FC_COMMENT.Visible'
      'cxGridTrebLstDBTableView1FC_COMMENT.Width'
      'cxGridTrebLstDBTableView1FC_MOFROM.Visible'
      'cxGridTrebLstDBTableView1FC_MOFROM.Width'
      'cxGridTrebLstDBTableView1FC_MOTO.Visible'
      'cxGridTrebLstDBTableView1FC_MOTO.Width'
      'cxGridTrebLstDBTableView1FC_PROCESSED.Visible'
      'cxGridTrebLstDBTableView1FC_PROCESSED.Width'
      'cxGridTrebLstDBTableView1FC_TREB.Visible'
      'cxGridTrebLstDBTableView1FC_TREB.Width'
      'cxGridTrebLstDBTableView1FD_DATE.Visible'
      'cxGridTrebLstDBTableView1FD_DATE.Width'
      'cxGridTrebLstDBTableView1FL_CITO.Visible'
      'cxGridTrebLstDBTableView1FL_CITO.Width'
      'cxGridTrebDpcDBTableView1FK_ID.Visible'
      'cxGridTrebDpcDBTableView1FK_ID.Width'
      'cxGridTrebLstDBTableView1FK_ID.Visible'
      'cxGridTrebLstDBTableView1FK_ID.Width'
      'cxGridTrebDpcDBTableView1FD_CREATE.Visible'
      'cxGridTrebDpcDBTableView1FD_CREATE.Width'
      'cxGridTrebDpcDBTableView1FD_EDIT.Visible'
      'cxGridTrebDpcDBTableView1FD_EDIT.Width'
      'cxGridTrebDpcDBTableView1FK_CREATE_MO_ID.Visible'
      'cxGridTrebDpcDBTableView1FK_CREATE_MO_ID.Width'
      'cxGridTrebDpcDBTableView1FK_EDIT_MO_ID.Visible'
      'cxGridTrebDpcDBTableView1FK_EDIT_MO_ID.Width'
      'cxGridTrebDpcDBTableView1FC_NAME_LAT.Visible'
      'cxGridTrebDpcDBTableView1FC_NAME_LAT.Width'
      'cxGridTrebLstDBTableView1FK_FINSOURCE_ID.Width'
      'cxGridTrebLstDBTableView1_ECP1_NOTE.Visible'
      'cxGridTrebLstDBTableView1_ECP1_NOTE.Width'
      'cxGridTrebLstDBTableView1_ECP2_NOTE.Visible'
      'cxGridTrebLstDBTableView1_ECP2_NOTE.Width'
      'cxGridTrebLstDBTableView1_ECP3_NOTE.Visible'
      'cxGridTrebLstDBTableView1_ECP3_NOTE.Width'
      'cxGridTrebDpcDBTableView1FC_INTERNATIONAL_NAME.Visible'
      'cxGridTrebDpcDBTableView1FC_INTERNATIONAL_NAME.Width')
    StoredValues = <>
    Left = 456
    Top = 244
  end
  object odsMedic: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWNUM, A.* from ('
      
        'SELECT /*D.ROWID,*/ D.*,M.FC_NAME AS FC_MEDIC,M.FC_INTERNATIONAL' +
        '_NAME,E.FC_NAME AS FC_EDIZM , 0 as KARTID,'
      '       m.FC_NAME_LAT'
      ''
      'FROM MED.TTREB_DPC D, MED.TMEDIC M, MEd.TEI E'
      'WHERE D.FK_TREBID = :FK_TREBID'
      '  AND M.MEDICID = D.FK_MEDICID'
      '--  and M.fl_visible = 1'
      '  AND M.EIID = E.EIID (+)'
      'ORDER BY LOWER(M.FC_NAME )'
      ') A')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A464B5F54524542494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000001000000006000000524F574E554D01000000000005000000464B5F49
      4401000000000009000000464B5F5452454249440100000000000A000000464B
      5F4D45444943494401000000000006000000464E5F4B4F4C0100000000000800
      000046435F4D454449430100000000000800000046435F4544495A4D01000000
      000008000000464B5F4450434944010000000000060000004B41525449440100
      0000000010000000464B5F4E415A4D45444C4543485F49440100000000000F00
      0000464B5F4352454154455F4D4F5F49440100000000000900000046445F4352
      454154450100000000000D000000464B5F454449545F4D4F5F49440100000000
      000700000046445F454449540100000000000A000000464E5F4B4F4C5F4F4C44
      0100000000000B00000046435F4E414D455F4C4154010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 18
    Top = 220
  end
  object dsMedic: TDataSource
    DataSet = odsMedic
    Left = 18
    Top = 262
  end
  object oqDuplicateTrebDPC: TOracleQuery
    SQL.Strings = (
      'begin'
      '  INSERT INTO MED.TTREB_DPC'
      '  ("FK_TREBID","FK_MEDICID","FN_KOL","FK_DPCID") '
      
        '  SELECT :NEW_TREB_ID, FK_MEDICID, FN_KOL, FK_DPCID FROM MED.TTR' +
        'EB_DPC WHERE FK_TREBID = :OLD_TREB_ID;'
      ''
      
        '  SELECT  fk_mofromid,  fk_motoid,  fc_comment,  fk_mogroupid_fr' +
        'om,  fk_mogroupid_to,  fl_cito'
      
        '    into :fk_mofromid, :fk_motoid, :fc_comment, :fk_mogroupid_fr' +
        'om, :fk_mogroupid_to, :fl_cito'
      '  FROM MED.TTREB WHERE fk_id = :OLD_TREB_ID;'
      ''
      '  MED.PKG_TREB.DO_SET_TREB( :NEW_TREB_ID,'
      '                         null,'
      '                         SYSDATE,'
      '                         :fk_mofromid,'
      '                         :fk_motoid,'
      '                         :fc_comment,'
      '                         :fk_mogroupid_from,'
      '                         :fk_mogroupid_to,'
      '                         :fl_cito'
      '                       );'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000080000000C0000003A4E45575F545245425F49440300000000000000
      000000000C0000003A4F4C445F545245425F4944030000000000000000000000
      0C0000003A464B5F4D4F46524F4D49440300000000000000000000000B000000
      3A46435F434F4D4D454E54050000000000000000000000120000003A464B5F4D
      4F47524F555049445F46524F4D030000000000000000000000100000003A464B
      5F4D4F47524F555049445F544F030000000000000000000000080000003A464C
      5F4349544F0300000000000000000000000A0000003A464B5F4D4F544F494403
      0000000000000000000000}
    Cursor = crSQLWait
    Left = 202
    Top = 82
  end
  object frTrebOld: TfrReport
    Dataset = frDBdsTreb
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    PrintIfEmpty = False
    ShowProgress = False
    StoreInDFM = True
    Title = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077
    RebuildPrinter = False
    OnGetValue = frTrebGetValue
    OnUserFunction = frTrebUserFunction
    OnObjectClick = frTrebObjectClick
    OnMouseOverObject = frTrebMouseOverObject
    Left = 335
    Top = 72
    ReportForm = {
      19000000622F0000190000000001000100FFFFFFFFFF09000000340800009A0B
      00002400000024000000240000002400000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      00001C000000F60200001D0100003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D004D61737465
      72486561646572310002010000000044010000F6020000320000007000040001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200660200000B004D617374657244617461310002010000000090010000F602
      0000110000003900050001000000000000000000FFFFFF1F000000000A006672
      44426473547265620000000006000500626567696E0D5E0020206966205B4649
      4E414C504153535D20616E6420285B50414745235D203D205B544F54414C5041
      4745535D2D312920414E4420285B4652454553504143455D203C205265706F72
      7453756D6D617279312E48656967687429207468656E0D0C00202020204E6577
      506167653B0D1D002F2F202020207768696C6520467265655370616365203E20
      323020646F0D19002F2F20202020202053686F7742616E64284368696C643129
      3B0D0300656E6400FFFF000000000002000000010000000000000001000000C8
      00000014000000010000000000000200D40200000E005265706F727453756D6D
      617279310002010000000004030000F602000012000000300001000100000000
      0000000000FFFFFF1F00000000000000000000000000FFFF0000000000020000
      00010000000000000001000000C8000000140000000100000000000002004103
      00000D004D6173746572466F6F7465723100020100000000C0010000F6020000
      F90000003000060001000000000000000000FFFFFF1F00000000000000000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      0000010000000000000200AC0300000B0050616765466F6F7465723100020100
      000000F4030000F6020000150000003000030001000000000000000000FFFFFF
      1F00000000000000000000000000FFFF00000000000200000001000000000000
      0001000000C8000000140000000100000000000000002E04000005004D656D6F
      320002009802000089000000380000001500000003000F000100000000000000
      0000FFFFFF1F2C02000000000001000400EAEEE4FB00000000FFFF0000000000
      0200000001000000000500417269616C000A0000000200000000000A000000CC
      00020000000000FFFFFF0000000002000000000000000000AA04000005004D65
      6D6F3300020098020000B2000000380000001400000003000F00010000000000
      00000000FFFFFF1F2C020000000000000000000000FFFF000000000002000000
      01000000000500417269616C000A0000000200000000000A000000CC00020000
      000000FFFFFF00000000020000000000000000002605000005004D656D6F3400
      020098020000C6000000380000001400000003000F0001000000000000000000
      FFFFFF1F2C020000000000000000000000FFFF00000000000200000001000000
      000500417269616C000A0000000200000000000A000000CC00020000000000FF
      FFFF0000000002000000000000000000A205000005004D656D6F350002009802
      0000DA000000380000001400000003000F0001000000000000000000FFFFFF1F
      2C020000000000000000000000FFFF0000000000020000000100000000050041
      7269616C000A0000000200000000000A000000CC00020000000000FFFFFF0000
      0000020000000000000000002706000005004D656D6F36000200980200009E00
      0000380000001400000003000F0001000000000000000000FFFFFF1F2C020000
      000000010007003035303432333400000000FFFF000000000002000000010000
      00000500417269616C00080000000000000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000A306000005004D656D6F3700020098
      020000EE000000380000001C00000003000F0001000000000000000000FFFFFF
      1F2C020000000000000000000000FFFF00000000000200000001000000000500
      417269616C000A0000000200000000000A000000CC00020000000000FFFFFF00
      000000020000000000000000002807000005004D656D6F390002005F0200009E
      00000037000000150000000300000001000000000000000000FFFFFF1F2C0200
      0000000001000700EFEE20CECAD3C400000000FFFF0000000000020000000100
      0000000500417269616C000800000000000000000008000000CC000200000000
      00FFFFFF0000000002000000000000000000AA07000005004D656D6F38000200
      5F020000B400000037000000140000000300000001000000000000000000FFFF
      FF1F2C02000000000001000400C4E0F2E000000000FFFF000000000002000000
      01000000000500417269616C000800000000000000000008000000CC00020000
      000000FFFFFF00000000020000000000000000003008000006004D656D6F3130
      0002005F020000F1000000370000001500000003000000010000000000000000
      00FFFFFF1F2C02000000000001000700EFEE20CECACFCE00000000FFFF000000
      00000200000001000000000500417269616C0009000000000000000000080000
      00CC00020000000000FFFFFF0000000002000000000000000000B50800000600
      4D656D6F31310002005F020000DC000000370000001400000003000000010000
      00000000000000FFFFFF1F2C02000000000001000600EFEE20CAD1CF00000000
      FFFF00000000000200000001000000000500417269616C000900000000000000
      000008000000CC00020000000000FFFFFF00000000020000000000000000003B
      09000006004D656D6F31320002005F020000C800000037000000140000000300
      000001000000000000000000FFFFFF1F2C02000000000001000700EFEE20CECA
      CFCE00000000FFFF00000000000200000001000000000500417269616C000800
      000000000000000008000000CC00020000000000FFFFFF000000000200000000
      0000000000DC09000006004D656D6F3133000200600000008B000000EC000000
      140000000300000001000000000000000000FFFFFF1F2C020000000000010018
      00CDC0CACBC0C4CDC0DF2028D2D0C5C1CEC2C0CDC8C52920B900000000FFFF00
      000000000200000001000000000F0054696D6573204E657720526F6D616E000C
      00000000000000000008000000CC00020000000000FFFFFF0000000002000000
      000000000000780A000006004D656D6F3134000200500100008B000000980000
      00140000000300020001000000000000000000FFFFFF1F2C0200000000000100
      13005B6F6473547265622E2246435F54524542225D00000000FFFF0000000000
      0200000001000000000F0054696D6573204E657720526F6D616E000C00000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      00000A0B000006004D656D6F3135000200EA0100009B0000003C000000100000
      000300000001000000000000000000FFFFFF1F2C02000000000001000900D4EE
      F0ECE02034333400000000FFFF00000000000200000001000000000F0054696D
      6573204E657720526F6D616E000800000000000000000000000000CC00020000
      000000FFFFFF0000000002000000000000000000A90B000006004D656D6F3136
      00020024000000B8000000950000001100000003000000010000000000000000
      00FFFFFF1F2C02000000000001001600D3F7E5F0E5E6E4E5EDE8E520EFEEEBF3
      F7E0F2E5EBFC00000000FFFF00000000000200000001000000000F0054696D65
      73204E657720526F6D616E000A00000000000000000000000000CC0002000000
      0000FFFFFF00000000020000000000000000004B0C000006004D656D6F313800
      020024000000D8000000A4000000120000000300000001000000000000000000
      FFFFFF1F2C02000000000001001900D1F2F0F3EAF2F3F0EDEEE520EFEEE4F0E0
      E7E4E5EBE5EDE8E500000000FFFF00000000000200000001000000000F005469
      6D6573204E657720526F6D616E000A00000000000000000010000000CC000200
      00000000FFFFFF0000000002000000000000000000F20C000006004D656D6F31
      390002002400000008010000F100000014000000030000000100000000000000
      0000FFFFFF1F2C02000000000001001E00CCE0F2E5F0E8E0EBFCEDEE2DEEF2E2
      E5F2F1F2E2E5EDEDEEE520EBE8F6EE00000000FFFF0000000000020000000100
      0000000F0054696D6573204E657720526F6D616E000A00000000000000000010
      000000CC00020000000000FFFFFF0000000002000000000000000000A80D0000
      06004D656D6F3230000200100100000701000042010000140000000300020001
      000000000000000000FFFFFF1F2C020000000000010013005B6F647354726562
      2E2246435F46524F4D225D0003000500626567696E0D0A002F2F5B7661725F6D
      6F5D0D0300656E6400FFFF00000000000200000001000000000F0054696D6573
      204E657720526F6D616E000A0000000000000000000A000000CC000200000000
      00FFFFFF0000000002000000000000000000400E000006004D656D6F32310002
      00480100001C0100007C000000140000000300000001000000000000000000FF
      FFFF1F2C02000000000001000F00C4EEEBE6EDEEF1F2FC202F20D4C8CE000000
      00000000000000000200000001000000000F0054696D6573204E657720526F6D
      616E000A0000000000000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000F60E000006004D656D6F343500020047000000440100
      00CD0000003200000003000F002C010000000000000000FFFFFF1F2C02000000
      000001002D00CDE0E8ECE5EDEEE2E0EDE8E52C20E4EEE7E8F0EEE2EAE02C20F4
      EEF0ECE020E2FBEFF3F1EAE02C20F1E5F0E8FF00000000FFFF00000000000200
      000001000000000F0054696D6573204E657720526F6D616E000A000000020000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      930F000006004D656D6F37330002003E01000044010000580000002100000003
      000F002C010000000000000000FFFFFF1F2C02000000000001001400C1F3F5E3
      E0EBF2E5F0F1EAE0FF20E7E0EFE8F1FC00000000FFFF00000000000200000001
      000000000F0054696D6573204E657720526F6D616E000A000000020000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000261000
      0006004D656D6F37340002009601000044010000910000002100000003000F00
      2C010000000000000000FFFFFF1F2C02000000000001000A00CAEEEBE8F7E5F1
      F2E2EE00000000FFFF00000000000200000001000000000F0054696D6573204E
      657720526F6D616E000A0000000200000000000A000000CC00020000000000FF
      FFFF0000000002000000000000000000B410000006004D656D6F323200020024
      00000044010000230000003200000003000F002C010000000000000000FFFFFF
      1F2C02000000000001000500B920EF2FEF00000000FFFF000000000002000000
      01000000000F0054696D6573204E657720526F6D616E000A0000000200000000
      000A000000CC00020000000000FFFFFF00000000020000000000000000004811
      000006004D656D6F32330002002702000044010000420000003200000003000F
      002C010000000000000000FFFFFF1F2C02000000000002000500D6E5EDE02C0D
      0300F0F3E100000000FFFF00000000000200000001000000000F0054696D6573
      204E657720526F6D616E000A0000000200000000000A000000CC000200000000
      00FFFFFF0000000002000000000000000000D611000006004D656D6F32340002
      003E010000650100002A0000001100000003000F002C010000000000000000FF
      FFFF1F2C02000000000001000500C4E5E1E5F200000000FFFF00000000000200
      000001000000000F0054696D6573204E657720526F6D616E0008000000020000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      6512000006004D656D6F323500020068010000650100002E0000001100000003
      000F002C010000000000000000FFFFFF1F2C02000000000001000600CAF0E5E4
      E8F200000000FFFF00000000000200000001000000000F0054696D6573204E65
      7720526F6D616E00080000000200000000000A000000CC00020000000000FFFF
      FF0000000002000000000000000000F912000006004D656D6F33300002009601
      000065010000460000001100000001000F002C010000000000000000FFFFFF1F
      2C02000000000001000B00C7E0F2F0E5E1EEE2E0EDEE00000000FFFF00000000
      000200000001000000000F0054696D6573204E657720526F6D616E0008000000
      0200000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000008A13000006004D656D6F3331000200DC010000650100004B0000001100
      000003000F002C010000000000000000FFFFFF1F2C02000000000001000800CE
      F2EFF3F9E5EDEE00000000FFFF00000000000200000001000000000F0054696D
      6573204E657720526F6D616E00080000000200000000000A000000CC00020000
      000000FFFFFF00000000020000000000000000001F14000006004D656D6F3332
      0002006902000044010000670000003200000003000F002C0100000000000000
      00FFFFFF1F2C02000000000002000600D1F3ECECE02C0D0300F0F3E100000000
      FFFF00000000000200000001000000000F0054696D6573204E657720526F6D61
      6E000A0000000200000000000A000000CC00020000000000FFFFFF0000000002
      000000000000000000B014000006004D656D6F32360002001401000044010000
      2A0000003200000007000F002C010000000000000000FFFFFF1F2C0200000000
      0001000800C5E42E20E8E7EC2E00000000FFFF00000000000200000001000000
      000F0054696D6573204E657720526F6D616E000A0000000200000000000A0000
      00CC00020000000000FFFFFF0000000002000000000000000000D91500000600
      4D656D6F32370002004700000090010000CD0000001100000003000F002C0100
      00000000000000FFFFFF1F2C02000000000001001D005B6F64735265706F7274
      2E224E414D454B415254225D5B7354656D705D0004000500626567696E0D0C00
      7354656D70203A3D2027273B0D64002F2F2020696620285B6F64735265706F72
      742E2246435F53455249414C225D203C3E20272729207468656E207354656D70
      203A3D20272C27202B205B6F64735265706F72742E2246435F53455249414C22
      5D20656C7365207354656D70203A3D2027273B0D0300656E6400FFFF00000000
      000200000001000000000F0054696D6573204E657720526F6D616E000C000000
      00000000000008000000CC00020000000000FFFFFF0000000002000000000000
      0000006916000006004D656D6F32380002002400000090010000230000001100
      000003000F002C010000000000000000FFFFFF1F2C020000000000010007005B
      4C494E45235D00000000FFFF00000000000200000001000000000F0054696D65
      73204E657720526F6D616E000A0000000000000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000B517000006004D656D6F323900
      02002702000090010000420000001100000003000F002C010000000000000000
      FFFFFF1F2C02000000000001002E005B464F524D4154464C4F41542827302E30
      302E272C205B6F64735265706F72742E22464E5F5052494345225D295D000300
      0500626567696E0D85002F2F20206966205B6F64735265706F72742E22464E5F
      4B4F4C225D203D202D31207468656E2074656D705072696365203A3D20272720
      656C73652074656D705072696365203A3D20464F524D4154464C4F4154282730
      2E3030272C205B6F64735265706F72742E2253554D4D225D2F5B6F6473526570
      6F72742E22464E5F4B4F4C225D293B0D0300656E6400FFFF0000000000020000
      0001000000000F0054696D6573204E657720526F6D616E000A00000000000000
      000009000000CC00020000000000FFFFFF00000000020000000000000000003C
      18000006004D656D6F33330002003E010000900100002A000000110000000300
      0F002C010000000000000000FFFFFF1F2C020000000000000000000000FFFF00
      000000000200000001000000000F0054696D6573204E657720526F6D616E000C
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000000C318000006004D656D6F333400020068010000900100002E0000
      001100000003000F002C010000000000000000FFFFFF1F2C0200000000000000
      00000000FFFF00000000000200000001000000000F0054696D6573204E657720
      526F6D616E000C0000000000000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000051A000006004D656D6F333500020096010000
      90010000460000001100000001000F002C010000000000000000FFFFFF1F2C02
      0000000000010018005B6F64735265706F72742E22464E5F545245424B4F4C22
      5D0004000500626567696E0D25002F2F5B6F64735265706F72742E22464E5F54
      5245424B4F4C225D202D20FDF2EE20E1FBEBEE0D69002F2F20206966205B6F64
      735265706F72742E22464E5F545245424B4F4C225D203D202D31207468656E20
      74656D70547265624B6F6C203A3D20272720656C73652074656D70547265624B
      6F6C203A3D205B6F64735265706F72742E22464E5F545245424B4F4C225D3B0D
      0300656E6400FFFF00000000000200000001000000000F0054696D6573204E65
      7720526F6D616E000A0000000000000000000A000000CC00020000000000FFFF
      FF00000000020000000000000000002F1B000006004D656D6F3336000200DC01
      0000900100004B0000001100000003000F002C010000000000000000FFFFFF1F
      2C020000000000010014005B6F64735265706F72742E22464E5F4B4F4C225D00
      04000500626567696E0D21002F2F5B6F64735265706F72742E22464E5F4B4F4C
      225D202D20FDF2EE20E1FBEBEE0D59002F2F20206966205B6F64735265706F72
      742E22464E5F4B4F4C225D203D202D31207468656E2074656D704B6F6C203A3D
      20272720656C73652074656D704B6F6C203A3D205B6F64735265706F72742E22
      464E5F4B4F4C225D3B0D0300656E6400FFFF0000000000020000000100000000
      0F0054696D6573204E657720526F6D616E000A0000000000000000000A000000
      CC00020000000000FFFFFF00000000020000000000000000008F1C000006004D
      656D6F33370002006902000090010000670000001100000003000F002C010000
      000000000000FFFFFF1F2C02000000000001002A005B464F524D4154464C4F41
      542827302E30302E272C205B6F64735265706F72742E2253554D4D225D295D00
      04000500626567696E0D30002F2F205B464F524D4154464C4F41542827302E30
      302E272C205B6F64735265706F72742E2246435F53554D4D225D295D0D6A002F
      2F20206966205B6F64735265706F72742E2253554D4D225D203D202D31207468
      656E2074656D7053756D203A3D20272720656C73652074656D7053756D203A3D
      20464F524D4154464C4F41542827302E3030272C205B6F64735265706F72742E
      2253554D4D225D293B0D0300656E6400FFFF0000000000020000000100000000
      0F0054696D6573204E657720526F6D616E000A00000000000000000009000000
      CC00020000000000FFFFFF00000000020000000000000000002E1D000006004D
      656D6F333800020014010000900100002A0000001100000007000F002C010000
      000000000000FFFFFF1F2C020000000000010016005B6F64735265706F72742E
      2246435F4544495A4D225D00000000FFFF00000000000200000001000000000F
      0054696D6573204E657720526F6D616E000A0000000000000000000A000000CC
      00020000000000FFFFFF0000000002000000000000000000C31D000006004D65
      6D6F33390002002200000016020000A400000014000000030000000100000000
      0000000000FFFFFF1F2C02000000000001001600C7E0E2E5E4F3FEF9E8E920EE
      F2E4E5EBE5EDE8E5EC3A00000000FFFF00000000000200000001000000000500
      417269616C000A0000000000000000000A000000CC00020000000000FFFFFF00
      000000020000000000000000004B1E000006004D656D6F343000020022000000
      5202000042000000140000000300000001000000000000000000FFFFFF1F2C02
      000000000001000900CEF2EFF3F1F2E8EB3A00000000FFFF0000000000020000
      0001000000000500417269616C000A0000000000000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000D21E000006004D656D6F34
      31000200220000008C0200004200000014000000030000000100000000000000
      0000FFFFFF1F2C02000000000001000800CFEEEBF3F7E8EB3A00000000FFFF00
      000000000200000001000000000500417269616C000A0000000000000000000A
      000000CC00020000000000FFFFFF0000000002000000000000000000871F0000
      06004D656D6F34320002003002000016020000A0000000140000000300020001
      000000000000000000FFFFFF1F2C020000000000010036005B464F524D415444
      41544554494D452827272722272764642727222727206D6D6D6D207979797920
      2727E32E2727272C44415445295D00000000FFFF000000000002000000010000
      00000500417269616C000A00000000000000000009000000CC00020000000000
      FFFFFF00000000020000000000000000003C20000006004D656D6F3433000200
      3002000051020000A0000000140000000300020001000000000000000000FFFF
      FF1F2C020000000000010036005B464F524D41544441544554494D4528272727
      22272764642727222727206D6D6D6D2079797979202727E32E2727272C444154
      45295D00000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000009000000CC00020000000000FFFFFF0000000002000000
      000000000000F120000006004D656D6F34340002002F0200008B020000A00000
      00140000000300020001000000000000000000FFFFFF1F2C0200000000000100
      36005B464F524D41544441544554494D45282727272227276464272722272720
      6D6D6D6D2079797979202727E32E2727272C44415445295D00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000900
      0000CC00020000000000FFFFFF0000000002000000000000000000A021000006
      004D656D6F3436000200C4000000270200002C01000014000000030008000100
      0000000000000000FFFFFF1F2C0200000000000100300020202020202028EFEE
      E4EFE8F1FC292020202020202020202020202020202020202020202020202020
      202028D4C8CE2900000000FFFF00000000000200000001000000000500417269
      616C000800000000000000000008000000CC00020000000000FFFFFF00000000
      020000000000000000006F22000006004D656D6F343700020064000000610200
      008C010000140000000300080001000000000000000000FFFFFF1F2C02000000
      0000010050002020202020202020202020202020202020202020202020202020
      2028EFEEE4EFE8F1FC2920202020202020202020202020202020202020202020
      202020202020202020202020202020202028D4C8CE2900000000FFFF00000000
      000200000001000000000500417269616C000800000000000000000008000000
      CC00020000000000FFFFFF00000000020000000000000000003E23000006004D
      656D6F3438000200640000009B0200008C010000140000000300080001000000
      000000000000FFFFFF1F2C020000000000010050002020202020202020202020
      2020202020202020202020202020202028EFEEE4EFE8F1FC2920202020202020
      2020202020202020202020202020202020202020202020202020202020202020
      28D4C8CE2900000000FFFF00000000000200000001000000000500417269616C
      000800000000000000000008000000CC00020000000000FFFFFF000000000200
      0000000000000000DF23000006004D656D6F343900020025000000EB000000A0
      000000110000000300000001000000000000000000FFFFFF1F2C020000000000
      01001800D3F7F0E5E6E4E5EDE8E52028EEF2EFF0E0E2E8F2E5EBFC2900000000
      FFFF00000000000200000001000000000F0054696D6573204E657720526F6D61
      6E000A00000000000000000000000000CC00020000000000FFFFFF0000000002
      0000000000000000007424000006004D656D6F3530000200C5000000EA000000
      8D010000140000000300020001000000000000000000FFFFFF1F2C0200000000
      0001000C005B7661725F73656E6465725D00000000FFFF000000000002000000
      01000000000F0054696D6573204E657720526F6D616E000A0000000000000000
      000A000000CC00020000000000FFFFFF00000000020000000000000000001525
      000006004D656D6F3531000200C5000000D60000008D01000014000000030002
      0001000000000000000000FFFFFF1F2C020000000000010018005B6F64735472
      65622E2246435F47524F555046524F4D225D00000000FFFF0000000000020000
      0001000000000F0054696D6573204E657720526F6D616E000A00000000000000
      00000A000000CC00020000000000FFFFFF0000000002000000000000000000AC
      25000006004D656D6F3137000200B8000000AC0000009A0100001C0000000300
      020001000000000000000000FFFFFF1F2C02000000000001000E005B7661725F
      72656365697665725D00000000FFFF00000000000200000001000000000F0054
      696D6573204E657720526F6D616E000A00000000000000000012000000CC0002
      0000000000FFFFFF00000000020000000000000000003B26000006004D656D6F
      353200020024000000C0010000450200001100000003000F002C010000000000
      000000FFFFFF1F2C02000000000001000600C8F2EEE3EE3A00000000FFFF0000
      0000000200000001000000000F0054696D6573204E657720526F6D616E000C00
      000002000000000009000000CC00020000000000FFFFFF000000000200000000
      0000000000F726000006004D656D6F353300020069020000C001000067000000
      1100000003000F002C010000000000000000FFFFFF1F2C020000000000010033
      005B666F726D6174666C6F61742827232C232330F02E3030EA272C53554D285B
      6F64735265706F72742E2253554D4D225D29295D00000000FFFF000000000002
      00000001000000000F0054696D6573204E657720526F6D616E000C0000000200
      0000000009000000CC00020000000000FFFFFF00000000020000000000000000
      008C27000006004D656D6F353400020080020000F50300004C00000012000000
      0300000001000000000000000000FFFFFF1F2C02000000000001000C00F1F2F0
      2E205B50414745235D00000000FFFF00000000000200000001000000000F0054
      696D6573204E657720526F6D616E000A00000000000000000009000000CC0002
      0000000000FFFFFF00000000020000000000000000003328000006004D656D6F
      353500020024000000C8000000B8000000140000000300000001000000000000
      000000FFFFFF1F2C02000000000001001E0028F6E5EDF2F0E0EBE8E7EEE2E0ED
      EDE0FF20E1F3F5E3E0EBF2E5F0E8FF2900000000FFFF00000000000200000001
      000000000F0054696D6573204E657720526F6D616E000A000000000000000000
      00000000CC00020000000000FFFFFF0000000002000000000000000000E82800
      0006004D656D6F353600020054020000690000007C0000001300000009000200
      01000000000000000000FFFFFF1F2C020000000000010036005B464F524D4154
      4441544554494D452827272722272764642727222727206D6D6D6D2079797979
      202727E32E2727272C44415445295D00000000FFFF0000000000020000000100
      0000000500417269616C000A00000000000000000009000000CC000200000000
      00FFFFFF00000000020000000000000000009D29000006004D656D6F35370002
      0025000000A400000088000000130000000900020001000000000000000000FF
      FFFF1F2C020000000000010036005B464F524D41544441544554494D45282727
      2722272764642727222727206D6D6D6D2079797979202727E32E2727272C4441
      5445295D00000000FFFF00000000000200000001000000000500417269616C00
      0A00000000000000000008000000CC00020000000000FFFFFF00000000020000
      00000000000000392A000006004D656D6F3538000200100100003D020000E000
      0000240000000300000001000000000000000000FFFFFF1F2C02000000000001
      0013005B6F6473547265622E2246435F4D4F544F225D00000000FFFF00000000
      000200000001000000000F0054696D6573204E657720526F6D616E000A000000
      00000000000012000000CC00020000000000FFFFFF0000000002000000000000
      000000CE2A000006004D656D6F35390002001001000003020000E00000002400
      00000300000001000000000000000000FFFFFF1F2C02000000000001000C005B
      7661725F4D61674F74645D00000000FFFF00000000000200000001000000000F
      0054696D6573204E657720526F6D616E000A00000000000000000012000000CC
      00020000000000FFFFFF00000000020000000000000000006C2B000006004D65
      6D6F36300002001001000077020000E000000024000000030000000100000000
      0000000000FFFFFF1F2C020000000000010015005B6F6473547265622E224643
      5F4D4F46524F4D225D00000000FFFF00000000000200000001000000000F0054
      696D6573204E657720526F6D616E000A00000000000000000012000000CC0002
      0000000000FFFFFF0000000002000000000000000000FE2B000006004D656D6F
      3631000200700200002400000060000000140000000300000001000000000000
      000000FFFFFF1F2C02000000000001000900D3D2C2C5D0C6C4C0DE00000000FF
      FF00000000000200000001000000000F0054696D6573204E657720526F6D616E
      000A00000000000000000012000000CC00020000000000FFFFFF000000000200
      0000000000000000B82C000006004D656D6F36320002006F01000037000000A0
      0000001D0000000300000001000000000000000000FFFFFF1F2C020000000000
      02001A00C7E0ECE5F1F2E8F2E5EBFC20E3EBE0E2EDEEE3EE20E2F0E0F7E00D14
      00EFEE20ECE5E4E8F6E8EDF1EAEEE920F7E0F1F2E800000000FFFF0000000000
      0200000001000000000F0054696D6573204E657720526F6D616E000A00000000
      000000000008000000CC00020000000000FFFFFF000000000200000000000000
      00004B2D000006004D656D6F363300020020020000540000003D000000100000
      000300000001000000000000000000FFFFFF1F2C02000000000001000A002028
      EFEEE4EFE8F1FC2900000000FFFF00000000000200000001000000000F005469
      6D6573204E657720526F6D616E000A00000000000000000010000000CC000200
      00000000FFFFFF0000000002000000000000000000D92D000006004D656D6F36
      34000200A5020000540000002800000010000000030000000100000000000000
      0000FFFFFF1F2C0200000000000100050028D4C8CE2900000000FFFF00000000
      000200000001000000000F0054696D6573204E657720526F6D616E000A000000
      00000000000010000000CC00020000000000FFFFFF0000000002000000000000
      000000722E000005004D656D6F31000200F401000044000000DC000000100000
      000300020001000000000000000000FFFFFF1F2C020000000000010011005B76
      61725F7A616D5F676C5F767261345D00000000FFFF0000000000020000000100
      0000000F0054696D6573204E657720526F6D616E000A00000000000000000009
      000000CC00020000000000FFFFFF0000000002000000000000000000302F0000
      06004D656D6F363500020026000000D4010000AB02000015000000030000002C
      010000000000000000FFFFFF1F2C02000000000001003500C8F2EEE3EE2028EF
      F0EEEFE8F1FCFE293A205B4D4F4E45595354522853554D285B6F64735265706F
      72742E2253554D4D225D29295D00000000FFFF00000000000200000001000000
      000F0054696D6573204E657720526F6D616E000C000000020000000000090000
      00CC00020000000000FFFFFF000000000200000000000000FEFEFF0000000000
      00000000000000FC0000000000000000000000000000000058002C0F48C6F5D3
      E2409E56E47AF24EE440}
  end
  object pmSelect: TPopupMenu
    Left = 258
    Top = 192
    object N5: TMenuItem
      Action = acSelect
      Caption = #1058#1077#1082#1091#1097#1077#1077
    end
    object N6: TMenuItem
      Action = acNewClearTreb
    end
  end
  object pmPrint: TPopupMenu
    Left = 304
    Top = 48
    object N7: TMenuItem
      Action = acPrintTreb
      Default = True
    end
    object N8: TMenuItem
      Action = acPrintTrebNakl
    end
  end
  object odsTDocs: TOracleDataSet
    SQL.Strings = (
      'select '
      '--  treb.*, doc.*'
      '  treb.FK_DPID as DPID,'
      '  doc.FC_DOC as FC_DOC,'
      '  nvl(doc.FD_INVOICE, treb.TRUNC_DATE) as FD_INVOICE,'
      
        '  nvl(doc.fc_mogroupid_from, treb.FC_GROUPTO  ) as FC_MOGROUPID_' +
        'FROM_ORIG,'
      
        '  nvl(doc.fc_mogroupid_to,   treb.FC_GROUPFROM) as FC_MOGROUPID_' +
        'TO_ORIG,'
      '  nvl(doc.namefrom, treb.FC_MOTO) as namefrom,'
      '  nvl(doc.nameto, treb.FC_mofrom) as nameto,'
      
        '  nvl(doc.mogr_from_FK_SKLAD_ID, treb.to_FK_SKLAD_ID) as mogr_fr' +
        'om_FK_SKLAD_ID,'
      '  nvl(doc.FC_DOCMIX, treb.FC_DOCMIX) as   FC_DOCMIX'
      '/*'
      'odsTDocs.FieldByName('#39'DPID'#39').AsInteger,'
      'odsTDocs.FieldByName('#39'FC_DOC'#39').AsString,'
      'odsTDocs.FieldByName('#39'FD_INVOICE'#39').AsDateTime,'
      'odsTDocs.FieldByName('#39'FC_MOGROUPID_FROM_ORIG'#39').AsString,'
      'odsTDocs.FieldByName('#39'FC_MOGROUPID_TO_ORIG'#39').AsString,'
      'odsTDocs.FieldByName('#39'FC_DOCMIX'#39').AsString+'#39'.xls'#39','
      'odsTDocs.FieldByName('#39'NAMEFROM'#39').AsString,'
      'odsTDocs.FieldByName('#39'NAMETO'#39').AsString,'
      'False,'
      
        'fdmMain.nvl(odsTDocs.FieldByName('#39'mogr_from_fk_sklad_id'#39').AsInte' +
        'ger,-1)'
      '*/'
      ''
      'from'
      '('
      'SELECT '
      
        '  med.GET_DECODEDOCVIDMOVE(2)||'#39' '#8470'     '#39'||T.FC_TREB||'#39' '#1086#1090' '#39'||to_' +
        'char(T.FD_DATE,'#39'dd.mm.yyyy'#39') as FC_DOCMIX, '
      '  TRUNC(T.FD_DATE) as TRUNC_DATE, FK_DPID,'
      '  MED.GET_TREBSTATUS(T.fk_id) AS FK_PROCESSED,'
      
        '  decode(MED.GET_TREBSTATUS(T.fk_id),-1,'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39',0,'#39#1053#1077' '#1086#1090#1087 +
        #1091#1097#1077#1085#1086#39',1,'#39#1050#1086#1088#1088#1077#1082#1090#1080#1088#1091#1077#1090#1089#1103#39',2,'#39#1054#1090#1087#1091#1097#1077#1085#1086#39') AS FC_PROCESSED,'
      '  '
      '  NVL(TMO.FC_NAME,'#39#39') as FC_MOTO,'
      '  NVL(M2.FC_NAME,'#39#39')  AS FC_MOFROM,'
      
        '--  decode(NVL(TMO.FC_NAME,'#39#39'), '#39#39', MOGR_TO.FC_GROUP, MOGR_TO.FC' +
        '_GROUP||'#39' ('#39'||TMO.FC_NAME||'#39')'#39' ) AS FC_GROUPTO_WITH_NAME,'
      
        '--  decode(NVL(M2.FC_NAME,'#39#39'), '#39#39', MOGR_FROM.FC_GROUP, MOGR_FROM' +
        '.FC_GROUP||'#39' ('#39'||M2.FC_NAME||'#39')'#39' ) AS FC_GROUPFROM_WITH_NAME,'
      
        '  MOGR_FROM.FC_GROUP as FC_GROUPFROM,   MOGR_TO.FC_GROUP as FC_G' +
        'ROUPTO, MOGR_TO.FK_SKLAD_ID as to_FK_SKLAD_ID'
      ''
      
        ' FROM MED.TTREB T, MED.TMO, MED.TMO M2, MED.TMO_GROUP MOGR_FROM,' +
        ' MED.TMO_GROUP MOGR_TO'
      ' WHERE T.FK_ID = :pTrebID '
      '  AND T.FK_MOTOID = TMO.MOID (+)'
      '  AND T.FK_MOFROMID = M2.MOID (+)'
      '  AND T.fk_mogroupid_from = MOGR_FROM.GROUPID(+)'
      '  AND T.fk_mogroupid_to   = MOGR_TO.GROUPID(+)'
      ') Treb,'
      ''
      '('
      'SELECT'
      '       D.DPID, D.motoid, D.mofromid,'
      '       D.fk_mogroupid_from, D.fk_mogroupid_to,'
      '--'
      '       mogr_from.fc_group as fc_mogroupid_from_orig,'
      '       mogr_to.fc_group as fc_mogroupid_to_orig,'
      '       mogr_from.FK_SKLAD_ID as mogr_from_FK_SKLAD_ID,'
      '       mogr_to.FK_SKLAD_ID as mogr_to_FK_SKLAD_ID,'
      
        '       MED.PKGTDOCS.GET_DOC_SOURCE (D.fp_vid, D.fp_vidmove, D.fk' +
        '_mogroupid_FROM, D.postavid) as fc_mogroupid_from,'
      
        '       MED.PKGTDOCS.GET_DOC_DESTINATION(D.fp_vid, D.fp_vidmove, ' +
        'D.fk_mogroupid_TO, D.postavid) AS fc_mogroupid_to,'
      '--'
      '       D.fl_edit,'
      '       med.get_decodedocvid(fp_vidmove) as vidmove,'
      '       D.fp_vid,'
      '       D.fp_vidmove, D.fc_comment, '
      
        '       med.GET_DECODEDOCVIDMOVE(fp_vidmove) as FC_DOCNAME, D.fc_' +
        'doc,'
      
        '       trunc (D.fd_data) AS DATA, tmo_from.fc_name AS namefrom,m' +
        'oownerid,'
      '       tmo_to.fc_name AS nameto,fd_data, D.fd_invoice,'
      
        '       med.GET_DECODEDOCVIDMOVE(fp_vidmove)||'#39' '#8470' '#39'||D.fc_doc||'#39' ' +
        #1086#1090' '#39'||to_char(D.fd_invoice,'#39'dd.mm.yyyy'#39') AS fc_docmix'
      '--'
      'FROM  med.TDOCS D,'
      
        '      med.tmo tmo_from, med.tmo tmo_to, med.tmo_group mogr_from,' +
        ' med.tmo_group mogr_to'
      'WHERE D.DPID = :pDPID'
      '  AND D.motoid = tmo_to.moid(+)'
      '  AND D.mofromid = tmo_from.moid(+)'
      '  AND D.fk_mogroupid_from = mogr_from.groupid(+)'
      '  AND D.fk_mogroupid_to   = mogr_to.groupid(+)'
      ') Doc'
      ''
      'where Treb.FK_DPID = doc.DPID(+)')
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A50445049440300000000000000000000000800
      00003A50545245424944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000140000000A00000046435F434F4D4D454E5401000000000005000000
      464B5F49440100000000000700000046435F5452454201000000000007000000
      46445F444154450100000000000C000000464B5F4D4F4F574E45524944010000
      00000009000000464B5F4D4F544F49440100000000000B000000464B5F4D4F46
      524F4D494401000000000007000000464B5F445049440100000000000C000000
      46435F50524F4345535345440100000000000700000046435F4D4F544F010000
      0000000900000046435F4D4F46524F4D0100000000000C000000464B5F50524F
      4345535345440100000000000C000000464B5F4D4F47524F5550494401000000
      000011000000464B5F4D4F47524F555049445F46524F4D0100000000000F0000
      00464B5F4D4F47524F555049445F544F01000000000007000000464C5F434954
      4F0100000000000C00000046435F47524F555046524F4D010000000000140000
      0046435F47524F5550544F5F574954485F4E414D450100000000001600000046
      435F47524F555046524F4D5F574954485F4E414D450100000000000A00000054
      52554E435F44415445010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 126
    Top = 240
  end
  object pmTrebFilterPeriod: TPopupMenu
    Left = 534
    Top = 64
    object N19: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = N19Click
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N20: TMenuItem
      Tag = 5
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1076#1077#1085#1100
      OnClick = N19Click
    end
    object N18: TMenuItem
      Tag = 4
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
      OnClick = N19Click
    end
    object N16: TMenuItem
      Tag = 2
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1075#1086#1076
      OnClick = N19Click
    end
    object N21: TMenuItem
      Caption = '-'
    end
    object N17: TMenuItem
      Tag = 3
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1084#1077#1089#1103#1094
      OnClick = N19Click
    end
    object N15: TMenuItem
      Tag = 1
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1075#1086#1076
      OnClick = N19Click
    end
  end
  object pmTrebNaklV2: TPopupMenu
    Left = 256
    Top = 256
    object MenuItem1: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1074' '#1072#1083#1100#1090#1077#1088#1085#1072#1090#1080#1074#1085#1086#1084' '#1074#1080#1076#1077
      OnClick = MenuItem1Click
    end
  end
  object pmDamagedTrebNakl: TPopupMenu
    Left = 256
    Top = 312
    object miDamagedTrebNaklCheck: TMenuItem
      Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1088#1072#1089#1093#1086#1076
      Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1089#1086#1089#1090#1086#1103#1085#1080#1077' '#1087#1088#1080#1074#1103#1079#1082#1080' '#1082' '#1088#1072#1089#1093#1086#1076#1091' '#1087#1086' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1102
      Visible = False
    end
    object miDamagedTrebNaklRepair: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1088#1072#1089#1093#1086#1076
      Hint = #1055#1086#1087#1099#1090#1072#1090#1100#1089#1103' '#1074#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1088#1072#1089#1093#1086#1076' '#1087#1086' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1102
      OnClick = miDamagedTrebNaklRepairClick
    end
    object miDamagedTrebNaklDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1089#1093#1086#1076
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1089#1093#1086#1076' '#1087#1086' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1102' '#1080' '#1087#1088#1080#1074#1103#1079#1082#1091' '#1082' '#1085#1077#1084#1091
      OnClick = miDamagedTrebNaklDelClick
    end
  end
  object oqDamagedTrebNaklRepair: TOracleQuery
    SQL.Strings = (
      'declare'
      '  pfd_data DATE; '
      '  pdpid NUMBER;'
      '  pmofromid NUMBER; '
      '  pmotoid NUMBER;'
      '  pfk_mogroupid_to NUMBER;'
      '  pfk_mogroupid_from NUMBER;'
      'begin'
      
        '  select max(t.fk_dpid), max(t.fd_date), max(t.fk_motoid), max(t' +
        '.fk_mofromid), max(t.fk_mogroupid_from), max(t.fk_mogroupid_to) ' +
        'into'
      
        '         pdpid,          pfd_data,       pmofromid,        pmoto' +
        'id,            pfk_mogroupid_to,         pfk_mogroupid_from'
      '  from med.ttreb t where t.fk_id = :fk_trebid;'
      '  '
      '  update med.tdocs d '
      '  set d.fd_data = pfd_data, '
      '      d.fp_vid = 2, '
      '      d.fp_vidmove = 2,'
      
        '      d.fc_comment = TO_CHAR(:fk_trebid)||'#39' ('#1074#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085' '#1087#1086' '#1090#1088#1077 +
        #1073#1086#1074#1072#1085#1080#1102')'#39','
      '      d.mofromid = pmofromid,'
      '      d.motoid = pmotoid,'
      '      d.fl_edit = 1, '
      '      d.fd_invoice = pfd_data, '
      '      d.fl_treb = 1, '
      '      d.fk_mogroupid_to = pfk_mogroupid_to, '
      '      d.fk_mogroupid_from = pfk_mogroupid_from'
      '  where d.dpid = pdpid;'
      'end;  ')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A464B5F54524542494403000000000000000000
      0000}
    Left = 376
    Top = 208
  end
  object oqDamagedTrebNaklDelete: TOracleQuery
    SQL.Strings = (
      'declare'
      '  pdpid NUMBER;'
      ''
      'begin'
      
        '  select max(t.fk_dpid) into pdpid from med.ttreb t where t.fk_i' +
        'd = :fk_trebid;'
      '  '
      
        '  update med.ttreb t set t.fk_dpid = null where t.fk_id = :fk_tr' +
        'ebid;'
      ''
      '  delete from med.tdocs d where d.dpid = pdpid;'
      'end;  ')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A464B5F54524542494403000000000000000000
      0000}
    Left = 376
    Top = 264
  end
end
