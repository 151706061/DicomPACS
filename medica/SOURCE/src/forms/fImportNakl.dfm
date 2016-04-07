object fmImportNakl: TfmImportNakl
  Left = 449
  Top = 208
  Caption = #1048#1084#1087#1086#1088#1090' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
  ClientHeight = 515
  ClientWidth = 872
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 263
    Width = 872
    Height = 8
    Cursor = crVSplit
    Align = alTop
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 311
    Align = alClient
    Caption = ' '#1055#1086#1079#1080#1094#1080#1080' '#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1077' '
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    Height = 200
    Width = 872
    object grTIMP_DOC_ITEMS: TcxGrid
      Left = 2
      Top = 18
      Width = 868
      Height = 180
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object grTIMP_DOC_ITEMSDBBandedTableView1: TcxGridDBBandedTableView
        NavigatorButtons.ConfirmDelete = False
        OnEditValueChanged = grTIMP_DOC_ITEMSDBBandedTableView1EditValueChanged
        DataController.DataSource = dsTIMP_DOC_ITEMS
        DataController.KeyFieldNames = 'FK_ID'
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = #1050#1086#1083'-'#1074#1086': ### ###'
            Kind = skCount
            Column = grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_TORG_NAME
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsCustomize.BandsQuickCustomization = True
        OptionsData.Editing = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        Bands = <
          item
            Caption = #1057#1090#1088#1086#1082#1072
            Visible = False
          end
          item
            Caption = #1060#1072#1081#1083
            Width = 330
          end
          item
            Caption = #1056#1072#1079#1086#1073#1088#1072#1085#1086
            Width = 524
          end>
        object grTIMP_DOC_ITEMSDBBandedTableView1FK_ID: TcxGridDBBandedColumn
          Caption = 'ID'
          DataBinding.FieldName = 'FK_ID'
          Options.Editing = False
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FK_IMP_DOC_ID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'FK_IMP_DOC_ID'
          Options.Editing = False
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_NUM: TcxGridDBBandedColumn
          Caption = #8470' '#1087'.'#1087'.'
          DataBinding.FieldName = 'FC_SRC_NUM'
          Visible = False
          Options.Editing = False
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_TORG_NAME: TcxGridDBBandedColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_SRC_MEDIC_TORG_NAME'
          Options.Editing = False
          Width = 267
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_ID_THEIR: TcxGridDBBandedColumn
          Caption = 'ID '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103
          DataBinding.FieldName = 'FC_SRC_MEDIC_ID_THEIR'
          Visible = False
          Options.Editing = False
          Position.BandIndex = 1
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_ED_IZM: TcxGridDBBandedColumn
          Caption = #1045#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'FC_SRC_MEDIC_ED_IZM'
          Visible = False
          Options.Editing = False
          Position.BandIndex = 1
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_KOLVO: TcxGridDBBandedColumn
          Caption = #1050#1086#1083'-'#1074#1086
          DataBinding.FieldName = 'FC_SRC_MEDIC_KOLVO'
          Visible = False
          Options.Editing = False
          Position.BandIndex = 1
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_SERIA: TcxGridDBBandedColumn
          Caption = #1057#1077#1088#1080#1103
          DataBinding.FieldName = 'FC_SRC_PARTY_SERIA'
          Options.Editing = False
          Width = 118
          Position.BandIndex = 1
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_GODNOST: TcxGridDBBandedColumn
          Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
          DataBinding.FieldName = 'FC_SRC_PARTY_GODNOST'
          Visible = False
          Options.Editing = False
          Position.BandIndex = 1
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_PRICE_BEZ_NDS: TcxGridDBBandedColumn
          Caption = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
          DataBinding.FieldName = 'FC_SRC_PARTY_PRICE_BEZ_NDS'
          Visible = False
          Options.Editing = False
          Position.BandIndex = 1
          Position.ColIndex = 7
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_SUMM_NDS: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057
          DataBinding.FieldName = 'FC_SRC_PARTY_SUMM_NDS'
          Visible = False
          Options.Editing = False
          Position.BandIndex = 1
          Position.ColIndex = 8
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_NDS: TcxGridDBBandedColumn
          Caption = #1053#1044#1057
          DataBinding.FieldName = 'FC_SRC_NDS'
          Visible = False
          Options.Editing = False
          Position.BandIndex = 1
          Position.ColIndex = 9
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_PROIZVODITEL: TcxGridDBBandedColumn
          Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
          DataBinding.FieldName = 'FC_SRC_PARTY_PROIZVODITEL'
          Visible = False
          Options.Editing = False
          Position.BandIndex = 1
          Position.ColIndex = 10
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_SERTIFIKAT: TcxGridDBBandedColumn
          Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
          DataBinding.FieldName = 'FC_SRC_PARTY_SERTIFIKAT'
          Visible = False
          Options.Editing = False
          Position.BandIndex = 1
          Position.ColIndex = 11
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FD_INS_DATE: TcxGridDBBandedColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
          DataBinding.FieldName = 'FD_INS_DATE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DateButtons = [btnToday]
          Properties.ReadOnly = True
          Options.Editing = False
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FD_EDIT_DATE: TcxGridDBBandedColumn
          Caption = #1044#1072#1090#1072' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103
          DataBinding.FieldName = 'FD_EDIT_DATE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DateButtons = [btnToday]
          Properties.ReadOnly = True
          Options.Editing = False
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FK_INS_MO: TcxGridDBBandedColumn
          Caption = #1050#1090#1086' '#1089#1086#1079#1076#1072#1083
          DataBinding.FieldName = 'FK_INS_MO'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'MOID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_NAME'
            end
            item
              Fixed = True
              Width = 20
              FieldName = 'MOID'
            end>
          Properties.ListSource = dmMain.dsMO
          Options.Editing = False
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FK_EDIT_MO: TcxGridDBBandedColumn
          Caption = #1050#1090#1086' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1083
          DataBinding.FieldName = 'FK_EDIT_MO'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'MOID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_NAME'
            end
            item
              Fixed = True
              Width = 20
              FieldName = 'MOID'
            end>
          Properties.ListSource = dmMain.dsMO
          Options.Editing = False
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ID_OUR: TcxGridDBBandedColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FK_PRS_MEDIC_ID_OUR'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'MEDICID'
          Properties.ListColumns = <
            item
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              FieldName = 'FC_NAME'
            end>
          Properties.ListSource = dsMedicsList
          Properties.OnEditValueChanged = grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ID_OURPropertiesEditValueChanged
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ID_THEIR: TcxGridDBBandedColumn
          Caption = 'ID '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
          DataBinding.FieldName = 'FK_PRS_MEDIC_ID_THEIR'
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ED_IZM: TcxGridDBBandedColumn
          Caption = #1045#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'FK_PRS_MEDIC_ED_IZM'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'EIID'
          Properties.ListColumns = <
            item
              Caption = #1045#1076'. '#1080#1079#1084'.'
              FieldName = 'FC_NAME'
            end>
          Properties.ListSource = dmMain.dsEI
          Properties.OnEditValueChanged = grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ED_IZMPropertiesEditValueChanged
          Position.BandIndex = 2
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FN_PRS_MEDIC_KOLVO: TcxGridDBBandedColumn
          Caption = #1050#1086#1083'-'#1074#1086
          DataBinding.FieldName = 'FN_PRS_MEDIC_KOLVO'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.AssignedValues.MinValue = True
          Properties.ImmediatePost = True
          Properties.ValueType = vtFloat
          Position.BandIndex = 2
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FD_PRS_PARTY_GODNOST: TcxGridDBBandedColumn
          Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
          DataBinding.FieldName = 'FD_PRS_PARTY_GODNOST'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DateButtons = [btnClear, btnToday]
          Properties.ImmediatePost = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          Position.BandIndex = 2
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FN_PRS_PARTY_PRICE: TcxGridDBBandedColumn
          Caption = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
          DataBinding.FieldName = 'FN_PRS_PARTY_PRICE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.AssignedValues.MinValue = True
          Properties.DecimalPlaces = 2
          Position.BandIndex = 2
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FN_PRS_PARTY_SUMM_NDS: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057
          DataBinding.FieldName = 'FN_PRS_PARTY_SUMM_NDS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.AssignedValues.MinValue = True
          Properties.DecimalPlaces = 2
          Position.BandIndex = 2
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FN_PRS_NDS: TcxGridDBBandedColumn
          DataBinding.FieldName = #1053#1044#1057
          Visible = False
          Position.BandIndex = 2
          Position.ColIndex = 7
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_PARTY_PROIZVODITEL: TcxGridDBBandedColumn
          Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
          DataBinding.FieldName = 'FK_PRS_PARTY_PROIZVODITEL'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'FK_ID'
          Properties.ListColumns = <
            item
              Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
              FieldName = 'FC_VALUE'
            end>
          Properties.ListSource = dsTProdCert_list
          Options.Editing = False
          Position.BandIndex = 2
          Position.ColIndex = 8
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_PARTY_SERTIFIKAT: TcxGridDBBandedColumn
          Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
          DataBinding.FieldName = 'FK_PRS_PARTY_SERTIFIKAT'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'FK_ID'
          Properties.ListColumns = <
            item
              Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
              FieldName = 'FC_VALUE'
            end>
          Properties.ListSource = dsTProdCert_list
          Options.Editing = False
          Position.BandIndex = 2
          Position.ColIndex = 9
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FK_IMP_KARTID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'FK_IMP_KARTID'
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
          Position.BandIndex = 2
          Position.ColIndex = 10
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FK_IMP_TDPC: TcxGridDBBandedColumn
          DataBinding.FieldName = 'FK_IMP_TDPC'
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
          Position.BandIndex = 2
          Position.ColIndex = 11
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FN_IMP_STATUS: TcxGridDBBandedColumn
          DataBinding.FieldName = 'FN_IMP_STATUS'
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
          Position.BandIndex = 2
          Position.ColIndex = 12
          Position.RowIndex = 0
        end
        object grTIMP_DOC_ITEMSDBBandedTableView1FC_IMP_STATUS: TcxGridDBBandedColumn
          Caption = #1057#1090#1072#1090#1091#1089
          DataBinding.FieldName = 'FC_IMP_STATUS'
          OnCustomDrawCell = grTIMP_DOC_ITEMSDBBandedTableView1FC_IMP_STATUSCustomDrawCell
          Options.Editing = False
          Width = 40
          Position.BandIndex = 2
          Position.ColIndex = 13
          Position.RowIndex = 0
        end
      end
      object cxGridLevel3: TcxGridLevel
        GridView = grTIMP_DOC_ITEMSDBBandedTableView1
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 511
    Width = 872
    Height = 4
    AlignSplitter = salBottom
    Control = grbDocs
  end
  object grbDocs: TcxGroupBox
    Left = 0
    Top = 49
    Align = alTop
    Caption = ' '#1044#1086#1082#1091#1084#1077#1085#1090#1099' '
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 2
    Height = 214
    Width = 872
    object grTIMP_DOC: TcxGrid
      Left = 2
      Top = 18
      Width = 868
      Height = 194
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object grTIMP_DOCDBBandedTableView1: TcxGridDBBandedTableView
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = grTIMP_DOCDBBandedTableView1FocusedRecordChanged
        DataController.DataModeController.SmartRefresh = True
        DataController.DataSource = dsTIMP_DOC
        DataController.KeyFieldNames = 'FK_ID'
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = #1050#1086#1083'-'#1074#1086': ### ###'
            Kind = skCount
            Column = grTIMP_DOCDBBandedTableView1FC_SRC_DOC_NUM
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsCustomize.BandsQuickCustomization = True
        OptionsData.Editing = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        Bands = <
          item
            Caption = #1057#1090#1088#1086#1082#1072
            Visible = False
          end
          item
            Caption = #1060#1072#1081#1083
            Width = 329
          end
          item
            Caption = #1056#1072#1079#1086#1073#1088#1072#1085#1086
            Width = 525
          end
          item
            Caption = #1044#1086#1075#1086#1074#1086#1088#1072
          end>
        object grTIMP_DOCDBBandedTableView1FK_ID: TcxGridDBBandedColumn
          Caption = 'ID'
          DataBinding.FieldName = 'FK_ID'
          Options.Editing = False
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FC_SRC_DOC_NUM: TcxGridDBBandedColumn
          Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          DataBinding.FieldName = 'FC_SRC_DOC_NUM'
          Options.Editing = False
          Width = 47
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FC_SRC_DOC_DATE: TcxGridDBBandedColumn
          Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          DataBinding.FieldName = 'FC_SRC_DOC_DATE'
          Visible = False
          Options.Editing = False
          Width = 43
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FC_SRC_POSTAV: TcxGridDBBandedColumn
          Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
          DataBinding.FieldName = 'FC_SRC_POSTAV'
          Options.Editing = False
          Width = 102
          Position.BandIndex = 1
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1fc_src_kontrakt: TcxGridDBBandedColumn
          Caption = #1050#1086#1085#1090#1088#1072#1082#1090
          DataBinding.FieldName = 'fc_src_kontrakt'
          Visible = False
          Options.Editing = False
          Position.BandIndex = 1
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FC_SRC_VID_OPLATI: TcxGridDBBandedColumn
          Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099
          DataBinding.FieldName = 'FC_SRC_VID_OPLATI'
          Visible = False
          Options.Editing = False
          Width = 22
          Position.BandIndex = 1
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FC_SRC_SCHET_FAKTURA: TcxGridDBBandedColumn
          Caption = #1057#1095#1077#1090'-'#1092#1072#1082#1090#1091#1088#1072
          DataBinding.FieldName = 'FC_SRC_SCHET_FAKTURA'
          Visible = False
          Options.Editing = False
          Width = 22
          Position.BandIndex = 1
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FC_SRC_SUMMA_S_NDS: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057
          DataBinding.FieldName = 'FC_SRC_SUMMA_S_NDS'
          Visible = False
          Options.Editing = False
          Width = 34
          Position.BandIndex = 1
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FC_SRC_KOLVO_POS: TcxGridDBBandedColumn
          Caption = #1050#1086#1083'-'#1074#1086' '#1087#1086#1079#1080#1094#1080#1081
          DataBinding.FieldName = 'FC_SRC_KOLVO_POS'
          Visible = False
          Options.Editing = False
          Width = 62
          Position.BandIndex = 1
          Position.ColIndex = 7
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FC_SRC_COMMENT: TcxGridDBBandedColumn
          Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
          DataBinding.FieldName = 'FC_SRC_COMMENT'
          Visible = False
          Options.Editing = False
          Width = 70
          Position.BandIndex = 1
          Position.ColIndex = 8
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FC_IMP_FILENAME: TcxGridDBBandedColumn
          Caption = #1048#1089#1090#1086#1095#1085#1080#1082
          DataBinding.FieldName = 'FC_IMP_FILENAME'
          Options.Editing = False
          Width = 110
          Position.BandIndex = 1
          Position.ColIndex = 9
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FD_INS_DATE: TcxGridDBBandedColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
          DataBinding.FieldName = 'FD_INS_DATE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DateButtons = [btnToday]
          Properties.ReadOnly = True
          Options.Editing = False
          Width = 34
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FD_EDIT_DATE: TcxGridDBBandedColumn
          Caption = #1044#1072#1090#1072' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103
          DataBinding.FieldName = 'FD_EDIT_DATE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DateButtons = [btnToday]
          Properties.ReadOnly = True
          Options.Editing = False
          Width = 36
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FK_INS_MO: TcxGridDBBandedColumn
          Caption = #1050#1090#1086' '#1089#1086#1079#1076#1072#1083
          DataBinding.FieldName = 'FK_INS_MO'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'MOID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_NAME'
            end
            item
              Fixed = True
              Width = 20
              FieldName = 'MOID'
            end>
          Properties.ListSource = dmMain.dsMO
          Options.Editing = False
          Width = 34
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FK_EDIT_MO: TcxGridDBBandedColumn
          Caption = #1050#1090#1086' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1083
          DataBinding.FieldName = 'FK_EDIT_MO'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'MOID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_NAME'
            end
            item
              Fixed = True
              Width = 20
              FieldName = 'MOID'
            end>
          Properties.ListSource = dmMain.dsMO
          Options.Editing = False
          Width = 35
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FD_DOC_DATE: TcxGridDBBandedColumn
          Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          DataBinding.FieldName = 'FD_DOC_DATE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ImmediatePost = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.OnEditValueChanged = grTIMP_DOCDBBandedTableView1FD_DOC_DATEPropertiesEditValueChanged
          Options.Editing = False
          Width = 86
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FK_POST_ID: TcxGridDBBandedColumn
          Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
          DataBinding.FieldName = 'FK_POST_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'POSTAVID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_NAME'
            end
            item
              Fixed = True
              Width = 30
              FieldName = 'POSTAVID'
            end>
          Properties.ListSource = dmMain.dsPostav
          Properties.OnEditValueChanged = grTIMP_DOCDBBandedTableView1FK_POST_IDPropertiesEditValueChanged
          Width = 250
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FN_SUMMA_S_NDS: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057
          DataBinding.FieldName = 'FN_SUMMA_S_NDS'
          Width = 80
          Position.BandIndex = 2
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FN_KOLVO_POS: TcxGridDBBandedColumn
          Caption = #1050#1086#1083'-'#1074#1086' '#1087#1086#1079#1080#1094#1080#1081
          DataBinding.FieldName = 'FN_KOLVO_POS'
          Width = 55
          Position.BandIndex = 2
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FN_IMP_DOC_STATUS: TcxGridDBBandedColumn
          Caption = #1057#1090#1072#1090#1091#1089
          DataBinding.FieldName = 'FN_IMP_DOC_STATUS'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 2
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FC_IMP_DOC_STATUS: TcxGridDBBandedColumn
          Caption = #1057#1090#1072#1090#1091#1089
          DataBinding.FieldName = 'FC_IMP_DOC_STATUS'
          OnCustomDrawCell = grTIMP_DOCDBBandedTableView1FC_IMP_DOC_STATUSCustomDrawCell
          Options.Editing = False
          Width = 54
          Position.BandIndex = 2
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FL_CHECK_DOGOVOR: TcxGridDBBandedColumn
          Caption = #1057#1074#1077#1088#1103#1090#1100' '#1089' '#1076#1086#1075#1086#1074#1086#1088#1086#1084
          DataBinding.FieldName = 'FL_CHECK_DOGOVOR'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ImmediatePost = True
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Properties.OnEditValueChanged = grTIMP_DOCDBBandedTableView1FL_CHECK_DOGOVORPropertiesEditValueChanged
          Position.BandIndex = 3
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FL_IS_CHECKED: TcxGridDBBandedColumn
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1087#1088#1086#1074#1077#1088#1077#1085
          DataBinding.FieldName = 'FL_IS_CHECKED'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ImmediatePost = True
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Position.BandIndex = 3
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FK_MO_CHECKED: TcxGridDBBandedColumn
          Caption = #1052#1054', '#1089#1074#1077#1088#1080#1074#1096#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1089' '#1076#1086#1075#1086#1074#1086#1088#1086#1084
          DataBinding.FieldName = 'FK_MO_CHECKED'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'MOID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_NAME'
            end>
          Properties.ListSource = dmMain.dsMO
          Visible = False
          Options.Editing = False
          Position.BandIndex = 3
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object grTIMP_DOCDBBandedTableView1FD_CHECKED_DATE: TcxGridDBBandedColumn
          Caption = #1044#1072#1090#1072' '#1089#1074#1077#1088#1082#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1089' '#1076#1086#1075#1086#1074#1086#1088#1086#1084
          DataBinding.FieldName = 'FD_CHECKED_DATE'
          Visible = False
          Options.Editing = False
          Position.BandIndex = 3
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = grTIMP_DOCDBBandedTableView1
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 872
    Height = 49
    Align = alTop
    TabOrder = 3
    DesignSize = (
      872
      49)
    object bbuExit: TBitBtn
      Left = 744
      Top = 10
      Width = 115
      Height = 32
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      OnClick = bbuExitClick
      Glyph.Data = {
        3E040000424D3E04000000000000FE0100002800000018000000180000000100
        08000000000040020000120B0000120B0000720000007200000000000000FFFF
        FF00FF00FF004E1E1F00BF4C4D00BD4B4C00C04D4E00C14E4F00C4505100C24F
        5000C5515200B64B4C00C9545500C7535400C6525300CA555600CB565700CE58
        5900CC575800C5545500D05A5B00CF595A00D35C5D00D15B5C00D55E5F00D45D
        5E00D8606200D75F6000AF4E4F00D9626300DD656600DC646500DA636400E067
        6800DE666700E2696A00E1686900E56B6C00E36A6B00E96E6F00E76D6E00E66C
        6D009F4B4C00EA6F7000A04C4D00EB707200A34E4F00EE737400ED7273009C4B
        4C00F2767700F0757600EF747500E06D6E00A6515200F6797A00F4787900F377
        7800A9535400F87B7D00F77A7B00FB7E7F00FA7D7E00AF585900AC5657009A4D
        4E00FF818200FE808100FC7F8000F77E7F00B25B5C00EE7A7B00D56F7000B860
        6200B6626300AF5E5F00FE8B8C0091515200FC929300EF909100FB9A9C00E690
        9100EB959600FAA3A400F8AAAB00F2A9AA00EEA6A700F7B5B600A5505000994B
        4B00AB555500B15A5A00B55D5D00B75F5F00914B4B00BB636300BF666600BD65
        65008C4B4B00894B4B009F58580098555500824B4B00EB9C9C00F7B1B100EECE
        AF00FFFFD300D9F6BD00B7EBAA0058A55B003F9E4C005ED3770045CA67001EBC
        4C00020202020202020202020266030202020202020202020202020202020202
        02026666625E0302020202020202020202020202020202666663310B052A0302
        020202020202020202020202026666411C070604042A03596666666666666666
        020202020266130C0D0E0A08092C034C4E505354685757660202020202661112
        100F0C0D0E2E036E71717171717157660202020202661714151112100F58036E
        71717171717157660202020202661818191617141536036E7171717171715766
        020202020266201D1A1B1819163A036E7171717171715766020202020266221E
        1F201D1A1B5A036E71717171717157660202020202662324212235511F40036D
        7171717171715766020202020266282925265601673F03696C6F6F7070705766
        0202020202662D2B27285501525B03696A6A6A6A6B6B5766020202020266342F
        302D2B4F284603696A6A6A6A6A6A576602020202026639393233342F305C0369
        6A6A6A6A6A6A57660202020202663B3C37383932335D03696A6A6A6A6A6A5766
        020202020266443D3E3B3C37384903696A6A6A6A6A6A57660202020202664242
        4344443D3E5F03696A6A6A6A6A6A576602020202026642424242424343610369
        6A6A6A6A6A6A5766020202020266454242424242426003696A6A6A6A6A6A5766
        020202020266664B48424242426003696A6A6A6A6A6A57660202020202020266
        664D4A474260035E666666666666666602020202020202020202666665640302
        0202020202020202020202020202020202020202026603020202020202020202
        0202}
    end
    object cmbImportSource: TcxComboBox
      Left = 8
      Top = 19
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Excel-'#1092#1072#1081#1083' ('#1092#1086#1088#1084#1072#1090' '#1054#1054#1054' "'#1052#1077#1076#1086#1090#1088#1077#1081#1076'")'
        'XML-'#1092#1072#1081#1083' ('#1092#1086#1088#1084#1072#1090' '#1072#1087#1090#1077#1095#1085#1086#1081' '#1073#1072#1079#1099'  '#1075'. '#1057#1091#1088#1075#1091#1090')')
      Properties.ReadOnly = False
      TabOrder = 1
      Height = 21
      Width = 177
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 5
      AutoSize = False
      Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1080#1084#1087#1086#1088#1090#1072''
      Height = 17
      Width = 177
    end
    object buLoad: TcxButton
      Left = 199
      Top = 8
      Width = 115
      Height = 32
      Caption = #1054#1090#1082#1088#1099#1090#1100
      TabOrder = 3
      OnClick = buLoadClick
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        0800000000004002000000000000000000000001000000000000FF00FF003738
        34003B3C3B005654470056574C00A0675B00887F6500A3666800A4666900A06A
        6D00A7756B00BB7E6000AB747000BC826800A3937300D9985500D1926D00DA9D
        7500D8A36E00E7AB7900484AAC004141BA001717FF001A1AFF003939E5002F2F
        F7002626FF002F2EFF003131FD000D7BCC004142D4004242E0004444E9004B49
        E9005C5CED004343FD00615EE1006B6AEB006A6AFB001B84B6001C8BB5001E91
        BC002C88BF002193BF002295BF000888C5000B8CC6000C8DC7000D8EC9001180
        C0000E90C9001D91C5001291CA001492C9001595CB001393CC001395CC001496
        CC001996CB001B98CE001C98CE001A9DCF00189AD1001C9ED2003487C2002193
        C0002295C0002397C400249BC6001FA0D3002BA0CA0035A4C90021A1D40023A4
        D5002FA3D3002CA5D5002DB1DC003FB2D40034B2DD0033B4DE0034B5DE003BBD
        E2003DBCE90047ADCF004ABAD4004BB6DD0050B1D00056B1D00056BAD80066BD
        DE004EB5EB004BB2F80053C6DC0043C2E70046C4E6004ECAEB005FC2E20057C9
        E0005BC2EE005ACEEA005CD5EF004FC6F70051CCF7005ECCF0005BC0F8005CCE
        FA005AD5F2005BD8F20055D1F8005DD8FB0077D8E6007ADDE7007EDDE70077D4
        EF0066CAF70069CCF20064C9FE0065CCFE006BD1F20068D1FB0069D3FF006DD1
        FF0069D7FE0060DAFA0067DEFC006BDCFF0076DDF2007BDAF4007AD5F8007AD8
        FF0079E2E7007FE6EE007FEEEE006DE2F8006DE6FA006DE5FE006DEDF8007BE2
        F50079E6FF0072E9FA0071EAFE0072EEFE0074EEFF0073F3FF0077F2FF0072F6
        FF0077F4FF0078F0FF007FF3FF0079F4FF0072FAFF007EF9FF00A4918700BDB0
        8A00AFAF9300B5B59900908BBB00ADACB400AAA9BF00C9AF9E00FFD09200D7D7
        B000E6D3AB00F2D3AB00E6D5B800F3D7B700F3D9B800F7DDBD008F89D300938C
        D4009797D800AAA5C000BAAFCF00AAD1D900B5D7DE0080DEE70086D1E900A7CC
        EF00A9CCEA00A6D5E000BBD0E300ACD1FA0083EBEB0087EBEA0087EDEB0082ED
        ED0088EBEA008CE9EA0088EDEB0089EDED009EEEEE0080F0EF0091F4ED0084E4
        F30081EBF50082E6FF0082EFFC0086F0F20082FAFF0084FAFF0080FDFF0092F0
        FB00A6E5E700A3EBEA00B2E3E600B8E6E600AAF7EE00B7F3ED00BBF0EE00A6E0
        F000A6E6F300BBEDF800A4F7F000A7FFFF00ABFFFF00D3C9DC00EED8C200F4DD
        C400E3DDDE00E7E7C700FAE3C100F7E3CF00F7E5CF00FAE5C900FEFDCF00F6E5
        D000FEEDD000F7EBDE00F8EBDC00FBEDDE00FFFFD400FFF0DD00FFFFD900C5E6
        EA00C0E3ED00CBE3EF00C2E9EB00C6E9EB00C5F3EE00C4F7F000C7F7FC00CFFF
        FF00E3EEEB00EAE9EE00F4ECEA00F7F2EE00FAF3EB00FFF8EA00FFFFEF00FBF4
        F000FFFFF400FAFAFA00FEFBF800FFFEF900F9FDFF00FEFFFE000031363C0000
        00000000000000000000000000000000000000314D4B2D313131000000000000
        000000000000000000000031CAD5887E5C4D3531313131000000000000000000
        0000003157F19697979797886454443131313100000000000000003144F0C897
        9192929597959288855C4D35313100000000003144B0D592979295959292928B
        928892885F2E0000000005055627CD826F6FAF6F6F8B958B92868B8B7B4E3100
        000007A57129CCC0BABABABAAF928B928B8B8B8B6C6D2D00000005DEA7542BCE
        B7BAB7BA6F8B9292918B8B8B66864B0000000AE7D95C2BEF84BCBCBCAF958886
        928B8B8B6C865F3100000DF7DDC558E9D484B7B7828B7D7A7575757D657D8835
        00000DFDE7E14D42EDD0CFCFCA817A73767673725B69C84D310010FDF5E7E15F
        462B422B40B2D2C5C289C57E5A688A7C2D0011FDFDF5E7DDD9A6A3A22A9E53EF
        B76F6F9772627A97490013FDFDFDF5E7DDDFDFA20CE64446E9D0CBCB7F7180C3
        5F3113FDFDFDFDF5E7D89F9809E8E6464457B3ADAEE9B2B5D03613FDFDFDFDFD
        F507070707FDE8E69A5429282833311D3A3613FDFDFDFDFDFD080F0BB4FDFDE8
        9B02010612AB141B000010F9F9F5F5F5F4080B25D7FDFDFAE8A1040EA0A4151A
        000010101010101010108626A8FAFDFDFDFADB03999C180000000000315CC17F
        C1C9632325ACFDFDFDFDFDE69D1E1A000000000000312D363A3A36302322A9DA
        F2EBF3AA1F1C0000000000000000000000000000001620212424201B1A000000
        0000000000000000000000000000001616161600000000000000}
    end
    object buImport: TcxButton
      Left = 342
      Top = 8
      Width = 115
      Height = 32
      Caption = #1048#1084#1087#1086#1088#1090' '#1074' '#1041#1044
      TabOrder = 4
      OnClick = buImportClick
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF007F7EB0007B79AF00FF00FF00FBFAFB00E2D9DC00A3676B00A4676900A669
        6B00A5686A00A6696A00A5696A00A66A6B00AA6F7000AA707000AF828200FFFE
        FE00AB7572009F6B6500A36B6400B07F7600A56B5F00A7756B00AC695900AC7F
        7500AF6A5600811E00008320010083210100B5837400A77D7000BD9082008E2F
        0C00B67660008A2B0700983E19009A442000DCC2B80095380F0095391100963A
        1300963B1300963C1500963D1600973D1700A4512C00BF7D6000BC826800AF8B
        7B00B8755500CF9D8400B7928000D5B19F00CF906C00CE957500E6D5CC00EEE0
        D800FAF3EF00B0643700C4866200D1926D00D59A7700DCA17D00C5A48F00E0BB
        A500F6E9E100F3E7E000B4642F00DA9D7500DCA37E00E6C7B200FEF7F200D387
        4900D4894A00D18A4F00E6A97800E7AB7900E9B08100E7B08200E7C6AC00CBAF
        9800E1974E00FAF0E600FCF8F400E0AB6F00EBC59C00F4E3D100F8F0E700F0D0
        A900E0C2A000F4D7B500F0D5B400F2D9BB00F3DABC00E9BC7F00EAC08800EDC6
        9300EECB9E00F8E5CC00FFF4E500EEC28000F2C98C00F3CE9700F6D3A000F4DA
        B500F8E3C500EFC48000EFC58100EFC58300F0C78800F8D39600F2CE9500F4D4
        A000F3D3A000FBDCAD00F6D9AB00FEE9C700FCEACE00F4CB8200F3CA8200F4CC
        8300EEC58000F4CC8600F6CE8900F6D19100F0CE9300F8D9A000FAE2B700FCD4
        8400FFE0A400FBE0AD00EBD9B700FFFEFC00F8D48400FFF6D800FFFEF800FFFC
        E600FFFED700FFFFF600FFFFFC00004F0000004C000000520100015503000154
        0300025C040002580300025C0500025B050003720800036E070003690700035F
        060005890C00068F0D0005620A0004800B0005840C000698100006920E00057E
        0C00056F0C00067F0D00097811000EA51D000B7B16000A6E12000F821C0015A4
        280018A92D00138423001BB733001CA035001A922F0023BC41002DC24F0030C6
        560035C660003FDC6F003ED96F0042E0750045E67A00F4F6FA002E50FC00889E
        FF00889DFC002D4EFA002D4DF4002D4BF2002D48E6002C46DE008692D700001E
        FF000222FF000222FE000221FC000323FE000324FE000323FB002C46E6002B44
        DE00828CDC008087CF007E84D500000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000040404040404
        04040404040404080D090B0B0C0C0C0B0B08040404040404040404040404040F
        8A80837F7D7B7886810C040404040404040404040404040E875DCBC8C7C90365
        770C040404040404040404040404041289CAC3C1C1C1C402770C040404040404
        04040404040404198BBDC1C1C1C1C1BF7C0C040404040404040404040404041E
        01C5C1C1C1C1C1C76F0C040404040404040404040404043701BBC1C1C1C1C1BE
        820B040404040404040404040404043E01BAC2C1C1C1C3C05A0A040404040404
        040404040404043F0101B9B8C6BCCC5131070404040404040404040404040446
        01010101855820141318080808080808080808080808044F0101010101B7104B
        4A040875697471706E6C7A796B08044E053A3A3A54391522040408765E5C5962
        61605F6C6B08044C363D3D3D3D9CA704040408502D2C2B2A292827446B080404
        040404048FAEB590040417642E1B1B1B1B1B1C556D0804040404048DABB4B6B0
        9004178C471D1B1B1B1B3B7E66080404040490A8B2B3B1AAA990308C53321B1B
        1B235672670804040404909090ADAF9090903D8C4842211B1B3C5B7368080404
        040404048EA6AC9004043D8C0111331B24636A84400804040404040491A4A590
        0404458C01011125415735341F0804040404040499A39F900404458C01010143
        88381616161A04040404040498A09E9004044D8C010101010106165249040404
        040404979B9A900404044D3A3A3A3A3A3A26162F0490909194A2A19D96900404
        04044D3D3D3D3D3D3D3D16040404909092959293910404040404}
    end
    object buKontrNakl: TcxButton
      Left = 488
      Top = 8
      Width = 97
      Height = 32
      Hint = #1053#1072#1082#1083#1072#1076#1085#1099#1077' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1072#1084
      Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077
      TabOrder = 5
      OnClick = buKontrNaklClick
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF00F8F6F700A6696B00A6696A00A5696A00916C6D00FEFCFC00FFFE
        FE00FCFBFB00A066640096676300AF827E00926C6900B187840096676200986F
        6A009667600092635D009D6D6600986A6300AF817A00B0827A00A3726800A776
        6A00AC7A6C0092695D00A4766A00FFF8F600B06D580089706800B5826F00B07E
        6D0087726B00FEF8F600FEFBFA00B2776000CCA69600C4886D00BF8A7300BA86
        7000F4EDEA00B47A5C00CB927500C58E7400FEFCFB00C2795200C2805C00D090
        6B00D59A7800D59A7900CF977700CF8E6800D5936C00F4E9E200C68E6700FCF3
        ED00C58E6600F4E7DC00FAEFE600F8EEE600FEF8F300FFFAF600D0874500D091
        5900D1976200FAEFE500FCF3EB00FCF4ED00F6E2CE00FAEBDC00F8EADC00F7EA
        DD00FBF4ED00FBF7F300E6882300F2D9BD00F4DDC400F4DEC600F2DDC600F6E2
        CC00F7E3CE00F6E3CF00F8E7D400F7E6D400F8EBDD00FAEFE300FAF0E500FBF3
        EA00EFB06200F0D0A900F0D0AA00F2D4B000F2D4B100F2D5B100F2D8B800F4DA
        BB00F6DDBF00F3DCC000F6E0C700F6E3CC00F3E1CB00F7E7D400FAEBD900FAED
        DD00F8F2EB00FFFAF400EDC69500EECA9C00EFCEA100EFCEA300F0D1AA00F8DA
        B100F0D4B100E0C6A500F2D8B700F2D9B700F3DCBF00F4E0C600F8E7D000F4E6
        D400F6EADA00FAEFE100F7EEE200FBF3E900FBF4EB00FFAB3500FFBB5900BAA7
        8C00F8E0BC00F7E3C700F8E9D400FAEEDD00FBF2E500FEFAF400F3CC9100F3D0
        9800F4D39F00F6D7A600FBE2BA00F6E1C100D5C9B200B6AC9800FFF2DA00FCF8
        F000FFFEFC00FAEED300FFFBF200A9A18E00FFFEFB00FFFFFC00FFFFFE00006A
        00006A6A6A000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        0202999A999A999A999A999A999A999A999A02020202020202029A999A999A99
        9A999A999A999A999A991304040506060606999A010101010101010101010101
        999A12828C718B8A89889A990101010101010101010101019A99104D615E5C6E
        6D6C999A019999990101010199999901999A10508D605E5B6F6D9A9901019999
        99010199999901019A9910668363745D706F999A010101999999999999010101
        999A0C79786476605F709A990101010199999999010101019A99157A68534F63
        6072999A010101019999999901010101999A147C7B67517776749A9901010199
        99999999990101019A99186A7D5655467776999A010199999901019999990101
        999A194B913C4954654F9A990199999901010101999999019A991A2496453D56
        8452999A010101010101010101010101999A212E013F444369549A9901010101
        01010101010101019A99200A01091D455856999A999A999A999A999A999A999A
        999A290A0101096B4A589A999A999A999A999A999A999A999A99282E01010198
        8739434767514E627573811F0202020202022D2E0101010198237E5748679093
        8E8F95220202020202022C2E01010101019287598685261C110E071B02020202
        02023408010101010101973E943B172B41404C1E020202020202320801010101
        01010192973716385A7F2F0202020202020232080101010101010101012A0D3A
        803002020202020202023301010101010101010101030F422702020202020202
        0202353131313131313131313136250B02020202020202020202}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 271
    Width = 872
    Height = 40
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 4
    DesignSize = (
      872
      40)
    object buDelItem: TcxButton
      Left = 720
      Top = 5
      Width = 140
      Height = 30
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
      Anchors = [akTop, akRight]
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = buDelItemClick
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF00FEFCFC0096351100FEFCFB0098441000FEF8F400BD580C00FEF3
        EA00FEF8F300E97F1E00FEF3E900FEF4EB00FEDAB600FEDDBB00FEDEBD00FEE6
        CE00FEEBD800FEEFE000FEF0E200FEF6EE00FEF7F000FEFAF600FEFBF800FEFC
        FA00FECB9600FECC9700FECC9800FECE9800FECE9A00FED3A500FED5AA00FED9
        B000FED9B200FEDCB800FEE0BF00FEE1C100FEE2C400FEE3C600FEE5C900FEE6
        CB00FEE7CF00FEEAD400FEEAD500FEEBD700FEEEDD00FEF4E900FEE5C700FEE9
        D000FEEBD500FEEDD900FEEFDE00FEF3E600FEF7EF00FEEAD100FEEEDA00FEF2
        E200FEF2E300FEF4E700FEF8F000FEFBF700FEF6EB00FEFAF400FEFEFC0000BD
        FF002856F8002A59FF00305FFB001844FF002049F8002250FF00244BEF000E36
        FF00123BFF00133EFF00143BF8001540FF001A41F700193FF0001D42ED000A31
        FC000A2BF3000B2EFF000C33FF000C2FF7000C2EF6000D34FF000D2EF3000E32
        FF000E2FF3000E30F3001032F6001033F6001135FB001134F6001133F0001134
        ED001336F000001FFF000425FF000626FA000624F0000724ED00082AFF000927
        F0000D2DF300001DFF00001CFB000018F6000019F6000018F3000019F3000017
        EF00011CFE000118EE00021EF30000008200FEFEFE00DCDCDC00FFFFFF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202040404040404
        040404040404040404040404040404040202043E351333372926100E21201F75
        751C1A1A1A1A1A757502040A153B14382B1127242322755166751D1A1A1A756D
        6C7504183F162F3A2E322A28250F75565467751E1B75706B7175040404040404
        040404040404047558576975756E637375020441414141414141414141414141
        755A4965726B6F75020204414141414141414141414141414175556864747504
        0202044141414141414141414141414141755E59535275040202040404040404
        0404040404040404754E455F5C4A6A7502020476767676767676033D0A150C75
        46474F7575604B5B750204767676767676767676193F75424350752A3075614D
        5D75047676767676767676767605754448751312312675624C75040404040404
        0404040404040475750404040404047575020476767676767676767676767640
        18073609392C1104020204767676767676767676767676767619173C0D342D04
        0202047777777777777777777777777777777777777777040202040606060606
        060606060606060606060606060606040202080B0B0B0B0B0B0B0B0B0B0B0B0B
        0B0B0B0B0B0B0B08020202080808080808080808080808080808080808080802
        0202020202020202020202020202020202020202020202020202}
    end
    object buDelDoc: TcxButton
      Left = 13
      Top = 5
      Width = 140
      Height = 30
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = buDelDocClick
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF00FEB78100FEC29500F4AD7200FAB57E00FFBF8B00FFC69800FECC
        A400FFCEA600FCD5B400FFDEC200EDA05800EDA66700EEA96900EEAA6B00F4B1
        7500F0B17600F2B27800F4B57D00F3B67D00F2B67E00F3B78000FABC8400F7BB
        8400F8BD8600F8BD8A00F6BD8900F7C08E00F7C19000FCC99A00FAC69900F8C5
        9800FFCC9F00FAC99C00FBC99E00FBCBA100FCD0A900EB9D4E00EDA15400EDA1
        5500EDA35900EBA15900EDA45C00EEA76200EEA96500EEAA6900EEAB6C00F0AD
        6E00EEAC6D00EFAF6F00EEAD6F00F0B07300EFAF7200EFB07300EFB27400F0B4
        7700EFB27600F3B57900F4B67A00F2B57A00F2B57B00F8BC8300FABF8700F7BF
        8600FAC08800FAC08900F4BC8700FBC48C00F6BF8B00F6C08C00F4C08B00F4C0
        8F00FFCB9700FFCE9C00FCD3AB00FCD4AD00FED7AF00FED8B200F7D5B200EDA3
        5500EEA75C00EFB47600F2B77A00F0B77B00F0BA7F00F2BC8200F2BD8300F8C1
        8800FAD1A300FFD7AB00FED9B200FEDAB400E5B17400F0BC8100F3BF8400F2BF
        8400F3C08600F3C18700F4C58B00F3C28A00F4C68F00F8CB9500FFD9AD00FEDC
        B500FEDDB600FEDEB700F8DDBC00F3C07E00F3C99100E3BC8700F4CA9200F4CB
        9500FAD4A000FFE2BC00F4C48100F6CE9700F6D09A00FCD9A700FFDEB000FEE3
        BB00F6D09500F6D39E00F8D7A300F7D7A400F8DAA900FFE2B400FEE5BD00E2C1
        8A00F7D49900F8D9A100E2C69300F7DAA600FEE7BF00FBE9CB00FAE2B100FCE6
        BB00FEE9C000FEEAC200FFEDCA00FBE5B500FBE5B600FAE5B600FAF6ED00FBE6
        B600FEEDC400FFEEC600FEEDC500FFEFC700FCEDC700FBEABD00FFF0C700FFF2
        D000FFF3D400FBEBBB00FFF2C900FFF2CA00FCEFC200FEF2C600EEE2BA00FEF3
        C900FFF8DA00D0C28400FCF2C600FFF6CA00FFF6CC00FFF7CF00E9E1B400FEF7
        CE00FFF8D000FFF8D100CBC48B00D3CC9300FFFBD300FFFCD400FEFBD300FFFE
        D500E9E9C200FFFFD800FFFFD900F0F0CC00FFFFDC00FFFFE000FBFCE000BAC0
        7B00C9CE9100EAEEC600C7D3A300A4BB6F00D3E5B400CADEB100B1CC95007EAD
        550099C17400EEF4E90082B763008BBF7200E7F3E2004A9A2F0058A54100FBFE
        FA007EBF6C00429D30003C9C2D00CAE6C500EBF6E900B1DAAB00379C2C0052AD
        4800A3D59E00C0E2BC002F9927003199280039A031003FA4360062B65B0067B7
        600083C67E00B1DCAD0021921A002697210033A02E0045A7410062B75E007DC5
        79000D890B00138B11001F931B0038A1340045A942004FAF4C0066BA63006DBD
        6A00007B000000790000007800000076000000730000017F0100017E01000481
        03000380030006830500098608000A8709000A8609000D880C001F951E000180
        0200028103000000000000000000000000000000000000000000020202020202
        020202020202020202020202020202020202020202020202103956553A313233
        3202020202020202020202020202027588887C705F3733546264613632020202
        02020202020288AFA98E7C6E4111310722687F8E63320202020202020202A4B3
        A18D7C67A38149C1C8C4A8A7A557320202020202020276B4A98F7D4BBDD5CCEA
        EBECE4BEB77E32020202020202300F709F9E854AB9F9EAEFF1E2EDDEB8723202
        020202020230100E537B8878BAF3EAF6CFCE32FAC20332320202020202343634
        100F331AADFAECEBE9C901E1C706103202020202023D17163E1312056FDFE6E7
        D9C60101C05E10320202020232471E1D461C441984900101C3CDD3DBBC153032
        020202021325252423202108ACD80101D2F7F2EACB04353502020202484F4D4C
        2626260A50DCE80101DAEAEAD0091414020202025A736B6A695D5C4E0CC5EBE5
        E0F8F0EAD40B1B1B3202023886948B8A868080797387D6EEEDEAEAF5DD6C1F1F
        32020260A7A7A69D9C989593928CB2D1E3F4D7BFCAA05B5B32020276B4AEAEAE
        AEABAAAAA7A6ABA2B5BB9A999996898932020288B4AEAEAEAEAEAEAEAEAFB1B4
        B6B4B4AFAAA7A1A154020297B4AEAEAEAEAFAFB1B4B4A48274747A91A6B3B1B1
        62020270B0B4B3B1AFAEA99B836D522727272B3359779C9C6E02020256757166
        6558382E2C0D2928282A2F3B1A1845411A020202020202020202020202020202
        512D353F434240401A02020202020202020202020202020202023C4242424242
        4302020202020202020202020202020202020202424242420202}
    end
    object buEdit: TcxButton
      Left = 352
      Top = 5
      Width = 140
      Height = 30
      Hint = #1042#1082#1083'./'#1042#1099#1082#1083'. '#1088#1077#1078#1080#1084' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1079#1072#1087#1080#1089#1077#1081
      Anchors = [akTop, akRight]
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = buEditClick
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF0022212300534E5700FF00FF0041353800A4676900A5686B007A494A005A35
        35008B555500804E4E0091595900965D5D008B565600734747008C5757009560
        6000AA6E6E00A96D6D00A76C6C00A66B6B008C5B5B0091606000B77A7A00B679
        7900B87B7B00BB7E7E00BA7D7D009C696900CB8C8C00CA8B8B00C98B8B00C78A
        8A00CC8E8E00DA9A9A00D9999900C2898900D99A9A00DC9D9D00E1A1A100DA9C
        9C00E2A3A300EBAAAA00E2A4A400E1A3A300643B3A00734847007B504F005D38
        360093656000E2D0CE009566600093655F009869630084544C009F675B009E6E
        6400A3726600DDC7C200FBF7F6009D6D5F00865D51007350460062443C00A775
        68009F6F6000AC796900583F3700533C3500DDC4BC0096695A00B17E6B00FFFC
        FB00BB846E00B6816C00BCA19600DAC0B600BBA19600CB917300C58C7000C089
        6F00FCF8F600FAF6F400CF8E6800D4987500CF967400F6EEE900F8F3F000AA78
        56003C383500FEF7F200ECD5C200E1CCBB003E3935006A554200F2E2D300FAEE
        E300F4EAE100B77D460066523F0064513E0065524000EFDAC500F2E6DA00FBF2
        E900FEF7F000FDF8F300EAB2730062503D00604F3D00EED4B800F0DAC200F6E3
        CE00F0DECB00F7E6D300F4E3D000F8EEE300FBF3EA00EFA75100EDB57200EAB4
        7400F2D5B100E9CCAB00F4DEC500F4E1CA00F3E0CA00F7E7D400FAEAD700F8EA
        D900F7EADA00F8EBDC008E745100E5BC8400A4865F00B29268009E835F00E1BB
        88006C594100897253006A5841008E775900DEBB8C00AA8F6B00C6A67E007764
        4C00E1C09300C1A57F00836F5600E6C79D00C9AD89008C796000EDCEA700D9BD
        9900E6CEAF00F2DABC00EAD4B600F4DEC000AC9D8A00F6E1C600F7E5CE00F6E6
        D100F8EBDA00FAEEDE00FBF2E600E1B77900EABF7F00CCA66E00E9BD7F00E7BC
        7E00E5BB7D00DEB57900DAB17700D9B17600E3BA7D00D1AB7300C09C6900A989
        5D009A7E5500E7BC8100E1B77D00C7A36F00BC996900B2916300D1AB7500826C
        4B00987D5800DAB47F00C7A474007B664800B89A6F007E694C00766347006F5D
        4300D1AF7F009D876700F0D8B700EBD8BD00FCF6ED00FCF7F000E3BA7B00FEFB
        F600FFFAEF00FFFEFB00FFFEF700FFFFFE003A494800748686003443440000BD
        FF0000B1F2004E6C760000AAEA0000A6E600009FDE000093D100097BAB001A3E
        4D000087C4000084C100028AC4000B4159000C3C5200113B4E00008CD100036A
        9D0004689A000459830005679800064F7500182A33001B506E00315065003547
        56002A34400041485500012BA700001C9D002D4FF6005270FC00021DB100031E
        B1000420B8000725DC000F2ECC001839E3000C21BF00010D9D001322BD001624
        BF0001099700010A9700050DA50000058F00000082001F1F2100040404040404
        0404040404040404040404040404040404043506060606060606060606060606
        06060606060404040404356F9B7A9895928E8985B3A9A8A8A8A8A6A942040404
        0404355C9DC47B99969390C2BBB4AEA9A8A8A6A942040404040435679F9B9A02
        5E97C38FBEBCB8ABAAA9A6A94204040404043272A07C9C5AFFE6D0948D8887B5
        ADAEA9A942040404040434608071709EDFE2E5DECE918B86B6AFA5C842040404
        04043668A37F7DC5D9E1E4E7EA055FBFBAB7A7AC3D04040404043962A483737E
        CFE3E811120D2E66C084B1B04704040404043A57C675827372DD16221B120D2E
        65C1B9B23E04040404044158C9767583A1D31D271E1C130C096D8CBD3F040404
        04044353CD6B6975A274302C271E1C1310096E8A400404040404485301CB6A76
        61815D302A271F1A140E09644404040404044B530101495B7675835D2F2D2920
        1A140E314504040404044A53010101CB5B7661814E2F28232018150A09040404
        0404515301010101CB5B6961A24E2F28262118150A0904040404505301010101
        01496B7675814C172B2421190BEBE90404044F53010101010101CBC769A45C37
        172B2403DCD4D5DA0404563C0101010101010149C7CA4D38591725D8D1D1D5ED
        FE045552010101010101010149CC463879630FD6D1E0EDF7FBFE555201010101
        0101010101013B386C7708D7D2ECF3F2F0FB55CD010101010101010101013338
        78070404DBF6EEF4F1FD54545454545454545454545454380704040404F9EFF5
        FA040404040404040404040404040404040404040404F8FC0404}
      SpeedButtonOptions.GroupIndex = 1
      SpeedButtonOptions.AllowAllUp = True
    end
  end
  object XMLDocument1: TXMLDocument
    Left = 230
    Top = 148
    DOMVendorDesc = 'MSXML'
  end
  object odsTIMP_DOC: TOracleDataSet
    SQL.Strings = (
      'select a.ROWID, a.fk_id, '
      '      a.fc_src_doc_num, a.fc_src_doc_date, a.fc_src_postav,'
      
        '      a.fc_src_kontrakt, a.fc_src_vid_oplati, a.fc_src_schet_fak' +
        'tura,'
      
        '      a.fc_src_summa_s_nds, a.fc_src_kolvo_pos, a.fc_src_comment' +
        ', a.FD_IMPORT,'
      ''
      
        '      a.fd_ins_date, a.fd_edit_date, a.fk_ins_mo, a.fk_edit_mo, ' +
        'a.fd_doc_date,'
      
        '      a.fk_post_id, a.fn_summa_s_nds, a.fn_kolvo_pos, a.FC_IMP_F' +
        'ILENAME,'
      ''
      
        '      a.FL_CHECK_DOGOVOR, a.FL_IS_CHECKED, a.FK_MO_CHECKED, a.FD' +
        '_CHECKED_DATE,'
      ''
      
        '      MED.PKG_TIMP_NAKL.CALC_IMP_DOC_STATUS(a.fk_id, a.fc_src_do' +
        'c_num, a.fd_doc_date, a.fk_post_id, a.FL_CHECK_DOGOVOR, a.FL_IS_' +
        'CHECKED ) as FN_IMP_DOC_STATUS,'
      
        '      MED.PKG_TIMP_NAKL.DECODE_IMP_DOC_STATUS(MED.PKG_TIMP_NAKL.' +
        'CALC_IMP_DOC_STATUS(a.fk_id, a.fc_src_doc_num, a.fd_doc_date, a.' +
        'fk_post_id, a.FL_CHECK_DOGOVOR, a.FL_IS_CHECKED )) as FC_IMP_DOC' +
        '_STATUS'
      ''
      '  FROM med.timp_doc a'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000001900000005000000464B5F49440100000000000B00000046445F444F
      435F444154450100000000000E00000046435F5352435F444F435F4E554D0100
      000000000F00000046435F5352435F444F435F444154450100000000000D0000
      0046435F5352435F504F535441560100000000001100000046435F5352435F56
      49445F4F504C4154490100000000001200000046435F5352435F53554D4D415F
      535F4E44530100000000001000000046435F5352435F4B4F4C564F5F504F5301
      00000000000B00000046445F494E535F444154450100000000000C0000004644
      5F454449545F4441544501000000000009000000464B5F494E535F4D4F010000
      0000000A000000464B5F454449545F4D4F0100000000000A000000464B5F504F
      53545F49440100000000000E000000464E5F53554D4D415F535F4E4453010000
      0000000C000000464E5F4B4F4C564F5F504F530100000000000F00000046435F
      494D505F46494C454E414D450100000000001400000046435F5352435F534348
      45545F46414B5455524101000000000011000000464E5F494D505F444F435F53
      54415455530100000000001100000046435F494D505F444F435F535441545553
      0100000000000F00000046435F5352435F4B4F4E5452414B540100000000000E
      00000046435F5352435F434F4D4D454E5401000000000010000000464C5F4348
      45434B5F444F474F564F520100000000000D000000464C5F49535F434845434B
      45440100000000000D000000464B5F4D4F5F434845434B45440100000000000F
      00000046445F434845434B45445F44415445010000000000}
    Cursor = crSQLWait
    UniqueFields = 'FK_ID'
    RefreshOptions = [roAfterInsert, roAfterUpdate]
    Session = dmMain.os
    BeforeOpen = odsTIMP_DOCBeforeOpen
    AfterOpen = odsTIMP_DOCAfterOpen
    AfterScroll = odsTIMP_DOCAfterScroll
    Left = 60
    Top = 148
  end
  object dsTIMP_DOC: TDataSource
    DataSet = odsTIMP_DOC
    Left = 144
    Top = 148
  end
  object odsTIMP_DOC_ITEMS: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '       a.ROWID, a.fk_id, a.fk_imp_doc_id,'
      '      '
      '       a.fc_src_num, a.fc_src_medic_torg_name,'
      '       a.fc_src_medic_id_their, a.fc_src_medic_ed_izm,'
      '       a.fc_src_medic_kolvo, a.fc_src_party_seria,'
      '       a.fc_src_party_godnost, a.fc_src_party_price_bez_nds,'
      '       a.fc_src_party_summ_nds, a.fc_src_nds,'
      '       '
      '       a.fc_src_party_proizvoditel, a.fc_src_party_sertifikat,'
      '       a.fd_ins_date, a.fd_edit_date, a.fk_ins_mo, a.fk_edit_mo,'
      '       '
      '       a.fk_prs_medic_id_our, a.fk_prs_medic_id_their,'
      '       a.fk_prs_medic_ed_izm, a.fn_prs_medic_kolvo,'
      '       a.fd_prs_party_godnost, a.fn_prs_party_price,'
      '       a.fn_prs_party_summ_nds, a.fn_prs_nds,'
      '       a.fk_prs_party_proizvoditel, a.fk_prs_party_sertifikat,'
      '       '
      '       a.fk_imp_kartid, a.fk_imp_tdpc, a.fn_imp_status,'
      
        '       MED.PKG_TIMP_NAKL.DECODE_IMP_ITEM_STATUS(a.fn_imp_status)' +
        ' as FC_IMP_STATUS'
      ''
      '  FROM med.timp_doc_items a'
      'where '
      ' a.fk_imp_doc_id = :pfk_imp_doc_id'
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000F0000003A50464B5F494D505F444F435F49440300000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000002000000005000000464B5F49440100000000000D000000464B5F494D
      505F444F435F49440100000000000A00000046435F5352435F4E554D01000000
      00001600000046435F5352435F4D454449435F544F52475F4E414D4501000000
      00001500000046435F5352435F4D454449435F49445F54484549520100000000
      001300000046435F5352435F4D454449435F45445F495A4D0100000000001200
      000046435F5352435F4D454449435F4B4F4C564F010000000000120000004643
      5F5352435F50415254595F53455249410100000000001400000046435F535243
      5F50415254595F474F444E4F53540100000000001A00000046435F5352435F50
      415254595F50524943455F42455A5F4E44530100000000001500000046435F53
      52435F50415254595F53554D4D5F4E44530100000000000A00000046435F5352
      435F4E44530100000000001900000046435F5352435F50415254595F50524F49
      5A564F444954454C0100000000001700000046435F5352435F50415254595F53
      4552544946494B41540100000000000B00000046445F494E535F444154450100
      000000000C00000046445F454449545F4441544501000000000009000000464B
      5F494E535F4D4F0100000000000A000000464B5F454449545F4D4F0100000000
      0013000000464B5F5052535F4D454449435F49445F4F55520100000000001500
      0000464B5F5052535F4D454449435F49445F5448454952010000000000130000
      00464B5F5052535F4D454449435F45445F495A4D01000000000012000000464E
      5F5052535F4D454449435F4B4F4C564F0100000000001400000046445F505253
      5F50415254595F474F444E4F535401000000000012000000464E5F5052535F50
      415254595F505249434501000000000015000000464E5F5052535F5041525459
      5F53554D4D5F4E44530100000000000A000000464E5F5052535F4E4453010000
      00000019000000464B5F5052535F50415254595F50524F495A564F444954454C
      01000000000017000000464B5F5052535F50415254595F534552544946494B41
      540100000000000D000000464B5F494D505F4B41525449440100000000000B00
      0000464B5F494D505F544450430100000000000D000000464E5F494D505F5354
      415455530100000000000D00000046435F494D505F5354415455530100000000
      00}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = dmMain.os
    Left = 60
    Top = 282
  end
  object dsTIMP_DOC_ITEMS: TDataSource
    DataSet = odsTIMP_DOC_ITEMS
    Left = 60
    Top = 332
  end
  object oqMakeImportNaklMedics: TOracleQuery
    SQL.Strings = (
      'DECLARE'
      '  pfk_POST_id NUMBER;'
      '  pfk_TO_id NUMBER;'
      '  pfd_NAKL_DATE DATE;'
      '  pfc_doc_num med.timp_doc.fc_src_doc_num%type;'
      '  pfc_comment med.timp_doc.FC_SRC_COMMENT%type;'
      '  pFC_SRC_KONTRAKT med.timp_doc.FC_SRC_KONTRAKT%type;'
      '  pFC_SRC_SCHET_FAKTURA med.timp_doc.FC_SRC_SCHET_FAKTURA%type;'
      ''
      '--  pFK_DOCID NUMBER;'
      '  pDPCID NUMBER;'
      '  pFK_KartID NUMBER;'
      '  pFN_DOC_SUM NUMBER;'
      '  pFL_NOT_CHECK_PRICE NUMBER;'
      '  pfc_party_num VARCHAR2(50);'
      '  pfn_party_num NUMBER;  '
      ''
      '  '
      '  CURSOR cImpDoc IS'
      '  SELECT a.fc_src_doc_num, a.fd_doc_date, '
      
        '       a.FC_SRC_COMMENT, a.fk_post_id, a.FC_SRC_KONTRAKT, a.FC_S' +
        'RC_SCHET_FAKTURA'
      '  FROM med.timp_doc a WHERE a.FK_ID = :pFK_IMP_DOC_ID;'
      ''
      '  CURSOR cImpMedics IS'
      '  SELECT '
      
        '    fk_prs_medic_id_our as medicid, fk_prs_medic_ed_izm as fk_ei' +
        'izm, fn_prs_medic_kolvo as fn_kol, '
      
        '    decode( nvl(fn_prs_medic_kolvo,0), 0,0, fn_prs_party_summ_nd' +
        's/fn_prs_medic_kolvo) as fn_price, '
      
        '    fd_prs_party_godnost as fd_goden_do, fc_src_party_seria as F' +
        'C_SERIAL, FK_ID as FK_TIMP_DOC_ITEMS_ID,'
      '    fk_prs_party_proizvoditel, fk_prs_party_sertifikat,'
      '    case'
      
        '      when ASU.PKG_SMINI.READSTRING('#39'MEDICA.EXE'#39', '#39'FUNC_USE_MEDU' +
        'CHGRP_CH'#39', '#39'0'#39') = '#39'1'#39' then  m.uchgrid'
      '      else null'
      '    end as uchgrid'
      ''
      '  FROM MED.TIMP_DOC_ITEMS,'
      '       med.tmedic m'
      '  where TIMP_DOC_ITEMS.fk_prs_medic_id_our = m.medicid (+)'
      
        '    and (fk_imp_doc_id = :pFK_IMP_DOC_ID) and ( FN_IMP_STATUS >=' +
        ' 0 );'
      ''
      'begin'
      '  Open  cImpDoc;'
      
        '  Fetch cImpDoc into pfc_doc_num, pfd_NAKL_DATE, pfc_comment, pf' +
        'k_POST_id, pFC_SRC_KONTRAKT, pFC_SRC_SCHET_FAKTURA;'
      '  Close cImpDoc;'
      '  '
      '  if :pFK_DOCID is null then'
      
        '    INSERT INTO MED.TDOCS (FC_DOC,      FD_INVOICE,   FD_DATA,  ' +
        '     POSTAVID,    FP_VID, FP_VIDMOVE, FL_EDIT, FK_MOGROUPID_TO, ' +
        '               MOOWNERID,                FC_COMMENT,  FC_KONTRAK' +
        'T,      FC_SCHET_FAKTURA)'
      
        '                    VALUES(pfc_doc_num, pfd_NAKL_DATE,pfd_NAKL_D' +
        'ATE, pfk_POST_id, 1,      1,          1,       med.PKG_MEDSES.ge' +
        't_cur_mogroup, med.PKG_MEDSES.get_curmo, pFC_COMMENT, pFC_SRC_KO' +
        'NTRAKT, pFC_SRC_SCHET_FAKTURA) returning dpid into :pFK_DOCID;'
      '  else'
      '    UPDATE MED.TDOCS set FC_DOC = pfc_doc_num,'
      '                         FD_INVOICE = pfd_NAKL_DATE,'
      '                         FD_DATA = pfd_NAKL_DATE,'
      '                         POSTAVID = pfk_POST_id,'
      '                         FP_VID = 1,'
      '                         FP_VIDMOVE = 1,'
      '                         FL_EDIT = 1,'
      
        '                         FK_MOGROUPID_TO =med.PKG_MEDSES.get_cur' +
        '_mogroup,'
      
        '                         MOOWNERID = 913,--med.PKG_MEDSES.get_cu' +
        'rmo,'
      '                         FC_COMMENT = pFC_COMMENT,'
      '                         FC_KONTRAKT = pFC_SRC_KONTRAKT,'
      
        '                         FC_SCHET_FAKTURA = pFC_SRC_SCHET_FAKTUR' +
        'A'
      '    WHERE dpid = :pFK_DOCID;'
      '  end if;'
      '  '
      '  pFN_DOC_SUM := 0;'
      '  for i in cImpMedics LOOP'
      
        '    select NVL(MAX(TKart.fn_party_num),'#39'0'#39') into pfc_party_num  ' +
        'from med.TKart where TKart.medicid = i.medicid;'
      '    pfn_party_num := TO_NUMBER(pfc_party_num) + 1;'
      
        '    INSERT INTO MED.TKART (medicid,   fn_party_num,  fc_serial, ' +
        ' fd_goden,    fn_price, fn_kol, FN_PRODCERTID, uchgrid) '
      
        '                   VALUES (i.medicid, pfn_party_num, i.FC_SERIAL' +
        ', i.FD_GODEN_DO, i.FN_PRICE, i.FN_KOL, nvl(i.fk_prs_party_sertif' +
        'ikat,i.fk_prs_party_proizvoditel ), i.uchgrid ) RETURNING kartid' +
        ' into pFK_KartID;'
      '    INSERT INTO MED.TDPC (dpid,     kartid,   fn_kol)'
      
        '                  VALUES (:pFK_DOCID, pFK_KartID, i.FN_KOL) retu' +
        'rning dpcid into pDPCID;'
      '    pFN_DOC_SUM := pFN_DOC_SUM + i.FN_PRICE*i.FN_KOL; '
      ''
      
        '    update MED.TIMP_DOC_ITEMS set FK_IMP_TDPC = pDPCID, FK_IMP_K' +
        'ARTID = pFK_KartID, FD_IMPORT = sysdate where FK_ID = i.FK_TIMP_' +
        'DOC_ITEMS_ID;'
      '  END LOOP;'
      '  '
      '  -- '#1087#1088#1086#1089#1090#1072#1074#1083#1103#1077#1084' '#1092#1083#1072#1075' '#1080#1084#1087#1086#1088#1090#1072' '#1076#1083#1103' '#1082#1072#1078#1076#1086#1081' '#1079#1072#1087#1080#1089#1080
      
        '--  UPDATE ASU.TIMP_POST_NAKL SET FL_IS_IMPORTED = 1 where FK_TI' +
        'MP_DOCS = :pFK_ID and ( ((:pFL_CHECK_PRICE=0)and(FN_STATUS in(0,' +
        '4,5))) or (FN_STATUS=0) );'
      
        '  UPDATE med.timp_doc a set FD_IMPORT = sysdate WHERE a.FK_ID = ' +
        ':pFK_IMP_DOC_ID;'
      
        '  UPDATE MED.TDOCS SET FN_PRICE = pFN_DOC_SUM WHERE DPID = :pFK_' +
        'DOCID;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000020000000F0000003A50464B5F494D505F444F435F49440300000000
      000000000000000A0000003A50464B5F444F43494403000000040000009F5100
      0000000000}
    Cursor = crSQLWait
    Left = 374
    Top = 16
  end
  object oqAddDocItem: TOracleQuery
    SQL.Strings = (
      'begin'
      
        'INSERT INTO med.timp_doc_items a (a.fk_imp_doc_id, a.fc_src_num,' +
        ' a.fc_src_medic_torg_name,'
      
        '                                  a.fc_src_medic_id_their, a.fc_' +
        'src_medic_ed_izm,'
      
        '                                  a.fc_src_medic_kolvo, a.fc_src' +
        '_party_seria,'
      
        '                                  a.fc_src_party_godnost, a.fc_s' +
        'rc_party_price_bez_nds,'
      
        '                                  a.fc_src_party_summ_nds, a.fc_' +
        'src_nds,'
      
        '                                  a.fc_src_party_proizvoditel, a' +
        '.fc_src_party_sertifikat)'
      
        '                          VALUES (:pfk_imp_doc_id, :pfc_src_num,' +
        ' :pfc_src_medic_torg_name,'
      
        '                                  :pfc_src_medic_id_their, :pfc_' +
        'src_medic_ed_izm,'
      
        '                                  :pfc_src_medic_kolvo, :pfc_src' +
        '_party_seria,'
      
        '                                  :pfc_src_party_godnost, :pfc_s' +
        'rc_party_price_bez_nds,'
      
        '                                  :pfc_src_party_summ_nds, :pfc_' +
        'src_nds,'
      
        '                                  :pfc_src_party_proizvoditel, :' +
        'pfc_src_party_sertifikat)'
      '  returning a.fk_id into :pFK_ID;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      030000000E0000000F0000003A50464B5F494D505F444F435F49440300000000
      000000000000000C0000003A5046435F5352435F4E554D050000000000000000
      000000180000003A5046435F5352435F4D454449435F544F52475F4E414D4505
      0000000000000000000000170000003A5046435F5352435F4D454449435F4944
      5F5448454952050000000000000000000000150000003A5046435F5352435F4D
      454449435F45445F495A4D050000000000000000000000140000003A5046435F
      5352435F4D454449435F4B4F4C564F050000000000000000000000140000003A
      5046435F5352435F50415254595F534552494105000000000000000000000016
      0000003A5046435F5352435F50415254595F474F444E4F535405000000000000
      00000000001C0000003A5046435F5352435F50415254595F50524943455F4245
      5A5F4E4453050000000000000000000000170000003A5046435F5352435F5041
      5254595F53554D4D5F4E44530500000000000000000000000C0000003A504643
      5F5352435F4E44530500000000000000000000001B0000003A5046435F535243
      5F50415254595F50524F495A564F444954454C05000000000000000000000019
      0000003A5046435F5352435F50415254595F534552544946494B415405000000
      0000000000000000070000003A50464B5F4944030000000000000000000000}
    Cursor = crSQLWait
    Left = 124
    Top = 440
  end
  object oqAddDoc: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '  insert into MED.TIMP_DOC  a (a.fc_src_doc_num, a.fc_src_doc_da' +
        'te, a.fc_src_postav,'
      
        '                               a.fc_src_kontrakt, a.fc_src_vid_o' +
        'plati, a.fc_src_schet_faktura, a.fc_src_comment,'
      
        '                               a.fc_src_summa_s_nds, a.fc_src_ko' +
        'lvo_pos, a.fc_imp_filename)'
      
        '                       values (:pfc_src_doc_num, :pfc_src_doc_da' +
        'te, :pfc_src_postav,'
      
        '                               :pfc_src_kontrakt, :pfc_src_vid_o' +
        'plati, :pfc_src_schet_faktura, :pfc_src_comment, '
      
        '                               :pfc_src_summa_s_nds, :pfc_src_ko' +
        'lvo_pos, :pfc_imp_filename)'
      '  returning a.fk_id into :pDocID;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      030000000B000000070000003A50444F43494403000000040000000300000000
      000000100000003A5046435F5352435F444F435F4E554D050000000000000000
      000000110000003A5046435F5352435F444F435F444154450500000000000000
      000000000F0000003A5046435F5352435F504F53544156050000000000000000
      000000130000003A5046435F5352435F5649445F4F504C415449050000000000
      000000000000140000003A5046435F5352435F53554D4D415F535F4E44530500
      00000000000000000000120000003A5046435F5352435F4B4F4C564F5F504F53
      050000000000000000000000110000003A5046435F494D505F46494C454E414D
      45050000000000000000000000160000003A5046435F5352435F53434845545F
      46414B54555241050000000000000000000000110000003A5046435F5352435F
      4B4F4E5452414B54050000000000000000000000100000003A5046435F535243
      5F434F4D4D454E54050000000000000000000000}
    Left = 114
    Top = 62
  end
  object oqSET_IMP_ITEM_STATUS: TOracleQuery
    SQL.Strings = (
      'begin'
      '  MED.pkg_timp_nakl.SET_IMP_ITEM_STATUS(:pFK_DOCITEM_ID);'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000010000000F0000003A50464B5F444F434954454D5F49440300000000
      00000000000000}
    Cursor = crSQLWait
    Left = 812
    Top = 324
  end
  object odsTLINK_IMPNAKL: TOracleDataSet
    SQL.Strings = (
      'SELECT a.fk_id, a.fn_our_table_num, a.fk_our_key_field_value,'
      
        '       a.fk_post_id, a.fn_their_table_num, a.fk_their_key_field_' +
        'value,'
      '       a.fc_their_value'
      'FROM med.tlink_impnakl a'
      'where (a.fc_their_value = :pfc_their_value) and'
      '      (a.fn_our_table_num = :pfn_our_table_num) and'
      '      (a.fk_post_id = :pfk_post_id or :pfk_post_id is null)'
      '')
    Optimize = False
    Variables.Data = {
      0300000003000000100000003A5046435F54484549525F56414C554505000000
      0000000000000000120000003A50464E5F4F55525F5441424C455F4E554D0300
      000000000000000000000C0000003A50464B5F504F53545F4944030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001100000005000000464B5F49440100000000000B00000046445F444F
      435F444154450100000000000E00000046435F5352435F444F435F4E554D0100
      000000000F00000046435F5352435F444F435F444154450100000000000D0000
      0046435F5352435F504F535441560100000000001100000046435F5352435F56
      49445F4F504C4154490100000000001400000046435F5352435F53434845545F
      46414B54554B410100000000001200000046435F5352435F53554D4D415F535F
      4E44530100000000001000000046435F5352435F4B4F4C564F5F504F53010000
      0000000B00000046445F494E535F444154450100000000000C00000046445F45
      4449545F4441544501000000000009000000464B5F494E535F4D4F0100000000
      000A000000464B5F454449545F4D4F0100000000000A000000464B5F504F5354
      5F49440100000000000E000000464E5F53554D4D415F535F4E44530100000000
      000C000000464E5F4B4F4C564F5F504F530100000000000F00000046435F494D
      505F46494C454E414D45010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    CommitOnPost = False
    Session = dmMain.os
    Left = 374
    Top = 68
  end
  object oqInsTLINK_IMPNAKL: TOracleQuery
    SQL.Strings = (
      'begin'
      '  delete from med.tlink_impnakl a'
      '        where (a.fc_their_value = :pfc_their_value) and'
      '              (a.fn_our_table_num = :pfn_our_table_num) and'
      
        '              ((a.fn_our_table_num = 1)or(a.fk_post_id = :pfk_po' +
        'st_id));'
      ''
      '  INSERT into med.tlink_impnakl'
      
        '             (fn_our_table_num, fk_our_key_field_value, fk_post_' +
        'id,'
      
        '              fn_their_table_num, fk_their_key_field_value, fc_t' +
        'heir_value)'
      
        '      VALUES (:pfn_our_table_num, :pfk_our_key_field_value, :pfk' +
        '_post_id,'
      
        '              :pfn_their_table_num, :pfk_their_key_field_value, ' +
        ':pfc_their_value);'
      '  commit;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000006000000100000003A5046435F54484549525F56414C554505000000
      0000000000000000120000003A50464E5F4F55525F5441424C455F4E554D0300
      000000000000000000000C0000003A50464B5F504F53545F4944030000000000
      000000000000180000003A50464B5F4F55525F4B45595F4649454C445F56414C
      5545030000000000000000000000140000003A50464E5F54484549525F544142
      4C455F4E554D0300000000000000000000001A0000003A50464B5F5448454952
      5F4B45595F4649454C445F56414C5545030000000000000000000000}
    Left = 376
    Top = 122
  end
  object odsTPostav: TOracleDataSet
    SQL.Strings = (
      
        'select p.postavid, p.fc_name from med.tpostav p where p.fc_name ' +
        '= :pfc_name')
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A5046435F4E414D450500000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000001100000005000000464B5F49440100000000000B00000046445F444F
      435F444154450100000000000E00000046435F5352435F444F435F4E554D0100
      000000000F00000046435F5352435F444F435F444154450100000000000D0000
      0046435F5352435F504F535441560100000000001100000046435F5352435F56
      49445F4F504C4154490100000000001400000046435F5352435F53434845545F
      46414B54554B410100000000001200000046435F5352435F53554D4D415F535F
      4E44530100000000001000000046435F5352435F4B4F4C564F5F504F53010000
      0000000B00000046445F494E535F444154450100000000000C00000046445F45
      4449545F4441544501000000000009000000464B5F494E535F4D4F0100000000
      000A000000464B5F454449545F4D4F0100000000000A000000464B5F504F5354
      5F49440100000000000E000000464E5F53554D4D415F535F4E44530100000000
      000C000000464E5F4B4F4C564F5F504F530100000000000F00000046435F494D
      505F46494C454E414D45010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    CommitOnPost = False
    Session = dmMain.os
    Left = 522
    Top = 70
  end
  object odsTMedic: TOracleDataSet
    SQL.Strings = (
      
        'select m.medicid, m.fc_name from med.tmedic m where m.fc_name = ' +
        ':pfc_name')
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A5046435F4E414D450500000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000001100000005000000464B5F49440100000000000B00000046445F444F
      435F444154450100000000000E00000046435F5352435F444F435F4E554D0100
      000000000F00000046435F5352435F444F435F444154450100000000000D0000
      0046435F5352435F504F535441560100000000001100000046435F5352435F56
      49445F4F504C4154490100000000001400000046435F5352435F53434845545F
      46414B54554B410100000000001200000046435F5352435F53554D4D415F535F
      4E44530100000000001000000046435F5352435F4B4F4C564F5F504F53010000
      0000000B00000046445F494E535F444154450100000000000C00000046445F45
      4449545F4441544501000000000009000000464B5F494E535F4D4F0100000000
      000A000000464B5F454449545F4D4F0100000000000A000000464B5F504F5354
      5F49440100000000000E000000464E5F53554D4D415F535F4E44530100000000
      000C000000464E5F4B4F4C564F5F504F530100000000000F00000046435F494D
      505F46494C454E414D45010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    CommitOnPost = False
    Session = dmMain.os
    Left = 522
    Top = 136
  end
  object oqUpdDoc: TOracleQuery
    SQL.Strings = (
      'begin'
      '  update MED.TIMP_DOC  a '
      '  set a.fd_doc_date = :pfd_doc_date,'
      '      a.fk_post_id = :pfk_post_id, '
      '      a.fn_summa_s_nds = :pfn_summa_s_nds,'
      '      a.fn_kolvo_pos = :pfn_kolvo_pos'
      '  where a.FK_ID = :pDocID;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000005000000070000003A50444F43494403000000040000000100000000
      0000000D0000003A5046445F444F435F444154450C0000000000000000000000
      0C0000003A50464B5F504F53545F494403000000000000000000000010000000
      3A50464E5F53554D4D415F535F4E44530400000000000000000000000E000000
      3A50464E5F4B4F4C564F5F504F53030000000000000000000000}
    Left = 208
    Top = 60
  end
  object oqUpdDocItem: TOracleQuery
    SQL.Strings = (
      'begin'
      '  update MED.TIMP_DOC_ITEMS  a '
      '  set  a.fk_prs_medic_id_our = :pfk_prs_medic_id_our,'
      '       a.fk_prs_medic_id_their = :pfk_prs_medic_id_their,'
      '       a.fk_prs_medic_ed_izm = :pfk_prs_medic_ed_izm,'
      '       a.fn_prs_medic_kolvo = :pfn_prs_medic_kolvo,'
      '       a.fd_prs_party_godnost = :pfd_prs_party_godnost,'
      '       a.fn_prs_party_price = :pfn_prs_party_price,'
      '       a.fn_prs_party_summ_nds = :pfn_prs_party_summ_nds,'
      '       a.fn_prs_nds = :pfn_prs_nds,'
      
        '       a.fk_prs_party_proizvoditel = :pfk_prs_party_proizvoditel' +
        ','
      '       a.fk_prs_party_sertifikat = :pfk_prs_party_sertifikat'
      '  where a.FK_ID = :pDocItemID;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      030000000B000000150000003A50464B5F5052535F4D454449435F49445F4F55
      52030000000000000000000000170000003A50464B5F5052535F4D454449435F
      49445F5448454952030000000000000000000000150000003A50464B5F505253
      5F4D454449435F45445F495A4D030000000000000000000000140000003A5046
      4E5F5052535F4D454449435F4B4F4C564F040000000000000000000000160000
      003A5046445F5052535F50415254595F474F444E4F53540C0000000000000000
      000000140000003A50464E5F5052535F50415254595F50524943450400000000
      00000000000000170000003A50464E5F5052535F50415254595F53554D4D5F4E
      44530400000000000000000000000C0000003A50464E5F5052535F4E44530400
      000000000000000000001B0000003A50464B5F5052535F50415254595F50524F
      495A564F444954454C030000000000000000000000190000003A50464B5F5052
      535F50415254595F534552544946494B41540300000000000000000000000B00
      00003A50444F434954454D4944030000000000000000000000}
    Cursor = crSQLWait
    Left = 222
    Top = 438
  end
  object odsTIMP_DOC_ITEMS2: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '       a.ROWID, a.fk_id, a.fk_imp_doc_id,'
      '      '
      '       a.fc_src_num, a.fc_src_medic_torg_name,'
      '       a.fc_src_medic_id_their, a.fc_src_medic_ed_izm,'
      '       a.fc_src_medic_kolvo, a.fc_src_party_seria,'
      '       a.fc_src_party_godnost, a.fc_src_party_price_bez_nds,'
      '       a.fc_src_party_summ_nds, a.fc_src_nds,'
      '       '
      '       a.fc_src_party_proizvoditel, a.fc_src_party_sertifikat,'
      '       a.fd_ins_date, a.fd_edit_date, a.fk_ins_mo, a.fk_edit_mo,'
      '       '
      '       a.fk_prs_medic_id_our, a.fk_prs_medic_id_their,'
      '       a.fk_prs_medic_ed_izm, a.fn_prs_medic_kolvo,'
      '       a.fd_prs_party_godnost, a.fn_prs_party_price,'
      '       a.fn_prs_party_summ_nds, a.fn_prs_nds,'
      '       a.fk_prs_party_proizvoditel, a.fk_prs_party_sertifikat,'
      '       '
      '       a.fk_imp_kartid, a.fk_imp_tdpc, a.fn_imp_status,'
      
        '       MED.PKG_TIMP_NAKL.DECODE_IMP_ITEM_STATUS(a.fn_imp_status)' +
        ' as FC_IMP_STATUS'
      ''
      '  FROM med.timp_doc_items a'
      'where '
      ' a.fk_imp_doc_id = :pfk_imp_doc_id'
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000F0000003A50464B5F494D505F444F435F49440300000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000002000000005000000464B5F49440100000000000D000000464B5F494D
      505F444F435F49440100000000000A00000046435F5352435F4E554D01000000
      00001600000046435F5352435F4D454449435F544F52475F4E414D4501000000
      00001500000046435F5352435F4D454449435F49445F54484549520100000000
      001300000046435F5352435F4D454449435F45445F495A4D0100000000001200
      000046435F5352435F4D454449435F4B4F4C564F010000000000120000004643
      5F5352435F50415254595F53455249410100000000001400000046435F535243
      5F50415254595F474F444E4F53540100000000001A00000046435F5352435F50
      415254595F50524943455F42455A5F4E44530100000000001500000046435F53
      52435F50415254595F53554D4D5F4E44530100000000000A00000046435F5352
      435F4E44530100000000001900000046435F5352435F50415254595F50524F49
      5A564F444954454C0100000000001700000046435F5352435F50415254595F53
      4552544946494B41540100000000000B00000046445F494E535F444154450100
      000000000C00000046445F454449545F4441544501000000000009000000464B
      5F494E535F4D4F0100000000000A000000464B5F454449545F4D4F0100000000
      0013000000464B5F5052535F4D454449435F49445F4F55520100000000001500
      0000464B5F5052535F4D454449435F49445F5448454952010000000000130000
      00464B5F5052535F4D454449435F45445F495A4D01000000000012000000464E
      5F5052535F4D454449435F4B4F4C564F0100000000001400000046445F505253
      5F50415254595F474F444E4F535401000000000012000000464E5F5052535F50
      415254595F505249434501000000000015000000464E5F5052535F5041525459
      5F53554D4D5F4E44530100000000000A000000464E5F5052535F4E4453010000
      00000019000000464B5F5052535F50415254595F50524F495A564F444954454C
      01000000000017000000464B5F5052535F50415254595F534552544946494B41
      540100000000000D000000464B5F494D505F4B41525449440100000000000B00
      0000464B5F494D505F544450430100000000000D000000464E5F494D505F5354
      415455530100000000000D00000046435F494D505F5354415455530100000000
      00}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = dmMain.os
    Left = 218
    Top = 276
  end
  object odsMedicsList: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  TMEDIC.MEDICID,       '
      '  TMEDIC.FC_NAME,'
      '  TEI.FC_NAME AS FC_UEDIZM,'
      '  TMEDIC.EIID'
      ''
      'FROM'
      '  MED.TMEDIC TMEDIC ,'
      '     '#9'MED.TEI'
      'WHERE  TMEDIC.EIID = TEI.EIID (+)'
      ' '#9'AND TMEDIC.FL_VISIBLE = 1'
      
        '    AND ( (instr(nvl(TMEDIC.fc_comment,'#39' '#39'),'#39#1044#1086#1073#1072#1074#1083#1077#1085#1086' '#1074#1088#1072#1095#1086#1084' ('#39 +
        ')=0) or (:MEDIC_FROM_VRACH = 1)) -- '#1089#1082#1088#1099#1074#1072#1077#1084' '#1087#1080#1089#1091#1083#1100#1082#1080' '#1082#1088#1080#1074#1086#1088#1091#1082#1080#1093 +
        ' '#1074#1088#1072#1095#1077#1081
      
        '    AND ((:PFK_SKLAD_ID = 0)or(:PFK_SKLAD_ID = TMEDIC.FK_SKLAD_I' +
        'D))'
      'ORDER BY UPPER(TMEDIC.FC_NAME)')
    ReadBuffer = 300
    Optimize = False
    Variables.Data = {
      0300000002000000110000003A4D454449435F46524F4D5F5652414348030000
      000400000000000000000000000D0000003A50464B5F534B4C41445F49440300
      0000040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000700000046435F4E414D45010000000000070000004D4544
      494349440100000000000900000046435F554544495A4D010000000000040000
      0045494944010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 422
    Top = 334
  end
  object dsMedicsList: TDataSource
    DataSet = odsMedicsList
    Left = 422
    Top = 386
  end
  object odsTEI: TOracleDataSet
    SQL.Strings = (
      
        'select ei.eiid, ei.fc_name from med.tei ei where ei.fc_name = :p' +
        'fc_name')
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A5046435F4E414D450500000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000001100000005000000464B5F49440100000000000B00000046445F444F
      435F444154450100000000000E00000046435F5352435F444F435F4E554D0100
      000000000F00000046435F5352435F444F435F444154450100000000000D0000
      0046435F5352435F504F535441560100000000001100000046435F5352435F56
      49445F4F504C4154490100000000001400000046435F5352435F53434845545F
      46414B54554B410100000000001200000046435F5352435F53554D4D415F535F
      4E44530100000000001000000046435F5352435F4B4F4C564F5F504F53010000
      0000000B00000046445F494E535F444154450100000000000C00000046445F45
      4449545F4441544501000000000009000000464B5F494E535F4D4F0100000000
      000A000000464B5F454449545F4D4F0100000000000A000000464B5F504F5354
      5F49440100000000000E000000464E5F53554D4D415F535F4E44530100000000
      000C000000464E5F4B4F4C564F5F504F530100000000000F00000046435F494D
      505F46494C454E414D45010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    CommitOnPost = False
    Session = dmMain.os
    Left = 612
    Top = 68
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'xml'
    Filter = '*.xml|*.xml'
    Options = [ofEnableSizing]
    Left = 32
    Top = 24
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'fmImportNakl\'
    StoredProps.Strings = (
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_IMP_STATUS.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_IMP_STATUS.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_ED_IZM.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_ED_IZM.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_ID_THEIR.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_ID_THEIR.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_KOLVO.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_KOLVO.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_TORG_NAME.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_TORG_NAME.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_NDS.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_NDS.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_NUM.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_NUM.Width'
      
        'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_PRICE_BEZ_NDS.Vis' +
        'ible'
      
        'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_PRICE_BEZ_NDS.Wid' +
        'th'
      
        'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_PROIZVODITEL.Visi' +
        'ble'
      
        'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_PROIZVODITEL.Widt' +
        'h'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_SERIA.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_SERIA.Width'
      
        'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_SERTIFIKAT.Visibl' +
        'e'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_SERTIFIKAT.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_SUMM_NDS.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_SUMM_NDS.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FD_EDIT_DATE.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FD_INS_DATE.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FD_INS_DATE.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FD_PRS_PARTY_GODNOST.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FD_PRS_PARTY_GODNOST.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_EDIT_MO.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_EDIT_MO.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_ID.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_ID.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_IMP_DOC_ID.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_IMP_DOC_ID.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_IMP_KARTID.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_IMP_KARTID.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_IMP_TDPC.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_IMP_TDPC.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_INS_MO.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_INS_MO.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ED_IZM.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ED_IZM.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ID_OUR.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ID_OUR.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ID_THEIR.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ID_THEIR.Width'
      
        'grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_PARTY_PROIZVODITEL.Visi' +
        'ble'
      
        'grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_PARTY_PROIZVODITEL.Widt' +
        'h'
      
        'grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_PARTY_SERTIFIKAT.Visibl' +
        'e'
      'grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_PARTY_SERTIFIKAT.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FN_PRS_MEDIC_KOLVO.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FN_PRS_MEDIC_KOLVO.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FN_PRS_NDS.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FN_PRS_NDS.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FN_PRS_PARTY_PRICE.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FN_PRS_PARTY_PRICE.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FN_PRS_PARTY_SUMM_NDS.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FN_PRS_PARTY_SUMM_NDS.Width'
      'grTIMP_DOCDBBandedTableView1FC_IMP_DOC_STATUS.Width'
      'grTIMP_DOCDBBandedTableView1FC_IMP_DOC_STATUS.Visible'
      'grTIMP_DOCDBBandedTableView1FC_IMP_FILENAME.Visible'
      'grTIMP_DOCDBBandedTableView1FC_IMP_FILENAME.Width'
      'grTIMP_DOCDBBandedTableView1FC_SRC_DOC_DATE.Visible'
      'grTIMP_DOCDBBandedTableView1FC_SRC_DOC_DATE.Width'
      'grTIMP_DOCDBBandedTableView1FC_SRC_DOC_NUM.Visible'
      'grTIMP_DOCDBBandedTableView1FC_SRC_DOC_NUM.Width'
      'grTIMP_DOCDBBandedTableView1FC_SRC_KOLVO_POS.Visible'
      'grTIMP_DOCDBBandedTableView1FC_SRC_KOLVO_POS.Width'
      'grTIMP_DOCDBBandedTableView1FC_SRC_POSTAV.Visible'
      'grTIMP_DOCDBBandedTableView1FC_SRC_POSTAV.Width'
      'grTIMP_DOCDBBandedTableView1FC_SRC_SCHET_FAKTURA.Visible'
      'grTIMP_DOCDBBandedTableView1FC_SRC_SCHET_FAKTURA.Width'
      'grTIMP_DOCDBBandedTableView1FC_SRC_VID_OPLATI.Visible'
      'grTIMP_DOCDBBandedTableView1FC_SRC_VID_OPLATI.Width'
      'grTIMP_DOCDBBandedTableView1FD_EDIT_DATE.Visible'
      'grTIMP_DOCDBBandedTableView1FD_EDIT_DATE.Width'
      'grTIMP_DOCDBBandedTableView1FD_INS_DATE.Visible'
      'grTIMP_DOCDBBandedTableView1FD_INS_DATE.Width'
      'grTIMP_DOCDBBandedTableView1FK_EDIT_MO.Visible'
      'grTIMP_DOCDBBandedTableView1FK_EDIT_MO.Width'
      'grTIMP_DOCDBBandedTableView1FK_ID.Visible'
      'grTIMP_DOCDBBandedTableView1FK_ID.Width'
      'grTIMP_DOCDBBandedTableView1FK_INS_MO.Visible'
      'grTIMP_DOCDBBandedTableView1FK_INS_MO.Width'
      'grTIMP_DOCDBBandedTableView1FK_POST_ID.Visible'
      'grTIMP_DOCDBBandedTableView1FK_POST_ID.Width'
      'grTIMP_DOCDBBandedTableView1FN_IMP_DOC_STATUS.Visible'
      'grTIMP_DOCDBBandedTableView1FN_IMP_DOC_STATUS.Width'
      'grTIMP_DOCDBBandedTableView1FN_KOLVO_POS.Visible'
      'grTIMP_DOCDBBandedTableView1FN_KOLVO_POS.Width'
      'grTIMP_DOCDBBandedTableView1FN_SUMMA_S_NDS.Visible'
      'grTIMP_DOCDBBandedTableView1FN_SUMMA_S_NDS.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_GODNOST.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_GODNOST.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FD_EDIT_DATE.Width'
      'grTIMP_DOC_ITEMSDBBandedTableView1FN_IMP_STATUS.Visible'
      'grTIMP_DOC_ITEMSDBBandedTableView1FN_IMP_STATUS.Width'
      'grTIMP_DOCDBBandedTableView1FC_SRC_SUMMA_S_NDS.Visible'
      'grTIMP_DOCDBBandedTableView1FC_SRC_SUMMA_S_NDS.Width'
      'grTIMP_DOCDBBandedTableView1FD_DOC_DATE.Visible'
      'grTIMP_DOCDBBandedTableView1FD_DOC_DATE.Width'
      'cmbImportSource.ItemIndex'
      'grTIMP_DOCDBBandedTableView1FC_SRC_COMMENT.Visible'
      'grTIMP_DOCDBBandedTableView1FC_SRC_COMMENT.Width'
      'grTIMP_DOCDBBandedTableView1fc_src_kontrakt.Visible'
      'grTIMP_DOCDBBandedTableView1fc_src_kontrakt.Width')
    StoredValues = <>
    Left = 426
    Top = 210
  end
  object odsTProdCert: TOracleDataSet
    SQL.Strings = (
      'select p.fk_id, p.fn_parent, p.fc_value, p.fk_sklad_id'
      
        ' from med.v$tprodcert p where (p.fc_value = :pfc_name) and ( ((:' +
        'pIsCert = 0)and(p.fn_parent = 0)) or ((:pIsCert = 1)and(p.fn_par' +
        'ent <> 0)) )')
    Optimize = False
    Variables.Data = {
      0300000002000000090000003A5046435F4E414D450500000000000000000000
      00080000003A5049534345525403000000040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001100000005000000464B5F49440100000000000B00000046445F444F
      435F444154450100000000000E00000046435F5352435F444F435F4E554D0100
      000000000F00000046435F5352435F444F435F444154450100000000000D0000
      0046435F5352435F504F535441560100000000001100000046435F5352435F56
      49445F4F504C4154490100000000001400000046435F5352435F53434845545F
      46414B54554B410100000000001200000046435F5352435F53554D4D415F535F
      4E44530100000000001000000046435F5352435F4B4F4C564F5F504F53010000
      0000000B00000046445F494E535F444154450100000000000C00000046445F45
      4449545F4441544501000000000009000000464B5F494E535F4D4F0100000000
      000A000000464B5F454449545F4D4F0100000000000A000000464B5F504F5354
      5F49440100000000000E000000464E5F53554D4D415F535F4E44530100000000
      000C000000464E5F4B4F4C564F5F504F530100000000000F00000046435F494D
      505F46494C454E414D45010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    CommitOnPost = False
    Session = dmMain.os
    Left = 524
    Top = 198
  end
  object odsTProdCert_list: TOracleDataSet
    SQL.Strings = (
      'select p.fk_id, p.fn_parent, p.fc_value, p.fk_sklad_id'
      ' from med.v$tprodcert p')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F494401000000000009000000464E5F5041
      52454E540100000000000800000046435F56414C55450100000000000B000000
      464B5F534B4C41445F4944010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    CommitOnPost = False
    Session = dmMain.os
    Left = 768
    Top = 360
  end
  object dsTProdCert_list: TDataSource
    DataSet = odsTProdCert_list
    Left = 770
    Top = 404
  end
  object OpenDialog2: TOpenDialog
    DefaultExt = 'xls'
    Filter = '*.xls|*.xls'
    Options = [ofEnableSizing]
    Left = 124
    Top = 24
  end
  object odsNaklByDogovor: TOracleDataSet
    SQL.Strings = (
      'select'
      '  dogovor.*,'
      
        '  nvl(dogovor.fk_dog_medicid, nakl.fk_nakl_medicid) as fk_medici' +
        'd,'
      
        '  decode(dogovor.fk_dog_medicid, null, nakl.fc_nakl_medic, dogov' +
        'or.fc_dog_medic) as fc_medic, '
      
        '  decode(dogovor.fk_dog_medicid, null, nakl.fc_nakl_ei, dogovor.' +
        'fc_dog_ei) as fc_ei, '
      
        '  decode(dogovor.fk_dog_medicid, null, nakl.fn_nakl_price, dogov' +
        'or.fn_dog_price) as fn_price,   '
      '  dogovor.fn_dog_kol, dogovor.fn_dog_price, dogovor.fn_dog_sum,'
      '  nakl.fn_nakl_price, nakl.fn_nakl_sum, nakl.fn_nakl_kol,'
      '  '
      '  (dogovor.fn_dog_kol - nakl.fn_nakl_kol) as fn_nedopost_kol,'
      '  (dogovor.fn_dog_sum - nakl.fn_nakl_sum) as fn_nedopost_sum'
      ''
      'from  '
      '('
      
        '  SELECT a.fk_ts_names_id as fk_dog_medicid, m.fc_name as fc_dog' +
        '_medic, a.fn_kol as fn_dog_kol, '
      
        '         nvl(ei.fc_name, ei.fc_fullname) as fc_dog_ei, a.fn_pric' +
        'e as fn_dog_price, a.fn_kol*a.fn_price as fn_dog_sum'
      
        '  FROM buh.tspis_prod a, buh.tspecname c, buh.tdog_post d, med.t' +
        'medic m, med.tei ei'
      '  where a.fk_specname_id = c.fk_id'
      '    and a.fk_ei = ei.eiid(+)'
      '    and c.fk_dog_id = d.fk_id'
      '    and d.fk_company = :pPostID'
      '    and a.fk_ts_names_id = m.medicid'
      '    and d.FC_NUM = :pFC_DOG_NUM'
      '    and d.FN_ACTIV = 0'
      '    and d.fk_type = 1'
      ') dogovor,'
      ''
      '('
      '  select '
      '    m.medicid as fk_nakl_medicid, m.fc_name as fc_nakl_medic,'
      '    sum(dp.fn_kol) as fn_nakl_kol, k.fn_price as fn_nakl_price,'
      
        '    sum(dp.fn_kol*k.fn_price) as fn_nakl_sum, ei.fc_name as fc_n' +
        'akl_ei'
      '  from '
      
        '    med.tdocs d, med.tdpc dp, med.tkart k, med.tmedic m, med.tei' +
        ' ei'
      '  where d.dpid = dp.dpid and'
      '        d.fp_vidmove = 1 and'
      '        dp.kartid = k.kartid and'
      '        k.medicid = m.medicid and'
      '        m.eiid = ei.eiid(+) and'
      '        d.postavid    = :pPostID and'
      '        d.fc_kontrakt = :pFC_DOG_NUM'
      '  group by m.medicid, m.fc_name, k.fn_price, ei.fc_name      '
      ') nakl        '
      ''
      'where '
      '  dogovor.fk_dog_medicid = nakl.fk_nakl_medicid(+)')
    Optimize = False
    Variables.Data = {
      0300000002000000080000003A50504F53544944030000000000000000000000
      0C0000003A5046435F444F475F4E554D050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001900000005000000464B5F49440100000000000B00000046445F444F
      435F444154450100000000000E00000046435F5352435F444F435F4E554D0100
      000000000F00000046435F5352435F444F435F444154450100000000000D0000
      0046435F5352435F504F535441560100000000001100000046435F5352435F56
      49445F4F504C4154490100000000001200000046435F5352435F53554D4D415F
      535F4E44530100000000001000000046435F5352435F4B4F4C564F5F504F5301
      00000000000B00000046445F494E535F444154450100000000000C0000004644
      5F454449545F4441544501000000000009000000464B5F494E535F4D4F010000
      0000000A000000464B5F454449545F4D4F0100000000000A000000464B5F504F
      53545F49440100000000000E000000464E5F53554D4D415F535F4E4453010000
      0000000C000000464E5F4B4F4C564F5F504F530100000000000F00000046435F
      494D505F46494C454E414D450100000000001400000046435F5352435F534348
      45545F46414B5455524101000000000011000000464E5F494D505F444F435F53
      54415455530100000000001100000046435F494D505F444F435F535441545553
      0100000000000F00000046435F5352435F4B4F4E5452414B540100000000000E
      00000046435F5352435F434F4D4D454E5401000000000010000000464C5F4348
      45434B5F444F474F564F520100000000000D000000464C5F49535F434845434B
      45440100000000000D000000464B5F4D4F5F434845434B45440100000000000F
      00000046445F434845434B45445F44415445010000000000}
    CommitOnPost = False
    Session = dmMain.os
    Left = 564
    Top = 12
  end
end
