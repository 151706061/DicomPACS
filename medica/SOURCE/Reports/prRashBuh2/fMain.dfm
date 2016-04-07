object frmMain: TfrmMain
  Left = 479
  Top = 176
  HelpContext = 35
  Caption = #1046#1091#1088#1085#1072#1083' '#1088#1072#1089#1093#1086#1076#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  ClientHeight = 791
  ClientWidth = 881
  Color = clBtnFace
  Constraints.MinHeight = 222
  Constraints.MinWidth = 591
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
  Menu = MainMenu1
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
    Width = 881
    Height = 48
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 44
        Width = 875
      end>
    Images = ilImages
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 868
      Height = 44
      AutoSize = True
      ButtonHeight = 44
      ButtonWidth = 92
      Caption = 'ToolBar1'
      Images = ilImages
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton2: TToolButton
        Left = 0
        Top = 0
        Action = aCancel
        AutoSize = True
        ParentShowHint = False
        ShowHint = True
      end
      object tbuPrint: TToolButton
        Left = 55
        Top = 0
        Action = acPrint
        AutoSize = True
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton3: TToolButton
        Left = 102
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object cxGroupBox2: TcxGroupBox
        Left = 110
        Top = 0
        Align = alLeft
        Caption = ' '#1042#1080#1076' '#1086#1090#1095#1077#1090#1072' '
        TabOrder = 0
        Height = 44
        Width = 220
        object cmbReport: TcxComboBox
          Left = 4
          Top = 12
          Properties.DropDownListStyle = lsEditFixedList
          Properties.ImmediatePost = True
          Properties.OnChange = cmbReportPropertiesChange
          TabOrder = 0
          Width = 212
        end
      end
      object ToolButton4: TToolButton
        Left = 330
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbuTableToExcel: TToolButton
        Left = 338
        Top = 0
        Action = acGridToExcel
        AutoSize = True
      end
      object tbuUchGrSep: TToolButton
        Left = 384
        Top = 0
        Width = 8
        ImageIndex = 5
        Style = tbsSeparator
        Visible = False
      end
      object tbuUchGrSelect: TToolButton
        Left = 392
        Top = 0
        AutoSize = True
        Caption = #1059#1095#1077#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
        DropdownMenu = pmUchGr
        ImageIndex = 5
        Style = tbsDropDown
        Visible = False
        OnClick = tbuUchGrSelectClick
      end
      object tbuFinSourceSep: TToolButton
        Left = 503
        Top = 0
        Width = 8
        ImageIndex = 8
        Style = tbsSeparator
        Visible = False
      end
      object tbuFinSource: TToolButton
        Left = 511
        Top = 0
        AutoSize = True
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089'-'#1080#1103
        DropdownMenu = pmFinSource
        ImageIndex = 5
        Style = tbsDropDown
        Visible = False
        OnClick = tbuFinSourceClick
      end
      object tbuProfilSep: TToolButton
        Left = 621
        Top = 0
        Width = 8
        Caption = 'tbuProfilSep'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbuProfil: TToolButton
        Left = 629
        Top = 0
        AutoSize = True
        Caption = #1055#1088#1086#1092#1080#1083#1080
        DropdownMenu = pmProfil
        ImageIndex = 5
        Style = tbsDropDown
        Visible = False
      end
      object tbuRPO: TToolButton
        Left = 707
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object chbRPO: TcxCheckBox
        Left = 715
        Top = 0
        Align = alLeft
        Caption = #1056#1055#1054
        TabOrder = 1
        OnClick = chbRPOClick
        Width = 56
      end
      object ToolButton1: TToolButton
        Left = 771
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 8
        Style = tbsSeparator
      end
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 48
    Width = 881
    Height = 743
    Align = alClient
    TabOrder = 1
    object grViewRashDocPoMedic: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGrid
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = #1057#1091#1084#1084#1072': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewRashDocPoMedicFN_SUMM
        end
        item
          Format = #1057#1091#1084#1084#1072': ,0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grViewRashDocPoMedicFN_SUMM
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0'
          FieldName = 'FN_PRICE_MASTER'
          Column = grViewRashDocPoMedicNAMEPOSTAV
        end
        item
          Format = #1048#1090#1086#1075#1086': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewRashDocPoMedicFN_SUMM
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object grViewRashDocPoMedicFN_PRICE_MASTER: TcxGridDBColumn
        DataBinding.FieldName = 'FN_PRICE_MASTER'
        Visible = False
        Width = 86
      end
      object grViewRashDocPoMedicFP_VIDMOVE: TcxGridDBColumn
        DataBinding.FieldName = 'FP_VIDMOVE'
        Visible = False
      end
      object grViewRashDocPoMedicPOSTAVID: TcxGridDBColumn
        DataBinding.FieldName = 'POSTAVID'
        Visible = False
      end
      object grViewRashDocPoMedicMOTOID: TcxGridDBColumn
        DataBinding.FieldName = 'MOTOID'
        Visible = False
      end
      object grViewRashDocPoMedicMOFROMID: TcxGridDBColumn
        DataBinding.FieldName = 'MOFROMID'
        Visible = False
      end
      object grViewRashDocPoMedicFC_COMMENT: TcxGridDBColumn
        DataBinding.FieldName = 'FC_COMMENT'
        Visible = False
      end
      object grViewRashDocPoMedicFP_VID: TcxGridDBColumn
        DataBinding.FieldName = 'FP_VID'
        Visible = False
      end
      object grViewRashDocPoMedicMOOWNERID: TcxGridDBColumn
        DataBinding.FieldName = 'MOOWNERID'
        Visible = False
      end
      object grViewRashDocPoMedicDPID: TcxGridDBColumn
        DataBinding.FieldName = 'DPID'
        Visible = False
      end
      object grViewRashDocPoMedicFC_DOC: TcxGridDBColumn
        DataBinding.FieldName = 'FC_DOC_SUMM'
        Visible = False
        GroupIndex = 2
        SortIndex = 3
        SortOrder = soAscending
        Width = 139
        IsCaptionAssigned = True
      end
      object grViewRashDocPoMedicDATA: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'DATA'
        Visible = False
      end
      object grViewRashDocPoMedicFD_DATA: TcxGridDBColumn
        DataBinding.FieldName = 'FD_DATA'
        Visible = False
        SortIndex = 2
        SortOrder = soAscending
      end
      object grViewRashDocPoMedicNAMEPOSTAV: TcxGridDBColumn
        DataBinding.FieldName = 'FC_POLUCH_SUM'
        Visible = False
        GroupIndex = 1
        SortIndex = 1
        SortOrder = soAscending
        Width = 222
        IsCaptionAssigned = True
      end
      object grViewRashDocPoMedicDPID_1: TcxGridDBColumn
        DataBinding.FieldName = 'DPID_1'
        Visible = False
      end
      object grViewRashDocPoMedicDPCID: TcxGridDBColumn
        DataBinding.FieldName = 'DPCID'
        Visible = False
      end
      object grViewRashDocPoMedicMEDICID: TcxGridDBColumn
        DataBinding.FieldName = 'MEDICID'
        Visible = False
      end
      object grViewRashDocPoMedicNAMEKART: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAMEKART'
        Width = 283
      end
      object grViewRashDocPoMedicFC_SERIAL: TcxGridDBColumn
        Caption = #1057#1077#1088#1080#1103
        DataBinding.FieldName = 'FC_SERIAL'
        Width = 93
      end
      object grViewRashDocPoMedicFC_EDIZM: TcxGridDBColumn
        Caption = #1045#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_ED_IZM'
        Width = 103
      end
      object grViewRashDocPoMedicFN_KOL: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086
        DataBinding.FieldName = 'FN_KOL'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '### ### ### ##0.#####'
        Width = 93
      end
      object grViewRashDocPoMedicFN_PRICE_DETAIL: TcxGridDBColumn
        Caption = #1062#1077#1085#1072', '#1088
        DataBinding.FieldName = 'FN_PRICE_DETAIL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object grViewRashDocPoMedicFN_SUMM: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088
        DataBinding.FieldName = 'FN_SUMM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseThousandSeparator = True
        Width = 151
      end
      object grViewRashDocPoMedicKARTID: TcxGridDBColumn
        DataBinding.FieldName = 'KARTID'
        Visible = False
      end
      object grViewRashDocPoMedicFC_RANG_ORDER: TcxGridDBColumn
        DataBinding.FieldName = 'FC_RANG_ORDER'
        Visible = False
        GroupIndex = 0
        Options.Grouping = False
        SortIndex = 0
        SortOrder = soAscending
        VisibleForCustomization = False
        IsCaptionAssigned = True
      end
    end
    object grViewRashPoluch: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGrid
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grViewRashPoluchFN_PRICE
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grViewRashPoluchFN_PRICE
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1048#1090#1086#1075#1086': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewRashPoluchFN_PRICE
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsData.Editing = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object grViewRashPoluchFC_MO_GR_TO: TcxGridDBColumn
        Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        DataBinding.FieldName = 'FC_MO_GR_TO'
        Width = 82
      end
      object grViewRashPoluchFN_PRICE: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088
        DataBinding.FieldName = 'FN_PRICE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Width = 66
      end
      object grViewRashPoluchRANG: TcxGridDBColumn
        Caption = #1056#1072#1085#1075
        DataBinding.FieldName = 'FC_RANG'
        Visible = False
      end
      object grViewRashPoluchFC_RANG: TcxGridDBColumn
        Caption = #1048#1090#1086#1075#1086' '#1087#1086' '
        DataBinding.FieldName = 'FC_RANG'
        Visible = False
        GroupIndex = 0
      end
    end
    object grViewRashDocPoDOC: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGrid
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = #1048#1090#1086#1075#1086': ,0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grViewRashDocPoDOCFN_PRICE
        end
        item
          Format = #1048#1090#1086#1075#1086': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewRashDocPoDOCFN_PRICE
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1048#1090#1086#1075#1086': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewRashDocPoDOCFN_PRICE
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Editing = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object grViewRashDocPoDOCVIDDOC: TcxGridDBColumn
        Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'VIDDOC'
        Visible = False
      end
      object grViewRashDocPoDOCFC_DOC: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        DataBinding.FieldName = 'FC_DOC'
        Width = 382
      end
      object grViewRashDocPoDOCFC_MO_GR_TO: TcxGridDBColumn
        Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        DataBinding.FieldName = 'FC_MO_GR_TO'
        Width = 178
      end
      object grViewRashDocPoDOCFC_FINSOURCE: TcxGridDBColumn
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'FC_FINSOURCE'
        Width = 100
      end
      object grViewRashDocPoDOCFN_PRICE: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088
        DataBinding.FieldName = 'FN_PRICE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Width = 136
      end
      object grViewRashDocPoDOCFC_COMMENT: TcxGridDBColumn
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        DataBinding.FieldName = 'FC_COMMENT'
        Visible = False
        Width = 69
      end
      object grViewRashDocPoDOCMOOWNERID: TcxGridDBColumn
        Caption = 'FN_PRICE'
        DataBinding.FieldName = 'MOOWNERID'
        Visible = False
      end
      object grViewRashDocPoDOCDATA: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
        DataBinding.FieldName = 'DATA'
        Visible = False
        Width = 70
      end
      object grViewRashDocPoDOCFD_INVOICE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'FD_INVOICE'
        Visible = False
        Width = 69
      end
      object grViewRashDocPoDOCFC_NAME: TcxGridDBColumn
        Caption = 'FN_PRICE'
        DataBinding.FieldName = 'FC_NAME'
        Visible = False
      end
      object grViewRashDocPoDOCNAMEPOSTAV: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        DataBinding.FieldName = 'NAMEFROM'
        Visible = False
        GroupIndex = 0
      end
      object grViewRashDocPoDOC_DPID: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'DPID'
        Visible = False
      end
    end
    object grViewRashDocPoMedicType: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGrid
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = #1057#1091#1084#1084#1072': ,0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grViewRashDocPoMedicTypeFN_SUMM
        end
        item
          Format = #1057#1091#1084#1084#1072': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewRashDocPoMedicTypeFN_SUMM
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1048#1090#1086#1075#1086': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewRashDocPoMedicTypeFN_SUMM
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object grViewRashDocPoMedicTypeFN_PRICE_MASTER: TcxGridDBColumn
        DataBinding.FieldName = 'FN_PRICE_MASTER'
        Visible = False
        Width = 86
      end
      object grViewRashDocPoMedicTypeFP_VIDMOVE: TcxGridDBColumn
        DataBinding.FieldName = 'FP_VIDMOVE'
        Visible = False
      end
      object grViewRashDocPoMedicTypePOSTAVID: TcxGridDBColumn
        DataBinding.FieldName = 'POSTAVID'
        Visible = False
      end
      object grViewRashDocPoMedicTypeMOTOID: TcxGridDBColumn
        DataBinding.FieldName = 'MOTOID'
        Visible = False
      end
      object grViewRashDocPoMedicTypeMOFROMID: TcxGridDBColumn
        DataBinding.FieldName = 'MOFROMID'
        Visible = False
      end
      object grViewRashDocPoMedicTypeFC_COMMENT: TcxGridDBColumn
        DataBinding.FieldName = 'FC_COMMENT'
        Visible = False
      end
      object grViewRashDocPoMedicTypeFP_VID: TcxGridDBColumn
        DataBinding.FieldName = 'FP_VID'
        Visible = False
      end
      object grViewRashDocPoMedicTypeMOOWNERID: TcxGridDBColumn
        DataBinding.FieldName = 'MOOWNERID'
        Visible = False
      end
      object grViewRashDocPoMedicTypeDPID: TcxGridDBColumn
        DataBinding.FieldName = 'DPID'
        Visible = False
      end
      object grViewRashDocPoMedicTypeDATA: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'DATA'
        Visible = False
      end
      object grViewRashDocPoMedicTypeFD_DATA: TcxGridDBColumn
        DataBinding.FieldName = 'FD_DATA'
        Visible = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object grViewRashDocPoMedicTypeDPID_1: TcxGridDBColumn
        DataBinding.FieldName = 'DPID_1'
        Visible = False
      end
      object grViewRashDocPoMedicTypeDPCID: TcxGridDBColumn
        DataBinding.FieldName = 'DPCID'
        Visible = False
      end
      object grViewRashDocPoMedicTypeMEDICID: TcxGridDBColumn
        DataBinding.FieldName = 'MEDICID'
        Visible = False
      end
      object grViewRashDocPoMedicTypeNAMEKART: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAMEKART'
        Width = 209
      end
      object grViewRashDocPoMedicTypeFC_EDIZM: TcxGridDBColumn
        Caption = #1045#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_EDIZM'
        Width = 57
      end
      object grViewRashDocPoMedicTypeFC_SERIAL: TcxGridDBColumn
        Caption = #1057#1077#1088#1080#1103
        DataBinding.FieldName = 'FC_SERIAL'
        Width = 59
      end
      object grViewRashDocPoMedicTypeFC_DOC: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        DataBinding.FieldName = 'FC_DOC'
        Width = 186
      end
      object grViewRashDocPoMedicTypeFC_MEDICTYPE: TcxGridDBColumn
        Caption = #1059#1095#1077#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
        DataBinding.FieldName = 'FC_MEDICTYPE'
        Visible = False
        GroupIndex = 0
      end
      object grViewRashDocPoMedicTypeNAMEPOSTAV: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        DataBinding.FieldName = 'NAMEPOSTAV'
        Width = 112
      end
      object grViewRashDocPoMedicTypeFC_FINSOURCE: TcxGridDBColumn
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'FC_FINSOURCE'
      end
      object grViewRashDocPoMedicTypeFN_KOL: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086
        DataBinding.FieldName = 'FN_KOL'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '### ### ### ##0.#####'
        Width = 40
      end
      object grViewRashDocPoMedicTypeFN_PRICE_DETAIL: TcxGridDBColumn
        Caption = #1062#1077#1085#1072', '#1088
        DataBinding.FieldName = 'FN_PRICE_DETAIL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseThousandSeparator = True
        Width = 45
      end
      object grViewRashDocPoMedicTypeFN_SUMM: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088
        DataBinding.FieldName = 'FN_SUMM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseThousandSeparator = True
        Width = 65
      end
      object grViewRashDocPoMedicTypeKARTID: TcxGridDBColumn
        DataBinding.FieldName = 'KARTID'
        Visible = False
      end
    end
    object grViewRashActSpisMatZap: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGrid
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0'
          Kind = skSum
          Column = grViewRashActSpisMatZap_FN_KOL
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grViewRashActSpisMatZap_FN_SUMM
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Bands = <
        item
          Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1100#1085#1099#1077' '#1079#1072#1087#1072#1089#1099
          Width = 227
        end
        item
          Caption = #1045#1076'. '#1080#1079#1084'.'
          Width = 57
        end
        item
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
          Position.BandIndex = 0
          Position.ColIndex = 1
          Width = 156
        end
        item
          Position.BandIndex = 0
          Position.ColIndex = 0
          Width = 40
        end
        item
          Caption = #1050#1086#1076
          Position.BandIndex = 0
          Position.ColIndex = 2
          Width = 31
        end
        item
          Caption = #1053#1086#1088#1084#1072' '#1088#1072#1089#1093#1086#1076#1072
          Width = 63
        end
        item
          Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080' '#1080#1079#1088#1072#1089#1093#1086#1076#1086#1074#1072#1085#1086
          Width = 152
        end
        item
          Caption = #1062#1077#1085#1072
          Position.BandIndex = 6
          Position.ColIndex = 1
          Width = 54
        end
        item
          Caption = #1057#1091#1084#1084#1072
          Position.BandIndex = 6
          Position.ColIndex = 2
        end
        item
          Caption = #1050#1086#1083'-'#1074#1086
          Position.BandIndex = 6
          Position.ColIndex = 0
          Width = 47
        end
        item
          Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1088#1072#1089#1093#1086#1076#1072
          Width = 99
        end
        item
          Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1072#1103' '#1079#1072#1087#1080#1089#1100
          Width = 100
        end
        item
          Caption = #1050#1041#1050
          Width = 63
        end
        item
          Caption = #1044#1077#1073#1077#1090
          Position.BandIndex = 11
          Position.ColIndex = 0
          Width = 48
        end
        item
          Caption = #1050#1088#1077#1076#1080#1090
          Position.BandIndex = 11
          Position.ColIndex = 1
          Width = 54
        end>
      object grViewRashActSpisMatZap_MEDICNAME: TcxGridDBBandedColumn
        Caption = '1'
        DataBinding.FieldName = 'MEDICNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Sorting = False
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grViewRashActSpisMatZapColumn2: TcxGridDBBandedColumn
        Caption = '2'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grViewRashActSpisMatZapColumn3: TcxGridDBBandedColumn
        Caption = '4'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grViewRashActSpisMatZap_FC_EDIZM: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'FC_EDIZM'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Sorting = False
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grViewRashActSpisMatZap_rownum: TcxGridDBBandedColumn
        DataBinding.FieldName = 'rownum'
        MinWidth = 10
        Options.Sorting = False
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
        IsCaptionAssigned = True
      end
      object grViewRashActSpisMatZap_FN_KOL: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'FN_KOL'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = ',0.000;-,0.000'
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Sorting = False
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grViewRashActSpisMatZap_FN_PRICE: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'FN_PRICE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Sorting = False
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grViewRashActSpisMatZap_FN_SUMM: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'FN_SUMM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Sorting = False
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grViewRashActSpisMatZap_FC_RASH: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'FC_RASH'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grViewRashActSpisMatZapColumn11: TcxGridDBBandedColumn
        Caption = '10'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grViewRashActSpisMatZapColumn12: TcxGridDBBandedColumn
        Caption = '9'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grViewRashActSpisMatZapColumn13: TcxGridDBBandedColumn
        Caption = '11'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grViewRashActSpisMatZapColumn14: TcxGridDBBandedColumn
        DataBinding.FieldName = 'FC_UCHGR'
        Visible = False
        GroupIndex = 0
        Options.Filtering = False
        Options.Sorting = False
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
        IsCaptionAssigned = True
      end
    end
    object grViewRashDocPoMedicFinSource: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGrid
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '0.00 '#1088'.'
          Kind = skSum
          Column = grViewRashDocPoMedicFinSource_FN_SUMM
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.00 '#1088'.'
          Kind = skSum
          Column = grViewRashDocPoMedicFinSource_FN_SUMM
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object grViewRashDocPoMedicFinSource_MEDICNAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'MEDICNAME'
        Width = 362
      end
      object grViewRashDocPoMedicFinSource_FC_EDIZM: TcxGridDBColumn
        Caption = #1045#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_EDIZM'
        Width = 71
      end
      object grViewRashDocPoMedicFinSource_FN_KOL: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086
        DataBinding.FieldName = 'FN_KOL'
        Width = 82
      end
      object grViewRashDocPoMedicFinSource_FN_PRICE: TcxGridDBColumn
        Caption = #1062#1077#1085#1072', '#1088#1091#1073'.'
        DataBinding.FieldName = 'FN_PRICE'
        Width = 103
      end
      object grViewRashDocPoMedicFinSource_FN_SUMM: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088#1091#1073'.'
        DataBinding.FieldName = 'FN_SUMM'
        PropertiesClassName = 'TcxSpinEditProperties'
        Width = 126
      end
      object grViewRashDocPoMedicFinSource_FC_FINSOURCE: TcxGridDBColumn
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'FC_FINSOURCE'
        Visible = False
        GroupIndex = 0
      end
    end
    object grViewRashDocPoFinSource: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGrid
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = #1057#1091#1084#1084#1072': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewRashDocPoFinSourceFN_SUMM
        end
        item
          Format = #1057#1091#1084#1084#1072': ,0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grViewRashDocPoFinSourceFN_SUMM
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1048#1090#1086#1075#1086': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewRashDocPoFinSourceFN_SUMM
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object grViewRashDocPoFinSourceFN_PRICE_MASTER: TcxGridDBColumn
        DataBinding.FieldName = 'FN_PRICE_MASTER'
        Visible = False
      end
      object grViewRashDocPoFinSourceMOTOID: TcxGridDBColumn
        DataBinding.FieldName = 'MOTOID'
        Visible = False
      end
      object grViewRashDocPoFinSourceMOFROMID: TcxGridDBColumn
        DataBinding.FieldName = 'MOFROMID'
        Visible = False
      end
      object grViewRashDocPoFinSourceFC_COMMENT: TcxGridDBColumn
        DataBinding.FieldName = 'FC_COMMENT'
        Visible = False
      end
      object grViewRashDocPoFinSourceFP_VID: TcxGridDBColumn
        DataBinding.FieldName = 'FP_VID'
        Visible = False
      end
      object grViewRashDocPoFinSourceMOOWNERID: TcxGridDBColumn
        DataBinding.FieldName = 'MOOWNERID'
        Visible = False
      end
      object grViewRashDocPoFinSourceDPID: TcxGridDBColumn
        DataBinding.FieldName = 'DPID'
        Visible = False
      end
      object grViewRashDocPoFinSourceDATA: TcxGridDBColumn
        DataBinding.FieldName = 'DATA'
        Visible = False
      end
      object grViewRashDocPoFinSourceDPID_1: TcxGridDBColumn
        DataBinding.FieldName = 'DPID_1'
        Visible = False
      end
      object grViewRashDocPoFinSourceDPCID: TcxGridDBColumn
        DataBinding.FieldName = 'DPCID'
        Visible = False
      end
      object grViewRashDocPoFinSourceMEDICID: TcxGridDBColumn
        DataBinding.FieldName = 'MEDICID'
        Visible = False
      end
      object grViewRashDocPoFinSourceNAMEKART: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAMEKART'
        Width = 209
      end
      object grViewRashDocPoFinSourceFC_EDIZM: TcxGridDBColumn
        Caption = #1045#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_EDIZM'
        Width = 57
      end
      object grViewRashDocPoFinSourceFC_SERIAL: TcxGridDBColumn
        Caption = #1057#1077#1088#1080#1103
        DataBinding.FieldName = 'FC_SERIAL'
        Width = 59
      end
      object grViewRashDocPoFinSourceFC_DOC: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        DataBinding.FieldName = 'FC_DOC'
        Width = 186
      end
      object grViewRashDocPoFinSourceFC_FINSOURCE: TcxGridDBColumn
        Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'FC_FINSOURCE'
        Visible = False
        GroupIndex = 0
      end
      object grViewRashDocPoFinSourceFN_KOL: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086
        DataBinding.FieldName = 'FN_KOL'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '### ### ### ##0.#####'
        Width = 40
      end
      object grViewRashDocPoFinSourceFN_PRICE_DETAIL: TcxGridDBColumn
        Caption = #1062#1077#1085#1072', '#1088
        DataBinding.FieldName = 'FN_PRICE_DETAIL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseThousandSeparator = True
        Width = 45
      end
      object grViewRashDocPoFinSourceFN_SUMM: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088
        DataBinding.FieldName = 'FN_SUMM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseThousandSeparator = True
        Width = 65
      end
      object grViewRashDocPoFinSourceKARTID: TcxGridDBColumn
        DataBinding.FieldName = 'KARTID'
        Visible = False
      end
      object grViewRashDocPoFinSourceFC_MO_GR_TO: TcxGridDBColumn
        DataBinding.FieldName = 'FC_MO_GR_TO'
        Visible = False
      end
      object grViewRashDocPoFinSourceNAMEFROM: TcxGridDBColumn
        DataBinding.FieldName = 'NAMEFROM'
        Visible = False
      end
      object grViewRashDocPoFinSourceMEDICNAME: TcxGridDBColumn
        DataBinding.FieldName = 'MEDICNAME'
        Visible = False
      end
      object grViewRashDocPoFinSourceFN_PARTY_NUM: TcxGridDBColumn
        DataBinding.FieldName = 'FN_PARTY_NUM'
        Visible = False
      end
      object grViewRashDocPoFinSourceFC_MEDICTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'FC_MEDICTYPE'
        Visible = False
      end
      object grViewRashDocPoFinSourceFC_KOL: TcxGridDBColumn
        DataBinding.FieldName = 'FC_KOL'
        Visible = False
      end
    end
    object grViewRashDocPoProfil: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGrid
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object grViewRashDocPoProfilMOFROMID: TcxGridDBColumn
        DataBinding.FieldName = 'MOFROMID'
        Visible = False
      end
      object grViewRashDocPoProfilFC_COMMENT: TcxGridDBColumn
        DataBinding.FieldName = 'FC_COMMENT'
        Visible = False
      end
      object grViewRashDocPoProfilFP_VID: TcxGridDBColumn
        DataBinding.FieldName = 'FP_VID'
        Visible = False
      end
      object grViewRashDocPoProfilFN_PRICE_MASTER: TcxGridDBColumn
        DataBinding.FieldName = 'FN_PRICE_MASTER'
        Visible = False
      end
      object grViewRashDocPoProfilMOOWNERID: TcxGridDBColumn
        DataBinding.FieldName = 'MOOWNERID'
        Visible = False
      end
      object grViewRashDocPoProfilDPID: TcxGridDBColumn
        DataBinding.FieldName = 'DPID'
        Visible = False
      end
      object grViewRashDocPoProfilFC_MO_GR_TO: TcxGridDBColumn
        DataBinding.FieldName = 'FC_MO_GR_TO'
        Visible = False
      end
      object grViewRashDocPoProfilNAMEFROM: TcxGridDBColumn
        DataBinding.FieldName = 'NAMEFROM'
        Visible = False
      end
      object grViewRashDocPoProfilDATA: TcxGridDBColumn
        DataBinding.FieldName = 'DATA'
        Visible = False
      end
      object grViewRashDocPoProfilMOTOID: TcxGridDBColumn
        DataBinding.FieldName = 'MOTOID'
        Visible = False
      end
      object grViewRashDocPoProfilDPID_1: TcxGridDBColumn
        DataBinding.FieldName = 'DPID_1'
        Visible = False
      end
      object grViewRashDocPoProfilDPCID: TcxGridDBColumn
        DataBinding.FieldName = 'DPCID'
        Visible = False
      end
      object grViewRashDocPoProfilMEDICID: TcxGridDBColumn
        DataBinding.FieldName = 'MEDICID'
        Visible = False
      end
      object grViewRashDocPoProfilKARTID: TcxGridDBColumn
        DataBinding.FieldName = 'KARTID'
        Visible = False
      end
      object grViewRashDocPoProfilMEDICNAME: TcxGridDBColumn
        DataBinding.FieldName = 'MEDICNAME'
        Visible = False
      end
      object grViewRashDocPoProfilFN_PARTY_NUM: TcxGridDBColumn
        DataBinding.FieldName = 'FN_PARTY_NUM'
        Visible = False
      end
      object grViewRashDocPoProfilFC_MEDICTYPE: TcxGridDBColumn
        Caption = #1059#1095#1077#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
        DataBinding.FieldName = 'FC_MEDICTYPE'
        Visible = False
        Width = 60
      end
      object grViewRashDocPoProfilFC_KOL: TcxGridDBColumn
        DataBinding.FieldName = 'FC_KOL'
        Visible = False
      end
      object grViewRashDocPoProfilNAMEKART: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAMEKART'
        Width = 200
      end
      object grViewRashDocPoProfilFC_EDIZM: TcxGridDBColumn
        Caption = #1045#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_EDIZM'
        Width = 50
      end
      object grViewRashDocPoProfilFC_SERIAL: TcxGridDBColumn
        Caption = #1057#1077#1088#1080#1103
        DataBinding.FieldName = 'FC_SERIAL'
        Width = 60
      end
      object grViewRashDocPoProfilFC_PROFIL: TcxGridDBColumn
        Caption = #1055#1088#1086#1092#1080#1083#1100
        DataBinding.FieldName = 'FC_PROFIL'
        Visible = False
        GroupIndex = 0
        Width = 100
      end
      object grViewRashDocPoProfilFC_DOC: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        DataBinding.FieldName = 'FC_DOC'
        Width = 180
      end
      object grViewRashDocPoProfilFC_FINSOURCE: TcxGridDBColumn
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'FC_FINSOURCE'
        Width = 60
      end
      object grViewRashDocPoProfilFN_KOL: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086
        DataBinding.FieldName = 'FN_KOL'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '### ### ### ##0.#####'
        Width = 40
      end
      object grViewRashDocPoProfilFN_PRICE_DETAIL: TcxGridDBColumn
        Caption = #1062#1077#1085#1072', '#1088
        DataBinding.FieldName = 'FN_PRICE_DETAIL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Visible = False
        Width = 45
      end
      object grViewRashDocPoProfilFN_SUMM: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088
        DataBinding.FieldName = 'FN_SUMM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Visible = False
        Width = 65
      end
    end
    object cxGrid1Level1: TcxGridLevel
    end
  end
  object alAll: TActionList
    Images = ilImages
    Left = 37
    Top = 253
    object acPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Enabled = False
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
      ImageIndex = 3
      ShortCut = 13
      OnExecute = acPrintExecute
    end
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1090#1095#1077#1090
      ImageIndex = 2
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object acGridToExcel: TAction
      Caption = #1074' Excel'
      Enabled = False
      ImageIndex = 4
      OnExecute = acGridToExcelExecute
    end
  end
  object FormStorage1: TJvFormStorage
    AppStoragePath = 'frmGetPeriod\'
    StoredValues = <>
    Left = 306
    Top = 302
  end
  object os: TOracleSession
    LogonDatabase = 'ASU'
    Left = 64
    Top = 93
  end
  object odsSelDocRashRep: TOracleDataSet
    SQL.Strings = (
      'SELECT A.* FROM'
      '('
      'SELECT TRUNC(TDOCS.FD_DATA) AS DATA,'
      '       MOFROMID, TDOCS.MOTOID, TDOCS.MOOWNERID, '
      '       TDOCS.FC_COMMENT, TDOCS.FP_VID, '
      
        '       (select sum(k.fn_price*dp.fn_kol) as FN_PRICE from med.td' +
        'pc dp, med.tkart k where dp.dpid = TDOCS.DPID and dp.kartid = k.' +
        'kartid) as FN_PRICE,'
      '       TDOCS.DPID,'
      
        '       DECODE(TDOCS.fp_vidmove, 2,1, 3,2, 8,3, 7,4, 6,5, 255) as' +
        ' FN_RANG,'
      
        '       med.GET_DECODEDOCVIDMOVE(TDOCS.fp_vidmove)||'#39' '#8470' '#39'||TDOCS.' +
        'fc_doc||'#39' '#1086#1090' '#39'||to_char(TDOCS.fd_invoice,'#39'dd.mm.yyyy'#39') AS fc_DOC' +
        ','
      
        '       MED.PKGTDOCS.GET_DOC_DESTINATION(TDOCS.fp_vid, TDOCS.fp_v' +
        'idmove, TDOCS.fk_mogroupid_TO, TDOCS.postavid) AS FC_MO_GR_TO,'
      
        '       MED.PKGTDOCS.GET_DOC_SOURCE (TDOCS.fp_vid, TDOCS.fp_vidmo' +
        've, TDOCS.fk_mogroupid_FROM, TDOCS.postavid) as NAMEFROM,'
      '       FS.FC_NAME FC_FINSOURCE'
      ' FROM MED.TDOCS, MED.TFINSOURCE FS'
      
        'WHERE :MO_GROUP = TDOCS.fk_mogroupid_from -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084' '#1085#1077#1085#1091 +
        #1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '  AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:ADATA1) AND TRUNC(:ADA' +
        'TA2)'
      
        '  AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  TDOCS' +
        '.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to, :MO' +
        '_GROUP) = -1'
      '  AND TDOCS.FL_EDIT = 0  -- '#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      
        '  AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087#1086#1089#1082#1086#1083#1100#1082#1091' '#1074 +
        #1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085#1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086#1076'+'#1088#1072#1089#1093#1086#1076 +
        ')'
      '  AND (not tdocs.fp_vidmove in (4,5))'
      '  AND ((:IS_RPO = 1)OR(tdocs.fp_vidmove <> 7))'
      '  AND TDOCS.FK_FINSOURCE_ID = FS.FK_ID  (+)'
      ') A'
      'ORDER BY A.FN_RANG, LOWER(A.FC_MO_GR_TO), A.DATA'
      '')
    Optimize = False
    Variables.Data = {
      0300000004000000070000003A4144415441310C000000000000000000000007
      0000003A4144415441320C0000000000000000000000090000003A4D4F5F4752
      4F5550030000000000000000000000070000003A49535F52504F030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C0000000400000044504944010000000000090000004D4F4F574E45
      5249440100000000000600000046435F444F430100000000000600000046505F
      5649440100000000000A00000046435F434F4D4D454E54010000000000080000
      004D4F46524F4D4944010000000000060000004D4F544F494401000000000008
      000000464E5F5052494345010000000000040000004441544101000000000008
      0000004E414D4546524F4D01000000000007000000464E5F52414E4701000000
      00000B00000046435F4D4F5F47525F544F010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 377
    Top = 204
  end
  object odsSelDocPoMedic: TOracleDataSet
    SQL.Strings = (
      '-- '#1088#1072#1089#1093#1086#1076
      ''
      'SELECT'
      
        '  TO_CHAR(MASTER_RANG.FN_ORDER)||'#39'. '#39'||MASTER1.FC_RANG as FC_RAN' +
        'G_ORDER,'
      '  MASTER1.FC_DOC as FC_DOC_SUMM, '
      '  MASTER1.FC_MO_GR_TO as FC_POLUCH_SUM,'
      
        '  rtrim(TO_CHAR(DETAIL1.FN_KOL, '#39'FM999G999G990D99999'#39'),'#39'.,'#39') as ' +
        'FC_KOL,'
      '  '
      '  MASTER1.*, DETAIL1.*'
      '  FROM'
      '    ('
      '     SELECT'
      '--       TMO.FC_NAME AS NAMEFROM,'
      '       MOFROMID,'
      '       TDOCS.FC_COMMENT,'
      '       TDOCS.FN_PRICE AS FN_PRICE_MASTER,'
      '       TDOCS.FN_Rang,'
      
        '       DECODE(TDOCS.FN_RANG, 1,'#39#1054#1090#1076#1077#1083#1077#1085#1080#1103'('#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103')'#39', 2, '#39#1054#1090#1076#1077 +
        #1083#1077#1085#1080#1103'('#1055#1077#1088#1077#1076#1072#1095#1080')'#39', 3,'#39#1057#1087#1080#1089#1072#1085#1080#1103#39', 4,'#39#1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086#39', 5,'#39#1042#1086#1079#1074#1088#1072#1090#39', 6' +
        ','#39#1056#1077#1079#1077#1088#1074#39', '#39#1056#1072#1089#1093#1086#1076#39') as FC_RANG,       '
      '       MOOWNERID,'
      '       TDOCS.DPID,'
      '--       MOGR_FROM.fc_group as FC_MO_GR_FROM,'
      
        '--       DECODE(TDOCS.fp_vidmove, 7, '#39#1057#1087#1080#1089#1072#1085#1080#1077#1085#1072#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086#1074#1056#1055#1054 +
        #39', 8, '#39#1057#1087#1080#1089#1072#1085#1080#1077#39', MOGR_TO.fc_group) as FC_MO_GR_TO,'
      '       FP_VID,   TDOCS.fp_vidmove, TDOCS.fk_mogroupid_from,'
      
        '       MED.PKGTDOCS.GET_DOC_DESTINATION(TDOCS.fp_vid, TDOCS.fp_v' +
        'idmove, TDOCS.fk_mogroupid_TO, TDOCS.postavid) AS FC_MO_GR_TO,'
      
        '       MED.PKGTDOCS.GET_DOC_SOURCE (TDOCS.fp_vid, TDOCS.fp_vidmo' +
        've, TDOCS.fk_mogroupid_FROM, TDOCS.postavid) as NAMEFROM,'
      '       TDOCS.fk_mogroupid_to,'
      
        '--       '#39#1058#1088#1077#1073#1086#1074#1072#1085#1080#1077#8470#39'||FC_DOC||'#39' '#1086#1090#39'||TO_CHAR(FD_INVOICE,'#39'DD.MM' +
        '.YYYY'#39') AS FC_DOC,'
      
        '       med.GET_DECODEDOCVIDMOVE(fp_vidmove)||'#39' '#8470#39'||TDOCS.fc_doc|' +
        '|'#39' '#1086#1090#39'||to_char(TDOCS.fd_invoice,'#39'dd.mm.yyyy'#39') AS fc_DOC,'
      '       TRUNC(TDOCS.FD_DATA) AS DATA,'
      '       MOTOID'
      '--       MED.GET_DECODEDOCVID(TDOCS.FP_VIDMOVE),'
      '--       TMO.FC_NAME,'
      '--       T2.FC_NAME AS FC_MOTONAME'
      
        '--       DECODE(NVL(TMO.FC_NAME,'#39#39'),'#39#39', MOGR_FROM.fc_group, MOGR' +
        '_FROM.fc_group ||'#39'('#39'|| TMO.FC_NAME||'#39')'#39') AS NAMEFROM,'
      
        '--       DECODE(TDOCS.FP_VID,2,decode(NVL(T2.FC_NAME,'#39#39'),'#39#39', MOG' +
        'R_TO.fc_group, MOGR_TO.fc_group ||'#39'('#39'|| T2.FC_NAME||'#39')'#39'),'#39#39') AS ' +
        'FC_MOTONAME'
      
        '     FROM   (SELECT TDOCS.*, DECODE(TDOCS.fp_vidmove, 2,1, 3,2, ' +
        '8,3, 7,4, 6,5, 4,6, 255) as FN_Rang FROM MED.TDOCS) TDOCS --, ME' +
        'D.TMO, MED.TMO T2, MED.TMO_GROUP MOGR_FROM,  MED.TMO_GROUP MOGR_' +
        'TO'
      
        '     WHERE TDOCS.fk_mogroupid_from = :MO_GROUP -- '#1089#1088#1072#1079#1091#1086#1090#1089#1077#1082#1072#1077#1084#1085 +
        #1077#1085#1091#1078#1085#1099#1077#1079#1072#1087#1080#1089#1080
      
        '       AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(TO_DATE(:ADATA1)) ' +
        'AND TRUNC(TO_DATE(:ADATA2))'
      '  --     AND TDOCS.MOFROMID = TMO.MOID(+)'
      '--       AND TDOCS.MOTOID = T2.MOID(+)'
      '--       AND TDOCS.fk_mogroupid_from = MOGR_FROM.groupid (+)'
      '--       AND TDOCS.fk_mogroupid_to = MOGR_TO.groupid (+)'
      
        '       AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  ' +
        'TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to' +
        ', :MO_GROUP) = -1'
      
        '       AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077#1074#1086#1079#1074#1088#1072#1090#1072'- '#1087#1086#1089#1082#1086#1083#1100#1082 +
        #1091#1074#1086#1079#1074#1088#1072#1090#1084#1086#1078#1085#1086#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100#1090#1086#1083#1100#1082#1086#1074#1076#1074#1080#1078#1077#1085#1080#1080'('#1082#1086#1075#1076#1072#1087#1088#1080#1093#1086#1076'+'#1088#1072#1089#1093#1086#1076')'
      '       AND (not tdocs.fp_vidmove in (4,5))'
      '       AND ((:IS_RPO = 1)OR(tdocs.fp_vidmove <> 7))'
      '       AND TDOCS.FL_EDIT = 0  '
      '     ORDER BY DATA'
      '    ) MASTER1,'
      '    '
      '    (SELECT ROWNUM as FN_ORDER, RANG.* FROM'
      '     (SELECT'
      '       DISTINCT'
      '       TDOCS.FN_RANG'
      
        '     FROM   (SELECT TDOCS.*, DECODE(TDOCS.fp_vidmove, 2,1, 3,2, ' +
        '8,3, 7,4, 6,5, 4,6, 255) as FN_Rang FROM MED.TDOCS) TDOCS --, ME' +
        'D.TMO, MED.TMO T2, MED.TMO_GROUP MOGR_FROM,  MED.TMO_GROUP MOGR_' +
        'TO'
      
        '     WHERE TDOCS.fk_mogroupid_from = :MO_GROUP -- '#1089#1088#1072#1079#1091#1086#1090#1089#1077#1082#1072#1077#1084#1085 +
        #1077#1085#1091#1078#1085#1099#1077#1079#1072#1087#1080#1089#1080
      
        '       AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(TO_DATE(:ADATA1)) ' +
        'AND TRUNC(TO_DATE(:ADATA2))'
      
        '       AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  ' +
        'TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to' +
        ', :MO_GROUP) = -1'
      
        '       AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077#1074#1086#1079#1074#1088#1072#1090#1072'- '#1087#1086#1089#1082#1086#1083#1100#1082 +
        #1091#1074#1086#1079#1074#1088#1072#1090#1084#1086#1078#1085#1086#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100#1090#1086#1083#1100#1082#1086#1074#1076#1074#1080#1078#1077#1085#1080#1080'('#1082#1086#1075#1076#1072#1087#1088#1080#1093#1086#1076'+'#1088#1072#1089#1093#1086#1076')'
      '       AND (not tdocs.fp_vidmove in (4,5))'
      '       AND TDOCS.FL_EDIT = 0  '
      '      ORDER BY TDOCS.FN_RANG'
      '    ) RANG) MASTER_RANG,     '
      '    '
      '    (SELECT '
      '          TDPC.DPID,'
      '          TDPC.DPCID,'
      '          TKART.MEDICID,'
      '          TDPC.FN_KOL,'
      '          TDPC.FN_KOL * TKART.FN_PRICE as FN_SUMM,'
      
        '--          DECODE(FN_KOL,0,0,ROUND(FN_SUMM / FN_KOL,2)) AS FN_P' +
        'RICE_DETAIL,'
      '          TKART.FN_PRICE AS FN_PRICE_DETAIL,'
      '          TKART.KARTID,'
      '          TMEDIC.FC_NAME as MEDICNAME,'
      '          TKART.FN_PARTY_NUM,'
      
        '          TMEDIC.FC_NAME||'#39'('#1087'. '#8470#39'|| TKART.FN_PARTY_NUM||'#39')'#39' AS N' +
        'AMEKART,'
      ''
      '          TKART.FC_SERIAL,'
      '          TEI.FC_NAME AS FC_ED_IZM'
      ''
      ''
      '        FROM'
      '          MED.TDPC, MED.TKART, MED.TMEDIC, MED.TEI'
      '        WHERE'
      '          TDPC.KARTID = TKART.KARTID'
      '          AND TKART.MEDICID=TMEDIC.MEDICID'
      '          AND TMEDIC.EIID = TEI.EIID(+)'
      '          AND DPID IN (SELECT TDOCS.DPID'
      '                       FROM   MED.TDOCS --, TMO, TMO T2'
      
        '                       WHERE TDOCS.fk_mogroupid_from = :MO_GROUP' +
        ' -- '#1089#1088#1072#1079#1091#1086#1090#1089#1077#1082#1072#1077#1084#1085#1077#1085#1091#1078#1085#1099#1077#1079#1072#1087#1080#1089#1080
      
        '                         AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(' +
        'TO_DATE(:ADATA1)) AND TRUNC(TO_DATE(:ADATA2))'
      
        '                         AND MED.PKG_PRIHRASH.Get_PrihRashPrizna' +
        'k (TDOCS.FP_VID,  TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDO' +
        'CS.fk_mogroupid_to, :MO_GROUP) = -1                         '
      
        '                         AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077 +
        #1074#1086#1079#1074#1088#1072#1090#1072'- '#1087#1086#1089#1082#1086#1083#1100#1082#1091#1074#1086#1079#1074#1088#1072#1090#1084#1086#1078#1085#1086#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100#1090#1086#1083#1100#1082#1086#1074#1076#1074#1080#1078#1077#1085#1080#1080'('#1082#1086#1075#1076#1072 +
        #1087#1088#1080#1093#1086#1076'+'#1088#1072#1089#1093#1086#1076')'
      '                         AND (not tdocs.fp_vidmove in (4,5))'
      '                         AND TDOCS.FL_EDIT = 0  '
      '                      )'
      '--          AND TMEDIC.FL_VISIBLE = 1            '
      '        ORDER BY TDPC.DPCID'
      '       '
      '    ) DETAIL1   '
      '    '
      '  WHERE MASTER1.DPID = DETAIL1.DPID'
      '   AND MASTER1.FN_RANG = MASTER_RANG.FN_RANG(+)  '
      
        'ORDER BY MASTER_RANG.FN_ORDER, UPPER(MASTER1.FC_MO_GR_TO), DATA,' +
        '  MEDICNAME, FN_PARTY_NUM')
    Optimize = False
    Variables.Data = {
      0300000004000000070000003A4144415441310C000000000000000000000007
      0000003A4144415441320C0000000000000000000000090000003A4D4F5F4752
      4F5550030000000000000000000000070000003A49535F52504F030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000200000000400000044504944010000000000090000004D4F4F574E45
      5249440100000000000600000046435F444F430100000000000600000046505F
      5649440100000000000A00000046435F434F4D4D454E54010000000000080000
      004D4F46524F4D4944010000000000060000004D4F544F494401000000000004
      00000044415441010000000000080000004E414D4546524F4D01000000000006
      000000445049445F310100000000000500000044504349440100000000000700
      00004D45444943494401000000000006000000464E5F4B4F4C01000000000007
      000000464E5F53554D4D0100000000000F000000464E5F50524943455F444554
      41494C010000000000060000004B4152544944010000000000080000004E414D
      454B4152540100000000000900000046435F53455249414C0100000000000F00
      0000464E5F50524943455F4D41535445520100000000000D00000046435F5241
      4E475F4F524445520100000000000B00000046435F444F435F53554D4D010000
      0000000D00000046435F504F4C5543485F53554D01000000000007000000464E
      5F52414E470100000000000700000046435F52414E470100000000000A000000
      46505F5649444D4F564501000000000011000000464B5F4D4F47524F55504944
      5F46524F4D0100000000000B00000046435F4D4F5F47525F544F010000000000
      0F000000464B5F4D4F47524F555049445F544F010000000000090000004D4544
      49434E414D450100000000000C000000464E5F50415254595F4E554D01000000
      00000900000046435F45445F495A4D0100000000000600000046435F4B4F4C01
      0000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 377
    Top = 252
  end
  object frRashDocPoMedic: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frRashDocITOGGetValue
    Left = 527
    Top = 248
    ReportForm = {
      19000000271E0000190000FFFF01000100FFFFFFFFFF090000009A0B00003408
      00004800000024000000190000002400000001FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      0000240000002F040000A50000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E4865616465723100020100000000280100002F0400002700000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200B40100000B004D6173746572446174613100020100000000940100002F04
      0000140000003100050001000000000000000000FFFFFF1F0000000011006672
      444253656C446F63506F4D6564696300000000000000FFFF0000000000020000
      00010000000000000001000000C8000000140000000100000000000002002102
      00000D004D6173746572466F6F7465723100020100000000040200002F040000
      190000003100060001000000000000000000FFFFFF1F00000000000000000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      00000100000000000002008C0200000B0050616765466F6F7465723100020100
      000000380200002F040000140000003000030001000000000000000000FFFFFF
      1F00000000000000000000000000FFFF00000000000200000001000000000000
      0001000000C800000014000000010000000000000200180300000C0047726F75
      704865616465723100020100000000660100002F040000140000003000100001
      000000000000000000FFFFFF1F0000000020005B6F647353656C446F63506F4D
      656469632E2246435F4D4F5F47525F544F225D00000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200840300000C0047726F7570466F6F7465723100020100000000C60100002F
      040000140000003000110001000000000000000000FFFFFF1F00000000000000
      000000000000FFFF000000000002000000010000000000000001000000C80000
      00140000000100000000000000000604000005004D656D6F3200020061000000
      280100003C0000002700000003000F00DC050000000000000000CCFFCC002C02
      000000000001000400C4E0F2E000000000FFFF00000000000200000001000000
      000500417269616C00090000000200000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000008D04000005004D656D6F330002009D00
      000028010000DD0000002700000003000F00DC050000000000000000CCFFCC00
      2C02000000000001000900CEF1EDEEE2E0EDE8E500000000FFFF000000000002
      00000001000000000500417269616C00090000000200000000000A000000CC00
      020000000000FFFFFF00000000020000000000000000001305000005004D656D
      6F35000200C203000028010000530000002700000003000F00DC050000000000
      000000CCFFCC002C02000000000001000800D1F3ECECE02C20F000000000FFFF
      00000000000200000001000000000500417269616C0009000000020000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000AB0500
      0006004D656D6F343100020061000000940100003C0000001400000003000500
      2C010000000000000000FFFFFF1F2C020000000000010019005B6F647353656C
      446F63506F4D656469632E2244415441225D00000000FFFF0000000000020000
      0001000000000500417269616C000800000000000000000008000000CC000200
      00000000FFFFFF00000000020000000000000000004506000006004D656D6F34
      320002009D00000094010000DD00000014000000030005002C01000000000000
      0000FFFFFF1F2C02000000000001001B005B6F647353656C446F63506F4D6564
      69632E2246435F444F43225D00000000FFFF0000000000020000000100000000
      0500417269616C000800000000000000000008000000CC00020000000000FFFF
      FF0000000002000000000000000000F806000006004D656D6F3435000200C203
      00009401000053000000140000000300010002000000000000000000FFFFFF1F
      2C020301100023232320232323202323302E303020F000010024005B6F647353
      656C446F63506F4D656469632E22464E5F50524943455F4D4153544552225D00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      000000000009000000CC00020000000000FFFFFF000000000200000000000000
      00007D07000006004D656D6F31350002004800000004020000E6020000190000
      0003000F00DC050000000000000000FFFFFF1F2C02000000000001000600C8F2
      EEE3EE3A00000000FFFF00000000000200000001000000000500417269616C00
      0C00000002000000000009000000CC00020000000000FFFFFF00000000020000
      000000000000002F08000006004D656D6F31370002002E03000004020000E700
      00001900000023000F00DC050000000000000000FFFFFF1F2C02040110002323
      2320232323202323302E303020F000010023005B53554D285B6F647353656C44
      6F63506F4D656469632E22464E5F53554D4D225D295D00000000FFFF00000000
      000200000001000000000500417269616C000C00000002000000000009000000
      CC00020000000000FFFFFF0000000002000000000000000000CA08000006004D
      656D6F31310002004800000039020000CE030000110000000300000001000000
      000000000000FFFFFF1F2C02000000000001001C00F1F2F02E205B5041474523
      5D20E8E7205B544F54414C50414745535D00000000FFFF000000000002000000
      01000000040500417269616C000A00000000000000000009000000CC00020000
      000000FFFFFF00000000020000000000000000004E09000006004D656D6F3134
      0002004800000028010000190000002700000003000F00DC0500000000000000
      00CCFFCC002C02000000000001000500B920EF2FEF00000000FFFF0000000000
      0200000001000000000500417269616C00090000000200000000000A000000CC
      00020000000000FFFFFF00000000020000000000000000009F0D000006004D65
      6D6F343000020048000000940100001900000014000000030004000200000000
      0000000000FFFFFF1F2C020000000000020013005B695F726F775F6E756D5F6D
      61737465725D290D0000001C000500626567696E0D6600696620695F44504944
      3C3E5B6F647353656C446F63506F4D656469632E2244504944225D207468656E
      202F2FEDEEE2FBE920ECE0F1F2E5F020EFEEF8E5EB2C20EDE0E4EE20E8E7ECE5
      EDE8F2FC20F0E8F1EEE2E0EDE8E520EDE5EAEEF2EEF0FBF520ECE5ECEE0D0700
      2020426567696E0D2700202020695F44504944203A3D205B6F647353656C446F
      63506F4D656469632E2244504944225D3B0D1900202020695F726F775F6E756D
      5F64657461696C203A3D20313B0D2C00202020695F726F775F6E756D5F6D6173
      746572203A3D20695F726F775F6E756D5F6D6173746572202B20313B0D510020
      2020695F464E5F50524943455F4D4153544552203A3D20695F464E5F50524943
      455F4D4153544552202B205B6F647353656C446F63506F4D656469632E22464E
      5F50524943455F4D4153544552225D3B0D00000D20002020204D656D6F34302E
      466F6E742E436F6C6F72203A3D20636C426C61636B3B0D20002020204D656D6F
      34312E466F6E742E436F6C6F72203A3D20636C426C61636B3B0D20002020204D
      656D6F34322E466F6E742E436F6C6F72203A3D20636C426C61636B3B0D22002F
      2F2020204D656D6F34332E466F6E742E436F6C6F72203A3D20636C426C61636B
      3B0D20002020204D656D6F34342E466F6E742E436F6C6F72203A3D20636C426C
      61636B3B0D20002020204D656D6F34352E466F6E742E436F6C6F72203A3D2063
      6C426C61636B3B0D19002020204C696E65312E56697369626C65203A3D205472
      75653B0D05002020656E640D4200656C73652020202F2FFDF2EE20F1EFE8F1EE
      EA2064657461696C2C20F22EE52E20F1EFE8F1EEEA20EFEEE4F7E8EDE5EDEDFB
      F520E2EDF3F2F0E820ECE0F1F2E5F0E00D07002020426567696E0D2C00202020
      695F726F775F6E756D5F64657461696C203A3D20695F726F775F6E756D5F6465
      7461696C202B20313B0D1A002020204C696E65312E56697369626C65203A3D20
      46616C73653B0D20002020204D656D6F34302E466F6E742E436F6C6F72203A3D
      20636C57686974653B0D20002020204D656D6F34312E466F6E742E436F6C6F72
      203A3D20636C57686974653B0D20002020204D656D6F34322E466F6E742E436F
      6C6F72203A3D20636C57686974653B0D22002F2F2020204D656D6F34332E466F
      6E742E436F6C6F72203A3D20636C57686974653B0D20002020204D656D6F3434
      2E466F6E742E436F6C6F72203A3D20636C57686974653B0D20002020204D656D
      6F34352E466F6E742E436F6C6F72203A3D20636C57686974653B0D0600202065
      6E643B0D0300656E6400FFFF0000000000020000000100000000050041726961
      6C000800000000000000000009000000CC00020000000000FFFFFF0000000002
      0000000000000000003B0E000006004D656D6F31390002007A01000028010000
      480200001100000003000F00DC050000000000000000CCFFCC002C0200000000
      0001001D00D2EEE2E0F0EDEE2DECE0F2E5EBE8E0EBFCEDFBE520F6E5EDEDEEF1
      F2E800000000FFFF00000000000200000001000000000500417269616C000900
      00000200000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000BB0E000006004D656D6F32300002007A0100003901000017000000
      1600000003000F00DC050000000000000000CCFFCC002C020000000000010001
      00B900000000FFFF00000000000200000001000000000500417269616C000900
      00000200000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000460F000006004D656D6F32310002009101000039010000F9000000
      1600000003000F00DC050000000000000000CCFFCC002C02000000000001000C
      00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF00000000000200000001000000
      000500417269616C00090000000200000000000A000000CC00020000000000FF
      FFFF0000000002000000000000000000CA0F000006004D656D6F3233000200BE
      02000039010000400000001600000003000F00DC050000000000000000CCFFCC
      002C02000000000001000500D1E5F0E8FF00000000FFFF000000000002000000
      01000000000500417269616C00090000000200000000000A000000CC00020000
      000000FFFFFF00000000020000000000000000004F10000006004D656D6F3234
      000200FE02000039010000300000001600000003000F00DC0500000000000000
      00CCFFCC002C02000000000001000600CAEEEB2DE2EE00000000FFFF00000000
      000200000001000000000500417269616C00090000000200000000000A000000
      CC00020000000000FFFFFF0000000002000000000000000000D510000006004D
      656D6F32350002002E03000039010000400000001600000003000F00DC050000
      000000000000CCFFCC002C02000000000001000700D6E5EDE02C20F000000000
      FFFF00000000000200000001000000000500417269616C000900000002000000
      00000A000000CC00020000000000FFFFFF00000000020000000000000000005C
      11000006004D656D6F32360002006E0300003901000054000000160000000300
      0F00DC050000000000000000CCFFCC002C02000000000001000800D1F3ECECE0
      2C20F000000000FFFF00000000000200000001000000000500417269616C0009
      0000000200000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000000ED11000006004D656D6F32320002007A01000094010000170000
      001400000003000F0001000000000000000000FFFFFF1F2C0200000000000100
      12005B695F726F775F6E756D5F64657461696C5D00000000FFFF000000000002
      00000001000000000500417269616C00080000000000000000000A000000CC00
      020000000000FFFFFF00000000020000000000000000008912000006004D656D
      6F32370002009101000094010000F90000001400000003000F00010000000000
      00000000FFFFFF1F2C02000000000001001D005B6F647353656C446F63506F4D
      656469632E224E414D454B415254225D00000000FFFF00000000000200000001
      000000000500417269616C000800000000000000000008000000CC0002000000
      0000FFFFFF00000000020000000000000000002613000006004D656D6F323800
      0200BE02000094010000400000001400000003000F0001000000000000000000
      FFFFFF1F2C02000000000001001E005B6F647353656C446F63506F4D65646963
      2E2246435F53455249414C225D00000000FFFF00000000000200000001000000
      000500417269616C00080000000000000000000A000000CC00020000000000FF
      FFFF0000000002000000000000000000C013000006004D656D6F3239000200FE
      02000094010000300000001400000003000F0001000000000000000000FFFFFF
      1F2C00000000000001001B005B6F647353656C446F63506F4D656469632E2246
      435F4B4F4C225D00000000FFFF00000000000200000001000000000500417269
      616C00080000000000000000000A000000CC00020000000000FFFFFF00000000
      020000000000000000007314000006004D656D6F33300002002E030000940100
      00400000001400000003000F0001000000000000000000FFFFFF1F2C02030110
      0023232320232323202323302E303020F000010024005B6F647353656C446F63
      506F4D656469632E22464E5F50524943455F44455441494C225D00000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      0A000000CC00020000000000FFFFFF00000000020000000000000000001E1500
      0006004D656D6F33310002006E03000094010000540000001400000003000F00
      01000000000000000000FFFFFF1F2C020301100023232320232323202323302E
      303020F00001001C005B6F647353656C446F63506F4D656469632E22464E5F53
      554D4D225D00000000FFFF00000000000200000001000000000500417269616C
      00080000000000000000000A000000CC00020000000000FFFFFF000000000200
      00000000000000009B16000005004D656D6F36000200480000008C000000CE03
      00001B0000000300000001000000000000000000FFFFFF1F2C02000000000001
      001000CEF2F7E5F220EFEE20F0E0F1F5EEE4F30006000500626567696E0D3100
      20695F44504944203A3D20303B202F2F20EDEEECE5F020205B6F647353656C44
      6F63507269685265702E2244504944225D0D2E0020695F726F775F6E756D5F64
      657461696C203A3D20303B202F2F20EDEEECE5F020F1F2F0EEEAE82064657461
      696C0D2D0020695F726F775F6E756D5F6D6173746572203A3D20303B202F2FED
      EEECE5F020F1F2F0EEEAE8206D61737465720D4A0020695F464E5F5052494345
      5F4D4153544552203A3D20303B202F2F20E8F2EEE3EEE2E0FF20F1F3ECECE020
      EFEE20F1F2EEEBE1F6F32022D1F3ECECE020EFEE20E4EEEAF3ECE5EDF2F3220D
      0300656E6400FFFF00000000000200000001000000000500417269616C000E00
      000002000000000002000000CC00020000000000FFFFFF000000000200000000
      00000000003F17000005004D656D6F3700020048000000A4000000CE03000018
      0000000300000001000000000000000000FFFFFF1F2C02000000000001002600
      E7E020EFE5F0E8EEE420F1205B7661725F64617465315D20EFEE205B7661725F
      64617465325D00000000FFFF0000000000020000000100000000050041726961
      6C000C0000000200000000000A000000CC00020000000000FFFFFF0000000002
      000000000000000000D417000005004D656D6F380002004800000040000000D2
      0100000E0000000300000001000000000000000000FFFFFF1F2C020000000000
      01001700EDE0E8ECE5EDEEE2E0EDE8E520F3F7F0E5E6E4E5EDE8FF00000000FF
      FF00000000000200000001000000000500417269616C00080000000000000000
      00020000000100020000000000FFFFFF00000000020000000000000000006018
      000005004D656D6F390002004800000024000000D20100001C00000003000200
      01000000000000000000CCFFCC002C02000000000001000E005B7661725F7265
      6365697665725D00000000FFFF00000000000200000001000000000500417269
      616C000A000000000000000000120000000100020000000000FFFFFF00000000
      02000000000000000000ED18000006004D656D6F313300020048000000550000
      00D2010000190000000300020001000000000000000000CCFFCC002C02000000
      000001000E005B7661725F6D6F5F67726F75705D00000000FFFF000000000002
      00000001000000000500417269616C000C00000000000000000012000000CC00
      020000000000FFFFFF00000000020000000000000000008619000006004D656D
      6F3136000200480000006F000000D20100000E00000003000000010000000000
      00000000FFFFFF1F2C02000000000001001A00EDE0E8ECE5EDEEE2E0EDE8E520
      EFEEE4F0E0E7E4E5EBE5EDE8FF00000000FFFF00000000000200000001000000
      000500417269616C000800000000000000000002000000CC00020000000000FF
      FFFF0000000002000000000000000400D519000005004C696E65310002004700
      000094010000CE030000000000000100080002000000000000000000FFFFFF00
      2C020000000000000000000000FFFF0000000000020000000100000000000073
      1A000005004D656D6F310002006100000066010000B40300001400000003000F
      0002000000000000000000CCFFFF002C020000000000010020005B6F64735365
      6C446F63506F4D656469632E2246435F4D4F5F47525F544F225D00000000FFFF
      00000000000200000001000000000500417269616C000A000000020000000000
      08000000CC00020000000000FFFFFF0000000002000000000000000000F91A00
      0006004D656D6F31300002004800000066010000190000001400000003000F00
      02000000000000000000CCFFFF002C020000000000010007005B4C494E45235D
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      000000A31B000006004D656D6F313200020048000000C6010000E60200001400
      000003000F0002000000000000000000FFFFFF1F2C02000000000001002B00C8
      F2EEE3EE20EFEE20225B6F647353656C446F63506F4D656469632E2246435F4D
      4F5F47525F544F225D2200000000FFFF00000000000200000001000000000500
      417269616C000A00000000000000000009000000CC00020000000000FFFFFF00
      00000002000000000000000000551C000006004D656D6F31380002002E030000
      C6010000E70000001400000003000F0002000000000000000000FFFFFF1F2C02
      0401100023232320232323202323302E303020F000010023005B53554D285B6F
      647353656C446F63506F4D656469632E22464E5F53554D4D225D295D00000000
      FFFF00000000000200000001000000000500417269616C000A00000002000000
      000009000000CC00020000000000FFFFFF0000000002000000000000000A0B00
      54667252696368566965770000B71C0000050052696368310002001604000094
      01000050000000140000000100000001000000000000000000FFFFFF1F2C0200
      00000000000000000000FFFF000000000002000000010000000000B71C000000
      003D1D000005004D656D6F340002008A02000039010000340000001600000003
      000F00DC050000000000000000CCFFCC002C02000000000001000800C5E42E20
      E8E7EC2E00000000FFFF00000000000200000001000000000500417269616C00
      090000000200000000000A000000CC00020000000000FFFFFF00000000020000
      00000000000000DA1D000006004D656D6F33320002008A020000940100003400
      00001400000003000F0001000000000000000000FFFFFF1F2C02000000000001
      001E005B6F647353656C446F63506F4D656469632E2246435F45445F495A4D22
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      0000FEFEFF020000000A002043617465676F72793100000000040073756D6D00
      010030000000000000000000FC0000000000000000000000000000000058008D
      F9BA39EDD2E2400EB3965DED4EE440}
  end
  object frRashDocPoDOC: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frRashDocITOGGetValue
    Left = 529
    Top = 202
    ReportForm = {
      19000000B1190000190000FFFF01000100FFFFFFFFFF090000009A0B00003408
      00004800000024000000240000002400000001FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      0000240000002F040000A90000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E4865616465723100020100000000280100002F0400001200000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200B30100000B004D6173746572446174613100020100000000880100002F04
      0000140000003100050001000000000000000000FFFFFF1F0000000010006672
      4442445353656C52617368446F6300000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000200200200
      000D004D6173746572466F6F7465723100020100000000E80100002F040000CC
      0000003000060001000000000000000000FFFFFF1F0000000000000000000000
      0000FFFF000000000002000000010000000000000001000000C8000000140000
      000100000000000002008B0200000B0050616765466F6F746572310002010000
      0000E40200002F040000140000003000030001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200170300000C0047726F7570
      4865616465723100020100000000580100002F04000014000000300010000100
      0000000000000000FFFFFF1F0000000020005B6F647353656C446F6352617368
      5265702E2246435F4D4F5F47525F544F225D00000000000000FFFF0000000000
      02000000010000000000000001000000C8000000140000000100000000000002
      00830300000C0047726F7570466F6F7465723100020100000000B80100002F04
      0000140000003000110001000000000000000000FFFFFF1F0000000000000000
      0000000000FFFF000000000002000000010000000000000001000000C8000000
      140000000100000000000000000504000005004D656D6F320002007300000028
      010000520000001200000003000F00DC050000000000000000CCFFCC002C0200
      0000000001000400C4E0F2E000000000FFFF0000000000020000000100000000
      0500417269616C000A00000002000000000002000000CC00020000000000FFFF
      FF00000000020000000000000000008C04000005004D656D6F33000200C50000
      0028010000AE0200001200000003000F00DC050000000000000000CCFFCC002C
      02000000000001000900CEF1EDEEE2E0EDE8E500000000FFFF00000000000200
      000001000000000500417269616C000A00000002000000000002000000CC0002
      0000000000FFFFFF00000000020000000000000000001205000005004D656D6F
      350002007303000028010000980000001200000003000F00DC05000000000000
      0000CCFFCC002C02000000000001000800D1F3ECECE02C20F000000000FFFF00
      000000000200000001000000000500417269616C000A00000002000000000002
      000000CC00020000000000FFFFFF0000000002000000000000000000A9050000
      05004D656D6F360002007300000088010000520000001400000003000F002C01
      0000000000000000FFFFFF1F2C020000000000010019005B6F647353656C446F
      63526173685265702E2244415441225D00000000FFFF00000000000200000001
      000000000500417269616C000A0000000000000000000A000000CC0002000000
      0000FFFFFF00000000020000000000000000004206000005004D656D6F370002
      00C500000088010000AE0200001400000003000F002C010000000000000000FF
      FFFF1F2C02000000000001001B005B6F647353656C446F63526173685265702E
      2246435F444F43225D00000000FFFF0000000000020000000100000000050041
      7269616C000A00000000000000000008000000CC00020000000000FFFFFF0000
      000002000000000000000000ED06000005004D656D6F39000200730300008801
      0000980000001400000003000F002C010000000000000000FFFFFF1F2C020301
      100023232320232323202323302E303020F00001001D005B6F647353656C446F
      63526173685265702E22464E5F5052494345225D00000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000009000000CC00
      020000000000FFFFFF00000000020000000000000000007207000006004D656D
      6F313500020048000000E8010000DF0200001400000003000F00DC0500000000
      00000000FFFFFF1F2C02000000000001000600C8F2EEE3EE3A00000000FFFF00
      000000000200000001000000000500417269616C000A00000002000000000009
      000000CC00020000000000FFFFFF000000000200000000000000000025080000
      06004D656D6F313700020027030000E8010000E40000001400000023000F00DC
      050000000000000000FFFFFF1F2C020401100023232320232323202323302E30
      3020F000010024005B53554D285B6F647353656C446F63526173685265702E22
      464E5F5052494345225D295D00000000FFFF0000000000020000000100000000
      0500417269616C000C00000002000000000009000000CC00020000000000FFFF
      FF0000000002000000000000000000A908000006004D656D6F31340002004800
      0000280100002B0000001200000003000F00DC050000000000000000CCFFCC00
      2C02000000000001000500B920EF2FEF00000000FFFF00000000000200000001
      000000000500417269616C000A00000002000000000002000000CC0002000000
      0000FFFFFF00000000020000000000000000003009000006004D656D6F313600
      020048000000880100002B0000001400000003000F002C010000000000000000
      FFFFFF1F2C020000000000010008005B4C494E45235D2900000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000090000
      00CC00020000000000FFFFFF0000000002000000000000000000CF0900000500
      4D656D6F340002007300000058010000980300001400000003000F002C010000
      000000000000CCFFFF002C02000000000001002100205B6F647353656C446F63
      526173685265702E2246435F4D4F5F47525F544F225D00000000FFFF00000000
      000200000001000000000500417269616C000A00000002000000000008000000
      CC00020000000000FFFFFF0000000002000000000000000000540A000005004D
      656D6F3800020048000000580100002B0000001400000003000F002C01000000
      0000000000CCFFFF002C020000000000010007005B4C494E45235D00000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000FE0A
      000006004D656D6F313300020048000000B80100002B0300001400000003000F
      002C010000000000000000FFFFFF1F2C02000000000001002B00C8F2EEE3EE20
      EFEE20225B6F647353656C446F63526173685265702E2246435F4D4F5F47525F
      544F225D2200000000FFFF00000000000200000001000000000500417269616C
      000A00000000000000000009000000CC00020000000000FFFFFF000000000200
      0000000000000000B10B000006004D656D6F313900020073030000B801000098
      0000001400000003000F002C010000000000000000FFFFFF1F2C020401100023
      232320232323202323302E303020F000010024005B53554D285B6F647353656C
      446F63526173685265702E22464E5F5052494345225D295D00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000200000000000900
      0000CC00020000000000FFFFFF00000000020000000000000000004D0C000005
      004D656D6F31000200480000008F000000C30300001B00000003000000010000
      00000000000000FFFFFF1F2C02000000000001001E00CEF2F7E5F220EFEE20F0
      E0F1F5EEE4F320EFEE20E4EEEAF3ECE5EDF2E0EC00000000FFFF000000000002
      00000001000000000500417269616C000E00000002000000000002000000CC00
      020000000000FFFFFF0000000002000000000000000000F20C000006004D656D
      6F313000020048000000AB000000C30300001800000003000000010000000000
      00000000FFFFFF1F2C02000000000001002600E7E020EFE5F0E8EEE420F1205B
      7661725F64617465315D20EFEE205B7661725F64617465325D00000000FFFF00
      000000000200000001000000000500417269616C000C0000000200000000000A
      000000CC00020000000000FFFFFF0000000002000000000000000000880D0000
      06004D656D6F32360002004800000042000000D20100000E0000000300000001
      000000000000000000FFFFFF1F2C02000000000001001700EDE0E8ECE5EDEEE2
      E0EDE8E520F3F7F0E5E6E4E5EDE8FF00000000FFFF0000000000020000000100
      0000000500417269616C00080000000000000000000200000001000200000000
      00FFFFFF0000000002000000000000000000150E000006004D656D6F32370002
      004800000025000000D20100001C0000000300020001000000000000000000CC
      FFCC002C02000000000001000E005B7661725F72656365697665725D00000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      0000120000000100020000000000FFFFFF0000000002000000000000000000A2
      0E000006004D656D6F32380002004800000055000000D2010000190000000300
      020001000000000000000000CCFFCC002C02000000000001000E005B7661725F
      6D6F5F67726F75705D00000000FFFF0000000000020000000100000000050041
      7269616C000C00000000000000000012000000CC00020000000000FFFFFF0000
      0000020000000000000000003B0F000006004D656D6F3331000200480000006F
      000000D20100000E0000000300000001000000000000000000FFFFFF1F2C0200
      0000000001001A00EDE0E8ECE5EDEEE2E0EDE8E520EFEEE4F0E0E7E4E5EBE5ED
      E8FF00000000FFFF00000000000200000001000000000500417269616C000800
      000000000000000002000000CC00020000000000FFFFFF000000000200000000
      0000000000CA0F000006004D656D6F3232000200480000000B0200007D000000
      140000000300000001000000000000000000FFFFFF1F2C020000000000010010
      00C2F1E5E3EE20E4EEEAF3ECE5EDF2EEE200000000FFFF000000000002000000
      01000000000500417269616C000A000000000000000000000000000100020000
      000000FFFFFF00000000020000000000000000005110000006004D656D6F3233
      000200C50000001F020000690000001000000003000800010000000000000000
      00FFFFFF1F2C0200000000000100080028EAEEEB2DE2EE2900000000FFFF0000
      0000000200000001000000000500417269616C00060000000000000000000200
      00000100020000000000FFFFFF0000000002000000000000000000DE10000006
      004D656D6F323400020048000000380200007D0000001C000000030000000100
      0000000000000000FFFFFF1F2C02000000000001000E00C4EEEAF3ECE5EDF2FB
      20F1E4E0EB00000000FFFF00000000000200000001000000000500417269616C
      000A000000000000000000100000000100020000000000FFFFFF000000000200
      00000000000000006811000006004D656D6F3235000200C500000054020000D2
      0000000C0000000300080001000000000000000000FFFFFF1F2C020000000000
      01000B0028E4EEEBE6EDEEF1F2FC2900000000FFFF0000000000020000000100
      0000000500417269616C00060000000000000000000200000001000200000000
      00FFFFFF0000000002000000000000000000F011000006004D656D6F32390002
      009B010000540200007F0000000C0000000300080001000000000000000000FF
      FFFF1F2C0200000000000100090028EFEEE4EFE8F1FC2900000000FFFF000000
      00000200000001000000000500417269616C0006000000000000000000020000
      000100020000000000FFFFFF0000000002000000000000000000841200000600
      4D656D6F33300002001D02000054020000F40000000C00000003000800010000
      00000000000000FFFFFF1F2C0200000000000100150028F0E0F1F8E8F4F0EEE2
      EAE020EFEEE4EFE8F1E82900000000FFFF000000000002000000010000000005
      00417269616C0006000000000000000000020000000100020000000000FFFFFF
      00000000020000000000000000002513000006004D656D6F3332000200110300
      0038020000FA0000001C0000000300000001000000000000000000FFFFFF1F2C
      02000000000001002200AB5F5F5F5FBB205F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
      5F5F5F202032305F5F5F20E300000000FFFF0000000000020000000100000000
      0500417269616C000A000000000000000000100000000100020000000000FFFF
      FF0000000002000000000000000000B413000006004D656D6F33330002004800
      0000600200007D0000001C0000000300000001000000000000000000FFFFFF1F
      2C02000000000001001000C4EEEAF3ECE5EDF2FB20EFF0E8EDFFEB00000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      00100000000100020000000000FFFFFF00000000020000000000000000003E14
      000006004D656D6F3334000200C50000007C020000D20000000C000000030008
      0001000000000000000000FFFFFF1F2C02000000000001000B0028E4EEEBE6ED
      EEF1F2FC2900000000FFFF00000000000200000001000000000500417269616C
      0006000000000000000000020000000100020000000000FFFFFF000000000200
      0000000000000000C614000006004D656D6F33350002009B0100007C0200007F
      0000000C0000000300080001000000000000000000FFFFFF1F2C020000000000
      0100090028EFEEE4EFE8F1FC2900000000FFFF00000000000200000001000000
      000500417269616C0006000000000000000000020000000100020000000000FF
      FFFF00000000020000000000000000005A15000006004D656D6F33360002001D
      0200007C020000F40000000C0000000300080001000000000000000000FFFFFF
      1F2C0200000000000100150028F0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E8
      2900000000FFFF00000000000200000001000000000500417269616C00060000
      00000000000000020000000100020000000000FFFFFF00000000020000000000
      00000000FB15000006004D656D6F33370002001103000060020000FA0000001C
      0000000300000001000000000000000000FFFFFF1F2C02000000000001002200
      AB5F5F5F5FBB205F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F202032305F5F5F
      20E300000000FFFF00000000000200000001000000000500417269616C000A00
      0000000000000000100000000100020000000000FFFFFF000000000200000000
      00000000008216000006004D656D6F333800020048000000880200007D000000
      1C0000000300000001000000000000000000FFFFFF1F2C020000000000010008
      00CFF0EEE2E5F0E8EB00000000FFFF0000000000020000000100000000050041
      7269616C000A000000000000000000100000000100020000000000FFFFFF0000
      0000020000000000000000000C17000006004D656D6F3339000200C5000000A4
      020000D20000000C0000000300080001000000000000000000FFFFFF1F2C0200
      0000000001000B0028E4EEEBE6EDEEF1F2FC2900000000FFFF00000000000200
      000001000000000500417269616C000600000000000000000002000000010002
      0000000000FFFFFF00000000020000000000000000009417000006004D656D6F
      34300002009B010000A40200007F0000000C0000000300080001000000000000
      000000FFFFFF1F2C0200000000000100090028EFEEE4EFE8F1FC2900000000FF
      FF00000000000200000001000000000500417269616C00060000000000000000
      00020000000100020000000000FFFFFF00000000020000000000000000002818
      000006004D656D6F34310002001D020000A4020000F40000000C000000030008
      0001000000000000000000FFFFFF1F2C0200000000000100150028F0E0F1F8E8
      F4F0EEE2EAE020EFEEE4EFE8F1E82900000000FFFF0000000000020000000100
      0000000500417269616C00060000000000000000000200000001000200000000
      00FFFFFF0000000002000000000000000000C918000006004D656D6F34320002
      001103000088020000FA0000001C0000000300000001000000000000000000FF
      FFFF1F2C02000000000001002200AB5F5F5F5FBB205F5F5F5F5F5F5F5F5F5F5F
      5F5F5F5F5F5F5F202032305F5F5F20E300000000FFFF00000000000200000001
      000000000500417269616C000A00000000000000000010000000010002000000
      0000FFFFFF00000000020000000000000000006419000006004D656D6F313200
      020048000000E6020000C3030000110000000300000001000000000000000000
      FFFFFF1F2C02000000000001001C00F1F2F02E205B50414745235D20E8E7205B
      544F54414C50414745535D00000000FFFF000000000002000000010000000405
      00417269616C000A00000000000000000009000000CC00020000000000FFFFFF
      000000000200000000000000FEFEFF020000000A002043617465676F72793100
      000000040073756D6D00010030000000000000000000FC000000000000000000
      0000000000000058008DF9BA39EDD2E2400EB3965DED4EE440}
  end
  object frRashDocITOG: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frRashDocITOGGetValue
    Left = 533
    Top = 150
    ReportForm = {
      19000000FC180000190000FFFF01000100FFFFFFFFFF090000009A0B00003408
      00004800000024000000240000002400000001FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      0000240000002F040000B50000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E4865616465723100020100000000300100002F0400001200000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200AF0100000B004D61737465724461746131000201000000008A0100002F04
      0000140000003100050001000000000000000000FFFFFF1F000000000C006672
      4442446174615365743100000000000000010000000000000200000001000000
      0000000001000000C8000000140000000100000000000002001A0200000B0050
      616765466F6F7465723100020100000000D00200002F04000014000000300003
      0001000000000000000000FFFFFF1F00000000000000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200C70200000C0047726F75704865616465723100020100000000580100
      002F040000000000003000100001000000000000000000FFFFFF1F000000001F
      005B6F647353656C446F6352617368506F6C7563682E2246435F52414E47225D
      0000000003000500626567696E0D12002020464E5F53554D4D5F4752203A3D20
      303B0D0300656E64000000000000000002000000010000000000000001000000
      C800000014000000010000000000000200330300000C0047726F7570466F6F74
      65723100020100000000B40100002F0400001400000030001100010000000000
      00000000FFFFFF1F000000000000000000000000000100000000000002000000
      010000000000000001000000C800000014000000010000000000000200B10300
      000D004D61737465724461746152504F00020100000000100200002F04000010
      0000003000050001000000000000000000FFFFFF1F000000001100667244424E
      6163656E6B615563656E6B6100000000000000FFFF0000000000020000000100
      00000000000001000000C800000014000000010000000000000200200400000F
      004D6173746572466F6F74657252504F00020100000000300200002F04000014
      0000003000060001000000000000000000FFFFFF1F0000000000000000000000
      0000FFFF000000000002000000010000000000000001000000C8000000140000
      000100000000000002008C0400000B004D617374657244617461340002010000
      00006C0200002F040000140000003000050001000000000000000000FFFFFF1F
      0000000001003100000000000000FFFF00000000000200000001000000000000
      0001000000C800000014000000010000000000000200FB0400000F004D617374
      657248656164657252504F00020100000000EC0100002F040000140000003000
      040001000000000000000000FFFFFF1F00000000000000000000000000FFFF00
      0000000002000000010000000000000001000000C80000001400000001000000
      0000000000F105000005004D656D6F31000200480000009B000000C30300001B
      0000000300000001000000000000000000FFFFFF1F2C02000000000001001F00
      CEF2F7E5F220EFEE20F0E0F1F5EEE4F320EFEE20EFEEEBF3F7E0F2E5EBFFEC00
      06000500626567696E0D12002020464E5F53554D4D5F4752203A3D20303B0D13
      002020464E5F53554D4D5F414C4C203A3D20303B0D12002020464E5F53554D4D
      5F5543203A3D20303B0D090020204E203A3D20303B0D0300656E6400FFFF0000
      0000000200000001000000000500417269616C000E0000000200000000000200
      0000CC00020000000000FFFFFF00000000020000000000000000007906000005
      004D656D6F330002007300000030010000000300001200000003000F00DC0500
      00000000000000CCFFCC002C02000000000001000A00CFEEEBF3F7E0F2E5EBFC
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      02000000000002000000CC00020000000000FFFFFF0000000002000000000000
      000000FF06000005004D656D6F35000200730300003001000098000000120000
      0003000F00DC050000000000000000CCFFCC002C02000000000001000800D1F3
      ECECE02C20F000000000FFFF0000000000020000000100000000050041726961
      6C000A00000002000000000002000000CC00020000000000FFFFFF0000000002
      000000000000000000A407000006004D656D6F313000020048000000B7000000
      C3030000180000000300000001000000000000000000FFFFFF1F2C0200000000
      0001002600E7E020EFE5F0E8EEE420F1205B7661725F64617465315D20EFEE20
      5B7661725F64617465325D00000000FFFF000000000002000000010000000005
      00417269616C000C0000000200000000000A000000CC00020000000000FFFFFF
      00000000020000000000000000002908000006004D656D6F3135000200480000
      006C020000DF0200001400000003000F00DC050000000000000000FFFFFF1F2C
      02000000000001000600C8F2EEE3EE3A00000000FFFF00000000000200000001
      000000000500417269616C000A00000002000000000009000000CC0002000000
      0000FFFFFF0000000002000000000000000000D608000006004D656D6F313700
      0200270300006C020000E40000001400000023000F00DC050000000000000000
      FFFFFF1F2C020401100023232320232323202323302E303020F00001001E005B
      5B464E5F53554D4D5F414C4C5D202B205B464E5F53554D4D5F55435D5D000000
      00FFFF00000000000200000001000000000500417269616C000A000000020000
      00000009000000CC00020000000000FFFFFF0000000002000000000000000000
      7109000006004D656D6F313100020048000000D1020000C30300001100000003
      00000001000000000000000000FFFFFF1F2C02000000000001001C00F1F2F02E
      205B50414745235D20E8E7205B544F54414C50414745535D00000000FFFF0000
      0000000200000001000000040500417269616C000A0000000000000000000900
      0000CC00020000000000FFFFFF0000000002000000000000000000F509000006
      004D656D6F313400020048000000300100002B0000001200000003000F00DC05
      0000000000000000CCFFCC002C02000000000001000500B920EF2FEF00000000
      FFFF00000000000200000001000000000500417269616C000A00000002000000
      000002000000CC00020000000000FFFFFF000000000200000000000000000097
      0A000005004D656D6F32000200730000008A010000000300001400000003000F
      002C010000000000000000CCFFFF002C02000000000001002400205B6F647353
      656C446F6352617368506F6C7563682E2246435F4D4F5F47525F544F225D0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000200
      0000000008000000CC00020000000000FFFFFF00000000020000000000000000
      00360B000006004D656D6F3132000200480000008A0100002B00000014000000
      03000F002C010000000000000000CCFFFF002C020000000000010003005B4E5D
      0003000500626567696E0D0D0020204E203A3D204E202B20313B0D0300656E64
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      770C000006004D656D6F3133000200730300008A010000980000001400000003
      000F002C010000000000000000CCFFFF002C0204011200232323202323232023
      2323202323302E303000010020005B6F647353656C446F6352617368506F6C75
      63682E22464E5F5052494345225D0004000500626567696E0D3F002020464E5F
      53554D4D5F414C4C203A3D20464E5F53554D4D5F414C4C202B5B6F647353656C
      446F6352617368506F6C7563682E22464E5F5052494345225D3B0D3E00202046
      4E5F53554D4D5F4752203A3D20464E5F53554D4D5F4752202B205B6F64735365
      6C446F6352617368506F6C7563682E22464E5F5052494345225D3B0D0300656E
      6400FFFF00000000000200000001000000000500417269616C000A0000000200
      0000000009000000CC00020000000000FFFFFF00000000020000000000000000
      000D0D000006004D656D6F32360002004800000041000000D20100000E000000
      0300000001000000000000000000FFFFFF1F2C02000000000001001700EDE0E8
      ECE5EDEEE2E0EDE8E520F3F7F0E5E6E4E5EDE8FF00000000FFFF000000000002
      00000001000000000500417269616C0008000000000000000000020000000100
      020000000000FFFFFF00000000020000000000000000009A0D000006004D656D
      6F32370002004800000025000000D20100001C00000003000200010000000000
      00000000CCFFCC002C02000000000001000E005B7661725F7265636569766572
      5D00000000FFFF00000000000200000001000000000500417269616C000A0000
      00000000000000120000000100020000000000FFFFFF00000000020000000000
      00000000270E000006004D656D6F32380002004800000055000000D201000019
      0000000300020001000000000000000000CCFFCC002C02000000000001000E00
      5B7661725F6D6F5F67726F75705D00000000FFFF000000000002000000010000
      00000500417269616C000C00000000000000000012000000CC00020000000000
      FFFFFF0000000002000000000000000000C00E000006004D656D6F3331000200
      480000006F000000D20100000E0000000300000001000000000000000000FFFF
      FF1F2C02000000000001001A00EDE0E8ECE5EDEEE2E0EDE8E520EFEEE4F0E0E7
      E4E5EBE5EDE8FF00000000FFFF00000000000200000001000000000500417269
      616C000800000000000000000002000000CC00020000000000FFFFFF00000000
      02000000000000000000A10F000006004D656D6F3139000200DB010000B40100
      009801000014000000030000002C010000000000000000FFFFFF1F2C02000000
      000001006200C8F2EEE3EE20EFEE205B6F647353656C446F6352617368506F6C
      7563682E2246435F52414E47225D3A205B464F524D4154464C4F415428272323
      232C2323232C2323232C2323232C2323302E2C30302E272C205B464E5F53554D
      4D5F414C4C5D295D000000000100000000000002000000010000000005004172
      69616C000A00000002000000000009000000CC00020000000000FFFFFF000000
      00020000000000000000002C10000006004D656D6F323000020073000000EC01
      0000890000001400000003000F002C010000000000000000FFFFFF002C020000
      00000001000C00D3F6E5EDEAE02028D0CFCE2900000000FFFF00000000000200
      000001000000000500417269616C000A00000002000000000008000000CC0002
      0000000000FFFFFF0000000002000000000000000000CB10000006004D656D6F
      323100020048000000EC0100002B0000001400000003000F002C010000000000
      000000FFFFFF002C020000000000010003005B4E5D0003000500626567696E0D
      0D0020204E203A3D204E202B20313B0D0300656E6400FFFF0000000000020000
      0001000000000500417269616C000A0000000000000000000A000000CC000200
      00000000FFFFFF00000000020000000000000000006611000006004D656D6F32
      320002005C01000010020000740100001000000003000F002C01000000000000
      0000CCFFFF002C02000000000001001C005B6F64734E6163656E6B615563656E
      6B612E2246435F4E414D45225D00000000FFFF00000000000200000001000000
      000500417269616C000800000000000000000008000000CC00020000000000FF
      FFFF0000000002000000000000000000F111000006004D656D6F323300020073
      03000010020000980000001000000003000F002C010000000000000000CCFFFF
      002C0204010E0023232320232323202323302E303000000000000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000900
      0000CC00020000000000FFFFFF00000000020000000000000000008212000006
      004D656D6F323400020048000000300200002B0300001400000003000F002C01
      0000000000000000CCFFFF002C02000000000001001200C8F2EEE3EE20F3F6E5
      EDEAE02028D0CFCE2900000000FFFF0000000000020000000100000001050041
      7269616C000A00000002000000000009000000CC00020000000000FFFFFF0000
      0000020000000000000000006713000006004D656D6F32350002007303000030
      020000980000001400000003000F002C010000000000000000CCFFFF002C0204
      010E0023232320232323202323302E30300001000C005B464E5F53554D4D5F55
      435D0003000500626567696E0D3C002F2F205B53554D285B6F64734E6163656E
      6B615563656E6B612E22464E5F4E414348454E4B41225D2C206F64734E616365
      6E6B615563656E6B61295D0D0300656E6400FFFF000000000002000000010000
      00000500417269616C000A00000002000000000009000000CC00020000000000
      FFFFFF00000000020000000000000000000214000006004D656D6F3239000200
      FC00000010020000600000001000000003000F002C010000000000000000CCFF
      FF002C02000000000001001C005B6F64734E6163656E6B615563656E6B612E22
      46445F44415441225D00000000FFFF0000000000020000000100000000050041
      7269616C00080000000000000000000A000000CC00020000000000FFFFFF0000
      0000020000000000000000009F14000006004D656D6F3330000200D002000010
      020000450000001000000003000F002C010000000000000000CCFFFF002C0200
      0000000001001E005B6F64734E6163656E6B615563656E6B612E22464E5F4E55
      4D424552225D00000000FFFF0000000000020000000100000000050041726961
      6C00080000000000000000000A000000CC00020000000000FFFFFF0000000002
      0000000000000000002615000006004D656D6F33320002004800000010020000
      B40000001000000003000F002C010000000000000000CCFFFF002C0200000000
      00010008005B4C494E45235D2900000000FFFF00000000000200000001000000
      000500417269616C000800000000000000000009000000CC00020000000000FF
      FFFF0000000002000000000000000000A915000006004D656D6F3333000200FC
      000000EC010000600000001400000003000F002C010000000000000000FFFFFF
      002C02000000000001000400C4E0F2E000000000FFFF00000000000200000001
      000000000500417269616C000800000000000000000012000000CC0002000000
      0000FFFFFF00000000020000000000000000003216000006004D656D6F333400
      02005C010000EC010000740100001400000003000F002C010000000000000000
      FFFFFF002C02000000000001000A00CCE5E4E8EAE0ECE5EDF200000000FFFF00
      000000000200000001000000000500417269616C000800000000000000000012
      000000CC00020000000000FFFFFF0000000002000000000000000000B2160000
      06004D656D6F3335000200D0020000EC010000450000001400000003000F002C
      010000000000000000FFFFFF002C02000000000001000100B900000000FFFF00
      000000000200000001000000000500417269616C000800000000000000000012
      000000CC00020000000000FFFFFF00000000020000000000000000002F170000
      06004D656D6F333600020073030000EC010000980000001400000003000F002C
      010000000000000000FFFFFF002C020000000000000000000000FFFF00000000
      000200000001000000000500417269616C000800000000000000000012000000
      CC00020000000000FFFFFF0000000002000000000000000000B617000006004D
      656D6F333700020015030000EC0100005E0000001400000003000F002C010000
      000000000000FFFFFF002C02000000000001000800D1F3ECECE02C20F0000000
      00FFFF00000000000200000001000000000500417269616C0008000000000000
      00000012000000CC00020000000000FFFFFF0000000002000000000000000000
      AF18000006004D656D6F333800020015030000100200005E0000001000000003
      000F002C010000000000000000CCFFFF002C0204010E00232323202323232023
      23302E30300001001F005B6F64734E6163656E6B615563656E6B612E22464E5F
      554348454E4B41225D0003000500626567696E0D3D002020464E5F53554D4D5F
      5543203A3D20464E5F53554D4D5F5543202B205B6F64734E6163656E6B615563
      656E6B612E22464E5F554348454E4B41225D3B0D0300656E6400FFFF00000000
      000200000001000000000500417269616C000800000000000000000009000000
      CC00020000000000FFFFFF000000000200000000000000FEFEFF020000000A00
      2043617465676F72793100000000040073756D6D000100300000000000000000
      00FC0000000000000000000000000000000058008DF9BA39EDD2E2400EB3965D
      ED4EE440}
  end
  object frRashDocPoMedicType: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frRashDocITOGGetValue
    Left = 527
    Top = 300
    ReportForm = {
      19000000FF160000190000FFFF01000100FFFFFFFFFF090000009A0B00003408
      00004800000024000000190000002400000001FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      0000240000002F040000B50000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E4865616465723100020100000000280100002F0400002700000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200AF0100000B004D6173746572446174613100020100000000940100002F04
      0000140000003100050001000000000000000000FFFFFF1F000000000C006672
      4442446174615365743100000000000000FFFF00000000000200000001000000
      0000000001000000C8000000140000000100000000000002001C0200000D004D
      6173746572466F6F7465723100020100000000040200002F0400001900000031
      00060001000000000000000000FFFFFF1F00000000000000000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      000000000200870200000B0050616765466F6F74657231000201000000003802
      00002F040000140000003000030001000000000000000000FFFFFF1F00000000
      000000000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200F30200000C0047726F7570466F6F74
      65723100020100000000C60100002F0400001400000030001100010000000000
      00000000FFFFFF1F00000000000000000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000200AB0300
      000C0047726F75704865616465723100020100000000640100002F0400001400
      00003000100001000000000000000000FFFFFF1F0000000025005B6F64735365
      6C446F63506F4D65646963547970652E2246435F6D6564696374797065225D00
      00000003000500626567696E0D170020202020464E5F47524F55505F53554D4D
      203A3D20303B0D0300656E6400FFFF0000000000020000000100000000000000
      01000000C8000000140000000100000000000000002D04000005004D656D6F32
      000200B301000028010000450000002700000003000F00DC0500000000000000
      00CCFFCC002C02000000000001000400C4E0F2E000000000FFFF000000000002
      00000001000000000500417269616C00090000000200000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000B304000005004D656D
      6F33000200F801000028010000AF0000002700000003000F00DC050000000000
      000000CCFFCC002C02000000000001000800C4EEEAF3ECE5EDF200000000FFFF
      00000000000200000001000000000500417269616C0009000000020000000000
      0A000000CC00020000000000FFFFFF00000000020000000000000000003B0500
      0005004D656D6F34000200A702000028010000890000002700000003000F00DC
      050000000000000000CCFFCC002C02000000000001000A00CFEEEBF3F7E0F2E5
      EBFC00000000FFFF00000000000200000001000000000500417269616C000900
      00000200000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000D705000006004D656D6F3431000200B30100009401000045000000
      1400000003000F002C010000000000000000FFFFFF1F2C02000000000001001D
      005B6F647353656C446F63506F4D65646963547970652E2244415441225D0000
      0000FFFF00000000000200000001000000000500417269616C00080000000000
      0000000008000000CC00020000000000FFFFFF00000000020000000000000000
      007506000006004D656D6F3432000200F801000094010000AF00000014000000
      03000F002C010000000000000000FFFFFF1F2C02000000000001001F005B6F64
      7353656C446F63506F4D65646963547970652E2246435F444F43225D00000000
      FFFF00000000000200000001000000000500417269616C000800000000000000
      000008000000CC00020000000000FFFFFF000000000200000000000000000018
      07000006004D656D6F3434000200A70200009401000089000000140000000300
      0F002C010000000000000000FFFFFF1F2C020000000000010024005B6F647353
      656C446F63506F4D65646963547970652E2246435F4D4F5F47525F544F225D00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      000000000008000000CC00020000000000FFFFFF000000000200000000000000
      00009D07000006004D656D6F3135000200480000000402000018030000190000
      0003000F00DC050000000000000000FFFFFF1F2C02000000000001000600C8F2
      EEE3EE3A00000000FFFF00000000000200000001000000000500417269616C00
      0A00000002000000000009000000CC00020000000000FFFFFF00000000020000
      000000000000003F08000006004D656D6F31370002006003000004020000B600
      00001900000023000F00DC050000000000000000FFFFFF1F2C02040114002323
      232023232320232323202323302E303020F00001000F005B464E5F49544F474F
      5F53554D4D5D00000000FFFF0000000000020000000100000000050041726961
      6C000C00000002000000000009000000CC00020000000000FFFFFF0000000002
      000000000000000000DA08000006004D656D6F31310002004800000039020000
      CE030000110000000300000001000000000000000000FFFFFF1F2C0200000000
      0001001C00F1F2F02E205B50414745235D20E8E7205B544F54414C5041474553
      5D00000000FFFF00000000000200000001000000040500417269616C000A0000
      0000000000000009000000CC00020000000000FFFFFF00000000020000000000
      000000005E09000006004D656D6F313400020048000000280100001E00000027
      00000003000F00DC050000000000000000CCFFCC002C02000000000001000500
      B920EF2FEF00000000FFFF00000000000200000001000000000500417269616C
      00090000000200000000000A000000CC00020000000000FFFFFF000000000200
      0000000000000000E509000006004D656D6F343000020048000000940100001E
      0000001400000003000F0001000000000000000000FFFFFF1F2C020000000000
      010008005B4C494E45235D2900000000FFFF0000000000020000000100000000
      0500417269616C000800000000000000000009000000CC00020000000000FFFF
      FF0000000002000000000000000000700A000006004D656D6F32310002006600
      0000280100000D0100002700000003000F00DC050000000000000000CCFFCC00
      2C02000000000001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF000000
      00000200000001000000000500417269616C00090000000200000000000A0000
      00CC00020000000000FFFFFF0000000002000000000000000000F70A00000600
      4D656D6F32330002007301000028010000400000002700000003000F00DC0500
      00000000000000CCFFCC002C02000000000001000800C5E42E20E8E7EC2E0000
      0000FFFF00000000000200000001000000000500417269616C00090000000200
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      007C0B000006004D656D6F323400020030030000280100003000000027000000
      03000F00DC050000000000000000CCFFCC002C02000000000001000600CAEEEB
      2DE2EE00000000FFFF00000000000200000001000000000500417269616C0009
      0000000200000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000000020C000006004D656D6F323500020060030000280100004D0000
      002700000003000F00DC050000000000000000CCFFCC002C0200000000000100
      0700D6E5EDE02C20F000000000FFFF0000000000020000000100000000050041
      7269616C00090000000200000000000A000000CC00020000000000FFFFFF0000
      000002000000000000000000890C000006004D656D6F3236000200AD03000028
      010000690000002700000003000F00DC050000000000000000CCFFCC002C0200
      0000000001000800D1F3ECECE02C20F000000000FFFF00000000000200000001
      000000000500417269616C00090000000200000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000290D000006004D656D6F323700
      020066000000940100000D0100001400000003000F0001000000000000000000
      FFFFFF1F2C020000000000010021005B6F647353656C446F63506F4D65646963
      547970652E224E414D454B415254225D00000000FFFF00000000000200000001
      000000000500417269616C000800000000000000000008000000CC0002000000
      0000FFFFFF0000000002000000000000000000C90D000006004D656D6F323800
      02007301000094010000400000001400000003000F0001000000000000000000
      FFFFFF1F2C020000000000010021005B6F647353656C446F63506F4D65646963
      547970652E2246435F4544495A4D225D00000000FFFF00000000000200000001
      000000000500417269616C00080000000000000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000670E000006004D656D6F323900
      02003003000094010000300000001400000003000F0001000000000000000000
      FFFFFF1F2C02000000000001001F005B6F647353656C446F63506F4D65646963
      547970652E2246435F4B4F4C225D00000000FFFF000000000002000000010000
      00000500417269616C00080000000000000000000A000000CC00020000000000
      FFFFFF00000000020000000000000000001E0F000006004D656D6F3330000200
      60030000940100004D0000001400000003000F0001000000000000000000FFFF
      FF1F2C020301100023232320232323202323302E303020F000010028005B6F64
      7353656C446F63506F4D65646963547970652E22464E5F50524943455F444554
      41494C225D00000000FFFF00000000000200000001000000000500417269616C
      00080000000000000000000A000000CC00020000000000FFFFFF000000000200
      00000000000000006810000006004D656D6F3331000200AD0300009401000069
      0000001400000003000F0001000000000000000000FFFFFF1F2C020301100023
      232320232323202323302E303020F000010020005B6F647353656C446F63506F
      4D65646963547970652E22464E5F53554D4D225D0004000500626567696E0D44
      002020464E5F47524F55505F53554D4D203A3D20464E5F47524F55505F53554D
      4D202B205B6F647353656C446F63506F4D65646963547970652E22464E5F5355
      4D4D225D3B0D44002020464E5F49544F474F5F53554D4D203A3D20464E5F4954
      4F474F5F53554D4D202B205B6F647353656C446F63506F4D6564696354797065
      2E22464E5F53554D4D225D3B0D0300656E6400FFFF0000000000020000000100
      0000000500417269616C00080000000000000000000A000000CC000200000000
      00FFFFFF00000000020000000000000000004811000005004D656D6F36000200
      480000009B000000CE0300001B0000000300000001000000000000000000FFFF
      FF1F2C02000000000001002500CEF2F7E5F220EFEE20F0E0F1F5EEE4F320EFEE
      20E3F0F3EFEFE0EC20F3F7E5F2EDEEF1F2E80004000500626567696E0D150020
      20464E5F47524F55505F53554D4D203A3D20303B0D15002020464E5F49544F47
      4F5F53554D4D203A3D20303B0D0300656E6400FFFF0000000000020000000100
      0000040500417269616C001000000002000000000002000000CC000200000000
      00FFFFFF0000000002000000000000000000EC11000005004D656D6F37000200
      48000000B3000000CE030000180000000300000001000000000000000000FFFF
      FF1F2C02000000000001002600E7E020EFE5F0E8EEE420F1205B7661725F6461
      7465315D20EFEE205B7661725F64617465325D00000000FFFF00000000000200
      000001000000040500417269616C000B0000000200000000000A000000CC0002
      0000000000FFFFFF00000000020000000000000000008112000005004D656D6F
      380002004800000040000000D20100000E000000030000000100000000000000
      0000FFFFFF1F2C02000000000001001700EDE0E8ECE5EDEEE2E0EDE8E520F3F7
      F0E5E6E4E5EDE8FF00000000FFFF000000000002000000010000000105004172
      69616C0008000000000000000000020000000100020000000000FFFFFF000000
      00020000000000000000000D13000005004D656D6F3900020048000000240000
      00D20100001C0000000300020001000000000000000000CCFFCC002C02000000
      000001000E005B7661725F72656365697665725D00000000FFFF000000000002
      00000001000000010500417269616C000A000000000000000000120000000100
      020000000000FFFFFF00000000020000000000000000009A13000006004D656D
      6F31330002004800000055000000D20100001900000003000200010000000000
      00000000CCFFCC002C02000000000001000E005B7661725F6D6F5F67726F7570
      5D00000000FFFF00000000000200000001000000010500417269616C000C0000
      0000000000000012000000CC00020000000000FFFFFF00000000020000000000
      000000003314000006004D656D6F3136000200480000006F000000D20100000E
      0000000300000001000000000000000000FFFFFF1F2C02000000000001001A00
      EDE0E8ECE5EDEEE2E0EDE8E520EFEEE4F0E0E7E4E5EBE5EDE8FF00000000FFFF
      00000000000200000001000000010500417269616C0008000000000000000000
      02000000CC00020000000000FFFFFF0000000002000000000000000000E71400
      0006004D656D6F313200020048000000C6010000180300001400000003000900
      02000000000000000000FFFFFF1F2C02000000000001003500C8F2EEE3EE20EF
      EE20F2E8EFF320225B6F647353656C446F63506F4D65646963547970652E2246
      435F6D6564696374797065225D2200000000FFFF000000000002000000010000
      00000500417269616C000A00000002000000000009000000CC00020000000000
      FFFFFF00000000020000000000000000008915000006004D656D6F3138000200
      60030000C6010000B60000001400000003000F0002000000000000000000FFFF
      FF1F2C02040114002323232023232320232323202323302E303020F00001000F
      005B464E5F47524F55505F53554D4D5D00000000FFFF00000000000200000001
      000000000500417269616C000A00000002000000000009000000CC0002000000
      0000FFFFFF00000000020000000000000000002D16000005004D656D6F310002
      006600000064010000B00300001400000003000F0002000000000000000000CC
      FFFF002C02000000000001002600205B6F647353656C446F63506F4D65646963
      547970652E2246435F6D6564696374797065225D00000000FFFF000000000002
      00000001000000000500417269616C000A000000020000000000080000000100
      020000000000FFFFFF0000000002000000000000000000B216000005004D656D
      6F3500020048000000640100001E0000001400000003000F0002000000000000
      000000CCFFFF002C020000000000010007005B4C494E45235D00000000FFFF00
      000000000200000001000000000500417269616C00080000000000000000000A
      000000CC00020000000000FFFFFF000000000200000000000000FEFEFF020000
      000A002043617465676F72793100000000040073756D6D000100300000000000
      00000000FC0000000000000000000000000000000058008DF9BA39EDD2E2400E
      B3965DED4EE440}
  end
  object odsSelDocPoMedicType: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  MASTER1.*, DETAIL1.*,'
      
        '  rtrim(TO_CHAR(DETAIL1.FN_KOL, '#39'FM999G999G990D99999'#39'),'#39'.,'#39') as ' +
        'FC_KOL'
      '  FROM'
      '    ('
      '     SELECT'
      '       MOFROMID,'
      '       TDOCS.FC_COMMENT,'
      '       FP_VID,'
      '       FN_PRICE AS FN_PRICE_MASTER,'
      '       MOOWNERID,'
      '       TDOCS.DPID,'
      
        '       med.GET_DECODEDOCVIDMOVE(fp_vidmove)||'#39' '#8470' '#39'||TDOCS.fc_doc' +
        '||'#39' '#1086#1090' '#39'||to_char(TDOCS.fd_invoice,'#39'dd.mm.yyyy'#39') AS fc_DOC,'
      
        '       MED.PKGTDOCS.GET_DOC_DESTINATION(TDOCS.fp_vid, TDOCS.fp_v' +
        'idmove, TDOCS.fk_mogroupid_TO, TDOCS.postavid) AS FC_MO_GR_TO,'
      
        '       MED.PKGTDOCS.GET_DOC_SOURCE (TDOCS.fp_vid, TDOCS.fp_vidmo' +
        've, TDOCS.fk_mogroupid_FROM, TDOCS.postavid) as NAMEFROM,'
      ''
      '       TRUNC(TDOCS.FD_DATA) AS DATA,'
      '       MOTOID'
      
        '     FROM   MED.TDOCS --, MED.TMO, MED.TMO T2, MED.TMO_GROUP MOG' +
        'R_FROM,  MED.TMO_GROUP MOGR_TO'
      
        '     WHERE TDOCS.fk_mogroupid_from = :MO_GROUP -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084 +
        ' '#1085#1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '       AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:ADATA1) AND TRUNC' +
        '(:ADATA2)'
      
        '       AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  ' +
        'TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to' +
        ', :MO_GROUP) = -1'
      
        '       AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087#1086#1089#1082#1086#1083 +
        #1100#1082#1091' '#1074#1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085#1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086#1076'+'#1088 +
        #1072#1089#1093#1086#1076')'
      '       AND ((:IS_RPO = 1)OR(tdocs.fp_vidmove <> 7))'
      '       AND (not tdocs.fp_vidmove in (4,5))'
      '       AND TDOCS.FL_EDIT = 0 '
      
        '       AND ((:FK_PROFIL_ID = -1) or TDOCS.MOTOID = :FK_PROFIL_ID' +
        ') -- '#1055#1088#1086#1092#1080#1083#1080
      '    ) MASTER1,'
      '    (SELECT '
      '          TDPC.DPID,'
      '          TDPC.DPCID,'
      '          TKART.MEDICID,'
      '          TDPC.FN_KOL,'
      '          (TKART.FN_PRICE*TDPC.FN_KOL) as FN_SUMM,'
      '          TKART.FN_PRICE AS FN_PRICE_DETAIL,'
      '          TKART.KARTID,'
      '          TMEDIC.FC_NAME as MEDICNAME,'
      '          TKART.FN_PARTY_NUM,'
      
        '          TMEDIC.FC_NAME||'#39'('#1087'. '#8470#39'|| TKART.FN_PARTY_NUM||'#39')'#39' AS N' +
        'AMEKART,'
      '          FS.FC_NAME FC_FINSOURCE,'
      '          TKART.FC_SERIAL,'
      '          TEI.FC_NAME AS FC_EDIZM,'
      '          UG.root_fc_uchgr as FC_medictype'
      '        FROM'
      '          MED.TDPC, MED.TKART, MED.TMEDIC, MED.TEI, MED.TDOCS, '
      
        '          (select connect_by_root fc_uchgr as root_fc_uchgr, con' +
        'nect_by_root uchgrid as root_uchgrid, t.* from med.tuchgr t conn' +
        'ect by prior uchgrid = parentid start with parentid = 0) UG, MED' +
        '.TFINSOURCE FS'
      '        WHERE'
      '          TDPC.KARTID = TKART.KARTID'
      '          AND TKART.MEDICID=TMEDIC.MEDICID'
      '          AND TMEDIC.EIID = TEI.EIID(+)'
      '          AND TKART.FK_FINSOURCE_ID = FS.FK_ID (+)'
      '          AND TDPC.DPID = TDOCS.DPID'
      
        '          AND TDOCS.fk_mogroupid_from = :MO_GROUP -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082 +
        #1072#1077#1084' '#1085#1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '            AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:ADATA1) AND ' +
        'TRUNC(:ADATA2)'
      
        '            AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_V' +
        'ID,  TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroup' +
        'id_to, :MO_GROUP) = -1                         '
      
        '            AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087 +
        #1086#1089#1082#1086#1083#1100#1082#1091' '#1074#1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085#1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080 +
        #1093#1086#1076'+'#1088#1072#1089#1093#1086#1076')'
      '            AND (not tdocs.fp_vidmove in (4,5))'
      '            AND TDOCS.FL_EDIT = 0  '
      '         and #uchgrid# = UG.UCHGRID'
      '         and ( (:pUCHGR = -1) or '
      '                #uchgrid#'
      
        '                in (select uchgrid from med.tuchgr connect by pr' +
        'ior uchgrid = parentid start with uchgrid = :pUCHGR))'
      '    ) DETAIL1'
      '  WHERE MASTER1.DPID = DETAIL1.DPID'
      
        'ORDER BY UPPER(FC_medictype), MASTER1.DATA,  LOWER(MEDICNAME), F' +
        'N_PARTY_NUM')
    Optimize = False
    Variables.Data = {
      0300000006000000070000003A4144415441310C0000000700000078700B0101
      010100000000070000003A4144415441320C0000000700000078710B1E010101
      00000000090000003A4D4F5F47524F555003000000040000009D040000000000
      00070000003A5055434847520300000004000000FFFFFFFF0000000007000000
      3A49535F52504F030000000400000000000000000000000D0000003A464B5F50
      524F46494C5F49440300000004000000FFFFFFFF00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000190000000400000044504944010000000000090000004D4F4F574E45
      5249440100000000000600000046435F444F430100000000000600000046505F
      5649440100000000000A00000046435F434F4D4D454E54010000000000080000
      004D4F46524F4D4944010000000000060000004D4F544F494401000000000002
      0000004432010000000000020000004431010000000000040000004441544101
      0000000000080000004E414D4546524F4D0100000000000B00000046435F4D4F
      544F4E414D4501000000000006000000445049445F3101000000000005000000
      4450434944010000000000070000004D45444943494401000000000006000000
      464E5F4B4F4C01000000000007000000464E5F53554D4D0100000000000F0000
      00464E5F50524943455F44455441494C010000000000060000004B4152544944
      010000000000080000004E414D454B4152540100000000000900000046435F53
      455249414C0100000000000800000045445F494E495A4D0100000000000F0000
      00464E5F50524943455F4D41535445520100000000000D00000046435F4D4F5F
      47525F46524F4D0100000000001E0000004D45442E4745545F4445434F444544
      4F435649442854444F43532E46505F010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 377
    Top = 300
  end
  object odsNacenkaUcenka: TOracleDataSet
    SQL.Strings = (
      '    SELECT '
      '    FD_DATA,'
      '    FC_NAME,'
      '    FN_NUMBER,'
      '--    CASE WHEN FN_SUMMA_FOR_INGRIDIENTS<=FN_SUMMA'
      '--     THEN ROUND(FN_SUMMA-FN_SUMMA_FOR_INGRIDIENTS,2)'
      '--     ELSE 0 end FN_NACHENKA,'
      '--    CASE WHEN FN_SUMMA_FOR_INGRIDIENTS>FN_SUMMA'
      '--     THEN ROUND(FN_SUMMA_FOR_INGRIDIENTS-FN_SUMMA,2)'
      '--     ELSE 0 end FN_UCHENKA'
      '     '
      '    CASE WHEN FN_SUMMA_TRUNCED<=FN_SUMMA'
      '     THEN FN_SUMMA-FN_SUMMA_TRUNCED'
      '     ELSE 0 end FN_UCHENKA,'
      '    CASE WHEN FN_SUMMA_TRUNCED>FN_SUMMA'
      '     THEN FN_SUMMA_TRUNCED-FN_SUMMA'
      '     ELSE 0 end FN_NACHENKA'
      ''
      'FROM'
      '('
      'SELECT'
      '    ROWNUM,'
      '    FD_DATA,'
      '    FC_NAME,'
      '    FC_SERIAL,'
      '    FN_NUMBER, '
      '    FN_AMOUNT,'
      '--    DETAIL2.FN_SUMMA_FOR_INGRIDIENTS,'
      
        '--    ROUND(DECODE(MASTER2.FN_AMOUNT,0,0, DETAIL2.FN_SUMMA_FOR_I' +
        'NGRIDIENTS / MASTER2.FN_AMOUNT),2) AS FN_PRICE_FOR_1,'
      
        '--    ROUND(ROUND(DECODE(MASTER2.FN_AMOUNT,0,0, DETAIL2.FN_SUMMA' +
        '_FOR_INGRIDIENTS / MASTER2.FN_AMOUNT),2) * MASTER2.FN_AMOUNT,2) ' +
        'AS FN_SUMMA_TRUNCED, -- '#1054#1050#1056#1059#1043#1051#1045#1053#1053#1040#1071
      
        '--    ROUND(ROUND(DECODE(MASTER2.FN_AMOUNT,0,0, DETAIL2.FN_SUMMA' +
        '_FOR_INGRIDIENTS / MASTER2.FN_AMOUNT),2) * MASTER2.FN_AMOUNT,2) ' +
        'AS FN_SUMMA,'
      '    DETAIL2.FN_SUMMA_FOR_INGRIDIENTS,'
      
        '    Round(DETAIL2.FN_SUMMA_FOR_INGRIDIENTS/FN_AMOUNT,2) AS FN_PR' +
        'ICE_FOR_1,'
      
        '    Round(DETAIL2.FN_SUMMA_FOR_INGRIDIENTS/FN_AMOUNT,2)*FN_AMOUN' +
        'T AS FN_SUMMA_TRUNCED, -- '#1054#1050#1056#1059#1043#1051#1045#1053#1053#1040#1071
      '    FN_SUMMA_FOR_INGRIDIENTS AS FN_SUMMA'
      ''
      '  FROM'
      '   ('
      'SELECT'
      '    ROWNUM,'
      '    KS.FK_ID,'
      '    KS.FD_DATA,'
      '    KS.FK_MEDICID,'
      '    M.FC_NAME,'
      '    KS.FC_SERIAL,'
      '    KS.FN_NUMBER,'
      '    KS.FN_AMOUNT,'
      '    KS.FL_EDIT,'
      '    KS.fk_doc_prih,'
      '    KS.fk_doc_rash'
      '        '
      '  FROM MED.TKARTCOMPOS KS, MED.TMEDIC M'
      '  WHERE KS.FK_MEDICID=M.MEDICID (+)'
      
        '    AND TRUNC(KS.FD_DATA) BETWEEN (TO_DATE(:DATE1)) AND (TO_DATE' +
        '(:DATE2))'
      '  ORDER BY ROWNUM'
      '   )MASTER2,'
      '   '
      '(SELECT  '
      '    FK_TKARTCOMPOSID,'
      '    SUM(FN_SUMMA) AS FN_SUMMA_FOR_INGRIDIENTS '
      '  FROM  '
      '(SELECT'
      '    K_ITEM.FK_TKARTCOMPOSID,'
      '    k.FN_PRICE * k_item.FN_AMOUNT AS FN_SUMMA     '
      '  FROM'
      '        MED.TKARTCO_ITEM K_ITEM,'
      '        MED.TKARTCOMPOS KS, med.tkart k'
      '      WHERE KS.FK_ID=K_ITEM.FK_TKARTCOMPOSID'
      '       and k_item.fk_kart_item = k.kartid'
      '       AND TRUNC(KS.FD_DATA) BETWEEN (:DATE1)AND (:DATE2)'
      ')  '
      'GROUP BY FK_TKARTCOMPOSID  '
      '      '
      '      '
      '   ) DETAIL2'
      '  WHERE MASTER2.FK_ID = DETAIL2.FK_TKARTCOMPOSID(+)'
      ')  '
      
        'WHERE TRUNC(FD_DATA) BETWEEN (TO_DATE(:DATE1)) AND (TO_DATE(:DAT' +
        'E2)) and :IS_RPO = 1'
      'order by FD_DATA, FN_NUMBER')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445310C00000000000000000000000600
      00003A44415445320C0000000000000000000000070000003A49535F52504F03
      000000040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000B000000464E5F4E414348454E4B410100000000000A0000
      00464E5F554348454E4B41010000000000}
    Cursor = crSQLWait
    Session = os
    Filter = 'FN_UCHENKA > 0'
    Filtered = True
    Left = 198
    Top = 150
  end
  object frDBNacenkaUcenka: TfrDBDataSet
    DataSet = odsNacenkaUcenka
    Left = 197
    Top = 197
  end
  object pmUchGr: TPopupMenu
    Tag = -1
    Left = 454
    Top = 36
    object miAllUchGr: TMenuItem
      Tag = -1
      AutoCheck = True
      Caption = #1042#1089#1077' '#1075#1088#1091#1087#1087#1099' '#1091#1095#1077#1090#1085#1086#1089#1090#1080
      Checked = True
      RadioItem = True
      OnClick = miAllUchGrClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
  end
  object odsUchGr: TOracleDataSet
    SQL.Strings = (
      'select * from MED.V$TUchGr'
      'where parentid = 0'
      'ORDER BY FC_UCHGR')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C010000000000}
    Session = os
    AfterOpen = odsUchGrAfterOpen
    Left = 408
    Top = 39
  end
  object oqInitMO: TOracleQuery
    SQL.Strings = (
      'begin'
      '  SELECT '
      
        '    NVL(MAX(MOID),-1), MAX(FK_SKLAD_ID), NVL(MAX(fl_treb),0), MA' +
        'X(FC_NAME), max(FK_SOTRID), max(login.GET_SOTR_POSTNAME(FK_SOTRI' +
        'D)), max(fk_curmogroupid)'
      
        '  into :nMOID, :PFK_SKLAD_ID, :PFL_Provizor, :PFC_MO, :PFK_SOTR_' +
        'ID, :PFC_SPEC, :nMO_GROUP '
      '  FROM MED.TMO T '
      '  WHERE T.FK_SOTRID = login.GET_SOTRID(:pAppSotrID);'
      ''
      '  med.pkg_medses.set_curmo(:nMOID);'
      '  med.pkg_medses.set_curmo_group(:nMO_GROUP);'
      '  med.pkg_medses.ResetDatePeriod;'
      ''
      '  if :PFK_SKLAD_ID is null then'
      
        '    select NVL(MAX(mg.FK_SKLAD_ID),-1) into :PFK_SKLAD_ID from m' +
        'ed.tmo_group mg where mg.GROUPID = :nMO_GROUP;'
      '  end if;'
      '  :PFK_SKLAD_ID := NVL(:PFK_SKLAD_ID,-1);'
      '  :pSYSDATE := sysdate;'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      03000000090000000B0000003A50415050534F54524944030000000000000000
      000000060000003A4E4D4F4944030000000400000090040000000000000A0000
      003A4E4D4F5F47524F5550030000000400000000000000000000000D0000003A
      50464B5F534B4C41445F49440300000004000000FFFFFFFF000000000D000000
      3A50464C5F50524F56495A4F5203000000040000000000000000000000090000
      003A50535953444154450C00000007000000786E0A150B2E1900000000070000
      003A5046435F4D4F050000000A000000CEF2E4E5EB20D0CFCE00000000000C00
      00003A50464B5F534F54525F49440300000004000000FFFFFFFF000000000900
      00003A5046435F53504543050000000000000000000000}
    Left = 292
    Top = 156
  end
  object ilImages: TImageList
    Left = 60
    Top = 38
    Bitmap = {
      494C010106005800640010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006A0000006A0000006A0000006A0000006A0000006A0000006A
      0000006A0000006A0000006A0000006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000095655F00A5696A00A5696A00A569
      6A00A5696A00006A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006A0000000000000000000093655E009F6F
      60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F
      60009F6F60009F6F600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000098686000FBE5C000F4D5AD00F0CF
      9F00EFCA9600006A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006A0000000000000000000097675F00FAE5
      C600F2D7B500F0D1AA00EECCA000EDC79500EBC28B00EABF8200E9BD7F00E9BD
      7F00EEC280009F6F600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009D6B6200FCE7C900F2D5B500F0D0
      A900EECB9E00006A0000FFFFFF0078BB7800006A00001C831C00FAFCFA006AB4
      6A00006A00004DA34D00FFFFFF00006A000000000000000000009C6B6200FCEA
      D000F3DCBF00F2D7B400F0D1AA00EFCC9E00EDC79500EBC28B00EABF8200E9BD
      7F00EEC280009F6F600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A36F6400FEEED400F4DDC000F2D7
      B500F0D1AA00006A0000FFFFFF00FFFFFF00B4DAB400016C01000D780D00006A
      00006AB46A00FFFFFF00FFFFFF00006A00000000000000000000A1706400FEF0
      DD00D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700EEC280009F6F600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A7746600FFF4E100F6E1CA00F3DC
      BF00F2D7B400006A0000FFFFFF00FFFFFF00FFFFFF004EA44E00006A00000A76
      0A00FAFCFA00FFFFFF00FFFFFF00006A00000000000000000000A7756600FFF6
      E700F7E6D300F6E1C900F3DCBF00F2D7B200F0D1A900EECC9F00EDC79600EBC2
      8B00EEC482009F6F600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD786900FFFBEE00F7E7D500F4E1
      CA00F3DCBF00006A0000FFFFFF00FFFFFF005FAD5F00006A00004AA14A00016C
      010023892300EEF7EE00FFFFFF00006A00000000000000000000AF7A6800FFFC
      F400D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700EFC78C009F6F600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47E6B00FFFFFB00F8EDE100F7E6
      D400F6E1C900006A0000FFFFFF00469F4600006A000060AD6000FFFFFF00BBDD
      BB00016B010023892300FFFFFF00006A00000000000000000000B7816B00FFFF
      FF00FBF2EB00F8EDDE00F7E6D300F6E1C700F3DCBD00F2D7B400F0D1A900EECC
      9E00F2CC97009F6F600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BA836D00FFFFFF00FCF4EE00FAED
      E100F8E9D500006A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006A00000000000000000000BD876D00FFFF
      FF00D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700F3D0A0009F6F600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BF877000FFFFFF00FFFBFA00FEF4
      ED00FAEEE000006A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006A00000000000000000000C58B6F00FFFF
      FF00FFFFFF00FFFBF700FBF3EB00FAEBDE00F7E6D300F6E1C500F2D8B600F0D3
      AA00F2D1A3009F6F600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C48C7200FFFFFF00FFFFFF00FFFC
      FA00FCF4ED00006A0000006A0000006A0000006A0000006A0000006A0000006A
      0000006A0000006A0000006A0000006A00000000000000000000CB907200FFFF
      FF00D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700F4D7AD009F6F600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CA917400FFFFFF00FFFFFF00FFFF
      FF00FFFCFA00FCF4ED00FAEDDE00F8E7D400FCEBD300E3D3BB00B7AD9C00A569
      6A00000000000000000000000000000000000000000000000000D0957400FFFF
      FF00FFFFFF00004B8200004B8200004B8200004B8200004B8200004B8200004B
      8200004B8200004B8200004B8200004B82000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE957600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFCFA00FCF6EB00FAEFE000A5696A00A5696A00A5696A00A569
      6A00000000000000000000000000000000000000000000000000D4987500FFFF
      FF00FFFFFF00004B820000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BD
      FF0000BDFF0000BDFF0000BDFF00004B82000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D3977800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFC00F4EBE600A5696A00E2A35B00EF993800BB70
      4F00000000000000000000000000000000000000000000000000D4987500FFFF
      FF00FFFFFF00004B820000BDFF00676767006767670067676700676767006767
      6700676767006767670000BDFF00004B82000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D59A7900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F8F8FE00A5696A00E5A55F00C2805C000000
      0000000000000000000000000000000000000000000000000000CF8E6800CF8E
      6800CF8E6800004B820000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BD
      FF0000BDFF0000BDFF0000BDFF00004B82000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D0906B00D0906B00D0906B00D090
      6B00D0906B00D0906B00D0906B00D0906B00A5696A00BB7F6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004B8200004B8200004B8200004B8200004B8200004B8200004B
      8200004B8200004B8200004B8200004B82000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009A6666006933340000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006C6A6A006C6A6A0000000000000000006C6A6A006C6A6A00000000000000
      00000000000000000000000000000000000000000000000000007B0000007B00
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000080000000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009A6666009A666600B9666600BB6868006933340000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C6A
      6A00AAA7A700A19F9F006C6A6A006C6A6A006C6A6A00E5E3E3006C6A6A006C6A
      6A006C6A6A00000000000000000000000000000000007B000000007B00007B00
      00007B0000007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000007B00000000000000
      00007B7B7B00000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B000000000000000000000000000000000000000000000000009A6666009A66
      6600C66A6B00D06A6B00D2686900C3686900693334009A6666009A6666009A66
      66009A6666009A6666009A6666000000000000000000000000006C6A6A00DAD9
      D900A19F9F00A19F9F00A19F9F0037363600353535006C6D6D00BFBFBF00E1E2
      E200B7B6B6006C6A6A006C6A6A006C6A6A0000FF0000007B0000007B0000007B
      00007B0000007B0000007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000007B0000007B000000
      00007B7B7B007B7B7B0000000000000000000000000000007B00000000000000
      00007B7B7B0000000000000000000000000000000000000000009A666600DE73
      7400D7707100D56F7000D56D6E00C76A6D0069333400FEA2A300FCAFB000FABC
      BD00F9C5C600F9C5C6009A66660000000000000000006C6A6A00D4D3D300CACA
      CA008E8C8C008E8C8C008E8C8C003C3B3B000A090A00070707000B0B0B000707
      07007A7A7A00BBBBBB006C6A6A000000000000FF0000007B0000007B0000007B
      0000007B0000007B00007B0000007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000007B0000007B000000
      7B0000000000000000007B7B7B000000000000007B0000007B0000007B000000
      7B000000000000000000000000000000000000000000000000009A666600E077
      7800DB757600DA747500DA727300CC6E71006933340039C5650025CF630029CC
      630019CB5B00F9C5C6009A666600000000006C6A6A00CACACA00CACACA008E8C
      8C00D7D4D400CECBCB00BFBCBC00B1AFAF00A3A0A000888686005E5B5C000707
      070009090900080808006C6A6A007673730000FF0000007B0000007B0000007B
      0000007B0000007B0000007B00007B0000007B7B7B007B7B7B00000000000000
      000000000000000000000000000000000000000000000000FF0000007B000000
      7B0000007B00000000000000000000007B0000007B0000007B0000007B000000
      7B000000000000000000000000000000000000000000000000009A666600E57D
      7E00E07A7B00DF797A00DF777800D07275006933340042C4680030CD670033CB
      670024CB6000F9C5C6009A666600000000006C6A6A00CACACA008E8C8C00EFEE
      EE00FFFEFE00FBFAFA00E3E0E100DEDEDE00DEDDDD00CFCECE00BDBCBC00ADAB
      AB008B898900585656007A7878007573730000FF0000007B0000007B0000007B
      000000FF0000007B0000007B0000007B00007B0000007B7B7B007B7B7B000000
      00000000000000000000000000000000000000000000000000000000FF000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B00000000000000
      00000000000000000000000000000000000000000000000000009A666600EA82
      8300E57F8000E37D7E00E6808100D3747600693334003DC2640029CB63002FCA
      640020CA5E00F9C5C6009A666600000000006C6A6A008E8C8C00FFFFFF00FEFC
      FC00FAFAFA00D5D4D50098919300A0989900B2ABAC00C4C0C100D7D7D700D8D8
      D800C7C6C600B7B6B600918F8F006C69690000FF0000007B0000007B00007B00
      000000FF000000FF0000007B0000007B0000007B00007B0000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000007B0000007B0000007B0000007B0000007B0000000000000000000000
      00000000000000000000000000000000000000000000000000009A666600F087
      8800E9818200EC969700FBDDDE00D8888A0069333400B8E1AC006BDC89005DD5
      800046D47300F9C5C6009A66660000000000000000006C6A6A006C6A6A00EDEB
      EB00B1A6A7007A6F72008A83880096929500969091009D9798009A9395009E98
      9900BBBABA00D1D1D100C2C2C2006C6A6A0000FF0000007B0000007B00007B00
      00007B7B7B000000000000FF0000007B0000007B0000007B00007B0000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      00000000FF0000007B0000007B0000007B0000007B007B7B7B00000000000000
      00000000000000000000000000000000000000000000000000009A666600F58C
      8D00EE868700F0999A00FDDCDD00DA888A0069333400FFF5D800FFFFE000FFFF
      DE00ECFDD400F9C5C6009A666600000000000000000000000000000000006C6A
      6A00BB897F00A7876D008B6F64007D6760006F626500797379008F8B8E00A9A3
      A400CBCACA00C1C1C1006C6A6A000000000000FF0000007B0000007B00007B00
      00007B7B7B000000000000FF000000FF0000007B0000007B0000007B00007B00
      00007B7B7B000000000000000000000000000000000000000000000000000000
      00000000FF0000007B0000007B0000007B0000007B00000000007B7B7B000000
      00000000000000000000000000000000000000000000000000009A666600FA91
      9200F48E8F00F28B8C00F48C8D00DC7F800069333400FDF3D400FFFFDF00FFFF
      DD00FFFFE000F9C5C6009A666600000000000000000000000000000000000000
      0000BD828100FFE3B400FFD39F00E9B28100C9997300BA916C00BD828100807D
      7E006C6A6A006C6A6A0000000000000000000000000063FF000000FF0000007B
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      FF0000007B0000007B0000007B0000007B0000007B0000007B00000000007B7B
      7B000000000000000000000000000000000000000000000000009A666600FE97
      9800F9939400F8929300F9909200E085850069333400FDF3D400FFFFDF00FFFF
      DD00FFFFDF00F9C5C6009A666600000000000000000000000000000000000000
      0000BD828100FFE0B800FFD3A700FFD09D00FFCE9000FFC68800BD8281000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000A5FF0000007B0000007B
      00007B0000007B7B7B007B7B7B00000000000000000000000000000000000000
      FF0000007B0000007B0000007B000000FF000000FF0000007B00000000000000
      00007B7B7B0000000000000000000000000000000000000000009A666600FF9B
      9C00FD979800FC969700FE979800E388890069333400FDF3D400FFFFDF00FFFF
      DD00FFFFDF00F9C5C6009A66660000000000000000000000000000000000C086
      8300FFE7CF00FFE0C000FFD9B200FFD3A500FFD09900BD828100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF0000007B
      0000007B00007B0000007B7B7B007B7B7B0000000000000000000000FF000000
      7B0000007B00000000007B7B7B0000000000000000000000FF0000007B000000
      7B00000000007B7B7B00000000000000000000000000000000009A666600FF9F
      A000FF9A9B00FF999A00FF9A9B00E78C8D0069333400FDF3D400FFFFDF00FFFF
      DD00FFFFDF00F9C5C6009A66660000000000000000000000000000000000BD82
      8100FEEBD800FFE6CC00FFDEBD00FFD8B100FED3A400BD828100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      0000007B0000007B00007B0000007B7B7B00000000000000FF0000007B000000
      7B00000000007B7B7B00000000000000000000000000000000000000FF000000
      7B0000007B0000000000000000000000000000000000000000009A6666009A66
      6600E98E8F00FE999A00FF9D9E00EB8F900069333400FBF0D200FDFCDC00FDFC
      DA00FDFCDC00F9C5C6009A666600000000000000000000000000BD828100FFFF
      F200FFFFF200FFEBD800FFE5CA00FFE1BD00F3C7A700BD828100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF0000007B00007B0000007B7B7B0000000000000000000000FF000000
      7B00848484000000000000000000000000000000000000000000000000000000
      FF0000007B0000007B0000000000000000000000000000000000000000000000
      00009A666600B0717200D7868700DA888800693334009A6666009A6666009A66
      66009A6666009A6666009A666600000000000000000000000000BD828100BD82
      8100BD828100FBEFE200FBE3CF00FBDDC200BD82810000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000007B00007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000000000009A6666009A6666006933340000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD828100BD828100BD8281000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00F800FFFF000000000000C00300000000
      0000C003000000000000C003000000000000C003000000000000C00300000000
      0000C003000000000000C003000000000000C003000000000000C00300000000
      0000C00300000000000FC00000000000000FC00000000000000FC00000000000
      001FC00000000000003FF80000000000E7FFFFFFFE7FF33FC3FF8FFFF07FE007
      81FF078FC001C00000FF0387C0018001007F8107C0010000003F800FC0010000
      001FC01FC0010000001FE03FC0018000040FF03FC001E0010407F01FC001F003
      8F03E00FC001F01FFF01E007C001E03FFFC0C183C001E03FFFE083C3C001C03F
      FFF0C7E1F001C07FFFF8FFF3FC7FF8FF00000000000000000000000000000000
      000000000000}
  end
  object dsGrid: TDataSource
    DataSet = odsSelDocPoFinSource
    Left = 664
    Top = 292
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    OnUserFunction = frReport1UserFunction
    OnObjectClick = frReport1ObjectClick
    OnMouseOverObject = frReport1MouseOverObject
    Left = 34
    Top = 324
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = odsSelDocPoMedicType
    Left = 36
    Top = 382
  end
  object pmDocsFilterPeriod: TPopupMenu
    Left = 252
    Top = 362
    object miPeriodCurMonth: TMenuItem
      Caption = #1058#1077#1082'. '#1084#1077#1089#1103#1094
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N20: TMenuItem
      Tag = 1
      Caption = #1071#1085#1074#1072#1088#1100
    end
    object N18: TMenuItem
      Tag = 2
      Caption = #1060#1077#1074#1088#1072#1083#1100
    end
    object N16: TMenuItem
      Tag = 3
      Caption = #1052#1072#1088#1090
    end
    object N17: TMenuItem
      Tag = 4
      Caption = #1040#1087#1088#1077#1083#1100
    end
    object N15: TMenuItem
      Tag = 5
      Caption = #1052#1072#1081
    end
    object N1: TMenuItem
      Tag = 6
      Caption = #1048#1102#1085#1100
    end
    object N3: TMenuItem
      Tag = 7
      Caption = #1048#1102#1083#1100
    end
    object N4: TMenuItem
      Tag = 8
      Caption = #1040#1074#1075#1091#1089#1090
    end
    object N5: TMenuItem
      Tag = 9
      Caption = #1057#1077#1085#1090#1103#1073#1088#1100
    end
    object N6: TMenuItem
      Tag = 10
      Caption = #1054#1082#1090#1103#1073#1088#1100
    end
    object N7: TMenuItem
      Tag = 11
      Caption = #1053#1086#1103#1073#1088#1100
    end
    object N8: TMenuItem
      Tag = 12
      Caption = #1044#1077#1082#1072#1073#1088#1100
    end
  end
  object odsSelDocRashPoluch: TOracleDataSet
    SQL.Strings = (
      
        'SELECT a.FN_RANG,a.fc_rang, a.FC_MO_GR_TO, sum(k.fn_price*dp.fn_' +
        'kol) as FN_PRICE FROM'
      '('
      'SELECT TDOCS.DPID,'
      
        '       DECODE(TDOCS.fp_vidmove, 2,1, 3,2, 8,3, 7,4, 6,5, 255) as' +
        ' FN_RANG,'
      
        '       DECODE(TDOCS.fp_vidmove, 2,'#39#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103#1084#39', 3,'#39#1087#1077#1088#1077#1076#1072#1095#1072#1084#39', ' +
        '8,'#39#1089#1087#1080#1089#1072#1085#1080#1103#1084#39', 7,'#39#1088#1072#1089#1093#1086#1076#1072#1084' '#1074' '#1056#1055#1054#39', 6,'#39#1074#1086#1079#1074#1088#1072#1090#1072#1084#39', '#39#39') as FC_RANG' +
        ','
      
        '       MED.PKGTDOCS.GET_DOC_DESTINATION(TDOCS.fp_vid, TDOCS.fp_v' +
        'idmove, TDOCS.fk_mogroupid_TO, TDOCS.postavid) AS FC_MO_GR_TO'
      'FROM    MED.TDOCS'
      
        'WHERE :MO_GROUP = TDOCS.fk_mogroupid_from -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084' '#1085#1077' '#1085 +
        #1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '  AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:ADATA1) AND TRUNC(:ADA' +
        'TA2)'
      
        '  AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  TDOCS' +
        '.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to, :MO' +
        '_GROUP) = -1'
      '  AND TDOCS.FL_EDIT = 0  -- '#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      
        '  AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072'- '#1087#1086#1089#1082#1086#1083#1100#1082#1091' '#1074#1086 +
        #1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085#1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086#1076'+'#1088#1072#1089#1093#1086#1076')'
      '  AND (not tdocs.fp_vidmove in (4,5))'
      '  AND ((:IS_RPO = 1)OR(tdocs.fp_vidmove <> 7))'
      ') A,'
      'med.tdpc dp, med.tkart k'
      'where'
      '  dp.dpid = a.DPID and dp.kartid = k.kartid '
      'GROUP BY a.FN_RANG, a.FC_RANG, A.FC_MO_GR_TO  '
      'ORDER BY a.FN_RANG,  UPPER(A.FC_MO_GR_TO)')
    Optimize = False
    Variables.Data = {
      0300000004000000070000003A4144415441310C000000000000000000000007
      0000003A4144415441320C0000000000000000000000090000003A4D4F5F4752
      4F5550030000000000000000000000070000003A49535F52504F030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000008000000464E5F505249434501000000000007000000464E
      5F52414E470100000000000700000046435F52414E470100000000000B000000
      46435F4D4F5F47525F544F010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 373
    Top = 156
  end
  object sd: TSaveDialog
    DefaultExt = 'xls'
    FileName = #1057#1087#1080#1089#1086#1082' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074'.xls'
    Filter = 'Excel Files (*.xls)|*.xls'
    Left = 348
    Top = 43
  end
  object MainMenu1: TMainMenu
    Left = 324
    Top = 408
    object miPeriod: TMenuItem
      Caption = #1055#1077#1088#1080#1086#1076':'
      OnClick = miPeriodClick
    end
    object miMO_GROUP: TMenuItem
      Caption = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090'. '#1086#1090#1074'.:'
      OnClick = miMO_GROUPClick
    end
  end
  object odsGroupMo: TOracleDataSet
    SQL.Strings = (
      'SELECT * from'
      '(SELECT groupid, fc_group, fl_del, 0 as FN_ORDER'
      
        'FROM med.v$tmo_group WHERE (fl_del = 0) and (UPPER(fc_group) lik' +
        'e '#39'%'#1040#1055#1058#1045#1050#1040'%'#39')'
      'UNION'
      'SELECT groupid, fc_group, fl_del, 1 as FN_ORDER'
      
        'FROM med.v$tmo_group WHERE fl_del = 0 and (not (UPPER(fc_group) ' +
        'like '#39'%'#1040#1055#1058#1045#1050#1040'%'#39'))'
      ')'
      'ORDER BY FN_ORDER, UPPER(fc_group)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C010000000000}
    Session = os
    Left = 40
    Top = 187
  end
  object odsRashByUchgr_FincSrc: TOracleDataSet
    SQL.Strings = (
      'select'
      '  rownum, '
      
        '--  rtrim(TO_CHAR(a.FN_KOL, '#39'FM999G999G990D99999'#39'),'#39'.,'#39') as FC_K' +
        'OL,'
      '   a.*,'
      '   '#39#1048#1079#1088#1072#1089#1093#1086#1076#1086#1074#1072#1085#1086' '#1085#1072' '#1085#1091#1078#1076#1099' '#1091#1095#1088#1077#1078#1076#1077#1085#1080#1103#39' as FC_RASH'
      ''
      'from(   '
      '     SELECT'
      '          sum(TDPC.FN_KOL) as FN_KOL,'
      '          sum(TKART.FN_PRICE*TDPC.FN_KOL) as FN_SUMM,'
      '          TKART.FN_PRICE,'
      '          TMEDIC.FC_NAME as MEDICNAME,'
      '          TEI.FC_NAME AS FC_EDIZM,'
      '          UG.FC_UCHGR'
      ''
      '                '
      
        '     FROM   MED.TDOCS, MED.TDPC, MED.TKART, MED.TMEDIC, MED.TEI,' +
        ' med.TUCHGR UG     '
      
        '     WHERE TDOCS.fk_mogroupid_from = :MO_GROUP -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084 +
        ' '#1085#1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '       AND TRUNC(:ADATA1) <= :USE_DATE_SPIS_INSTEAD_OF_DATE AND ' +
        ':USE_DATE_SPIS_INSTEAD_OF_DATE < TRUNC(:ADATA2+1)'
      
        '       AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  ' +
        'TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to' +
        ', :MO_GROUP) = -1'
      '       AND tdocs.fp_vidmove <> 6 '
      
        '       AND (not tdocs.fp_vidmove in (4,5, 6)) -- '#1074#1089#1077', '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074 +
        #1088#1072#1090#1072' '#1080' '#1088#1077#1079#1077#1088#1074#1072
      '       AND TDOCS.FL_EDIT = 0  '
      '       '
      '       and   TDPC.KARTID = TKART.KARTID'
      '          AND TKART.MEDICID=TMEDIC.MEDICID'
      '          AND TMEDIC.EIID = TEI.EIID(+)'
      '         AND #uchgrid# = UG.UCHGRID'
      
        '         AND TKART.FK_FINSOURCE_ID = DECODE(:FK_FINSOURCE_ID, -1' +
        ',TKART.FK_FINSOURCE_ID, :FK_FINSOURCE_ID)'
      '         and tdocs.dpid = tdpc.dpid      '
      'group by '
      '  TKART.FN_PRICE,'
      '  TMEDIC.FC_NAME,'
      '  TEI.FC_NAME,'
      '  UG.FC_UCHGR'
      ''
      'ORDER BY UPPER(UG.FC_UCHGR), UPPER(TMEDIC.FC_NAME)'
      ''
      ') a')
    Optimize = False
    Variables.Data = {
      0300000005000000090000003A4D4F5F47524F555003000000040000009D0400
      0000000000100000003A464B5F46494E534F555243455F494403000000040000
      00FFFFFFFF00000000070000003A4144415441310C0000000700000078710101
      01010100000000070000003A4144415441320C0000000700000078710C1F0101
      01000000001E0000003A5553455F444154455F535049535F494E53544541445F
      4F465F44415445010000000E00000054444F43532E46445F4441544100000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000190000000400000044504944010000000000090000004D4F4F574E45
      5249440100000000000600000046435F444F430100000000000600000046505F
      5649440100000000000A00000046435F434F4D4D454E54010000000000080000
      004D4F46524F4D4944010000000000060000004D4F544F494401000000000002
      0000004432010000000000020000004431010000000000040000004441544101
      0000000000080000004E414D4546524F4D0100000000000B00000046435F4D4F
      544F4E414D4501000000000006000000445049445F3101000000000005000000
      4450434944010000000000070000004D45444943494401000000000006000000
      464E5F4B4F4C01000000000007000000464E5F53554D4D0100000000000F0000
      00464E5F50524943455F44455441494C010000000000060000004B4152544944
      010000000000080000004E414D454B4152540100000000000900000046435F53
      455249414C0100000000000800000045445F494E495A4D0100000000000F0000
      00464E5F50524943455F4D41535445520100000000000D00000046435F4D4F5F
      47525F46524F4D0100000000001E0000004D45442E4745545F4445434F444544
      4F435649442854444F43532E46505F010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 377
    Top = 356
  end
  object pmFinSource: TPopupMenu
    Left = 606
    Top = 52
    object miAllFinSource: TMenuItem
      Tag = -1
      AutoCheck = True
      Caption = #1057#1084#1077#1096#1072#1085#1099#1081
      Checked = True
      RadioItem = True
      OnClick = miAllFinSourceClick
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
  end
  object odsFinSource: TOracleDataSet
    SQL.Strings = (
      'select * from MED.TFinSource'
      'ORDER BY FC_name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C010000000000}
    Session = os
    AfterOpen = odsFinSourceAfterOpen
    Left = 552
    Top = 47
  end
  object frRashByUchgr_FincSrc: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frRashDocITOGGetValue
    Left = 551
    Top = 356
    ReportForm = {
      190000000F260000190000FFFF01000100FFFFFFFFFF090000009A0B00003408
      00001200000012000000120000001200000001FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      0000120000002F040000550100003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E4865616465723100020100000000C00100002F0400002700000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200AF0100000B004D61737465724461746131000201000000002C0200002F04
      0000140000003100050001000000000000000000FFFFFF1F000000000C006672
      4442446174615365743100000000000000FFFF00000000000200000001000000
      0000000001000000C8000000140000000100000000000002001C0200000D004D
      6173746572466F6F74657231000201000000009C0200002F0400001900000031
      00060001000000000000000000FFFFFF1F00000000000000000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      000000000200870200000B0050616765466F6F7465723100020100000000D002
      00002F040000140000003000030001000000000000000000FFFFFF1F00000000
      000000000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200F30200000C0047726F7570466F6F74
      657231000201000000005E0200002F0400001400000030001100010000000000
      00000000FFFFFF1F00000000000000000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000200AB0300
      000C0047726F75704865616465723100020100000000FC0100002F0400001400
      00003000100001000000000000000000FFFFFF1F0000000025005B6F64735365
      6C446F63506F4D65646963547970652E2246435F6D6564696374797065225D00
      00000003000500626567696E0D170020202020464E5F47524F55505F53554D4D
      203A3D20303B0D0300656E6400FFFF0000000000020000000100000000000000
      01000000C8000000140000000100000000000000003E04000006004D656D6F35
      36000200110100003C010000FF00000014000000030000000100000000000000
      0000FFFFFF1F2C02000000000001001400EEF2203CE4E0F2E020EFF0E8EAE0E7
      E020B9203E00000000FFFF00000000000200000001000000000500417269616C
      0008000000000000000000080000000100020000000000FFFFFF000000000200
      0000000000000000C504000006004D656D6F343900020011010000D800000032
      020000140000000300020001000000000000000000FFFFFF002C020000000000
      010008005B7661725F6D6F5D00000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000008000000CC00020000000000FFFF
      FF00000000020000000000000000004705000005004D656D6F32000200B30100
      00C0010000450000002700000003000F00DC050000000000000000CCFFCC002C
      02000000000001000400C4E0F2E000000000FFFF000000000002000000010000
      00000500417269616C00090000000200000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000CD05000005004D656D6F33000200F8
      010000C0010000AF0000002700000003000F00DC050000000000000000CCFFCC
      002C02000000000001000800C4EEEAF3ECE5EDF200000000FFFF000000000002
      00000001000000000500417269616C00090000000200000000000A000000CC00
      020000000000FFFFFF00000000020000000000000000005506000005004D656D
      6F34000200A7020000C0010000890000002700000003000F00DC050000000000
      000000CCFFCC002C02000000000001000A00CFEEEBF3F7E0F2E5EBFC00000000
      FFFF00000000000200000001000000000500417269616C000900000002000000
      00000A000000CC00020000000000FFFFFF0000000002000000000000000000F1
      06000006004D656D6F3431000200B30100002C02000045000000140000000300
      0F002C010000000000000000FFFFFF1F2C02000000000001001D005B6F647353
      656C446F63506F4D65646963547970652E2244415441225D00000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000800
      0000CC00020000000000FFFFFF00000000020000000000000000008F07000006
      004D656D6F3432000200F80100002C020000AF0000001400000003000F002C01
      0000000000000000FFFFFF1F2C02000000000001001F005B6F647353656C446F
      63506F4D65646963547970652E2246435F444F43225D00000000FFFF00000000
      000200000001000000000500417269616C000800000000000000000008000000
      CC00020000000000FFFFFF00000000020000000000000000003208000006004D
      656D6F3434000200A70200002C020000890000001400000003000F002C010000
      000000000000FFFFFF1F2C020000000000010024005B6F647353656C446F6350
      6F4D65646963547970652E2246435F4D4F5F47525F544F225D00000000FFFF00
      000000000200000001000000000500417269616C000800000000000000000008
      000000CC00020000000000FFFFFF0000000002000000000000000000B7080000
      06004D656D6F3135000200480000009C020000180300001900000003000F00DC
      050000000000000000FFFFFF1F2C02000000000001000600C8F2EEE3EE3A0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000200
      0000000009000000CC00020000000000FFFFFF00000000020000000000000000
      005909000006004D656D6F3137000200600300009C020000B600000019000000
      23000F00DC050000000000000000FFFFFF1F2C02040114002323232023232320
      232323202323302E303020F00001000F005B464E5F49544F474F5F53554D4D5D
      00000000FFFF00000000000200000001000000000500417269616C000C000000
      02000000000009000000CC00020000000000FFFFFF0000000002000000000000
      000000F409000006004D656D6F313100020012000000D10200000B0400001100
      00000300000001000000000000000000FFFFFF1F2C02000000000001001C00F1
      F2F02E205B50414745235D20E8E7205B544F54414C50414745535D00000000FF
      FF00000000000200000001000000040500417269616C000A0000000000000000
      0009000000CC00020000000000FFFFFF0000000002000000000000000000780A
      000006004D656D6F313400020048000000C00100001E0000002700000003000F
      00DC050000000000000000CCFFCC002C02000000000001000500B920EF2FEF00
      000000FFFF00000000000200000001000000000500417269616C000900000002
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      0000FF0A000006004D656D6F3430000200480000002C0200001E000000140000
      0003000F0001000000000000000000FFFFFF1F2C020000000000010008005B4C
      494E45235D2900000000FFFF0000000000020000000100000000050041726961
      6C000800000000000000000009000000CC00020000000000FFFFFF0000000002
      0000000000000000008A0B000006004D656D6F323100020066000000C0010000
      0D0100002700000003000F00DC050000000000000000CCFFCC002C0200000000
      0001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF000000000002000000
      01000000000500417269616C00090000000200000000000A000000CC00020000
      000000FFFFFF0000000002000000000000000000110C000006004D656D6F3233
      00020073010000C0010000400000002700000003000F00DC0500000000000000
      00CCFFCC002C02000000000001000800C5E42E20E8E7EC2E00000000FFFF0000
      0000000200000001000000000500417269616C00090000000200000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000960C000006
      004D656D6F323400020030030000C0010000300000002700000003000F00DC05
      0000000000000000CCFFCC002C02000000000001000600CAEEEB2DE2EE000000
      00FFFF00000000000200000001000000000500417269616C0009000000020000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      1C0D000006004D656D6F323500020060030000C00100004D0000002700000003
      000F00DC050000000000000000CCFFCC002C02000000000001000700D6E5EDE0
      2C20F000000000FFFF00000000000200000001000000000500417269616C0009
      0000000200000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000000A30D000006004D656D6F3236000200AD030000C0010000690000
      002700000003000F00DC050000000000000000CCFFCC002C0200000000000100
      0800D1F3ECECE02C20F000000000FFFF00000000000200000001000000000500
      417269616C00090000000200000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000430E000006004D656D6F323700020066000000
      2C0200000D0100001400000003000F0001000000000000000000FFFFFF1F2C02
      0000000000010021005B6F647353656C446F63506F4D65646963547970652E22
      4E414D454B415254225D00000000FFFF00000000000200000001000000000500
      417269616C000800000000000000000008000000CC00020000000000FFFFFF00
      00000002000000000000000000E30E000006004D656D6F323800020073010000
      2C020000400000001400000003000F0001000000000000000000FFFFFF1F2C02
      0000000000010021005B6F647353656C446F63506F4D65646963547970652E22
      46435F4544495A4D225D00000000FFFF00000000000200000001000000000500
      417269616C00080000000000000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000810F000006004D656D6F323900020030030000
      2C020000300000001400000003000F0001000000000000000000FFFFFF1F2C02
      000000000001001F005B6F647353656C446F63506F4D65646963547970652E22
      46435F4B4F4C225D00000000FFFF000000000002000000010000000005004172
      69616C00080000000000000000000A000000CC00020000000000FFFFFF000000
      00020000000000000000003810000006004D656D6F3330000200600300002C02
      00004D0000001400000003000F0001000000000000000000FFFFFF1F2C020301
      100023232320232323202323302E303020F000010028005B6F647353656C446F
      63506F4D65646963547970652E22464E5F50524943455F44455441494C225D00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      00008211000006004D656D6F3331000200AD0300002C02000069000000140000
      0003000F0001000000000000000000FFFFFF1F2C020301100023232320232323
      202323302E303020F000010020005B6F647353656C446F63506F4D6564696354
      7970652E22464E5F53554D4D225D0004000500626567696E0D44002020464E5F
      47524F55505F53554D4D203A3D20464E5F47524F55505F53554D4D202B205B6F
      647353656C446F63506F4D65646963547970652E22464E5F53554D4D225D3B0D
      44002020464E5F49544F474F5F53554D4D203A3D20464E5F49544F474F5F5355
      4D4D202B205B6F647353656C446F63506F4D65646963547970652E22464E5F53
      554D4D225D3B0D0300656E6400FFFF0000000000020000000100000000050041
      7269616C00080000000000000000000A000000CC00020000000000FFFFFF0000
      0000020000000000000000006212000005004D656D6F36000200120000008800
      000031030000140000000300000001000000000000000000FFFFFF1F2C020000
      00000001002500C0CAD220CE20D1CFC8D1C0CDC8C820CCC0D2C5D0C8C0CBDCCD
      DBD520C7C0CFC0D1CEC220B90004000500626567696E0D15002020464E5F4752
      4F55505F53554D4D203A3D20303B0D15002020464E5F49544F474F5F53554D4D
      203A3D20303B0D0300656E6400FFFF0000000000020000000100000000050041
      7269616C000C0000000200000000000A000000CC00020000000000FFFFFF0000
      0000020000000000000000000613000005004D656D6F37000200120000009C00
      000031030000140000000300000001000000000000000000FFFFFF1F2C020000
      00000001002600E7E020EFE5F0E8EEE420F1205B7661725F64617465315D20EF
      EE205B7661725F64617465325D00000000FFFF00000000000200000001000000
      000500417269616C000B0000000200000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000009313000006004D656D6F313300020011
      010000C400000032020000140000000300020001000000000000000000FFFFFF
      002C02000000000001000E005B7661725F6D6F5F67726F75705D00000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      08000000CC00020000000000FFFFFF0000000002000000000000000000471400
      0006004D656D6F3132000200480000005E020000180300001400000003000900
      02000000000000000000FFFFFF1F2C02000000000001003500C8F2EEE3EE20EF
      EE20F2E8EFF320225B6F647353656C446F63506F4D65646963547970652E2246
      435F6D6564696374797065225D2200000000FFFF000000000002000000010000
      00000500417269616C000A00000002000000000009000000CC00020000000000
      FFFFFF0000000002000000000000000000E914000006004D656D6F3138000200
      600300005E020000B60000001400000003000F0002000000000000000000FFFF
      FF1F2C02040114002323232023232320232323202323302E303020F00001000F
      005B464E5F47524F55505F53554D4D5D00000000FFFF00000000000200000001
      000000000500417269616C000A00000002000000000009000000CC0002000000
      0000FFFFFF00000000020000000000000000008D15000005004D656D6F310002
      0066000000FC010000B00300001400000003000F0002000000000000000000CC
      FFFF002C02000000000001002600205B6F647353656C446F63506F4D65646963
      547970652E2246435F6D6564696374797065225D00000000FFFF000000000002
      00000001000000000500417269616C000A000000020000000000080000000100
      020000000000FFFFFF00000000020000000000000000001516000005004D656D
      6F3500020048000000FC0100001E0000001400000003000F0002000000000000
      000000CCFFFF002C020000000000020007005B4C494E45235D0D000000000000
      FFFF00000000000200000001000000000500417269616C000800000000000000
      00000A000000CC00020000000000FFFFFF0000000002000000000000000000AB
      16000006004D656D6F3130000200F801000036000000A8000000140000000300
      000001000000000000000000FFFFFF1F2C02000000000001001700D0F3EAEEE2
      EEE4E8F2E5EBFC20F3F7F0E5E6E4E5EDE8FF00000000FFFF0000000000020000
      0001000000000500417269616C00080000000000000000001000000001000200
      00000000FFFFFF00000000020000000000000000004717000006004D656D6F31
      39000200A00200005E000000A000000014000000030000000100000000000000
      0000FFFFFF1F2C02000000000001001D005F5F5F20205F5F5F5F5F5F5F5F5F5F
      5F5F5F5F203230205F5F5F20E32E00000000FFFF000000000002000000010000
      00000500417269616C0008000000000000000000120000000100020000000000
      FFFFFF0000000002000000000000000000CF17000006004D656D6F3230000200
      A00200004A000000A0000000140000000300000001000000000000000000FFFF
      FF1F2C0200000000000100090028EFEEE4EFE8F1FC2900000000FFFF00000000
      000200000001000000000500417269616C000800000000000000000002000000
      0100020000000000FFFFFF00000000020000000000000000005718000006004D
      656D6F3232000200A002000014000000A0000000140000000300000001000000
      000000000000FFFFFF1F2C02000000000001000900D3F2E2E5F0E6E4E0FE0000
      0000FFFF00000000000200000001000000000500417269616C00080000000000
      00000000010000000100020000000000FFFFFF00000000020000000000000000
      00EB18000006004D656D6F33330002007C0300004A000000A000000014000000
      0300000001000000000000000000FFFFFF1F2C0200000000000100150028F0E0
      F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E82900000000FFFF0000000000020000
      0001000000000500417269616C00080000000000000000000200000001000200
      00000000FFFFFF00000000020000000000000000007119000006004D656D6F33
      3600020043030000880000003800000014000000030000000100000000000000
      0000FFFFFF1F2C02000000000001000700EFEE20CECAD3C400000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000900
      00000100020000000000FFFFFF0000000002000000000000000000F719000006
      004D656D6F343500020043030000B00000003800000014000000030000000100
      0000000000000000FFFFFF1F2C02000000000001000700EFEE20CECACFCE0000
      0000FFFF00000000000200000001000000000500417269616C00080000000000
      00000000090000000100020000000000FFFFFF00000000020000000000000000
      007A1A000006004D656D6F3436000200430300009C0000003800000014000000
      0300000001000000000000000000FFFFFF1F2C02000000000001000400C4E0F2
      E000000000FFFF00000000000200000001000000000500417269616C00080000
      00000000000000090000000100020000000000FFFFFF00000000020000000000
      00000000FD1A000006004D656D6F33340002007C03000074000000A000000014
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001000400
      CAEEE4FB00000000FFFF00000000000200000001000000000500417269616C00
      080000000000000000000A0000000100020000000000FFFFFF00000000020000
      00000000000000821B000006004D656D6F33350002007C03000088000000A000
      00001400000003000C0002000000000000000000FFFFFF1F2C02000000000001
      00060035303432333000000000FFFF0000000000020000000100000000050041
      7269616C00080000000000000000000A0000000100020000000000FFFFFF0000
      000002000000000000000000071C000006004D656D6F33370002007C0300009C
      000000A00000001400000003000B0001000000000000000000FFFFFF1F2C0200
      00000000010006003CC4E0F2E03E00000000FFFF000000000002000000010000
      00000500417269616C00080000000000000000000A0000000100020000000000
      FFFFFF00000000020000000000000000008E1C000006004D656D6F3338000200
      7C030000B0000000A00000001400000003000F0001000000000000000000FFFF
      FF1F2C02000000000001000800343037393932313400000000FFFF0000000000
      0200000001000000000500417269616C00080000000000000000000A00000001
      00020000000000FFFFFF00000000020000000000000000000B1D000006004D65
      6D6F33390002007C030000D8000000A000000014000000030002000200000000
      0000000000FFFFFF1F2C020000000000000000000000FFFF0000000000020000
      0001000000000500417269616C00080000000000000000000A00000001000200
      00000000FFFFFF0000000002000000000000000000881D000006004D656D6F34
      330002007C030000C4000000A00000001400000003000F000100000000000000
      0000FFFFFF1F2C020000000000000000000000FFFF0000000000020000000100
      0000000500417269616C00080000000000000000000A00000001000200000000
      00FFFFFF0000000002000000000000000400D71D000005004C696E6531000200
      7C030000B0000000000000003C0000000100040002000000000000000000FFFF
      FF002C020000000000000000000000FFFF000000000002000000010000000004
      00261E000005004C696E65320002001C04000088000000000000006400000001
      00040002000000000000000000FFFFFF002C020000000000000000000000FFFF
      00000000000200000001000000000000CE1E000006004D656D6F343700020012
      000000B0000000FF000000140000000300000001000000000000000000FFFFFF
      1F2C02000000000001002900D3F7F0E5E6E4E5EDE8E52028F6E5EDF2F0E0EBE8
      E7EEE2E0EDEDE0FF20E1F3F5E3E0EBF2E5F0E8FF2900000000FFFF0000000000
      0200000001000000000500417269616C00080000000000000000000800000001
      00020000000000FFFFFF00000000020000000000000000005A1F000005004D65
      6D6F3900020011010000B0000000320200001400000003000200010000000000
      00000000FFFFFF002C02000000000001000E005B7661725F7265636569766572
      5D00000000FFFF00000000000200000001000000000500417269616C000A0000
      00000000000000080000000100020000000000FFFFFF00000000020000000000
      00000000F21F000006004D656D6F343800020012000000C4000000FF00000014
      0000000300000001000000000000000000FFFFFF1F2C02000000000001001900
      D1F2F0F3EAF2F3F0EDEEE520EFEEE4F0E0E7E4E5EBE5EDE8E500000000FFFF00
      000000000200000001000000000500417269616C000800000000000000000008
      0000000100020000000000FFFFFF00000000020000000000000000008F200000
      06004D656D6F353000020012000000D8000000FF000000140000000300000001
      000000000000000000FFFFFF1F2C02000000000001001E00CCE0F2E5F0E8E0EB
      FCEDEE20EEF2E2E5F2F1F2E2E5EDEDEEE520EBE8F6EE00000000FFFF00000000
      000200000001000000000500417269616C000800000000000000000008000000
      0100020000000000FFFFFF00000000020000000000000000000B21000005004D
      656D6F3800020012000000EC000000FF00000014000000030000000100000000
      0000000000FFFFFF1F2C020000000000000000000000FFFF0000000000020000
      0001000000000500417269616C00080000000000000000000800000001000200
      00000000FFFFFF00000000020000000000000000009D21000006004D656D6F31
      360002001200000000010000FF00000014000000030000000100000000000000
      0000FFFFFF1F2C02000000000001001300CAEEECE8F1F1E8FF20E220F1EEF1F2
      E0E2E53A00000000FFFF00000000000200000001000000000500417269616C00
      080000000000000000000A0000000100020000000000FFFFFF00000000020000
      000000000000002C22000006004D656D6F33320002007C03000036000000A000
      0000140000000300020001000000000000000000FFFFFF1F2C02000000000001
      0010003CC82EC02E20D3F0E2E0EDF6E5E2E03E00000000FFFF00000000000200
      000001000000000500417269616C000800000000000000000010000000010002
      0000000000FFFFFF0000000002000000000000000000C522000006004D656D6F
      353200020011010000140100000B030000140000000300000001000000000000
      000000FFFFFF1F2C02000000000001001A0028E4EEEBE6EDEEF1F2FC2C20F4E0
      ECE8EBE8FF2C20E82EEE2E2900000000FFFF0000000000020000000100000000
      0500417269616C0007000000000000000000020000000100020000000000FFFF
      FF00000000020000000000000000005223000006004D656D6F35310002001101
      0000000100000B030000140000000300020001000000000000000000FFFFFF00
      2C02000000000001000E005B7661725F6B6F6D69737379615D00000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000008
      000000CC00020000000000FFFFFF0000000002000000000000000000F3230000
      06004D656D6F3535000200120000003C010000FF000000140000000300000001
      000000000000000000FFFFFF1F2C02000000000001002200EDE0E7EDE0F7E5ED
      E020EFF0E8EAE0E7EEEC2028F0E0F1EFEEF0FFE6E5EDE8E5EC2900000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      080000000100020000000000FFFFFF0000000002000000000000000000812400
      0006004D656D6F35330002001200000028010000C20200001400000003000200
      01000000000000000000FFFFFF002C02000000000001000F005B7661725F6B6F
      6D6973737961325D00000000FFFF000000000002000000010000000005004172
      69616C000A0000000000000000000A000000CC00020000000000FFFFFF000000
      00020000000000000000003525000006004D656D6F3537000200D40200003C01
      000048010000140000000300000001000000000000000000FFFFFF1F2C020000
      00000001003500EFF0EEE8E7E2E5EBE020EFF0EEE2E5F0EAF320E2FBE4E0EDED
      FBF520F1EE20F1EAEBE0E4E020E220EFEEE4F0E0E7E4E5EBE5EDE8E500000000
      FFFF00000000000200000001000000000500417269616C000800000000000000
      0000080000000100020000000000FFFFFF0000000002000000000000000000C2
      25000006004D656D6F3534000200D40200002801000048010000140000000300
      020001000000000000000000FFFFFF002C02000000000001000E003CC0E9E2E0
      E7FFED20CB2EC82E3E00000000FFFF0000000000020000000100000000050041
      7269616C000A00000000000000000008000000CC00020000000000FFFFFF0000
      00000200000000000000FEFEFF020000000A002043617465676F727931000000
      00040073756D6D00010030000000000000000000FC0000000000000000000000
      000000000058008DF9BA39EDD2E2400EB3965DED4EE440}
  end
  object frxReport1: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38551.413297164290000000
    ReportOptions.LastChange = 40472.502636064810000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SET('#39'FN_ITOG_SUM'#39', 0);'
      '  SET('#39'FN_ITOG_KOL'#39', 0);      '
      '  SET('#39'FN_GROUP_SUM'#39', 0);'
      
        '  SET('#39'FN_GROUP_KOL'#39', 0);                                       ' +
        '   '
      'end;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SET('#39'FN_GROUP_SUM'#39', 0);'
      '  SET('#39'FN_GROUP_KOL'#39', 0);  '
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SET('#39'FN_ITOG_SUM'#39',  <FN_ITOG_SUM> + <frxDBReport1."FN_SUMM">);'
      
        '  SET('#39'FN_ITOG_KOL'#39',  <FN_ITOG_KOL> + <frxDBReport1."FN_KOL">); ' +
        '     '
      
        '  SET('#39'FN_GROUP_SUM'#39', <FN_GROUP_SUM> + <frxDBReport1."FN_SUMM">)' +
        ';'
      
        '  SET('#39'FN_GROUP_KOL'#39', <FN_GROUP_KOL> + <frxDBReport1."FN_KOL">);' +
        '  '
      'end;'
      ''
      
        'procedure meKomissya1OnPreviewClick(Sender: TfrxView; Button: TM' +
        'ouseButton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin  '
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1082#1086#1084#1080#1089#1089#1080#1102#39', '#39#1050#1086#1084#1080#1089#1089#1080#1103':'#39', s);           ' +
        '       '
      '  TfrxMemoView(Sender).Text := s2;          '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'var_komissya'#39',  s2);'
      'end;'
      ''
      
        'procedure Memo54OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1047#1072#1074'. '#1086#1090#1076#1077#1083#1077#1085#1080#1103':'#39', s);          ' +
        '        '
      '  TfrxMemoView(Sender).Text := s2;          '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_ZAV_OTD'#39',  s2);'
      'end;'
      ''
      
        'procedure Memo32OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;  '
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1060#1048#1054#39', s);                  '
      '  TfrxMemoView(Sender).Text := s;          '
      '  Modified := True;  '
      'end;'
      ''
      
        'procedure Memo56OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090#39', '#39#1055#1088#1080#1082#1072#1079':'#39', s);                ' +
        '  '
      '  TfrxMemoView(Sender).Text := s2;          '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_PRIKAZ'#39',  s2);'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    OnUserFunction = frxReport1UserFunction
    Left = 136
    Top = 320
    Datasets = <
      item
        DataSet = frxDBNacenkaUcenka
        DataSetName = 'frxDBNacenkaUcenka'
      end
      item
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'FN_ITOG_SUM'
        Value = ''
      end
      item
        Name = 'FN_ITOG_KOL'
        Value = ''
      end
      item
        Name = 'FN_GROUP_SUM'
        Value = ''
      end
      item
        Name = 'FN_GROUP_KOL'
        Value = ''
      end>
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
      LeftMargin = 10.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      Columns = 1
      ColumnWidth = 287.000000000000000000
      ColumnPositions.Strings = (
        '0')
      object ReportTitle1: TfrxReportTitle
        Height = 349.000000000000000000
        Top = 16.000000000000000000
        Width = 1065.827460000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo56: TfrxMemoView
          ShiftMode = smDontShift
          Left = 256.000000000000000000
          Top = 300.000000000000000000
          Width = 227.000000000000000000
          Height = 20.000000000000000000
          OnPreviewClick = 'Memo56OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[VAR_PRIKAZ]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          ShiftMode = smDontShift
          Left = 256.000000000000000000
          Top = 200.000000000000000000
          Width = 568.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_MO]')
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          ShiftMode = smDontShift
          Top = 120.000000000000000000
          Width = 824.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1106#1056#1113#1056#1118' '#1056#1115' '#1056#1038#1056#1119#1056#152#1056#1038#1056#1106#1056#1116#1056#152#1056#152' '#1056#1114#1056#1106#1056#1118#1056#8226#1056#160#1056#152#1056#1106#1056#8250#1056#172#1056#1116#1056#171#1056#1168' '#1056#8212#1056#1106#1056#1119#1056#1106#1056#1038#1056#1115 +
              #1056#8217' '#1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          ShiftMode = smDontShift
          Top = 140.000000000000000000
          Width = 824.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [VAR_DATE1] '#1056#1111#1056#1109' [VAR_DATE2]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          ShiftMode = smDontShift
          Left = 256.000000000000000000
          Top = 180.000000000000000000
          Width = 568.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_MO_GROUP]')
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          ShiftMode = smDontShift
          Left = 488.000000000000000000
          Top = 38.000000000000000000
          Width = 166.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#160#1057#1107#1056#1108#1056#1109#1056#1030#1056#1109#1056#1169#1056#1105#1057#8218#1056#181#1056#187#1057#1034' '#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo19: TfrxMemoView
          ShiftMode = smDontShift
          Left = 654.000000000000000000
          Top = 78.000000000000000000
          Width = 170.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '___  ______________ 20 ___ '#1056#1110'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          ShiftMode = smDontShift
          Left = 654.000000000000000000
          Top = 58.000000000000000000
          Width = 170.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          ShiftMode = smDontShift
          Left = 654.000000000000000000
          Top = 4.000000000000000000
          Width = 170.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1032#1057#8218#1056#1030#1056#181#1057#1026#1056#182#1056#1169#1056#176#1057#1035)
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          ShiftMode = smDontShift
          Left = 899.000000000000000000
          Top = 58.000000000000000000
          Width = 166.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          ShiftMode = smDontShift
          Left = 824.000000000000000000
          Top = 120.000000000000000000
          Width = 75.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1032#1056#8221)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          ShiftMode = smDontShift
          Left = 824.000000000000000000
          Top = 160.000000000000000000
          Width = 75.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1119#1056#1115)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          ShiftMode = smDontShift
          Left = 824.000000000000000000
          Top = 140.000000000000000000
          Width = 75.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          ShiftMode = smDontShift
          Left = 899.000000000000000000
          Top = 100.000000000000000000
          Width = 166.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          ShiftMode = smDontShift
          Left = 899.000000000000000000
          Top = 120.000000000000000000
          Width = 166.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '504230')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          ShiftMode = smDontShift
          Left = 899.000000000000000000
          Top = 140.000000000000000000
          Width = 166.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_DATE2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          ShiftMode = smDontShift
          Left = 899.000000000000000000
          Top = 160.000000000000000000
          Width = 166.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '40799214')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          ShiftMode = smDontShift
          Left = 899.000000000000000000
          Top = 200.000000000000000000
          Width = 166.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          ShiftMode = smDontShift
          Left = 899.000000000000000000
          Top = 180.000000000000000000
          Width = 166.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          ShiftMode = smDontShift
          Left = 900.000000000000000000
          Top = 160.000000000000000000
          Height = 60.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Memo47: TfrxMemoView
          ShiftMode = smDontShift
          Top = 160.000000000000000000
          Width = 256.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1032#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1056#181' ('#1057#8224#1056#181#1056#1029#1057#8218#1057#1026#1056#176#1056#187#1056#1105#1056#183#1056#1109#1056#1030#1056#176#1056#1029#1056#1029#1056#176#1057#1039' '#1056#177#1057#1107#1057#8230#1056#1110#1056 +
              #176#1056#187#1057#8218#1056#181#1057#1026#1056#1105#1057#1039')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          ShiftMode = smDontShift
          Left = 256.000000000000000000
          Top = 160.000000000000000000
          Width = 568.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_RECEIVER]')
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          ShiftMode = smDontShift
          Top = 180.000000000000000000
          Width = 256.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026#1057#1107#1056#1108#1057#8218#1057#1107#1057#1026#1056#1029#1056#1109#1056#181' '#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          ShiftMode = smDontShift
          Top = 200.000000000000000000
          Width = 256.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109' '#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#181' '#1056#187#1056#1105#1057#8224#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          ShiftMode = smDontShift
          Top = 220.000000000000000000
          Width = 256.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          ShiftMode = smDontShift
          Top = 240.000000000000000000
          Width = 256.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1057#1039' '#1056#1030' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#181':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          ShiftMode = smDontShift
          Left = 899.000000000000000000
          Top = 38.000000000000000000
          Width = 166.000000000000000000
          Height = 20.000000000000000000
          OnPreviewClick = 'Memo32OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_GLAV_VRACH]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo52: TfrxMemoView
          ShiftMode = smDontShift
          Left = 256.000000000000000000
          Top = 260.000000000000000000
          Width = 810.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1057#8222#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039', '#1056#1105'.'#1056#1109'.)')
          ParentFont = False
        end
        object meKomissya1: TfrxMemoView
          ShiftMode = smDontShift
          Left = 256.000000000000000000
          Top = 240.000000000000000000
          Width = 810.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          FlowTo = frxReport1.meKomissya2
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_KOMISSYA]')
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          ShiftMode = smDontShift
          Top = 300.000000000000000000
          Width = 256.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#183#1056#1029#1056#176#1057#8225#1056#181#1056#1029#1056#176' '#1056#1111#1057#1026#1056#1105#1056#1108#1056#176#1056#183#1056#1109#1056#1112' ('#1057#1026#1056#176#1057#1027#1056#1111#1056#1109#1057#1026#1057#1039#1056#182#1056#181#1056#1029#1056#1105#1056#181#1056#1112')')
          ParentFont = False
          VAlign = vaCenter
        end
        object meKomissya2: TfrxMemoView
          ShiftMode = smDontShift
          Top = 280.000000000000000000
          Width = 706.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          ShiftMode = smDontShift
          Left = 706.000000000000000000
          Top = 300.000000000000000000
          Width = 360.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1111#1057#1026#1056#1109#1056#1105#1056#183#1056#1030#1056#181#1056#187#1056#176' '#1056#1111#1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1108#1057#1107' '#1056#1030#1057#8249#1056#1169#1056#176#1056#1029#1056#1029#1057#8249#1057#8230' '#1057#1027#1056#1109' '#1057#1027#1056#1108#1056#187 +
              #1056#176#1056#1169#1056#176' '#1056#1030' '#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          ShiftMode = smDontShift
          Left = 706.000000000000000000
          Top = 280.000000000000000000
          Width = 360.000000000000000000
          Height = 20.000000000000000000
          OnPreviewClick = 'Memo54OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_ZAV_OTD]')
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          ShiftMode = smDontShift
          Top = 320.000000000000000000
          Width = 1066.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#152#1057#1027#1057#8218#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039': [VAR_FIN_SOURCE]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          ShiftMode = smDontShift
          Left = 1066.000000000000000000
          Top = 119.000000000000000000
          Height = 100.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
      end
      object MasterData1: TfrxMasterData
        Height = 20.000000000000000000
        Top = 532.000000000000000000
        Width = 1065.827460000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
        RowCount = 0
        Stretched = True
        object Memo64: TfrxMemoView
          Width = 52.000000000000000000
          Height = 20.000000000000000000
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
            '[frxDBReport1."rownum"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 52.000000000000000000
          Width = 204.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."MEDICNAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 256.000000000000000000
          Width = 40.000000000000000000
          Height = 20.000000000000000000
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
        object Memo67: TfrxMemoView
          Left = 296.000000000000000000
          Width = 68.000000000000000000
          Height = 20.000000000000000000
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
            '[frxDBReport1."FC_EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 364.000000000000000000
          Width = 64.000000000000000000
          Height = 20.000000000000000000
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
        object Memo69: TfrxMemoView
          Left = 428.000000000000000000
          Width = 60.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBReport1."FN_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 488.000000000000000000
          Width = 72.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBReport1."FN_PRICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 560.000000000000000000
          Width = 116.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBReport1."FN_SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 676.000000000000000000
          Width = 148.000000000000000000
          Height = 20.000000000000000000
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
            '[frxDBReport1."FC_RASH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 824.000000000000000000
          Width = 75.000000000000000000
          Height = 20.000000000000000000
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
        object Memo74: TfrxMemoView
          Left = 899.000000000000000000
          Width = 75.000000000000000000
          Height = 20.000000000000000000
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
        object Memo75: TfrxMemoView
          Left = 974.000000000000000000
          Width = 92.000000000000000000
          Height = 20.000000000000000000
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
      object MasterFooter1: TfrxFooter
        Height = 140.000000000000000000
        Top = 612.000000000000000000
        Width = 1065.827460000000000000
        Stretched = True
        object Memo76: TfrxMemoView
          ShiftMode = smDontShift
          Left = 428.000000000000000000
          Width = 60.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.1n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[<FN_ITOG_KOL>]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          ShiftMode = smDontShift
          Left = 560.000000000000000000
          Width = 116.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[<FN_ITOG_SUM>]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          ShiftMode = smDontShift
          Top = 32.000000000000000000
          Width = 428.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#181#1056#1112#1057#1107' '#1056#176#1056#1108#1057#8218#1057#1107' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1109' '#1056#1029#1056 +
              #176' '#1056#1109#1056#177#1057#8240#1057#1107#1057#1035' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          ShiftMode = smDontShift
          Left = 560.000000000000000000
          Top = 32.000000000000000000
          Width = 116.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[<FN_ITOG_SUM>]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          ShiftMode = smDontShift
          Left = 364.000000000000000000
          Width = 64.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1056#1118#1056#1115#1056#8220#1056#1115':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          ShiftMode = smDontShift
          Left = 676.000000000000000000
          Top = 32.000000000000000000
          Width = 390.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[MONEYSTR(<FN_ITOG_SUM>)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          ShiftMode = smDontShift
          Left = 676.000000000000000000
          Top = 52.000000000000000000
          Width = 390.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1027#1057#1107#1056#1112#1056#1112#1056#176' '#1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035')')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          ShiftMode = smDontShift
          Left = 52.000000000000000000
          Top = 88.000000000000000000
          Width = 436.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_MO_DOLJNOST]')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          ShiftMode = smDontShift
          Left = 52.000000000000000000
          Top = 108.000000000000000000
          Width = 436.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          ShiftMode = smDontShift
          Left = 560.000000000000000000
          Top = 88.000000000000000000
          Width = 116.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          ShiftMode = smDontShift
          Left = 560.000000000000000000
          Top = 108.000000000000000000
          Width = 116.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          ShiftMode = smDontShift
          Left = 676.000000000000000000
          Top = 88.000000000000000000
          Width = 390.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[VAR_MO]')
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          ShiftMode = smDontShift
          Left = 676.000000000000000000
          Top = 108.000000000000000000
          Width = 390.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 812.000000000000000000
        Width = 1065.827460000000000000
        object Memo11: TfrxMemoView
          Align = baWidth
          Width = 1065.827460000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          HAlign = haRight
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 20.000000000000000000
        Top = 572.000000000000000000
        Width = 1065.827460000000000000
        object Memo15: TfrxMemoView
          Left = 428.000000000000000000
          Width = 60.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[<FN_GROUP_KOL>]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 560.000000000000000000
          Width = 116.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[<FN_GROUP_SUM>]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 488.000000000000000000
          Width = 72.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 20.000000000000000000
        Top = 492.000000000000000000
        Width = 1065.827460000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = '<frxDBReport1."FC_UCHGR">'
        object Memo62: TfrxMemoView
          Width = 52.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Color = clSilver
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
        object Memo63: TfrxMemoView
          Left = 52.000000000000000000
          Width = 1014.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_UCHGR"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 48.000000000000000000
        Top = 424.000000000000000000
        Width = 1065.827460000000000000
        object Memo2: TfrxMemoView
          ShiftMode = smDontShift
          Width = 296.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1056#181' '#1056#183#1056#176#1056#1111#1056#176#1057#1027#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          ShiftMode = smDontShift
          Top = 16.000000000000000000
          Width = 52.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
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
        object Memo4: TfrxMemoView
          ShiftMode = smDontShift
          Left = 52.000000000000000000
          Top = 16.000000000000000000
          Width = 204.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          ShiftMode = smDontShift
          Left = 256.000000000000000000
          Top = 16.000000000000000000
          Width = 40.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          ShiftMode = smDontShift
          Top = 32.000000000000000000
          Width = 52.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
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
        object Memo14: TfrxMemoView
          ShiftMode = smDontShift
          Left = 52.000000000000000000
          Top = 32.000000000000000000
          Width = 204.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
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
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          ShiftMode = smDontShift
          Left = 256.000000000000000000
          Top = 32.000000000000000000
          Width = 40.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
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
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          ShiftMode = smDontShift
          Left = 296.000000000000000000
          Width = 68.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          ShiftMode = smDontShift
          Left = 296.000000000000000000
          Top = 32.000000000000000000
          Width = 68.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
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
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          ShiftMode = smDontShift
          Left = 364.000000000000000000
          Width = 64.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1057#1026#1056#1112#1056#176
            #1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          ShiftMode = smDontShift
          Left = 364.000000000000000000
          Top = 32.000000000000000000
          Width = 64.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
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
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          ShiftMode = smDontShift
          Left = 428.000000000000000000
          Width = 248.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1105' '#1056#1105#1056#183#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          ShiftMode = smDontShift
          Left = 428.000000000000000000
          Top = 16.000000000000000000
          Width = 60.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          ShiftMode = smDontShift
          Left = 488.000000000000000000
          Top = 16.000000000000000000
          Width = 72.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          ShiftMode = smDontShift
          Left = 560.000000000000000000
          Top = 16.000000000000000000
          Width = 116.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          ShiftMode = smDontShift
          Left = 428.000000000000000000
          Top = 32.000000000000000000
          Width = 60.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
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
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          ShiftMode = smDontShift
          Left = 488.000000000000000000
          Top = 32.000000000000000000
          Width = 72.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
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
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          ShiftMode = smDontShift
          Left = 560.000000000000000000
          Top = 32.000000000000000000
          Width = 116.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
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
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          ShiftMode = smDontShift
          Left = 676.000000000000000000
          Width = 148.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1111#1057#1026#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1056#181' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          ShiftMode = smDontShift
          Left = 676.000000000000000000
          Top = 32.000000000000000000
          Width = 148.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
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
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          ShiftMode = smDontShift
          Left = 824.000000000000000000
          Width = 150.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8216#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026#1057#1027#1056#1108#1056#176#1057#1039' '#1056#183#1056#176#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          ShiftMode = smDontShift
          Left = 824.000000000000000000
          Top = 16.000000000000000000
          Width = 75.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#181#1056#177#1056#181#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          ShiftMode = smDontShift
          Left = 899.000000000000000000
          Top = 16.000000000000000000
          Width = 75.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1057#1026#1056#181#1056#1169#1056#1105#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          ShiftMode = smDontShift
          Left = 824.000000000000000000
          Top = 32.000000000000000000
          Width = 75.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '9')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          ShiftMode = smDontShift
          Left = 899.000000000000000000
          Top = 32.000000000000000000
          Width = 75.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '10')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          ShiftMode = smDontShift
          Left = 974.000000000000000000
          Width = 92.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#8216#1056#1113)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          ShiftMode = smDontShift
          Left = 974.000000000000000000
          Top = 32.000000000000000000
          Width = 92.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '11')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBNacenkaUcenka: TfrxDBDataset
    UserName = 'frxDBNacenkaUcenka'
    CloseDataSource = False
    DataSet = odsNacenkaUcenka
    BCDToCurrency = False
    Left = 200
    Top = 248
  end
  object frxDBReport1: TfrxDBDataset
    UserName = 'frxDBReport1'
    CloseDataSource = False
    DataSet = odsRashByUchgr_FincSrc
    BCDToCurrency = False
    Left = 136
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
      '  end if;'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000004000000070000003A5056414C554505000000000000000000000009
      0000003A5053454354494F4E050000000000000000000000070000003A504944
      454E54050000000000000000000000090000003A5044454641554C5405000000
      0000000000000000}
    Cursor = crSQLWait
    Left = 8
    Top = 84
  end
  object frRashDocPoMedicFinSource: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frRashDocITOGGetValue
    Left = 527
    Top = 436
    ReportForm = {
      1900000095130000190000FFFF01000100FFFFFFFFFF09000000340800009A0B
      00004800000024000000190000002400000000FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000024000000F6020000B50000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E486561646572310002010000000028010000F60200002700000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200AF0100000B004D617374657244617461310002010000000094010000F602
      0000140000003100050001000000000000000000FFFFFF1F000000000C006672
      4442446174615365743100000000000000FFFF00000000000200000001000000
      0000000001000000C8000000140000000100000000000002001C0200000D004D
      6173746572466F6F746572310002010000000004020000F60200001900000031
      00060001000000000000000000FFFFFF1F00000000000000000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      000000000200870200000B0050616765466F6F74657231000201000000003802
      0000F6020000140000003000030001000000000000000000FFFFFF1F00000000
      000000000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200F30200000C0047726F7570466F6F74
      65723100020100000000C6010000F60200001400000030001100010000000000
      00000000FFFFFF1F00000000000000000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000200AB0300
      000C0047726F7570486561646572310002010000000064010000F60200001400
      00003000100001000000000000000000FFFFFF1F0000000025005B6F64735365
      6C446F63506F4D65646963547970652E2246435F6D6564696374797065225D00
      00000003000500626567696E0D170020202020464E5F47524F55505F53554D4D
      203A3D20303B0D0300656E6400FFFF0000000000020000000100000000000000
      01000000C8000000140000000100000000000000003004000006004D656D6F31
      350002004800000004020000900100001900000003000F00DC05000000000000
      0000FFFFFF1F2C02000000000001000600C8F2EEE3EE3A00000000FFFF000000
      00000200000001000000000500417269616C000A000000020000000000090000
      00CC00020000000000FFFFFF0000000002000000000000000000D20400000600
      4D656D6F3137000200E301000004020000B60000001900000023000F00DC0500
      00000000000000FFFFFF1F2C0204011400232323202323232023232320232330
      2E303020F00001000F005B464E5F49544F474F5F53554D4D5D00000000FFFF00
      000000000200000001000000000500417269616C000C00000002000000000009
      000000CC00020000000000FFFFFF00000000020000000000000000006D050000
      06004D656D6F3131000200480000003902000095020000110000000300000001
      000000000000000000FFFFFF1F2C02000000000001001C00F1F2F02E205B5041
      4745235D20E8E7205B544F54414C50414745535D00000000FFFF000000000002
      00000001000000040500417269616C000A00000000000000000009000000CC00
      020000000000FFFFFF0000000002000000000000000000F105000006004D656D
      6F313400020048000000280100001E0000002700000003000F00DC0500000000
      00000000CCFFCC002C02000000000001000500B920EF2FEF00000000FFFF0000
      0000000200000001000000000500417269616C00090000000200000000000A00
      0000CC00020000000000FFFFFF00000000020000000000000000007806000006
      004D656D6F343000020048000000940100001E0000001400000003000F000100
      0000000000000000FFFFFF1F2C020000000000010008005B4C494E45235D2900
      000000FFFF00000000000200000001000000000500417269616C000800000000
      000000000009000000CC00020000000000FFFFFF000000000200000000000000
      00000307000006004D656D6F323100020066000000280100000D010000270000
      0003000F00DC050000000000000000CCFFCC002C02000000000001000C00CDE0
      E8ECE5EDEEE2E0EDE8E500000000FFFF00000000000200000001000000000500
      417269616C00090000000200000000000A000000CC00020000000000FFFFFF00
      000000020000000000000000008A07000006004D656D6F323300020073010000
      28010000400000002700000003000F00DC050000000000000000CCFFCC002C02
      000000000001000800C5E42E20E8E7EC2E00000000FFFF000000000002000000
      01000000000500417269616C00090000000200000000000A000000CC00020000
      000000FFFFFF00000000020000000000000000000F08000006004D656D6F3234
      000200B301000028010000300000002700000003000F00DC0500000000000000
      00CCFFCC002C02000000000001000600CAEEEB2DE2EE00000000FFFF00000000
      000200000001000000000500417269616C00090000000200000000000A000000
      CC00020000000000FFFFFF00000000020000000000000000009508000006004D
      656D6F3235000200E3010000280100004D0000002700000003000F00DC050000
      000000000000CCFFCC002C02000000000001000700D6E5EDE02C20F000000000
      FFFF00000000000200000001000000000500417269616C000900000002000000
      00000A000000CC00020000000000FFFFFF00000000020000000000000000001C
      09000006004D656D6F3236000200300200002801000069000000270000000300
      0F00DC050000000000000000CCFFCC002C02000000000001000800D1F3ECECE0
      2C20F000000000FFFF00000000000200000001000000000500417269616C0009
      0000000200000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000000BC09000006004D656D6F323700020066000000940100000D0100
      001400000003000F0001000000000000000000FFFFFF1F2C0200000000000100
      21005B6F647353656C446F63506F4D65646963547970652E224E414D454B4152
      54225D00000000FFFF00000000000200000001000000000500417269616C0008
      00000000000000000008000000CC00020000000000FFFFFF0000000002000000
      0000000000005C0A000006004D656D6F32380002007301000094010000400000
      001400000003000F0001000000000000000000FFFFFF1F2C0200000000000100
      21005B6F647353656C446F63506F4D65646963547970652E2246435F4544495A
      4D225D00000000FFFF00000000000200000001000000000500417269616C0008
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000000FA0A000006004D656D6F3239000200B301000094010000300000
      001400000003000F0001000000000000000000FFFFFF1F2C0200000000000100
      1F005B6F647353656C446F63506F4D65646963547970652E2246435F4B4F4C22
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000B10B000006004D656D6F3330000200E3010000940100004D00000014
      00000003000F0001000000000000000000FFFFFF1F2C02030110002323232023
      2323202323302E303020F000010028005B6F647353656C446F63506F4D656469
      63547970652E22464E5F50524943455F44455441494C225D00000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000FB0C000006
      004D656D6F33310002003002000094010000690000001400000003000F000100
      0000000000000000FFFFFF1F2C020301100023232320232323202323302E3030
      20F000010020005B6F647353656C446F63506F4D65646963547970652E22464E
      5F53554D4D225D0004000500626567696E0D44002020464E5F47524F55505F53
      554D4D203A3D20464E5F47524F55505F53554D4D202B205B6F647353656C446F
      63506F4D65646963547970652E22464E5F53554D4D225D3B0D44002020464E5F
      49544F474F5F53554D4D203A3D20464E5F49544F474F5F53554D4D202B205B6F
      647353656C446F63506F4D65646963547970652E22464E5F53554D4D225D3B0D
      0300656E6400FFFF00000000000200000001000000000500417269616C000800
      00000000000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000DB0D000005004D656D6F36000200480000009B000000950200001B
      0000000300000001000000000000000000FFFFFF1F2C02000000000001002500
      CEF2F7E5F220EFEE20F0E0F1F5EEE4F320EFEE20E3F0F3EFEFE0EC20F3F7E5F2
      EDEEF1F2E80004000500626567696E0D15002020464E5F47524F55505F53554D
      4D203A3D20303B0D15002020464E5F49544F474F5F53554D4D203A3D20303B0D
      0300656E6400FFFF00000000000200000001000000040500417269616C001000
      000002000000000002000000CC00020000000000FFFFFF000000000200000000
      00000000007F0E000005004D656D6F3700020048000000B30000009502000018
      0000000300000001000000000000000000FFFFFF1F2C02000000000001002600
      E7E020EFE5F0E8EEE420F1205B7661725F64617465315D20EFEE205B7661725F
      64617465325D00000000FFFF0000000000020000000100000004050041726961
      6C000B0000000200000000000A000000CC00020000000000FFFFFF0000000002
      000000000000000000140F000005004D656D6F380002004800000040000000D2
      0100000E0000000300000001000000000000000000FFFFFF1F2C020000000000
      01001700EDE0E8ECE5EDEEE2E0EDE8E520F3F7F0E5E6E4E5EDE8FF00000000FF
      FF00000000000200000001000000010500417269616C00080000000000000000
      00020000000100020000000000FFFFFF0000000002000000000000000000A00F
      000005004D656D6F390002004800000024000000D20100001C00000003000200
      01000000000000000000CCFFCC002C02000000000001000E005B7661725F7265
      6365697665725D00000000FFFF00000000000200000001000000010500417269
      616C000A000000000000000000120000000100020000000000FFFFFF00000000
      020000000000000000002D10000006004D656D6F313300020048000000550000
      00D2010000190000000300020001000000000000000000CCFFCC002C02000000
      000001000E005B7661725F6D6F5F67726F75705D00000000FFFF000000000002
      00000001000000010500417269616C000C00000000000000000012000000CC00
      020000000000FFFFFF0000000002000000000000000000C610000006004D656D
      6F3136000200480000006F000000D20100000E00000003000000010000000000
      00000000FFFFFF1F2C02000000000001001A00EDE0E8ECE5EDEEE2E0EDE8E520
      EFEEE4F0E0E7E4E5EBE5EDE8FF00000000FFFF00000000000200000001000000
      010500417269616C000800000000000000000002000000CC00020000000000FF
      FFFF00000000020000000000000000007A11000006004D656D6F313200020048
      000000C601000090010000140000000300090002000000000000000000FFFFFF
      1F2C02000000000001003500C8F2EEE3EE20EFEE20F2E8EFF320225B6F647353
      656C446F63506F4D65646963547970652E2246435F6D6564696374797065225D
      2200000000FFFF00000000000200000001000000000500417269616C000A0000
      0002000000000009000000CC00020000000000FFFFFF00000000020000000000
      000000001C12000006004D656D6F3138000200E3010000C6010000B600000014
      00000003000F0002000000000000000000FFFFFF1F2C02040114002323232023
      232320232323202323302E303020F00001000F005B464E5F47524F55505F5355
      4D4D5D00000000FFFF00000000000200000001000000000500417269616C000A
      00000002000000000009000000CC00020000000000FFFFFF0000000002000000
      000000000000C012000005004D656D6F31000200660000006401000074020000
      1400000003000F0002000000000000000000CCFFFF002C020000000000010026
      00205B6F647353656C446F63506F4D65646963547970652E2246435F46494E53
      4F55524345225D00000000FFFF00000000000200000001000000000500417269
      616C000A000000020000000000080000000100020000000000FFFFFF00000000
      020000000000000000004813000005004D656D6F350002004800000064010000
      1E0000001400000003000F0002000000000000000000CCFFFF002C0200000000
      00020007005B4C494E45235D0D000000000000FFFF0000000000020000000100
      0000000500417269616C00080000000000000000000A000000CC000200000000
      00FFFFFF000000000200000000000000FEFEFF020000000A002043617465676F
      72793100000000040073756D6D00010030000000000000000000FC0000000000
      000000000000000000000058008DF9BA39EDD2E2407BBF965DED4EE440}
  end
  object odsSelDocPoMedicFinSource: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  sum(TDPC.FN_KOL) as FN_KOL,'
      '  sum(TKART.FN_PRICE*TDPC.FN_KOL) as FN_SUMM,'
      '  TKART.FN_PRICE,  TMEDIC.FC_NAME as MEDICNAME,'
      '  TEI.FC_NAME AS FC_EDIZM,  FS.fc_name as FC_FINSOURCE'
      '  '
      
        'FROM  (select dp1.kartid, dp1.fn_kol from MED.TDOCS d1, MED.TDPC' +
        ' dp1 '
      
        '       where d1.fk_mogroupid_from = :MO_GROUP and d1.fp_vidmove ' +
        'in (8,14) and -- '#1089#1087#1080#1089#1072#1085#1080#1103' '#1080' '#1074#1099#1089#1086#1082#1080#1077' '#1090#1077#1093#1085#1086#1083#1086#1075#1080#1080
      
        '             d1.dpid = dp1.dpid and TRUNC(:ADATA1) <= d1.FD_DATA' +
        ' AND d1.FD_DATA < TRUNC(:ADATA2+1) and '
      '             d1.FL_EDIT = 0'
      '       UNION ALL'
      
        '       select dp2.kartid, dp2.fn_kol from MED.TDOCS d2, MED.TDPC' +
        ' dp2, med.tmo_group mg'
      
        '       where d2.fk_mogroupid_from = :MO_GROUP and d2.fp_vidmove ' +
        '= 3 and '
      
        '             d2.fk_mogroupid_to = mg.groupid and mg.fl_post = 1 ' +
        'and'
      
        '             d2.dpid = dp2.dpid and TRUNC(:ADATA1) <= d2.FD_DATA' +
        ' AND d2.FD_DATA < TRUNC(:ADATA2+1) and'
      '             d2.FL_EDIT = 0) TDPC,'
      '       MED.TKART, MED.TMEDIC, MED.TEI, med.TFINSOURCE FS'
      'WHERE TDPC.KARTID = TKART.KARTID'
      '  AND TKART.MEDICID=TMEDIC.MEDICID'
      '  AND TMEDIC.EIID = TEI.EIID(+)'
      '  AND TKART.FK_FINSOURCE_ID = FS.fk_id(+)'
      ''
      'group by '
      '  TKART.FN_PRICE,'
      '  TMEDIC.FC_NAME,'
      '  TEI.FC_NAME,'
      '  FS.fc_name'
      ''
      'ORDER BY UPPER(FS.fc_name), UPPER(TMEDIC.FC_NAME)')
    Optimize = False
    Variables.Data = {
      0300000003000000070000003A4144415441310C000000000000000000000007
      0000003A4144415441320C0000000000000000000000090000003A4D4F5F4752
      4F5550030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000190000000400000044504944010000000000090000004D4F4F574E45
      5249440100000000000600000046435F444F430100000000000600000046505F
      5649440100000000000A00000046435F434F4D4D454E54010000000000080000
      004D4F46524F4D4944010000000000060000004D4F544F494401000000000002
      0000004432010000000000020000004431010000000000040000004441544101
      0000000000080000004E414D4546524F4D0100000000000B00000046435F4D4F
      544F4E414D4501000000000006000000445049445F3101000000000005000000
      4450434944010000000000070000004D45444943494401000000000006000000
      464E5F4B4F4C01000000000007000000464E5F53554D4D0100000000000F0000
      00464E5F50524943455F44455441494C010000000000060000004B4152544944
      010000000000080000004E414D454B4152540100000000000900000046435F53
      455249414C0100000000000800000045445F494E495A4D0100000000000F0000
      00464E5F50524943455F4D41535445520100000000000D00000046435F4D4F5F
      47525F46524F4D0100000000001E0000004D45442E4745545F4445434F444544
      4F435649442854444F43532E46505F010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 377
    Top = 436
  end
  object frxRashDocPoMedicFinSource: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38551.413297164290000000
    ReportOptions.LastChange = 40569.486586412040000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      
        'procedure Memo13OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1075#1088#1091#1087#1087#1091' '#1052#1054#39', '#39#1053#1072#1079#1074#1072#1085#1080#1077':'#39', s);  '
      '  TfrxMemoView(Sender).Text := s;         '
      '  Modified := True;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    OnUserFunction = frxReport1UserFunction
    Left = 528
    Top = 488
    Datasets = <
      item
        DataSet = frxDBNacenkaUcenka
        DataSetName = 'frxDBNacenkaUcenka'
      end
      item
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 1
      ColumnWidth = 183.000000000000000000
      ColumnPositions.Strings = (
        '0')
      object ReportTitle1: TfrxReportTitle
        Height = 161.000000000000000000
        Top = 18.897650000000000000
        Width = 691.653990000000000000
        Stretched = True
        object Memo8: TfrxMemoView
          ShiftMode = smDontShift
          Top = 28.000000000000000000
          Width = 489.000000000000000000
          Height = 14.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#1107#1057#8225#1056#181#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          ShiftMode = smDontShift
          Width = 489.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          Color = 13434828
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_RECEIVER]')
          VAlign = vaBottom
        end
        object Memo6: TfrxMemoView
          ShiftMode = smDontShift
          Top = 104.661410000000000000
          Width = 691.000000000000000000
          Height = 24.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1106#1056#1108#1057#8218' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1105#1057#1039' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1056#1109#1056#1030)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          ShiftMode = smDontShift
          Top = 128.661410000000000000
          Width = 691.000000000000000000
          Height = 24.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [VAR_DATE1] '#1056#1111#1056#1109' [VAR_DATE2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          ShiftMode = smDontShift
          Top = 50.000000000000000000
          Width = 489.000000000000000000
          Height = 25.000000000000000000
          OnPreviewClick = 'Memo13OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_MO_GROUP]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo2: TfrxMemoView
          ShiftMode = smDontShift
          Top = 75.000000000000000000
          Width = 489.000000000000000000
          Height = 14.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 514.016080000000000000
        Width = 691.653990000000000000
        object Memo11: TfrxMemoView
          ShiftMode = smDontShift
          Width = 691.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          HAlign = haRight
          Memo.UTF8 = (
            '[<Page>] '#1056#1105#1056#183' [<TotalPages>]')
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 39.000000000000000000
        Top = 241.889920000000000000
        Width = 691.653990000000000000
        object Memo14: TfrxMemoView
          ShiftMode = smDontShift
          Width = 30.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          ShiftMode = smDontShift
          Left = 30.000000000000000000
          Width = 335.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          ShiftMode = smDontShift
          Left = 365.000000000000000000
          Width = 64.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          ShiftMode = smDontShift
          Left = 429.000000000000000000
          Width = 60.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          ShiftMode = smDontShift
          Left = 489.000000000000000000
          Width = 90.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176', '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          ShiftMode = smDontShift
          Left = 579.000000000000000000
          Width = 112.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Height = 20.000000000000000000
        Top = 343.937230000000000000
        Width = 691.653990000000000000
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
        RowCount = 0
        Stretched = True
        object Memo40: TfrxMemoView
          ShiftMode = smDontShift
          Width = 30.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[LINE#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          ShiftMode = smDontShift
          Left = 30.000000000000000000
          Width = 335.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."MEDICNAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          ShiftMode = smDontShift
          Left = 365.000000000000000000
          Width = 64.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FC_EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          ShiftMode = smDontShift
          Left = 429.000000000000000000
          Width = 60.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FN_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          ShiftMode = smDontShift
          Left = 489.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FN_PRICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          ShiftMode = smDontShift
          Left = 579.000000000000000000
          Width = 112.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FN_SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 20.000000000000000000
        Top = 302.362400000000000000
        Width = 691.653990000000000000
        Condition = '<frxDBReport1."FC_FINSOURCE">'
        object Memo1: TfrxMemoView
          ShiftMode = smDontShift
          Left = 30.000000000000000000
          Width = 661.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777164
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            
              #1056#152#1057#1027#1057#8218#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039': [frxDBReport1."FC' +
              '_FINSOURCE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          ShiftMode = smDontShift
          Width = 30.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777164
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 20.000000000000000000
        Top = 385.512060000000000000
        Width = 691.653990000000000000
        object Memo12: TfrxMemoView
          ShiftMode = smDontShift
          Width = 489.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          ShiftMode = smDontShift
          Left = 489.000000000000000000
          Width = 202.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBReport1."FN_SUMM">)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 25.000000000000000000
        Top = 427.086890000000000000
        Width = 691.653990000000000000
        object Memo15: TfrxMemoView
          ShiftMode = smDontShift
          Width = 489.000000000000000000
          Height = 25.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          ShiftMode = smDontShift
          Left = 489.000000000000000000
          Width = 202.000000000000000000
          Height = 25.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBReport1."FN_SUMM">)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object odsSelDocPoMedicFinSource_DS: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  sum(TDPC.FN_KOL) as FN_KOL,'
      '  sum(TKART.FN_PRICE*TDPC.FN_KOL) as FN_SUMM,'
      '  TKART.FN_PRICE,  TMEDIC.FC_NAME as MEDICNAME,'
      '  TEI.FC_NAME AS FC_EDIZM,  FS.fc_name as FC_FINSOURCE'
      '  '
      
        'FROM  (select dp2.kartid, dp2.fn_kol from MED.TDOCS d2, MED.TDPC' +
        ' dp2'
      
        '       where d2.fk_mogroupid_to = :MO_GROUP and d2.fp_vidmove = ' +
        '3 and '
      
        '             d2.dpid = dp2.dpid and TRUNC(:ADATA1) <= d2.FD_DATA' +
        ' AND d2.FD_DATA < TRUNC(:ADATA2+1) and'
      '             d2.FL_EDIT = 0) TDPC,'
      '       MED.TKART, MED.TMEDIC, MED.TEI, med.TFINSOURCE FS'
      'WHERE TDPC.KARTID = TKART.KARTID'
      '  AND TKART.MEDICID=TMEDIC.MEDICID'
      '  AND TMEDIC.EIID = TEI.EIID(+)'
      '  AND TKART.FK_FINSOURCE_ID = FS.fk_id(+)'
      ''
      'group by '
      '  TKART.FN_PRICE,'
      '  TMEDIC.FC_NAME,'
      '  TEI.FC_NAME,'
      '  FS.fc_name'
      ''
      'ORDER BY UPPER(FS.fc_name), UPPER(TMEDIC.FC_NAME)')
    Optimize = False
    Variables.Data = {
      0300000003000000070000003A4144415441310C000000000000000000000007
      0000003A4144415441320C0000000000000000000000090000003A4D4F5F4752
      4F5550030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000190000000400000044504944010000000000090000004D4F4F574E45
      5249440100000000000600000046435F444F430100000000000600000046505F
      5649440100000000000A00000046435F434F4D4D454E54010000000000080000
      004D4F46524F4D4944010000000000060000004D4F544F494401000000000002
      0000004432010000000000020000004431010000000000040000004441544101
      0000000000080000004E414D4546524F4D0100000000000B00000046435F4D4F
      544F4E414D4501000000000006000000445049445F3101000000000005000000
      4450434944010000000000070000004D45444943494401000000000006000000
      464E5F4B4F4C01000000000007000000464E5F53554D4D0100000000000F0000
      00464E5F50524943455F44455441494C010000000000060000004B4152544944
      010000000000080000004E414D454B4152540100000000000900000046435F53
      455249414C0100000000000800000045445F494E495A4D0100000000000F0000
      00464E5F50524943455F4D41535445520100000000000D00000046435F4D4F5F
      47525F46524F4D0100000000001E0000004D45442E4745545F4445434F444544
      4F435649442854444F43532E46505F010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 377
    Top = 516
  end
  object odsSelDocPoFinSource: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  MASTER1.*, DETAIL1.*,'
      
        '  rtrim(TO_CHAR(DETAIL1.FN_KOL, '#39'FM999G999G990D99999'#39'),'#39'.,'#39') as ' +
        'FC_KOL'
      '  FROM'
      '    ('
      '     SELECT'
      '       MOFROMID,'
      '       TDOCS.FC_COMMENT,'
      '       FP_VID,'
      '       FN_PRICE AS FN_PRICE_MASTER,'
      '       MOOWNERID,'
      '       TDOCS.DPID,'
      
        '       med.GET_DECODEDOCVIDMOVE(fp_vidmove)||'#39' '#8470' '#39'||TDOCS.fc_doc' +
        '||'#39' '#1086#1090' '#39'||to_char(TDOCS.fd_invoice,'#39'dd.mm.yyyy'#39') AS fc_DOC,'
      
        '       MED.PKGTDOCS.GET_DOC_DESTINATION(TDOCS.fp_vid, TDOCS.fp_v' +
        'idmove, TDOCS.fk_mogroupid_TO, TDOCS.postavid) AS FC_MO_GR_TO,'
      
        '       MED.PKGTDOCS.GET_DOC_SOURCE (TDOCS.fp_vid, TDOCS.fp_vidmo' +
        've, TDOCS.fk_mogroupid_FROM, TDOCS.postavid) as NAMEFROM,'
      ''
      '       TRUNC(TDOCS.FD_DATA) AS DATA,'
      '       MOTOID'
      
        '     FROM   MED.TDOCS --, MED.TMO, MED.TMO T2, MED.TMO_GROUP MOG' +
        'R_FROM,  MED.TMO_GROUP MOGR_TO'
      
        '     WHERE TDOCS.fk_mogroupid_from = :MO_GROUP -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084 +
        ' '#1085#1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '       AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:ADATA1) AND TRUNC' +
        '(:ADATA2)'
      
        '       AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  ' +
        'TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to' +
        ', :MO_GROUP) = -1'
      
        '       AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087#1086#1089#1082#1086#1083 +
        #1100#1082#1091' '#1074#1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085#1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086#1076'+'#1088 +
        #1072#1089#1093#1086#1076')'
      '       AND ((:IS_RPO = 1)OR(tdocs.fp_vidmove <> 7))'
      '       AND (not tdocs.fp_vidmove in (4,5))'
      '       AND TDOCS.FL_EDIT = 0  '
      '    ) MASTER1,'
      '    (SELECT '
      '          TDPC.DPID,'
      '          TDPC.DPCID,'
      '          TKART.MEDICID,'
      '          TDPC.FN_KOL,'
      '          (TKART.FN_PRICE*TDPC.FN_KOL) as FN_SUMM,'
      '          TKART.FN_PRICE AS FN_PRICE_DETAIL,'
      '          TKART.KARTID,'
      '          NVL(FS.FC_NAME,'#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39') FC_FINSOURCE,'
      '          TMEDIC.FC_NAME as MEDICNAME,'
      '          TKART.FN_PARTY_NUM,'
      
        '          TMEDIC.FC_NAME||'#39'('#1087'. '#8470#39'|| TKART.FN_PARTY_NUM||'#39')'#39' AS N' +
        'AMEKART,'
      ''
      '          TKART.FC_SERIAL,'
      '          TEI.FC_NAME AS FC_EDIZM,'
      '          UG.FC_UCHGR as FC_medictype'
      '        FROM'
      
        '          MED.TDPC, MED.TKART, MED.TMEDIC, MED.TEI, med.TUCHGR U' +
        'G, MED.TFINSOURCE FS, MED.TDOCS'
      '        WHERE'
      '          TDPC.KARTID = TKART.KARTID'
      '          AND TKART.FL_DEL = 0'
      '          AND TKART.FK_FINSOURCE_ID = FS.FK_ID (+)'
      
        '          AND TKART.FK_FINSOURCE_ID = DECODE(:FK_FINSOURCE_ID, -' +
        '1,TKART.FK_FINSOURCE_ID, :FK_FINSOURCE_ID)'
      '          AND TKART.MEDICID=TMEDIC.MEDICID'
      '          AND TMEDIC.EIID = TEI.EIID(+)          '
      '          '
      '          AND TDPC.DPID = TDOCS.DPID'
      
        '          and  TDOCS.fk_mogroupid_from = :MO_GROUP -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077 +
        #1082#1072#1077#1084' '#1085#1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '          AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:ADATA1) AND TR' +
        'UNC(:ADATA2)'
      
        '          AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID' +
        ',  TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid' +
        '_to, :MO_GROUP) = -1                         '
      
        '          AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087#1086#1089 +
        #1082#1086#1083#1100#1082#1091' '#1074#1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085#1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086 +
        #1076'+'#1088#1072#1089#1093#1086#1076')'
      '          AND (not tdocs.fp_vidmove in (4,5))'
      '          AND TDOCS.FL_EDIT = 0            '
      '         AND #uchgrid# = UG.UCHGRID         '
      '         --and ((:pUCHGR = -1)or TMEDIC.UCHGRID = :pUCHGR)'
      '    ) DETAIL1'
      '  WHERE MASTER1.DPID = DETAIL1.DPID'
      
        'ORDER BY UPPER(FC_FINSOURCE), MASTER1.DATA,  LOWER(MEDICNAME), F' +
        'N_PARTY_NUM')
    Optimize = False
    Variables.Data = {
      0300000005000000070000003A4144415441310C000000070000007871010101
      010100000000070000003A4144415441320C0000000700000078710C1F010101
      00000000090000003A4D4F5F47524F555003000000040000009D040000000000
      00070000003A49535F52504F0300000004000000000000000000000010000000
      3A464B5F46494E534F555243455F49440300000004000000FFFFFFFF00000000}
    QBEDefinition.QBEFieldDefs = {
      040000001A0000000400000044504944010000000000090000004D4F4F574E45
      5249440100000000000600000046435F444F430100000000000600000046505F
      5649440100000000000A00000046435F434F4D4D454E54010000000000080000
      004D4F46524F4D4944010000000000060000004D4F544F494401000000000004
      00000044415441010000000000080000004E414D4546524F4D01000000000006
      000000445049445F310100000000000500000044504349440100000000000700
      00004D45444943494401000000000006000000464E5F4B4F4C01000000000007
      000000464E5F53554D4D0100000000000F000000464E5F50524943455F444554
      41494C010000000000060000004B4152544944010000000000080000004E414D
      454B4152540100000000000900000046435F53455249414C0100000000000F00
      0000464E5F50524943455F4D41535445520100000000000B00000046435F4D4F
      5F47525F544F0100000000000C00000046435F46494E534F5552434501000000
      0000090000004D454449434E414D450100000000000C000000464E5F50415254
      595F4E554D0100000000000800000046435F4544495A4D0100000000000C0000
      0046435F4D45444943545950450100000000000600000046435F4B4F4C010000
      000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 97
    Top = 476
  end
  object frRashDocPoFinSource: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frRashDocITOGGetValue
    Left = 143
    Top = 476
    ReportForm = {
      19000000FF160000190000FFFF01000100FFFFFFFFFF090000009A0B00003408
      00004800000024000000190000002400000001FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      0000240000002F040000B50000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E4865616465723100020100000000280100002F0400002700000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200AF0100000B004D6173746572446174613100020100000000940100002F04
      0000140000003100050001000000000000000000FFFFFF1F000000000C006672
      4442446174615365743100000000000000FFFF00000000000200000001000000
      0000000001000000C8000000140000000100000000000002001C0200000D004D
      6173746572466F6F7465723100020100000000040200002F0400001900000031
      00060001000000000000000000FFFFFF1F00000000000000000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      000000000200870200000B0050616765466F6F74657231000201000000003802
      00002F040000140000003000030001000000000000000000FFFFFF1F00000000
      000000000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200F30200000C0047726F7570466F6F74
      65723100020100000000C60100002F0400001400000030001100010000000000
      00000000FFFFFF1F00000000000000000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000200AB0300
      000C0047726F75704865616465723100020100000000640100002F0400001400
      00003000100001000000000000000000FFFFFF1F0000000025005B6F64735365
      6C446F63506F46696E536F757263652E2246435F46494E534F55524345225D00
      00000003000500626567696E0D170020202020464E5F47524F55505F53554D4D
      203A3D20303B0D0300656E6400FFFF0000000000020000000100000000000000
      01000000C8000000140000000100000000000000002D04000005004D656D6F32
      000200B301000028010000450000002700000003000F00DC0500000000000000
      00CCFFCC002C02000000000001000400C4E0F2E000000000FFFF000000000002
      00000001000000000500417269616C00090000000200000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000B304000005004D656D
      6F33000200F801000028010000AF0000002700000003000F00DC050000000000
      000000CCFFCC002C02000000000001000800C4EEEAF3ECE5EDF200000000FFFF
      00000000000200000001000000000500417269616C0009000000020000000000
      0A000000CC00020000000000FFFFFF00000000020000000000000000003B0500
      0005004D656D6F34000200A702000028010000890000002700000003000F00DC
      050000000000000000CCFFCC002C02000000000001000A00CFEEEBF3F7E0F2E5
      EBFC00000000FFFF00000000000200000001000000000500417269616C000900
      00000200000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000D705000006004D656D6F3431000200B30100009401000045000000
      1400000003000F002C010000000000000000FFFFFF1F2C02000000000001001D
      005B6F647353656C446F63506F46696E536F757263652E2244415441225D0000
      0000FFFF00000000000200000001000000000500417269616C00080000000000
      0000000008000000CC00020000000000FFFFFF00000000020000000000000000
      007506000006004D656D6F3432000200F801000094010000AF00000014000000
      03000F002C010000000000000000FFFFFF1F2C02000000000001001F005B6F64
      7353656C446F63506F46696E536F757263652E2246435F444F43225D00000000
      FFFF00000000000200000001000000000500417269616C000800000000000000
      000008000000CC00020000000000FFFFFF000000000200000000000000000018
      07000006004D656D6F3434000200A70200009401000089000000140000000300
      0F002C010000000000000000FFFFFF1F2C020000000000010024005B6F647353
      656C446F63506F46696E536F757263652E2246435F4D4F5F47525F544F225D00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      000000000008000000CC00020000000000FFFFFF000000000200000000000000
      00009D07000006004D656D6F3135000200480000000402000018030000190000
      0003000F00DC050000000000000000FFFFFF1F2C02000000000001000600C8F2
      EEE3EE3A00000000FFFF00000000000200000001000000000500417269616C00
      0A00000002000000000009000000CC00020000000000FFFFFF00000000020000
      000000000000003F08000006004D656D6F31370002006003000004020000B600
      00001900000023000F00DC050000000000000000FFFFFF1F2C02040114002323
      232023232320232323202323302E303020F00001000F005B464E5F49544F474F
      5F53554D4D5D00000000FFFF0000000000020000000100000000050041726961
      6C000C00000002000000000009000000CC00020000000000FFFFFF0000000002
      000000000000000000DA08000006004D656D6F31310002004800000039020000
      CE030000110000000300000001000000000000000000FFFFFF1F2C0200000000
      0001001C00F1F2F02E205B50414745235D20E8E7205B544F54414C5041474553
      5D00000000FFFF00000000000200000001000000040500417269616C000A0000
      0000000000000009000000CC00020000000000FFFFFF00000000020000000000
      000000005E09000006004D656D6F313400020048000000280100001E00000027
      00000003000F00DC050000000000000000CCFFCC002C02000000000001000500
      B920EF2FEF00000000FFFF00000000000200000001000000000500417269616C
      00090000000200000000000A000000CC00020000000000FFFFFF000000000200
      0000000000000000E509000006004D656D6F343000020048000000940100001E
      0000001400000003000F0001000000000000000000FFFFFF1F2C020000000000
      010008005B4C494E45235D2900000000FFFF0000000000020000000100000000
      0500417269616C000800000000000000000009000000CC00020000000000FFFF
      FF0000000002000000000000000000700A000006004D656D6F32310002006600
      0000280100000D0100002700000003000F00DC050000000000000000CCFFCC00
      2C02000000000001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF000000
      00000200000001000000000500417269616C00090000000200000000000A0000
      00CC00020000000000FFFFFF0000000002000000000000000000F70A00000600
      4D656D6F32330002007301000028010000400000002700000003000F00DC0500
      00000000000000CCFFCC002C02000000000001000800C5E42E20E8E7EC2E0000
      0000FFFF00000000000200000001000000000500417269616C00090000000200
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      007C0B000006004D656D6F323400020030030000280100003000000027000000
      03000F00DC050000000000000000CCFFCC002C02000000000001000600CAEEEB
      2DE2EE00000000FFFF00000000000200000001000000000500417269616C0009
      0000000200000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000000020C000006004D656D6F323500020060030000280100004D0000
      002700000003000F00DC050000000000000000CCFFCC002C0200000000000100
      0700D6E5EDE02C20F000000000FFFF0000000000020000000100000000050041
      7269616C00090000000200000000000A000000CC00020000000000FFFFFF0000
      000002000000000000000000890C000006004D656D6F3236000200AD03000028
      010000690000002700000003000F00DC050000000000000000CCFFCC002C0200
      0000000001000800D1F3ECECE02C20F000000000FFFF00000000000200000001
      000000000500417269616C00090000000200000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000290D000006004D656D6F323700
      020066000000940100000D0100001400000003000F0001000000000000000000
      FFFFFF1F2C020000000000010021005B6F647353656C446F63506F46696E536F
      757263652E224E414D454B415254225D00000000FFFF00000000000200000001
      000000000500417269616C000800000000000000000008000000CC0002000000
      0000FFFFFF0000000002000000000000000000C90D000006004D656D6F323800
      02007301000094010000400000001400000003000F0001000000000000000000
      FFFFFF1F2C020000000000010021005B6F647353656C446F63506F46696E536F
      757263652E2246435F4544495A4D225D00000000FFFF00000000000200000001
      000000000500417269616C00080000000000000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000670E000006004D656D6F323900
      02003003000094010000300000001400000003000F0001000000000000000000
      FFFFFF1F2C02000000000001001F005B6F647353656C446F63506F46696E536F
      757263652E2246435F4B4F4C225D00000000FFFF000000000002000000010000
      00000500417269616C00080000000000000000000A000000CC00020000000000
      FFFFFF00000000020000000000000000001E0F000006004D656D6F3330000200
      60030000940100004D0000001400000003000F0001000000000000000000FFFF
      FF1F2C020301100023232320232323202323302E303020F000010028005B6F64
      7353656C446F63506F46696E536F757263652E22464E5F50524943455F444554
      41494C225D00000000FFFF00000000000200000001000000000500417269616C
      00080000000000000000000A000000CC00020000000000FFFFFF000000000200
      00000000000000006810000006004D656D6F3331000200AD0300009401000069
      0000001400000003000F0001000000000000000000FFFFFF1F2C020301100023
      232320232323202323302E303020F000010020005B6F647353656C446F63506F
      46696E536F757263652E22464E5F53554D4D225D0004000500626567696E0D44
      002020464E5F47524F55505F53554D4D203A3D20464E5F47524F55505F53554D
      4D202B205B6F647353656C446F63506F46696E536F757263652E22464E5F5355
      4D4D225D3B0D44002020464E5F49544F474F5F53554D4D203A3D20464E5F4954
      4F474F5F53554D4D202B205B6F647353656C446F63506F46696E536F75726365
      2E22464E5F53554D4D225D3B0D0300656E6400FFFF0000000000020000000100
      0000000500417269616C00080000000000000000000A000000CC000200000000
      00FFFFFF00000000020000000000000000004811000005004D656D6F36000200
      480000009B000000CE0300001B0000000300000001000000000000000000FFFF
      FF1F2C02000000000001002500CEF2F7E5F220EFEE20F0E0F1F5EEE4F320EFEE
      20E3F0F3EFEFE0EC20F3F7E5F2EDEEF1F2E80004000500626567696E0D150020
      20464E5F47524F55505F53554D4D203A3D20303B0D15002020464E5F49544F47
      4F5F53554D4D203A3D20303B0D0300656E6400FFFF0000000000020000000100
      0000040500417269616C001000000002000000000002000000CC000200000000
      00FFFFFF0000000002000000000000000000EC11000005004D656D6F37000200
      48000000B3000000CE030000180000000300000001000000000000000000FFFF
      FF1F2C02000000000001002600E7E020EFE5F0E8EEE420F1205B7661725F6461
      7465315D20EFEE205B7661725F64617465325D00000000FFFF00000000000200
      000001000000040500417269616C000B0000000200000000000A000000CC0002
      0000000000FFFFFF00000000020000000000000000008112000005004D656D6F
      380002004800000040000000D20100000E000000030000000100000000000000
      0000FFFFFF1F2C02000000000001001700EDE0E8ECE5EDEEE2E0EDE8E520F3F7
      F0E5E6E4E5EDE8FF00000000FFFF000000000002000000010000000105004172
      69616C0008000000000000000000020000000100020000000000FFFFFF000000
      00020000000000000000000D13000005004D656D6F3900020048000000240000
      00D20100001C0000000300020001000000000000000000CCFFCC002C02000000
      000001000E005B7661725F72656365697665725D00000000FFFF000000000002
      00000001000000010500417269616C000A000000000000000000120000000100
      020000000000FFFFFF00000000020000000000000000009A13000006004D656D
      6F31330002004800000055000000D20100001900000003000200010000000000
      00000000CCFFCC002C02000000000001000E005B7661725F6D6F5F67726F7570
      5D00000000FFFF00000000000200000001000000010500417269616C000C0000
      0000000000000012000000CC00020000000000FFFFFF00000000020000000000
      000000003314000006004D656D6F3136000200480000006F000000D20100000E
      0000000300000001000000000000000000FFFFFF1F2C02000000000001001A00
      EDE0E8ECE5EDEEE2E0EDE8E520EFEEE4F0E0E7E4E5EBE5EDE8FF00000000FFFF
      00000000000200000001000000010500417269616C0008000000000000000000
      02000000CC00020000000000FFFFFF0000000002000000000000000000E71400
      0006004D656D6F313200020048000000C6010000180300001400000003000900
      02000000000000000000FFFFFF1F2C02000000000001003500C8F2EEE3EE20EF
      EE20F2E8EFF320225B6F647353656C446F63506F46696E536F757263652E2246
      435F46494E534F55524345225D2200000000FFFF000000000002000000010000
      00000500417269616C000A00000002000000000009000000CC00020000000000
      FFFFFF00000000020000000000000000008915000006004D656D6F3138000200
      60030000C6010000B60000001400000003000F0002000000000000000000FFFF
      FF1F2C02040114002323232023232320232323202323302E303020F00001000F
      005B464E5F47524F55505F53554D4D5D00000000FFFF00000000000200000001
      000000000500417269616C000A00000002000000000009000000CC0002000000
      0000FFFFFF00000000020000000000000000002D16000005004D656D6F310002
      006600000064010000B00300001400000003000F0002000000000000000000CC
      FFFF002C02000000000001002600205B6F647353656C446F63506F46696E536F
      757263652E2246435F46494E534F55524345225D00000000FFFF000000000002
      00000001000000000500417269616C000A000000020000000000080000000100
      020000000000FFFFFF0000000002000000000000000000B216000005004D656D
      6F3500020048000000640100001E0000001400000003000F0002000000000000
      000000CCFFFF002C020000000000010007005B4C494E45235D00000000FFFF00
      000000000200000001000000000500417269616C00080000000000000000000A
      000000CC00020000000000FFFFFF000000000200000000000000FEFEFF020000
      000A002043617465676F72793100000000040073756D6D000100300000000000
      00000000FC0000000000000000000000000000000058008DF9BA39EDD2E240B2
      C5965DED4EE440}
  end
  object frxRashDocITOG: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872680000000
    ReportOptions.LastChange = 41219.463524351850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  FN_SUMM_GR : double;'
      '  FN_SUMM_ALL : double;'
      '  FN_SUMM_UC : double;'
      '  N : integer;           '
      'procedure Memo29OnAfterPrint(Sender: TfrxComponent);'
      'var'
      '  s : string;                                   '
      'begin'
      '  s := TfrxMemoView(Sender).Memo.Text;  '
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  FN_SUMM_UC := StrToFloat(s);                                  ' +
        '               '
      'end;'
      ''
      
        'procedure Memo13OnAfterPrint(Sender: TfrxComponent);            ' +
        '                       '
      'begin                                          '
      
        '  FN_SUMM_ALL := FN_SUMM_ALL + <frxdsSelDocRashPoluch."FN_PRICE"' +
        '>;'
      'end;'
      ''
      'procedure Memo11OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  N := N + 1;                          '
      'end;'
      ''
      'begin             '
      '  FN_SUMM_ALL := 0;'
      '  FN_SUMM_UC := 0;'
      '  N := 0;  '
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 608
    Top = 152
    Datasets = <
      item
        DataSet = frxDBNacenkaUcenka
        DataSetName = 'frxDBNacenkaUcenka'
      end
      item
        DataSet = frxdsSelDocRashPoluch
        DataSetName = 'frxdsSelDocRashPoluch'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 158.740260000000000000
        Top = 18.897650000000000000
        Width = 1009.134510000000000000
        object Memo2: TfrxMemoView
          Width = 491.338900000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_RECEIVER]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Top = 30.236239999999990000
          Width = 491.338900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 49.133890000000010000
          Width = 491.338900000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_MO_GROUP]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo5: TfrxMemoView
          Top = 79.370130000000000000
          Width = 491.338900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          Top = 113.385900000000000000
          Width = 1009.134510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1111#1056#1109' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1057#1107' '#1056#1111#1056#1109' '#1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1039#1056#1112)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 136.063080000000000000
          Width = 1009.134510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [VAR_DATE1] '#1056#1111#1056#1109' [VAR_DATE2]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 302.362400000000000000
        Width = 1009.134510000000000000
        DataSet = frxdsSelDocRashPoluch
        DataSetName = 'frxdsSelDocRashPoluch'
        RowCount = 0
        Stretched = True
        object Memo11: TfrxMemoView
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          OnAfterPrint = 'Memo11OnAfterPrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 56.692950000000010000
          Width = 774.803650000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxdsSelDocRashPoluch."FC_MO_GR_TO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 831.496600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          OnAfterPrint = 'Memo13OnAfterPrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxdsSelDocRashPoluch."FN_PRICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 589.606680000000000000
        Width = 1009.134510000000000000
        object Memo1: TfrxMemoView
          Align = baRight
          Left = 831.496600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
        end
      end
      object Header1: TfrxHeader
        Height = 18.897637795275590000
        Top = 238.110390000000000000
        Width = 1009.134510000000000000
        object Memo8: TfrxMemoView
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 56.692950000000010000
          Width = 774.803650000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 831.496600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Top = 279.685220000000000000
        Width = 1009.134510000000000000
        Condition = 'frxdsSelDocRashPoluch."FC_RANG"'
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 343.937230000000000000
        Width = 1009.134510000000000000
        Stretched = True
        object Memo14: TfrxMemoView
          Left = 56.692950000000010000
          Width = 774.803650000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' [frxdsSelDocRashPoluch."FC_RANG"]: [FORMATFLOAT(' +
              #39'###,###,###,###,##0.,00.'#39', SUM(<frxdsSelDocRashPoluch."FN_PRICE' +
              '">,MasterData1))]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header2: TfrxHeader
        Height = 18.897637800000000000
        Top = 385.512060000000000000
        Width = 1009.134510000000000000
        object Memo15: TfrxMemoView
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[N]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 56.692950000000010000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1057#8224#1056#181#1056#1029#1056#1108#1056#176' ('#1056#160#1056#1119#1056#1115')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 170.078850000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 264.567100000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 665.197280000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 740.787880000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 831.496600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 427.086890000000000000
        Width = 1009.134510000000000000
        DataSet = frxDBNacenkaUcenka
        DataSetName = 'frxDBNacenkaUcenka'
        RowCount = 0
        Stretched = True
        object Memo22: TfrxMemoView
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#])')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 170.078850000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsNacenkaUcenka."FD_DATA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 264.567100000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxdsNacenkaUcenka."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 665.197280000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsNacenkaUcenka."FN_NUMBER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 740.787880000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsNacenkaUcenka."FN_UCHENKA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 831.496600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
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
      object Footer1: TfrxFooter
        Height = 18.897637800000000000
        Top = 468.661720000000000000
        Width = 1009.134510000000000000
        Stretched = True
        object Memo23: TfrxMemoView
          Width = 831.496600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1057#1107#1057#8224#1056#181#1056#1029#1056#1108#1056#176' ('#1056#160#1056#1119#1056#1115')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 831.496600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          OnAfterPrint = 'Memo29OnAfterPrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBNacenkaUcenka."FN_UCHENKA">,MasterData2)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData3: TfrxMasterData
        Height = 18.897650000000000000
        Top = 510.236550000000000000
        Width = 1009.134510000000000000
        RowCount = 1
        Stretched = True
        object Memo30: TfrxMemoView
          Left = 740.787880000000000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_SUMM_ALL + FN_SUMM_UC]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Width = 740.787880000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxdsSelDocRashPoluch: TfrxDBDataset
    UserName = 'frxdsSelDocRashPoluch'
    CloseDataSource = False
    DataSet = odsSelDocRashPoluch
    BCDToCurrency = False
    Left = 456
    Top = 160
  end
  object frxRashDocPoDOC: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872700000000
    ReportOptions.LastChange = 41219.680880914360000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      '  '
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 608
    Top = 208
    Datasets = <
      item
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 158.740260000000000000
        Top = 18.897650000000000000
        Width = 1009.134510000000000000
        object Memo2: TfrxMemoView
          Width = 491.338900000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_RECEIVER]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Top = 30.236240000000000000
          Width = 491.338900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 49.133889999999990000
          Width = 491.338900000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_MO_GROUP]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo5: TfrxMemoView
          Top = 79.370130000000000000
          Width = 491.338900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          Top = 113.385900000000000000
          Width = 1009.134510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1111#1056#1109' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1057#1107' '#1056#1111#1056#1109' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176#1056#1112)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 136.063080000000000000
          Width = 1009.134510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [VAR_DATE1] '#1056#1111#1056#1109' [VAR_DATE2]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 321.260050000000000000
        Width = 1009.134510000000000000
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
        RowCount = 0
        Stretched = True
        object Memo11: TfrxMemoView
          Width = 56.692950000000010000
          Height = 18.897650000000000000
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
            '[Line])')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 151.181200000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 831.496600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBReport1."FN_PRICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 56.692950000000010000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."DATA"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 684.094930000000000000
        Width = 1009.134510000000000000
        object Memo1: TfrxMemoView
          Align = baRight
          Left = 831.496600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
        end
      end
      object Header1: TfrxHeader
        Height = 18.897637800000000000
        Top = 238.110390000000000000
        Width = 1009.134510000000000000
        object Memo8: TfrxMemoView
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 151.181200000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#1027#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 831.496600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 56.692950000000010000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 279.685220000000000000
        Width = 1009.134510000000000000
        Condition = 'frxDBReport1."FC_MO_GR_TO"'
        object Memo33: TfrxMemoView
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 56.692950000000010000
          Width = 952.441560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_MO_GR_TO"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 362.834880000000000000
        Width = 1009.134510000000000000
        Stretched = True
        object Memo14: TfrxMemoView
          Width = 831.496600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' "[frxDBReport1."FC_MO_GR_TO"]"')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 831.496600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBReport1."FN_PRICE">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 219.212740000000000000
        Top = 404.409710000000000000
        Width = 1009.134510000000000000
        Stretched = True
        object Memo30: TfrxMemoView
          Left = 740.787880000000000000
          Top = 0.000000000000056843
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBReport1."FN_PRICE">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Width = 740.787880000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Top = 30.236240000000010000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#1109#1056#1030)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo39: TfrxMemoView
          Left = 124.724490000000000000
          Top = 49.133890000000010000
          Width = 113.385900000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1108#1056#1109#1056#187'-'#1056#1030#1056#1109')')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Top = 60.472479999999960000
          Width = 124.724490000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1057#8249' '#1057#1027#1056#1169#1056#176#1056#187)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo43: TfrxMemoView
          Left = 729.449290000000000000
          Top = 60.472479999999960000
          Width = 279.685220000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1042#171'____'#1042#187' __________________  20___ '#1056#1110)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo44: TfrxMemoView
          Left = 124.724490000000000000
          Top = 86.929189999999950000
          Width = 188.976500000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 321.260050000000000000
          Top = 86.929189999999950000
          Width = 173.858380000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 502.677490000000000000
          Top = 86.929189999999950000
          Width = 226.771800000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Top = 98.267780000000010000
          Width = 124.724490000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1057#8249' '#1056#1111#1057#1026#1056#1105#1056#1029#1057#1039#1056#187)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo17: TfrxMemoView
          Left = 729.449290000000000000
          Top = 98.267779999999960000
          Width = 279.685220000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1042#171'____'#1042#187' __________________  20___ '#1056#1110)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo18: TfrxMemoView
          Left = 124.724490000000000000
          Top = 124.724490000000000000
          Width = 188.976500000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 321.260050000000000000
          Top = 124.724490000000000000
          Width = 173.858380000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 502.677490000000000000
          Top = 124.724490000000000000
          Width = 226.771800000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Top = 136.063080000000000000
          Width = 124.724490000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1105#1056#187)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo22: TfrxMemoView
          Left = 729.449290000000000000
          Top = 136.063080000000000000
          Width = 279.685220000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1042#171'____'#1042#187' __________________  20___ '#1056#1110)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo23: TfrxMemoView
          Left = 124.724490000000000000
          Top = 162.519789999999900000
          Width = 188.976500000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 321.260050000000000000
          Top = 162.519789999999900000
          Width = 173.858380000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 502.677490000000000000
          Top = 162.519789999999900000
          Width = 226.771800000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 124.724490000000000000
          Top = 30.236240000000010000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[COUNT(MasterData1)]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
    end
  end
  object frxRashDocPoMedic: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872700000000
    ReportOptions.LastChange = 41219.708293888890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  i_DPID : integer;'
      '  i_row_num_detail : integer;'
      '  i_row_num_master : integer;        '
      'procedure Memo11OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      
        'if i_DPID <> <frxDBReport1."DPID"> then //'#1085#1086#1074#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1096#1077#1083', '#1085#1072 +
        #1076#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1088#1080#1089#1086#1074#1072#1085#1080#1077' '#1085#1077#1082#1086#1090#1086#1088#1099#1093' '#1084#1077#1084#1086
      '  Begin'
      '   i_DPID := <frxDBReport1."DPID">;'
      '   i_row_num_detail := 1;'
      
        '   i_row_num_master := i_row_num_master + 1;                    ' +
        '                  '
      ''
      '   Memo11.Font.Color := clBlack;'
      '   Memo12.Font.Color := clBlack;'
      '   Memo13.Font.Color := clBlack;   '
      '   Memo35.Font.Color := clBlack;'
      '   Memo52.Visible := True;'
      '  end'
      
        'else   //'#1101#1090#1086' '#1089#1087#1080#1089#1086#1082' detail, '#1090'.'#1077'. '#1089#1087#1080#1089#1086#1082' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1074#1085#1091#1090#1088#1080' '#1084#1072#1089#1090#1077 +
        #1088#1072
      '  Begin'
      '   i_row_num_detail := i_row_num_detail + 1;'
      '   Memo52.Visible := False;'
      '   Memo11.Font.Color := clWhite;'
      '   Memo12.Font.Color := clWhite;'
      '   Memo13.Font.Color := clWhite; '
      '   Memo35.Font.Color := clWhite;'
      '  end;'
      'end;'
      ''
      'begin'
      ' i_DPID := 0; // '#1085#1086#1084#1077#1088'  [odsSelDocPrihRep."DPID"]'
      ' i_row_num_detail := 0; // '#1085#1086#1084#1077#1088' '#1089#1090#1088#1086#1082#1080' detail'
      
        ' i_row_num_master := 0; //'#1085#1086#1084#1077#1088' '#1089#1090#1088#1086#1082#1080' master                   ' +
        '              '
      'end.')
    Left = 608
    Top = 256
    Datasets = <
      item
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 158.740260000000000000
        Top = 18.897650000000000000
        Width = 1009.134510000000000000
        object Memo2: TfrxMemoView
          Width = 491.338900000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_RECEIVER]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Top = 30.236240000000000000
          Width = 491.338900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 49.133889999999990000
          Width = 491.338900000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_MO_GROUP]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo5: TfrxMemoView
          Top = 79.370130000000000000
          Width = 491.338900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          Top = 113.385900000000000000
          Width = 1009.134510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1111#1056#1109' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1057#1107)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 136.063080000000000000
          Width = 1009.134510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [VAR_DATE1] '#1056#1111#1056#1109' [VAR_DATE2]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 340.157700000000000000
        Width = 1009.134510000000000000
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
        RowCount = 0
        Stretched = True
        object Memo11: TfrxMemoView
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          OnAfterPrint = 'Memo11OnAfterPrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[i_row_num_master])')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 120.944960000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Memo.UTF8 = (
            '[frxDBReport1."FC_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 907.087200000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBReport1."FN_PRICE_MASTER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."DATA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 343.937230000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
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
            '[i_row_num_detail]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 377.953000000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."NAMEKART"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 566.929499999999900000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_ED_IZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 623.622450000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_SERIAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 702.992580000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 755.906000000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FN_PRICE_DETAIL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 820.158010000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FN_SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Width = 1009.134510000000000000
          Height = 3.779530000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 502.677490000000000000
        Width = 1009.134510000000000000
        object Memo1: TfrxMemoView
          Align = baRight
          Left = 831.496600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
        end
      end
      object Header1: TfrxHeader
        Height = 37.795275590000000000
        Top = 238.110390000000000000
        Width = 1009.134510000000000000
        object Memo8: TfrxMemoView
          Width = 45.354360000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211
            #1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 120.944960000000000000
          Width = 222.992270000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#1027#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 907.087200000000000000
          Width = 102.047310000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 343.937230000000000000
          Width = 563.149970000000100000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#1109#1056#1030#1056#176#1057#1026#1056#1029#1056#1109'-'#1056#1112#1056#176#1057#8218#1056#181#1056#187#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1056#181' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 343.937230000000000000
          Top = 18.897650000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 377.953000000000000000
          Top = 18.897650000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 566.929499999999900000
          Top = 18.897650000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 623.622450000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#181#1057#1026#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 702.992580000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 755.906000000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 820.158010000000000000
          Top = 18.897650000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 298.582870000000000000
        Width = 1009.134510000000000000
        Condition = 'frxDBReport1."FC_MO_GR_TO"'
        object Memo33: TfrxMemoView
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 45.354360000000000000
          Width = 963.780150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[frxDBReport1."FC_MO_GR_TO"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 381.732530000000000000
        Width = 1009.134510000000000000
        Stretched = True
        object Memo14: TfrxMemoView
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' "[frxDBReport1."FC_MO_GR_TO"]"')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 755.906000000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBReport1."FN_SUMM">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 423.307360000000000000
        Width = 1009.134510000000000000
        Stretched = True
        object Memo30: TfrxMemoView
          Left = 755.906000000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBReport1."FN_SUMM">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxRashDocPoMedicType: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872700000000
    ReportOptions.LastChange = 41219.721591400460000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin        '
      ''
      'end.')
    Left = 608
    Top = 304
    Datasets = <
      item
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 158.740260000000000000
        Top = 18.897650000000000000
        Width = 1009.134510000000000000
        object Memo2: TfrxMemoView
          Width = 491.338900000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_RECEIVER]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Top = 30.236240000000000000
          Width = 491.338900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 49.133889999999990000
          Width = 491.338900000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_MO_GROUP]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo5: TfrxMemoView
          Top = 79.370130000000000000
          Width = 491.338900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          Top = 113.385900000000000000
          Width = 1009.134510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1111#1056#1109' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1057#1107' '#1056#1111#1056#1109' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111#1056#176#1056#1112' '#1057#1107#1057#8225#1056#181#1057#8218#1056#1029#1056#1109#1057 +
              #1027#1057#8218#1056#1105)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 136.063080000000000000
          Width = 1009.134510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [VAR_DATE1] '#1056#1111#1056#1109' [VAR_DATE2]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 340.157700000000000000
        Width = 1009.134510000000000000
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
        RowCount = 0
        Stretched = True
        object Memo11: TfrxMemoView
          Width = 45.354360000000000000
          Height = 18.897650000000000000
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
            '[Line])')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 427.086890000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 907.087200000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBReport1."FN_SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."DATA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 45.354360000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."NAMEKART"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 294.803340000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 623.622450000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_MO_GR_TO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 789.921770000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 842.835190000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FN_PRICE_DETAIL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 502.677490000000000000
        Width = 1009.134510000000000000
        object Memo1: TfrxMemoView
          Align = baRight
          Left = 831.496600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
        end
      end
      object Header1: TfrxHeader
        Height = 37.795275590000000000
        Top = 238.110390000000000000
        Width = 1009.134510000000000000
        object Memo8: TfrxMemoView
          Width = 45.354360000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211
            #1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 427.086890000000000000
          Width = 196.535560000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 907.087200000000000000
          Width = 102.047310000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 45.354360000000000000
          Width = 249.448980000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 294.803340000000000000
          Width = 56.692950000000010000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 623.622450000000000000
          Width = 166.299320000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 789.921770000000000000
          Width = 52.913420000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 842.835190000000000000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 298.582870000000000000
        Width = 1009.134510000000000000
        Condition = 'frxDBReport1."FC_medictype"'
        object Memo33: TfrxMemoView
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 45.354360000000000000
          Width = 963.780150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_medictype"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 381.732530000000000000
        Width = 1009.134510000000000000
        Stretched = True
        object Memo14: TfrxMemoView
          Width = 842.835190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' "[frxDBReport1."FC_medictype"]"')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 842.835190000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBReport1."FN_SUMM">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 423.307360000000000000
        Width = 1009.134510000000000000
        Stretched = True
        object Memo30: TfrxMemoView
          Left = 842.835190000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBReport1."FN_SUMM">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Width = 842.835190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxRashDocPoFinSource: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872700000000
    ReportOptions.LastChange = 41219.726004687500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin        '
      ''
      'end.')
    Left = 208
    Top = 472
    Datasets = <
      item
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 158.740260000000000000
        Top = 18.897650000000000000
        Width = 1009.134510000000000000
        object Memo2: TfrxMemoView
          Width = 491.338900000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_RECEIVER]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Top = 30.236240000000000000
          Width = 491.338900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 49.133889999999990000
          Width = 491.338900000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_MO_GROUP]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo5: TfrxMemoView
          Top = 79.370130000000000000
          Width = 491.338900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          Top = 113.385900000000000000
          Width = 1009.134510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1111#1056#1109' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1057#1107' '#1056#1111#1056#1109' '#1056#1105#1057#1027#1057#8218#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108#1056#176#1056#1112' '#1057#8222#1056#1105#1056#1029#1056 +
              #176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 136.063080000000000000
          Width = 1009.134510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [VAR_DATE1] '#1056#1111#1056#1109' [VAR_DATE2]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 340.157700000000000000
        Width = 1009.134510000000000000
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
        RowCount = 0
        Stretched = True
        object Memo11: TfrxMemoView
          Width = 45.354360000000000000
          Height = 18.897650000000000000
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
            '[Line])')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 427.086890000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 907.087200000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBReport1."FN_SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."DATA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 45.354360000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."NAMEKART"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 294.803340000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 623.622450000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_MO_GR_TO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 789.921770000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 842.835190000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FN_PRICE_DETAIL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 502.677490000000000000
        Width = 1009.134510000000000000
        object Memo1: TfrxMemoView
          Align = baRight
          Left = 831.496600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
        end
      end
      object Header1: TfrxHeader
        Height = 37.795275590000000000
        Top = 238.110390000000000000
        Width = 1009.134510000000000000
        object Memo8: TfrxMemoView
          Width = 45.354360000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211
            #1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 427.086890000000000000
          Width = 196.535560000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 907.087200000000000000
          Width = 102.047310000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 45.354360000000000000
          Width = 249.448980000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 294.803340000000000000
          Width = 56.692950000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 623.622450000000000000
          Width = 166.299320000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 789.921770000000000000
          Width = 52.913420000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 842.835190000000000000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 298.582870000000000000
        Width = 1009.134510000000000000
        Condition = 'frxDBReport1."FC_FINSOURCE"'
        object Memo33: TfrxMemoView
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 45.354360000000000000
          Width = 963.780150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_FINSOURCE"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 381.732530000000000000
        Width = 1009.134510000000000000
        Stretched = True
        object Memo14: TfrxMemoView
          Width = 842.835190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' "[frxDBReport1."FC_FINSOURCE"]"')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 842.835190000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBReport1."FN_SUMM">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 423.307360000000000000
        Width = 1009.134510000000000000
        Stretched = True
        object Memo30: TfrxMemoView
          Left = 842.835190000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBReport1."FN_SUMM">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Width = 842.835190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object pmProfil: TPopupMenu
    Tag = -1
    Left = 702
    Top = 52
    object miAllProfil: TMenuItem
      Tag = -1
      AutoCheck = True
      Caption = #1042#1089#1077' '#1087#1088#1086#1092#1080#1083#1080
      Checked = True
      RadioItem = True
      OnClick = miAllProfilClick
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
  end
  object odsProfil: TOracleDataSet
    SQL.Strings = (
      'select * from MED.TPROFIL'
      'where fl_del = 0'
      'ORDER BY FC_NAME')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C010000000000}
    Session = os
    AfterOpen = odsProfilAfterOpen
    Left = 664
    Top = 47
  end
  object odsSelDocPoProfil: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  MASTER1.*, DETAIL1.*,'
      
        '  rtrim(TO_CHAR(DETAIL1.FN_KOL, '#39'FM999G999G990D99999'#39'),'#39'.,'#39') as ' +
        'FC_KOL'
      '  FROM'
      '    ('
      '     SELECT'
      '       MOFROMID,'
      '       TDOCS.FC_COMMENT,'
      '       FP_VID,'
      '       FN_PRICE AS FN_PRICE_MASTER,'
      '       MOOWNERID,'
      '       TDOCS.DPID,'
      
        '       med.GET_DECODEDOCVIDMOVE(fp_vidmove)||'#39' '#8470' '#39'||TDOCS.fc_doc' +
        '||'#39' '#1086#1090' '#39'||to_char(TDOCS.fd_invoice,'#39'dd.mm.yyyy'#39') AS fc_DOC,'
      
        '       MED.PKGTDOCS.GET_DOC_DESTINATION(TDOCS.fp_vid, TDOCS.fp_v' +
        'idmove, TDOCS.fk_mogroupid_TO, TDOCS.postavid) AS FC_MO_GR_TO,'
      
        '       MED.PKGTDOCS.GET_DOC_SOURCE (TDOCS.fp_vid, TDOCS.fp_vidmo' +
        've, TDOCS.fk_mogroupid_FROM, TDOCS.postavid) as NAMEFROM,'
      
        '       case when TDOCS.fp_vidmove in (3,8) then (select max(fc_n' +
        'ame) from MED.TPROFIL where fk_id = TDOCS.motoid) else null end ' +
        'FC_PROFIL,'
      '       TRUNC(TDOCS.FD_DATA) AS DATA,'
      '       MOTOID'
      
        '     FROM   MED.TDOCS --, MED.TMO, MED.TMO T2, MED.TMO_GROUP MOG' +
        'R_FROM,  MED.TMO_GROUP MOGR_TO'
      
        '     WHERE TDOCS.fk_mogroupid_from = :MO_GROUP -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084 +
        ' '#1085#1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '       AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:ADATA1) AND TRUNC' +
        '(:ADATA2)'
      
        '       AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  ' +
        'TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to' +
        ', :MO_GROUP) = -1'
      
        '       AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087#1086#1089#1082#1086#1083 +
        #1100#1082#1091' '#1074#1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085#1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086#1076'+'#1088 +
        #1072#1089#1093#1086#1076')'
      '       AND ((:IS_RPO = 1)OR(tdocs.fp_vidmove <> 7))'
      '       AND (not tdocs.fp_vidmove in (4,5))'
      '       AND TDOCS.FL_EDIT = 0 '
      
        '       AND ((:FK_PROFIL_ID = -1) or TDOCS.MOTOID = :FK_PROFIL_ID' +
        ') -- '#1055#1088#1086#1092#1080#1083#1080
      '    ) MASTER1,'
      '    (SELECT '
      '          TDPC.DPID,'
      '          TDPC.DPCID,'
      '          TKART.MEDICID,'
      '          TDPC.FN_KOL,'
      '          (TKART.FN_PRICE*TDPC.FN_KOL) as FN_SUMM,'
      '          TKART.FN_PRICE AS FN_PRICE_DETAIL,'
      '          TKART.KARTID,'
      '          TMEDIC.FC_NAME as MEDICNAME,'
      '          TKART.FN_PARTY_NUM,'
      
        '          TMEDIC.FC_NAME||'#39'('#1087'. '#8470#39'|| TKART.FN_PARTY_NUM||'#39')'#39' AS N' +
        'AMEKART,'
      '          FS.FC_NAME FC_FINSOURCE,'
      '          TKART.FC_SERIAL,'
      '          TEI.FC_NAME AS FC_EDIZM,'
      '          UG.root_fc_uchgr as FC_medictype'
      '        FROM'
      '          MED.TDPC, MED.TKART, MED.TMEDIC, MED.TEI, MED.TDOCS,'
      
        '          (select connect_by_root fc_uchgr as root_fc_uchgr, con' +
        'nect_by_root uchgrid as root_uchgrid, t.* from med.tuchgr t conn' +
        'ect by prior uchgrid = parentid start with parentid = 0) UG, MED' +
        '.TFINSOURCE FS'
      '        WHERE'
      '          TDPC.KARTID = TKART.KARTID'
      '          AND TKART.MEDICID=TMEDIC.MEDICID'
      '          AND TMEDIC.EIID = TEI.EIID(+)'
      '          AND TKART.FK_FINSOURCE_ID = FS.FK_ID (+)'
      '          AND TDPC.DPID = TDOCS.DPID'
      
        '          and TDOCS.fk_mogroupid_from = :MO_GROUP -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082 +
        #1072#1077#1084' '#1085#1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '          AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:ADATA1) AND TR' +
        'UNC(:ADATA2)'
      
        '          AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID' +
        ',  TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid' +
        '_to, :MO_GROUP) = -1                         '
      
        '          AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087#1086#1089 +
        #1082#1086#1083#1100#1082#1091' '#1074#1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085#1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086 +
        #1076'+'#1088#1072#1089#1093#1086#1076')'
      '          AND (not tdocs.fp_vidmove in (4,5))'
      '          AND TDOCS.FL_EDIT = 0                        '
      '          AND #uchgrid# = UG.UCHGRID          '
      '          and ((:pUCHGR = -1) or '
      '               #uchgrid#                '
      
        '               in (select uchgrid from med.tuchgr connect by pri' +
        'or uchgrid = parentid start with uchgrid = :pUCHGR))'
      '    ) DETAIL1'
      '  WHERE MASTER1.DPID = DETAIL1.DPID'
      
        'ORDER BY UPPER(FC_PROFIL), MASTER1.DATA,  LOWER(MEDICNAME), FN_P' +
        'ARTY_NUM')
    Optimize = False
    Variables.Data = {
      0300000006000000070000003A4144415441310C000000070000007871010101
      010100000000070000003A4144415441320C0000000700000078710C1F010101
      00000000090000003A4D4F5F47524F555003000000040000009D040000000000
      00070000003A5055434847520300000004000000FFFFFFFF0000000007000000
      3A49535F52504F030000000400000000000000000000000D0000003A464B5F50
      524F46494C5F49440300000004000000FFFFFFFF00000000}
    QBEDefinition.QBEFieldDefs = {
      040000001A0000000400000044504944010000000000090000004D4F4F574E45
      5249440100000000000600000046435F444F430100000000000600000046505F
      5649440100000000000A00000046435F434F4D4D454E54010000000000080000
      004D4F46524F4D4944010000000000060000004D4F544F494401000000000004
      00000044415441010000000000080000004E414D4546524F4D01000000000006
      000000445049445F310100000000000500000044504349440100000000000700
      00004D45444943494401000000000006000000464E5F4B4F4C01000000000007
      000000464E5F53554D4D0100000000000F000000464E5F50524943455F444554
      41494C010000000000060000004B4152544944010000000000080000004E414D
      454B4152540100000000000900000046435F53455249414C0100000000000F00
      0000464E5F50524943455F4D41535445520100000000000B00000046435F4D4F
      5F47525F544F010000000000090000004D454449434E414D450100000000000C
      000000464E5F50415254595F4E554D0100000000000C00000046435F46494E53
      4F555243450100000000000800000046435F4544495A4D0100000000000C0000
      0046435F4D45444943545950450100000000000600000046435F4B4F4C010000
      000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 377
    Top = 572
  end
  object frxRashDocPoProfil: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872700000000
    ReportOptions.LastChange = 41317.591668993050000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin        '
      ''
      'end.')
    Left = 528
    Top = 576
    Datasets = <
      item
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 158.740260000000000000
        Top = 18.897650000000000000
        Width = 1009.134510000000000000
        object Memo2: TfrxMemoView
          Width = 491.338900000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_RECEIVER]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Top = 30.236240000000000000
          Width = 491.338900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 49.133889999999990000
          Width = 491.338900000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_MO_GROUP]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo5: TfrxMemoView
          Top = 79.370130000000000000
          Width = 491.338900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          Top = 113.385900000000000000
          Width = 1009.134510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1111#1056#1109' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1057#1107' '#1056#1111#1056#1109' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111#1056#176#1056#1112' '#1057#1107#1057#8225#1056#181#1057#8218#1056#1029#1056#1109#1057 +
              #1027#1057#8218#1056#1105)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 136.063080000000000000
          Width = 1009.134510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [VAR_DATE1] '#1056#1111#1056#1109' [VAR_DATE2]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 340.157700000000000000
        Width = 1009.134510000000000000
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
        RowCount = 0
        Stretched = True
        object Memo11: TfrxMemoView
          Width = 45.354360000000000000
          Height = 18.897650000000000000
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
            '[Line])')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 427.086890000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 907.087200000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBReport1."FN_SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."DATA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 45.354360000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."NAMEKART"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 294.803340000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 623.622450000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_MO_GR_TO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 789.921770000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 842.835190000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FN_PRICE_DETAIL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 502.677490000000000000
        Width = 1009.134510000000000000
        object Memo1: TfrxMemoView
          Align = baRight
          Left = 831.496600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
        end
      end
      object Header1: TfrxHeader
        Height = 37.795275590000000000
        Top = 238.110390000000000000
        Width = 1009.134510000000000000
        object Memo8: TfrxMemoView
          Width = 45.354360000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211
            #1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 427.086890000000000000
          Width = 196.535560000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 907.087200000000000000
          Width = 102.047310000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 45.354360000000000000
          Width = 249.448980000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 294.803340000000000000
          Width = 56.692950000000010000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 623.622450000000000000
          Width = 166.299320000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 789.921770000000000000
          Width = 52.913420000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 842.835190000000000000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 298.582870000000000000
        Width = 1009.134510000000000000
        Condition = 'frxDBReport1."FC_PROFIL"'
        object Memo33: TfrxMemoView
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 45.354360000000000000
          Width = 963.780150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_PROFIL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 381.732530000000000000
        Width = 1009.134510000000000000
        Stretched = True
        object Memo14: TfrxMemoView
          Width = 842.835190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' "[frxDBReport1."FC_PROFIL"]"')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 842.835190000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBReport1."FN_SUMM">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 423.307360000000000000
        Width = 1009.134510000000000000
        Stretched = True
        object Memo30: TfrxMemoView
          Left = 842.835190000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBReport1."FN_SUMM">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Width = 842.835190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
end
