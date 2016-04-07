object frmInvEdit: TfrmInvEdit
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080' '#8470' '
  ClientHeight = 502
  ClientWidth = 811
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 811
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 805
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 798
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 62
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ShowCaptions = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acSave
      end
      object ToolButton2: TToolButton
        Left = 62
        Top = 0
        Action = acCancel
      end
    end
  end
  object pcInventory: TcxPageControl
    Left = 0
    Top = 40
    Width = 811
    Height = 462
    ActivePage = tsInventory
    Align = alClient
    Constraints.MinHeight = 60
    Images = dmMain.ilMain
    TabOrder = 1
    ClientRectBottom = 462
    ClientRectRight = 811
    ClientRectTop = 25
    object tsInventory: TcxTabSheet
      Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103
      ImageIndex = 0
      object Splitter1: TSplitter
        Left = 0
        Top = 181
        Width = 811
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 0
        ExplicitWidth = 223
      end
      object pnlInvInfo: TPanel
        Left = 0
        Top = 184
        Width = 811
        Height = 253
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        Caption = 'pnlInvInfo'
        Constraints.MinHeight = 40
        TabOrder = 1
        object grdGroups: TcxGrid
          Left = 0
          Top = 46
          Width = 811
          Height = 207
          Align = alClient
          TabOrder = 0
          object grdGroupsTVSpirts: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsSpirtList
            DataController.KeyFieldNames = 'UCHGRID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CellHints = True
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object grdGroupsTVSpirtscFL_CHECK: TcxGridDBColumn
              Caption = #1054#1090#1084#1077#1090#1082#1072
              DataBinding.FieldName = 'FL_CHECK'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = '1'
              Properties.ValueUnchecked = '0'
              VisibleForCustomization = False
              Width = 20
            end
            object grdGroupsTVSpirtsFC_UCHGR: TcxGridDBColumn
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1095#1077#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099
              DataBinding.FieldName = 'FC_UCHGR'
              Options.Editing = False
              Width = 64
            end
            object grdGroupsTVSpirtsUCHGRID: TcxGridDBColumn
              Caption = #1050#1086#1076' '#1091#1095'. '#1075#1088#1091#1087#1087#1099
              DataBinding.FieldName = 'UCHGRID'
              Visible = False
              Options.Editing = False
              Width = 40
            end
            object grdGroupsTVSpirtsFC_SKLAD: TcxGridDBColumn
              Caption = #1057#1082#1083#1072#1076
              DataBinding.FieldName = 'FC_SKLAD'
              Visible = False
              Options.Editing = False
              Width = 60
            end
          end
          object grdGroupsTVDeficit: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsDeficit
            DataController.KeyFieldNames = 'UCHGRID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CellHints = True
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object grdGroupsTVDeficitFL_CHECK: TcxGridDBColumn
              Caption = #1054#1090#1084#1077#1090#1082#1072
              DataBinding.FieldName = 'FL_CHECK'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = '1'
              Properties.ValueUnchecked = '0'
              VisibleForCustomization = False
              Width = 20
            end
            object grdGroupsTVDeficitFC_UCHGR: TcxGridDBColumn
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1095#1077#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099
              DataBinding.FieldName = 'FC_UCHGR'
              Options.Editing = False
              Width = 64
            end
            object grdGroupsTVDeficitUCHGRID: TcxGridDBColumn
              Caption = #1050#1086#1076' '#1091#1095'. '#1075#1088#1091#1087#1087#1099
              DataBinding.FieldName = 'UCHGRID'
              Visible = False
              Options.Editing = False
              Width = 40
            end
            object grdGroupsTVDeficitFC_SKLAD: TcxGridDBColumn
              Caption = #1057#1082#1083#1072#1076
              DataBinding.FieldName = 'FC_SKLAD'
              Visible = False
              Options.Editing = False
              Width = 60
            end
          end
          object grdGroupsTVNarc: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsNarc
            DataController.KeyFieldNames = 'UCHGRID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CellHints = True
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object grdGroupsTVNarcFL_CHECK: TcxGridDBColumn
              Caption = #1054#1090#1084#1077#1090#1082#1072
              DataBinding.FieldName = 'FL_CHECK'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = '1'
              Properties.ValueUnchecked = '0'
              VisibleForCustomization = False
              Width = 20
            end
            object grdGroupsTVNarcFC_UCHGR: TcxGridDBColumn
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1095#1077#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099
              DataBinding.FieldName = 'FC_UCHGR'
              Options.Editing = False
              Width = 64
            end
            object grdGroupsTVNarcUCHGRID: TcxGridDBColumn
              Caption = #1050#1086#1076' '#1091#1095'. '#1075#1088#1091#1087#1087#1099
              DataBinding.FieldName = 'UCHGRID'
              Visible = False
              Options.Editing = False
              Width = 40
            end
            object grdGroupsTVNarcFC_SKLAD: TcxGridDBColumn
              Caption = #1057#1082#1083#1072#1076
              DataBinding.FieldName = 'FC_SKLAD'
              Visible = False
              Options.Editing = False
              Width = 60
            end
          end
          object grdGroupsTVAttendsPeoples: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            NavigatorButtons.Append.Visible = False
            DataController.DataSource = dsAttendPeoples
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CellHints = True
            OptionsBehavior.CopyCaptionsToClipboard = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object grdGroupsTVAttendsPeoplesFC_POST: TcxGridDBColumn
              Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
              DataBinding.FieldName = 'FC_POST'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.MaxLength = 200
              Width = 60
            end
            object grdGroupsTVAttendsPeoplesFC_FIO: TcxGridDBColumn
              Caption = #1060#1048#1054
              DataBinding.FieldName = 'FC_FIO'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.MaxLength = 200
              Width = 80
            end
          end
          object grdGroupsLvlSpirt: TcxGridLevel
            GridView = grdGroupsTVSpirts
          end
          object grdGroupsLvlDeficit: TcxGridLevel
            GridView = grdGroupsTVDeficit
          end
          object grdGroupsLvlNarc: TcxGridLevel
            GridView = grdGroupsTVNarc
          end
          object grdGroupsLvlAttendsPeoples: TcxGridLevel
            GridView = grdGroupsTVAttendsPeoples
          end
        end
        object pcInvInfo: TcxPageControl
          Left = 0
          Top = 0
          Width = 811
          Height = 24
          ActivePage = tsSpirt
          Align = alTop
          Constraints.MaxHeight = 24
          Constraints.MinHeight = 24
          Images = dmMain.ilMain
          TabOrder = 1
          OnPageChanging = pcInvInfoPageChanging
          ClientRectBottom = 25
          ClientRectRight = 811
          ClientRectTop = 25
          object tsSpirt: TcxTabSheet
            Caption = #1057#1087#1080#1088#1090#1099
            ImageIndex = 67
          end
          object tsDeficit: TcxTabSheet
            Caption = #1044#1077#1092#1080#1094#1080#1090#1085#1099#1077' '#1051#1055
            ImageIndex = 65
          end
          object tsNarc: TcxTabSheet
            Caption = #1053#1072#1088#1082'. '#1089#1088'-'#1074#1072', '#1087#1089#1080#1093'. '#1080' '#1103#1076'. '#1074'-'#1074#1072
            ImageIndex = 62
          end
          object tsAttendsPeoples: TcxTabSheet
            Caption = #1055#1088#1080#1089#1091#1090#1089#1090#1074#1091#1102#1097#1080#1077' '#1083#1080#1094#1072
            ImageIndex = 74
          end
        end
        object tlbAttendsPeoples: TToolBar
          Left = 0
          Top = 24
          Width = 811
          Height = 22
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          ButtonWidth = 208
          Caption = 'tlbAttendsPeoples'
          DrawingStyle = dsGradient
          Images = dmMain.ilMain
          List = True
          ParentShowHint = False
          ShowCaptions = True
          ShowHint = True
          TabOrder = 2
          Transparent = True
          object btnAttPeopleAdd: TToolButton
            Left = 0
            Top = 0
            Action = acAttPeopleAddByLPU
            DropdownMenu = pmAttPeopleAdd
            Style = tbsDropDown
          end
          object sepAtendPeopleDel: TToolButton
            Left = 223
            Top = 0
            Width = 8
            Caption = 'sepAtendPeopleDel'
            ImageIndex = 76
            Style = tbsSeparator
          end
          object btnAttPeoplesDel: TToolButton
            Left = 231
            Top = 0
            Action = acAttPeoplesDel
            AutoSize = True
          end
        end
      end
      object grdInvEdit: TcxDBVerticalGrid
        Left = 0
        Top = 0
        Width = 811
        Height = 181
        Align = alClient
        OptionsView.RowHeaderWidth = 235
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsData.Appending = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        TabOrder = 0
        OnDrawValue = grdInvEditDrawValue
        DataController.DataSource = dsInvEdit
        object grdInvEditCategoryProp: TcxCategoryRow
          Properties.Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
          object grdInvEditFC_DOCNUM: TcxDBEditorRow
            Height = 16
            Properties.Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            Properties.EditPropertiesClassName = 'TcxTextEditProperties'
            Properties.EditProperties.MaxLength = 30
            Properties.DataBinding.FieldName = 'FC_DOCNUM'
          end
          object grdInvEditFN_TYPE: TcxDBEditorRow
            Properties.Caption = #1058#1080#1087
            Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.EditProperties.KeyFieldNames = 'FK_TYPEID'
            Properties.EditProperties.ListColumns = <
              item
                Caption = 'FC_TYPE'
                FieldName = 'FC_TYPE'
              end>
            Properties.EditProperties.ListOptions.CaseInsensitive = True
            Properties.EditProperties.ListOptions.ShowHeader = False
            Properties.EditProperties.ListSource = dsInvTypes
            Properties.DataBinding.FieldName = 'FN_TYPE'
          end
          object grdInvEditFD_DATA1: TcxDBEditorRow
            Properties.Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080
            Properties.EditPropertiesClassName = 'TcxDateEditProperties'
            Properties.EditProperties.DateButtons = [btnToday]
            Properties.DataBinding.FieldName = 'FD_DATA1'
          end
          object grdInvEditFD_DATA2: TcxDBEditorRow
            Properties.Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080
            Properties.EditPropertiesClassName = 'TcxDateEditProperties'
            Properties.EditProperties.DateButtons = [btnToday]
            Properties.DataBinding.FieldName = 'FD_DATA2'
          end
          object grdInvEditMATOTVID: TcxDBEditorRow
            Properties.Caption = #1052#1072#1090'. '#1086#1090#1074'. '#1075#1088#1091#1087#1087#1072' '#1083#1080#1094
            Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.EditProperties.KeyFieldNames = 'GROUPID'
            Properties.EditProperties.ListColumns = <
              item
                FieldName = 'FC_GROUP'
              end>
            Properties.EditProperties.ListOptions.CaseInsensitive = True
            Properties.EditProperties.ListOptions.ShowHeader = False
            Properties.EditProperties.ListSource = dsMOGroups
            Properties.DataBinding.FieldName = 'MATOTVID'
          end
          object grdInvEditFK_FINSOURCE_ID: TcxDBEditorRow
            Properties.Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
            Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.EditProperties.KeyFieldNames = 'FK_ID'
            Properties.EditProperties.ListColumns = <
              item
                FieldName = 'FC_NAME'
              end>
            Properties.EditProperties.ListOptions.ShowHeader = False
            Properties.EditProperties.ListSource = dsTFinSource
            Properties.DataBinding.FieldName = 'FK_FINSOURCE_ID'
          end
          object grdInvEditFD_DT_BEG: TcxDBEditorRow
            Properties.Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1086#1090#1095#1077#1090#1085#1086#1075#1086' '#1087#1077#1088#1080#1086#1076#1072
            Properties.EditPropertiesClassName = 'TcxDateEditProperties'
            Properties.EditProperties.DateButtons = [btnToday]
            Properties.DataBinding.FieldName = 'FD_DT_BEG'
          end
          object grdInvEditFD_DT_END: TcxDBEditorRow
            Properties.Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1086#1090#1095#1077#1090#1085#1086#1075#1086' '#1087#1077#1088#1080#1086#1076#1072
            Properties.EditPropertiesClassName = 'TcxDateEditProperties'
            Properties.EditProperties.DateButtons = [btnToday]
            Properties.DataBinding.FieldName = 'FD_DT_END'
          end
          object grdInvEditPrikaz: TcxDBMultiEditorRow
            Properties.Editors = <
              item
                Caption = #8470' '#1087#1088#1080#1082#1072#1079#1072
                EditPropertiesClassName = 'TcxTextEditProperties'
                EditProperties.MaxLength = 50
                DataBinding.FieldName = 'FC_NMB_PRIKAZ'
              end
              item
                Caption = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072
                EditPropertiesClassName = 'TcxDateEditProperties'
                EditProperties.DateButtons = [btnToday]
                DataBinding.FieldName = 'FD_DAT_PRIKAZ'
              end>
          end
        end
        object grdInvEditCategoryComission: TcxCategoryRow
          Properties.Caption = #1050#1086#1084#1080#1089#1089#1080#1103
          object grdInvEditDBEditorFC_PREDS: TcxDBEditorRow
            Properties.Caption = #1055#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1100
            Properties.EditPropertiesClassName = 'TcxTextEditProperties'
            Properties.EditProperties.MaxLength = 50
            Properties.DataBinding.FieldName = 'FC_PREDS'
          end
          object grdInvEditDBEditorFC_CHLEN1: TcxDBEditorRow
            Properties.Caption = #1063#1083#1077#1085' '#1082#1086#1084#1080#1089#1089#1080#1080' '#8470'1'
            Properties.EditPropertiesClassName = 'TcxTextEditProperties'
            Properties.EditProperties.MaxLength = 50
            Properties.DataBinding.FieldName = 'FC_CHLEN1'
          end
          object grdInvEditDBEditorFC_CHLEN2: TcxDBEditorRow
            Properties.Caption = #1063#1083#1077#1085' '#1082#1086#1084#1080#1089#1089#1080#1080' '#8470'2'
            Properties.EditPropertiesClassName = 'TcxTextEditProperties'
            Properties.EditProperties.MaxLength = 50
            Properties.DataBinding.FieldName = 'FC_CHLEN2'
          end
          object grdInvEditDBEditorFC_CHLEN3: TcxDBEditorRow
            Properties.Caption = #1063#1083#1077#1085' '#1082#1086#1084#1080#1089#1089#1080#1080' '#8470'3'
            Properties.EditPropertiesClassName = 'TcxTextEditProperties'
            Properties.EditProperties.MaxLength = 50
            Properties.DataBinding.FieldName = 'FC_CHLEN3'
          end
        end
        object grdInvEditCategorySignature: TcxCategoryRow
          Properties.Caption = #1055#1086#1076#1087#1080#1089#1100
          object grdInvEditDBEditorFL_EDIT: TcxDBEditorRow
            Properties.Caption = #1055#1086#1076#1087#1080#1089#1072#1085
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.ValueChecked = '0'
            Properties.EditProperties.ValueUnchecked = '1'
            Properties.DataBinding.FieldName = 'FL_EDIT'
            Properties.Options.Editing = False
            Properties.Options.Filtering = False
            Properties.Options.IncSearch = False
          end
          object grdInvEditDBEditorFC_SIGNED_BY_MO: TcxDBEditorRow
            Properties.Caption = #1050#1077#1084' '#1087#1086#1076#1087#1080#1089#1072#1085
            Properties.DataBinding.FieldName = 'FC_SIGNED_BY_MO'
            Properties.Options.Editing = False
            Properties.Options.Filtering = False
            Properties.Options.IncSearch = False
          end
          object grdInvEditDBEditorFD_SIGNED: TcxDBEditorRow
            Properties.Caption = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1080
            Properties.EditPropertiesClassName = 'TcxDateEditProperties'
            Properties.DataBinding.FieldName = 'FD_SIGNED'
            Properties.Options.Editing = False
            Properties.Options.Filtering = False
            Properties.Options.IncSearch = False
          end
        end
      end
    end
    object tsOpis: TcxTabSheet
      Caption = #1054#1087#1080#1089#1100
      ImageIndex = 7
      object grdOpis: TcxGrid
        Left = 0
        Top = 22
        Width = 811
        Height = 415
        Align = alClient
        TabOrder = 0
        object grdOpisDBBandedTV: TcxGridDBBandedTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsOpis
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #1050#1086#1083'-'#1074#1086' '#1089#1090#1088#1086#1082' 0'
              Kind = skCount
              FieldName = 'FC_NAME'
              Column = grdOpisDBBandedTVFC_NAME
            end
            item
              Format = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
              Kind = skSum
              FieldName = 'FN_FACTSUM'
              Column = grdOpisDBBandedTVFN_FACTSUM
            end
            item
              Format = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
              Kind = skSum
              FieldName = 'FN_BUHPRICE'
              Column = grdOpisDBBandedTVFN_BUHPRICE
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.CopyCaptionsToClipboard = False
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.IncSearch = True
          OptionsBehavior.CopyPreviewToClipboard = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.BandMoving = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderEndEllipsis = True
          OptionsView.BandHeaderEndEllipsis = True
          Bands = <
            item
              Caption = #1058#1086#1088#1075#1086#1074#1086'-'#1084#1072#1090#1077#1088#1080#1072#1083#1100#1085#1099#1077' '#1094#1077#1085#1085#1086#1089#1090#1080
            end
            item
              Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
            end
            item
              Caption = #1062#1077#1085#1072', '#1088#1091#1073'.'
            end
            item
              Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1086#1077' '#1085#1072#1083#1080#1095#1080#1077
            end
            item
              Caption = #1055#1086' '#1076#1072#1085#1085#1099#1084' '#1073#1091#1093'.'#1091#1095#1077#1090#1072
            end>
          object grdOpisDBBandedTVFC_NAME: TcxGridDBBandedColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_NAME'
            Options.Editing = False
            VisibleForCustomization = False
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdOpisDBBandedTVFC_INVNUM: TcxGridDBBandedColumn
            Caption = #1057#1077#1088#1080#1103
            DataBinding.FieldName = 'FC_INVNUM'
            Options.Editing = False
            VisibleForCustomization = False
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdOpisDBBandedTVFC_EDIZM: TcxGridDBBandedColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_EDIZM'
            Options.Editing = False
            VisibleForCustomization = False
            Width = 40
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdOpisDBBandedTVFC_OKEI: TcxGridDBBandedColumn
            Caption = #1082#1086#1076' '#1057#1054#1045#1048
            DataBinding.FieldName = 'FC_OKEI'
            Options.Editing = False
            VisibleForCustomization = False
            Width = 40
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdOpisDBBandedTVFN_PRICE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'FN_PRICE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Options.Editing = False
            VisibleForCustomization = False
            Width = 60
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
            IsCaptionAssigned = True
          end
          object grdOpisDBBandedTVFN_FACTKOL: TcxGridDBBandedColumn
            Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
            DataBinding.FieldName = 'FN_FACTKOL'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.AssignedValues.MinValue = True
            Properties.ImmediatePost = True
            Properties.Increment = 0.100000000000000000
            Properties.LargeIncrement = 1.000000000000000000
            Properties.MaxValue = 100000.000000000000000000
            Properties.ValueType = vtFloat
            Properties.OnEditValueChanged = grdOpisDBBandedTVFN_FACTKOLPropertiesEditValueChanged
            VisibleForCustomization = False
            Width = 60
            Position.BandIndex = 3
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdOpisDBBandedTVFN_FACTSUM: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072', '#1088#1091#1073'.'
            DataBinding.FieldName = 'FN_FACTSUM'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Options.Editing = False
            VisibleForCustomization = False
            Width = 70
            Position.BandIndex = 3
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdOpisDBBandedTVFN_BUHKOL: TcxGridDBBandedColumn
            Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
            DataBinding.FieldName = 'FN_BUHKOL'
            Options.Editing = False
            VisibleForCustomization = False
            Width = 60
            Position.BandIndex = 4
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdOpisDBBandedTVFN_BUHPRICE: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072', '#1088#1091#1073'.'
            DataBinding.FieldName = 'FN_BUHPRICE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Options.Editing = False
            VisibleForCustomization = False
            Width = 70
            Position.BandIndex = 4
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdOpisDBBandedTVFC_UCHGR_PATH: TcxGridDBBandedColumn
            Caption = #1059#1095#1077#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072'('#1087#1091#1090#1100')'
            DataBinding.FieldName = 'FC_UCHGR_PATH'
            Visible = False
            Options.Editing = False
            Width = 60
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
        end
        object grdOpisLvl: TcxGridLevel
          GridView = grdOpisDBBandedTV
        end
      end
      object tlbOpis: TToolBar
        Left = 0
        Top = 0
        Width = 811
        Height = 22
        AutoSize = True
        ButtonWidth = 102
        Caption = 'tlbOpis'
        DrawingStyle = dsGradient
        Images = dmMain.ilMain
        List = True
        ShowCaptions = True
        TabOrder = 1
        object ToolButton3: TToolButton
          Left = 0
          Top = 0
          Action = acCalcOpis
        end
        object ToolButton4: TToolButton
          Left = 102
          Top = 0
          Action = acClearOpis
        end
      end
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    OnUpdate = alUpdate
    Left = 475
    Top = 20
    object acSave: TAction
      Category = 'Main'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 9
      ShortCut = 16467
      OnExecute = acSaveExecute
    end
    object acCancel: TAction
      Category = 'Main'
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 8
      OnExecute = acCancelExecute
    end
    object acRefresh: TAction
      Category = 'Main'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 15
      OnExecute = acRefreshExecute
    end
    object acCalcOpis: TAction
      Category = 'Opis'
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 29
      OnExecute = acCalcOpisExecute
    end
    object acClearOpis: TAction
      Category = 'Opis'
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      ImageIndex = 27
      OnExecute = acClearOpisExecute
    end
    object acAttPeoplesAddByManual: TAction
      Category = 'AttenedsPeoples'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1091#1095#1085#1099#1084' '#1074#1074#1086#1076#1086#1084
      ImageIndex = 75
      OnExecute = acAttPeoplesAddByManualExecute
    end
    object acAttPeoplesDel: TAction
      Category = 'AttenedsPeoples'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 76
      OnExecute = acAttPeoplesDelExecute
    end
    object acAttPeopleAddByLPU: TAction
      Category = 'AttenedsPeoples'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      ImageIndex = 75
      OnExecute = acAttPeopleAddByLPUExecute
    end
  end
  object odsInvEdit: TOracleDataSet
    SQL.Strings = (
      'select i.rowid,       '
      '       i.INVLISTID, '
      '       i.MATOTVID_OWNER, '
      '       i.MATOTVID, '
      '       i.FC_DOCNUM, '
      '       i.FD_DATA1, '
      '       i.FD_DATA2, '
      '       i.FC_PREDS, '
      '       i.FC_CHLEN1, '
      '       i.FC_CHLEN2, '
      '       i.FC_CHLEN3, '
      '       i.FN_TYPE, '
      '       i.FD_DT_BEG, '
      '       i.FD_DT_END,                 '
      '       i.FD_DAT_PRIKAZ, '
      '       i.FC_NMB_PRIKAZ, '
      '       i.FK_FINSOURCE_ID, '
      '       i.FL_EDIT, '
      '       i.FK_SIGNED_BY_MO, '
      '       i.FD_SIGNED,'
      '       mo.FC_NAME FC_SIGNED_BY_MO,       '
      '       o.FN_OPIS_CNT'
      '  from med.TINVLIST i'
      ' left join med.TMO mo'
      '   on i.FK_SIGNED_BY_MO = mo.MOID'
      ' left join ( select o.INVLISTID,'
      '                    count(1) FN_OPIS_CNT'
      '               from med.TINVOPIS o'
      '              where o.INVLISTID = :pINVLISTID'
      '              group by o.INVLISTID ) o'
      '    on i.INVLISTID = o.INVLISTID              '
      ' where i.INVLISTID = :pINVLISTID')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50494E564C4953544944030000000400000074
      05000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001100000009000000494E564C49535449440100000000000E0000004D
      41544F545649445F4F574E4552010000000000080000004D41544F5456494401
      00000000000900000046435F444F434E554D0100000000000800000046445F44
      415441310100000000000800000046445F444154413201000000000008000000
      46435F50524544530100000000000900000046435F43484C454E310100000000
      000900000046435F43484C454E320100000000000900000046435F43484C454E
      3301000000000007000000464E5F545950450100000000000900000046445F44
      545F4245470100000000000900000046445F44545F454E440100000000000A00
      000046435F50454F504C45530100000000000700000046435F43495459010000
      0000000D00000046445F4441545F5052494B415A0100000000000D0000004643
      5F4E4D425F5052494B415A010000000000}
    RefreshOptions = [roAllFields]
    CommitOnPost = False
    Session = dmMain.os
    Left = 571
    Top = 52
  end
  object dsInvEdit: TDataSource
    DataSet = odsInvEdit
    Left = 731
    Top = 20
  end
  object odsInvTypes: TOracleDataSet
    SQL.Strings = (
      
        'select t.FK_TYPEID, med.PKG_INVOPIS.GET_INVTYPENAME ( t.FK_TYPEI' +
        'D ) as FC_TYPE'
      
        '  from ( select med.PKG_INVOPIS.GET_INVPLANTYPEID as FK_TYPEID f' +
        'rom dual'
      '         union all'
      
        '         select med.PKG_INVOPIS.GET_INVSUDDENTYPEID from dual ) ' +
        't'
      ' order by t.FK_TYPEID        ')
    Optimize = False
    Session = dmMain.os
    Left = 731
    Top = 52
  end
  object dsInvTypes: TDataSource
    DataSet = odsInvTypes
    Left = 699
    Top = 20
  end
  object odsTFinSource: TOracleDataSet
    SQL.Strings = (
      'select t.FK_ID, t.FC_NAME'
      '  from ( select fs.FK_ID, fs.FC_NAME , 1 FN_ORDER'
      '           from med.TFinSource fs'
      '         union all'
      '         select NULL, '#39'('#1042#1089#1077')'#39', 0  from dual ) t'
      ' order by t.FN_ORDER, upper(t.FC_NAME)')
    ReadBuffer = 50
    Optimize = False
    SequenceField.Field = 'FK_ID'
    SequenceField.Sequence = 'MED.SEQ_TFinSource'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F53594E4F4E494D0100000000000D000000
      464B5F54595045444F435F4944010000000000}
    Cursor = crSQLWait
    UniqueFields = 'FK_ID'
    UpdatingTable = 'MED.TFINSOURCE'
    CommitOnPost = False
    Session = dmMain.os
    Left = 635
    Top = 52
  end
  object dsTFinSource: TDataSource
    DataSet = odsTFinSource
    Left = 763
    Top = 20
  end
  object dsSpirtList: TDataSource
    DataSet = odsSpirtList
    Left = 571
    Top = 20
  end
  object odsSpirtList: TOracleDataSet
    SQL.Strings = (
      'select gr.UCHGRID,'
      '       gr.FC_UCHGR,'
      '       t.groupid,'
      '       case'
      '         when t.groupid > 0 then 1'
      '         else 0'
      '       end FL_CHECK,'
      '       s.FC_NAME FC_SKLAD'
      '  from med.TUCHGR gr'
      '   left join ( select value(t) as groupid  '
      
        '                from the ( select FARR_SPIRT_UCHGR from  med.TIN' +
        'VLIST where INVLISTID = :PINVLISTID ) t ) t'
      '    on gr.UCHGRID = t.groupid               '
      '   left join med.TSKLAD s'
      '     on gr.FK_SKLAD_ID = s.FK_ID'
      ' where coalesce( gr.PARENTID, 0 ) = 0'
      ' order by upper(gr.FC_UCHGR)')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50494E564C4953544944030000000400000043
      05000000000000}
    RefreshOptions = [roAllFields]
    OnApplyRecord = odsSpirtListApplyRecord
    CommitOnPost = False
    Session = dmMain.os
    Left = 699
    Top = 52
  end
  object odsDeficit: TOracleDataSet
    SQL.Strings = (
      'select gr.UCHGRID,'
      '       gr.FC_UCHGR,'
      '       t.groupid,'
      '       case'
      '         when t.groupid > 0 then 1'
      '         else 0'
      '       end FL_CHECK,'
      '       s.FC_NAME FC_SKLAD'
      ' from med.TUCHGR  gr'
      '  left join ( select value(t) as groupid  '
      
        '                from the ( select FARR_DEFICIT_UCHGR from  med.T' +
        'INVLIST where INVLISTID = :PINVLISTID ) t ) t'
      '    on gr.UCHGRID = t.groupid               '
      '  left join med.TSKLAD s'
      '    on gr.FK_SKLAD_ID = s.FK_ID    '
      ' where coalesce( gr.PARENTID, 0 ) = 0'
      ' order by upper(gr.FC_UCHGR)')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50494E564C4953544944030000000400000043
      05000000000000}
    RefreshOptions = [roAllFields]
    OnApplyRecord = odsSpirtListApplyRecord
    CommitOnPost = False
    Session = dmMain.os
    Left = 667
    Top = 52
  end
  object dsDeficit: TDataSource
    DataSet = odsDeficit
    Left = 539
    Top = 20
  end
  object odsNarc: TOracleDataSet
    SQL.Strings = (
      'select gr.UCHGRID,'
      '       gr.FC_UCHGR,'
      '       t.groupid,'
      '       case'
      '         when t.groupid > 0 then 1'
      '         else 0'
      '       end FL_CHECK,'
      '       s.FC_NAME FC_SKLAD'
      '  from med.TUCHGR /*med.V$TUCHGR*/ gr'
      '  left join ( select value(t) as groupid  '
      
        '                from the ( select FARR_NARC_UCHGR from  med.TINV' +
        'LIST where INVLISTID = :PINVLISTID ) t ) t'
      '    on gr.UCHGRID = t.groupid               '
      '   left join med.TSKLAD s'
      '     on gr.FK_SKLAD_ID = s.FK_ID    '
      ' where coalesce( gr.PARENTID, 0 ) = 0'
      '  order by upper(gr.FC_UCHGR)')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50494E564C4953544944030000000400000043
      05000000000000}
    RefreshOptions = [roAllFields]
    OnApplyRecord = odsSpirtListApplyRecord
    CommitOnPost = False
    Session = dmMain.os
    Left = 475
    Top = 84
  end
  object dsNarc: TDataSource
    DataSet = odsNarc
    Left = 507
    Top = 20
  end
  object odsMOGroups: TOracleDataSet
    SQL.Strings = (
      'select gr.GROUPID, gr.FC_GROUP'
      '  from med.TMO_GROUP gr'
      ' inner join ( select mig.FK_GROUP'
      '                from med.TMO mo'
      '               inner join med.TMO_IN_GROUP mig'
      '                  on mo.MOID = mig.FK_MO'
      '               where mo.FK_SOTRID = :pFK_SOTRID'
      '                 and mig.FL_DEL = 0'
      '                 and mo.FL_DEL = 0 '
      '               group by mig.FK_GROUP ) ig'
      '    on gr.GROUPID = ig.FK_GROUP               '
      ' where gr.FL_DEL = 0'
      ' order by upper(gr.FC_GROUP)')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F534F54524944030000000000000000
      000000}
    Session = dmMain.os
    Left = 763
    Top = 52
  end
  object dsMOGroups: TDataSource
    DataSet = odsMOGroups
    Left = 667
    Top = 20
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = '%FORM_NAME%\'
    StoredProps.Strings = (
      'grdGroupsTVSpirtsFC_UCHGR.Visible'
      'grdGroupsTVSpirtsUCHGRID.Visible'
      'grdGroupsTVDeficitFC_UCHGR.Visible'
      'grdGroupsTVDeficitUCHGRID.Visible'
      'grdGroupsTVNarcFC_UCHGR.Visible'
      'grdGroupsTVNarcUCHGRID.Visible'
      'pnlInvInfo.Height'
      'grdGroupsTVSpirtsFC_SKLAD.Visible'
      'grdGroupsTVNarcFC_SKLAD.Visible'
      'grdGroupsTVDeficitFC_SKLAD.Visible'
      'grdGroupsTVAttendsPeoplesFC_FIO.Width'
      'grdGroupsTVAttendsPeoplesFC_POST.Width')
    StoredValues = <>
    Left = 507
    Top = 52
  end
  object odsOpis: TOracleDataSet
    SQL.Strings = (
      'select o.rowid,'
      '       o.*,'
      
        '       med.PKGTMEDIC.GetUchgrFullPathName ( m.UCHGRID ) FC_UCHGR' +
        '_PATH'
      '  from med.TINVOPIS o'
      '  left join med.TKART k'
      '    on o.KARTID = k.KARTID'
      '  left join med.TMEDIC m'
      '    on k.MEDICID = m.MEDICID'
      ' where o.INVLISTID = :PINVLISTID'
      ' order by upper(o.FC_NAME)')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50494E564C4953544944030000000400000074
      05000000000000}
    RefreshOptions = [roAllFields]
    CommitOnPost = False
    Session = dmMain.os
    BeforePost = odsOpisBeforePost
    Left = 539
    Top = 52
  end
  object dsOpis: TDataSource
    DataSet = odsOpis
    Left = 635
    Top = 20
  end
  object odsAttendPeoples: TOracleDataSet
    SQL.Strings = (
      'select value(t).FC_POST FC_POST,'
      '       value(t).FC_FIO FC_FIO'
      '  from the( select i.FARR_ATTEND_PEOPLE'
      '                                     from med.TINVLIST i'
      
        '                                    where i.INVLISTID = :PINVLIS' +
        'TID ) t')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50494E564C4953544944030000000000000000
      000000}
    Session = dmMain.os
    Left = 603
    Top = 52
  end
  object dsAttendPeoples: TDataSource
    DataSet = mdAttendsPeoples
    Left = 603
    Top = 20
  end
  object mdAttendsPeoples: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 475
    Top = 52
  end
  object pmAttPeopleAdd: TPopupMenu
    Images = dmMain.ilMain
    Left = 507
    Top = 84
    object N2: TMenuItem
      Action = acAttPeopleAddByLPU
    end
    object N1: TMenuItem
      Action = acAttPeoplesAddByManual
    end
  end
end
