object frmGetPeriod: TfrmGetPeriod
  Left = 337
  Top = 189
  HelpContext = 36
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1076#1083#1103' '#1087#1088#1086#1077#1082#1090#1072' "'#1052#1086#1085#1080#1090#1086#1088#1080#1085#1075' '#1094#1077#1085'"'
  ClientHeight = 499
  ClientWidth = 928
  Color = clBtnFace
  Constraints.MinHeight = 420
  Constraints.MinWidth = 570
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777777777777777777777777777777FF77
    7777777777777777777777777777000000000000000000000000000000770000
    0000000000000000000000000077000F0FFFFFFFFF00FFFFFFFFF0F0007700F0
    FFFFFFFFFF00FFFFFFFFFF0F007700F0FFFFFFFFFF00FFFFFFFFFF0F007700F0
    F0000000F0000F0000000F0F007700F0FFFFFFFFF0FF0FFFFFFFFF0F007700F0
    F0000000FF00FF0000000F0F007700F0FFFFFFFFFF00FFFFFFFFFF0F007700F0
    FFFFFFFFFF00FFFFFFFFFF0F007700F0FFF1111FFF00FFF11111FF0F007700F0
    FFF1111FFF00FFF11111FF0F007700F0FFFF11FFFF00FFF11FFFFF0F007700F0
    FFFF11FFFF00FFF111FFFF0F007700F0FFFF11FFFF00FFFF111FFF0F007700F0
    FFFF11FFFF00FFFFF111FF0F007700F0FFF111FFF0000FF11F11FF0F007700F0
    FFF111FFF0FF0FF11111FF0F007700F0FFFF11FFFF00FFFF111FFF0F007700F0
    FFFFFFFFFF00FFFFFFFFFF0F0077000F0FFFFFFFFF00FFFFFFFFF0F000770000
    00000000000000000000000000FF000000000000000000000000000000FFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 928
    Height = 48
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 44
        Width = 922
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 915
      Height = 44
      AutoSize = True
      ButtonHeight = 44
      ButtonWidth = 81
      Caption = 'ToolBar1'
      Images = ilImages
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object tbuExportToExcel: TToolButton
        Left = 0
        Top = 0
        Action = acExportToExcel
        AutoSize = True
        DropdownMenu = pmExportCSV
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
      end
      object ToolButton3: TToolButton
        Left = 78
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 86
        Top = 0
        Action = acAbsentMedicsToWord
        AutoSize = True
      end
      object ToolButton7: TToolButton
        Left = 165
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbtExec: TToolButton
        Left = 173
        Top = 0
        Action = acGetPrihByDate
        AutoSize = True
      end
      object ToolButton6: TToolButton
        Left = 229
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object gbOstByDate: TcxGroupBox
        Left = 237
        Top = 0
        Caption = ' '#1054#1089#1090#1072#1090#1082#1080' '#1085#1072' '
        TabOrder = 3
        Visible = False
        Height = 44
        Width = 87
        object deOstDate: TcxDateEdit
          Left = 3
          Top = 12
          EditValue = 0d
          Properties.DateButtons = [btnToday]
          Properties.ImmediatePost = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 0
          Width = 81
        end
      end
      object gbPrihDay: TcxGroupBox
        Left = 324
        Top = 0
        Caption = #1063#1080#1089#1083#1086
        TabOrder = 2
        Height = 44
        Width = 48
        object sedDay: TcxSpinEdit
          Left = 3
          Top = 12
          Hint = 
            #1069#1090#1080#1084' '#1095#1080#1089#1083#1086' '#1086#1073#1086#1079#1085#1072#1095#1072#1077#1090' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072', '#1085#1072#1087#1088#1080#1084#1077#1088': '#1077#1089#1083#1080' '#1074#1099' '#1091#1082#1072#1078#1077#1090#1077' ' +
            '15 '#1095#1080#1089#1083#1086', '#1072' '#1084#1077#1089#1103#1094' - '#1103#1085#1074#1072#1088#1100', '#1090#1086' '#1076#1072#1085#1085#1099#1077' '#1089#1086#1073#1077#1088#1091#1090#1089#1103' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1089' 15 '#1103 +
            #1085#1074#1072#1088#1103' '#1087#1086' 14 '#1092#1077#1074#1088#1072#1083#1103'.'
          Properties.ImmediatePost = True
          Properties.MaxValue = 28.000000000000000000
          Properties.MinValue = 1.000000000000000000
          Properties.OnChange = cbMonthPropertiesChange
          TabOrder = 0
          Value = 1
          Width = 41
        end
      end
      object gbPrihMonthYear: TcxGroupBox
        Left = 372
        Top = 0
        Caption = ' '#1055#1088#1080#1093#1086#1076#1099' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '
        TabOrder = 0
        Height = 44
        Width = 139
        object cbMonth: TcxComboBox
          Left = 3
          Top = 12
          Properties.ImmediatePost = True
          Properties.Items.Strings = (
            #1103#1085#1074#1072#1088#1100
            #1092#1077#1074#1088#1072#1083#1100
            #1084#1072#1088#1090
            #1072#1087#1088#1077#1083#1100
            #1084#1072#1081
            #1080#1102#1085#1100
            #1080#1102#1083#1100
            #1072#1074#1075#1091#1089#1090
            #1089#1077#1085#1090#1103#1073#1088#1100
            #1086#1082#1090#1103#1073#1088#1100
            #1085#1086#1103#1073#1088#1100
            #1076#1077#1082#1072#1073#1088#1100)
          Properties.OnChange = cbMonthPropertiesChange
          TabOrder = 0
          Text = #1089#1077#1085#1090#1103#1073#1088#1100
          Width = 78
        end
        object sedYear: TcxSpinEdit
          Left = 85
          Top = 12
          Properties.ImmediatePost = True
          Properties.MaxValue = 2100.000000000000000000
          Properties.MinValue = 2000.000000000000000000
          Properties.OnChange = cbMonthPropertiesChange
          TabOrder = 1
          Value = 2011
          Width = 50
        end
      end
      object cxGroupBox2: TcxGroupBox
        Left = 511
        Top = 0
        Caption = ' '#1043#1088#1091#1087#1087#1072' '#1052#1054' '
        TabOrder = 1
        Height = 44
        Width = 288
        object lcbMO_GROUP: TcxLookupComboBox
          Left = 3
          Top = 12
          Properties.KeyFieldNames = 'GROUPID'
          Properties.ListColumns = <
            item
              Caption = #1043#1088#1091#1087#1087#1072' '#1052#1054
              FieldName = 'FC_GROUP'
            end>
          Properties.ListSource = dsGroupMo
          Properties.OnChange = lcbMO_GROUPPropertiesChange
          TabOrder = 0
          Width = 282
        end
      end
      object ToolButton4: TToolButton
        Left = 799
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 807
        Top = 0
        Action = acExit
        AutoSize = True
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 48
    Align = alTop
    Caption = ' '#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1099' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091' "'#1052#1086#1085#1080#1090#1086#1088#1080#1085#1075' '#1094#1077#1085'" '
    TabOrder = 1
    Height = 193
    Width = 928
    object grBase: TcxGrid
      Left = 2
      Top = 18
      Width = 924
      Height = 173
      Align = alClient
      TabOrder = 0
      object grBaseDBTableView: TcxGridDBTableView
        PopupMenu = pmExportTableBase
        NavigatorButtons.ConfirmDelete = False
        OnCanFocusRecord = grBaseDBTableViewCanFocusRecord
        OnCanSelectRecord = grBaseDBTableViewCanSelectRecord
        OnFocusedRecordChanged = grBaseDBTableViewFocusedRecordChanged
        DataController.DataSource = dsPriceMonitorBASE
        DataController.KeyFieldNames = 'FK_ID'
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = #1050#1086#1083'-'#1074#1086': ### ### ##0'
            Kind = skCount
            FieldName = 'FC_NAME'
          end
          item
            Format = #1050#1086#1083'-'#1074#1086': ### ### ###'
            Kind = skCount
            Column = grBaseDBTableView_tradenmr
          end
          item
            Format = #1042#1089#1077#1075#1086': 0'
            Kind = skSum
            Column = grBaseDBTableView_OST_COUNT
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object grBaseDBTableView_DrugId: TcxGridDBColumn
          DataBinding.FieldName = 'DrugId'
          Options.Editing = False
          Width = 28
        end
        object grBaseDBTableView_PACKNX: TcxGridDBColumn
          DataBinding.FieldName = 'PACKNX'
          Width = 40
        end
        object grBaseDBTableView_tradenmr: TcxGridDBColumn
          Caption = #1058#1086#1088#1075#1086#1074#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'tradenmr'
          SortIndex = 0
          SortOrder = soAscending
          Width = 106
        end
        object grBaseDBTableView_innr: TcxGridDBColumn
          Caption = #1052#1053#1053
          DataBinding.FieldName = 'innr'
          Width = 93
        end
        object grBaseDBTableView_mnfnm: TcxGridDBColumn
          Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100' ('#1089#1090#1088#1072#1085#1072')'
          DataBinding.FieldName = 'mnfnm'
          PropertiesClassName = 'TcxMemoProperties'
          Width = 72
        end
        object grBaseDBTableView_PCKNM: TcxGridDBColumn
          Caption = #1059#1087#1072#1082#1086#1074#1097#1080#1082
          DataBinding.FieldName = 'PCKNM'
          Width = 63
        end
        object grBaseDBTableView_DrugFmNmRS: TcxGridDBColumn
          Caption = #1051#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1072#1103' '#1092#1086#1088#1084#1072', '#1076#1086#1079#1072
          DataBinding.FieldName = 'DrugFmNmRS'
          PropertiesClassName = 'TcxMemoProperties'
          Width = 57
        end
        object grBaseDBTableView_Pack: TcxGridDBColumn
          Caption = #1059#1087#1072#1082#1086#1074#1082#1072
          DataBinding.FieldName = 'Pack'
          PropertiesClassName = 'TcxMemoProperties'
          Width = 59
        end
        object grBaseDBTableView_TotDrugQn: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086' '#1074' '#1091#1087#1072#1082#1086#1074#1082#1077
          DataBinding.FieldName = 'TotDrugQn'
          Width = 34
        end
        object grBaseDBTableView_DosageR: TcxGridDBColumn
          Caption = #1044#1086#1079#1080#1088#1086#1074#1082#1072' '#1092#1072#1089'. '#1077#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'DosageR'
          Width = 56
        end
        object grBaseDBTableView_MaxMnfPrice: TcxGridDBColumn
          Caption = #1052#1072#1082#1089'. '#1094#1077#1085#1072
          DataBinding.FieldName = 'MaxMnfPrice'
          Visible = False
          Width = 65
        end
        object grBaseDBTableView_CurrencyNm: TcxGridDBColumn
          Caption = #1042#1072#1083#1102#1090#1072
          DataBinding.FieldName = 'CurrencyNm'
          Visible = False
          Width = 60
        end
        object grBaseDBTableView_MnfID: TcxGridDBColumn
          Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103' (MnfID)'
          DataBinding.FieldName = 'MnfID'
          Visible = False
          Width = 60
        end
        object grBaseDBTableView_PckID: TcxGridDBColumn
          Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1091#1087#1072#1082#1086#1074#1097#1080#1082#1072' (PckID)'
          DataBinding.FieldName = 'PckID'
          Visible = False
          Width = 60
        end
        object grBaseDBTableView_Ean: TcxGridDBColumn
          Caption = #1064#1088#1080#1093'-'#1082#1086#1076
          DataBinding.FieldName = 'Ean'
          Visible = False
          Width = 70
        end
        object grBaseDBTableView_OST_COUNT: TcxGridDBColumn
          Caption = #1055#1088#1080#1074#1103#1079#1072#1085#1085#1099#1077' '#1086#1089#1090#1072#1090#1082#1080
          DataBinding.FieldName = 'OST_COUNT'
          Width = 42
        end
        object grBaseDBTableView_SEGMENT: TcxGridDBColumn
          Caption = #1057#1077#1075#1084#1077#1085#1090
          DataBinding.FieldName = 'SEGMENT'
          Visible = False
          Width = 84
        end
        object grBaseDBTableViewFK_ID: TcxGridDBColumn
          DataBinding.FieldName = 'FK_ID'
          Visible = False
          Width = 60
        end
      end
      object grBaseDBTableViewOst: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        OnCanFocusRecord = grBaseDBTableViewOstCanFocusRecord
        OnCanSelectRecord = grBaseDBTableViewOstCanSelectRecord
        OnFocusedRecordChanged = grBaseDBTableViewOstFocusedRecordChanged
        DataController.DataSource = dsPriceMonitorOST
        DataController.DetailKeyFieldNames = 'FK_TPRICE_MONITOR_BASE_ID'
        DataController.KeyFieldNames = 'FK_ID'
        DataController.MasterKeyFieldNames = 'FK_ID'
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = #1050#1086#1083'-'#1074#1086': ### ###'
            Kind = skCount
            Column = grBaseDBTableViewOstFC_MEDIC
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.ImmediateEditor = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.InvertSelect = False
        OptionsView.FocusRect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object grBaseDBTableViewOstPACKNX: TcxGridDBColumn
          DataBinding.FieldName = 'PACKNX'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.ImmediatePost = True
          Visible = False
          Width = 56
        end
        object grBaseDBTableViewOstFC_MEDIC: TcxGridDBColumn
          Caption = #1052#1077#1076#1080#1082#1072#1084#1077#1085#1090
          DataBinding.FieldName = 'FC_MEDIC'
          Options.Editing = False
          SortIndex = 0
          SortOrder = soAscending
          Width = 150
        end
        object grBaseDBTableViewOstYEAR: TcxGridDBColumn
          Caption = #1043#1086#1076
          DataBinding.FieldName = 'YEAR'
          Visible = False
          Options.Editing = False
          Width = 48
        end
        object grBaseDBTableViewOstMONTH: TcxGridDBColumn
          Caption = #1052#1077#1089#1103#1094
          DataBinding.FieldName = 'MONTH'
          Visible = False
          Options.Editing = False
          Width = 48
        end
        object grBaseDBTableViewOstIRECID: TcxGridDBColumn
          DataBinding.FieldName = 'IRECID'
          Visible = False
          Options.Editing = False
          Width = 68
        end
        object grBaseDBTableViewOstSERIES: TcxGridDBColumn
          Caption = #1057#1077#1088#1080#1080
          DataBinding.FieldName = 'SERIES'
          Width = 120
        end
        object grBaseDBTableViewOstQUANTITY: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086
          DataBinding.FieldName = 'QUANTITY'
          Width = 65
        end
        object grBaseDBTableViewOstFUNDS: TcxGridDBColumn
          Caption = #1057#1088#1077#1076#1089#1090#1074#1072' '#1076#1083#1103' '#1079#1072#1082#1091#1087#1082#1080', '#1088
          DataBinding.FieldName = 'FUNDS'
          Width = 108
        end
        object grBaseDBTableViewOstVENDOR: TcxGridDBColumn
          Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
          DataBinding.FieldName = 'VENDOR'
          Width = 137
        end
        object grBaseDBTableViewOstPRCPRICE: TcxGridDBColumn
          Caption = #1047#1072#1082#1091#1087#1086#1095#1085#1072#1103' '#1094#1077#1085#1072' '#1079#1072' '#1091#1087'., '#1088
          DataBinding.FieldName = 'PRCPRICE'
          Visible = False
          Width = 39
        end
        object grBaseDBTableViewOstPROIZVODITEL: TcxGridDBColumn
          Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
          DataBinding.FieldName = 'PROIZVODITEL'
          Width = 50
        end
        object grBaseDBTableViewOstRTLPRICE: TcxGridDBColumn
          Caption = #1056#1086#1079#1085#1080#1095#1085#1072#1103' '#1094#1077#1085#1072' '#1079#1072' '#1091#1087'., '#1088
          DataBinding.FieldName = 'RTLPRICE'
          Visible = False
          Width = 40
        end
        object grBaseDBTableViewOstRTLPREMIUM: TcxGridDBColumn
          Caption = #1053#1072#1076#1073#1072#1074#1082#1072' '#1082' '#1094#1077#1085#1077' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103', %'
          DataBinding.FieldName = 'RTLPREMIUM'
          Visible = False
          Width = 20
        end
        object grBaseDBTableViewOstREMARK: TcxGridDBColumn
          Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
          DataBinding.FieldName = 'REMARK'
          Width = 50
        end
        object grBaseDBTableViewOstSRCORG: TcxGridDBColumn
          Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103', '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1080#1074#1096#1072#1103' '#1089#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1094#1077#1085#1077
          DataBinding.FieldName = 'SRCORG'
          Visible = False
          Width = 44
        end
        object grBaseDBTableViewOstIPV: TcxGridDBColumn
          Caption = #1055#1088#1086#1090#1086#1082#1086#1083
          DataBinding.FieldName = 'IPV'
          Visible = False
          Width = 20
        end
        object grBaseDBTableViewOstFK_MEDICID: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
          DataBinding.FieldName = 'FK_MEDICID'
          Visible = False
          Options.Editing = False
          Width = 20
        end
        object grBaseDBTableViewOstFK_KARTID: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1087#1072#1088#1090#1080#1080
          DataBinding.FieldName = 'FK_KARTID'
          Visible = False
          Options.Editing = False
          Width = 20
        end
        object grBaseDBTableViewOstFD_DATE: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1089#1090#1072#1090#1082#1086#1074
          DataBinding.FieldName = 'FD_DATE'
          PropertiesClassName = 'TcxDateEditProperties'
          Visible = False
          Options.Editing = False
          Width = 20
        end
        object grBaseDBTableViewOstFK_MOGROUP: TcxGridDBColumn
          Caption = #1043#1088#1091#1087#1087#1072' '#1052#1054
          DataBinding.FieldName = 'FK_MOGROUP'
          Visible = False
          Options.Editing = False
          Width = 36
        end
        object grBaseDBTableViewOstFK_ID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'FK_ID'
          Visible = False
          Options.Editing = False
        end
        object grBaseDBTableViewOstFK_TPRICE_MONITOR_BASE_ID: TcxGridDBColumn
          Caption = 'FK_BASE_ID'
          DataBinding.FieldName = 'FK_TPRICE_MONITOR_BASE_ID'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.ImmediatePost = True
          Visible = False
        end
      end
      object grBaseExportDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = grBaseDBTableViewOstFocusedRecordChanged
        DataController.DataSource = dsExport
        DataController.KeyFieldNames = 'PACKNX'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.ImmediateEditor = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
      end
      object grBaseLevel1: TcxGridLevel
        GridView = grBaseDBTableView
        object grBaseLevel2: TcxGridLevel
          GridView = grBaseDBTableViewOst
        end
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 241
    Width = 928
    Height = 14
    AlignSplitter = salTop
    Control = cxGroupBox3
  end
  object cxGroupBox4: TcxGroupBox
    Left = 0
    Top = 296
    Align = alClient
    Caption = ' '#1054#1089#1090#1072#1090#1082#1080' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1087#1077#1088#1080#1086#1076#1072'  '
    TabOrder = 3
    Height = 203
    Width = 928
    object grOST: TcxGrid
      Left = 2
      Top = 18
      Width = 924
      Height = 183
      Align = alClient
      TabOrder = 0
      object grOSTDBTableView1: TcxGridDBTableView
        PopupMenu = pmExportTableOst
        NavigatorButtons.ConfirmDelete = False
        OnCustomDrawCell = grOSTDBTableView1CustomDrawCell
        DataController.DataSource = dsPriceMonitorOST
        DataController.KeyFieldNames = 'FK_ID'
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = #1050#1086#1083'-'#1074#1086': ### ### ##0'
            Kind = skCount
            FieldName = 'FC_NAME'
          end
          item
            Format = #1050#1086#1083'-'#1074#1086': ### ### ###'
            Kind = skCount
            Column = grOSTDBTableView1FC_MEDIC
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        object grOSTDBTableView1PACKNX: TcxGridDBColumn
          DataBinding.FieldName = 'PACKNX'
          Visible = False
          Options.Editing = False
          Width = 41
        end
        object grOSTDBTableView1FC_MEDIC: TcxGridDBColumn
          Caption = #1052#1077#1076#1080#1082#1072#1084#1077#1085#1090
          DataBinding.FieldName = 'FC_MEDIC'
          Options.Editing = False
          Width = 151
        end
        object grOSTDBTableView1YEAR: TcxGridDBColumn
          Caption = #1043#1086#1076
          DataBinding.FieldName = 'YEAR'
          Visible = False
          Options.Editing = False
          Width = 48
        end
        object grOSTDBTableView1MONTH: TcxGridDBColumn
          Caption = #1052#1077#1089#1103#1094
          DataBinding.FieldName = 'MONTH'
          Visible = False
          Options.Editing = False
          Width = 48
        end
        object grOSTDBTableView1IRECID: TcxGridDBColumn
          DataBinding.FieldName = 'IRECID'
          Visible = False
          Width = 68
        end
        object grOSTDBTableView1SERIES: TcxGridDBColumn
          Caption = #1057#1077#1088#1080#1080
          DataBinding.FieldName = 'SERIES'
          Width = 73
        end
        object grOSTDBTableView1QUANTITY: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086
          DataBinding.FieldName = 'QUANTITY'
          Width = 40
        end
        object grOSTDBTableView1_FC_UP_EI: TcxGridDBColumn
          Caption = #1059#1087'. '#1077#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'FC_UP_EI'
          Options.Editing = False
          Width = 49
        end
        object grOSTDBTableView1_FN_FAS: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086' '#1092#1072#1089#1086#1074#1086#1082' '#1074' '#1091#1087#1072#1082#1086#1074#1082#1077
          DataBinding.FieldName = 'FN_FAS'
          Visible = False
          Options.Editing = False
          Width = 50
        end
        object grOSTDBTableView1_FC_FAS_EI: TcxGridDBColumn
          Caption = #1060#1072#1089'. '#1077#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'FC_FAS_EI'
          Visible = False
          Options.Editing = False
          Width = 60
        end
        object grOSTDBTableView1FUNDS: TcxGridDBColumn
          Caption = #1057#1088#1077#1076#1089#1090#1074#1072' '#1076#1083#1103' '#1079#1072#1082#1091#1087#1082#1080', '#1088
          DataBinding.FieldName = 'FUNDS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          Width = 66
        end
        object grOSTDBTableView1VENDOR: TcxGridDBColumn
          Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
          DataBinding.FieldName = 'VENDOR'
          Width = 82
        end
        object grOSTDBTableView1VendorID: TcxGridDBColumn
          DataBinding.FieldName = 'VendorID'
          Width = 50
        end
        object grOSTDBTableView1MNF_PRICE: TcxGridDBColumn
          Caption = #1062#1077#1085#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103', '#1088'.'
          DataBinding.FieldName = 'FN_MNF_PRICE'
          Visible = False
        end
        object grOSTDBTableView1PRCPRICE: TcxGridDBColumn
          Caption = #1047#1072#1082#1091#1087#1086#1095#1085#1072#1103' '#1094#1077#1085#1072' '#1079#1072' '#1091#1087'., '#1088
          DataBinding.FieldName = 'PRCPRICE'
          Visible = False
          Width = 39
        end
        object grOSTDBTableView1RTLPRICE: TcxGridDBColumn
          Caption = #1056#1086#1079#1085#1080#1095#1085#1072#1103' '#1094#1077#1085#1072' '#1079#1072' '#1091#1087'., '#1088
          DataBinding.FieldName = 'RTLPRICE'
          Visible = False
          Width = 40
        end
        object grOSTDBTableView1RTLPREMIUM: TcxGridDBColumn
          Caption = #1053#1072#1076#1073#1072#1074#1082#1072' '#1082' '#1094#1077#1085#1077' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103', %'
          DataBinding.FieldName = 'RTLPREMIUM'
          Visible = False
          Width = 20
        end
        object grOSTDBTableView1PROIZVODITEL: TcxGridDBColumn
          Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
          DataBinding.FieldName = 'PROIZVODITEL'
          Width = 54
        end
        object grOSTDBTableView1REMARK: TcxGridDBColumn
          Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
          DataBinding.FieldName = 'REMARK'
          Width = 48
        end
        object grOSTDBTableView1SRCORG: TcxGridDBColumn
          Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103', '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1080#1074#1096#1072#1103' '#1089#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1094#1077#1085#1077
          DataBinding.FieldName = 'SRCORG'
          Visible = False
          Width = 44
        end
        object grOSTDBTableView1IPV: TcxGridDBColumn
          Caption = #1055#1088#1086#1090#1086#1082#1086#1083
          DataBinding.FieldName = 'IPV'
          Visible = False
          Options.Editing = False
          Width = 20
        end
        object grOSTDBTableView1FK_MEDICID: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
          DataBinding.FieldName = 'FK_MEDICID'
          Visible = False
          Options.Editing = False
          Width = 20
        end
        object grOSTDBTableView1FK_KARTID: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1087#1072#1088#1090#1080#1080
          DataBinding.FieldName = 'FK_KARTID'
          Visible = False
          Options.Editing = False
          Width = 20
        end
        object grOSTDBTableView1FD_DATE: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1089#1090#1072#1090#1082#1086#1074
          DataBinding.FieldName = 'FD_DATE'
          PropertiesClassName = 'TcxDateEditProperties'
          Visible = False
          Options.Editing = False
          Width = 20
        end
        object grOSTDBTableView1FK_MOGROUP: TcxGridDBColumn
          Caption = #1043#1088#1091#1087#1087#1072' '#1052#1054
          DataBinding.FieldName = 'FK_MOGROUP'
          Visible = False
          Options.Editing = False
          Width = 36
        end
        object grOSTDBTableView1FK_ID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'FK_ID'
          Visible = False
          Options.Editing = False
          Width = 60
        end
        object grOSTDBTableView1FK_TPRICE_MONITOR_BASE_ID: TcxGridDBColumn
          Caption = 'FK_BASE_ID'
          DataBinding.FieldName = 'FK_TPRICE_MONITOR_BASE_ID'
          Visible = False
          Width = 60
        end
        object grOSTDBTableView1FD_GODEN: TcxGridDBColumn
          Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
          DataBinding.FieldName = 'fd_goden'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DateButtons = []
          Properties.ReadOnly = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          Visible = False
          Options.Editing = False
          Width = 54
        end
        object grOSTDBTableView1fl_jnvls: TcxGridDBColumn
          Caption = #1046#1053#1042#1051#1055
          DataBinding.FieldName = 'fl_jnvls'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ReadOnly = True
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Width = 20
        end
      end
      object grOSTLevel1: TcxGridLevel
        GridView = grOSTDBTableView1
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 255
    Width = 928
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object buCheckOst: TcxButton
      Left = 9
      Top = 6
      Width = 128
      Height = 29
      Hint = 
        #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1086#1089#1090#1072#1090#1082#1080' '#1082' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072#1084' '#1087#1088#1086#1077#1082#1090#1072' "'#1052#1086#1085#1080#1090#1086#1088#1080#1085#1075' ' +
        #1094#1077#1085'"'
      Action = acCheckOst
      TabOrder = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00013002000141030002510400025104000143
        030001330200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00014503000145030003780800039C0B00039F0C00039F0C00039D
        0C00027E0900014D0400014D0400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00034F09000365090004A30D0003A60C0003A00B00029E0A00039F0C0003A0
        0C0003A50C0003A60C000269060001340200FF00FF00FF00FF00FF00FF00044F
        0900066B11000AAB1F0007A41500049E0D00029D0A00B1E6B600FFFFFF0036B8
        4100039E0C0003A00C0003A70C00026A0600024C0400FF00FF00FF00FF00044F
        090010AC30000DAB280009A41C00039E0F00039E0C00AFE5B400FFFFFF0037BA
        4200039E0C00039E0C00039F0C0003A70C00024C0400FF00FF00035706000D82
        230017B641000EA92D0005A01300049F0D00039E0C00ADE5B200FFFFFF0036B8
        4100039E0C00039E0C00039E0C0003A50C00037B0800014203000357060017A3
        410018B54A0011AB340019AB270007A01100049F0D00AFE5B200FFFFFF0036B8
        4100039E0C0017AA22000AA3140003A10C0003960A000142030006680D0021B1
        51001EB7510020B54F00DCF4E2008FDCA10017AF3900B5E9C200FFFFFF0029B2
        340035B84000F2FBF30098DD9E0003A00C00039F0C00014A0400087412003EBD
        69002ABA5C0021B55300EDFAF200FFFFFF008CDDAB00BCEBCF00FFFFFF006BCE
        7500DCF4DE00FFFFFF007FD4870003A00C00039F0C000252050006780E0054C5
        7A0044C674001CB24E0066CF8C00F7FCF800FCFFFE00F7FCFA00FCFEFE00FAFE
        FA00FFFFFF007DD48E000EA6260007A51800039D0C000146030006780E004CBD
        690083DDA70022B655001CB24E005FCC8700F6FCF800FFFFFF00FFFFFF00FFFF
        FF0088D99D0010AB2F000CA6270006A71600038C0A0001460300FF00FF0021A3
        3600AAE7C50068D08E0016AF48001BB14C005DCC8600F2FBF600FFFFFF009DE1
        B20011AA32000EA729000BA4200009AF1C00036B0A00FF00FF00FF00FF0021A3
        360056C57300C5F0D80066CF8C0020B4520019B14C0070D39500BAEACC0026B7
        540013AC3C0012AA34000FB02D000A991F00036B0A00FF00FF00FF00FF00FF00
        FF00139923006ACC8800D0F4E3009AE1B60050C77A0038BD67002CBA5D0030BB
        60002FBC5D0023BC4F0011A3300006620F00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF004BBF67004BBF670098E1B500BDEED400A7E7C40090E0B10078D9
        9F0049C779001B9D3D001B9D3D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF001DA4350038B4540046BC660042B863002BA6
        4900138C2A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object buBackOst: TcxButton
      Left = 166
      Top = 3
      Width = 128
      Height = 29
      Action = acBackOst
      TabOrder = 1
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0033140000451B00005722000057220000471C
        000036160000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00491C0000491C000080320000A5410000AA420000AA420000A741
        000084340000511F0000511F0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00592300006E2B0000AF440000B1450000AA420000A5410000AA420000AA42
        0000AF440000B1450000702C000036160000FF00FF00FF00FF00FF00FF005923
        00007B300000C54D0000B8480000AA420000A5410000CA884F00E6C6A700AF50
        0B00A7410000AA420000B1450000702C0000511F0000FF00FF00FF00FF005923
        0000D4530000CC500000BB490000AA420000C2773800FAF4EE00FFFFFF00DEB4
        8C00A9420000A7410000AA420000B1450000511F0000FF00FF005F250000A03F
        0000EB5C0000CC500000B1450000C67A3A00FCF7F300FFFFFF00FFFFFF00FFFF
        FF00D9A67900A9420000A7410000AF44000084340000451B00005F250000D754
        0000EB5C0000D4530000CC824200FCF8F400FEFEFC00FCFAF600FEFEFC00FEFB
        F800FFFFFF00D5A07000A9440100AC4300009E3E0000451B0000772E0000F660
        0000F8620000F8620000FEF2E700FFFFFF00F2AD6F00F7CFAA00FFFFFF00D198
        6600F4E7DA00FFFFFF00D9A77A00AA420000AA4200004F1F000089350000FF78
        1300FF6A0400FB630000FFEAD400FFBB7E00FF640000FFD1A600FFFFFF00BF6A
        2500C0723000FBF7F200E1BA9500AC430000AA4200005722000089350000FF88
        2900FF801E00F05E0000FB741000FB670300FB630000FCD3AB00FFFFFF00D77D
        3100C54D0000CA601100C6540500B8480000A54100004B1D000089350000FF80
        1E00FFAD6700FF640000EE5D0000FB630000FB630000FED3AB00FFFFFF00E180
        3100CF510000CF510000C54D0000BB490000953A00004B1D0000FF00FF00E65A
        0000FFC69300FF984200E1580000EB5C0000FB630000FED4AC00FFFFFF00E783
        3200CF510000CA4F0000C04B0000C74E0000752D0000FF00FF00FF00FF00E65A
        0000FF892B00FFDAB700FF974100F8620000E95B0000FED5AF00FFFFFF00EB84
        3100D9550000D4530000D7540000B4460000752D0000FF00FF00FF00FF00FF00
        FF00C54D0000FF984200FFE2C600FFBB7F00FF872800FF750F00FF6B0500FF6E
        0800FF6E0800FF670100CA4F0000702C0000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF801E00FF801E00FFBA7D00FFD5AD00FFC59100FFB57400FFA5
        5800FF832300D7540000D7540000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00E1580000FF700A00FF7D1900FF781300FB63
        0000B6470000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Layout = blGlyphRight
    end
  end
  object ilImages: TImageList
    Left = 254
    Top = 112
    Bitmap = {
      494C0101060024005C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000081000000000000008100000000000000810000000000
      0000810000000000000081000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000095655F00A5696A00A5696A00A569
      6A00A5696A0081000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00810000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099451700994517009945
      1700994517009945170099451700994517009945170099451700994517009945
      17009945170099451700994517000000000098686000FBE5C000F4D5AD00F0CF
      9F00EFCA960000000000FFFFFF00EDCFCF007204040075040400FFFFFF007F3B
      3B0073020200C19C9C00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CF892300FFC47D00E3A45C00DC99
      4C00FFAB4500ED993500D1842700FB951D00FF931100FA880900FA820100FA80
      0000FA800000FB810000FF880000994517009D6B6200FCE7C900F2D5B500F0D0
      A900EECB9E0081000000FFFFFF00E7CECE00690101006C010100FFFFFF00893B
      3B0069000000C7999900FFFFFF00810000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0970E00E9AF7A003E352C003931
      2900C68641006C4F2D002B272300A7692200C9771B00362B1C003A2D1B00382B
      1C003B2C180047311600F37F000099451700A36F6400FEEED400F4DDC000F2D7
      B500F0D1AA0000000000FFFFFF00E5CECE006802020049000000BB999900C518
      18005C000000CF999900FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0970E00FFC28900BB8B5B00AF7F
      4D00FAAB5200CA883E00A66E2E00E78F2800E28A2A009A653C00B56B2200D774
      0700A35E2100A6602100FE86000099451700A7746600FFF4E100F6E1CA00F3DC
      BF00F2D7B40081000000FFFFFF00E9D9D90059000000D9575700810000006D52
      520058000000D7A4A400FFFFFF00810000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0970E00E7B18100453B33004137
      2E00C58B4D0072553500352D2500A16A28007F6379001A2AD40052498A00BB70
      2F001C2EC6002030BD00E57A0A0099451700AD786900FFFBEE00F7E7D500F4E1
      CA00F3DCBF0000000000FFFFFF00F28989006C000000C69D9D005F000000D39D
      9D0077020200795E5E00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0970E00FEC48B00AA835D009F78
      5100FCB46500C68A4A008A603400EA953400E2903D006E587B00B7743B00FE8C
      0A0084594E008A594400FE86000099451700B47E6B00FFFFFB00F8EDE100F7E6
      D400F6E1C90081000000FFFFFF00520505006C000000BB8F8F005C000000CE8C
      8C006D03030076000000FFFFFF00810000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0970E00E2AD7F00483E34004037
      3000BF8F590070563B002E2925009F6C300086697F001427DA00534B8F00C077
      32001C2FC5001F2FBD00DA780F0099451700BA836D00FFFFFF00FCF4EE00FAED
      E100F8E9D50000000000FFFFFF00AD2D2D0065141400EAA3A30092141400B6A1
      A100752020006E171700FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0970E00FFC78F00FBB77B00F2B0
      7700FFC17900FEAF6300EA9C4F00FFAB4600FFA43500DA8E4100FB962500FF97
      1300E9831800EE800D00FF88000099451700BF877000FFFFFF00FFFBFA00FEF4
      ED00FAEEE00081000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00810000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0970E00F2BB8900D8D4AF00D9D7
      B000D4D0AA00D8D1A600DACF9D00D4C99200DEC68800FFAD4200FB962500EF8C
      1E00F3881000F6860800FF88010099451700C48C7200FFFFFF00FFFFFF00FFFC
      FA00FCF4ED000000000081000000000000008100000000000000810000000000
      0000810000000000000081000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0970E00C79A730050C6BB0051CB
      C00051CBC00051CBC10051CBC1004BCBC40074D7CE00FBB56000BB742600A167
      2300985F1C00B0681300FF8B040099451700CA917400FFFFFF00FFFFFF00FFFF
      FF00FFFCFA00FCF4ED00FAEDDE00F8E7D400FCEBD300E3D3BB00B7AD9C00A569
      6A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAA12700F6BA8B00C4976C00C498
      6C00C4986C00C4976B00C4956000C18E5300D1965000FFAB4F00F39A3800FB9A
      2D00E0862100EF891600FF910A0099451700CE957600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFCFA00FCF6EB00FAEFE000A5696A00A5696A00A5696A00A569
      6A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DC910300E79F2300EBA5
      3400E9A33400E29E3400EEA74700EEA34000E99C3500E3932D00E28E2300E088
      1C00E1831500DE7F0F00C56B0C0000000000D3977800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFC00F4EBE600A5696A00E2A35B00EF993800BB70
      4F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D59A7900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F8F8FE00A5696A00E5A55F00C2805C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D0906B00D0906B00D0906B00D090
      6B00D0906B00D0906B00D0906B00D0906B00A5696A00BB7F6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000130020001410300025104000251040001430300013302000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000033140000451B00005722000057220000471C0000361600000000
      00000000000000000000000000000000000000000000000000007B0000007B00
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000145
      03000145030003780800039C0B00039F0C00039F0C00039D0C00027E0900014D
      0400014D0400000000000000000000000000000000000000000000000000491C
      0000491C000080320000A5410000AA420000AA420000A741000084340000511F
      0000511F0000000000000000000000000000000000007B000000007B00007B00
      00007B0000007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      80000000800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000034F09000365
      090004A30D0003A60C0003A00B00029E0A00039F0C0003A00C0003A50C0003A6
      0C00026906000134020000000000000000000000000000000000592300006E2B
      0000AF440000B1450000AA420000A5410000AA420000AA420000AF440000B145
      0000702C000036160000000000000000000000FF0000007B0000007B0000007B
      00007B0000007B0000007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000044F0900066B11000AAB
      1F0007A41500049E0D00029D0A00B1E6B600FFFFFF0036B84100039E0C0003A0
      0C0003A70C00026A0600024C04000000000000000000592300007B300000C54D
      0000B8480000AA420000A5410000CA884F00E6C6A700AF500B00A7410000AA42
      0000B1450000702C0000511F00000000000000FF0000007B0000007B0000007B
      0000007B0000007B00007B0000007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000044F090010AC30000DAB
      280009A41C00039E0F00039E0C00AFE5B400FFFFFF0037BA4200039E0C00039E
      0C00039F0C0003A70C00024C0400000000000000000059230000D4530000CC50
      0000BB490000AA420000C2773800FAF4EE00FFFFFF00DEB48C00A9420000A741
      0000AA420000B1450000511F00000000000000FF0000007B0000007B0000007B
      0000007B0000007B0000007B00007B0000007B7B7B007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000035706000D82230017B641000EA9
      2D0005A01300049F0D00039E0C00ADE5B200FFFFFF0036B84100039E0C00039E
      0C00039E0C0003A50C00037B0800014203005F250000A03F0000EB5C0000CC50
      0000B1450000C67A3A00FCF7F300FFFFFF00FFFFFF00FFFFFF00D9A67900A942
      0000A7410000AF44000084340000451B000000FF0000007B0000007B0000007B
      000000FF0000007B0000007B0000007B00007B0000007B7B7B007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000357060017A3410018B54A0011AB
      340019AB270007A01100049F0D00AFE5B200FFFFFF0036B84100039E0C0017AA
      22000AA3140003A10C0003960A00014203005F250000D7540000EB5C0000D453
      0000CC824200FCF8F400FEFEFC00FCFAF600FEFEFC00FEFBF800FFFFFF00D5A0
      7000A9440100AC4300009E3E0000451B000000FF0000007B0000007B00007B00
      000000FF000000FF0000007B0000007B0000007B00007B0000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000006680D0021B151001EB7510020B5
      4F00DCF4E2008FDCA10017AF3900B5E9C200FFFFFF0029B2340035B84000F2FB
      F30098DD9E0003A00C00039F0C00014A0400772E0000F6600000F8620000F862
      0000FEF2E700FFFFFF00F2AD6F00F7CFAA00FFFFFF00D1986600F4E7DA00FFFF
      FF00D9A77A00AA420000AA4200004F1F000000FF0000007B0000007B00007B00
      00007B7B7B000000000000FF0000007B0000007B0000007B00007B0000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000087412003EBD69002ABA5C0021B5
      5300EDFAF200FFFFFF008CDDAB00BCEBCF00FFFFFF006BCE7500DCF4DE00FFFF
      FF007FD4870003A00C00039F0C000252050089350000FF781300FF6A0400FB63
      0000FFEAD400FFBB7E00FF640000FFD1A600FFFFFF00BF6A2500C0723000FBF7
      F200E1BA9500AC430000AA4200005722000000FF0000007B0000007B00007B00
      00007B7B7B000000000000FF000000FF0000007B0000007B0000007B00007B00
      00007B7B7B000000000000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000006780E0054C57A0044C674001CB2
      4E0066CF8C00F7FCF800FCFFFE00F7FCFA00FCFEFE00FAFEFA00FFFFFF007DD4
      8E000EA6260007A51800039D0C000146030089350000FF882900FF801E00F05E
      0000FB741000FB670300FB630000FCD3AB00FFFFFF00D77D3100C54D0000CA60
      1100C6540500B8480000A54100004B1D00000000000063FF000000FF0000007B
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      8000000080000000800000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000006780E004CBD690083DDA70022B6
      55001CB24E005FCC8700F6FCF800FFFFFF00FFFFFF00FFFFFF0088D99D0010AB
      2F000CA6270006A71600038C0A000146030089350000FF801E00FFAD6700FF64
      0000EE5D0000FB630000FB630000FED3AB00FFFFFF00E1803100CF510000CF51
      0000C54D0000BB490000953A00004B1D00000000000000000000000000000000
      00000000000000000000000000000000000000FF0000A5FF0000007B0000007B
      00007B0000007B7B7B007B7B7B00000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000021A33600AAE7C50068D0
      8E0016AF48001BB14C005DCC8600F2FBF600FFFFFF009DE1B20011AA32000EA7
      29000BA4200009AF1C00036B0A000000000000000000E65A0000FFC69300FF98
      4200E1580000EB5C0000FB630000FED4AC00FFFFFF00E7833200CF510000CA4F
      0000C04B0000C74E0000752D0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF0000007B
      0000007B00007B0000007B7B7B007B7B7B000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000021A3360056C57300C5F0
      D80066CF8C0020B4520019B14C0070D39500BAEACC0026B7540013AC3C0012AA
      34000FB02D000A991F00036B0A000000000000000000E65A0000FF892B00FFDA
      B700FF974100F8620000E95B0000FED5AF00FFFFFF00EB843100D9550000D453
      0000D7540000B4460000752D0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      0000007B0000007B00007B0000007B7B7B000000000000000000000000000000
      8000FFFF0000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000139923006ACC
      8800D0F4E3009AE1B60050C77A0038BD67002CBA5D0030BB60002FBC5D0023BC
      4F0011A3300006620F0000000000000000000000000000000000C54D0000FF98
      4200FFE2C600FFBB7F00FF872800FF750F00FF6B0500FF6E0800FF6E0800FF67
      0100CA4F0000702C000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF0000007B00007B0000007B7B7B000000000000000000000000000000
      8000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000004BBF
      67004BBF670098E1B500BDEED400A7E7C40090E0B10078D99F0049C779001B9D
      3D001B9D3D00000000000000000000000000000000000000000000000000FF80
      1E00FF801E00FFBA7D00FFD5AD00FFC59100FFB57400FFA55800FF832300D754
      0000D75400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000007B00007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001DA4350038B4540046BC660042B863002BA64900138C2A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E1580000FF700A00FF7D1900FF781300FB630000B64700000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFF80000000000FFFF000000000000
      8001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000F000000000000000F000000008001000F00000000
      FFFF001F00000000FFFF003F00000000E7FFC007F81FF81FC3FFC007E007E007
      81FFC007C003C00300FFC00780018001007FC00780018001003FC00700000000
      001FC00700000000001FC00700000000040FC007000000000407C00700000000
      8F03C00700000000FF01C00780018001FFC0C00780018001FFE0C007C003C003
      FFF0C007E007E007FFF8C007F81FF81F00000000000000000000000000000000
      000000000000}
  end
  object alActions: TActionList
    Images = ilImages
    Left = 256
    Top = 58
    object acExportToExcel: TAction
      Caption = #1042' '#1101#1082#1089#1077#1083#1100
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      ImageIndex = 0
      OnExecute = acExportToExcelExecute
    end
    object acExit: TAction
      Caption = #1042#1099#1093#1086#1076
      Hint = #1042#1099#1093#1086#1076' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      ImageIndex = 1
      ShortCut = 27
      OnExecute = acExitExecute
    end
    object acGetOstByDate: TAction
      Caption = #1054#1089#1090#1072#1090#1082#1080
      Hint = 
        #1055#1077#1088#1077#1089#1086#1073#1088#1072#1090#1100' '#1086#1089#1090#1072#1090#1082#1080' '#1085#1072' '#1091#1082#1072#1079#1072#1085#1085#1091#1102' '#1076#1072#1090#1091#13#10#1042#1053#1048#1052#1040#1053#1048#1045'! '#1045#1089#1083#1080' '#1085#1072' '#1101#1090#1091' '#1076#1072#1090 +
        #1091' '#1091#1078#1077' '#1077#1089#1090#1100' '#1089#1086#1073#1088#1072#1085#1085#1099#1077' '#1086#1089#1090#1072#1090#1082#1080','#13#10#1086#1085#1080' '#1073#1091#1076#1091#1090' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1086' '#1091#1076#1072#1083#1077#1085#1099' ' +
        '('#1074#1082#1083#1102#1095#1072#1103' '#1087#1088#1080#1074#1103#1079#1072#1085#1085#1099#1077').'
      ImageIndex = 4
      OnExecute = acGetOstByDateExecute
    end
    object acCheckOst: TAction
      Caption = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1086#1089#1090#1072#1090#1086#1082
      Hint = 
        #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1086#1090#1089#1090#1072#1090#1082#1080' '#1082' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072#1084' '#1087#1088#1086#1077#1082#1090#1072' "'#1052#1086#1085#1080#1090#1086#1088#1080#1085#1075 +
        ' '#1094#1077#1085'"'
      ImageIndex = 2
      OnExecute = acCheckOstExecute
    end
    object acBackOst: TAction
      Caption = #1042#1077#1088#1085#1091#1090#1100' '#1086#1089#1090#1072#1090#1086#1082
      Hint = #1054#1090#1074#1103#1079#1072#1090#1100' '#1086#1090#1089#1090#1072#1090#1082#1080' '#1086#1090' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072' '#1087#1088#1086#1077#1082#1090#1072' "'#1052#1086#1085#1080#1090#1086#1088#1080#1085#1075' '#1094#1077#1085'"'
      ImageIndex = 3
      OnExecute = acBackOstExecute
    end
    object acRefreshAll: TAction
      Caption = 'acRefreshAll'
      ShortCut = 116
      OnExecute = acRefreshAllExecute
    end
    object acExportToCSV: TAction
      Caption = #1074' '#1074#1080#1076#1077' CSV-'#1092#1072#1081#1083#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' CVS-'#1092#1072#1081#1083' '#1095#1077#1088#1077#1079' Excel'
      OnExecute = acExportToCSVExecute
    end
    object acAbsentMedicsToWord: TAction
      Caption = #1054#1090#1089#1091#1090#1089'. '#1087#1088#1077#1087'.'
      ImageIndex = 5
      OnExecute = acAbsentMedicsToWordExecute
    end
    object acExportToExcelWithDecode: TAction
      Caption = #1089' '#1088#1072#1089#1096#1080#1092#1088#1086#1074#1082#1086#1081
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel '#1089' '#1088#1072#1089#1096#1080#1092#1088#1086#1074#1082#1086#1081
      OnExecute = acExportToExcelWithDecodeExecute
    end
    object acGetPrihByDate: TAction
      Caption = #1055#1088#1080#1093#1086#1076#1099
      Hint = #1055#1077#1088#1077#1089#1086#1073#1088#1072#1090#1100' '#1087#1088#1080#1093#1086#1076#1099' '#1079#1072' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
      ImageIndex = 4
      OnExecute = acGetPrihByDateExecute
    end
  end
  object oqGetPrih: TOracleQuery
    SQL.Strings = (
      'BEGIN'
      '  :PDATE1 := TRUNC(:PDATE1);'
      '  MED.PKG_MEDSES.RESETDATEPERIOD;'
      '  MED.PKG_MEDSES.SET_DATA1(:PDATE1);'
      '  MED.PKG_MEDSES.SET_DATA2(:PDATE2);'
      '  MED.PKG_MEDSES.SET_CURMO_GROUP(:NMO_GROUP);'
      ''
      '  DELETE FROM MED.TPRICE_MONITOR_OST'
      '   WHERE FD_DATE = :PDATE1'
      '     AND FK_MOGROUP = :NMO_GROUP;'
      '  COMMIT;'
      ''
      '  EXECUTE IMMEDIATE'
      ' '#39'INSERT INTO MED.TPRICE_MONITOR_OST'
      '    (PACKNX,'
      '     FK_TPRICE_MONITOR_BASE_ID,'
      '     YEAR,'
      '     MONTH,'
      '     IRECID,'
      '     SERIES,'
      '     QUANTITY,'
      '     FUNDS,'
      '     VENDOR,'
      '     VENDORID,'
      '     PRCPRICE,'
      '     RTLPRICE,'
      '     RTLPREMIUM,'
      '     FK_MEDICID,'
      '     FK_KARTID,'
      '     FD_DATE,'
      '     FK_MOGROUP,'
      '     PROIZVODITEL,'
      '     FN_MNF_PRICE,'
      '     FN_PRICE,'
      '     POSTAVID)'
      ''
      '    SELECT PACKNX,'
      '           FK_TPRICE_MONITOR_BASE_ID,'
      '           YEAR,'
      '           MONTH,'
      
        '           MAX(IRECID) IRECID, --'#1085#1077#1072#1082#1090#1091#1072#1083#1100#1085#1072', '#1077#1089#1083#1080' '#1077#1089#1090#1100' '#1085#1077#1089#1082#1086#1083#1100#1082 +
        #1086' '#1082#1072#1088#1090#1086#1095#1077#1082
      '           ASU.STRING_AGG(DISTINCT SERIES) SERIES,'
      '           SUM(QUANTITY) QUANTITY,'
      '           SUM(FUNDS) FUNDS,'
      '           VENDOR,'
      '           VENDORID,'
      '           PRCPRICE,'
      '           RTLPRICE,'
      '           RTLPREMIUM,'
      '           MEDICID,'
      
        '           MAX(KARTID) KARTID, --'#1085#1077#1072#1082#1090#1091#1072#1083#1100#1085#1072', '#1077#1089#1083#1080' '#1077#1089#1090#1100' '#1085#1077#1089#1082#1086#1083#1100#1082 +
        #1086' '#1082#1072#1088#1090#1086#1095#1077#1082
      '           FD_DATE,'
      '           FK_MOGROUP,'
      '           FC_PROD,'
      '           MNFPRICE,'
      '           FN_PRICE,'
      '           POSTAVID'
      '      FROM (SELECT O.FC_MEDIC,'
      
        '                   (SELECT MAX(PACKNX) FROM MED.TPRICE_MONITOR_B' +
        'ASE WHERE DRUGID = O.DRUGID) AS PACKNX,'
      
        '                   (SELECT MAX(FK_ID) FROM MED.TPRICE_MONITOR_BA' +
        'SE WHERE DRUGID = O.DRUGID) AS FK_TPRICE_MONITOR_BASE_ID,'
      
        '                   TO_NUMBER(TO_CHAR(MED.PKG_MEDSES.GET_DATA1, '#39 +
        #39'YYYY'#39#39')) AS "YEAR",'
      
        '                   TO_NUMBER(TO_CHAR(MED.PKG_MEDSES.GET_DATA1, '#39 +
        #39'MM'#39#39')) AS "MONTH",'
      
        '                   TO_CHAR(O.MEDICID) || '#39#39'_'#39#39' || TO_CHAR(O.KART' +
        'ID) AS IRECID,'
      '                   O.FC_SERIAL AS SERIES,'
      
        '                   --med.GET_KART_FC_SERIAL_LST( o.MEDICID, p.po' +
        'stavid ) as Series,'
      '                   SUM(O.FN_KOLOST) AS QUANTITY,'
      '                   O.FN_PRICE,'
      '                   SUM(O.FN_PRICE * O.FN_KOLOST) AS FUNDS,'
      '                   P.POSTAVID,'
      '                   P.FC_NAME AS VENDOR,'
      '                   P.FC_PM_VENDOR_ID AS VENDORID,'
      
        '                   coalesce( O.FN_PRICE_MNF, O.FN_PRICE, 0 )  AS' +
        ' MNFPRICE,'
      '                   0 AS RTLPRICE,'
      '                   NVL(O.FN_PRICE, 0) AS PRCPRICE,'
      '                   O.FN_NACENKA AS RTLPREMIUM,'
      '                   '
      '                   '#39#39' AS "Remark",'
      '                   '#39#39' AS SRCORG,'
      '                   2 AS IPV,'
      '                   -- o.kartid,'
      
        '                   --med.GET_KART_FC_SERIAL_LST( o.MEDICID, p.po' +
        'stavid ) as all_ser,'
      '                   O.FC_PROD,'
      '                   O.MEDICID,'
      '                   O.DRUGID,'
      '                   O.KARTID,'
      
        '                   TRUNC(MED.PKG_MEDSES.GET_DATA1)    AS FD_DATE' +
        ','
      '                   MED.PKG_MEDSES.GET_CUR_MOGROUP AS FK_MOGROUP'
      '            '
      '              FROM (SELECT K.KARTID,'
      '                           K.FC_SERIAL,'
      '                           K.MOID,'
      '                           K.DRUGID,'
      '                           K.MEDICID,'
      '                           M.FC_NAME AS FC_MEDIC,'
      '                           EI2.FC_NAME AS FC_UEDIZM,'
      '                           M.FN_FPACKINUPACK,'
      '                           EI1.FC_NAME AS FC_FEDIZM,'
      '                           NVL(SUM(DP.FN_KOL), 0) AS FN_KOLOST,'
      '                           K.FN_PRICE,'
      
        '                           NVL(SUM(NVL(DP.FN_KOL * K.FN_PRICE, 0' +
        ')), 0) AS FN_SUMM,'
      '                           PC.PFC_VALUE AS FC_PROD,'
      '                           K.FN_PRICE_MNF,'
      '                           K.FN_NACENKA,'
      '                           D.DPID AS PRIHDOCID'
      '                      FROM MED.TDOCS D,'
      '                           MED.TDPC DP,'
      '                           MED.TKART K,'
      '                           MED.TMEDIC M,'
      '                           MED.TEI EI1,'
      '                           MED.TEI EI2,'
      
        '                           (SELECT -- PFC_VALUE - '#1053#1040#1047#1042#1040#1053#1048#1071' '#1055#1056#1054#1048#1047 +
        #1042#1054#1044#1048#1058#1045#1051#1045#1049', SFC_VALUE - '#1057#1045#1056#1058#1048#1060#1048#1050#1040#1058#1067
      '                                   P1.FK_ID AS PFK_ID,'
      '                                   P1.FN_PARENT AS PFN_PARENT,'
      
        '                                   NVL(P1.FC_VALUE, P2.FC_VALUE)' +
        ' AS PFC_VALUE, -- '#1055#1056#1054#1048#1047#1042#1054#1044#1048#1058#1045#1051#1068' '
      '                                   P2.FK_ID AS SFK_ID,'
      '                                   P2.FN_PARENT AS SFN_PARENT,'
      
        '                                   DECODE(P1.FK_ID, NULL, NULL, ' +
        'P2.FC_VALUE) AS SFC_VALUE -- '#1057#1045#1056#1058#1048#1060#1048#1050#1040#1058
      
        '                              FROM MED.TPRODCERT P1, MED.TPRODCE' +
        'RT P2'
      
        '                             WHERE P1.FK_ID(+) = P2.FN_PARENT) P' +
        'C'
      '                     WHERE D.DPID = DP.DPID'
      '                       AND D.FP_VID = 1'
      
        '                       AND D.FD_DATA >= TRUNC(MED.PKG_MEDSES.GET' +
        '_DATA1)'
      
        '                       AND D.FD_DATA < TRUNC(MED.PKG_MEDSES.GET_' +
        'DATA2 + 1)'
      
        '                       AND D.FK_MOGROUPID_TO = MED.PKG_MEDSES.GE' +
        'T_CUR_MOGROUP'
      '                       AND DP.KARTID = K.KARTID'
      '                       AND K.MEDICID = M.MEDICID'
      '                       AND M.EIID = EI1.EIID(+)'
      '                       AND M.FK_FPACKID = EI2.EIID(+)'
      '                       AND K.FN_PRODCERTID = PC.SFK_ID(+)'
      '                     GROUP BY K.KARTID,'
      '                              K.FC_SERIAL,'
      '                              K.MOID,'
      '                              K.DRUGID,'
      '                              K.MEDICID,'
      '                              M.FC_NAME,'
      '                              EI2.FC_NAME,'
      '                              M.FN_FPACKINUPACK,'
      '                              EI1.FC_NAME,'
      '                              K.FN_PRICE,'
      '                              PC.PFC_VALUE,'
      '                              K.FN_PRICE_MNF,'
      '                              K.FN_NACENKA,'
      '                              D.DPID) O,'
      '                   MED.TDOCS D,'
      '                   MED.TPOSTAV P'
      '            '
      '             WHERE O.PRIHDOCID = D.DPID(+)'
      '               AND D.POSTAVID = P.POSTAVID(+)'
      '             GROUP BY O.MEDICID,'
      '                      O.DRUGID,'
      '                      O.FC_MEDIC,'
      '                      O.FC_SERIAL,'
      '                      O.KARTID,'
      '                      O.FN_PRICE,'
      '                      P.POSTAVID,'
      '                      P.FC_NAME,'
      '                      P.FC_PM_VENDOR_ID,'
      '                      O.FC_PROD,'
      '                      O.FN_PRICE_MNF,'
      '                      O.FN_NACENKA'
      '             ORDER BY P.POSTAVID,'
      '                      O.FC_PROD,'
      '                      O.MEDICID,'
      '                      O.FN_PRICE,'
      '                      O.FC_SERIAL)'
      '     GROUP BY PACKNX,'
      '              FK_TPRICE_MONITOR_BASE_ID,'
      '              YEAR,'
      '              MONTH,'
      '              --IRECID,'
      '              VENDOR,'
      '              VENDORID,'
      '              PRCPRICE,'
      '              RTLPRICE,'
      '              RTLPREMIUM,'
      '              MEDICID,'
      '              --KARTID,'
      '              FD_DATE,'
      '              FK_MOGROUP,'
      '              FC_PROD,'
      '              MNFPRICE,'
      '              FN_PRICE,'
      '              POSTAVID'#39';         '
      '  COMMIT;'
      'END;')
    Session = os
    Optimize = False
    Variables.Data = {
      03000000030000000A0000003A4E4D4F5F47524F555003000000000000000000
      0000070000003A5044415445310C0000000000000000000000070000003A5044
      415445320C0000000000000000000000}
    Cursor = crSQLWait
    Left = 22
    Top = 152
  end
  object odsGroupMo: TOracleDataSet
    SQL.Strings = (
      'SELECT * from'
      '(SELECT groupid, fc_group, fl_del, 0 as FN_ORDER'
      
        'FROM med.tmo_group WHERE (fl_del = 0) and (UPPER(fc_group) like ' +
        #39'%'#1040#1055#1058#1045#1050#1040'%'#39')'
      'UNION'
      'SELECT groupid, fc_group, fl_del, 1 as FN_ORDER'
      
        'FROM med.tmo_group WHERE fl_del = 0 and (not (UPPER(fc_group) li' +
        'ke '#39'%'#1040#1055#1058#1045#1050#1040'%'#39'))'
      ')'
      'ORDER BY FN_ORDER, UPPER(fc_group)'
      ''
      ''
      ''
      '/*'
      'select * from vchmo'
      'order by fc_name'
      '*/')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000040000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C0100000000000800000046
      4E5F4F52444552010000000000}
    Cursor = crSQLWait
    Session = os
    AfterOpen = odsGroupMoAfterOpen
    Left = 126
    Top = 341
  end
  object dsGroupMo: TDataSource
    DataSet = odsGroupMo
    Left = 126
    Top = 387
  end
  object oqInitMO: TOracleQuery
    SQL.Strings = (
      'begin'
      '  SELECT NVL(MAX(MOID),-1) into :nMOID FROM'
      
        '   (SELECT MOID FROM MED.TMO T WHERE T. FL_DEL = 0 and T.FK_SOTR' +
        'ID IN (SELECT login.GET_SOTRID(:pAppSotrID) FROM DUAL));'
      
        '   SELECT MAX(fk_curmogroupid) into :nMO_GROUP FROM med.tmo wher' +
        'e moid = :nMOID;'
      ''
      '  med.pkg_medses.set_curmo(:nMOID);'
      '  med.pkg_medses.set_curmo_group(:nMO_GROUP);'
      '  med.pkg_medses.ResetDatePeriod;'
      ''
      
        '  select NVL(MAX(m.fl_treb),0) into :PFL_Provizor from med.tmo m' +
        ' where m.MOID = :nMOID;'
      '  select Trunc(sysdate) into :psysdate from dual;  '
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      03000000050000000B0000003A50415050534F54524944030000000000000000
      000000060000003A4E4D4F494403000000040000004C030000000000000A0000
      003A4E4D4F5F47524F5550030000000400000000000000000000000D0000003A
      50464C5F50524F56495A4F520300000004000000000000000000000009000000
      3A50535953444154450C00000007000000786D061101010100000000}
    Cursor = crSQLWait
    Left = 348
    Top = 30
  end
  object odsPriceMonitorBASE: TOracleDataSet
    SQL.Strings = (
      '/*'
      
        'SELECT a.rowid, a.packnx, a.tradename, a.mnn, a.proizvoditel, a.' +
        'lekform_doza,'
      
        '       a.upakovka, a.uroven, a.segment, (select count(o.fk_id) f' +
        'rom med.tprice_monitor_ost o'
      
        '                                           where o.packnx = a.pa' +
        'cknx and o.fd_date = :pDate and o.fk_mogroup = :pfk_mogroup) as ' +
        'ost_count,'
      '      a.DosageR, a.CountryRCl'
      '*/'
      ''
      
        'SELECT a.rowid, a.FK_ID, a.drugid, a.packnx, a.tradenmr, a.innr,' +
        ' a.mnfnm, a.drugfmnmrs, a.pack,'
      
        '       a.segment, a.dosager, a.maxmnfprice, a.currencynm, a.mnfi' +
        'd,'
      '       a.pckid, a.PCKNM, a.ean, a.totdrugqn,'
      '        (select count(o.fk_id) from med.tprice_monitor_ost o'
      
        '         where o.FK_TPRICE_MONITOR_BASE_ID = a.FK_ID and o.fd_da' +
        'te = :pDate and o.fk_mogroup = :pfk_mogroup) as ost_count'
      'FROM med.tprice_monitor_base a')
    ReadBuffer = 200
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A50444154450C00000000000000000000000C00
      00003A50464B5F4D4F47524F5550030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000009000000060000005041434B4E580100000000000900000054524144
      454E414D45010000000000030000004D4E4E0100000000000C00000050524F49
      5A564F444954454C0100000000000C0000004C454B464F524D5F444F5A410100
      00000000080000005550414B4F564B410100000000000600000055524F56454E
      010000000000070000005345474D454E54010000000000090000004F53545F43
      4F554E54010000000000}
    Cursor = crSQLWait
    UniqueFields = 'fk_id'
    RefreshOptions = [roAllFields]
    UpdatingTable = 'med.tprice_monitor_base'
    Session = os
    AfterOpen = odsPriceMonitorBASEAfterOpen
    BeforeClose = odsPriceMonitorBASEBeforeClose
    Left = 414
    Top = 140
  end
  object os: TOracleSession
    DesignConnection = True
    LogonUsername = 'asu'
    LogonPassword = 'asu'
    LogonDatabase = 'ASU'
    Left = 20
    Top = 84
  end
  object odsPriceMonitorOST: TOracleDataSet
    SQL.Strings = (
      'SELECT a.rowid, a.*'
      
        '       ,m.fc_name as fc_medic, m.fn_fpackinupack as FN_FAS, up_e' +
        'i.FC_NAME as fc_UP_EI, fas_ei.FC_NAME as fc_FAS_EI, k.fd_goden, ' +
        'nvl(k.fl_jnvls, m.fl_jnvls )  as fl_jnvls'
      ''
      
        '  FROM med.tprice_monitor_ost a, med.tmedic m, med.tei up_ei, me' +
        'd.tei fas_ei, med.tkart k'
      '  where a.fk_medicid = m.medicid(+) '
      '    and a.fk_kartid = k.kartid(+)'
      '    and a.fd_date = :pDate and a.fk_mogroup = :pfk_mogroup'
      '    and m.eiid = up_ei.eiid(+)'
      '    and m.fk_fpackid = fas_ei.eiid(+)'
      '    :pFilter_jnvls'
      '--    and a.packnx is null'
      'order by a.FK_TPRICE_MONITOR_BASE_ID, m.fc_name')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A50444154450C00000000000000000000000C00
      00003A50464B5F4D4F47524F55500300000000000000000000000E0000003A50
      46494C5445525F4A4E564C53010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000015000000060000005041434B4E580100000000000400000059454152
      010000000000050000004D4F4E54480100000000000600000049524543494401
      000000000006000000534552494553010000000000080000005155414E544954
      590100000000000500000046554E44530100000000000600000056454E444F52
      0100000000000800000050524350524943450100000000000800000052544C50
      524943450100000000000A00000052544C5052454D49554D0100000000000600
      000052454D41524B010000000000060000005352434F52470100000000000300
      00004950560100000000000A000000464B5F4D45444943494401000000000009
      000000464B5F4B41525449440100000000000700000046445F44415445010000
      0000000A000000464B5F4D4F47524F55500100000000000800000046435F4D45
      4449430100000000000C00000050524F495A564F444954454C01000000000005
      000000464B5F4944010000000000}
    Cursor = crSQLWait
    UniqueFields = 'fk_id'
    RefreshOptions = [roAllFields]
    UpdatingTable = 'med.tprice_monitor_ost'
    Session = os
    AfterOpen = odsPriceMonitorOSTAfterOpen
    BeforeClose = odsPriceMonitorOSTBeforeClose
    Left = 422
    Top = 318
  end
  object dsPriceMonitorBASE: TDataSource
    DataSet = odsPriceMonitorBASE
    Left = 414
    Top = 89
  end
  object dsPriceMonitorOST: TDataSource
    DataSet = odsPriceMonitorOST
    Left = 422
    Top = 269
  end
  object JvAppIniFileStorage1: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    AutoFlush = True
    AutoReload = True
    FileName = 'PriceMonitoring.ini'
    SubStorages = <>
    Left = 200
    Top = 188
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = JvAppIniFileStorage1
    AppStoragePath = 'frmGetPeriod\'
    StoredProps.Strings = (
      'grBaseDBTableView_DrugFmNmRS.Width'
      'grBaseDBTableView_innr.Width'
      'grBaseDBTableViewOstFC_MEDIC.Width'
      'grBaseDBTableViewOstFD_DATE.Width'
      'grBaseDBTableViewOstFK_ID.Width'
      'grBaseDBTableViewOstFK_KARTID.Width'
      'grBaseDBTableViewOstFK_MEDICID.Width'
      'grBaseDBTableViewOstFK_MOGROUP.Width'
      'grBaseDBTableViewOstFUNDS.Width'
      'grBaseDBTableViewOstIPV.Width'
      'grBaseDBTableViewOstPACKNX.Width'
      'grBaseDBTableViewOstPRCPRICE.Width'
      'grBaseDBTableViewOstPROIZVODITEL.Width'
      'grBaseDBTableViewOstQUANTITY.Width'
      'grBaseDBTableViewOstREMARK.Width'
      'grBaseDBTableViewOstRTLPREMIUM.Width'
      'grBaseDBTableViewOstSRCORG.Width'
      'grBaseDBTableViewOstVENDOR.Width'
      'grBaseDBTableViewOstYEAR.Width'
      'grBaseDBTableView_PACKNX.Width'
      'grBaseDBTableView_mnfnm.Width'
      'grBaseDBTableView_tradenmr.Width'
      'grBaseDBTableView_Pack.Width'
      'grOSTDBTableView1FC_MEDIC.Width'
      'grOSTDBTableView1FD_DATE.Width'
      'grOSTDBTableView1FK_ID.Width'
      'grOSTDBTableView1FK_KARTID.Width'
      'grOSTDBTableView1FK_MEDICID.Width'
      'grOSTDBTableView1FK_MOGROUP.Width'
      'grOSTDBTableView1FUNDS.Width'
      'grOSTDBTableView1IPV.Width'
      'grOSTDBTableView1IRECID.Width'
      'grOSTDBTableView1MONTH.Width'
      'grOSTDBTableView1PACKNX.Width'
      'grOSTDBTableView1PRCPRICE.Width'
      'grOSTDBTableView1PROIZVODITEL.Width'
      'grOSTDBTableView1QUANTITY.Width'
      'grOSTDBTableView1REMARK.Width'
      'grOSTDBTableView1RTLPREMIUM.Width'
      'grOSTDBTableView1RTLPRICE.Width'
      'grOSTDBTableView1SERIES.Width'
      'grOSTDBTableView1SRCORG.Width'
      'grOSTDBTableView1VENDOR.Width'
      'grOSTDBTableView1YEAR.Width'
      'grBaseDBTableView_SEGMENT.Width'
      'grBaseDBTableViewOstSERIES.Width'
      'grBaseDBTableViewOstRTLPRICE.Width'
      'grBaseDBTableViewOstMONTH.Width'
      'grBaseDBTableViewOstIRECID.Width'
      'grBaseDBTableView_OST_COUNT.Width'
      'grBaseDBTableView_DosageR.Width'
      'grOSTDBTableView1_FC_FAS_EI.Width'
      'grOSTDBTableView1_FC_FAS_EI.Visible'
      'grOSTDBTableView1_FN_FAS.Visible'
      'grOSTDBTableView1_FN_FAS.Width'
      'grOSTDBTableView1FD_DATE.Visible'
      'grOSTDBTableView1FK_KARTID.Visible'
      'grOSTDBTableView1FK_MEDICID.Visible'
      'grOSTDBTableView1FK_MOGROUP.Visible'
      'grOSTDBTableView1PRCPRICE.Visible'
      'grOSTDBTableView1RTLPRICE.Visible')
    StoredValues = <>
    Left = 276
    Top = 184
  end
  object oqBackOst: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '--  select max(a.fk_id) into :fk_id FROM med.tprice_monitor_ost ' +
        'a where a.packnx = :packnx;'
      ''
      
        '--  update med.TPRICE_MONITOR_OST set packnx = null where packnx' +
        ' = :packnx;'
      
        '  select max(a.fk_id) into :fk_id FROM med.tprice_monitor_ost a ' +
        'where a.FK_TPRICE_MONITOR_BASE_ID = :FK_BASE_ID;'
      ''
      
        '  update med.TPRICE_MONITOR_OST set FK_TPRICE_MONITOR_BASE_ID = ' +
        'null where FK_TPRICE_MONITOR_BASE_ID = :FK_BASE_ID;'
      ''
      '  commit;'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A464B5F49440300000000000000000000000B00
      00003A464B5F424153455F4944030000000000000000000000}
    Cursor = crSQLWait
    Left = 94
    Top = 152
  end
  object pmExportCSV: TPopupMenu
    Left = 140
    Top = 114
    object N1: TMenuItem
      Action = acExportToCSV
    end
    object N4: TMenuItem
      Action = acExportToExcelWithDecode
    end
  end
  object odsExport: TOracleDataSet
    SQL.Strings = (
      'SELECT B.DRUGID,'
      '       B.PACKNX,'
      '       B.MNFID,'
      '       B.PCKID,'
      '       B.SEGMENT,'
      '       A.YEAR,'
      '       A.MONTH,'
      '       A.IRECID,'
      '       '#39'"'#39' || NVL(A.SERIES, '#39'-'#39') || '#39'"'#39' AS SERIES,'
      
        '       NVL(TRIM(TO_CHAR(A.QUANTITY,'#39'B9999999990D99'#39','#39'NLS_NUMERIC' +
        '_CHARACTERS = '#39#39'. '#39#39' '#39')), '#39'0.00'#39') AS TOTDRUGQN, --'#1042#1086#1090' '#1101#1090#1086#1090' '#1080#1076#1080#1086#1090 +
        #1080#1079#1084' '#1089' '#1085#1072#1079#1074#1072#1085#1080#1103#1084#1080' '#1082#1086#1083#1086#1085#1086#1082' '#1074' '#1092#1086#1088#1084#1072#1090#1077' ('#1089#1084'. '#1096#1072#1073#1083#1086#1085#1099' '#1074#1099#1075#1088#1091#1079#1086#1082')'
      
        '       NVL(TRIM(TO_CHAR(A.FUNDS,'#39'B9999999990D99'#39','#39'NLS_NUMERIC_CH' +
        'ARACTERS = '#39#39'. '#39#39' '#39')), '#39'0.00'#39') AS FUNDS,'
      '       A.VENDORID,'
      
        '       NVL(TRIM(TO_CHAR(A.FN_MNF_PRICE,'#39'B9999999990D99'#39','#39'NLS_NUM' +
        'ERIC_CHARACTERS = '#39#39'. '#39#39' '#39')), '#39'0.00'#39') AS MNFPRICE,'
      
        '       NVL(TRIM(TO_CHAR(A.PRCPRICE,'#39'B9999999990D99'#39','#39'NLS_NUMERIC' +
        '_CHARACTERS = '#39#39'. '#39#39' '#39')), '#39'0.00'#39') AS PRCPRICE,'
      
        '       NVL(TRIM(TO_CHAR(A.RTLPRICE,'#39'B9999999990D99'#39','#39'NLS_NUMERIC' +
        '_CHARACTERS = '#39#39'. '#39#39' '#39')), '#39'0.00'#39') AS RTLPRICE,'
      '       A.REMARK,'
      '       A.SRCORG'
      ''
      '  FROM MED.TPRICE_MONITOR_OST A, MED.TPRICE_MONITOR_BASE B'
      ' WHERE A.FD_DATE = :PDATE'
      '   AND A.FK_MOGROUP = :PFK_MOGROUP'
      '   AND A.FK_TPRICE_MONITOR_BASE_ID = B.FK_ID'
      ''
      '')
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A50444154450C00000000000000000000000C00
      00003A50464B5F4D4F47524F5550030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000011000000060000005041434B4E580100000000000400000059454152
      010000000000050000004D4F4E54480100000000000600000049524543494401
      0000000000060000005345524945530100000000000500000046554E44530100
      000000000800000050524350524943450100000000000800000052544C505249
      43450100000000000600000052454D41524B010000000000060000005352434F
      5247010000000000070000005345474D454E540100000000000800000056454E
      444F524944010000000000080000004D4E465052494345010000000000060000
      00445255474944010000000000050000004D4E46494401000000000005000000
      50434B494401000000000009000000544F5444525547514E010000000000}
    Session = os
    Left = 200
    Top = 142
    object odsExportDRUGID: TFloatField
      FieldName = 'DRUGID'
    end
    object odsExportPACKNX: TFloatField
      DisplayWidth = 7
      FieldName = 'PACKNX'
    end
    object odsExportMNFID: TFloatField
      FieldName = 'MNFID'
    end
    object odsExportPCKID: TFloatField
      FieldName = 'PCKID'
    end
    object odsExportSEGMENT: TFloatField
      DisplayWidth = 6
      FieldName = 'SEGMENT'
    end
    object odsExportYEAR: TIntegerField
      DisplayWidth = 6
      FieldName = 'YEAR'
    end
    object odsExportMONTH: TIntegerField
      DisplayWidth = 6
      FieldName = 'MONTH'
    end
    object odsExportSERIES: TStringField
      DisplayWidth = 25
      FieldName = 'SERIES'
      Size = 352
    end
    object odsExportTOTDRUGQN: TStringField
      DisplayWidth = 7
      FieldName = 'TOTDRUGQN'
      Size = 14
    end
    object odsExportFUNDS: TStringField
      DisplayWidth = 10
      FieldName = 'FUNDS'
      Size = 14
    end
    object odsExportVENDORID: TStringField
      FieldName = 'VENDORID'
      Size = 15
    end
    object odsExportMNFPRICE: TStringField
      DisplayWidth = 10
      FieldName = 'MNFPRICE'
      Size = 14
    end
    object odsExportPRCPRICE: TStringField
      DisplayWidth = 7
      FieldName = 'PRCPRICE'
      Size = 14
    end
    object odsExportRTLPRICE: TStringField
      DisplayWidth = 7
      FieldName = 'RTLPRICE'
      Size = 14
    end
    object odsExportREMARK: TStringField
      DisplayWidth = 35
      FieldName = 'REMARK'
      Size = 150
    end
    object odsExportSRCORG: TStringField
      DisplayWidth = 20
      FieldName = 'SRCORG'
      Size = 100
    end
  end
  object dsExport: TDataSource
    DataSet = odsExport
    Left = 202
    Top = 91
  end
  object sdCSV: TSaveDialog
    DefaultExt = 'csv'
    Filter = '*.csv|*.csv'
    Title = #1069#1082#1089#1087#1086#1088#1090' '#1074' CSV'
    Left = 142
    Top = 82
  end
  object pmExportTableBase: TPopupMenu
    Left = 312
    Top = 136
    object mniTableBaseToExcel: TMenuItem
      Caption = #1058#1072#1073#1083#1080#1094#1091' '#1074' Excel'
      OnClick = mniTableBaseToExcelClick
    end
    object miSep1: TMenuItem
      Caption = '-'
    end
    object miLoadSprav: TMenuItem
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1051#1057
      OnClick = miLoadSpravClick
    end
    object miUpdateAndAddSprav: TMenuItem
      Tag = 1
      Caption = #1044#1086#1086#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1051#1057
      OnClick = miLoadSpravClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
  end
  object sdExportOstTable: TSaveDialog
    DefaultExt = 'xls'
    Filter = '*.xls|*.xls'
    Title = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
    Left = 314
    Top = 360
  end
  object frxAbsentMedics: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40228.594585659710000000
    ReportOptions.LastChange = 40236.430824641200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 544
    Top = 240
    Datasets = <
      item
        DataSet = frxdsAbsentMedics
        DataSetName = 'frxdsAbsentMedics'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 19.999854166666700000
      RightMargin = 5.000625000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 252.000000000000000000
        Top = 16.000000000000000000
        Width = 1028.030348975208000000
        object Memo1: TfrxMemoView
          Left = 756.000000000000000000
          Width = 272.000000000000000000
          Height = 96.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#187#1056#1109#1056#182#1056#181#1056#1029#1056#1105#1056#181' 6'
            #1056#1108' '#1056#1111#1056#1105#1057#1027#1057#1034#1056#1112#1057#1107' '#1056#160#1056#1109#1057#1027#1056#183#1056#1169#1057#1026#1056#176#1056#1030#1056#1029#1056#176#1056#1169#1056#183#1056#1109#1057#1026#1056#176
            ''
            #1056#1109#1057#8218' 27 '#1056#1112#1056#176#1057#1039' 2009 '#1056#1110'. '#1074#8222#8211'01'#1056#1116'-291/09')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 96.000000000000000000
          Width = 1028.000000000000000000
          Height = 60.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1056#1116#1056#164#1056#1115#1056#160#1056#1114#1056#1106#1056#166#1056#152#1056#1031
            
              #1056#1109#1056#177' '#1056#1109#1057#8218#1057#1027#1057#1107#1057#8218#1057#1027#1057#8218#1056#1030#1056#1105#1056#1105' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1057#8230' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057 +
              #8218#1056#1030', '#1056#1111#1056#1109#1056#1169#1056#187#1056#181#1056#182#1056#176#1057#8240#1056#1105#1057#8230' '#1056#1112#1056#1109#1056#1029#1056#1105#1057#8218#1056#1109#1057#1026#1056#1105#1056#1029#1056#1110#1057#1107' '#1056#1030' '#1057#1027#1057#8218#1056#176#1057#8224#1056#1105#1056#1109 +
              #1056#1029#1056#176#1057#1026#1056#1029#1057#8249#1057#8230' '#1056#187#1056#181#1057#8225#1056#181#1056#177#1056#1029#1056#1109'-'#1056#1111#1057#1026#1056#1109#1057#8222#1056#1105#1056#187#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1105#1057#8230' '#1056#1105' ' +
              #1056#176#1056#1111#1057#8218#1056#181#1057#8225#1056#1029#1057#8249#1057#8230' '#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039#1057#8230' ('#1056#1109#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039#1057 +
              #8230') '#1057#1027#1057#1107#1056#177#1057#1033#1056#181#1056#1108#1057#8218#1056#1109#1056#1030' '#1056#160#1056#1109#1057#1027#1057#1027#1056#1105#1056#8470#1057#1027#1056#1108#1056#1109#1056#8470' '#1056#164#1056#181#1056#1169#1056#181#1057#1026#1056#176#1057#8224#1056#1105#1056#1105)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 56.000000000000000000
          Top = 184.000000000000000000
          Width = 836.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '('#1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#1027#1057#1107#1056#177#1057#1033#1056#181#1056#1108#1057#8218#1056#176' '#1056#160#1056#1109#1057#1027#1057#1027#1056#1105#1056#8470#1057#1027#1056#1108#1056#1109#1056#8470' ' +
              #1056#164#1056#181#1056#1169#1056#181#1057#1026#1056#176#1057#8224#1056#1105#1056#1105')')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 56.000000000000000000
          Top = 204.000000000000000000
          Width = 836.000000000000000000
          Height = 24.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176' _______________________  20___ '#1056#1110'.')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo5: TfrxMemoView
          Left = 56.000000000000000000
          Top = 228.000000000000000000
          Width = 836.000000000000000000
          Height = 24.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1056#1111#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#1039' '#1056#1109#1057#8218#1057#8225#1056#181#1057#8218#1056#176')')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 56.000000000000000000
          Top = 156.000000000000000000
          Width = 836.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 144.000000000000000000
        Top = 328.000000000000000000
        Width = 1028.030348975208000000
        object Memo6: TfrxMemoView
          Width = 56.000000000000000000
          Height = 128.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211
            #1056#1111'/'#1056#1111)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 128.000000000000000000
          Width = 56.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '1')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 56.000000000000000000
          Width = 152.000000000000000000
          Height = 128.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1114#1056#181#1056#182#1056#1169#1057#1107#1056#1029#1056#176#1057#1026#1056#1109#1056#1169#1056#1029#1056#1109#1056#181' '#1056#1029#1056#181#1056#1111#1056#176#1057#8218#1056#181#1056#1029#1057#8218#1056#1109#1056#1030#1056#176#1056#1029#1056#1029#1056#1109#1056#181' '#1056#1029#1056#176#1056#183 +
              #1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#1110#1056#1109' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030#1056#176' ('#1056#1114#1056#1116#1056#1116 +
              ')')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 56.000000000000000000
          Top = 128.000000000000000000
          Width = 152.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '2')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 208.000000000000000000
          Width = 280.000000000000000000
          Height = 128.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1118#1056#1109#1057#1026#1056#1110#1056#1109#1056#1030#1056#1109#1056#181' '#1056#1029#1056#176#1056#183#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#1110#1056#1109' '#1057 +
              #1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030#1056#176' ('#1056#1118#1056#1116') '#1057#1027' '#1057#1107#1056#1108#1056#176#1056#183#1056#176#1056#1029#1056#1105#1056#181#1056#1112' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056 +
              #1029#1056#1029#1056#1109#1056#8470' '#1057#8222#1056#1109#1057#1026#1056#1112#1057#8249', '#1056#1169#1056#1109#1056#183#1056#1105#1057#1026#1056#1109#1056#1030#1056#1108#1056#1105', '#1057#1107#1056#1111#1056#176#1056#1108#1056#1109#1056#1030#1056#1108#1056#1105)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 208.000000000000000000
          Top = 128.000000000000000000
          Width = 280.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '3')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 488.000000000000000000
          Width = 88.000000000000000000
          Height = 128.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1038#1057#8218#1057#1026#1056#176#1056#1029#1056#176' '#1056#1111#1057#1026#1056#1109#1056#1105#1056#183#1056#1030#1056#1109#1056#1169#1057#1027#1057#8218#1056#1030#1056#176' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#1110 +
              #1056#1109' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030#1056#176)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 488.000000000000000000
          Top = 128.000000000000000000
          Width = 88.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '4')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 576.000000000000000000
          Width = 100.000000000000000000
          Height = 128.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#8217#1056#1109#1056#183#1056#1112#1056#1109#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034' '#1056#183#1056#176#1056#1112#1056#181#1056#1029#1057#8249' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#1110#1056#1109 +
              ' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030#1056#176' ('#1056#1030' '#1057#1026#1056#176#1056#1112#1056#1108#1056#176#1057#8230' '#1056#1114#1056#1116#1056#1116')*')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 576.000000000000000000
          Top = 128.000000000000000000
          Width = 100.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '5')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 676.000000000000000000
          Width = 112.000000000000000000
          Height = 128.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1057#8240#1056#1105#1056#1108#1056#176' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181 +
              #1056#1029#1056#1029#1056#1109#1056#1110#1056#1109' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030#1056#176' ('#1056#1109#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105' '#1056#1109#1056#1111#1057#8218#1056#1109#1056#1030#1056#1109 +
              #1056#8470' '#1057#8218#1056#1109#1057#1026#1056#1110#1056#1109#1056#1030#1056#187#1056#1105' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1056#1112#1056#1105' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030#1056 +
              #176#1056#1112#1056#1105')**')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 676.000000000000000000
          Top = 128.000000000000000000
          Width = 112.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '6')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 788.000000000000000000
          Width = 104.000000000000000000
          Height = 128.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#1105#1057#8225#1056#1105#1056#1029#1057#8249' '#1056#1109#1057#8218#1057#1027#1057#1107#1057#8218#1057#1027#1057#8218#1056#1030#1056#1105#1057#1039' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1057#8230' '#1057 +
              #1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 788.000000000000000000
          Top = 128.000000000000000000
          Width = 104.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '7')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 892.000000000000000000
          Width = 120.000000000000000000
          Height = 128.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1115#1057#1026#1056#1105#1056#181#1056#1029#1057#8218#1056#1105#1057#1026#1056#1109#1056#1030#1056#1109#1057#8225#1056#1029#1057#8249#1056#181' '#1057#1027#1057#1026#1056#1109#1056#1108#1056#1105' '#1056#1030#1056#1109#1056#183#1056#1109#1056#177#1056#1029#1056#1109#1056#1030#1056#187#1056#181#1056#1029 +
              #1056#1105#1057#1039' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1109#1056#1108' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1057#8230' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030)
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 892.000000000000000000
          Top = 128.000000000000000000
          Width = 120.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '8')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 28.000000000000000000
        Top = 492.000000000000000000
        Width = 1028.030348975208000000
        DataSet = frxdsAbsentMedics
        DataSetName = 'frxdsAbsentMedics'
        RowCount = 0
        Stretched = True
        object Memo22: TfrxMemoView
          Width = 56.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[LINE#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 56.000000000000000000
          Width = 152.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxdsAbsentMedics."innr"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 208.000000000000000000
          Width = 280.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            
              '[frxdsAbsentMedics."tradenmr"],  [frxdsAbsentMedics."drugfmnmrs"' +
              '],  [frxdsAbsentMedics."dosager"], [frxdsAbsentMedics."pack"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 488.000000000000000000
          Width = 88.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 576.000000000000000000
          Width = 100.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 676.000000000000000000
          Width = 112.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 788.000000000000000000
          Width = 104.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 892.000000000000000000
          Width = 120.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 232.000000000000000000
        Top = 580.000000000000000000
        Width = 1028.030348975208000000
        object Memo30: TfrxMemoView
          Top = 12.000000000000000000
          Width = 1028.000000000000000000
          Height = 36.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '  * - '#1056#1030' '#1057#1027#1056#187#1057#1107#1057#8225#1056#176#1056#181' '#1056#1030#1056#1109#1056#183#1056#1112#1056#1109#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105' '#1056#183#1056#176#1056#1112#1056#181#1056#1029#1057#8249' '#1056#1109#1057#8218#1057#1027 +
              #1057#1107#1057#8218#1057#1027#1057#8218#1056#1030#1057#1107#1057#1035#1057#8240#1056#181#1056#1110#1056#1109' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#1110#1056#1109' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218 +
              #1056#1030#1056#176' '#1056#1029#1056#181#1056#1109#1056#177#1057#8230#1056#1109#1056#1169#1056#1105#1056#1112#1056#1109' '#1057#1107#1056#1108#1056#176#1056#183#1056#176#1057#8218#1057#1034' '#1056#1105#1056#1029#1056#1109#1056#181' '#1057#8218#1056#1109#1057#1026#1056#1110#1056#1109#1056#1030#1056#1109 +
              #1056#181' '#1056#1029#1056#176#1056#183#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#1110#1056#1109' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030#1056 +
              #176', '#1056#1105#1056#1112#1056#181#1057#1035#1057#8240#1056#181#1056#181#1057#1027#1057#1039' '#1056#1030' '#1056#1029#1056#176#1056#187#1056#1105#1057#8225#1056#1105#1056#1105' '#1056#1030' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1056#1111#1057#1026#1056#1109#1056#1030 +
              #1056#181#1056#1169#1056#181#1056#1029#1056#1105#1057#1039' '#1056#1112#1056#1109#1056#1029#1056#1105#1057#8218#1056#1109#1057#1026#1056#1105#1056#1029#1056#1110#1056#176' ('#1056#1030' '#1056#1111#1057#1026#1056#181#1056#1169#1056#181#1056#187#1056#176#1057#8230' '#1056#1112#1056#181#1056#182#1056 +
              #1169#1057#1107#1056#1029#1056#176#1057#1026#1056#1109#1056#1169#1056#1029#1056#1109#1056#1110#1056#1109' '#1056#1029#1056#181#1056#1111#1056#176#1057#8218#1056#181#1056#1029#1057#8218#1056#1109#1056#1030#1056#176#1056#1029#1056#1029#1056#1109#1056#1110#1056#1109' '#1056#1029#1056#176#1056#183#1056#1030#1056 +
              #176#1056#1029#1056#1105#1057#1039')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Top = 56.000000000000000000
          Width = 1028.000000000000000000
          Height = 36.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '  ** - '#1056#1111#1057#1026#1056#1105' '#1056#183#1056#176#1056#1111#1056#1109#1056#187#1056#1029#1056#181#1056#1029#1056#1105#1056#1105' '#1056#1169#1056#176#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1110#1057#1026#1056#176#1057#8222#1057#8249' '#1056#1029#1056#181#1056 +
              #1109#1056#177#1057#8230#1056#1109#1056#1169#1056#1105#1056#1112#1056#1109' '#1057#1107#1056#1108#1056#176#1056#183#1057#8249#1056#1030#1056#176#1057#8218#1057#1034' '#1056#1109#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105' '#1056#1109#1056#1111#1057#8218 +
              #1056#1109#1056#1030#1056#1109#1056#8470' '#1057#8218#1056#1109#1057#1026#1056#1110#1056#1109#1056#1030#1056#187#1056#1105' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1056#1112#1056#1105' '#1057#1027#1057#1026#1056#181#1056#1169#1057 +
              #1027#1057#8218#1056#1030#1056#176#1056#1112#1056#1105', '#1057#1039#1056#1030#1056#187#1057#1039#1057#1035#1057#8240#1056#1105#1056#181#1057#1027#1057#1039' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1057#8240#1056#1105#1056#1108#1056#176#1056#1112#1056#1105' '#1056#1108#1056#1109#1056 +
              #1029#1056#1108#1057#1026#1056#181#1057#8218#1056#1029#1056#1109#1056#1110#1056#1109' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#1110#1056#1109' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030#1056#176' ' +
              '('#1056#1111#1056#1109' '#1057#8218#1056#1109#1057#1026#1056#1110#1056#1109#1056#1030#1056#1109#1056#1112#1057#1107' '#1056#1029#1056#176#1056#183#1056#1030#1056#176#1056#1029#1056#1105#1057#1035'), '#1057#1107' '#1056#1108#1056#1109#1057#8218#1056#1109#1057#1026#1057#8249#1057#8230' '#1056#1029 +
              #1056#176' '#1056#1112#1056#1109#1056#1112#1056#181#1056#1029#1057#8218' '#1056#1111#1057#1026#1056#1109#1056#1030#1056#181#1056#1169#1056#181#1056#1029#1056#1105#1057#1039' '#1056#1112#1056#1109#1056#1029#1056#1105#1057#8218#1056#1109#1057#1026#1056#1105#1056#1029#1056#1110#1056#176' '#1056#1109#1057#8218 +
              #1057#1027#1057#1107#1057#8218#1057#1027#1057#8218#1056#1030#1057#1107#1057#1035#1057#8218' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1056#181' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 32.000000000000000000
          Top = 92.000000000000000000
          Width = 404.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#160#1057#1107#1056#1108#1056#1109#1056#1030#1056#1109#1056#1169#1056#1105#1057#8218#1056#181#1056#187#1057#1034' '#1057#8218#1056#181#1057#1026#1057#1026#1056#1105#1057#8218#1056#1109#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109#1056#1110#1056#1109' '#1057#1107#1056#1111#1057#1026 +
              #1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#1039' '#1056#160#1056#1109#1057#1027#1056#183#1056#1169#1057#1026#1056#176#1056#1030#1056#1029#1056#176#1056#1169#1056#183#1056#1109#1057#1026#1056#176)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo33: TfrxMemoView
          Left = 484.000000000000000000
          Top = 120.000000000000000000
          Width = 104.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 628.000000000000000000
          Top = 120.000000000000000000
          Width = 180.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#164'.'#1056#152'.'#1056#1115'.)')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 808.000000000000000000
          Top = 92.000000000000000000
          Width = 84.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114'.'#1056#1119'.')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo36: TfrxMemoView
          Top = 136.000000000000000000
          Width = 96.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#152#1057#1027#1056#1111#1056#1109#1056#187#1056#1029#1056#1105#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo37: TfrxMemoView
          Left = 328.000000000000000000
          Top = 164.000000000000000000
          Width = 120.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 484.000000000000000000
          Top = 164.000000000000000000
          Width = 284.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#164'.'#1056#152'.'#1056#1115'.)')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 96.000000000000000000
          Top = 164.000000000000000000
          Width = 184.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 96.000000000000000000
          Top = 204.000000000000000000
          Width = 184.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8218#1056#181#1056#187#1056#181#1057#8222#1056#1109#1056#1029')')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 328.000000000000000000
          Top = 204.000000000000000000
          Width = 260.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1042#171'____'#1042#187' _____________________  20 ___')
          ParentFont = False
        end
      end
    end
  end
  object frxdsAbsentMedics: TfrxDBDataset
    UserName = 'frxdsAbsentMedics'
    CloseDataSource = False
    DataSet = odsAbsentMedics
    BCDToCurrency = False
    Left = 544
    Top = 288
  end
  object odsAbsentMedics: TOracleDataSet
    SQL.Strings = (
      'WITH T AS'
      '(SELECT MIN(A.FK_ID) OVER(PARTITION BY A.INNR) FK_MINID,'
      '       A.FK_ID, '
      '       A.INNR'
      ''
      '  FROM MED.TPRICE_MONITOR_BASE A'
      ' WHERE NOT EXISTS (SELECT O.FK_ID'
      '                     FROM MED.TPRICE_MONITOR_OST O'
      '                    WHERE O.FK_TPRICE_MONITOR_BASE_ID = A.FK_ID'
      '                      AND O.FD_DATE = :PDATE'
      '                      AND O.FK_MOGROUP = :PFK_MOGROUP)'
      ':pMINUS_BY_MNN'
      
        '   /*AND NOT EXISTS (SELECT 1 --'#1080#1089#1082#1083#1102#1095#1072#1077#1090' '#1087#1086#1074#1090#1086#1088#1077#1085#1080#1077' '#1087#1086' '#1052#1053#1053', '#1076#1083#1103 +
        ' '#1091#1078#1077' '#1074#1082#1083#1102#1095#1077#1085#1085#1099#1093' '#1074' '#1084#1086#1085#1080#1090#1086#1088#1080#1085#1075', '#1090'.'#1077'. '#1077#1089#1083#1080' "'#1040#1079#1080#1090#1088#1086#1084#1080#1094#1080#1085'" '#1073#1099#1083' '#1074#1082#1083#1102#1095#1077 +
        #1085' '#1074' '#1084#1086#1085#1080#1090#1086#1088#1080#1085#1075', '#1090#1086' '#1074#1089#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1099' '#1089' '#1052#1053#1053'="'#1040#1079#1080#1090#1088#1086#1084#1080#1094#1080#1085'" '#1085#1091#1078#1085#1086' '#1080#1089#1082#1083#1102 +
        #1095#1080#1090#1100
      
        '                     FROM MED.TPRICE_MONITOR_BASE B, MED.TPRICE_' +
        'MONITOR_OST O'
      '                    WHERE O.FK_TPRICE_MONITOR_BASE_ID = B.FK_ID'
      '                      AND O.FD_DATE = :PDATE'
      '                      --AND O.FK_MOGROUP = :PFK_MOGROUP'
      '                      AND B.INNR = A.INNR)*/'
      ')'
      ' '
      'SELECT DISTINCT A.DRUGID,'
      '       A.PACKNX,'
      '       A.TRADENMR,'
      '       A.INNR,'
      '       A.MNFNM,'
      '       A.DRUGFMNMRS,'
      '       A.PACK,'
      '       A.SEGMENT,'
      '       A.DOSAGER,'
      '       A.MAXMNFPRICE,'
      '       A.CURRENCYNM,'
      '       A.MNFID,'
      '       A.PCKID,'
      '       A.EAN,'
      '       A.TOTDRUGQN'
      '  FROM MED.TPRICE_MONITOR_BASE A, T'
      
        ' WHERE A.FK_ID = :pFIELDNAME --T.FK_MINID - '#1101#1090#1086' '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1077' '#1052#1053#1053', ' +
        'T.FK_ID - '#1074#1089#1077
      ' ORDER BY upper(INNR)')
    Optimize = False
    Variables.Data = {
      0300000004000000060000003A50444154450C00000000000000000000000C00
      00003A50464B5F4D4F47524F55500300000000000000000000000E0000003A50
      4D494E55535F42595F4D4E4E0100000000000000000000000B0000003A504649
      454C444E414D45010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000009000000060000005041434B4E580100000000000900000054524144
      454E414D45010000000000030000004D4E4E0100000000000C00000050524F49
      5A564F444954454C0100000000000C0000004C454B464F524D5F444F5A410100
      00000000080000005550414B4F564B410100000000000600000055524F56454E
      010000000000070000005345474D454E54010000000000090000004F53545F43
      4F554E54010000000000}
    Cursor = crSQLWait
    UniqueFields = 'packnx'
    Session = os
    AfterOpen = odsPriceMonitorBASEAfterOpen
    BeforeClose = odsPriceMonitorBASEBeforeClose
    Left = 542
    Top = 348
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 624
    Top = 240
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 624
    Top = 312
  end
  object pmExportTableOst: TPopupMenu
    Left = 312
    Top = 312
    object miOstToExcel: TMenuItem
      Caption = #1058#1072#1073#1083#1080#1094#1091' '#1074' Excel'
      OnClick = miOstToExcelClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object miVendorID: TMenuItem
      Caption = #1044#1086#1086#1073#1085#1086#1074#1080#1090#1100' '#1074' '#1086#1089#1090#1072#1090#1082#1072#1093' VendorID'
      OnClick = miVendorIDClick
    end
  end
  object odCSV: TOpenDialog
    DefaultExt = 'csv'
    FileName = 'pmon2_s2_drugs.csv'
    Filter = '*.csv|*.csv'
    Left = 336
    Top = 200
  end
  object oqIns_TPrice_monitor_base: TOracleQuery
    SQL.Strings = (
      'declare'
      '  IsNeedIns NUMBER;'
      '  n NUMBER;'
      'begin'
      '  IsNeedIns := 1;'
      '  if :FL_ADD_AND_UPDATE = 1 then'
      '    select count(1) into n from med.TPRICE_MONITOR_BASE a '
      '    where a.packnx = :packnx and '
      '          nvl(a.mnfnm,'#39' '#39') = nvl(:mnfnm, '#39' '#39') and'
      '          nvl(a.PCKNM,'#39' '#39') = nvl(:PCKNM, '#39' '#39');'
      '    if n > 0 then'
      '      IsNeedIns := 0; '
      '      update med.TPRICE_MONITOR_BASE a '
      '      set DrugId = :drugid'
      '      where a.packnx = :packnx and '
      '            nvl(a.mnfnm,'#39' '#39') = nvl(:mnfnm, '#39' '#39') and'
      '            nvl(a.PCKNM,'#39' '#39') = nvl(:PCKNM, '#39' '#39');'
      '    end if;'
      '  end if;'
      ''
      '  if IsNeedIns > 0 then'
      
        '    insert into med.TPRICE_MONITOR_BASE (DrugId, packnx, tradenm' +
        'r, innr, mnfnm, drugfmnmrs, pack,'
      
        '                                    segment, dosager, maxmnfpric' +
        'e, currencynm, mnfid,'
      
        '                                    pckid, PCKNM, ean, totdrugqn' +
        ')'
      
        '                values(:drugid, :packnx, :tradenmr, :innr, :mnfn' +
        'm, :drugfmnmrs, :pack,'
      
        '                       :segment, :dosager, :maxmnfprice, :curren' +
        'cynm, :mnfid,'
      '                       :pckid, :PCKNM, :ean, :totdrugqn);'
      '  end if;'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000011000000070000003A5041434B4E5803000000000000000000000009
      0000003A54524144454E4D52050000000000000000000000050000003A494E4E
      52050000000000000000000000060000003A4D4E464E4D050000000000000000
      0000000B0000003A44525547464D4E4D52530500000000000000000000000500
      00003A5041434B050000000000000000000000080000003A5345474D454E5403
      0000000000000000000000080000003A444F5341474552050000000000000000
      0000000C0000003A4D41584D4E4650524943450400000000000000000000000B
      0000003A43555252454E43594E4D050000000000000000000000060000003A4D
      4E464944030000000000000000000000060000003A50434B4944030000000000
      000000000000040000003A45414E0500000000000000000000000A0000003A54
      4F5444525547514E040000000000000000000000060000003A50434B4E4D0500
      00000000000000000000070000003A4452554749440300000000000000000000
      00120000003A464C5F4144445F414E445F555044415445030000000400000000
      00000000000000}
    Cursor = crSQLWait
    Left = 406
    Top = 200
  end
  object oqClear_TPrice_monitor_base: TOracleQuery
    SQL.Strings = (
      ' delete from med.TPRICE_MONITOR_BASE')
    Session = os
    Optimize = False
    Cursor = crSQLWait
    Left = 406
    Top = 248
  end
  object oqUpdateVendorID: TOracleQuery
    SQL.Strings = (
      'declare'
      '  VENDOR MED.tprice_monitor_ost.VENDOR%TYPE;'
      '  VENDORID MED.tprice_monitor_ost.VENDORID%TYPE;'
      ''
      'begin'
      '  :pDate := Trunc(:pDate);'
      '  med.pkg_medses.set_curmo_group(:nMO_GROUP);'
      ''
      '  update med.TPRICE_MONITOR_OST o'
      
        '  set o.postavid = (select p.postavid from med.tpostav p where p' +
        '.fc_name = o.vendor)'
      
        '  where o.FD_DATE = :pDate and o.FK_MOGROUP = :nMO_GROUP and o.p' +
        'ostavid is null;'
      ''
      '  update med.TPRICE_MONITOR_OST o'
      
        '  set o.vendorid = (select p.FC_PM_VENDOR_ID from med.tpostav p ' +
        'where p.postavid = o.postavid)'
      
        '  where o.FD_DATE = :pDate and o.FK_MOGROUP = :nMO_GROUP and o.p' +
        'ostavid is not null;  '
      '  '
      '  commit;'
      'end;'
      '')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A50444154450C00000000000000000000000A00
      00003A4E4D4F5F47524F5550030000000000000000000000}
    Cursor = crSQLWait
    Left = 222
    Top = 376
  end
  object oqPKG_SMINI: TOracleQuery
    SQL.Strings = (
      'begin'
      '  if :pValue is null then'
      '    if :pdefault is null then :pdefault := '#39#39'; end if;'
      
        '    :pValue := asu.PKG_SMINI.readstring(:psection,:pident,:pdefa' +
        'ult);'
      '  else'
      '    asu.PKG_SMINI.WRITESTRING( :psection, :pident, :pvalue);'
      '    commit;'
      '  end if;'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000004000000070000003A5056414C554505000000000000000000000009
      0000003A5053454354494F4E050000000000000000000000070000003A504944
      454E54050000000000000000000000090000003A5044454641554C5405000000
      0000000000000000}
    Left = 720
    Top = 84
  end
  object odsExportWithDecode: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      
        '/*       b.packnx, '#39#39' as MnfID, '#39#39' as PckID, b.tradename, b.mnn,' +
        ' b.proizvoditel, b.lekform_doza,'
      '       b.upakovka, b.uroven, b.segment,'
      '*/'
      '       b.drugid, '
      '       b.packnx, '
      '       b.tradenmr, --b.innr, b.mnfnm, b.drugfmnmrs, b.pack,'
      '--       b.dosager, b.maxmnfprice, b.currencynm, '
      '       b.mnfid, b.pckid, b.segment, b.pcknm, b.totdrugqn,'
      
        '       DECODE(b.segment, 1, '#39#1040#1084#1073#1091#1083#1072#1090#1086#1088#1085#1099#1081#39', 2, '#39#1043#1086#1089#1087#1080#1090#1072#1083#1100#1085#1099#1081#39', '#39 +
        #39') decodesegment,'
      '--       b.ean,'
      ''
      ''
      
        '       a.year, a.month, a.irecid, '#39'"'#39'||nvl(a.series,'#39'-'#39')||'#39'"'#39' as' +
        ' series, a.quantity,'
      
        '       a.funds, a.vendorid, nvl(a.FN_MNF_PRICE,0) as MnfPrice, a' +
        '.prcprice, a.rtlprice, '
      '       a.proizvoditel, a.vendor,'
      '--       a.rtlpremium,'
      '       a.remark, a.srcorg'
      
        '--       ,a.fk_id, a.packnx, a.fk_medicid, a.fk_kartid, a.fd_dat' +
        'e, a.proizvoditel, a.fk_mogroup, a.ipv '
      ''
      ''
      '  FROM med.tprice_monitor_ost a, med.tprice_monitor_base b'
      '  WHERE'
      '        a.fd_date = :pDate and a.fk_mogroup = :pfk_mogroup'
      '--    and a.packnx is not null'
      '--    and a.packnx = b.packnx'
      '    and a.FK_TPRICE_MONITOR_BASE_ID = b.fk_id'
      '')
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A50444154450C00000000000000000000000C00
      00003A50464B5F4D4F47524F5550030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000016000000060000005041434B4E580100000000000400000059454152
      010000000000050000004D4F4E54480100000000000600000049524543494401
      000000000006000000534552494553010000000000080000005155414E544954
      590100000000000500000046554E445301000000000008000000505243505249
      43450100000000000800000052544C5052494345010000000000060000005245
      4D41524B010000000000060000005352434F52470100000000000C0000005052
      4F495A564F444954454C010000000000070000005345474D454E540100000000
      000800000056454E444F524944010000000000080000004D4E46505249434501
      0000000000060000004452554749440100000000000800000054524144454E4D
      52010000000000050000004D4E4649440100000000000500000050434B494401
      00000000000D0000004445434F44455345474D454E5401000000000006000000
      56454E444F520100000000000500000050434B4E4D010000000000}
    Session = os
    Left = 152
    Top = 166
    object FloatField1: TFloatField
      FieldName = 'DrugId'
      Visible = False
    end
    object FloatField2: TFloatField
      DisplayLabel = 'PackNx'
      DisplayWidth = 7
      FieldName = 'PACKNX'
      Visible = False
    end
    object StringField1: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
      DisplayWidth = 30
      FieldName = 'TRADENMR'
      Size = 120
    end
    object FloatField3: TFloatField
      FieldName = 'MnfID'
      Visible = False
    end
    object StringField2: TStringField
      DisplayLabel = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      DisplayWidth = 30
      FieldName = 'PROIZVODITEL'
      Size = 300
    end
    object FloatField4: TFloatField
      FieldName = 'PckID'
      Visible = False
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Segment'
      DisplayWidth = 6
      FieldName = 'SEGMENT'
      Visible = False
    end
    object odsExportWithDecodePCKNM: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1087#1072#1082#1086#1074#1097#1080#1082#1072
      DisplayWidth = 25
      FieldName = 'PCKNM'
      Size = 300
    end
    object StringField3: TStringField
      DisplayLabel = #1057#1077#1075#1084#1077#1085#1090
      FieldName = 'DECODESEGMENT'
      Size = 12
    end
    object IntegerField1: TIntegerField
      DisplayLabel = #1043#1086#1076
      DisplayWidth = 6
      FieldName = 'YEAR'
    end
    object IntegerField2: TIntegerField
      DisplayLabel = #1052#1077#1089#1103#1094
      DisplayWidth = 6
      FieldName = 'MONTH'
    end
    object StringField4: TStringField
      DisplayLabel = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1079#1072#1087#1080#1089#1080
      DisplayWidth = 12
      FieldName = 'IRECID'
    end
    object StringField5: TStringField
      DisplayLabel = #1057#1077#1088#1080#1080
      DisplayWidth = 25
      FieldName = 'SERIES'
      Size = 350
    end
    object FloatField6: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1091#1087#1072#1082#1086#1074#1086#1082
      DisplayWidth = 7
      FieldName = 'QUANTITY'
    end
    object FloatField7: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072', '#1088#1091#1073
      DisplayWidth = 10
      FieldName = 'FUNDS'
    end
    object StringField6: TStringField
      DisplayLabel = 'VendorID'
      DisplayWidth = 15
      FieldName = 'VENDORID'
      Visible = False
      Size = 15
    end
    object StringField7: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 30
      FieldName = 'VENDOR'
      Size = 100
    end
    object FloatField8: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103' '#1080#1083#1080' '#1080#1084#1087#1086#1088#1090#1077#1088#1072
      FieldName = 'MNFPRICE'
    end
    object FloatField9: TFloatField
      DisplayLabel = #1047#1072#1082#1091#1087#1086#1095#1085#1072#1103' '#1094#1077#1085#1072' 1 '#1091#1087#1072#1082#1086#1074#1082#1080', '#1088#1091#1073
      DisplayWidth = 7
      FieldName = 'PRCPRICE'
    end
    object FloatField10: TFloatField
      DisplayLabel = #1056#1086#1079#1085#1080#1095#1085#1072#1103' '#1094#1077#1085#1072' 1 '#1091#1087#1072#1082#1086#1074#1082#1080', '#1088#1091#1073
      DisplayWidth = 7
      FieldName = 'RTLPRICE'
    end
    object StringField8: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 35
      FieldName = 'REMARK'
      Size = 150
    end
    object StringField9: TStringField
      DisplayLabel = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103', '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1083#1103#1102#1097#1072#1103' '#1089#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1094#1077#1085#1077
      DisplayWidth = 20
      FieldName = 'SRCORG'
      Size = 100
    end
  end
  object oqGetOst: TOracleQuery
    SQL.Strings = (
      'begin'
      '    :PDATE := TRUNC(:PDATE);'
      '    MED.PKG_MEDSES.RESETDATEPERIOD;'
      '    MED.PKG_MEDSES.SET_DATA2(:PDATE);'
      '    MED.PKG_MEDSES.SET_CURMO_GROUP(:NMO_GROUP);'
      ''
      '    delete from MED.TPRICE_MONITOR_OST'
      '     where FD_DATE = :PDATE'
      '       and FK_MOGROUP = :NMO_GROUP;'
      '    commit;'
      '  '
      '  EXECUTE IMMEDIATE'
      ' '#39'INSERT INTO MED.TPRICE_MONITOR_OST'
      '    (PACKNX,'
      '     FK_TPRICE_MONITOR_BASE_ID,'
      '     YEAR,'
      '     MONTH,'
      '     IRECID,'
      '     SERIES,'
      '     QUANTITY,'
      '     FUNDS,'
      '     VENDOR,'
      '     VENDORID,'
      '     PRCPRICE,'
      '     RTLPRICE,'
      '     RTLPREMIUM,'
      '     FK_MEDICID,'
      '     FK_KARTID,'
      '     FD_DATE,'
      '     FK_MOGROUP,'
      '     PROIZVODITEL,'
      '     FN_MNF_PRICE,'
      '     FN_PRICE,'
      '     POSTAVID)'
      '     '
      '    SELECT PACKNX,'
      '           FK_TPRICE_MONITOR_BASE_ID,'
      '           YEAR,'
      '           MONTH,'
      
        '           MAX(IRECID) IRECID, --'#1085#1077#1072#1082#1090#1091#1072#1083#1100#1085#1072', '#1077#1089#1083#1080' '#1077#1089#1090#1100' '#1085#1077#1089#1082#1086#1083#1100#1082 +
        #1086' '#1082#1072#1088#1090#1086#1095#1077#1082
      '           ASU.STRING_AGG(DISTINCT SERIES) SERIES,'
      '           SUM(QUANTITY) QUANTITY,'
      '           SUM(FUNDS) FUNDS,'
      '           VENDOR,'
      '           VENDORID,'
      '           PRCPRICE,'
      '           RTLPRICE,'
      '           RTLPREMIUM,'
      '           MEDICID,'
      
        '           MAX(KARTID) KARTID, --'#1085#1077#1072#1082#1090#1091#1072#1083#1100#1085#1072', '#1077#1089#1083#1080' '#1077#1089#1090#1100' '#1085#1077#1089#1082#1086#1083#1100#1082 +
        #1086' '#1082#1072#1088#1090#1086#1095#1077#1082
      '           FD_DATE,'
      '           FK_MOGROUP,'
      '           FC_PROD,'
      '           MNFPRICE,'
      '           FN_PRICE,'
      '           POSTAVID'
      '      FROM ( select O.FC_MEDIC,'
      '                     O.PACKNX,'
      '                     O.FK_TPRICE_MONITOR_BASE_ID,'
      
        '                     TO_NUMBER(TO_CHAR(MED.PKG_MEDSES.GET_DATA2,' +
        ' '#39#39'YYYY'#39#39')) as "YEAR",'
      
        '                     TO_NUMBER(TO_CHAR(MED.PKG_MEDSES.GET_DATA2,' +
        ' '#39#39'MM'#39#39')) as "MONTH",'
      
        '                     TO_CHAR(O.MEDICID) || '#39#39'_'#39#39' || TO_CHAR(O.KA' +
        'RTID) as IRECID,'
      '                     O.FC_SERIAL as SERIES,'
      
        '                     --med.GET_KART_FC_SERIAL_LST( o.MEDICID, p.' +
        'postavid ) as Series,'
      '                     sum(O.FN_KOLOST) as QUANTITY,'
      '                     O.FN_PRICE,'
      '                     sum(O.FN_PRICE * O.FN_KOLOST) as FUNDS,'
      '                     P.POSTAVID,'
      '                     P.FC_NAME as VENDOR,'
      '                     P.FC_PM_VENDOR_ID as VENDORID,'
      
        '                     nvl ( (select max (b.MAXMNFPRICE) from med.' +
        'TPRICE_MONITOR_BASE b where b.PACKNX = o.PACKNX), 0 ) as MNFPRIC' +
        'E,'
      '                     0 as RTLPRICE,'
      '                     NVL(O.FN_PRICE, 0) as PRCPRICE,'
      '                     O.FN_NACENKA as RTLPREMIUM,'
      '                     '
      '                     '#39#39' as "Remark",'
      '                     '#39#39' as SRCORG,'
      '                     2 as IPV,'
      '                     -- o.kartid,'
      
        '                     --med.GET_KART_FC_SERIAL_LST( o.MEDICID, p.' +
        'postavid ) as all_ser,'
      '                     O.FC_PROD,'
      '                     O.MEDICID,'
      '                     O.KARTID,'
      
        '                     TRUNC(MED.PKG_MEDSES.GET_DATA2)   as FD_DAT' +
        'E,'
      
        '                     MED.PKG_MEDSES.GET_CUR_MOGROUP as FK_MOGROU' +
        'P'
      '              '
      '                from (select A.KARTID,'
      '                             A.FC_SERIAL,'
      '                             A.MOID,'
      '                             A.MEDICID,'
      '                             A.FC_MEDIC,'
      '                             A.FC_UEDIZM,'
      '                             A.FN_FPACKINUPACK,'
      '                             A.FC_FEDIZM,'
      '                             A.FN_KOLOST,'
      '                             A.FN_PRICE,'
      '                             A.FN_SUMM,'
      '                             A.FC_PROD,'
      '                             A.FN_PRICE_MNF,'
      '                             A.FN_NACENKA,'
      '                             A.FL_JNVLS,'
      
        '                             (SELECT MAX(PACKNX) FROM MED.TPRICE' +
        '_MONITOR_BASE WHERE DRUGID = A.DRUGID) as PACKNX,'
      
        '                             (SELECT MAX(FK_ID) FROM MED.TPRICE_' +
        'MONITOR_BASE WHERE DRUGID = A.DRUGID) as FK_TPRICE_MONITOR_BASE_' +
        'ID,'
      '                             (select min ( D.DPID ) as DPID'
      '                                from MED.TDOCS D, MED.TDPC DP'
      '                               where D.FP_VID = 1'
      '                                 and D.DPID = DP.DPID'
      
        '                                 and DP.KARTID = A.KARTID) as PR' +
        'IHDOCID'
      '                      '
      '                        from MED.VMEDKART_VS_OST A'
      '                       where A.FN_KOLOST > 0 ) O,'
      '                     MED.TDOCS D,'
      '                     MED.TPOSTAV P,'
      '                     MED.TMEDIC M'
      '              '
      '               where O.PRIHDOCID = D.DPID(+)'
      '                 and D.POSTAVID = P.POSTAVID(+)'
      '                 and O.MEDICID = M.MEDICID'
      '                 and nvl ( O.FL_JNVLS, M.FL_JNVLS ) = 1'
      '               --  and o.medicid = 97817'
      '               group by O.MEDICID,'
      '                        O.FC_MEDIC,'
      '                        O.FC_SERIAL,'
      '                        O.KARTID,'
      '                        O.FN_PRICE,'
      '                        P.POSTAVID,'
      '                        P.FC_NAME,'
      '                        P.FC_PM_VENDOR_ID,'
      '                        O.FC_PROD,'
      '                        O.FN_PRICE_MNF,'
      '                        O.FN_NACENKA,'
      '                        O.PACKNX,'
      
        '                        O.FK_TPRICE_MONITOR_BASE_ID             ' +
        '           '
      '               order by P.POSTAVID,'
      '                        O.FC_PROD,'
      '                        O.MEDICID,'
      '                        O.FN_PRICE,                        '
      '                        O.FC_SERIAL )'
      '     GROUP BY PACKNX,'
      '              FK_TPRICE_MONITOR_BASE_ID,'
      '              YEAR,'
      '              MONTH,'
      '              --IRECID,'
      '              VENDOR,'
      '              VENDORID,'
      '              PRCPRICE,'
      '              RTLPRICE,'
      '              RTLPREMIUM,'
      '              MEDICID,'
      '              --KARTID,'
      '              FD_DATE,'
      '              FK_MOGROUP,'
      '              FC_PROD,'
      '              MNFPRICE,'
      '              FN_PRICE,'
      '              POSTAVID'#39';                           '
      '   '
      ''
      '    commit;'
      '    '
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A50444154450C0000000700000078710C0F0101
      01000000000A0000003A4E4D4F5F47524F555003000000040000009807000000
      000000}
    Cursor = crSQLWait
    Left = 22
    Top = 200
  end
end
