object fmTemplates: TfmTemplates
  Left = 0
  Top = 0
  Caption = #1064#1072#1073#1083#1086#1085#1099
  ClientHeight = 349
  ClientWidth = 426
  Color = clBtnFace
  Constraints.MinHeight = 350
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 188
    Width = 426
    Height = 5
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 511
  end
  object grbTemplates: TcxGroupBox
    Left = 0
    Top = 44
    Align = alTop
    Caption = ' '#1064#1072#1073#1083#1086#1085#1099' '
    TabOrder = 0
    Height = 144
    Width = 426
    object grTemplates: TcxGrid
      Left = 2
      Top = 18
      Width = 422
      Height = 124
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnEnter = grTemplatesEnter
      LookAndFeel.Kind = lfFlat
      object grTemplatesDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsTTEMPLATE_DOC
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Active = True
        DataController.KeyFieldNames = 'fk_id'
        DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
            Kind = skSum
            FieldName = 'SUMM'
          end
          item
            Kind = skSum
          end>
        DataController.Summary.SummaryGroups = <>
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        OptionsBehavior.CellHints = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.ImmediateEditor = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.MultiSelect = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        Preview.MaxLineCount = 2
        Styles.ContentEven = dmMain.cxStyleGridEvenRow
        Styles.ContentOdd = dmMain.cxStyleGridOddRow
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        object grTemplates_FK_ID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'FK_ID'
          Visible = False
          Width = 45
        end
        object grTemplates_FC_DESCR: TcxGridDBColumn
          Caption = #1064#1072#1073#1083#1086#1085
          DataBinding.FieldName = 'FC_DESCR'
          SortIndex = 0
          SortOrder = soAscending
          Width = 448
        end
      end
      object grTemplatesLevel1: TcxGridLevel
        GridView = grTemplatesDBTableView1
      end
    end
  end
  object CoolBar2: TCoolBar
    Left = 0
    Top = 0
    Width = 426
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 40
        Width = 426
      end>
    EdgeBorders = [ebTop, ebBottom]
    object ToolBar2: TToolBar
      Left = 9
      Top = 0
      Width = 417
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 86
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ShowCaptions = True
      TabOrder = 0
      object tbuSelect: TToolButton
        Left = 0
        Top = 0
        AutoSize = True
        Caption = #1042#1099#1073#1088#1072#1090#1100
        ImageIndex = 30
        ParentShowHint = False
        ShowHint = True
        OnClick = tbuSelectClick
      end
      object ToolButton1: TToolButton
        Left = 55
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object tbuEdit: TToolButton
        Left = 63
        Top = 0
        AllowAllUp = True
        AutoSize = True
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        ImageIndex = 3
        Style = tbsCheck
        OnClick = tbuEditClick
      end
      object tbuDel: TToolButton
        Left = 153
        Top = 0
        AutoSize = True
        Caption = #1059#1076#1072#1083#1080#1090#1100
        ImageIndex = 46
        OnClick = tbuDelClick
      end
      object ToolButton3: TToolButton
        Left = 208
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbuClose: TToolButton
        Left = 216
        Top = 0
        AutoSize = True
        Caption = #1047#1072#1082#1088#1099#1090#1100
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = tbuCloseClick
      end
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 193
    Align = alClient
    Caption = ' '#1055#1086#1079#1080#1094#1080#1080' '
    TabOrder = 1
    Height = 156
    Width = 426
    object grTemplate_DPC: TcxGrid
      Left = 2
      Top = 18
      Width = 422
      Height = 136
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnEnter = grTemplate_DPCEnter
      LookAndFeel.Kind = lfFlat
      object grTemplate_DPCDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsTTemplate_dpc
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Active = True
        DataController.KeyFieldNames = 'fk_id'
        DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
            Kind = skSum
            FieldName = 'SUMM'
          end
          item
            Kind = skSum
          end>
        DataController.Summary.SummaryGroups = <>
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        OptionsBehavior.CellHints = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.ImmediateEditor = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.MultiSelect = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        Preview.MaxLineCount = 2
        Styles.ContentEven = dmMain.cxStyleGridDetailEvenRow
        Styles.ContentOdd = dmMain.cxStyleGridDetailOddRow
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        object grTemplate_DPC_fk_id: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'fk_id'
          Visible = False
          Width = 42
        end
        object grTemplate_DPC_fk_template_doc_id: TcxGridDBColumn
          DataBinding.FieldName = 'fk_template_doc_id'
          Visible = False
          VisibleForCustomization = False
        end
        object grTemplate_DPC_fc_medic: TcxGridDBColumn
          Caption = #1052#1077#1076#1080#1082#1072#1084#1077#1085#1090
          DataBinding.FieldName = 'fc_medic'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = grTemplate_DPCDBTableView1Column1PropertiesButtonClick
          Width = 337
        end
        object grTemplate_DPC_fk_medic_id: TcxGridDBColumn
          Caption = #1052#1077#1076#1080#1082#1072#1084#1077#1085#1090
          DataBinding.FieldName = 'fk_medic_id'
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
          Width = 343
        end
        object grTemplate_DPC_fn_kol: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086
          DataBinding.FieldName = 'fn_kol'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.ImmediatePost = True
          Properties.SpinButtons.Position = sbpHorzLeftRight
          Properties.ValueType = vtFloat
          Width = 71
        end
      end
      object grTemplate_DPCLevel1: TcxGridLevel
        GridView = grTemplate_DPCDBTableView1
      end
    end
  end
  object odsTTEMPLATE_DOC: TOracleDataSet
    SQL.Strings = (
      'select d.ROWID, d.* from med.TTEMPLATE_DOC d'
      'where d.FK_MO_GROUP_ID = :FK_MO_GROUP_ID')
    Optimize = False
    Variables.Data = {
      03000000010000000F0000003A464B5F4D4F5F47524F55505F49440300000000
      00000000000000}
    Session = dmMain.os
    AfterScroll = odsTTEMPLATE_DOCAfterScroll
    Left = 48
    Top = 88
  end
  object dsTTEMPLATE_DOC: TDataSource
    DataSet = odsTTEMPLATE_DOC
    Left = 48
    Top = 136
  end
  object dsTTemplate_dpc: TDataSource
    DataSet = dmMain.odsTTemplate_dpc
    Left = 48
    Top = 288
  end
end
