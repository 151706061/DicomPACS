object frmMedKardLst: TfrmMedKardLst
  Left = 223
  Top = 235
  HelpContext = 54
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1072#1088#1090#1080#1081' '#1086#1073#1098#1077#1082#1090#1086#1074' '#1091#1095#1077#1090#1072
  ClientHeight = 515
  ClientWidth = 1181
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHelp = FormHelp
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 352
    Width = 1181
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    MinSize = 100
    ExplicitTop = 319
    ExplicitWidth = 887
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 1181
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 1179
      end>
    EdgeBorders = [ebTop]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 1172
      Height = 40
      Align = alClient
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 68
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object tbuSelect: TToolButton
        Left = 0
        Top = 0
        Action = acSelect
      end
      object ToolButton9: TToolButton
        Left = 68
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbuFilter: TToolButton
        Left = 76
        Top = 0
        Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1087#1088#1077#1087#1072#1088#1072#1090#1072#1084' '#1074#1082#1083#1102#1095#1105#1085
        Action = acFilter
        Down = True
        Style = tbsCheck
      end
      object ToolButton11: TToolButton
        Left = 144
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 2
        Style = tbsSeparator
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 152
        Top = 0
        Action = acEdit
      end
      object ToolButton2: TToolButton
        Left = 220
        Top = 0
        Action = acCheckSeeingPartiesByBrak
      end
      object ToolButton12: TToolButton
        Left = 288
        Top = 0
        Width = 8
        Caption = 'ToolButton12'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbuSkladSelect: TToolButton
        Left = 296
        Top = 0
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1089#1082#1083#1072#1076
        AutoSize = True
        Caption = #1058#1077#1082'. '#1089#1082#1083#1072#1076
        ImageIndex = 61
        OnClick = tbuSkladSelectClick
      end
      object ToolButton6: TToolButton
        Left = 362
        Top = 0
        Action = acRefresh
      end
      object ToolButton7: TToolButton
        Left = 430
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        Enabled = False
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbuPrint: TToolButton
        Left = 438
        Top = 0
        Action = acPrint
      end
      object tbuExcel: TToolButton
        Left = 506
        Top = 0
        Caption = #1042' Excel'
        ImageIndex = 44
        OnClick = tbuExcelClick
      end
      object tbuClose: TToolButton
        Left = 574
        Top = 0
        Action = acClose
      end
      object ToolButton5: TToolButton
        Left = 642
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 2
        Style = tbsSeparator
        Visible = False
      end
      object tbuSepCurSett: TToolButton
        Left = 650
        Top = 0
        Width = 8
        ImageIndex = 2
        Style = tbsSeparator
      end
      object paCur: TPanel
        Left = 658
        Top = 0
        Width = 97
        Height = 36
        BevelOuter = bvNone
        TabOrder = 0
        object deCurOstDate: TcxDateEdit
          Left = 6
          Top = 15
          Hint = #1044#1072#1090#1072' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103' '#1086#1089#1090#1072#1090#1082#1086#1074
          EditValue = 0d
          ParentFont = False
          Properties.DateButtons = [btnToday]
          Properties.ImmediatePost = True
          Properties.InputKind = ikMask
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.OnEditValueChanged = deCurOstDatePropertiesEditValueChanged
          Properties.OnValidate = deCurOstDatePropertiesValidate
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 0
          Width = 85
        end
        object cxLabel1: TcxLabel
          Left = 6
          Top = 0
          AutoSize = False
          Caption = #1044#1072#1090#1072
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Height = 17
          Width = 85
          AnchorX = 49
          AnchorY = 9
        end
      end
      object paCur2: TPanel
        Left = 755
        Top = 0
        Width = 222
        Height = 36
        BevelOuter = bvNone
        TabOrder = 1
        object cxLabel2: TcxLabel
          Left = 8
          Top = -1
          AutoSize = False
          Caption = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090'. '#1086#1090#1074'.'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Height = 17
          Width = 177
          AnchorX = 97
          AnchorY = 8
        end
        object lcbCurOstGroup: TcxLookupComboBox
          Left = 6
          Top = 15
          Hint = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090'. '#1086#1090#1074'. '#1076#1083#1103' '#1087#1088#1086#1089#1084#1086#1090#1088#1072' '#1086#1089#1090#1072#1090#1082#1086#1074
          Properties.DropDownAutoSize = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'GROUPID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_GROUP'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsMO_GROUP
          Properties.OnEditValueChanged = lcbCurOstGroupPropertiesEditValueChanged
          TabOrder = 1
          Width = 211
        end
      end
      object gbColorDecode: TcxGroupBox
        Left = 977
        Top = 0
        Hint = #1050#1083#1080#1082#1085#1080#1090#1077' '#1084#1099#1096#1100#1102' '#1076#1083#1103' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
        Caption = #1057#1088#1086#1082#1080
        TabOrder = 2
        OnClick = gbColorDecodeClick
        Height = 36
        Width = 72
        object imRed: TcxImage
          Left = 8
          Top = 15
          Hint = 
            #1055#1072#1088#1090#1080#1080' '#1089#1086' '#1089#1088#1086#1082#1086#1084' '#1075#1086#1076#1085#1086#1089#1090#1080', '#1080#1089#1090#1077#1082#1072#1102#1097#1080#1084' '#1095#1077#1088#1077#1079' 1 '#1076#1077#1085#1100' '#1083#1080#1073#1086' '#1091#1078#1077' '#1080#1089#1090#1105 +
            #1082#1096#1080#1084
          TabStop = False
          Properties.PopupMenuLayout.MenuItems = []
          Properties.ShowFocusRect = False
          Style.Color = 11184895
          TabOrder = 0
          OnClick = gbColorDecodeClick
          Height = 15
          Width = 15
        end
        object imYellow: TcxImage
          Left = 29
          Top = 15
          Hint = #1055#1072#1088#1090#1080#1080' '#1089#1086' '#1089#1088#1086#1082#1086#1084' '#1075#1086#1076#1085#1086#1089#1090#1080', '#1080#1089#1090#1077#1082#1072#1102#1097#1080#1084' '#1074' '#1090#1077#1095#1077#1085#1080#1077' 1 '#1085#1077#1076#1077#1083#1080
          TabStop = False
          Properties.PopupMenuLayout.MenuItems = []
          Properties.ShowFocusRect = False
          Style.Color = 11206655
          TabOrder = 1
          OnClick = gbColorDecodeClick
          Height = 15
          Width = 15
        end
        object imGreen: TcxImage
          Left = 50
          Top = 15
          Hint = #1055#1072#1088#1090#1080#1080' '#1089#1086' '#1089#1088#1086#1082#1086#1084' '#1075#1086#1076#1085#1086#1089#1090#1080', '#1080#1089#1090#1077#1082#1072#1102#1097#1080#1084' '#1074' '#1090#1077#1095#1077#1085#1080#1077' 1 '#1084#1077#1089#1103#1094#1072
          TabStop = False
          Properties.PopupMenuLayout.MenuItems = []
          Properties.ShowFocusRect = False
          Style.Color = 11206570
          TabOrder = 2
          OnClick = gbColorDecodeClick
          Height = 15
          Width = 15
        end
      end
      object gbClass: TcxGroupBox
        Left = 1049
        Top = 0
        Caption = #1050#1083#1072#1089#1089#1099
        TabOrder = 3
        Height = 36
        Width = 92
        object imClass2a: TcxImage
          Left = 29
          Top = 15
          Hint = #1052#1077#1076#1080#1094#1080#1085#1089#1082#1080#1077' '#1080#1079#1076#1077#1083#1080#1103' '#1089#1086' '#1089#1088#1077#1076#1085#1077#1081' '#1089#1090#1077#1087#1077#1085#1100#1102' '#1088#1080#1089#1082#1072
          TabStop = False
          Properties.Caption = '2'#1072
          Properties.PopupMenuLayout.MenuItems = []
          Properties.ReadOnly = False
          Properties.ShowFocusRect = False
          Style.Color = 8388352
          TabOrder = 0
          Height = 15
          Width = 15
        end
        object imClass2b: TcxImage
          Left = 50
          Top = 15
          Hint = #1052#1077#1076#1080#1094#1080#1085#1089#1082#1080#1077' '#1080#1079#1076#1077#1083#1080#1103' '#1089' '#1087#1086#1074#1099#1096#1077#1085#1085#1086#1081' '#1089#1090#1077#1087#1077#1085#1100#1102' '#1088#1080#1089#1082#1072
          TabStop = False
          Properties.Caption = '2'#1073
          Properties.PopupMenuLayout.MenuItems = []
          Properties.ReadOnly = False
          Properties.ShowFocusRect = False
          Style.Color = 245820
          TabOrder = 1
          Height = 15
          Width = 15
        end
        object imClass3: TcxImage
          Left = 71
          Top = 15
          Hint = #1052#1077#1076#1080#1094#1080#1085#1089#1082#1080#1077' '#1080#1079#1076#1077#1083#1080#1103' '#1089' '#1074#1099#1089#1086#1082#1086#1081' '#1089#1090#1077#1087#1077#1085#1100#1102' '#1088#1080#1089#1082#1072
          TabStop = False
          Properties.Caption = '3'
          Properties.PopupMenuLayout.MenuItems = []
          Properties.ShowFocusRect = False
          Style.Color = 3342591
          TabOrder = 2
          Height = 15
          Width = 15
        end
        object imClass1: TcxImage
          Left = 8
          Top = 15
          Hint = #1052#1077#1076#1080#1094#1080#1085#1089#1082#1080#1077' '#1080#1079#1076#1077#1083#1080#1103' '#1089' '#1085#1080#1079#1082#1086#1081' '#1089#1090#1077#1087#1077#1085#1100#1102' '#1088#1080#1089#1082#1072
          TabStop = False
          Properties.Caption = '1'
          Properties.PopupMenuLayout.MenuItems = []
          Properties.ReadOnly = False
          Properties.ShowFocusRect = False
          Style.Color = clWhite
          TabOrder = 3
          Height = 15
          Width = 15
        end
      end
    end
  end
  object panel: TPanel
    Left = 0
    Top = 357
    Width = 1181
    Height = 158
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'panel'
    TabOrder = 2
    object paOst: TPanel
      Left = 0
      Top = 0
      Width = 1181
      Height = 16
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        1181
        16)
      object StaticText1: TStaticText
        Left = 0
        Top = 0
        Width = 46
        Height = 17
        Hint = #1042' '#1091#1087#1072#1091#1082#1086#1074#1086#1095#1085#1099#1093' '#1077#1076'. '#1080#1079#1084'. ('#1074' '#1092#1072#1089#1086#1074#1086#1095#1085#1099#1093' '#1077#1076'. '#1080#1079#1084'.)'
        Caption = '              '
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object cbShowNulls: TCheckBox
        Left = 966
        Top = -1
        Width = 211
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1085#1091#1083#1077#1074#1099#1077' '#1086#1089#1090#1072#1090#1082#1080
        TabOrder = 0
        OnClick = cbShowNullsClick
      end
      object laKolByOneMedics: TcxLabel
        Left = 305
        Top = 0
        Hint = #1054#1073#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082' '#1087#1086' '#1074#1089#1077#1084' '#1086#1090#1086#1073#1088#1072#1078#1072#1077#1084#1099#1084' '#1087#1072#1088#1090#1080#1103#1084
        AutoSize = False
        Height = 17
        Width = 210
      end
    end
    object cxGridPrihRash: TcxGrid
      Left = 0
      Top = 16
      Width = 1181
      Height = 142
      Align = alClient
      TabOrder = 1
      object cxGridPrihRashDBTableView1: TcxGridDBTableView
        OnDblClick = cxGridPrihRashDBTableView1DblClick
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsKardOper
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.ImmediateEditor = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderEndEllipsis = True
        OptionsView.Indicator = True
        Styles.ContentEven = dmMain.cxStyleGridDetailEvenRow
        Styles.ContentOdd = dmMain.cxStyleGridDetailOddRow
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        Styles.Footer = dmMain.cxStyleFooter
        object cxGridPrihRashDBTableView1_DPID: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          DataBinding.FieldName = 'DPID'
          Visible = False
          Width = 60
        end
        object cxGridPrihRashDBTableView1_DPCID: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1087#1086#1079#1080#1094#1080#1080
          DataBinding.FieldName = 'DPCID'
          Visible = False
          Width = 60
        end
        object cxGridPrihRashDBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088'.'
          DataBinding.FieldName = 'FD_DATA'
          Options.Filtering = False
          SortIndex = 0
          SortOrder = soAscending
          Width = 69
        end
        object cxGridPrihRashDBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077':'
          DataBinding.FieldName = 'FC_DOCMIX'
          Options.Filtering = False
          Width = 86
        end
        object cxGridPrihRashDBTableView1DBColumn3: TcxGridDBColumn
          Caption = #1054#1087#1077#1088#1072#1094#1080#1103
          DataBinding.FieldName = 'FC_OPER'
          Options.Filtering = False
          Width = 97
        end
        object cxGridPrihRashDBTableView1DBColumn4: TcxGridDBColumn
          Caption = #1054#1090' '#1082#1086#1075#1086
          DataBinding.FieldName = 'FC_OT'
          Options.Filtering = False
          Width = 117
        end
        object cxGridPrihRashDBTableView1DBColumn5: TcxGridDBColumn
          Caption = #1050#1086#1084#1091
          DataBinding.FieldName = 'FC_KOMU'
          Options.Filtering = False
          Width = 115
        end
        object cxGridPrihRashDBTableView1DBColumn6: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086'('#1059#1087')'
          DataBinding.FieldName = 'FN_KOL'
          Options.Filtering = False
          Width = 61
        end
        object cxGridPrihRashDBTableView1DBColumn7: TcxGridDBColumn
          Caption = #1059#1087'.'#1045#1076'.'#1048#1079#1084'.'
          DataBinding.FieldName = 'FC_UEDIZM'
          Options.Filtering = False
          Width = 67
        end
        object cxGridPrihRashDBTableView1DBColumn8: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086'('#1060#1072#1089')'
          DataBinding.FieldName = 'FN_FKOL'
          Options.Filtering = False
          Width = 76
        end
        object cxGridPrihRashDBTableView1DBColumn9: TcxGridDBColumn
          Caption = #1060#1072#1089'.'#1045#1076'.'#1048#1079#1084'.'
          DataBinding.FieldName = 'FC_FEDIZM'
          Options.Filtering = False
          Width = 74
        end
        object cxGridPrihRashDBTableView1DBColumn10: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072', '#1088
          DataBinding.FieldName = 'FN_SUM'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Options.Filtering = False
          Width = 65
        end
      end
      object cxGridPrihRashLevel1: TcxGridLevel
        GridView = cxGridPrihRashDBTableView1
      end
    end
  end
  object paMedKart: TPanel
    Left = 0
    Top = 42
    Width = 1181
    Height = 310
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object cxGridMedic: TcxGrid
      Left = 0
      Top = 0
      Width = 1181
      Height = 310
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      object cxGridMedicDBTableView1: TcxGridDBTableView
        OnDblClick = dbgDblClick
        NavigatorButtons.ConfirmDelete = False
        OnCellClick = cxGridMedicDBTableView1CellClick
        OnCustomDrawCell = cxGridMedicDBTableView1CustomDrawCell
        OnFocusedRecordChanged = cxGridMedicDBTableView1FocusedRecordChanged
        DataController.DataSource = dsMedKart
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.KeyFieldNames = 'KARTID;FN_OST_TYPE;DPCID'
        DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
            Kind = skSum
            Column = cxGridMedicDBTableView1FN_SUMM
          end
          item
            Format = #1050#1086#1083'-'#1074#1086': ### ### ##0'
            Kind = skCount
            Column = cxGridMedicDBTableView1FC_MEDIC
          end
          item
            Format = '0'
            Kind = skSum
            Column = cxGridMedicDBTableView1FN_FAS_KOLOST
          end
          item
            Format = '0'
            Kind = skSum
            Column = cxGridMedicDBTableView1FN_KOLOST
          end
          item
            Format = '0'
            Kind = skSum
            Column = cxGridMedicDBTableView1FL_JNVLS
          end
          item
            Format = '0'
            Kind = skSum
            Column = cxGridMedicDBTableView1FL_BRAK
          end>
        DataController.Summary.SummaryGroups = <>
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        FilterRow.Visible = True
        FilterRow.ApplyChanges = fracImmediately
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        Preview.MaxLineCount = 2
        Styles.ContentEven = dmMain.cxStyleGridEvenRow
        Styles.ContentOdd = dmMain.cxStyleGridOddRow
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        Styles.Footer = dmMain.cxStyleFooter
        object cxGridMedicDBTableView1pr_border: TcxGridDBColumn
          DataBinding.FieldName = 'pr_border'
          OnCustomDrawCell = cxGridMedicDBTableView1pr_borderCustomDrawCell
          OnGetCellHint = cxGridMedicDBTableView1pr_borderGetCellHint
          Options.Editing = False
          Width = 20
          IsCaptionAssigned = True
        end
        object cxGridMedicDBTableView1MEDICID: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1086#1073#1098#1077#1082#1090#1072' '#1091#1095#1077#1090#1072
          DataBinding.FieldName = 'MEDICID'
          Visible = False
          Options.Editing = False
          Width = 65
        end
        object cxGridMedicDBTableView1ammz: TcxGridDBColumn
          Caption = #1054#1089#1090#1072#1090#1086#1082' '#1087#1086' '#1086#1073#1098#1077#1082#1090#1091' '#1091#1095#1077#1090#1072
          DataBinding.FieldName = 'ammz'
          Visible = False
          Width = 40
        end
        object cxGridMedicDBTableView1FL_CHECK: TcxGridDBColumn
          Caption = #1042#1099#1073#1086#1088
          DataBinding.FieldName = 'FL_CHECK'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ImmediatePost = True
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Visible = False
          VisibleForCustomization = False
          Width = 50
        end
        object cxGridMedicDBTableView1FC_NAME: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_NAME'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
          Width = 250
        end
        object cxGridMedicDBTableView1FC_EANCODE: TcxGridDBColumn
          Caption = #1050#1086#1076' EAN'
          DataBinding.FieldName = 'FC_EANCODE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          Options.Editing = False
          Width = 150
        end
        object cxGridMedicDBTableView1FC_MEDIC: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_MEDIC'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Options.Editing = False
          Options.Grouping = False
          SortIndex = 0
          SortOrder = soAscending
          Width = 233
        end
        object cxGridMedicDBTableView1DRUGID: TcxGridDBColumn
          DataBinding.FieldName = 'DRUGID'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          Options.Grouping = False
        end
        object cxGridMedicDBTableView1FC_INTERNATIONAL_NAME: TcxGridDBColumn
          Caption = #1052#1077#1078#1076#1091#1085#1072#1088#1086#1076#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_INTERNATIONAL_NAME'
          Visible = False
          Width = 50
        end
        object cxGridMedicDBTableView1FN_PARTY_NUM: TcxGridDBColumn
          Caption = #8470' '#1055#1072#1088#1090#1080#1080
          DataBinding.FieldName = 'FN_PARTY_NUM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Options.Editing = False
          Options.Grouping = False
          Width = 20
        end
        object cxGridMedicDBTableView1FC_SERIAL: TcxGridDBColumn
          Caption = #1057#1077#1088'. '#8470
          DataBinding.FieldName = 'FC_SERIAL'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Options.Editing = False
          Options.Grouping = False
          Width = 48
        end
        object cxGridMedicDBTableView1FD_GODEN: TcxGridDBColumn
          Caption = #1043#1086#1076#1077#1085' '#1076#1086
          DataBinding.FieldName = 'FD_GODEN'
          PropertiesClassName = 'TcxDateEditProperties'
          Options.Editing = False
          Options.Grouping = False
          SortIndex = 1
          SortOrder = soAscending
          Width = 34
        end
        object cxGridMedicDBTableView1FC_UEDIZM: TcxGridDBColumn
          Caption = #1059#1087'. '#1077#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'FC_UEDIZM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Options.Editing = False
          Options.Grouping = False
          Width = 23
        end
        object cxGridMedicDBTableView1FC_MEDICTYPENAME: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072' '#1091#1095#1077#1090#1072
          DataBinding.FieldName = 'FC_MEDICTYPENAME'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
          Width = 150
        end
        object cxGridMedicDBTableView1FC_PAYTYPE: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1086#1087#1083#1072#1090#1099
          DataBinding.FieldName = 'FC_PAYTYPE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
          Width = 150
        end
        object cxGridMedicDBTableView1FC_MONAME: TcxGridDBColumn
          Caption = #1052#1072#1090'. '#1086#1090#1074'.'
          DataBinding.FieldName = 'FC_MONAME'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
          Width = 450
        end
        object cxGridMedicDBTableView1KARTID: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1087#1072#1088#1090#1080#1080
          DataBinding.FieldName = 'KARTID'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          Options.Editing = False
          Width = 150
        end
        object cxGridMedicDBTableView1FN_KOLOST: TcxGridDBColumn
          Caption = #1058#1077#1082'. '#1086#1089#1090#1072#1090#1086#1082' ('#1091#1087'. '#1077#1076'. '#1080#1079#1084'.)'
          DataBinding.FieldName = 'FN_KOLOST'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.DisplayFormat = '### ### ### ##0.#######'
          Properties.ValueType = vtFloat
          Options.Editing = False
          Options.Grouping = False
          Width = 31
        end
        object cxGridMedicDBTableView1FN_FPACKINUPACK: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086' '#1092#1072#1089'. '#1074' '#1091#1087#1072#1082'.'
          DataBinding.FieldName = 'FN_FPACKINUPACK'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          Options.Editing = False
          Width = 74
        end
        object cxGridMedicDBTableView1FC_FEDIZM: TcxGridDBColumn
          Caption = #1060#1072#1089'. '#1077#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'FC_FEDIZM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          Options.Editing = False
          Width = 86
        end
        object cxGridMedicDBTableView1FN_FAS_KOLOST: TcxGridDBColumn
          Caption = #1058#1077#1082'. '#1086#1089#1090#1072#1090#1086#1082' ('#1092#1072#1089'. '#1077#1076'. '#1080#1079#1084'.)'
          DataBinding.FieldName = 'FN_FAS_KOLOST'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.DisplayFormat = '### ### ### ##0.#######'
          Properties.ValueType = vtFloat
          Visible = False
          Options.Editing = False
          Width = 57
        end
        object cxGridMedicDBTableView1FN_PRICE: TcxGridDBColumn
          Caption = #1062#1077#1085#1072' '#1079#1072' '#1091#1087'. '#1077#1076'. '#1080#1079#1084'., '#1088
          DataBinding.FieldName = 'FN_PRICE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.NullString = '0,00'
          Properties.UseThousandSeparator = True
          FooterAlignmentHorz = taRightJustify
          Options.Editing = False
          Options.Grouping = False
          Width = 62
        end
        object cxGridMedicDBTableView1FN_SUMM: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072', '#1088
          DataBinding.FieldName = 'FN_SUMM'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.Nullable = False
          Properties.NullString = '0,00'
          Properties.ReadOnly = True
          Properties.UseThousandSeparator = True
          FooterAlignmentHorz = taRightJustify
          MinWidth = 50
          Options.Editing = False
          Options.Grouping = False
          Width = 50
        end
        object cxGridMedicDBTableView1FC_UCHGR: TcxGridDBColumn
          Caption = #1043#1088#1091#1087#1087#1072' '#1091#1095#1077#1090#1085#1086#1089#1090#1080
          DataBinding.FieldName = 'FC_UCHGR'
          Options.Editing = False
          Width = 37
        end
        object cxGridMedicDBTableView1FK_ATC: TcxGridDBColumn
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
          Width = 50
        end
        object cxGridMedicDBTableView1FC_ATC_ROOT: TcxGridDBColumn
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
          Width = 50
        end
        object cxGridMedicDBTableView1FC_OKDP: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1054#1050#1044#1055
          DataBinding.FieldName = 'FC_OKDP'
          Width = 50
        end
        object cxGridMedicDBTableView1FN_OST_TYPE: TcxGridDBColumn
          Caption = #1056#1077#1079#1077#1088#1074
          DataBinding.FieldName = 'FN_OST_TYPE'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Options.Editing = False
          Width = 20
        end
        object cxGridMedicDBTableView1FC_CERT: TcxGridDBColumn
          Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
          DataBinding.FieldName = 'FC_CERT'
          Visible = False
          Options.Editing = False
          Width = 100
        end
        object cxGridMedicDBTableView1FC_PROD: TcxGridDBColumn
          Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
          DataBinding.FieldName = 'FC_PROD'
          Visible = False
          Options.Editing = False
          Width = 150
        end
        object cxGridMedicDBTableView1FL_BRAK: TcxGridDBColumn
          Caption = #1041#1088#1072#1082
          DataBinding.FieldName = 'FL_BRAK'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.AllowGrayed = True
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Width = 36
        end
        object cxGridMedicDBTableView1BRAK_UNIQSTR: TcxGridDBColumn
          Caption = 'ID '#1073#1088#1072#1082'. '#1087#1072#1088#1090#1080#1080
          DataBinding.FieldName = 'brak_uniqstr'
          Visible = False
          Width = 65
        end
        object cxGridMedicDBTableView1FK_FINSOURCE_ID: TcxGridDBColumn
          Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089'.'
          DataBinding.FieldName = 'FK_FINSOURCE_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'FK_ID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_NAME'
            end>
          Properties.ListSource = dmMain.dsTFinSource
          Options.Editing = False
          Width = 40
        end
        object cxGridMedicDBTableView1prih_dpid: TcxGridDBColumn
          Caption = 'ID '#1087#1088#1080#1093'. '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          DataBinding.FieldName = 'prih_dpid'
          Visible = False
          Width = 65
        end
        object cxGridMedicDBTableView1PRIH_DATA: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
          DataBinding.FieldName = 'PRIH_DATA'
          Visible = False
          Width = 70
        end
        object cxGridMedicDBTableView1FC_PRIH_DOC: TcxGridDBColumn
          Caption = #8470' '#1087#1088#1080#1093'.'#1076#1086#1082'-'#1090#1072
          DataBinding.FieldName = 'FC_PRIH_DOC'
          Visible = False
          Width = 60
        end
        object cxGridMedicDBTableView1FC_INV_NOMER: TcxGridDBColumn
          Caption = #1048#1085#1074'. '#1085#1086#1084#1077#1088
          DataBinding.FieldName = 'FC_INV_NOMER'
          Visible = False
          VisibleForCustomization = False
          Width = 68
        end
        object cxGridMedicDBTableView1FC_QUOTA_CODE: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1082#1074#1086#1090#1099
          DataBinding.FieldName = 'FC_QUOTA_CODE'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.AlwaysShowBlanksAndLiterals = True
          Properties.EditMask = '00-00-00-00;0;_'
          Width = 43
        end
        object cxGridMedicDBTableView1FN_NDS: TcxGridDBColumn
          Caption = #1053#1044#1057', %'
          DataBinding.FieldName = 'FN_NDS'
          PropertiesClassName = 'TcxSpinEditProperties'
          Width = 49
        end
        object cxGridMedicDBTableView1FN_PRICE_MNF: TcxGridDBColumn
          Caption = #1062#1077#1085#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103
          DataBinding.FieldName = 'FN_PRICE_MNF'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          Width = 54
        end
        object cxGridMedicDBTableView1FN_NACENKA: TcxGridDBColumn
          Caption = #1053#1072#1094#1077#1085#1082#1072', %'
          DataBinding.FieldName = 'FN_NACENKA'
          PropertiesClassName = 'TcxSpinEditProperties'
          Width = 52
        end
        object cxGridMedicDBTableView1FL_JNVLS: TcxGridDBColumn
          Caption = #1046#1053#1042#1051#1055
          DataBinding.FieldName = 'FL_JNVLS'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Width = 41
        end
        object cxGridMedicDBTableView1FK_SKLAD_ID: TcxGridDBColumn
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
          Options.Editing = False
          VisibleForCustomization = False
          Width = 60
        end
        object cxGridMedicDBTableView1FL_MIBP: TcxGridDBColumn
          Caption = #1052#1048#1041#1055
          DataBinding.FieldName = 'FL_MIBP'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Width = 41
        end
        object cxGridMedicDBTableView1FL_FORMULAR: TcxGridDBColumn
          Caption = #1060#1086#1088#1084#1091#1083#1103#1088
          DataBinding.FieldName = 'FL_FORMULAR'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Width = 41
        end
        object cxGridMedicDBTableView1FC_POSTAV: TcxGridDBColumn
          Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
          DataBinding.FieldName = 'FC_POSTAV'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          Width = 250
        end
        object cxGridMedicDBTableView1FC_CLASS: TcxGridDBColumn
          Caption = #1050#1083#1072#1089#1089
          DataBinding.FieldName = 'FC_CLASS'
          Visible = False
          Width = 40
        end
        object cxGridMedicDBTableView1FL_FORM_KOMISS: TcxGridDBColumn
          Caption = #1060#1050
          DataBinding.FieldName = 'FL_FORM_KOMISS'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
        end
        object cxGridMedicDBTableView1min_amm: TcxGridDBColumn
          DataBinding.FieldName = 'min_amm'
          Visible = False
          VisibleForCustomization = False
        end
        object cxGridMedicDBTableView1min_border: TcxGridDBColumn
          DataBinding.FieldName = 'min_border'
          Visible = False
          VisibleForCustomization = False
        end
      end
      object cxGridMedicLevel1: TcxGridLevel
        GridView = cxGridMedicDBTableView1
      end
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 672
    Top = 96
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      ImageIndex = 1
      ShortCut = 16499
      OnExecute = acCloseExecute
    end
    object acDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 22
      ShortCut = 49228
      Visible = False
      OnExecute = acDelExecute
    end
    object acEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Enabled = False
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 3
      ShortCut = 114
      Visible = False
      OnExecute = acEditExecute
    end
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Enabled = False
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 21
      ShortCut = 115
      Visible = False
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
    object acPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 32
      OnExecute = acPrintExecute
    end
    object acCalcOstByKart: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1077#1090' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1087#1086' '#1082#1072#1088#1090#1086#1095#1082#1077
      Enabled = False
      ShortCut = 49232
      Visible = False
      OnExecute = acCalcOstByKartExecute
    end
    object acLittleKart: TAction
      Caption = #1057#1090#1077#1083#1083#1072#1078#1085#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072
      OnExecute = acLittleKartExecute
    end
    object acFilter: TAction
      Caption = #1060#1080#1083#1100#1090#1088
      Enabled = False
      Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1090#1088#1077#1073#1091#1077#1084#1099#1084' '#1087#1088#1077#1087#1072#1088#1072#1090#1072#1084
      ImageIndex = 58
      Visible = False
      OnExecute = acFilterExecute
    end
    object acMoveToRezerv: TAction
      Caption = #1055#1086#1084#1077#1089#1090#1080#1090#1100' '#1074' '#1088#1077#1079#1077#1088#1074
    end
    object acMoveFromRezerv: TAction
      Caption = #1042#1077#1088#1085#1091#1090#1100' '#1080#1079' '#1088#1077#1079#1077#1088#1074#1072
    end
    object acCheckSeeingPartiesByBrak: TAction
      Caption = #1047#1072#1073#1088#1072#1082#1086#1074#1082#1072
      Hint = 
        #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1091#1102' '#1087#1088#1086#1074#1077#1088#1082#1091' '#1087#1072#1088#1090#1080#1081','#13#10#1086#1090#1086#1073#1088#1072#1078#1072#1077#1084#1099#1093' '#1074' '#1090#1072#1073#1083#1080#1094 +
        #1077
      ImageIndex = 62
      OnExecute = acCheckSeeingPartiesByBrakExecute
    end
    object acCancelFilterEAN13: TAction
      Caption = 'acCancelFilterEAN13'
      ShortCut = 27
      OnExecute = acCancelFilterEAN13Execute
    end
  end
  object odsEdit: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  *'
      'FROM MED.TDOCS'
      'WHERE TDOCS.DPID = :DPID')
    Optimize = False
    Variables.Data = {0300000001000000050000003A44504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001200000004000000445049440100000000000600000046435F444F43
      0100000000000A00000046435F434F4D4D454E5401000000000008000000464E
      5F50524943450100000000000700000046445F444154410100000000000A0000
      0046445F494E564F494345010000000000060000004D4F544F49440100000000
      0008000000504F535441564944010000000000080000004D4F46524F4D494401
      000000000007000000464C5F45444954010000000000090000004D4F4F574E45
      5249440100000000000600000046505F5649440100000000000A00000046505F
      5649444D4F564501000000000007000000464C5F545245420100000000000E00
      0000464E5F53504953414E49455649440100000000000C000000464B5F4D4F47
      524F555049440100000000000F000000464B5F4D4F47524F555049445F544F01
      000000000011000000464B5F4D4F47524F555049445F46524F4D010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 656
    Top = 222
    object odsEditDPID: TFloatField
      FieldName = 'DPID'
      Required = True
    end
    object odsEditFC_DOC: TStringField
      FieldName = 'FC_DOC'
      Size = 50
    end
    object odsEditFC_COMMENT: TStringField
      FieldName = 'FC_COMMENT'
      Size = 250
    end
    object odsEditFN_PRICE: TFloatField
      FieldName = 'FN_PRICE'
    end
    object odsEditFD_DATA: TDateTimeField
      FieldName = 'FD_DATA'
    end
    object odsEditFD_INVOICE: TDateTimeField
      FieldName = 'FD_INVOICE'
    end
    object odsEditMOTOID: TIntegerField
      FieldName = 'MOTOID'
    end
    object odsEditPOSTAVID: TIntegerField
      FieldName = 'POSTAVID'
    end
    object odsEditMOFROMID: TIntegerField
      FieldName = 'MOFROMID'
    end
    object odsEditFL_EDIT: TIntegerField
      FieldName = 'FL_EDIT'
    end
    object odsEditMOOWNERID: TIntegerField
      FieldName = 'MOOWNERID'
      Required = True
    end
    object odsEditFP_VID: TIntegerField
      FieldName = 'FP_VID'
    end
    object odsEditFP_VIDMOVE: TIntegerField
      FieldName = 'FP_VIDMOVE'
    end
    object odsEditFL_TREB: TIntegerField
      FieldName = 'FL_TREB'
    end
    object odsEditFN_SPISANIEVID: TFloatField
      FieldName = 'FN_SPISANIEVID'
    end
    object odsEditFK_MOGROUPID: TFloatField
      FieldName = 'FK_MOGROUPID'
    end
    object odsEditFK_MOGROUPID_TO: TFloatField
      FieldName = 'FK_MOGROUPID_TO'
    end
    object odsEditFK_MOGROUPID_FROM: TFloatField
      FieldName = 'FK_MOGROUPID_FROM'
    end
  end
  object oq: TOracleQuery
    SQL.Strings = (
      'begin'
      '  dosetsumdoc(:adpid,:adata1,:adata2);'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A41445049440300000000000000000000000700
      00003A4144415441310C0000000000000000000000070000003A414441544132
      0C0000000000000000000000}
    Cursor = crSQLWait
    Left = 672
    Top = 146
  end
  object frKart: TfrReport
    Dataset = frDBDataSetKardoper
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 490
    Top = 98
    ReportForm = {
      19000000D6170000190000FFFF01000100FFFFFFFFFF090000009A0B00003408
      00002400000024000000240000002400000001FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      0100000406000500626567696E0D0F002020507269684B6F6C203A3D20303B0D
      0F002020526173684B6F6C203A3D20303B0D0F0020205072696853756D203A3D
      20303B0D0F0020205261736853756D203A3D20303B0D0300656E640002002001
      00000C005265706F72745469746C653100020100000000240000002F04000021
      0100003000000001000000000000000000FFFFFF1F0000000000000000000000
      0000FFFF000000000002000000010000000000000001000000C8000000140000
      00010000000000000200E20100000D004D617374657248656164657231000201
      00000000700100002F040000280000003000040001000000000000000000FFFF
      FF1F0000000000000000000006000500626567696E0D0F002020507269684B6F
      6C203A3D20303B0D0F002020526173684B6F6C203A3D20303B0D0F0020205072
      696853756D203A3D20303B0D0F0020205261736853756D203A3D20303B0D0300
      656E6400FFFF000000000002000000010000000000000001000000C800000014
      000000010000000000000200C10300000B004D61737465724461746131000201
      00000000B00100002F040000110000003100050001000000000000000000FFFF
      FF1F00000000130066724442446174615365744B6172646F706572000000000C
      000500626567696E0D2C0020206966205B6F64734B6172644F7065722E224643
      5F4F504552225D203D2027CFF0E8F5EEE427207468656E0D0700202062656769
      6E0D300020202020507269684B6F6C203A3D20507269684B6F6C202B205B6F64
      734B6172644F7065722E22464E5F4B4F4C225D3B0D3000202020205072696853
      756D203A3D205072696853756D202B205B6F64734B6172644F7065722E22464E
      5F53554D225D3B0D05002020656E640D31002020656C7365206966205B6F6473
      4B6172644F7065722E2246435F4F504552225D203D2027D0E0F1F5EEE4272074
      68656E0D07002020626567696E0D300020202020526173684B6F6C203A3D2052
      6173684B6F6C202B205B6F64734B6172644F7065722E22464E5F4B4F4C225D3B
      0D3000202020205261736853756D203A3D205261736853756D202B205B6F6473
      4B6172644F7065722E22464E5F53554D225D3B0D06002020656E643B0D030065
      6E6400FFFF000000000002000000010000000000000001000000C80000001400
      00000100000000000002002C0400000B0050616765466F6F7465723100020100
      000000C00200002F040000140000003000030001000000000000000000FFFFFF
      1F00000000000000000000000000FFFF00000000000200000001000000000000
      0001000000C8000000140000000100000000000002009A0400000E005265706F
      727453756D6D6172793100020100000000DC0100002F04000028000000300001
      0001000000000000000000FFFFFF1F00000000000000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      000000003605000005004D656D6F310002002400000030000000E70300001400
      00000300000001000000000000000000FFFFFF1F2C02000000000001001400CA
      E0F0F2EEF7EAE020ECE5E4E8EAE0ECE5EDF2E000000000FFFF00000000000200
      000001000000040F0054696D6573204E657720526F6D616E0010000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      D905000005004D656D6F32000200240000004B000000E7030000180000000300
      000001000000000000000000FFFFFF1F2C02000000000001001B0022205B6F64
      734D65644B6172742E2246435F4D45444943225D202200000000FFFF00000000
      000200000001000000040F0054696D6573204E657720526F6D616E0010000000
      0200000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000008F07000005004D656D6F330002002400000086000000E7030000880000
      004300000001000000000000000000FFFFFF1F2C02000000000006001100EDE0
      20E4E0F2F33A2020205B444154455D0D3900F3EFE0EAEEE2EEF7EDFBE520E5E4
      E8EDE8F6FB20E8E7ECE5F0E5EDE8FF3A2020205B6F64734D65644B6172742E22
      46435F554544495A4D225D0D3800F4E0F1EEE2EEF7EDFBE520E5E4E8EDE8F6FB
      20E8E7ECE5F0E5EDE8FF3A2020205B6F64734D65644B6172742E2246435F4645
      44495A4D225D0D4600EAEEEB2DE2EE20F4E0F1EEE2EEF7EDFBF520E5E4E8EDE8
      F620E220F3EFE0EAEEE2EEF7EDEEE93A205B6F64734D65644B6172742E22464E
      5F465041434B494E555041434B225D0D3400F2E8EF20EEE1FAE5EAF2E020F3F7
      E5F2E03A2020205B6F64734D65644B6172742E2246435F4D4544494354595045
      4E414D45225D0D2300E3EEE4E5ED20E4EE3A2020205B6F64734D65644B617274
      2E2246445F474F44454E225D00000000FFFF0000000000020000000100000004
      0F0054696D6573204E657720526F6D616E000D0000000000000000000A000000
      CC00020000000000FFFFFF00000000020000000000000000007608000005004D
      656D6F340002002400000010010000E70300002C000000030000000100000000
      0000000000FFFFFF1F2C02000000000002002300CEF1F2E0F2EEEA3A2020205B
      6F64734D65644B6172742E22464E5F4B4F4C4F5354225D0D3900D6E5EDE03A20
      20205B464F524D4154464C4F4154282730F02E2C3030EA2E272C5B6F64734D65
      644B6172742E22464E5F5052494345225D295D00000000FFFF00000000000200
      000001000000040F0054696D6573204E657720526F6D616E000E000000020000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      1209000005004D656D6F350002003303000072010000D4000000140000000300
      000001000000000000000000FFFFFF1F2C02000000000001001400CEEFE5F0E0
      F6E8E820EFEE20EAE0F0F2EEF7EAE500000000FFFF0000000000020000000100
      0000000F0054696D6573204E657720526F6D616E000C0000000200000000000A
      000000CC00020000000000FFFFFF00000000020000000000000000009E090000
      05004D656D6F3600020058000000870100006C0000001100000003000F000100
      0000000000000000FFFFFF1F2C02000000000001000400C4E0F2E000000000FF
      FF00000000000200000001000000000F0054696D6573204E657720526F6D616E
      000A0000000200000000000A000000CC00020000000000FFFFFF000000000200
      00000000000000002F0A000005004D656D6F37000200C400000087010000A000
      00001100000003000F0001000000000000000000FFFFFF1F2C02000000000001
      000900CEF1EDEEE2E0EDE8E500000000FFFF0000000000020000000100000000
      0F0054696D6573204E657720526F6D616E000A0000000200000000000A000000
      CC00020000000000FFFFFF0000000002000000000000000000BF0A000005004D
      656D6F380002006401000087010000650000001100000003000F000100000000
      0000000000FFFFFF1F2C02000000000001000800CEEFE5F0E0F6E8FF00000000
      FFFF00000000000200000001000000000F0054696D6573204E657720526F6D61
      6E000A0000000200000000000A000000CC00020000000000FFFFFF0000000002
      0000000000000000004E0B000005004D656D6F39000200C901000087010000CE
      0000001100000003000F0001000000000000000000FFFFFF1F2C020000000000
      01000700CEF220EAEEE3EE00000000FFFF00000000000200000001000000000F
      0054696D6573204E657720526F6D616E000A0000000200000000000A000000CC
      00020000000000FFFFFF0000000002000000000000000000DB0B000006004D65
      6D6F31300002009702000087010000C40000001100000003000F000100000000
      0000000000FFFFFF1F2C02000000000001000400CAEEECF300000000FFFF0000
      0000000200000001000000000F0054696D6573204E657720526F6D616E000A00
      00000200000000000A000000CC00020000000000FFFFFF000000000200000000
      00000000006A0C000006004D656D6F31310002005B0300008701000048000000
      1100000003000F0001000000000000000000FFFFFF1F2C020000000000010006
      00CAEEEB2DE2EE00000000FFFF00000000000200000001000000000F0054696D
      6573204E657720526F6D616E000A0000000200000000000A000000CC00020000
      000000FFFFFF0000000002000000000000000000F80C000006004D656D6F3132
      000200A303000087010000660000001100000003000F00010000000000000000
      00FFFFFF1F2C02000000000001000500D1F3ECECE000000000FFFF0000000000
      0200000001000000000F0054696D6573204E657720526F6D616E000A00000002
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      0000860D000006004D656D6F3133000200240000008701000034000000110000
      0003000F0001000000000000000000FFFFFF1F2C02000000000001000500B920
      EF2FEF00000000FFFF00000000000200000001000000000F0054696D6573204E
      657720526F6D616E000A0000000200000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000002B0E000006004D656D6F313400020058
      000000B00100006C0000001100000003000F0001000000000000000000FFFFFF
      1F2C02000000000001001C005B6F64734B6172644F7065722E2246445F444154
      455F4F4E4C59225D00000000FFFF00000000000200000001000000000F005469
      6D6573204E657720526F6D616E000A0000000000000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000CD0E000006004D656D6F31
      35000200C4000000B0010000A00000001100000003000F000100000000000000
      0000FFFFFF1F2C020000000000010019005B6F64734B6172644F7065722E2246
      435F444F434D4958225D00000000FFFF00000000000200000001000000000F00
      54696D6573204E657720526F6D616E000A0000000000000000000A000000CC00
      020000000000FFFFFF00000000020000000000000000006D0F000006004D656D
      6F313600020064010000B0010000650000001100000003000F00010000000000
      00000000FFFFFF1F2C020000000000010017005B6F64734B6172644F7065722E
      2246435F4F504552225D00000000FFFF00000000000200000001000000000F00
      54696D6573204E657720526F6D616E000A0000000000000000000A000000CC00
      020000000000FFFFFF00000000020000000000000000000B10000006004D656D
      6F3137000200C9010000B0010000CE0000001100000003000F00010000000000
      00000000FFFFFF1F2C020000000000010015005B6F64734B6172644F7065722E
      2246435F4F54225D00000000FFFF00000000000200000001000000000F005469
      6D6573204E657720526F6D616E000A0000000000000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000AB10000006004D656D6F31
      3800020097020000B0010000C40000001100000003000F000100000000000000
      0000FFFFFF1F2C020000000000010017005B6F64734B6172644F7065722E2246
      435F4B4F4D55225D00000000FFFF00000000000200000001000000000F005469
      6D6573204E657720526F6D616E000A0000000000000000000A000000CC000200
      00000000FFFFFF00000000020000000000000000004A11000006004D656D6F31
      390002005B030000B0010000480000001100000003000F000100000000000000
      0000FFFFFF1F2C020000000000010016005B6F64734B6172644F7065722E2246
      4E5F4B4F4C225D00000000FFFF00000000000200000001000000000F0054696D
      6573204E657720526F6D616E000A0000000000000000000A000000CC00020000
      000000FFFFFF00000000020000000000000000000412000006004D656D6F3230
      000200A3030000B0010000660000001100000003000F00010000000000000000
      00FFFFFF1F2C02000000000001003100205B464F524D4154464C4F4154282730
      F02E2C3030EA2E272C5B6F64734B6172644F7065722E22464E5F53554D225D29
      5D00000000FFFF00000000000200000001000000000F0054696D6573204E6577
      20526F6D616E000A00000000000000000009000000CC00020000000000FFFFFF
      00000000020000000000000000009412000006004D656D6F3231000200240000
      00B0010000340000001100000003000F0001000000000000000000FFFFFF1F2C
      020000000000010007005B4C494E45235D00000000FFFF000000000002000000
      01000000000F0054696D6573204E657720526F6D616E000A0000000000000000
      000A000000CC00020000000000FFFFFF00000000020000000000000000004013
      000006004D656D6F3233000200A3030000DC010000660000001400000003000F
      0001000000000000000000FFFFFF1F2C020000000000010023005B464F524D41
      54464C4F4154282730F02E2C3030EA2E272C5B5072696853756D5D295D000000
      00FFFF00000000000200000001000000000F0054696D6573204E657720526F6D
      616E000A00000002000000000009000000CC00020000000000FFFFFF00000000
      02000000000000000000DA13000006004D656D6F323400020024000000DC0100
      0037030000140000000300000001000000000000000000FFFFFF1F2C02000000
      000001001100C8F2EEE3EE2028CFF0E8F5EEE4293A202000000000FFFF000000
      00000200000001000000000F0054696D6573204E657720526F6D616E000A0000
      0002000000000009000000CC00020000000000FFFFFF00000000020000000000
      000000006514000006004D656D6F3235000200A5030000C10200006000000012
      0000000300000001000000000000000000FFFFFF1F2C02000000000001000C00
      D1F2F02E205B50414745235D00000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000009000000CC00020000000000FFFF
      FF00000000020000000000000000001115000006004D656D6F3237000200A303
      0000F0010000660000001400000003000F0001000000000000000000FFFFFF1F
      2C020000000000010023005B464F524D4154464C4F4154282730F02E2C3030EA
      2E272C5B5261736853756D5D295D00000000FFFF000000000002000000010000
      00000F0054696D6573204E657720526F6D616E000A0000000200000000000900
      0000CC00020000000000FFFFFF0000000002000000000000000000AB15000006
      004D656D6F323800020024000000F00100003703000014000000030000000100
      0000000000000000FFFFFF1F2C02000000000001001100C8F2EEE3EE2028D0E0
      F1F5EEE4293A202000000000FFFF00000000000200000001000000000F005469
      6D6573204E657720526F6D616E000A00000002000000000009000000CC000200
      00000000FFFFFF00000000020000000000000000008016000006004D656D6F32
      390002002400000068000000E703000018000000030000000100000000000000
      0000FFFFFF1F2C02000000000001004C00E8E720EFE0F0F2E8E820B920205B6F
      64734D65644B6172742E22464E5F50415254595F4E554D225D20202020D1E5F0
      E8FF3A20205B6F64734D65644B6172742E2246435F53455249414C225D000000
      00FFFF00000000000200000001000000040F0054696D6573204E657720526F6D
      616E000E0000000000000000000A000000CC00020000000000FFFFFF00000000
      020000000000000000001217000006004D656D6F32320002005B030000DC0100
      00480000001400000003000F0001000000000000000000FFFFFF1F2C02000000
      0000010009005B507269684B6F6C5D00000000FFFF0000000000020000000100
      0000000F0054696D6573204E657720526F6D616E000A0000000200000000000A
      000000CC00020000000000FFFFFF0000000002000000000000000000A4170000
      06004D656D6F32360002005B030000F0010000480000001400000003000F0001
      000000000000000000FFFFFF1F2C020000000000010009005B526173684B6F6C
      5D00000000FFFF00000000000200000001000000000F0054696D6573204E6577
      20526F6D616E000A0000000200000000000A000000CC00020000000000FFFFFF
      000000000200000000000000FEFEFF000000000000000000000000FC00000000
      00000000000000000000000058005ADC09E273E7E240A49F48182D77E440}
  end
  object frDBDataSetMedKart: TfrDBDataSet
    DataSet = odsMedKart
    Left = 376
    Top = 146
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmMedKardLst\'
    StoredProps.Strings = (
      'cxGridMedicDBTableView1FC_EANCODE.Width'
      'cxGridMedicDBTableView1FC_FEDIZM.Width'
      'cxGridMedicDBTableView1FC_MEDIC.Width'
      'cxGridMedicDBTableView1FC_MEDICTYPENAME.Width'
      'cxGridMedicDBTableView1FC_MONAME.Width'
      'cxGridMedicDBTableView1FC_NAME.Width'
      'cxGridMedicDBTableView1FC_PAYTYPE.Width'
      'cxGridMedicDBTableView1FC_SERIAL.Width'
      'cxGridMedicDBTableView1FC_UCHGR.Width'
      'cxGridMedicDBTableView1FC_UEDIZM.Width'
      'cxGridMedicDBTableView1FD_GODEN.Width'
      'cxGridMedicDBTableView1FN_FPACKINUPACK.Width'
      'cxGridMedicDBTableView1FN_KOLOST.Width'
      'cxGridMedicDBTableView1FN_PARTY_NUM.Width'
      'cxGridMedicDBTableView1FN_PRICE.Width'
      'cxGridMedicDBTableView1FN_SUMM.Width'
      'cxGridMedicDBTableView1KARTID.Width'
      'cxGridMedicDBTableView1FC_EANCODE.Visible'
      'cxGridMedicDBTableView1FC_FEDIZM.Visible'
      'cxGridMedicDBTableView1FC_MEDIC.Visible'
      'cxGridMedicDBTableView1FC_MEDICTYPENAME.Visible'
      'cxGridMedicDBTableView1FC_MONAME.Visible'
      'cxGridMedicDBTableView1FC_NAME.Visible'
      'cxGridMedicDBTableView1FC_PAYTYPE.Visible'
      'cxGridMedicDBTableView1FC_SERIAL.Visible'
      'cxGridMedicDBTableView1FC_UCHGR.Visible'
      'cxGridMedicDBTableView1FC_UEDIZM.Visible'
      'cxGridMedicDBTableView1FD_GODEN.Visible'
      'cxGridMedicDBTableView1FN_FAS_KOLOST.Visible'
      'cxGridMedicDBTableView1FN_FAS_KOLOST.Width'
      'cxGridMedicDBTableView1FN_KOLOST.Visible'
      'cxGridMedicDBTableView1FN_OST_TYPE.Visible'
      'cxGridMedicDBTableView1FN_OST_TYPE.Width'
      'cxGridMedicDBTableView1FN_PARTY_NUM.Visible'
      'cxGridMedicDBTableView1FN_PRICE.Visible'
      'cxGridMedicDBTableView1KARTID.Visible'
      'cxGridMedicDBTableView1MEDICID.Visible'
      'cxGridMedicDBTableView1MEDICID.Width'
      'cxGridMedicDBTableView1FC_CERT.Visible'
      'cxGridMedicDBTableView1FC_CERT.Width'
      'cxGridMedicDBTableView1FC_PROD.Visible'
      'cxGridMedicDBTableView1FC_PROD.Width'
      'cxGridMedicDBTableView1FL_BRAK.Visible'
      'cxGridMedicDBTableView1FL_BRAK.Width'
      'cxGridMedicDBTableView1FN_FPACKINUPACK.Visible'
      'cxGridMedicDBTableView1FN_SUMM.Visible'
      'cxGridMedicDBTableView1BRAK_UNIQSTR.Width'
      'cxGridMedicDBTableView1FK_FINSOURCE_ID.Visible'
      'cxGridMedicDBTableView1FK_FINSOURCE_ID.Width'
      'cxGridMedicDBTableView1FC_INV_NOMER.Width'
      'cxGridMedicDBTableView1FC_INV_NOMER.Visible'
      'cxGridMedicDBTableView1FC_QUOTA_CODE.Visible'
      'cxGridMedicDBTableView1FC_QUOTA_CODE.Width'
      'cxGridMedicDBTableView1FK_SKLAD_ID.Visible'
      'cxGridMedicDBTableView1FK_SKLAD_ID.Width'
      'cxGridMedicDBTableView1FN_PRICE_MNF.Visible'
      'cxGridMedicDBTableView1FN_PRICE_MNF.Width'
      'cxGridMedicDBTableView1FN_NDS.Visible'
      'cxGridMedicDBTableView1FN_NDS.Width'
      'cxGridMedicDBTableView1FN_NACENKA.Visible'
      'cxGridMedicDBTableView1FN_NACENKA.Width'
      'cxGridMedicDBTableView1FL_JNVLS.Visible'
      'cxGridMedicDBTableView1FL_JNVLS.Width'
      'cxGridMedicDBTableView1FC_POSTAV.Visible'
      'cxGridMedicDBTableView1FC_POSTAV.Width'
      'cxGridMedicDBTableView1FC_INTERNATIONAL_NAME.Visible'
      'cxGridMedicDBTableView1FC_INTERNATIONAL_NAME.Width'
      'cxGridMedicDBTableView1FL_MIBP.Visible'
      'cxGridMedicDBTableView1FL_MIBP.Width'
      'cxGridMedicDBTableView1FL_FORMULAR.Visible'
      'cxGridMedicDBTableView1FL_FORMULAR.Width'
      'cxGridMedicDBTableView1FK_ATC.Visible'
      'cxGridMedicDBTableView1FK_ATC.Width'
      'cxGridMedicDBTableView1FC_OKDP.Width'
      'cxGridMedicDBTableView1FC_OKDP.Visible'
      'cxGridMedicDBTableView1FC_ATC_ROOT.Width'
      'cxGridMedicDBTableView1FC_ATC_ROOT.Visible'
      'cxGridMedicDBTableView1FL_FORM_KOMISS.Width'
      'cxGridMedicDBTableView1FL_FORM_KOMISS.Visible'
      'cxGridMedicDBTableView1prih_dpid.Visible'
      'cxGridMedicDBTableView1prih_dpid.Width'
      'cxGridMedicDBTableView1PRIH_DATA.Visible'
      'cxGridMedicDBTableView1PRIH_DATA.Width'
      'cxGridMedicDBTableView1FC_PRIH_DOC.Visible'
      'cxGridMedicDBTableView1FC_PRIH_DOC.Width')
    StoredValues = <>
    Left = 298
    Top = 204
  end
  object pmPrint: TPopupMenu
    Left = 304
    Top = 104
    object N10: TMenuItem
      Action = acPrint
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072
    end
    object N11: TMenuItem
      Action = acLittleKart
    end
  end
  object frLittleKart: TfrReport
    Dataset = frDBDataSetMedKart
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit, pbPageSetup]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 374
    Top = 108
    ReportForm = {
      1900000061060000190000000001000100FFFFFFFFFF09000000340800009A0B
      00002400000024000000240000002400000000FFFF0000FFFFFFFF0300000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200D50000000B004D61737465724461746131000201000000
      001C000000F6020000800000003000050001000000000000000000FFFFFF1F00
      0000000B00667244424461746153657400000000000000FFFF00000000000200
      0000010000000000000001000000C80000001400000001000000000000000051
      01000005004D656D6F310002003D00000025000000B40000006C00000003000F
      0001000000000000000000FFFFFF1F2C02000000000000000000000001000000
      0000000200000001000000000500417269616C00060000000000000000000000
      0000CC00020000000000FFFFFF00000000020000000000000000001C02000005
      004D656D6F330002004000000028000000AE0000003400000003000F00010000
      00000000000000FCF8AB002C02000000000002002900CDE0E8ECE5EDEEE2E0ED
      E8E520F0F3F13A205B6F64734D65644B6172742E2246435F4D45444943225D0D
      2100CBE0F22E3A20205B6F64734D65644B6172742E2246435F4C41545F4E414D
      45225D00000000FFFF00000000000200000001000000000500417269616C0007
      00000000000000000000000000CC00020000000000FFFFFF0000000002000000
      000000000000C302000005004D656D6F34000200400000006000000058000000
      0C00000003000F0001000000000000000000FFBBFF002C020000000000010029
      00C8F1F22EF4E8ED3A205B646D4D61696E2E6F64734D65644B6172742E224643
      5F50415954595045225D00000000FFFF00000000000200000001000000000500
      417269616C000600000002000000000000000000CC00020000000000FFFFFF00
      000000020000000000000000006C03000005004D656D6F350002009C00000060
      000000520000000C00000003000F0001000000000000000000C1EFA0002C0200
      0000000001002B00D3EF2EE5E42EE8E7EC2E3A205B646D4D61696E2E6F64734D
      65644B6172742E2246435F554544495A4D225D00000000FFFF00000000000200
      000001000000000500417269616C000600000002000000000000000000CC0002
      0000000000FFFFFF00000000020000000000000000001104000005004D656D6F
      3600020040000000700000004C0000000C00000003000F000100000000000000
      0000AFF4F8002C02000000000001002700CAEEEB2DE2EE3A205B646D4D61696E
      2E6F64734D65644B6172742E22464E5F4B4F4C4F5354225D00000000FFFF0000
      0000000200000001000000000500417269616C00060000000200000000000000
      0000CC00020000000000FFFFFF0000000002000000000000000000B704000005
      004D656D6F3700020090000000700000005E0000000C00000003000F00010000
      00000000000000FCA798002C02000000000001002800C3EEE4E5ED20E4EE3A20
      5B646D4D61696E2E6F64734D65644B6172742E2246445F474F44454E225D0000
      0000FFFF00000000000200000001000000000500417269616C00060000000200
      0000000000000000CC00020000000000FFFFFF00000000020000000000000000
      007305000005004D656D6F380002008C00000080000000620000000C00000003
      000F0001000000000000000000FECDFE002C02000000000001003E00D1F3ECEC
      E03A205B464F524D4154464C4F4154282730F02E2C3030EA2E272C5B646D4D61
      696E2E6F64734D65644B6172742E22464E5F53554D4D225D295D00000000FFFF
      00000000000200000001000000000500417269616C0006000000020000000000
      00000000CC00020000000000FFFFFF00000000020000000000000000002F0600
      0005004D656D6F390002004000000080000000480000000C00000003000F0001
      000000000000000000C5BCF1002C02000000000001003E00D6E5EDE03A205B46
      4F524D4154464C4F4154282730F02E2C3030EA2E272C5B646D4D61696E2E6F64
      734D65644B6172742E22464E5F5052494345225D295D00000000FFFF00000000
      000200000001000000000500417269616C000600000002000000000000000000
      CC00020000000000FFFFFF000000000200000000000000FEFEFF000000000000
      000000000000FC0000000000000000000000000000000058005ADC09E273E7E2
      40A49F48182D77E440}
  end
  object frDBDataSetKardoper: TfrDBDataSet
    DataSet = odsKardoper
    Left = 488
    Top = 144
  end
  object odsMO_GROUP: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  MG.*'
      'FROM MED.TMO_GROUP MG'
      'WHERE MG.FL_DEL = 0'
      'ORDER BY MG.FC_GROUP')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000040000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C0100000000000800000046
      4B5F504841524D010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 588
    Top = 116
  end
  object dsMO_GROUP: TDataSource
    DataSet = odsMO_GROUP
    Left = 590
    Top = 164
  end
  object frReport1: TfrReport
    Dataset = frDBDataSetMedKart
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit, pbPageSetup]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 204
    Top = 138
    ReportForm = {
      19000000A80A0000190000000001000100FFFFFFFFFF09000000340800009A0B
      00002400000024000000240000002400000000FFFF0000FFFFFFFF0200000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200D50000000B004D61737465724461746131000201000000
      0024000000F6020000A80000003000050001000000000000000000FFFFFF1F00
      0000000B00667244424461746153657400000000000000FFFF00000000000200
      0000010000000000000001000000C80000001400000001000000000000000051
      01000005004D656D6F310002004C0000002D000000F80000009700000003000F
      0001000000000000000000FFFFFF1F2C02000000000000000000000001000000
      0000000200000001000000000500417269616C00090000000000000000000000
      0000CC00020000000000FFFFFF0000000002000000000000000000E601000005
      004D656D6F330002004D00000039000000F60000002600000003000000010000
      00000000000000FFFFFF1F2C020000000000010017005B6F64734D65644B6172
      742E2246435F4D45444943225D00000000FFFF00000000000200000001000000
      000500417269616C000B00000002000000FF000A000000CC00020000000000FF
      FFFF00000000020000000000000000006C02000005004D656D6F350002004D00
      0000A200000031000000100000000300000001000000000000000000FFFFFF1F
      2C02000000000001000800C5E42E20E8E7EC2E00000000FFFF00000000000200
      000001000000000500417269616C000800000002000000000000000000CC0002
      0000000000FFFFFF0000000002000000000000000000F102000005004D656D6F
      360002004D000000B30000003200000010000000030000000100000000000000
      0000FFFFFF1F2C02000000000001000700CAEEEB2DE2EE3A00000000FFFF0000
      0000000200000001000000000500417269616C00080000000200000000000800
      0000CC00020000000000FFFFFF00000000020000000000000000008503000006
      004D656D6F31320002007D000000B30000006A00000010000000030000000100
      0000000000000000FFFFFF1F2C020000000000010015005B6F64734D65644B61
      72742E22464E5F4B4F4C225D00000000FFFF0000000000020000000100000000
      0500417269616C00080000000200000000000A000000CC00020000000000FFFF
      FF00000000020000000000000000002B04000006004D656D6F3133000200C300
      00006100000080000000140000000300000001000000000000000000FFFFFF1F
      2C020401100023232320232323202323302E303020F000010017005B6F64734D
      65644B6172742E22464E5F5052494345225D00000000FFFF0000000000020000
      0001000000000500417269616C000C0000000200FF0000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000CB04000006004D656D6F31
      34000200EC000000A30000005700000010000000030000000100000000000000
      0000FFFF00002C0000000A0064642E6D6D2E7979797900010017005B6F64734D
      65644B6172742E2246435F474F44454E225D00000000FFFF0000000000020000
      0001000000000500417269616C00080000000200000000000A000000CC000200
      00000000FFFFFF00000000020000000000000000006205000006004D656D6F31
      350002007D000000A30000006A00000010000000030002000100000000000000
      0000FFFFFF1F2C020000000000010018005B6F64734D65644B6172742E224643
      5F554544495A4D225D00000000FFFF0000000000020000000100000000050041
      7269616C000800000002000000000012000000CC00020000000000FFFFFF0000
      000002000000000000000000F405000006004D656D6F31370002004D0000002E
      000000F60000000C0000000300000001000000000000000000FFFFFF1F2C0200
      0000000001001300D1D2C5CBCBC0C6CDC0DF20CAC0D0D2CED7CAC000000000FF
      FF00000000000200000001000000000500417269616C000A0000000200000000
      000A0000000100020000000000FFFFFF00000000020000000000000000008006
      000005004D656D6F32000200C300000075000000800000000D00000003000800
      01000000000000000000FFFFFF1F2C02000000000001000E00F6E5EDE020F0EE
      E7EDE8F7EDE0FF00000000FFFF00000000000200000001000000000500417269
      616C0006000000000000000000020000000100020000000000FFFFFF00000000
      020000000000000000001C07000006004D656D6F31380002004D000000790000
      009A0000001C0000000300000001000000000000000000FFFFFF1F2C02000000
      000001001D005B6F64734D65644B6172742E2246435F504F535441565F4E414D
      45225D00000000FFFF00000000000200000001000000000500417269616C0008
      000000020000000000120000000100020000000000FFFFFF0000000002000000
      000000000000A407000006004D656D6F31390002004D000000950000009A0000
      000B0000000300080001000000000000000000FFFFFF1F2C0200000000000100
      0900EFEEF1F2E0E2F9E8EA00000000FFFF000000000002000000010000000005
      00417269616C0007000000000000000000020000000100020000000000FFFFFF
      00000000020000000000000000004308000006004D656D6F3231000200EC0000
      008200000057000000100000000300000001000000000000000000FFFFFF1F2C
      0004020A0064642E6D6D2E7979797900010016005B6F64734D65644B6172742E
      2266645F64617461225D00000000FFFF00000000000200000001000000000500
      417269616C00080000000200000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000D208000006004D656D6F3230000200EC000000
      95000000570000000C0000000300080001000000000000000000FFFFFF1F2C02
      000000000001001000E4E0F2E020EFEEF1F2F3EFEBE5EDE8FF00000000FFFF00
      000000000200000001000000000500417269616C000600000000000000000002
      0000000100020000000000FFFFFF000000000200000000000000000068090000
      05004D656D6F340002004D000000610000007100000014000000030000000100
      0000000000000000FFFFFF1F2C020000000000010018005B6F64734D65644B61
      72742E2246435F53455249414C225D00000000FFFF0000000000020000000100
      0000000500417269616C00080000000200000000001200000001000200000000
      00FFFFFF0000000002000000000000000000EB09000005004D656D6F38000200
      4D00000075000000710000000B0000000300080001000000000000000000FFFF
      FF1F2C02000000000001000500F1E5F0E8FF00000000FFFF0000000000020000
      0001000000000500417269616C00060000000000000000000200000001000200
      00000000FFFFFF0000000002000000000000000000760A000005004D656D6F39
      000200EC000000B3000000570000000C00000003000800010000000000000000
      00FFFF00002C02000000000001000D00D1F0EEEA20E3EEE4EDEEF1F2E8000000
      00FFFF00000000000200000001000000000500417269616C0006000000000000
      000000020000000100020000000000FFFFFF000000000200000000000000FEFE
      FF000000000000000000000000FC000000000000000000000000000000005800
      5ADC09E273E7E240DBA548182D77E440}
  end
  object pmKartLst: TPopupMenu
    Left = 732
    Top = 112
    object N1: TMenuItem
      Action = acMoveFromRezerv
    end
    object N2: TMenuItem
      Action = acMoveToRezerv
    end
  end
  object oqMoveToRezerv: TOracleQuery
    SQL.Strings = (
      'declare'
      '  DPID_REZERV NUMBER;'
      '  CUR_MO NUMBER;'
      '  CUR_MO_GROUP NUMBER;  '
      'begin'
      '  CUR_MO := med.pkg_medses.get_curmo;'
      '  CUR_MO_GROUP := med.pkg_medses.get_cur_mogroup_by_cur_mo; '
      '  DPID_REZERV :=med.pkg_prihrash.createshablon(2,4);'
      
        '  :DPCID := med.pkg_prihrash.doSetPrihRash(DPID_REZERV, :aKol, :' +
        'aPrice, :aKartId, -1, 2); '
      ''
      '  UPDATE med.tdocs'
      '  SET fn_price = :aKol*:aPrice,'
      '      fc_comment = '#39#1055#1077#1088#1077#1085#1086#1089' '#1074' '#1088#1077#1079#1077#1088#1074' ('#1089#1076#1077#1083#1072#1085' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080')'#39','
      '      fc_doc = TO_CHAR(DPID_REZERV),'
      '      motoid = CUR_MO,'
      '      mofromid = CUR_MO,'
      '      fk_mogroupid_to = CUR_MO_GROUP,'
      '      fk_mogroupid_from = CUR_MO_GROUP,'
      '      fd_invoice = sysdate,'
      '      fd_data = sysdate,'
      '      fl_edit = 0'
      '  WHERE dpid = DPID_REZERV;'
      ''
      ''
      '  commit;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000004000000050000003A414B4F4C040000000000000000000000070000
      003A415052494345040000000000000000000000080000003A414B4152544944
      030000000000000000000000060000003A445043494403000000000000000000
      0000}
    Cursor = crSQLWait
    Left = 64
    Top = 210
  end
  object oqMoveFromRezerv: TOracleQuery
    SQL.Strings = (
      'declare'
      '  DPID_REZERV NUMBER;'
      '  CUR_MO NUMBER;'
      '  CUR_MO_GROUP NUMBER;'
      '  DPC_COUNT NUMBER;  '
      'begin'
      '  CUR_MO := med.pkg_medses.get_curmo;'
      '  CUR_MO_GROUP := med.pkg_medses.get_cur_mogroup_by_cur_mo;'
      
        '  select max(dp.dpid), count(*) into DPID_REZERV, DPC_COUNT from' +
        ' med.tdpc dp where dp.dpcid = :DPCID;'
      ''
      '  delete from med.tdpc dp where dp.dpcid = :DPCID; '
      '  '
      '  delete from med.tmediate_ost'
      '   where fk_rezerv_dpcid = :DPCID;'
      '  '
      '  select count(*) into DPC_COUNT from med.tdpc dp'
      '  where dp.dpid = DPID_REZERV;'
      '  '
      
        '  --UPDATE med.tdocs d set fl_edit=1 WHERE dpid = DPID_REZERV;  ' +
        '-- '#1089#1085#1103#1090#1100' '#1089' '#1087#1086#1076#1087#1080#1089#1080' '#1077#1089#1083#1080' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1073#1099#1083' '#1087#1086#1076#1087#1080#1089#1072#1085
      
        '  if DPC_COUNT = 1 then -- '#1077#1089#1083#1080' '#1073#1099#1083#1072' '#1086#1076#1085#1072' '#1087#1086#1079#1080#1094#1080#1103' '#1080' '#1084#1099' '#1077#1105' '#1091#1076#1072#1083#1080#1083 +
        #1080', '#1091#1076#1072#1083#1103#1077#1084' '#1076#1086#1082#1091#1084#1077#1085#1090
      '    med.pkg_prihrash.dodel(DPID_REZERV);'
      '  else -- '#1077#1089#1083#1080' '#1090#1072#1084' '#1077#1097#1077' '#1095#1090#1086'-'#1090#1086' '#1086#1089#1090#1072#1083#1086#1089#1100' '#1086#1073#1085#1086#1074#1083#1103#1077#1084' '#1094#1077#1085#1091
      
        '    UPDATE med.tdocs d set d.fn_price = (select sum(k.fn_price*d' +
        'p.fn_kol) from med.tdpc dp, med.tkart k where dp.kartid = k.kart' +
        'id and dp.dpid = d.dpid)'
      '    where d.dpid = DPID_REZERV;'
      
        '   -- UPDATE med.tdocs d set fl_edit=0 WHERE dpid = DPID_REZERV ' +
        'and d.fn_price>0; -- '#1087#1086#1076#1087#1080#1089#1072#1090#1100
      '  end if;'
      '  commit;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000001000000060000003A44504349440300000004000000010000000000
      0000}
    Cursor = crSQLWait
    Left = 66
    Top = 266
  end
  object sd: TSaveDialog
    DefaultExt = 'xls'
    FileName = #1057#1087#1080#1089#1086#1082' '#1086#1089#1090#1072#1090#1082#1086#1074'.xls'
    Filter = 'Excel Files (*.xls)|*.xls'
    Left = 646
    Top = 3
  end
  object tmrEANCode: TTimer
    Enabled = False
    Interval = 400
    OnTimer = tmrEANCodeTimer
    Left = 358
    Top = 258
  end
  object dsMedKart: TDataSource
    DataSet = odsMedKart
    Left = 88
    Top = 128
  end
  object odsMedKart: TOracleDataSet
    SQL.Strings = (
      '/*run time*/'
      '-- '#1102#1085#1080#1090' fMedKardLst '#1079#1072#1084#1077#1085#1103#1077#1090' '#1101#1090#1086#1090' '#1079#1072#1087#1088#1086#1089'!!!!'
      'SELECT  '
      'VMEDKART_VS_OST.*,    '
      '    trunc(FD_GODEN) as FD_GODEN,  '
      '    1  AS FN_KOL,  '
      '    MOID  AS M,  '
      '    TRUNC(SYSDATE + 1) AS D'
      '  FROM med.VMEDKART_VS_OST'
      ''
      'ORDER BY LOWER(FC_MEDIC), fn_party_num')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000280000000700000046435F4E414D450100000000000800000046435F
      4D454449430100000000000800000046445F474F44454E010000000000090000
      0046435F53455249414C01000000000006000000464E5F4B4F4C010000000000
      060000004B4152544944010000000000070000004D4544494349440100000000
      0008000000464E5F5052494345010000000000010000004D0100000000000100
      0000440100000000000900000046435F4D4F4E414D450100000000000A000000
      46435F45414E434F444501000000000010000000464B5F4D4544494354595045
      4E414D450100000000001000000046435F4D45444943545950454E414D450100
      000000000A000000464B5F504159545950450100000000000A00000046435F50
      4159545950450100000000000900000046435F554544495A4D0100000000000F
      000000464E5F465041434B494E555041434B0100000000000A000000464B5F46
      5041434B49440100000000000900000046435F464544495A4D01000000000009
      000000464E5F4B4F4C4F53540100000000000C000000464E5F50415254595F4E
      554D01000000000006000000464C5F44454C010000000000040000004D4F4944
      0100000000000B00000046435F4C41545F4E414D450100000000000700000046
      435F4F4B454901000000000007000000464E5F53554D4D0100000000000A0000
      0046445F474F44454E5F31010000000000070000005543484752494401000000
      00000800000046435F55434847520100000000000B000000464E5F4F53545F54
      5950450100000000000D000000464E5F4641535F4B4F4C4F5354010000000000
      0500000044504349440100000000000700000046435F50524F44010000000000
      0700000046435F434552540100000000000D000000464E5F50524F4443455254
      49440100000000000B000000464B5F534B4C41445F4944010000000000070000
      00464C5F4252414B0100000000000C0000004252414B5F554E49515354520100
      000000000F000000464B5F46494E534F555243455F4944010000000000}
    Cursor = crSQLWait
    UniqueFields = 'kartid'
    LockingMode = lmNone
    OnApplyRecord = odsMedKartApplyRecord
    UpdatingTable = 'med.tkart'
    Session = dmMain.os
    Left = 48
    Top = 128
  end
  object odsKardoper: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '       tdocs.fd_data, '
      '       TRUNC(tdocs.fd_data) FD_DATE_ONLY, '
      
        '--       CASE WHEN (TDOCS.FP_VIDMOVE = 5)AND(TDOCS.MOTOID = MED.' +
        'PKG_MEDSES.GET_CURMO) THEN '#39#1055#1088#1080#1093#1086#1076#39' ELSE MED.GET_DECODEDOCVID (F' +
        'P_VIDMOVE) END AS FC_OPER, '
      
        '       DECODE(MED.PKG_PRIHRASH.Get_PrihRashPriznak(TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_t' +
        'o, :MO_GROUPID), -1, '#39#1056#1072#1089#1093#1086#1076#39', 1, '#39#1055#1088#1080#1093#1086#1076#39', '#39#39') AS FC_OPER,'
      
        '--       CASE WHEN (TDOCS.FP_VID = 2)AND(TDOCS.fk_mogroupid_to =' +
        ' MED.PKG_MEDSES.get_cur_mogroup_by_cur_mo) THEN '#39#1055#1088#1080#1093#1086#1076#39' ELSE ME' +
        'D.GET_DECODEDOCVID (FP_VIDMOVE) END AS FC_OPER, '
      '       TDPC.KARTID,'
      '       TDOCS.FC_DOC,'
      '       TDOCS.FP_VID,'
      '       TDOCS.FP_VIDMOVE,'
      '       TDOCS.FN_PRICE,'
      '       TDPC.DPID, TDPC.DPCID,'
      
        '       MED.PKGTDOCS.GET_DOC_SOURCE (TDOCS.fp_vid, TDOCS.fp_vidmo' +
        've, TDOCS.fk_mogroupid_FROM, TDOCS.postavid) as FC_OT,'
      '      '
      '--       DECODE ('
      '--          FP_VIDMOVE,'
      
        '--          1, MED.PKGTPOSTAV.GETNAMEBYID (POSTAVID), 10,MED.PKG' +
        'TPOSTAV.GETNAMEBYID (POSTAVID),'
      
        '--          MED.PKG_MEDSES.GET_MOGROUP_NAME (TDOCS.fk_mogroupid_' +
        'from)'
      '--       ) AS FC_OT,'
      
        '-- '#1048#1079#1084#1077#1085#1080#1083' '#1042#1086#1088#1086#1085#1086#1074' '#1054'.'#1040'. 16.04.2007 '#1055#1088#1080#1095#1077#1089#1099#1074#1072#1077#1084' '#1080' '#1076#1077#1083#1072#1077#1084' '#1074#1089#1077' '#1087#1086' '#1091 +
        #1084#1091' '#1087#1086' '#1072#1085#1072#1083#1086#1075#1080#1080' '#1089' GET_DECODEDOCVID'
      
        '      (MED.GET_DECODEDOCVIDMOVE(TDOCS.FP_VIDMOVE)||'#39' '#8470' '#39'||tdocs.' +
        'fc_doc||Decode(fd_invoice,'#39#39','#39#39','#39' '#1086#1090' '#39')||to_char(tdocs.fd_invoic' +
        'e,'#39'dd.mm.yyyy'#39')) AS fc_docmix,'
      '       TDPC.FN_KOL, '
      '       TEI.FC_NAME AS FC_UEDIZM, '
      '--       TRUNC(TDPC.FN_SUMM,2) AS FN_SUM,'
      '       TRUNC(TDPC.FN_KOL*TKART.FN_PRICE,2) AS FN_SUM,'
      
        '--       MED.PKG_MEDSES.GET_MOGROUP_NAME (TDOCS.fk_mogroupid_to)' +
        ' AS FC_KOMU,'
      
        '      MED.PKGTDOCS.GET_DOC_DESTINATION(TDOCS.fp_vid, TDOCS.fp_vi' +
        'dmove, TDOCS.fk_mogroupid_TO, TDOCS.postavid) AS FC_KOMU,'
      ''
      '       TDOCS.FC_DOC, TDOCS.FD_INVOICE,'
      '       T2.FC_NAME AS FC_FEDIZM,'
      '       TDPC.FN_KOL * TMEDIC.FN_FPACKINUPACK AS FN_FKOL'
      
        'FROM med.TDPC, med.TKART, med.TMEDIC, med.TEI, med.TEI T2, /*med' +
        '.TMO, */med.TDOCS'
      'WHERE '
      '  TDPC.KARTID = :PFK_ID'
      '-- AND TMo.moid = :MOID'
      '  '
      '  AND TDOCS.DPID = TDPC.DPID'
      '  AND TDOCS.FL_EDIT = 0 -- '#1055#1054#1044#1055#1048#1057#1040#1053#1053#1067#1045
      '--  AND TDOCS.MOTOID = TMO.MOID (+)'
      ''
      '  AND TKart.kartid = TDPC.kartid'
      '  --AND tkart.fl_del = 0  --'#1055#1091#1089#1090#1100' '#1086#1090#1086#1073#1088#1072#1078#1072#1102#1090#1089#1103' '#1074#1089#1077
      
        '--  AND TKART.fk_mogroupid = TMO.fk_curmogroupid  -- '#1090#1077#1087#1077#1088#1100' '#1087#1072#1088#1090 +
        #1080#1080' '#1092#1080#1083#1100#1090#1088#1091#1102#1090#1089#1103' '#1087#1086' '#1075#1088#1091#1087#1087#1077' '#1052#1054
      
        '--  AND (TDOCS.MOFROMID = :MOID OR TDOCS.MOTOID = :MOID OR MOOWN' +
        'ERID=:MOID)'
      
        '  AND (:MO_GROUPID in( TDOCS.fk_mogroupid_to, TDOCS.fk_mogroupid' +
        '_from))'
      ''
      ''
      
        '--  AND TDOCS.FD_DATA BETWEEN TRUNC(PKG_MEDSES.GET_DATA1) AND TR' +
        'UNC(PKG_MEDSES.GET_DATA2) + 1 - 1/(24*60*60)'
      '  AND TMEDIC.MEDICID = TKART.MEDICID'
      '  AND TMEDIC.EIID = TEI.EIID'
      '  AND TMEDIC.FK_FPACKID = T2.EIID (+)'
      ''
      '--  AND TMEDIC.FL_VISIBLE = 1 -- '#1087#1086#1082#1072#1079#1099#1074#1072#1077#1084' '#1074#1089#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099
      'ORDER BY TDOCS.FD_DATA ASC,TDOCS.FP_VID DESC'
      ''
      ''
      '/*SELECT '
      '       tdocs.fd_data, '
      
        '       CASE WHEN (TDOCS.FP_VIDMOVE = 5)AND(TDOCS.MOTOID = PKG_ME' +
        'DSES.GET_CURMO) THEN '#39#1055#1088#1080#1093#1086#1076#39' ELSE GET_DECODEDOCVID (FP_VIDMOVE)' +
        ' END AS FC_OPER, '
      '       TDOCS.FC_DOC,'
      '       TDOCS.FP_VID,'
      '       TDOCS.FP_VIDMOVE,'
      '       TDOCS.FN_PRICE,'
      '       TDPC.DPID,'
      '       DECODE ('
      '          FP_VID,'
      '          1, PKGTPOSTAV.GETNAMEBYID (POSTAVID),'
      '          2, PKGTMO.GETNAMEBYID (MOFROMID),'
      '          3, PKGTMO.GETNAMEBYID (MOFROMID)'
      '       ) AS FC_OT,'
      
        '-- '#1048#1079#1084#1077#1085#1080#1083' '#1042#1086#1088#1086#1085#1086#1074' '#1054'.'#1040'. 16.04.2007 '#1055#1088#1080#1095#1077#1089#1099#1074#1072#1077#1084' '#1080' '#1076#1077#1083#1072#1077#1084' '#1074#1089#1077' '#1087#1086' '#1091 +
        #1084#1091' '#1087#1086' '#1072#1085#1072#1083#1086#1075#1080#1080' '#1089' GET_DECODEDOCVID'
      
        '      (GET_DECODEDOCVIDMOVE(TDOCS.FP_VIDMOVE)||'#39' '#8470' '#39'||tdocs.fc_d' +
        'oc||Decode(fd_invoice,'#39#39','#39#39','#39' '#1086#1090' '#39')||to_char(tdocs.fd_invoice,'#39'd' +
        'd.mm.yyyy'#39')) AS fc_docmix,'
      '       TDPC.FN_KOL, '
      '       TEI.FC_NAME AS FC_UEDIZM, '
      '       TRUNC(TDPC.FN_SUMM,2) AS FN_SUM,'
      '       TMO.FC_NAME AS FC_KOMU,'
      '       TDOCS.FC_DOC, TDOCS.FD_INVOICE,'
      '       T2.FC_NAME AS FC_FEDIZM,'
      '       TDPC.FN_KOL * TMEDIC.FN_FPACKINUPACK AS FN_FKOL'
      'FROM TDOCS, TDPC, TKART, TMEDIC, TEI, TEI T2, TMO '
      'WHERE TDOCS.DPID = TDPC.DPID'
      '  AND TDPC.KARTID = :PFK_ID'
      
        '  AND (TDOCS.MOFROMID = :MOID OR TDOCS.MOTOID = :MOID OR MOOWNER' +
        'ID=:MOID) --'#1079#1072#1084#1077#1085#1072' moid '#1085#1072' '#1085#1080#1078#1085#1080#1077' '#1089#1090#1088#1086#1082#1080
      '  AND TDOCS.FL_EDIT = 0 --  '#1055#1054#1044#1055#1048#1057#1040#1053#1053#1067#1045
      
        '  AND TDOCS.FD_DATA BETWEEN TRUNC(PKG_MEDSES.GET_DATA1) AND TRUN' +
        'C(PKG_MEDSES.GET_DATA2) + 1 - 1/(24*60*60)'
      '  AND TDPC.KARTID = TKART.KARTID'
      '  AND tkart.fl_del = 0'
      '  AND TMEDIC.MEDICID = TKART.MEDICID'
      '  AND TMEDIC.EIID = TEI.EIID'
      '  AND TMEDIC.FK_FPACKID = T2.EIID (+)'
      '  AND TDOCS.MOTOID = TMO.MOID (+)'
      '  AND TMEDIC.FL_VISIBLE = 1'
      'ORDER BY TDOCS.FD_DATA DESC,TDOCS.FP_VID DESC'
      '*/')
    Optimize = False
    Variables.Data = {
      0300000002000000070000003A50464B5F49440300000000000000000000000B
      0000003A4D4F5F47524F55504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000120000000600000046435F444F430100000000000500000046435F4F
      540100000000000700000046435F4B4F4D550100000000000700000046445F44
      41544101000000000006000000464E5F4B4F4C0100000000000700000046435F
      4F50455201000000000006000000464E5F53554D010000000000090000004643
      5F444F434D49580100000000000A00000046445F494E564F4943450100000000
      000600000046505F5649440100000000000800000046435F444F435F31010000
      000000040000004450494401000000000008000000464E5F5052494345010000
      0000000A00000046505F5649444D4F56450100000000000900000046435F5545
      44495A4D0100000000000900000046435F464544495A4D010000000000070000
      00464E5F464B4F4C010000000000060000004B4152544944010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 40
    Top = 408
  end
  object dsKardOper: TDataSource
    DataSet = odsKardoper
    Left = 104
    Top = 408
  end
end
