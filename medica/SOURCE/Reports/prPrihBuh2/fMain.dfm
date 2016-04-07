object frmMain: TfrmMain
  Left = 487
  Top = 325
  HelpContext = 34
  Caption = #1046#1091#1088#1085#1072#1083' '#1087#1088#1080#1093#1086#1076#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  ClientHeight = 488
  ClientWidth = 798
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'StMedsestra.chm'
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
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 798
    Height = 48
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 44
        Width = 792
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 785
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
      object ToolButton1: TToolButton
        Left = 55
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbuPrint: TToolButton
        Left = 63
        Top = 0
        Hint = #1054#1090#1082#1088#1099#1090#1100' '#1087#1088#1077#1076#1087#1088#1086#1089#1084#1086#1090#1088' '#1087#1077#1095#1072#1090#1080
        Action = acPrint
        AutoSize = True
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton4: TToolButton
        Left = 110
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object cxGroupBox2: TcxGroupBox
        Left = 118
        Top = 0
        Align = alLeft
        Caption = ' '#1042#1080#1076' '#1086#1090#1095#1077#1090#1072' '
        TabOrder = 0
        Height = 44
        Width = 221
        object cmbReport: TcxComboBox
          Left = 4
          Top = 12
          Properties.DropDownListStyle = lsEditFixedList
          Properties.ImmediatePost = True
          Properties.OnChange = cmbReportPropertiesChange
          TabOrder = 0
          Width = 213
        end
      end
      object ToolButton5: TToolButton
        Left = 339
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton6: TToolButton
        Left = 347
        Top = 0
        Action = acGridToExcel
        AutoSize = True
        ParentShowHint = False
        ShowHint = True
      end
      object tbuUchGrSep: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'tbuUchGrSep'
        ImageIndex = 5
        Style = tbsSeparator
        Visible = False
      end
      object tbuUchGrSelect: TToolButton
        Left = 401
        Top = 0
        AutoSize = True
        Caption = #1059#1095#1077#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
        DropdownMenu = pmUchGr
        ImageIndex = 5
        Style = tbsDropDown
        Visible = False
        OnClick = tbuUchGrSelectClick
      end
      object tbuRPO: TToolButton
        Left = 512
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object chbRPO: TcxCheckBox
        Left = 520
        Top = 0
        Align = alLeft
        Caption = #1056#1055#1054
        TabOrder = 1
        OnClick = chbRPOClick
        Width = 56
      end
      object tbuMedicSep: TToolButton
        Left = 576
        Top = 0
        Width = 8
        Caption = 'tbuMedicSep'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object grbMedic: TcxGroupBox
        Left = 584
        Top = 0
        Caption = ' '#1052#1077#1076#1080#1082#1072#1084#1077#1085#1090' '
        TabOrder = 2
        Visible = False
        Height = 44
        Width = 198
        object lcbMedic: TcxLookupComboBox
          Left = 4
          Top = 12
          Properties.DropDownAutoSize = True
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'MEDICID'
          Properties.ListColumns = <
            item
              Caption = #1054#1073#1098#1077#1082#1090' '#1091#1095#1077#1090#1072
              FieldName = 'FC_NAME'
            end>
          Properties.ListSource = dsTMedic
          Properties.OnCloseUp = lcbMedicPropertiesCloseUp
          TabOrder = 0
          Width = 190
        end
      end
      object ToolButton3: TToolButton
        Left = 782
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 8
        Style = tbsSeparator
      end
    end
  end
  object Button1: TButton
    Left = 278
    Top = 134
    Width = 39
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    Visible = False
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 48
    Width = 798
    Height = 440
    Align = alClient
    TabOrder = 2
    object grViewPrihDocPoMedic: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGrid
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = #1057#1091#1084#1084#1072': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewPrihDocPoMedicFN_SUMM
        end
        item
          Format = #1057#1091#1084#1084#1072': ,0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grViewPrihDocPoMedicFN_SUMM
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0'
          FieldName = 'FN_PRICE_MASTER'
          Column = grViewPrihDocPoMedicNAMEPOSTAV
        end
        item
          Format = #1048#1090#1086#1075#1086': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewPrihDocPoMedicFN_SUMM
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
      object grViewPrihDocPoMedicFN_PRICE_MASTER: TcxGridDBColumn
        DataBinding.FieldName = 'FN_PRICE_MASTER'
        Visible = False
        Width = 86
      end
      object grViewPrihDocPoMedicFP_VIDMOVE: TcxGridDBColumn
        DataBinding.FieldName = 'FP_VIDMOVE'
        Visible = False
      end
      object grViewPrihDocPoMedicPOSTAVID: TcxGridDBColumn
        DataBinding.FieldName = 'POSTAVID'
        Visible = False
      end
      object grViewPrihDocPoMedicMOTOID: TcxGridDBColumn
        DataBinding.FieldName = 'MOTOID'
        Visible = False
      end
      object grViewPrihDocPoMedicMOFROMID: TcxGridDBColumn
        DataBinding.FieldName = 'MOFROMID'
        Visible = False
      end
      object grViewPrihDocPoMedicFC_COMMENT: TcxGridDBColumn
        DataBinding.FieldName = 'FC_COMMENT'
        Visible = False
      end
      object grViewPrihDocPoMedicFP_VID: TcxGridDBColumn
        DataBinding.FieldName = 'FP_VID'
        Visible = False
      end
      object grViewPrihDocPoMedicMOOWNERID: TcxGridDBColumn
        DataBinding.FieldName = 'MOOWNERID'
        Visible = False
      end
      object grViewPrihDocPoMedicDPID: TcxGridDBColumn
        DataBinding.FieldName = 'DPID'
        Visible = False
      end
      object grViewPrihDocPoMedicFC_DOC: TcxGridDBColumn
        DataBinding.FieldName = 'FC_DOC_SUMM'
        Visible = False
        GroupIndex = 2
        SortIndex = 3
        SortOrder = soAscending
        Width = 139
        IsCaptionAssigned = True
      end
      object grViewPrihDocPoMedicDATA: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'DATA'
        Visible = False
      end
      object grViewPrihDocPoMedicFD_DATA: TcxGridDBColumn
        DataBinding.FieldName = 'FD_DATA'
        Visible = False
        SortIndex = 2
        SortOrder = soAscending
      end
      object grViewPrihDocPoMedicNAMEPOSTAV: TcxGridDBColumn
        DataBinding.FieldName = 'FC_NAMEPOSTAV_SUMM'
        Visible = False
        GroupIndex = 1
        SortIndex = 1
        SortOrder = soAscending
        Width = 222
        IsCaptionAssigned = True
      end
      object grViewPrihDocPoMedicDPID_1: TcxGridDBColumn
        DataBinding.FieldName = 'DPID_1'
        Visible = False
      end
      object grViewPrihDocPoMedicDPCID: TcxGridDBColumn
        DataBinding.FieldName = 'DPCID'
        Visible = False
      end
      object grViewPrihDocPoMedicMEDICID: TcxGridDBColumn
        DataBinding.FieldName = 'MEDICID'
        Visible = False
      end
      object grViewPrihDocPoMedicNAMEKART: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAMEKART'
        Width = 283
      end
      object grViewPrihDocPoMedicFC_SERIAL: TcxGridDBColumn
        Caption = #1057#1077#1088#1080#1103
        DataBinding.FieldName = 'FC_SERIAL'
        Width = 93
      end
      object grViewPrihDocPoMedicFC_EDIZM: TcxGridDBColumn
        Caption = #1045#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_EDIZM'
        Width = 103
      end
      object grViewPrihDocPoMedicFC_FINSOURCE: TcxGridDBColumn
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'FC_FINSOURCE'
        Width = 100
      end
      object grViewPrihDocPoMedicFN_KOL: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086
        DataBinding.FieldName = 'FN_KOL'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '### ### ### ##0.#####'
        Width = 93
      end
      object grViewPrihDocPoMedicFN_PRICE_DETAIL: TcxGridDBColumn
        Caption = #1062#1077#1085#1072', '#1088
        DataBinding.FieldName = 'FN_PRICE_DETAIL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseThousandSeparator = True
        Width = 100
      end
      object grViewPrihDocPoMedicFN_SUMM: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088
        DataBinding.FieldName = 'FN_SUMM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseThousandSeparator = True
        Width = 151
      end
      object grViewPrihDocPoMedicKARTID: TcxGridDBColumn
        DataBinding.FieldName = 'KARTID'
        Visible = False
      end
      object grViewPrihDocPoMedicFC_RANG_ORDER: TcxGridDBColumn
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
    object grViewPrihPost: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGrid
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grViewPrihPostFN_PRICE
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grViewPrihPostFN_PRICE
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1048#1090#1086#1075#1086': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewPrihPostFN_PRICE
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsData.Editing = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object grViewPrihPostNAMEPOSTAV: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        DataBinding.FieldName = 'NAMEPOSTAV'
        Width = 82
      end
      object grViewPrihPostFN_PRICE: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088
        DataBinding.FieldName = 'FN_PRICE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Width = 66
      end
      object grViewPrihPostRANG: TcxGridDBColumn
        Caption = #1056#1072#1085#1075
        DataBinding.FieldName = 'RANG'
        Visible = False
      end
      object grViewPrihPostPOSTAVID: TcxGridDBColumn
        Caption = 'ID '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
        DataBinding.FieldName = 'POSTAVID'
        Visible = False
      end
      object grViewPrihPostFC_RANG: TcxGridDBColumn
        Caption = #1048#1090#1086#1075#1086' '#1087#1086' '
        DataBinding.FieldName = 'FC_RANG'
        Visible = False
        GroupIndex = 0
      end
    end
    object grViewPrihDocPoDOC: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGrid
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = #1048#1090#1086#1075#1086': ,0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grViewPrihDocPoDOCFN_PRICE
        end
        item
          Format = #1048#1090#1086#1075#1086': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewPrihDocPoDOCFN_PRICE
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1048#1090#1086#1075#1086': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewPrihDocPoDOCFN_PRICE
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Editing = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object grViewPrihDocPoDOCVIDDOC: TcxGridDBColumn
        Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'VIDDOC'
        Visible = False
      end
      object grViewPrihDocPoDOCFC_DOC: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        DataBinding.FieldName = 'FC_DOC'
        Width = 246
      end
      object grViewPrihDocPoDOCFC_FINSOURCE: TcxGridDBColumn
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'FC_FINSOURCE'
        Width = 100
      end
      object grViewPrihDocPoDOCFC_KONTRAKT: TcxGridDBColumn
        Caption = #1050#1086#1085#1090#1088#1072#1082#1090
        DataBinding.FieldName = 'FC_KONTRAKT'
        Width = 76
      end
      object grViewPrihDocPoDOCFC_SCHET_FAKTURA: TcxGridDBColumn
        Caption = #1057#1095#1077#1090'-'#1092#1072#1082#1090#1091#1088#1072
        DataBinding.FieldName = 'FC_SCHET_FAKTURA'
        Width = 74
      end
      object grViewPrihDocPoDOCFN_PRICE: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088
        DataBinding.FieldName = 'FN_PRICE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Width = 99
      end
      object grViewPrihDocPoDOCFC_COMMENT: TcxGridDBColumn
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        DataBinding.FieldName = 'FC_COMMENT'
        Visible = False
        Width = 69
      end
      object grViewPrihDocPoDOCMOOWNERID: TcxGridDBColumn
        Caption = 'FN_PRICE'
        DataBinding.FieldName = 'MOOWNERID'
        Visible = False
      end
      object grViewPrihDocPoDOCDATA: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
        DataBinding.FieldName = 'DATA'
        Visible = False
        Width = 70
      end
      object grViewPrihDocPoDOCFD_INVOICE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'FD_INVOICE'
        Visible = False
        Width = 69
      end
      object grViewPrihDocPoDOCFC_NAME: TcxGridDBColumn
        Caption = 'FN_PRICE'
        DataBinding.FieldName = 'FC_NAME'
        Visible = False
      end
      object grViewPrihDocPoDOCFC_MO_GR_TO: TcxGridDBColumn
        Caption = #1050#1091#1076#1072
        DataBinding.FieldName = 'FC_MO_GR_TO'
        Visible = False
        Width = 70
      end
      object grViewPrihDocPoDOCNAMEPOSTAV: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        DataBinding.FieldName = 'NAMEPOSTAV'
        Visible = False
        GroupIndex = 0
      end
      object grViewPrihDocPoDOC_DPID: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'DPID'
        Visible = False
      end
    end
    object grViewPrihDocPoMedicType: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGrid
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = #1057#1091#1084#1084#1072': ,0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grViewPrihDocPoMedicTypeFN_SUMM
        end
        item
          Format = #1057#1091#1084#1084#1072': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewPrihDocPoMedicTypeFN_SUMM
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1048#1090#1086#1075#1086': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewPrihDocPoMedicTypeFN_SUMM
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
      object grViewPrihDocPoMedicTypeFN_PRICE_MASTER: TcxGridDBColumn
        DataBinding.FieldName = 'FN_PRICE_MASTER'
        Visible = False
        Width = 86
      end
      object grViewPrihDocPoMedicTypeFP_VIDMOVE: TcxGridDBColumn
        DataBinding.FieldName = 'FP_VIDMOVE'
        Visible = False
      end
      object grViewPrihDocPoMedicTypePOSTAVID: TcxGridDBColumn
        DataBinding.FieldName = 'POSTAVID'
        Visible = False
      end
      object grViewPrihDocPoMedicTypeMOTOID: TcxGridDBColumn
        DataBinding.FieldName = 'MOTOID'
        Visible = False
      end
      object grViewPrihDocPoMedicTypeMOFROMID: TcxGridDBColumn
        DataBinding.FieldName = 'MOFROMID'
        Visible = False
      end
      object grViewPrihDocPoMedicTypeFC_COMMENT: TcxGridDBColumn
        DataBinding.FieldName = 'FC_COMMENT'
        Visible = False
      end
      object grViewPrihDocPoMedicTypeFP_VID: TcxGridDBColumn
        DataBinding.FieldName = 'FP_VID'
        Visible = False
      end
      object grViewPrihDocPoMedicTypeMOOWNERID: TcxGridDBColumn
        DataBinding.FieldName = 'MOOWNERID'
        Visible = False
      end
      object grViewPrihDocPoMedicTypeDPID: TcxGridDBColumn
        DataBinding.FieldName = 'DPID'
        Visible = False
      end
      object grViewPrihDocPoMedicTypeDATA: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'DATA'
        Visible = False
      end
      object grViewPrihDocPoMedicTypeFD_DATA: TcxGridDBColumn
        DataBinding.FieldName = 'FD_DATA'
        Visible = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object grViewPrihDocPoMedicTypeDPID_1: TcxGridDBColumn
        DataBinding.FieldName = 'DPID_1'
        Visible = False
      end
      object grViewPrihDocPoMedicTypeDPCID: TcxGridDBColumn
        DataBinding.FieldName = 'DPCID'
        Visible = False
      end
      object grViewPrihDocPoMedicTypeMEDICID: TcxGridDBColumn
        DataBinding.FieldName = 'MEDICID'
        Visible = False
      end
      object grViewPrihDocPoMedicTypeNAMEKART: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAMEKART'
        Width = 209
      end
      object grViewPrihDocPoMedicTypeFC_EDIZM: TcxGridDBColumn
        Caption = #1045#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_EDIZM'
        Width = 57
      end
      object grViewPrihDocPoMedicTypeFC_SERIAL: TcxGridDBColumn
        Caption = #1057#1077#1088#1080#1103
        DataBinding.FieldName = 'FC_SERIAL'
        Width = 59
      end
      object grViewPrihDocPoMedicTypeFC_DOC: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        DataBinding.FieldName = 'FC_DOC'
        Width = 186
      end
      object grViewPrihDocPoMedicTypeFC_MEDICTYPE: TcxGridDBColumn
        Caption = #1059#1095#1077#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
        DataBinding.FieldName = 'FC_MEDICTYPE'
        Visible = False
        GroupIndex = 0
      end
      object grViewPrihDocPoMedicTypeNAMEPOSTAV: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        DataBinding.FieldName = 'NAMEPOSTAV'
        Width = 112
      end
      object grViewPrihDocPoMedicTypeFC_FINSOURCE: TcxGridDBColumn
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'FC_FINSOURCE'
        Width = 100
      end
      object grViewPrihDocPoMedicTypeFN_KOL: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086
        DataBinding.FieldName = 'FN_KOL'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '### ### ### ##0.#####'
        Width = 40
      end
      object grViewPrihDocPoMedicTypeFN_PRICE_DETAIL: TcxGridDBColumn
        Caption = #1062#1077#1085#1072', '#1088
        DataBinding.FieldName = 'FN_PRICE_DETAIL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseThousandSeparator = True
        Width = 45
      end
      object grViewPrihDocPoMedicTypeFN_SUMM: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088
        DataBinding.FieldName = 'FN_SUMM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseThousandSeparator = True
        Width = 65
      end
      object grViewPrihDocPoMedicTypeKARTID: TcxGridDBColumn
        DataBinding.FieldName = 'KARTID'
        Visible = False
      end
    end
    object grVIewPrihDocPoOneMedic: TcxGridDBTableView
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
      object grVIewPrihDocPoOneMedicFD_INVOICE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'FD_INVOICE'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.SaveTime = False
        Properties.ShowTime = False
        Width = 76
      end
      object grVIewPrihDocPoOneMedicFC_DOC: TcxGridDBColumn
        Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'FC_DOC'
        Width = 102
      end
      object grVIewPrihDocPoOneMedicFC_FINSOURCE: TcxGridDBColumn
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'FC_FINSOURCE'
        Width = 102
      end
      object grVIewPrihDocPoOneMedicFC_EDIZM: TcxGridDBColumn
        Caption = #1045#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_EDIZM'
        Width = 102
      end
      object grVIewPrihDocPoOneMedicFC_SERIAL: TcxGridDBColumn
        Caption = #1057#1077#1088#1080#1103
        DataBinding.FieldName = 'FC_SERIAL'
        Width = 102
      end
      object grVIewPrihDocPoOneMedicFN_KOL: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086
        DataBinding.FieldName = 'FN_KOL'
        Width = 102
      end
      object grVIewPrihDocPoOneMedicFN_PRICE_DETAIL: TcxGridDBColumn
        Caption = #1062#1077#1085#1072', '#1088
        DataBinding.FieldName = 'FN_PRICE_DETAIL'
        Width = 102
      end
      object grVIewPrihDocPoOneMedicFN_SUMM: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088
        DataBinding.FieldName = 'FN_SUMM'
        Width = 102
      end
    end
    object grViewPrihApteka: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGrid
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Editing = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object grViewPrihApteka_fd_date: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'FD_INVOICE'
        Width = 66
      end
      object grViewPrihAptekafc_Postav: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        DataBinding.FieldName = 'NAMEPOSTAV'
        Width = 195
      end
      object grViewPrihAptekafc_schet: TcxGridDBColumn
        Caption = #1057#1095#1077#1090' '#8470
        DataBinding.FieldName = 'FC_DOC'
        Width = 64
      end
      object grViewPrihAptekafc_UslPlat: TcxGridDBColumn
        Caption = #1059#1089#1083#1086#1074#1080#1103' '#1087#1083#1072#1090#1077#1078#1072
        DataBinding.FieldName = 'PAYCOND'
        Width = 64
      end
      object grViewPrihAptekafc_istfinans: TcxGridDBColumn
        Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'FINSOURCE'
        Width = 64
      end
      object grViewPrihAptekafn_allmedics: TcxGridDBColumn
        Caption = #1052#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099' '#1074#1089#1077#1075#1086
        DataBinding.FieldName = 'FN_SUMM_GLF'
        Width = 65
      end
      object grViewPrihAptekafn_AngroMedics: TcxGridDBColumn
        Caption = #1052#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099' '#1074' '#1090'.'#1095'. '#1040#1085#1075#1088#1086
        DataBinding.FieldName = 'FN_SUMM_ANGRO'
        Width = 64
      end
      object grViewPrihAptekafn_perevyazka: TcxGridDBColumn
        Caption = #1055#1077#1088#1077#1074#1103#1079#1082#1072
        DataBinding.FieldName = 'FN_SUMM_PEREV'
        Width = 64
      end
      object grViewPrihAptekafn_rashodnik: TcxGridDBColumn
        Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1081' '#1084#1072#1090#1077#1088#1080#1072#1083
        DataBinding.FieldName = 'FN_SUMM_RASHODNIK'
      end
      object grViewPrihAptekafn_nacenka: TcxGridDBColumn
        Caption = #1053#1072#1094#1077#1085#1082#1072
        DataBinding.FieldName = 'fn_nacenka'
        Width = 64
      end
      object grViewPrihAptekafn_itogo: TcxGridDBColumn
        Caption = #1048#1090#1086#1075#1086
        DataBinding.FieldName = 'FN_PRICE'
        Width = 64
      end
    end
    object grViewPrihDocPoMedicEk: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGrid
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = #1057#1091#1084#1084#1072': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewPrihDocPoMedicEkFN_SUMM
        end
        item
          Format = #1057#1091#1084#1084#1072': ,0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grViewPrihDocPoMedicEkFN_SUMM
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0'
          FieldName = 'FN_PRICE_MASTER'
          Column = grViewPrihDocPoMedicEkNAMEPOSTAV
        end
        item
          Format = #1048#1090#1086#1075#1086': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewPrihDocPoMedicEkFN_SUMM
        end
        item
          Format = #1050#1086#1083'-'#1074#1086': 0'
          Kind = skCount
          Column = grViewPrihDocPoMedicEkNAMEKART
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
      object grViewPrihDocPoMedicEkPOSTAVID: TcxGridDBColumn
        DataBinding.FieldName = 'POSTAVID'
        Visible = False
        VisibleForCustomization = False
      end
      object grViewPrihDocPoMedicEkDPID: TcxGridDBColumn
        DataBinding.FieldName = 'DPID'
        Visible = False
        VisibleForCustomization = False
      end
      object grViewPrihDocPoMedicEkFC_DATA: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'FC_DATA'
        Visible = False
        VisibleForCustomization = False
      end
      object grViewPrihDocPoMedicEkFD_DATA: TcxGridDBColumn
        DataBinding.FieldName = 'FD_DATA'
        Visible = False
        SortIndex = 1
        SortOrder = soAscending
        VisibleForCustomization = False
      end
      object grViewPrihDocPoMedicEkNAMEPOSTAV: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        DataBinding.FieldName = 'NAMEPOSTAV'
        Visible = False
        GroupIndex = 1
        SortIndex = 0
        SortOrder = soAscending
        VisibleForCustomization = False
        Width = 222
      end
      object grViewPrihDocPoMedicEkFC_DOC_PARAM: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        DataBinding.FieldName = 'FC_DOC_PARAM'
        Visible = False
        GroupIndex = 2
        SortIndex = 2
        SortOrder = soAscending
        VisibleForCustomization = False
        Width = 54
      end
      object grViewPrihDocPoMedicEkfc_invoice: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'fc_invoice'
        Visible = False
        VisibleForCustomization = False
        Width = 39
      end
      object grViewPrihDocPoMedicEkFC_KONTRAKT: TcxGridDBColumn
        Caption = #1058#1077#1085#1076#1077#1088' / '#1050#1086#1090#1080#1088#1086#1074#1082#1072
        DataBinding.FieldName = 'FC_KONTRAKT'
        Visible = False
        VisibleForCustomization = False
        Width = 49
      end
      object grViewPrihDocPoMedicEkFC_FINSOURCE: TcxGridDBColumn
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'FC_FINSOURCE'
        Visible = False
        GroupIndex = 0
        VisibleForCustomization = False
        Width = 110
      end
      object grViewPrihDocPoMedicEkFC_PAYCOND: TcxGridDBColumn
        Caption = #1059#1089#1083#1086#1074#1080#1103' '#1087#1083#1072#1090#1077#1078#1072
        DataBinding.FieldName = 'FC_PAYCOND'
        Visible = False
        VisibleForCustomization = False
        Width = 45
      end
      object grViewPrihDocPoMedicEkDPCID: TcxGridDBColumn
        DataBinding.FieldName = 'DPCID'
        Visible = False
      end
      object grViewPrihDocPoMedicEkMEDICID: TcxGridDBColumn
        DataBinding.FieldName = 'MEDICID'
        Visible = False
      end
      object grViewPrihDocPoMedicEkKARTID: TcxGridDBColumn
        DataBinding.FieldName = 'KARTID'
        Visible = False
      end
      object grViewPrihDocPoMedicEkNAMEKART: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAMEKART'
        Width = 216
      end
      object grViewPrihDocPoMedicEkFC_EDIZM: TcxGridDBColumn
        Caption = #1045#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_EDIZM'
        Width = 63
      end
      object grViewPrihDocPoMedicEkFC_SERIAL: TcxGridDBColumn
        Caption = #1057#1077#1088#1080#1103
        DataBinding.FieldName = 'FC_SERIAL'
        Width = 68
      end
      object grViewPrihDocPoMedicEkFC_GODEN: TcxGridDBColumn
        Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
        DataBinding.FieldName = 'FC_GODEN'
        Width = 70
      end
      object grViewPrihDocPoMedicEkFC_SERT: TcxGridDBColumn
        Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
        DataBinding.FieldName = 'FC_CERT'
        Width = 86
      end
      object grViewPrihDocPoMedicEkFC_KOL: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086
        DataBinding.FieldName = 'FC_KOL'
        Width = 65
      end
      object grViewPrihDocPoMedicEkFN_PRICE_DETAIL: TcxGridDBColumn
        Caption = #1062#1077#1085#1072', '#1088
        DataBinding.FieldName = 'FN_PRICE_DETAIL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseThousandSeparator = True
        Width = 65
      end
      object grViewPrihDocPoMedicEkFN_SUMM: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088
        DataBinding.FieldName = 'FN_SUMM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseThousandSeparator = True
        Width = 106
      end
    end
    object grViewPrihDocPoFinSource: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGrid
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = #1057#1091#1084#1084#1072': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewPrihDocPoFinSourceFN_SUMM
        end
        item
          Format = #1057#1091#1084#1084#1072': ,0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grViewPrihDocPoFinSourceFN_SUMM
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1048#1090#1086#1075#1086': ,0.00;-,0.00'
          Kind = skSum
          Column = grViewPrihDocPoFinSourceFN_SUMM
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
      object grViewPrihDocPoFinSourceFN_PRICE_MASTER: TcxGridDBColumn
        DataBinding.FieldName = 'FN_PRICE_MASTER'
        Visible = False
      end
      object grViewPrihDocPoFinSourceFP_VIDMOVE: TcxGridDBColumn
        DataBinding.FieldName = 'FP_VIDMOVE'
        Visible = False
      end
      object grViewPrihDocPoFinSourcePOSTAVID: TcxGridDBColumn
        DataBinding.FieldName = 'POSTAVID'
        Visible = False
      end
      object grViewPrihDocPoFinSourceMOTOID: TcxGridDBColumn
        DataBinding.FieldName = 'MOTOID'
        Visible = False
      end
      object grViewPrihDocPoFinSourceMOFROMID: TcxGridDBColumn
        DataBinding.FieldName = 'MOFROMID'
        Visible = False
      end
      object grViewPrihDocPoFinSourceFC_COMMENT: TcxGridDBColumn
        DataBinding.FieldName = 'FC_COMMENT'
        Visible = False
      end
      object grViewPrihDocPoFinSourceFP_VID: TcxGridDBColumn
        DataBinding.FieldName = 'FP_VID'
        Visible = False
      end
      object grViewPrihDocPoFinSourceMOOWNERID: TcxGridDBColumn
        DataBinding.FieldName = 'MOOWNERID'
        Visible = False
      end
      object grViewPrihDocPoFinSourceDPID: TcxGridDBColumn
        DataBinding.FieldName = 'DPID'
        Visible = False
      end
      object grViewPrihDocPoFinSourceDATA: TcxGridDBColumn
        DataBinding.FieldName = 'DATA'
        Visible = False
      end
      object grViewPrihDocPoFinSourceDPID_1: TcxGridDBColumn
        DataBinding.FieldName = 'DPID_1'
        Visible = False
      end
      object grViewPrihDocPoFinSourceDPCID: TcxGridDBColumn
        DataBinding.FieldName = 'DPCID'
        Visible = False
      end
      object grViewPrihDocPoFinSourceMEDICID: TcxGridDBColumn
        DataBinding.FieldName = 'MEDICID'
        Visible = False
      end
      object grViewPrihDocPoFinSourceNAMEKART: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAMEKART'
        Width = 209
      end
      object grViewPrihDocPoFinSourceFC_EDIZM: TcxGridDBColumn
        Caption = #1045#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_EDIZM'
        Width = 57
      end
      object grViewPrihDocPoFinSourceFC_SERIAL: TcxGridDBColumn
        Caption = #1057#1077#1088#1080#1103
        DataBinding.FieldName = 'FC_SERIAL'
        Width = 59
      end
      object grViewPrihDocPoFinSourceFC_DOC: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        DataBinding.FieldName = 'FC_DOC'
        Width = 186
      end
      object grViewPrihDocPoFinSourceFC_FINSOURCE: TcxGridDBColumn
        Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'FC_FINSOURCE'
        Visible = False
        GroupIndex = 0
        Width = 64
      end
      object grViewPrihDocPoFinSourceNAMEPOSTAV: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        DataBinding.FieldName = 'NAMEPOSTAV'
        Width = 112
      end
      object grViewPrihDocPoFinSourceFN_KOL: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086
        DataBinding.FieldName = 'FN_KOL'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '### ### ### ##0.#####'
        Width = 40
      end
      object grViewPrihDocPoFinSourceFN_PRICE_DETAIL: TcxGridDBColumn
        Caption = #1062#1077#1085#1072', '#1088
        DataBinding.FieldName = 'FN_PRICE_DETAIL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Width = 45
      end
      object grViewPrihDocPoFinSourceFN_SUMM: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088
        DataBinding.FieldName = 'FN_SUMM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Width = 65
      end
      object grViewPrihDocPoFinSourceKARTID: TcxGridDBColumn
        DataBinding.FieldName = 'KARTID'
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
    end
  end
  object ilImages: TImageList
    Left = 68
    Top = 110
    Bitmap = {
      494C010106003000400010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  object alActions: TActionList
    Images = ilImages
    Left = 216
    Top = 8
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1090#1095#1077#1090
      ImageIndex = 2
      OnExecute = aCancelExecute
    end
    object acPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 3
      OnExecute = acPrintExecute
    end
    object acGridToExcel: TAction
      Caption = #1074' Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1091' '#1074' MS Excel'
      ImageIndex = 4
      OnExecute = acGridToExcelExecute
    end
  end
  object FormStorage1: TJvFormStorage
    AppStorage = JvAppIniFileStorage1
    AppStoragePath = 'frmGetPeriod\'
    StoredValues = <>
    Left = 24
    Top = 328
  end
  object os: TOracleSession
    LogonDatabase = 'ASU'
    Left = 32
    Top = 142
  end
  object odsPrihDocPoDOC: TOracleDataSet
    SQL.Strings = (
      'SELECT A.* FROM'
      '(SELECT'
      
        '       (select sum(k.fn_price*dp.fn_kol) as FN_PRICE from med.td' +
        'pc dp, med.tkart k where dp.dpid = TDOCS.DPID and dp.kartid = k.' +
        'kartid) as FN_PRICE,'
      
        '               DECODE(TDOCS.fp_vidmove, 1,1, 9,2, 10,3, 6,4, 255' +
        ') as Rang,'
      '               :ADATA1 AS D1, :ADATA2 AS D2,'
      
        '               TDOCS.FP_VIDMOVE, TDOCS.POSTAVID, TDOCS.MOTOID, T' +
        'DOCS.MOFROMID, TDOCS.FC_COMMENT, TDOCS.FP_VID, '
      '               TDOCS.MOOWNERID,  TDOCS.DPID, '
      
        '               med.GET_DECODEDOCVIDMOVE(TDOCS.fp_vidmove)||'#39' '#8470#39'|' +
        '|TDOCS.fc_doc||'#39' '#1086#1090#39'||to_char(TDOCS.fd_invoice,'#39'dd.mm.yyyy'#39') AS ' +
        'fc_DOC,'
      '               TRUNC(TDOCS.FD_DATA) AS DATA,'
      
        '               TDOCS.FD_INVOICE, TDOCS.FC_KONTRAKT, TDOCS.FC_SCH' +
        'ET_FAKTURA,'
      
        '               decode(NVL(TMO.FC_NAME,'#39#39'),'#39#39', MOGR_TO.fc_group, ' +
        'MOGR_TO.fc_group ||'#39'('#39'|| TMO.FC_NAME||'#39')'#39') AS FC_NAME,'
      
        '               DECODE(TDOCS.fp_vidmove, 7, '#39#1057#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1087#1088#1086#1080#1079#1074#1086#1076 +
        #1089#1090#1074#1086' '#1074' '#1056#1055#1054#39', 8, '#39#1057#1087#1080#1089#1072#1085#1080#1077#39', MOGR_TO.fc_group) as FC_MO_GR_TO,'
      
        '               DECODE(TDOCS.FP_VIDMOVE, 1,TPOSTAV.FC_NAME, 9, '#39#1042 +
        #1074#1086#1076' '#1086#1089#1090#1072#1090#1082#1086#1074#39', 2,MOGR_FROM.fc_group, 3,MOGR_FROM.fc_group, 6, MO' +
        'GR_FROM.fc_group||'#39' ('#1074#1086#1079#1074#1088#1072#1090')'#39', 10,MED.PKGTMO.getnamebyid( MED.P' +
        'KG_MEDSES.GET_PRODUCE_MO ), '#39#39' ) AS NAMEPOSTAV,'
      '               MED.GET_DECODEDOCVID(FP_VIDMOVE) AS VIDDOC,'
      '               FS.FC_NAME FC_FINSOURCE'
      
        '       FROM  MED.TDOCS, MED.TMO, MED.TPOSTAV, MED.TMO T2 , MED.T' +
        'MO_GROUP MOGR_FROM,  MED.TMO_GROUP MOGR_TO, MED.TFINSOURCE FS'
      
        'WHERE  :MO_GROUP = TDOCS.fk_mogroupid_to -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084' '#1085#1077' '#1085#1091 +
        #1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      '  AND  TDOCS.MOTOID = TMO.MOID(+)'
      
        '  AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  TDOCS' +
        '.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to, :MO' +
        '_GROUP) = +1'
      
        '  AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077#1074#1086#1079#1074#1088#1072#1090#1072'- '#1087#1086#1089#1082#1086#1083#1100#1082#1091#1074#1086#1079#1074 +
        #1088#1072#1090#1084#1086#1078#1085#1086#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100#1090#1086#1083#1100#1082#1086#1074#1076#1074#1080#1078#1077#1085#1080#1080'('#1082#1086#1075#1076#1072#1087#1088#1080#1093#1086#1076'+'#1088#1072#1089#1093#1086#1076')'
      '  AND (not tdocs.fp_vidmove in (4,5))'
      '  AND ((:IS_RPO = 1)OR(tdocs.fp_vidmove <> 10))'
      '  AND TDOCS.FL_EDIT = 0 '
      
        '  AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:ADATA1) AND TRUNC(:ADA' +
        'TA2)'
      '  AND TDOCS.POSTAVID=TPOSTAV.POSTAVID (+)'
      '  AND TDOCS.MOFROMID = T2.MOID (+)'
      '  AND TDOCS.fk_mogroupid_from = MOGR_FROM.groupid (+)'
      '  AND TDOCS.fk_mogroupid_to = MOGR_TO.groupid (+)'
      '  AND TDOCS.FK_FINSOURCE_ID = FS.FK_ID (+)'
      ') A'
      ''
      'ORDER BY A.Rang, UPPER(A.NAMEPOSTAV), A.DATA')
    Optimize = False
    Variables.Data = {
      0300000004000000070000003A4144415441310C000000000000000000000007
      0000003A4144415441320C0000000000000000000000090000003A4D4F5F4752
      4F5550030000000000000000000000070000003A49535F52504F030000000400
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000150000000400000044504944010000000000090000004D4F4F574E45
      5249440100000000000600000046435F444F430100000000000600000046505F
      5649440100000000000A00000046435F434F4D4D454E54010000000000080000
      004D4F46524F4D4944010000000000060000004D4F544F494401000000000008
      000000504F53544156494401000000000008000000464E5F5052494345010000
      0000000700000046435F4E414D450100000000000A0000004E414D45504F5354
      4156010000000000020000004432010000000000020000004431010000000000
      04000000444154410100000000000A00000046505F5649444D4F564501000000
      000006000000564944444F430100000000000400000052414E47010000000000
      0B00000046435F4D4F5F47525F544F0100000000000A00000046445F494E564F
      4943450100000000000B00000046435F4B4F4E5452414B540100000000001000
      000046435F53434845545F46414B54555241010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 259
    Top = 60
  end
  object frPrihDocPoMedic: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 143
    Top = 111
    ReportForm = {
      19000000AD1D0000190000FFFF01000100FFFFFFFFFF090000009A0B00003408
      00002400000024000000240000002400000001FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      0000240000002F040000B50000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E48656164657231000201000000005C0100002F0400002F00000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200B40100000B004D6173746572446174613100020100000000C80100002F04
      0000140000003100050001000000000000000000FFFFFF1F0000000011006672
      444253656C446F63506F4D6564696300000000000000FFFF0000000000020000
      00010000000000000001000000C8000000140000000100000000000002001F02
      00000B0050616765466F6F7465723100020100000000540200002F0400001900
      00003000030001000000000000000000FFFFFF1F000000000000000000000000
      00FFFF000000000002000000010000000000000001000000C800000014000000
      0100000000000002008C0200000D004D6173746572466F6F7465723100020100
      000000200200002F040000120000003100060001000000000000000000FFFFFF
      1F00000000000000000000000000FFFF00000000000200000001000000000000
      0001000000C800000014000000010000000000000200180300000C0047726F75
      704865616465723100020100000000A40100002F040000140000003000100001
      000000000000000000FFFFFF1F0000000020005B6F647350726968446F63506F
      4D656469632E224E414D45504F53544156225D00000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200840300000C0047726F7570466F6F7465723100020100000000F40100002F
      040000140000003000110001000000000000000000FFFFFF1F00000000000000
      000000000000FFFF000000000002000000010000000000000001000000C80000
      00140000000100000000000000000604000005004D656D6F3200020042000000
      5C0100003C0000002F00000003000F00DC050000000000000000CCFFCC002C02
      000000000001000400C4E0F2E000000000FFFF00000000000200000001000000
      000500417269616C00090000000200000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000008D04000005004D656D6F330002007E00
      00005C010000D70000002F00000003000F00DC050000000000000000CCFFCC00
      2C02000000000001000900CEF1EDEEE2E0EDE8E500000000FFFF000000000002
      00000001000000000500417269616C00090000000200000000000A000000CC00
      020000000000FFFFFF00000000020000000000000000002005000005004D656D
      6F35000200B20300005C010000590000002F00000003000F00DC050000000000
      000000CCFFCC002C02000000000001001500D1F3ECECE020EFEE20E4EEEAF3EC
      E5EDF2F32C20F000000000FFFF00000000000200000001000000000500417269
      616C00090000000200000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000B905000006004D656D6F343100020042000000C80100
      003C000000140000000300050001000000000000000000FFFFFF1F2C02000000
      000001001A005B6F647350726968446F63506F4D656469632E2244415441225D
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000005406000006004D656D6F34330002007E000000C8010000D70000001400
      00000300050001000000000000000000FFFFFF1F2C02000000000001001C005B
      6F647350726968446F63506F4D656469632E2246435F444F43225D00000000FF
      FF00000000000200000001000000000500417269616C00080000000000000000
      0008000000CC00020000000000FFFFFF00000000020000000000000000000807
      000006004D656D6F3535000200B2030000C80100005900000014000000030001
      0002000000000000000000FFFFFF1F2C02030110002323232023232320232330
      2E303020F000010025005B6F647350726968446F63506F4D656469632E22464E
      5F50524943455F4D4153544552225D00000000FFFF0000000000020000000100
      0000000500417269616C000800000000000000000009000000CC000200000000
      00FFFFFF0000000002000000000000000000A307000006004D656D6F31330002
      002400000056020000E7030000140000000300000001000000000000000000FF
      FFFF1F2C02000000000001001C00F1F2F02E205B50414745235D20E8E7205B54
      4F54414C50414745535D00000000FFFF00000000000200000001000000040500
      417269616C000A00000000000000000009000000CC00020000000000FFFFFF00
      000000020000000000000000002808000006004D656D6F313500020024000000
      20020000F20200001100000003000F00DC050000000000000000FFFFFF1F2C02
      000000000001000600C8F2EEE3EE3A00000000FFFF0000000000020000000100
      0000000500417269616C000A00000002000000000009000000CC000200000000
      00FFFFFF0000000002000000000000000000DB08000006004D656D6F31370002
      001603000020020000F50000001100000023000F00DC050000000000000000FF
      FFFF1F2C020401100023232320232323202323302E303020F000010024005B53
      554D285B6F647350726968446F63506F4D656469632E22464E5F53554D4D225D
      295D00000000FFFF00000000000200000001000000000500417269616C000C00
      000002000000000009000000CC00020000000000FFFFFF000000000200000000
      00000000005F09000006004D656D6F3131000200240000005C0100001E000000
      2F00000003000F00DC050000000000000000CCFFCC002C020000000000010005
      00B920EF2FEF00000000FFFF0000000000020000000100000000050041726961
      6C00090000000200000000000A000000CC00020000000000FFFFFF0000000002
      0000000000000000001F0D000006004D656D6F343000020024000000C8010000
      1E000000140000000300040002000000000000000000FFFFFF1F2C0200000000
      00010013005B695F726F775F6E756D5F6D61737465725D290018000500626567
      696E0D6700696620695F445049443C3E5B6F647350726968446F63506F4D6564
      69632E2244504944225D207468656E202F2FEDEEE2FBE920ECE0F1F2E5F020EF
      EEF8E5EB2C20EDE0E4EE20E8E7ECE5EDE8F2FC20F0E8F1EEE2E0EDE8E520EDE5
      EAEEF2EEF0FBF520ECE5ECEE0D07002020426567696E0D2800202020695F4450
      4944203A3D205B6F647350726968446F63506F4D656469632E2244504944225D
      3B0D1900202020695F726F775F6E756D5F64657461696C203A3D20313B0D2C00
      202020695F726F775F6E756D5F6D6173746572203A3D20695F726F775F6E756D
      5F6D6173746572202B20313B0D5200202020695F464E5F50524943455F4D4153
      544552203A3D20695F464E5F50524943455F4D4153544552202B205B6F647350
      726968446F63506F4D656469632E22464E5F50524943455F4D4153544552225D
      3B0D00000D19002020204C696E65312E56697369626C65203A3D20547275653B
      0D20002020204D656D6F34302E466F6E742E436F6C6F72203A3D20636C426C61
      636B3B0D20002020204D656D6F34312E466F6E742E436F6C6F72203A3D20636C
      426C61636B3B0D20002020204D656D6F34332E466F6E742E436F6C6F72203A3D
      20636C426C61636B3B0D20002020204D656D6F35352E466F6E742E436F6C6F72
      203A3D20636C426C61636B3B0D05002020656E640D4200656C73652020202F2F
      FDF2EE20F1EFE8F1EEEA2064657461696C2C20F22EE52E20F1EFE8F1EEEA20EF
      EEE4F7E8EDE5EDEDFBF520E2EDF3F2F0E820ECE0F1F2E5F0E00D070020204265
      67696E0D2C00202020695F726F775F6E756D5F64657461696C203A3D20695F72
      6F775F6E756D5F64657461696C202B20313B0D1A002020204C696E65312E5669
      7369626C65203A3D2046616C73653B0D20002020204D656D6F34302E466F6E74
      2E436F6C6F72203A3D20636C57686974653B0D20002020204D656D6F34312E46
      6F6E742E436F6C6F72203A3D20636C57686974653B0D20002020204D656D6F34
      332E466F6E742E436F6C6F72203A3D20636C57686974653B0D20002020204D65
      6D6F35352E466F6E742E436F6C6F72203A3D20636C57686974653B0D05002065
      6E643B0D0300656E6400FFFF0000000000020000000100000000050041726961
      6C000A00000000000000000009000000CC00020000000000FFFFFF0000000002
      000000000000000000BB0D000006004D656D6F3136000200550100005C010000
      5D0200001100000003000F00DC050000000000000000CCFFCC002C0200000000
      0001001D00D2EEE2E0F0EDEE2DECE0F2E5F0E8E0EBFCEDFBE520F6E5EDEDEEF1
      F2E800000000FFFF00000000000200000001000000000500417269616C000A00
      00000200000000000A000000CC00020000000000FFFFFF000000000200000000
      00000000003B0E000006004D656D6F3138000200550100006D01000018000000
      1E00000003000F00DC050000000000000000CCFFCC002C020000000000010001
      00B900000000FFFF00000000000200000001000000000500417269616C000900
      00000200000000000A000000CC00020000000000FFFFFF000000000200000000
      0000000000C60E000006004D656D6F31390002006D0100006D01000003010000
      1E00000003000F00DC050000000000000000CCFFCC002C02000000000001000C
      00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF00000000000200000001000000
      000500417269616C00090000000200000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000004C0F000006004D656D6F323100020070
      0200006D010000320000001E00000003000F00DC050000000000000000CCFFCC
      002C02000000000001000700C5E42E20E8E7EC00000000FFFF00000000000200
      000001000000000500417269616C00090000000200000000000A000000CC0002
      0000000000FFFFFF0000000002000000000000000000D00F000006004D656D6F
      3232000200A20200006D010000450000001E00000003000F00DC050000000000
      000000CCFFCC002C02000000000001000500D1E5F0E8FF00000000FFFF000000
      00000200000001000000000500417269616C00090000000200000000000A0000
      00CC00020000000000FFFFFF0000000002000000000000000000551000000600
      4D656D6F3233000200E70200006D0100002F0000001E00000003000F00DC0500
      00000000000000CCFFCC002C02000000000001000600CAEEEB2DE2EE00000000
      FFFF00000000000200000001000000000500417269616C000900000002000000
      00000A000000CC00020000000000FFFFFF0000000002000000000000000000DB
      10000006004D656D6F3234000200160300006D010000440000001E0000000300
      0F00DC050000000000000000CCFFCC002C02000000000001000700D6E5EDE02C
      20F000000000FFFF00000000000200000001000000000500417269616C000900
      00000200000000000A000000CC00020000000000FFFFFF000000000200000000
      00000000006211000006004D656D6F32350002005A0300006D01000058000000
      1E00000003000F00DC050000000000000000CCFFCC002C020000000000010008
      00D1F3ECECE02C20F000000000FFFF0000000000020000000100000000050041
      7269616C00090000000200000000000A000000CC00020000000000FFFFFF0000
      000002000000000000000000F311000006004D656D6F343500020055010000C8
      010000180000001400000003000F0001000000000000000000FFFFFF1F2C0200
      00000000010012005B695F726F775F6E756D5F64657461696C5D00000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000901200
      0006004D656D6F34360002006D010000C8010000030100001400000003000F00
      01000000000000000000FFFFFF1F2C02000000000001001E005B6F6473507269
      68446F63506F4D656469632E224E414D454B415254225D00000000FFFF000000
      00000200000001000000000500417269616C0008000000000000000000080000
      00CC00020000000000FFFFFF00000000020000000000000000002D1300000600
      4D656D6F343700020070020000C8010000320000001400000003000F00010000
      00000000000000FFFFFF1F2C02000000000001001E005B6F647350726968446F
      63506F4D656469632E2246435F4544495A4D225D00000000FFFF000000000002
      00000001000000000500417269616C00080000000000000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000CB13000006004D656D
      6F3438000200A2020000C8010000450000001400000003000F00010000000000
      00000000FFFFFF1F2C02000000000001001F005B6F647350726968446F63506F
      4D656469632E2246435F53455249414C225D00000000FFFF0000000000020000
      0001000000000500417269616C00080000000000000000000A000000CC000200
      00000000FFFFFF00000000020000000000000000006614000006004D656D6F34
      39000200E7020000C80100002F0000001400000003000F000100000000000000
      0000FFFFFF1F2C02000000000001001C005B6F647350726968446F63506F4D65
      6469632E2246435F4B4F4C225D00000000FFFF00000000000200000001000000
      000500417269616C00080000000000000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000001A15000006004D656D6F353000020016
      030000C8010000440000001400000003000F0001000000000000000000FFFFFF
      1F2C020301100023232320232323202323302E303020F000010025005B6F6473
      50726968446F63506F4D656469632E22464E5F50524943455F44455441494C22
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      0000000000000009000000CC00020000000000FFFFFF00000000020000000000
      00000000C615000006004D656D6F35310002005A030000C80100005800000014
      00000003000F0001000000000000000000FFFFFF1F2C02030110002323232023
      2323202323302E303020F00001001D005B6F647350726968446F63506F4D6564
      69632E22464E5F53554D4D225D00000000FFFF00000000000200000001000000
      000500417269616C000800000000000000000009000000CC00020000000000FF
      FFFF00000000020000000000000000006416000005004D656D6F360002004200
      0000A4010000C90300001400000003000F0002000000000000000000CCFFFF00
      2C020000000000010020005B6F647350726968446F63506F4D656469632E224E
      414D45504F53544156225D00000000FFFF000000000002000000010000000005
      00417269616C000900000002000000000008000000CC00020000000000FFFFFF
      0000000002000000000000000000E916000005004D656D6F3700020024000000
      A40100001E0000001400000003000F0002000000000000000000CCFFFF002C02
      0000000000010007005B4C494E45235D00000000FFFF00000000000200000001
      000000000500417269616C000A0000000000000000000A000000CC0002000000
      0000FFFFFF00000000020000000000000004003817000005004C696E65310002
      0024000000C8010000E7030000000000000100080002000000000000000000FF
      FFFF002C020000000000000000000000FFFF0000000000020000000100000000
      0000E117000005004D656D6F3800020024000000F40100003603000014000000
      03000F0002000000000000000000FFFFFF1F2C02000000000001002B00C8F2EE
      E3EE20EFEE20225B6F647350726968446F63506F4D656469632E224E414D4550
      4F53544156225D2200000000FFFF000000000002000000010000000005004172
      69616C000A00000000000000000009000000CC00020000000000FFFFFF000000
      00020000000000000000009318000005004D656D6F390002005A030000F40100
      00B10000001400000003000F0002000000000000000000FFFFFF1F2C02040110
      0023232320232323202323302E303020F000010024005B53554D285B6F647350
      726968446F63506F4D656469632E22464E5F53554D4D225D295D00000000FFFF
      00000000000200000001000000000500417269616C000A000000020000000000
      09000000CC00020000000000FFFFFF0000000002000000000000000000101A00
      0005004D656D6F34000200240000009B000000E70300001B0000000300000001
      000000000000000000FFFFFF1F2C02000000000001001000CEF2F7E5F220EFEE
      20EFF0E8F5EEE4F30006000500626567696E0D310020695F44504944203A3D20
      303B202F2F20EDEEECE5F020205B6F647353656C446F63507269685265702E22
      44504944225D0D2E0020695F726F775F6E756D5F64657461696C203A3D20303B
      202F2F20EDEEECE5F020F1F2F0EEEAE82064657461696C0D2D0020695F726F77
      5F6E756D5F6D6173746572203A3D20303B202F2FEDEEECE5F020F1F2F0EEEAE8
      206D61737465720D4A0020695F464E5F50524943455F4D4153544552203A3D20
      303B202F2F20E8F2EEE3EEE2E0FF20F1F3ECECE020EFEE20F1F2EEEBE1F6F320
      22D1F3ECECE020EFEE20E4EEEAF3ECE5EDF2F3220D0300656E6400FFFF000000
      00000200000001000000000500417269616C000E000000020000000000020000
      00CC00020000000000FFFFFF0000000002000000000000000000B61A00000600
      4D656D6F313400020024000000B3000000E70300001800000003000000010000
      00000000000000FFFFFF1F2C0200000000000100270020E7E020EFE5F0E8EEE4
      20F1205B7661725F64617465315D20EFEE205B7661725F64617465325D000000
      00FFFF00000000000200000001000000000500417269616C000C000000020000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      4C1B000006004D656D6F323000020024000000410000004B0200000E00000003
      00000001000000000000000000FFFFFF1F2C02000000000001001700EDE0E8EC
      E5EDEEE2E0EDE8E520F3F7F0E5E6E4E5EDE8FF00000000FFFF00000000000200
      000001000000000500417269616C000800000000000000000002000000010002
      0000000000FFFFFF0000000002000000000000000000D91B000006004D656D6F
      323600020024000000240000004B0200001C0000000300020001000000000000
      000000CCFFCC002C02000000000001000E005B7661725F72656365697665725D
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      000000000000120000000100020000000000FFFFFF0000000002000000000000
      000000661C000006004D656D6F323700020024000000550000004B0200001900
      00000300020001000000000000000000CCFFCC002C02000000000001000E005B
      7661725F6D6F5F67726F75705D00000000FFFF00000000000200000001000000
      000500417269616C000C00000000000000000012000000CC00020000000000FF
      FFFF0000000002000000000000000000FF1C000006004D656D6F323800020024
      0000006F0000004B0200000E0000000300000001000000000000000000FFFFFF
      1F2C02000000000001001A00EDE0E8ECE5EDEEE2E0EDE8E520EFEEE4F0E0E7E4
      E5EBE5EDE8FF00000000FFFF0000000000020000000100000000050041726961
      6C000800000000000000000002000000CC00020000000000FFFFFF0000000002
      000000000000000A0B0054667252696368566965770000611D00000500526963
      68310002000C040000C80100005F000000140000000100000001000000000000
      000000FFFFFF1F2C020000000000000000000000FFFF00000000000200000001
      0000000000611D0000FEFEFF020000000A002043617465676F72793100000000
      040073756D6D000000000000000000000000FC00000000000000000000000000
      00000058001BC5245FECD2E24076366E8DED4EE440}
  end
  object odsPrihDocPoMedic: TOracleDataSet
    SQL.Strings = (
      '-- '#1087#1088#1080#1093#1086#1076
      'SELECT'
      
        '  TO_CHAR(MASTER_RANG.FN_ORDER)||'#39'. '#39'||MASTER1.FC_RANG as FC_RAN' +
        'G_ORDER,'
      '  MASTER1.FC_DOC as FC_DOC_SUMM, '
      '  MASTER1.NAMEPOSTAV as FC_NAMEPOSTAV_SUMM,'
      '  MASTER1.*,'
      '  DETAIL1.*,'
      
        '  rtrim(TO_CHAR(DETAIL1.FN_KOL, '#39'FM999G999G990D99999'#39'),'#39'.,'#39') as ' +
        'FC_KOL'
      ''
      '  '
      '  FROM'
      '    (SELECT'
      '       FN_PRICE AS FN_PRICE_MASTER,'
      '       TDOCS.FN_Rang,'
      
        '       DECODE(TDOCS.FN_RANG, 1,'#39#1055#1086#1089#1090#1072#1074#1097#1080#1082#1080#39', 2,'#39#1054#1090#1076#1077#1083#1077#1085#1080#1103#39',3,'#39#1054#1090 +
        #1076#1077#1083#1077#1085#1080#1103#39', 4,'#39#1054#1089#1090#1072#1090#1082#1080#39', 5,'#39#1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086#39', 6,'#39#1042#1086#1079#1074#1088#1072#1090#39', 7,'#39#1048#1079' '#1088#1077#1079#1077 +
        #1088#1074#1072#39', '#39#1055#1088#1080#1093#1086#1076#39') as FC_RANG,'
      
        '        :pADATA1 AS D1, :pADATA2 AS D2,FP_VIDMOVE,TDOCS.POSTAVID' +
        ', MOTOID, MOFROMID, TDOCS.FC_COMMENT, FP_VID, '
      '       MOOWNERID, TDOCS.DPID,'
      
        '       med.GET_DECODEDOCVIDMOVE(fp_vidmove)||'#39' '#8470' '#39'||TDOCS.fc_doc' +
        '||'#39' '#1086#1090' '#39'||to_char(TDOCS.fd_invoice,'#39'dd.mm.yyyy'#39')||DECODE(:IS_KON' +
        'TRAKT_SHOW, 0,'#39#39', DECODE(TDOCS.FC_KONTRAKT, null,'#39#39', '#39', '#1082#1086#1085#1090#1088#1072#1082#1090 +
        ': '#39'||TDOCS.FC_KONTRAKT)) AS fc_DOC,'
      '       TRUNC(TDOCS.FD_DATA) AS DATA,'
      '       TDOCS.FD_INVOICE,'
      
        '       MED.PKGTDOCS.GET_DOC_SOURCE (TDOCS.fp_vid, TDOCS.fp_vidmo' +
        've, TDOCS.fk_mogroupid_FROM, TDOCS.postavid) as NAMEPOSTAV'
      
        '       FROM (SELECT TDOCS.*, DECODE(TDOCS.fp_vidmove, 1,1, 2,2, ' +
        '3,3, 9,4, 10,5, 6,6, 5,7, 255) as FN_Rang FROM MED.TDOCS) TDOCS ' +
        '--, MED.TMO, MED.TPOSTAV, MED.TMO T2 , MED.TMO_GROUP MOGR_FROM, ' +
        ' MED.TMO_GROUP MOGR_TO'
      
        '     WHERE :MO_GROUP = TDOCS.fk_mogroupid_to -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084' '#1085 +
        #1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '  AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  TDOCS' +
        '.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to, :MO' +
        '_GROUP) = +1'
      '  AND TDOCS.FL_EDIT = 0 '
      
        '  AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087#1086#1089#1082#1086#1083#1100#1082#1091' '#1074 +
        #1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085#1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086#1076'+'#1088#1072#1089#1093#1086#1076 +
        ')'
      '  AND (not tdocs.fp_vidmove in (4,5))'
      '  AND ((:IS_RPO = 1)OR(tdocs.fp_vidmove <> 10))'
      
        '  AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC (:pADATA1) AND TRUNC (:' +
        'pADATA2)'
      '    ) MASTER1,'
      ''
      '    (SELECT ROWNUM as FN_ORDER, RANG.* FROM'
      '     (SELECT'
      '       DISTINCT'
      '       TDOCS.FN_RANG'
      
        '     FROM   (SELECT TDOCS.*, DECODE(TDOCS.fp_vidmove, 1,1, 2,2, ' +
        '3,3, 9,4, 10,5, 6,6, 5,7, 255) as FN_Rang FROM MED.TDOCS) TDOCS ' +
        '--, MED.TMO, MED.TMO T2, MED.TMO_GROUP MOGR_FROM,  MED.TMO_GROUP' +
        ' MOGR_TO'
      
        '     WHERE TDOCS.fk_mogroupid_to = :MO_GROUP -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084' '#1085 +
        #1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '       AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(TO_DATE(:pADATA1))' +
        ' AND TRUNC(TO_DATE(:pADATA2))'
      
        '       AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  ' +
        'TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to' +
        ', :MO_GROUP) = +1'
      
        '       AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087#1086#1089#1082#1086#1083 +
        #1100#1082#1091' '#1074#1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085#1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086#1076'+'#1088 +
        #1072#1089#1093#1086#1076')'
      '       AND (not tdocs.fp_vidmove in (4,5))'
      '       AND TDOCS.FL_EDIT = 0  '
      '     ORDER BY TDOCS.FN_RANG'
      '    ) RANG) MASTER_RANG,     '
      '    '
      '    (SELECT '
      '          TDPC.DPID,'
      '          TDPC.DPCID,'
      '          TKART.MEDICID,'
      '          TDPC.FN_KOL,'
      '          TDPC.FN_KOL*TKART.FN_PRICE as FN_SUMM,'
      '          TKART.FN_PRICE AS FN_PRICE_DETAIL,'
      ''
      '          TKART.KARTID,'
      
        '          TMEDIC.FC_NAME ||'#39'( '#1087'. '#8470#39'||TKART.FN_PARTY_NUM||'#39')'#39' AS ' +
        'NAMEKART,'
      '          TKART.FC_SERIAL,'
      '          TEI.FC_NAME AS FC_EDIZM,'
      '          fs.FC_NAME as FC_FINSOURCE'
      '        FROM'
      
        '          MED.TDPC, MED.TKART, MED.TMEDIC, MED.TEI, med.TFINSOUR' +
        'CE fs'
      '        WHERE'
      '          TDPC.KARTID = TKART.KARTID'
      '          AND TKART.FL_DEL = 0'
      '          AND TKART.MEDICID=TMEDIC.MEDICID'
      '          AND TKART.FK_FINSOURCE_ID = fs.FK_ID(+)'
      '          AND TEI.EIID=TMEDIC.EIID'
      '          AND DPID IN (SELECT TDOCS.DPID'
      '                       FROM MED.TDOCS'
      
        '                       WHERE :MO_GROUP = TDOCS.fk_mogroupid_to -' +
        '- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084' '#1085#1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '                         AND MED.PKG_PRIHRASH.Get_PrihRashPrizna' +
        'k (TDOCS.FP_VID,  TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDO' +
        'CS.fk_mogroupid_to, :MO_GROUP) = +1'
      '                         AND TDOCS.FL_EDIT = 0 '
      
        '                         AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077 +
        ' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087#1086#1089#1082#1086#1083#1100#1082#1091' '#1074#1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085 +
        #1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086#1076'+'#1088#1072#1089#1093#1086#1076')'
      '                         AND (not tdocs.fp_vidmove in (4,5))'
      
        '                         AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC ' +
        '(:pADATA1) AND TRUNC (:pADATA2)'
      '                      )'
      '       '
      '    ) DETAIL1'
      'WHERE DETAIL1.DPID = MASTER1.DPID'
      '   AND MASTER1.FN_RANG = MASTER_RANG.FN_RANG(+)'
      
        'ORDER BY MASTER1.FN_RANG, UPPER(MASTER1.NAMEPOSTAV), MASTER1.DAT' +
        'A ')
    Optimize = False
    Variables.Data = {
      0300000005000000080000003A504144415441310C0000000000000000000000
      080000003A504144415441320C0000000000000000000000090000003A4D4F5F
      47524F5550030000000000000000000000070000003A49535F52504F03000000
      040000000000000000000000110000003A49535F4B4F4E5452414B545F53484F
      5703000000040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001F000000040000004450494401000000000002000000443101000000
      00000200000044320100000000000A00000046505F5649444D4F564501000000
      000008000000504F535441564944010000000000060000004D4F544F49440100
      00000000080000004D4F46524F4D49440100000000000A00000046435F434F4D
      4D454E540100000000000600000046505F564944010000000000090000004D4F
      4F574E455249440100000000000600000046435F444F43010000000000040000
      00444154410100000000000A0000004E414D45504F5354415601000000000006
      000000445049445F310100000000000500000044504349440100000000000700
      00004D45444943494401000000000006000000464E5F4B4F4C01000000000007
      000000464E5F53554D4D010000000000060000004B4152544944010000000000
      080000004E414D454B4152540100000000000900000046435F53455249414C01
      00000000000F000000464E5F50524943455F4D41535445520100000000000F00
      0000464E5F50524943455F44455441494C0100000000000800000046435F4544
      495A4D0100000000000B00000046435F444F435F53554D4D0100000000001200
      000046435F4E414D45504F535441565F53554D4D010000000000070000004643
      5F52414E470100000000000D00000046435F52414E475F4F5244455201000000
      000007000000464E5F52414E470100000000000A00000046445F494E564F4943
      450100000000000600000046435F4B4F4C010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 121
    Top = 96
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
      04000000040000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C0100000000000800000046
      4E5F4F52444552010000000000}
    Session = os
    Left = 22
    Top = 207
  end
  object frPrihDocITOG: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 255
    Top = 331
    ReportForm = {
      19000000C6180000190000FFFF01000100FFFFFFFFFF090000009A0B00003408
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
      616765466F6F74657231000201000000007C0200002F04000014000000300003
      0001000000000000000000FFFFFF1F00000000000000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200960200000B004D617374657244617461320002010000000004020000
      2F040000100000003100050001000000000000000000FFFFFF1F000000001100
      667244424E6163656E6B615563656E6B6100000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      030300000D004D61737465724865616465723100020100000000E00100002F04
      0000140000003000040001000000000000000000FFFFFF1F0000000000000000
      0000000000FFFF000000000002000000010000000000000001000000C8000000
      14000000010000000000000200700300000D004D6173746572466F6F74657232
      00020100000000240200002F0400001400000030000600010000000000000000
      00FFFFFF1F00000000000000000000000000FFFF000000000002000000010000
      000000000001000000C800000014000000010000000000000200DC0300000B00
      4D61737465724461746133000201000000004C0200002F040000140000003000
      050001000000000000000000FFFFFF1F0000000001003100000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      0000000002007E0400000C0047726F757048656164657231000201000000005C
      0100002F040000000000003000100001000000000000000000FFFFFF1F000000
      0017005B6F647350726968506F73742E2246435F52414E47225D000000000300
      0500626567696E0D0F002020464E5F53554D4D203A3D20303B0D0300656E6400
      FFFF000000000002000000010000000000000001000000C80000001400000001
      0000000000000200EA0400000C0047726F7570466F6F74657231000201000000
      00B40100002F040000140000003000110001000000000000000000FFFFFF1F00
      000000000000000000000000FFFF000000000002000000010000000000000001
      000000C800000014000000010000000000000000D205000005004D656D6F3100
      0200480000009B000000C30300001B0000000300000001000000000000000000
      FFFFFF1F2C02000000000001001F00CEF2F7E5F220EFEE20EFF0E8F5EEE4F320
      EFEE20EFEEF1F2E0E2F9E8EAE0EC0005000500626567696E0D0F002020464E5F
      53554D4D203A3D20303B0D13002020464E5F53554D4D5F414C4C203A3D20303B
      0D13002020464E5F53554D4D5F4E4143203A3D20303B0D0300656E6400FFFF00
      000000000200000001000000000500417269616C000E00000002000000000002
      000000CC00020000000000FFFFFF000000000200000000000000000059060000
      05004D656D6F330002007300000030010000000300001200000003000F00DC05
      0000000000000000CCFFCC002C02000000000001000900CFEEF1F2E0E2F9E8EA
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      02000000000002000000CC00020000000000FFFFFF0000000002000000000000
      000000DF06000005004D656D6F35000200730300003001000098000000120000
      0003000F00DC050000000000000000CCFFCC002C02000000000001000800D1F3
      ECECE02C20F000000000FFFF0000000000020000000100000000050041726961
      6C000A00000002000000000002000000CC00020000000000FFFFFF0000000002
      0000000000000000008407000006004D656D6F313000020048000000B7000000
      C3030000180000000300000001000000000000000000FFFFFF1F2C0200000000
      0001002600E7E020EFE5F0E8EEE420F1205B7661725F64617465315D20EFEE20
      5B7661725F64617465325D00000000FFFF000000000002000000010000000005
      00417269616C000C0000000200000000000A000000CC00020000000000FFFFFF
      00000000020000000000000000000908000006004D656D6F3135000200480000
      004C0200002B0300001400000003000F00DC050000000000000000FFFFFF1F2C
      02000000000001000600C8F2EEE3EE3A00000000FFFF00000000000200000001
      000000000500417269616C000A00000002000000000009000000CC0002000000
      0000FFFFFF0000000002000000000000000000BB08000006004D656D6F313700
      0200730300004C020000980000001400000023000F00DC050000000000000000
      FFFFFF1F2C02040114002323232023232320232323202323302E303020F00001
      001F005B5B464E5F53554D4D5F414C4C5D202B205B464E5F53554D4D5F4E4143
      5D5D00000000FFFF00000000000200000001000000000500417269616C000A00
      000002000000000009000000CC00020000000000FFFFFF000000000200000000
      00000000005609000006004D656D6F3131000200480000007D020000C3030000
      110000000300000001000000000000000000FFFFFF1F2C02000000000001001C
      00F1F2F02E205B50414745235D20E8E7205B544F54414C50414745535D000000
      00FFFF00000000000200000001000000040500417269616C000A000000000000
      00000009000000CC00020000000000FFFFFF0000000002000000000000000000
      F309000006004D656D6F313400020048000000300100002B0000001200000003
      000F00DC050000000000000000CCFFCC002C02000000000001000500B920EF2F
      EF0003000500626567696E0D090020204E203A3D20303B0D0300656E6400FFFF
      00000000000200000001000000000500417269616C000A000000020000000000
      02000000CC00020000000000FFFFFF00000000020000000000000000008B0A00
      0005004D656D6F32000200730000008B010000000300001400000003000F002C
      010000000000000000CCFFFF002C02000000000001001A005B6F647350726968
      506F73742E224E414D45504F53544156225D00000000FFFF0000000000020000
      0001000000000500417269616C000A00000002000000000008000000CC000200
      00000000FFFFFF0000000002000000000000000000270B000006004D656D6F31
      32000200480000008B0100002B0000001400000003000F002C01000000000000
      0000CCFFFF002C020000000000010003005B4E5D0003000500626567696E0D0A
      00204E203A3D204E2B313B0D0300656E6400FFFF000000000002000000010000
      00000500417269616C000A0000000000000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000480C000006004D656D6F3133000200
      730300008B010000980000001400000003000F002C010000000000000000CCFF
      FF002C0204010E0023232320232323202323302E303000010018005B6F647350
      726968506F73742E22464E5F5052494345225D0004000500626567696E0D3800
      2020464E5F53554D4D5F414C4C203A3D20464E5F53554D4D5F414C4C202B205B
      6F647350726968506F73742E22464E5F5052494345225D3B0D31002020464E5F
      53554D4D203A3D20464E5F53554D4D202B20205B6F647350726968506F73742E
      22464E5F5052494345225D3B0D0300656E6400FFFF0000000000020000000100
      0000000500417269616C000A00000002000000000009000000CC000200000000
      00FFFFFF0000000002000000000000000000DE0C000006004D656D6F32360002
      004800000041000000D20100000E0000000300000001000000000000000000FF
      FFFF1F2C02000000000001001700EDE0E8ECE5EDEEE2E0EDE8E520F3F7F0E5E6
      E4E5EDE8FF00000000FFFF00000000000200000001000000000500417269616C
      0008000000000000000000020000000100020000000000FFFFFF000000000200
      00000000000000006B0D000006004D656D6F32370002004800000025000000D2
      0100001C0000000300020001000000000000000000CCFFCC002C020000000000
      01000E005B7661725F72656365697665725D00000000FFFF0000000000020000
      0001000000000500417269616C000A0000000000000000001200000001000200
      00000000FFFFFF0000000002000000000000000000F80D000006004D656D6F32
      380002004800000055000000D201000019000000030002000100000000000000
      0000CCFFCC002C02000000000001000E005B7661725F6D6F5F67726F75705D00
      000000FFFF00000000000200000001000000000500417269616C000C00000000
      000000000012000000CC00020000000000FFFFFF000000000200000000000000
      0000910E000006004D656D6F3331000200480000006F000000D20100000E0000
      000300000001000000000000000000FFFFFF1F2C02000000000001001A00EDE0
      E8ECE5EDEEE2E0EDE8E520EFEEE4F0E0E7E4E5EBE5EDE8FF00000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000200
      0000CC00020000000000FFFFFF00000000020000000000000000001C0F000005
      004D656D6F3400020073000000E0010000890000001400000003000F002C0100
      00000000000000FFFFFF002C02000000000001000D00CDE0F6E5EDEAE02028D0
      CFCE2900000000FFFF00000000000200000001000000000500417269616C000A
      00000002000000000008000000CC00020000000000FFFFFF0000000002000000
      000000000000BA0F000005004D656D6F3800020048000000E00100002B000000
      1400000003000F002C010000000000000000FFFFFF002C020000000000010003
      005B4E5D0003000500626567696E0D0D0020204E203A3D204E202B20313B0D03
      00656E6400FFFF00000000000200000001000000000500417269616C000A0000
      000000000000000A000000CC00020000000000FFFFFF00000000020000000000
      000000008F10000006004D656D6F3139000200DB010000B40100009801000014
      000000030000002C010000000000000000FFFFFF1F2C02000000000001005600
      C8F2EEE3EE20EFEE205B6F647350726968506F73742E2246435F52414E47225D
      3A205B464F524D4154464C4F415428272323232C2323232C2323232C2323232C
      2323302E2C30302E272C205B464E5F53554D4D5D295D00000000010000000000
      000200000001000000000500417269616C000A00000002000000000009000000
      CC00020000000000FFFFFF00000000020000000000000000002A11000006004D
      656D6F32300002005C01000004020000740100001000000003000F002C010000
      000000000000CCFFFF002C02000000000001001C005B6F64734E6163656E6B61
      5563656E6B612E2246435F4E414D45225D00000000FFFF000000000002000000
      01000000000500417269616C000800000000000000000008000000CC00020000
      000000FFFFFF0000000002000000000000000000B511000006004D656D6F3231
      0002007303000004020000980000001000000003000F002C0100000000000000
      00CCFFFF002C0204010E0023232320232323202323302E303000000000000000
      FFFF00000000000200000001000000000500417269616C000800000000000000
      000009000000CC00020000000000FFFFFF000000000200000000000000000047
      12000006004D656D6F323200020048000000240200002B030000140000000300
      0F002C010000000000000000CCFFFF002C02000000000001001300C8F2EEE3EE
      20EDE0F6E5EDEAE02028D0CFCE2900000000FFFF000000000002000000010000
      00010500417269616C000A00000002000000000009000000CC00020000000000
      FFFFFF00000000020000000000000000002D13000006004D656D6F3233000200
      7303000024020000980000001400000003000F002C010000000000000000CCFF
      FF002C0204010E0023232320232323202323302E30300001000D005B464E5F53
      554D4D5F4E41435D0003000500626567696E0D3C002F2F205B53554D285B6F64
      734E6163656E6B615563656E6B612E22464E5F4E414348454E4B41225D2C206F
      64734E6163656E6B615563656E6B61295D0D0300656E6400FFFF000000000002
      00000001000000000500417269616C000A00000002000000000009000000CC00
      020000000000FFFFFF0000000002000000000000000000C813000006004D656D
      6F3138000200FC00000004020000600000001000000003000F002C0100000000
      00000000CCFFFF002C02000000000001001C005B6F64734E6163656E6B615563
      656E6B612E2246445F44415441225D00000000FFFF0000000000020000000100
      0000000500417269616C00080000000000000000000A000000CC000200000000
      00FFFFFF00000000020000000000000000006514000006004D656D6F32340002
      00D002000004020000450000001000000003000F002C010000000000000000CC
      FFFF002C02000000000001001E005B6F64734E6163656E6B615563656E6B612E
      22464E5F4E554D424552225D00000000FFFF0000000000020000000100000000
      0500417269616C00080000000000000000000A000000CC00020000000000FFFF
      FF0000000002000000000000000000EC14000006004D656D6F32350002004800
      000004020000B40000001000000003000F002C010000000000000000CCFFFF00
      2C020000000000010008005B4C494E45235D2900000000FFFF00000000000200
      000001000000000500417269616C000800000000000000000009000000CC0002
      0000000000FFFFFF00000000020000000000000000006F15000006004D656D6F
      3239000200FC000000E0010000600000001400000003000F002C010000000000
      000000FFFFFF002C02000000000001000400C4E0F2E000000000FFFF00000000
      000200000001000000000500417269616C000800000000000000000012000000
      CC00020000000000FFFFFF0000000002000000000000000000F815000006004D
      656D6F33300002005C010000E0010000740100001400000003000F002C010000
      000000000000FFFFFF002C02000000000001000A00CCE5E4E8EAE0ECE5EDF200
      000000FFFF00000000000200000001000000000500417269616C000800000000
      000000000012000000CC00020000000000FFFFFF000000000200000000000000
      00007816000006004D656D6F3332000200D0020000E001000045000000140000
      0003000F002C010000000000000000FFFFFF002C02000000000001000100B900
      000000FFFF00000000000200000001000000000500417269616C000800000000
      000000000012000000CC00020000000000FFFFFF000000000200000000000000
      0000F516000006004D656D6F333300020073030000E001000098000000140000
      0003000F002C010000000000000000FFFFFF002C020000000000000000000000
      FFFF00000000000200000001000000000500417269616C000800000000000000
      000012000000CC00020000000000FFFFFF00000000020000000000000000007C
      17000006004D656D6F333400020015030000E00100005E000000140000000300
      0F002C010000000000000000FFFFFF002C02000000000001000800D1F3ECECE0
      2C20F000000000FFFF00000000000200000001000000000500417269616C0008
      00000000000000000012000000CC00020000000000FFFFFF0000000002000000
      0000000000007918000006004D656D6F333500020015030000040200005E0000
      001000000003000F002C010000000000000000CCFFFF002C0204010E00232323
      20232323202323302E303000010020005B6F64734E6163656E6B615563656E6B
      612E22464E5F4E414348454E4B41225D0003000500626567696E0D4000202046
      4E5F53554D4D5F4E4143203A3D20464E5F53554D4D5F4E4143202B205B6F6473
      4E6163656E6B615563656E6B612E22464E5F4E414348454E4B41225D3B0D0300
      656E6400FFFF00000000000200000001000000000500417269616C0008000000
      00000000000009000000CC00020000000000FFFFFF0000000002000000000000
      00FEFEFF020000000A002043617465676F72793100000000040073756D6D0001
      0030000000000000000000FC0000000000000000000000000000000058008DF9
      BA39EDD2E24076366E8DED4EE440}
  end
  object frPrihDocPoDOC: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 259
    Top = 104
    ReportForm = {
      19000000B3190000190000FFFF01000100FFFFFFFFFF090000009A0B00003408
      00004800000024000000240000002400000001FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      0000240000002F040000B50000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E4865616465723100020100000000280100002F0400001200000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200AF0100000B004D6173746572446174613100020100000000880100002F04
      0000140000003100050001000000000000000000FFFFFF1F000000000C006672
      4442445353656C446F6300000000000000FFFF00000000000200000001000000
      0000000001000000C8000000140000000100000000000002001C0200000D004D
      6173746572466F6F7465723100020100000000E80100002F040000D400000030
      00060001000000000000000000FFFFFF1F00000000000000000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      000000000200870200000B0050616765466F6F74657231000201000000002003
      00002F040000140000003000030001000000000000000000FFFFFF1F00000000
      000000000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200110300000C0047726F757048656164
      65723100020100000000580100002F0400001400000030001000010000000000
      00000000FFFFFF1F000000001E005B6F647350726968446F63506F444F432E22
      4E414D45504F53544156225D00000000000000FFFF0000000000020000000100
      00000000000001000000C8000000140000000100000000000002007D0300000C
      0047726F7570466F6F7465723100020100000000B80100002F04000014000000
      3000110001000000000000000000FFFFFF1F00000000000000000000000000FF
      FF000000000002000000010000000000000001000000C8000000140000000100
      00000000000000FF03000005004D656D6F320002007400000028010000510000
      001200000003000F00DC050000000000000000CCFFCC002C0200000000000100
      0400C4E0F2E000000000FFFF0000000000020000000100000000050041726961
      6C000A00000002000000000002000000CC00020000000000FFFFFF0000000002
      0000000000000000008604000005004D656D6F33000200C500000028010000AE
      0200001200000003000F00DC050000000000000000CCFFCC002C020000000000
      01000900CEF1EDEEE2E0EDE8E500000000FFFF00000000000200000001000000
      000500417269616C000A00000002000000000002000000CC00020000000000FF
      FFFF00000000020000000000000000000C05000005004D656D6F350002007303
      000028010000980000001200000003000F00DC050000000000000000CCFFCC00
      2C02000000000001000800D1F3ECECE02C20F000000000FFFF00000000000200
      000001000000000500417269616C000A00000002000000000002000000CC0002
      0000000000FFFFFF0000000002000000000000000000A205000005004D656D6F
      360002007400000088010000510000001400000003000F002C01000000000000
      0000FFFFFF1F2C020000000000010018005B6F647350726968446F63506F444F
      432E2244415441225D00000000FFFF0000000000020000000100000000050041
      7269616C000A0000000000000000000A000000CC00020000000000FFFFFF0000
      0000020000000000000000003A06000005004D656D6F37000200C50000008801
      0000AE0200001400000003000F002C010000000000000000FFFFFF1F2C020000
      00000001001A005B6F647350726968446F63506F444F432E2246435F444F4322
      5D00000000FFFF00000000000200000001000000000500417269616C000A0000
      0000000000000008000000CC00020000000000FFFFFF00000000020000000000
      00000000E206000005004D656D6F390002007303000088010000980000001400
      000003000F002C010000000000000000FFFFFF1F2C0204010E00232323202323
      23202323302E30300001001C005B6F647350726968446F63506F444F432E2246
      4E5F5052494345225D00000000FFFF0000000000020000000100000000050041
      7269616C000A00000000000000000009000000CC00020000000000FFFFFF0000
      0000020000000000000000006707000006004D656D6F313500020048000000E8
      010000030300001400000003000F00DC050000000000000000FFFFFF1F2C0200
      0000000001000600C8F2EEE3EE3A00000000FFFF000000000002000000010000
      00000500417269616C000A00000002000000000009000000CC00020000000000
      FFFFFF00000000020000000000000000001D08000006004D656D6F3137000200
      4B030000E8010000C00000001400000023000F00DC050000000000000000FFFF
      FF1F2C02040114002323232023232320232323202323302E303020F000010023
      005B53554D285B6F647350726968446F63506F444F432E22464E5F5052494345
      225D295D00000000FFFF00000000000200000001000000000500417269616C00
      0C00000002000000000009000000CC00020000000000FFFFFF00000000020000
      00000000000000B808000006004D656D6F31310002004800000021030000C303
      0000110000000300000001000000000000000000FFFFFF1F2C02000000000001
      001C00F1F2F02E205B50414745235D20E8E7205B544F54414C50414745535D00
      000000FFFF00000000000200000001000000040500417269616C000A00000000
      000000000009000000CC00020000000000FFFFFF000000000200000000000000
      00003C09000006004D656D6F313400020048000000280100002C000000120000
      0003000F00DC050000000000000000CCFFCC002C02000000000001000500B920
      EF2FEF00000000FFFF00000000000200000001000000000500417269616C000A
      00000002000000000002000000CC00020000000000FFFFFF0000000002000000
      000000000000C309000006004D656D6F313600020048000000880100002C0000
      001400000003000F002C010000000000000000FFFFFF1F2C0200000000000100
      08005B4C494E45235D2900000000FFFF00000000000200000001000000000500
      417269616C000A00000000000000000009000000CC00020000000000FFFFFF00
      000000020000000000000000005F0A000005004D656D6F340002007400000058
      010000970300001400000003000F002C010000000000000000CCFFFF002C0200
      0000000001001E005B6F647350726968446F63506F444F432E224E414D45504F
      53544156225D00000000FFFF0000000000020000000100000000050041726961
      6C000A00000002000000000008000000CC00020000000000FFFFFF0000000002
      000000000000000000E40A000005004D656D6F3800020048000000580100002C
      0000001400000003000F002C010000000000000000CCFFFF002C020000000000
      010007005B4C494E45235D00000000FFFF000000000002000000010000000005
      00417269616C000A0000000000000000000A000000CC00020000000000FFFFFF
      00000000020000000000000000008C0B000006004D656D6F3133000200480000
      00B80100002B0300001400000003000F002C010000000000000000FFFFFF1F2C
      02000000000001002900C8F2EEE3EE20EFEE20225B6F647350726968446F6350
      6F444F432E224E414D45504F53544156225D2200000000FFFF00000000000200
      000001000000000500417269616C000A00000000000000000009000000CC0002
      0000000000FFFFFF00000000020000000000000000003C0C000006004D656D6F
      313900020073030000B8010000980000001400000003000F002C010000000000
      000000FFFFFF1F2C0204010E0023232320232323202323302E30300001002300
      5B53554D285B6F647350726968446F63506F444F432E22464E5F505249434522
      5D295D00000000FFFF00000000000200000001000000000500417269616C000A
      00000002000000000009000000CC00020000000000FFFFFF0000000002000000
      000000000000EA0C000005004D656D6F31000200480000009B000000C3030000
      1B0000000300000001000000000000000000FFFFFF1F2C020000000000010030
      00D1EEEFF0EEE2EEE4E8F2E5EBFCEDFBE920F0E5E5F1F2F02020EFEE20EFF0E8
      F5EEE4EDFBEC20E4EEEAF3ECE5EDF2E0EC00000000FFFF000000000002000000
      01000000000500417269616C000E00000002000000000002000000CC00020000
      000000FFFFFF00000000020000000000000000008F0D000006004D656D6F3130
      00020048000000B7000000C30300001800000003000000010000000000000000
      00FFFFFF1F2C02000000000001002600E7E020EFE5F0E8EEE420F1205B766172
      5F64617465315D20EFEE205B7661725F64617465325D00000000FFFF00000000
      000200000001000000000500417269616C000C0000000200000000000A000000
      CC00020000000000FFFFFF0000000002000000000000000000250E000006004D
      656D6F32360002004800000042000000D20100000E0000000300000001000000
      000000000000FFFFFF1F2C02000000000001001700EDE0E8ECE5EDEEE2E0EDE8
      E520F3F7F0E5E6E4E5EDE8FF00000000FFFF0000000000020000000100000000
      0500417269616C0008000000000000000000020000000100020000000000FFFF
      FF0000000002000000000000000000B20E000006004D656D6F32370002004800
      000025000000D20100001C0000000300020001000000000000000000CCFFCC00
      2C02000000000001000E005B7661725F72656365697665725D00000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000012
      0000000100020000000000FFFFFF00000000020000000000000000003F0F0000
      06004D656D6F32380002004800000055000000D2010000190000000300020001
      000000000000000000CCFFCC002C02000000000001000E005B7661725F6D6F5F
      67726F75705D00000000FFFF0000000000020000000100000000050041726961
      6C000C00000000000000000012000000CC00020000000000FFFFFF0000000002
      000000000000000000D80F000006004D656D6F3331000200480000006F000000
      D20100000E0000000300000001000000000000000000FFFFFF1F2C0200000000
      0001001A00EDE0E8ECE5EDEEE2E0EDE8E520EFEEE4F0E0E7E4E5EBE5EDE8FF00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      000000000002000000CC00020000000000FFFFFF000000000200000000000000
      00006710000006004D656D6F323200020048000000130200007D000000140000
      000300000001000000000000000000FFFFFF1F2C02000000000001001000C2F1
      E5E3EE20E4EEEAF3ECE5EDF2EEE200000000FFFF000000000002000000010000
      00000500417269616C000A000000000000000000000000000100020000000000
      FFFFFF0000000002000000000000000000EE10000006004D656D6F3233000200
      C50000002702000069000000100000000300080001000000000000000000FFFF
      FF1F2C0200000000000100080028EAEEEB2DE2EE2900000000FFFF0000000000
      0200000001000000000500417269616C00060000000000000000000200000001
      00020000000000FFFFFF00000000020000000000000000007B11000006004D65
      6D6F323400020048000000400200007D0000001C000000030000000100000000
      0000000000FFFFFF1F2C02000000000001000E00C4EEEAF3ECE5EDF2FB20F1E4
      E0EB00000000FFFF00000000000200000001000000000500417269616C000A00
      0000000000000000100000000100020000000000FFFFFF000000000200000000
      00000000000512000006004D656D6F3235000200C50000005C020000D2000000
      0C0000000300080001000000000000000000FFFFFF1F2C02000000000001000B
      0028E4EEEBE6EDEEF1F2FC2900000000FFFF0000000000020000000100000000
      0500417269616C0006000000000000000000020000000100020000000000FFFF
      FF00000000020000000000000000008D12000006004D656D6F32390002009B01
      00005C0200007F0000000C0000000300080001000000000000000000FFFFFF1F
      2C0200000000000100090028EFEEE4EFE8F1FC2900000000FFFF000000000002
      00000001000000000500417269616C0006000000000000000000020000000100
      020000000000FFFFFF00000000020000000000000000002113000006004D656D
      6F33300002001D0200005C020000F40000000C00000003000800010000000000
      00000000FFFFFF1F2C0200000000000100150028F0E0F1F8E8F4F0EEE2EAE020
      EFEEE4EFE8F1E82900000000FFFF000000000002000000010000000005004172
      69616C0006000000000000000000020000000100020000000000FFFFFF000000
      0002000000000000000000C213000006004D656D6F3332000200110300004002
      0000FA0000001C0000000300000001000000000000000000FFFFFF1F2C020000
      00000001002200AB5F5F5F5FBB205F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
      202032305F5F5F20E300000000FFFF0000000000020000000100000000050041
      7269616C000A000000000000000000100000000100020000000000FFFFFF0000
      0000020000000000000000005114000006004D656D6F33330002004800000068
      0200007D0000001C0000000300000001000000000000000000FFFFFF1F2C0200
      0000000001001000C4EEEAF3ECE5EDF2FB20EFF0E8EDFFEB00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000001000
      00000100020000000000FFFFFF0000000002000000000000000000DB14000006
      004D656D6F3334000200C500000084020000D20000000C000000030008000100
      0000000000000000FFFFFF1F2C02000000000001000B0028E4EEEBE6EDEEF1F2
      FC2900000000FFFF00000000000200000001000000000500417269616C000600
      0000000000000000020000000100020000000000FFFFFF000000000200000000
      00000000006315000006004D656D6F33350002009B010000840200007F000000
      0C0000000300080001000000000000000000FFFFFF1F2C020000000000010009
      0028EFEEE4EFE8F1FC2900000000FFFF00000000000200000001000000000500
      417269616C0006000000000000000000020000000100020000000000FFFFFF00
      00000002000000000000000000F715000006004D656D6F33360002001D020000
      84020000F40000000C0000000300080001000000000000000000FFFFFF1F2C02
      00000000000100150028F0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E8290000
      0000FFFF00000000000200000001000000000500417269616C00060000000000
      00000000020000000100020000000000FFFFFF00000000020000000000000000
      009816000006004D656D6F33370002001103000068020000FA0000001C000000
      0300000001000000000000000000FFFFFF1F2C02000000000001002200AB5F5F
      5F5FBB205F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F202032305F5F5F20E300
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      0000000000100000000100020000000000FFFFFF000000000200000000000000
      00001F17000006004D656D6F333800020048000000900200007D0000001C0000
      000300000001000000000000000000FFFFFF1F2C02000000000001000800CFF0
      EEE2E5F0E8EB00000000FFFF0000000000020000000100000000050041726961
      6C000A000000000000000000100000000100020000000000FFFFFF0000000002
      000000000000000000A917000006004D656D6F3339000200C5000000AC020000
      D20000000C0000000300080001000000000000000000FFFFFF1F2C0200000000
      0001000B0028E4EEEBE6EDEEF1F2FC2900000000FFFF00000000000200000001
      000000000500417269616C000600000000000000000002000000010002000000
      0000FFFFFF00000000020000000000000000003118000006004D656D6F343000
      02009B010000AC0200007F0000000C0000000300080001000000000000000000
      FFFFFF1F2C0200000000000100090028EFEEE4EFE8F1FC2900000000FFFF0000
      0000000200000001000000000500417269616C00060000000000000000000200
      00000100020000000000FFFFFF0000000002000000000000000000C518000006
      004D656D6F34310002001D020000AC020000F40000000C000000030008000100
      0000000000000000FFFFFF1F2C0200000000000100150028F0E0F1F8E8F4F0EE
      E2EAE020EFEEE4EFE8F1E82900000000FFFF0000000000020000000100000000
      0500417269616C0006000000000000000000020000000100020000000000FFFF
      FF00000000020000000000000000006619000006004D656D6F34320002001103
      000090020000FA0000001C0000000300000001000000000000000000FFFFFF1F
      2C02000000000001002200AB5F5F5F5FBB205F5F5F5F5F5F5F5F5F5F5F5F5F5F
      5F5F5F5F202032305F5F5F20E300000000FFFF00000000000200000001000000
      000500417269616C000A000000000000000000100000000100020000000000FF
      FFFF000000000200000000000000FEFEFF020000000A002043617465676F7279
      3100000000040073756D6D00010030000000000000000000FC00000000000000
      00000000000000000058008DF9BA39EDD2E24076366E8DED4EE440}
  end
  object frPrihDocPoMedicType: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 141
    Top = 410
    ReportForm = {
      1900000003170000190000FFFF01000100FFFFFFFFFF090000009A0B00003408
      00004800000024000000190000002400000001FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200080100000C005265706F72745469746C65310002010000
      0000240000002F040000A50000003000000001000000000000000000FFFFFF1F
      0000000000000000000004000500626567696E0D15002020464E5F47524F5550
      5F53554D4D203A3D20303B0D15002020464E5F49544F474F5F53554D4D203A3D
      20303B0D0300656E6400FFFF0000000000020000000100000000000000010000
      00C800000014000000010000000000000200750100000D00436F6C756D6E4865
      616465723100020100000000280100002F0400002700000030000E0001000000
      000000000000FFFFFF1F00000000000000000000000000FFFF00000000000200
      0000010000000000000001000000C800000014000000010000000000000200EB
      0100000B004D6173746572446174613100020100000000940100002F04000014
      0000003100050001000000000000000000FFFFFF1F000000000B00667244426F
      6473506F737400000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200580200000D004D61737465
      72466F6F7465723100020100000000040200002F040000190000003100060001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200C30200000B0050616765466F6F7465723100020100000000380200002F04
      0000140000003000030001000000000000000000FFFFFF1F0000000000000000
      0000000000FFFF000000000002000000010000000000000001000000C8000000
      140000000100000000000002002F0300000C0047726F7570466F6F7465723100
      020100000000C60100002F040000140000003000110001000000000000000000
      FFFFFF1F00000000000000000000000000FFFF00000000000200000001000000
      0000000001000000C800000014000000010000000000000200E60300000C0047
      726F75704865616465723100020100000000640100002F040000140000003000
      100001000000000000000000FFFFFF1F0000000026005B6F647350726968446F
      63506F4D65646963547970652E2246435F6D6564696374797065225D00000000
      03000500626567696E0D15002020464E5F47524F55505F53554D4D203A3D2030
      3B0D0300656E6400FFFF000000000002000000010000000000000001000000C8
      000000140000000100000000000000006804000005004D656D6F32000200B301
      000028010000540000002700000003000F00DC050000000000000000CCFFCC00
      2C02000000000001000400C4E0F2E000000000FFFF0000000000020000000100
      0000000500417269616C000A0000000200000000000A000000CC000200000000
      00FFFFFF0000000002000000000000000000EE04000005004D656D6F33000200
      0702000028010000A00000002700000003000F00DC050000000000000000CCFF
      CC002C02000000000001000800C4EEEAF3ECE5EDF200000000FFFF0000000000
      0200000001000000000500417269616C000A0000000200000000000A000000CC
      00020000000000FFFFFF00000000020000000000000000007505000005004D65
      6D6F34000200A702000028010000870000002700000003000F00DC0500000000
      00000000CCFFCC002C02000000000001000900CFEEF1F2E0E2F9E8EA00000000
      FFFF00000000000200000001000000000500417269616C000A00000002000000
      00000A000000CC00020000000000FFFFFF000000000200000000000000000012
      06000006004D656D6F3431000200B30100009401000054000000140000000300
      0F002C010000000000000000FFFFFF1F2C02000000000001001E005B6F647350
      726968446F63506F4D65646963547970652E2244415441225D00000000FFFF00
      000000000200000001000000000500417269616C000800000000000000000008
      000000CC00020000000000FFFFFF0000000002000000000000000000B1060000
      06004D656D6F34320002000702000094010000A00000001400000003000F002C
      010000000000000000FFFFFF1F2C020000000000010020005B6F647350726968
      446F63506F4D65646963547970652E2246435F444F43225D00000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000800
      0000CC00020000000000FFFFFF00000000020000000000000000005407000006
      004D656D6F3434000200A702000094010000870000001400000003000F002C01
      0000000000000000FFFFFF1F2C020000000000010024005B6F64735072696844
      6F63506F4D65646963547970652E224E414D45504F53544156225D00000000FF
      FF00000000000200000001000000000500417269616C00080000000000000000
      0008000000CC00020000000000FFFFFF0000000002000000000000000000D907
      000006004D656D6F31350002004800000004020000180300001900000003000F
      00DC050000000000000000FFFFFF1F2C02000000000001000600C8F2EEE3EE3A
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      02000000000009000000CC00020000000000FFFFFF0000000002000000000000
      0000007B08000006004D656D6F31370002006003000004020000B60000001900
      000023000F00DC050000000000000000FFFFFF1F2C0204011400232323202323
      2320232323202323302E303020F00001000F005B464E5F49544F474F5F53554D
      4D5D00000000FFFF00000000000200000001000000000500417269616C000A00
      000002000000000009000000CC00020000000000FFFFFF000000000200000000
      00000000001609000006004D656D6F31310002004800000039020000CE030000
      110000000300000001000000000000000000FFFFFF1F2C02000000000001001C
      00F1F2F02E205B50414745235D20E8E7205B544F54414C50414745535D000000
      00FFFF00000000000200000001000000040500417269616C000A000000000000
      00000009000000CC00020000000000FFFFFF0000000002000000000000000000
      9A09000006004D656D6F313400020048000000280100001E0000002700000003
      000F00DC050000000000000000CCFFCC002C02000000000001000500B920EF2F
      EF00000000FFFF00000000000200000001000000000500417269616C000A0000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000230A000006004D656D6F343000020048000000940100001E00000014
      00000003000F0001000000000000000000FFFFFF1F2C02000000000002000700
      5B4C494E45235D0D000000000000FFFF00000000000200000001000000000500
      417269616C00080000000000000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000AE0A000006004D656D6F323100020066000000
      280100000D0100002700000003000F00DC050000000000000000CCFFCC002C02
      000000000001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF0000000000
      0200000001000000000500417269616C000A0000000200000000000A000000CC
      00020000000000FFFFFF0000000002000000000000000000350B000006004D65
      6D6F32330002007301000028010000400000002700000003000F00DC05000000
      0000000000CCFFCC002C02000000000001000800C5E42E20E8E7EC2E00000000
      FFFF00000000000200000001000000000500417269616C000A00000002000000
      00000A000000CC00020000000000FFFFFF0000000002000000000000000000BA
      0B000006004D656D6F32340002002E0300002801000032000000270000000300
      0F00DC050000000000000000CCFFCC002C02000000000001000600CAEEEB2DE2
      EE00000000FFFF00000000000200000001000000000500417269616C000A0000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000400C000006004D656D6F323500020060030000280100004D00000027
      00000003000F00DC050000000000000000CCFFCC002C02000000000001000700
      D6E5EDE02C20F000000000FFFF00000000000200000001000000000500417269
      616C000A0000000200000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000C70C000006004D656D6F3236000200AD030000280100
      00690000002700000003000F00DC050000000000000000CCFFCC002C02000000
      000001000800D1F3ECECE02C20F000000000FFFF000000000002000000010000
      00000500417269616C000A0000000200000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000680D000006004D656D6F3237000200
      66000000940100000D0100001400000003000F0001000000000000000000FFFF
      FF1F2C020000000000010022005B6F647350726968446F63506F4D6564696354
      7970652E224E414D454B415254225D00000000FFFF0000000000020000000100
      0000000500417269616C000800000000000000000008000000CC000200000000
      00FFFFFF0000000002000000000000000000090E000006004D656D6F32380002
      007301000094010000400000001400000003000F0001000000000000000000FF
      FFFF1F2C020000000000010022005B6F647350726968446F63506F4D65646963
      547970652E2246435F4544495A4D225D00000000FFFF00000000000200000001
      000000000500417269616C00080000000000000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000A80E000006004D656D6F323900
      02002E03000094010000320000001400000003000F0001000000000000000000
      FFFFFF1F2C020000000000010020005B6F647350726968446F63506F4D656469
      63547970652E2246435F4B4F4C225D00000000FFFF0000000000020000000100
      0000000500417269616C00080000000000000000000A000000CC000200000000
      00FFFFFF00000000020000000000000000005E0F000006004D656D6F33300002
      0060030000940100004D0000001400000003000F0001000000000000000000FF
      FFFF1F2C0204010E0023232320232323202323302E303000010029005B6F6473
      50726968446F63506F4D65646963547970652E22464E5F50524943455F444554
      41494C225D00000000FFFF00000000000200000001000000000500417269616C
      000800000000000000000009000000CC00020000000000FFFFFF000000000200
      0000000000000000AD10000006004D656D6F3331000200AD0300009401000069
      0000001400000003000F0001000000000000000000FFFFFF1F2C020401120023
      23232023232320232323202323302E303000010021005B6F647350726968446F
      63506F4D65646963547970652E22464E5F53554D4D225D000400050062656769
      6E0D45002020464E5F47524F55505F53554D4D203A3D20464E5F47524F55505F
      53554D4D202B205B6F647350726968446F63506F4D65646963547970652E2246
      4E5F53554D4D225D3B0D45002020464E5F49544F474F5F53554D4D203A3D2046
      4E5F49544F474F5F53554D4D202B205B6F647350726968446F63506F4D656469
      63547970652E22464E5F53554D4D225D3B0D0300656E6400FFFF000000000002
      00000001000000000500417269616C000800000000000000000009000000CC00
      020000000000FFFFFF00000000020000000000000000005011000005004D656D
      6F360002004800000090000000CE0300001B0000000300000001000000000000
      000000FFFFFF1F2C02000000000001002500CEF2F7E5F220EFEE20EFF0E8F5EE
      E4F320EFEE20E3F0F3EFEFE0EC20F3F7E5F2EDEEF1F2E800000000FFFF000000
      00000200000001000000000500417269616C000E000000020000000000020000
      00CC00020000000000FFFFFF0000000002000000000000000000F41100000500
      4D656D6F3700020048000000A8000000CE030000180000000300000001000000
      000000000000FFFFFF1F2C02000000000001002600E7E020EFE5F0E8EEE420F1
      205B7661725F64617465315D20EFEE205B7661725F64617465325D00000000FF
      FF00000000000200000001000000000500417269616C000C0000000200000000
      000A000000CC00020000000000FFFFFF00000000020000000000000000008912
      000005004D656D6F3800020048000000400000005E0200000E00000003000000
      01000000000000000000FFFFFF1F2C02000000000001001700EDE0E8ECE5EDEE
      E2E0EDE8E520F3F7F0E5E6E4E5EDE8FF00000000FFFF00000000000200000001
      000000000500417269616C000800000000000000000002000000010002000000
      0000FFFFFF00000000020000000000000000001513000005004D656D6F390002
      0048000000240000005E0200001C0000000300020001000000000000000000CC
      FFCC002C02000000000001000E005B7661725F72656365697665725D00000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      0000120000000100020000000000FFFFFF0000000002000000000000000000A2
      13000006004D656D6F313300020048000000550000005E020000190000000300
      020001000000000000000000CCFFCC002C02000000000001000E005B7661725F
      6D6F5F67726F75705D00000000FFFF0000000000020000000100000000050041
      7269616C000C00000000000000000012000000CC00020000000000FFFFFF0000
      0000020000000000000000003B14000006004D656D6F3136000200480000006F
      0000005E0200000E0000000300000001000000000000000000FFFFFF1F2C0200
      0000000001001A00EDE0E8ECE5EDEEE2E0EDE8E520EFEEE4F0E0E7E4E5EBE5ED
      E8FF00000000FFFF00000000000200000001000000000500417269616C000800
      000000000000000002000000CC00020000000000FFFFFF000000000200000000
      0000000000F014000006004D656D6F313200020048000000C601000018030000
      140000000300090002000000000000000000FFFFFF1F2C020000000000010036
      00C8F2EEE3EE20EFEE20F2E8EFF320225B6F647350726968446F63506F4D6564
      6963547970652E2246435F6D6564696374797065225D2200000000FFFF000000
      00000200000001000000000500417269616C000A000000020000000000090000
      00CC00020000000000FFFFFF0000000002000000000000000000901500000600
      4D656D6F313800020060030000C6010000B60000001400000003000F00020000
      00000000000000FFFFFF1F2C0204011200232323202323232023232320232330
      2E30300001000F005B464E5F47524F55505F53554D4D5D00000000FFFF000000
      00000200000001000000000500417269616C000A000000020000000000090000
      00CC00020000000000FFFFFF0000000002000000000000000000351600000500
      4D656D6F310002006600000064010000B00300001400000003000F0002000000
      000000000000CCFFFF002C02000000000001002700205B6F647350726968446F
      63506F4D65646963547970652E2246435F6D6564696374797065225D00000000
      FFFF00000000000200000001000000000500417269616C000900000002000000
      0000080000000100020000000000FFFFFF0000000002000000000000000000B6
      16000005004D656D6F3500020048000000640100001E0000001400000003000F
      0002000000000000000000CCFFFF002C020000000000020000000D0000000000
      00FFFF00000000000200000001000000000500417269616C0008000000000000
      0000000A000000CC00020000000000FFFFFF000000000200000000000000FEFE
      FF020000000A002043617465676F72793100000000040073756D6D0001003000
      0000000000000000FC0000000000000000000000000000000058008DF9BA39ED
      D2E24076366E8DED4EE440}
  end
  object odsPrihDocPoMedicType: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  MASTER1.*, DETAIL1.*,'
      
        '  rtrim(TO_CHAR(DETAIL1.FN_KOL, '#39'FM999G999G990D99999'#39'),'#39'.,'#39') as ' +
        'FC_KOL'
      ''
      '  FROM'
      '    (SELECT'
      '       FN_PRICE AS FN_PRICE_MASTER,'
      
        '       :pADATA1 AS D1, :pADATA2 AS D2,FP_VIDMOVE,TDOCS.POSTAVID,' +
        ' MOTOID, MOFROMID, TDOCS.FC_COMMENT, FP_VID, '
      '       MOOWNERID, TDOCS.DPID,'
      
        '--   '#39#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#8470' '#39'||FC_DOC||'#39' '#1086#1090' '#39'||to_char(FD_INVOICE,'#39'dd.mm.y' +
        'yyy'#39') AS FC_DOC, '
      
        '       med.GET_DECODEDOCVIDMOVE(fp_vidmove)||'#39' '#8470' '#39'||TDOCS.fc_doc' +
        '||'#39' '#1086#1090' '#39'||to_char(TDOCS.fd_invoice,'#39'dd.mm.yyyy'#39')||DECODE(:IS_KON' +
        'TRAKT_SHOW, 0,'#39#39', DECODE(TDOCS.FC_KONTRAKT, null,'#39#39', '#39', '#1082#1086#1085#1090#1088#1072#1082#1090 +
        ': '#39'||TDOCS.FC_KONTRAKT)) AS fc_DOC,'
      '       TRUNC(TDOCS.FD_DATA) AS DATA,'
      '       TDOCS.FD_INVOICE,'
      '-- TMO.FC_NAME, '
      
        '       decode(NVL(TMO.FC_NAME,'#39#39'),'#39#39', MOGR_TO.fc_group, MOGR_TO.' +
        'fc_group ||'#39'('#39'|| TMO.FC_NAME||'#39')'#39') AS FC_NAME,'
      
        '       DECODE(TDOCS.fp_vidmove, 7, '#39#1057#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086' '#1074' '#1056 +
        #1055#1054#39', 8, '#39#1057#1087#1080#1089#1072#1085#1080#1077#39', MOGR_TO.fc_group) as FC_MO_GR_TO,'
      
        '--       DECODE(TDOCS.FP_VID,1,TPOSTAV.FC_NAME,2,decode(NVL(T2.F' +
        'C_NAME,'#39#39'),'#39#39', MOGR_FROM.fc_group, MOGR_FROM.fc_group ||'#39'('#39'|| T2' +
        '.FC_NAME||'#39')'#39')) AS NAMEPOSTAV,'
      
        '       DECODE(TDOCS.FP_VIDMOVE, 1,TPOSTAV.FC_NAME, 9, '#39#1042#1074#1086#1076' '#1086#1089#1090#1072 +
        #1090#1082#1086#1074#39', 2,MOGR_FROM.fc_group, 3,MOGR_FROM.fc_group, 6, MOGR_FROM.' +
        'fc_group||'#39' ('#1074#1086#1079#1074#1088#1072#1090')'#39', 10,MED.PKGTMO.getnamebyid( MED.PKG_MEDSE' +
        'S.GET_PRODUCE_MO ), '#39#39' ) AS NAMEPOSTAV,'
      
        '--       DECODE(TDOCS.fp_vidmove, 1,TPOSTAV.FC_NAME, 9,'#39#1042#1074#1086#1076' '#1086#1089#1090 +
        #1072#1090#1082#1086#1074#39'/*MED.PKG_MEDSES.GET_MOGROUP_NAME( TDOCS.fk_mogroupid_to)*' +
        '/, 10,MED.PKGTMO.getnamebyid( MED.PKG_MEDSES.GET_PRODUCE_MO ), '#39 +
        #39' ) AS NAMEPOSTAV,'
      '       MED.GET_DECODEDOCVID(FP_VIDMOVE) AS VIDDOC'
      
        '       FROM MED.TDOCS, MED.TMO, MED.TPOSTAV, MED.TMO T2 , MED.TM' +
        'O_GROUP MOGR_FROM,  MED.TMO_GROUP MOGR_TO'
      
        '     WHERE :MO_GROUP = TDOCS.fk_mogroupid_to -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084' '#1085 +
        #1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      '  AND  TDOCS.MOTOID = TMO.MOID(+)'
      '--  AND TDOCS.FP_VID IN (1,3) '
      '--  AND TDOCS.FP_VIDMOVE IN (1,5,6)'
      
        '  AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  TDOCS' +
        '.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to, :MO' +
        '_GROUP) = +1'
      
        '  AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087#1086#1089#1082#1086#1083#1100#1082#1091' '#1074 +
        #1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085#1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086#1076'+'#1088#1072#1089#1093#1086#1076 +
        ')'
      '  AND (not tdocs.fp_vidmove in (4,5))'
      '  AND ((:IS_RPO = 1)OR(tdocs.fp_vidmove <> 10))'
      '  AND TDOCS.FL_EDIT = 0 '
      
        '  AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC (:pADATA1) AND TRUNC (:' +
        'pADATA2)'
      '  AND TDOCS.POSTAVID=TPOSTAV.POSTAVID (+)'
      '--  AND TMO.MOID=:AMOID'
      '  AND TDOCS.MOFROMID = T2.MOID (+)'
      '  AND TDOCS.fk_mogroupid_from = MOGR_FROM.groupid (+)'
      '  AND TDOCS.fk_mogroupid_to = MOGR_TO.groupid (+)'
      '     ORDER BY DATA DESC'
      '    ) MASTER1,'
      '    (SELECT '
      '          TDPC.DPID,'
      '          TDPC.DPCID,'
      '          TKART.MEDICID,'
      '          TDPC.FN_KOL,'
      '          TDPC.FN_KOL*TKART.FN_PRICE as FN_SUMM,'
      '--          FN_SUMM,'
      
        '--          DECODE(FN_KOL,0,0,ROUND(FN_SUMM / FN_KOL,2)) AS FN_P' +
        'RICE_DETAIL,'
      '          TKART.FN_PRICE AS FN_PRICE_DETAIL,'
      ''
      '          TKART.KARTID,'
      '          TMEDIC.FC_NAME as MEDICNAME,'
      
        '          TMEDIC.FC_NAME ||'#39'( '#1087'. '#8470#39'||TKART.FN_PARTY_NUM||'#39')'#39' AS ' +
        'NAMEKART,'
      '          TKART.FC_SERIAL,'
      '          TKART.FN_PARTY_NUM,'
      '          TEI.FC_NAME AS FC_EDIZM,'
      '          FS.FC_NAME FC_FINSOURCE,'
      '--          tmedictype.fc_name as FC_medictype'
      '          UG.root_fc_uchgr as FC_medictype'
      '        FROM'
      '          MED.TDPC, MED.TKART, MED.TMEDIC, MED.TEI, MED.TDOCS, '
      
        '          (select connect_by_root fc_uchgr as root_fc_uchgr, con' +
        'nect_by_root uchgrid as root_uchgrid, t.* from med.tuchgr t conn' +
        'ect by prior uchgrid = parentid start with parentid = 0) UG, MED' +
        '.TFINSOURCE FS --med.tmedictype'
      '        WHERE'
      '          TDPC.KARTID = TKART.KARTID'
      '          AND TKART.FL_DEL = 0'
      '          AND TKART.MEDICID=TMEDIC.MEDICID'
      '          AND TEI.EIID(+)=TMEDIC.EIID'
      '          AND TKART.FK_FINSOURCE_ID = FS.FK_ID (+)'
      '          AND TDPC.DPID = TDOCS.DPID'
      
        '          and :MO_GROUP = TDOCS.fk_mogroupid_to -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077 +
        #1084' '#1085#1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '          AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID' +
        ',  TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid' +
        '_to, :MO_GROUP) = +1'
      '          AND TDOCS.FL_EDIT = 0 '
      
        '          AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC (:pADATA1) AND ' +
        'TRUNC (:pADATA2)'
      '--          AND TMEDIC.FL_VISIBLE = 1            '
      '--          AND TMEDIC.fk_type = tmedictype.fk_id(+)'
      '          AND #uchgrid# = ug.uchgrid'
      
        '          and ((:pUCHGR = -1)or #uchgrid# in (select uchgrid fro' +
        'm med.tuchgr connect by prior uchgrid = parentid start with uchg' +
        'rid = :pUCHGR))'
      '        ORDER BY TDPC.DPCID'
      '       '
      '    ) DETAIL1'
      '  WHERE '
      '  MASTER1.DPID = DETAIL1.DPID'
      
        '  ORDER BY UPPER(FC_medictype), LOWER(MEDICNAME), MASTER1.NAMEPO' +
        'STAV, MASTER1.DATA, FN_PARTY_NUM')
    Optimize = False
    Variables.Data = {
      0300000006000000080000003A504144415441310C0000000700000078710101
      01010100000000080000003A504144415441320C0000000700000078710C1F01
      010100000000090000003A4D4F5F47524F555003000000040000009D04000000
      000000070000003A5055434847520300000004000000FFFFFFFF000000000700
      00003A49535F52504F03000000040000000000000000000000110000003A4953
      5F4B4F4E5452414B545F53484F5703000000040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000020000000040000004450494401000000000002000000443101000000
      00000200000044320100000000000A00000046505F5649444D4F564501000000
      000008000000504F535441564944010000000000060000004D4F544F49440100
      00000000080000004D4F46524F4D49440100000000000A00000046435F434F4D
      4D454E540100000000000600000046505F564944010000000000090000004D4F
      4F574E455249440100000000000600000046435F444F43010000000000040000
      00444154410100000000000700000046435F4E414D450100000000000A000000
      4E414D45504F5354415601000000000006000000564944444F43010000000000
      06000000445049445F3101000000000005000000445043494401000000000007
      0000004D45444943494401000000000006000000464E5F4B4F4C010000000000
      07000000464E5F53554D4D010000000000060000004B41525449440100000000
      00080000004E414D454B4152540100000000000900000046435F53455249414C
      0100000000000F000000464E5F50524943455F4D41535445520100000000000F
      000000464E5F50524943455F44455441494C0100000000000A00000046445F49
      4E564F4943450100000000000B00000046435F4D4F5F47525F544F0100000000
      00090000004D454449434E414D450100000000000C000000464E5F5041525459
      5F4E554D0100000000000800000046435F4544495A4D0100000000000C000000
      46435F4D45444943545950450100000000000600000046435F4B4F4C01000000
      0000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 141
    Top = 364
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
      04000000050000000B000000464E5F4E414348454E4B410100000000000A0000
      00464E5F554348454E4B410100000000000700000046445F4441544101000000
      00000700000046435F4E414D4501000000000009000000464E5F4E554D424552
      010000000000}
    Cursor = crSQLWait
    Session = os
    Filter = 'FN_NACHENKA > 0'
    Filtered = True
    Left = 258
    Top = 386
  end
  object frDBNacenkaUcenka: TfrDBDataSet
    DataSet = odsNacenkaUcenka
    Left = 257
    Top = 433
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
    Left = 420
    Top = 81
  end
  object oqInitMO: TOracleQuery
    SQL.Strings = (
      'begin'
      '  SELECT NVL(MAX(MOID),-1) into :nMOID FROM'
      
        '   (SELECT MOID FROM MED.TMO T WHERE T.FK_SOTRID IN (SELECT logi' +
        'n.GET_SOTRID(:pAppSotrID) FROM DUAL));'
      
        '  SELECT fk_curmogroupid into :nMO_GROUP FROM med.tmo where moid' +
        ' = :nMOID;'
      ''
      '  med.pkg_medses.set_curmo(:nMOID);'
      '  med.pkg_medses.set_curmo_group(:nMO_GROUP);'
      '  med.pkg_medses.ResetDatePeriod;'
      ''
      
        '  select MAX(m.FK_SKLAD_ID), NVL(MAX(m.fl_treb),0) into :PFK_SKL' +
        'AD_ID, :PFL_Provizor from med.tmo m where m.MOID = :nMOID;'
      '  '
      '  if :PFK_SKLAD_ID is null then'
      
        '    select NVL(MAX(mg.FK_SKLAD_ID),-1) into :PFK_SKLAD_ID from m' +
        'ed.tmo_group mg where mg.GROUPID = :nMO_GROUP;'
      '  end if;'
      '  :PFK_SKLAD_ID := NVL(:PFK_SKLAD_ID,-1);'
      
        '  :PFUNC_SHOW_KONTRAKT := TO_NUMBER(asu.PKG_SMINI.READSTRING( '#39'm' +
        'edica.exe'#39', '#39'FUNC_SHOW_KONTRAKT'#39', '#39'1'#39'));'
      '  :pSYSDATE := sysdate;'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      03000000070000000B0000003A50415050534F54524944030000000000000000
      000000060000003A4E4D4F4944030000000400000074030000000000000A0000
      003A4E4D4F5F47524F5550030000000400000000000000000000000D0000003A
      50464B5F534B4C41445F4944030000000400000001000000000000000D000000
      3A50464C5F50524F56495A4F5203000000040000000100000000000000140000
      003A5046554E435F53484F575F4B4F4E5452414B540300000004000000010000
      0000000000090000003A50535953444154450C00000007000000786D06190D1B
      0800000000}
    Left = 24
    Top = 268
  end
  object pmUchGr: TPopupMenu
    Tag = -1
    Left = 420
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
  object JvAppIniFileStorage1: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    AutoFlush = True
    AutoReload = True
    FileName = 'prPrihBuh.exe.ini'
    SubStorages = <>
    Left = 20
    Top = 398
  end
  object dsGrid: TDataSource
    DataSet = odsPrihApteka
    Left = 572
    Top = 434
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
    Left = 738
    Top = 282
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    Left = 740
    Top = 342
  end
  object pmDocsFilterPeriod: TPopupMenu
    OnChange = pmDocsFilterPeriodChange
    Left = 10
    Top = 96
    object miPeriodCurMonth: TMenuItem
      Caption = #1058#1077#1082'. '#1084#1077#1089#1103#1094
      OnClick = miPeriodCurMonthClick
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N20: TMenuItem
      Tag = 1
      Caption = #1071#1085#1074#1072#1088#1100
      OnClick = miPeriodCurMonthClick
    end
    object N18: TMenuItem
      Tag = 2
      Caption = #1060#1077#1074#1088#1072#1083#1100
      OnClick = miPeriodCurMonthClick
    end
    object N16: TMenuItem
      Tag = 3
      Caption = #1052#1072#1088#1090
      OnClick = miPeriodCurMonthClick
    end
    object N17: TMenuItem
      Tag = 4
      Caption = #1040#1087#1088#1077#1083#1100
      OnClick = miPeriodCurMonthClick
    end
    object N15: TMenuItem
      Tag = 5
      Caption = #1052#1072#1081
      OnClick = miPeriodCurMonthClick
    end
    object N1: TMenuItem
      Tag = 6
      Caption = #1048#1102#1085#1100
      OnClick = miPeriodCurMonthClick
    end
    object N3: TMenuItem
      Tag = 7
      Caption = #1048#1102#1083#1100
      OnClick = miPeriodCurMonthClick
    end
    object N4: TMenuItem
      Tag = 8
      Caption = #1040#1074#1075#1091#1089#1090
      OnClick = miPeriodCurMonthClick
    end
    object N5: TMenuItem
      Tag = 9
      Caption = #1057#1077#1085#1090#1103#1073#1088#1100
      OnClick = miPeriodCurMonthClick
    end
    object N6: TMenuItem
      Tag = 10
      Caption = #1054#1082#1090#1103#1073#1088#1100
      OnClick = miPeriodCurMonthClick
    end
    object N7: TMenuItem
      Tag = 11
      Caption = #1053#1086#1103#1073#1088#1100
      OnClick = miPeriodCurMonthClick
    end
    object N8: TMenuItem
      Tag = 12
      Caption = #1044#1077#1082#1072#1073#1088#1100
      OnClick = miPeriodCurMonthClick
    end
  end
  object odsPrihPost: TOracleDataSet
    SQL.Strings = (
      
        'SELECT a.Rang,a.fc_rang, a.NAMEPOSTAV, sum(k.fn_price*dp.fn_kol)' +
        ' as FN_PRICE FROM'
      '(SELECT'
      
        '       --(select sum(k.fn_price*dp.fn_kol) as FN_PRICE from med.' +
        'tdpc dp, med.tkart k where dp.dpid = TDOCS.DPID and dp.kartid = ' +
        'k.kartid) as FN_PRICE,'
      '       TDOCS.DPID,'
      
        '       DECODE(TDOCS.fp_vidmove, 1,1, 9,2, 10,3, 6,4, 255) as Ran' +
        'g,'
      
        '       DECODE(TDOCS.fp_vidmove, 1,'#39#1085#1072#1082#1083#1072#1076#1085#1099#1084#39', 9,'#39#1072#1082#1090#1072#1084' '#1074#1074#1086#1076#1072' '#1086#1089 +
        #1090#1072#1090#1082#1086#1074#39', 10,'#39#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1091' '#1074' '#1056#1055#1054#39', 6,'#39#1074#1086#1079#1074#1088#1072#1090#1091#39', '#39#39') as FC_Rang,'
      
        '       DECODE(TDOCS.FP_VIDMOVE, 1,TPOSTAV.FC_NAME, 9, '#39#1042#1074#1086#1076' '#1086#1089#1090#1072 +
        #1090#1082#1086#1074#39', 2,MOGR_FROM.fc_group, 3,MOGR_FROM.fc_group, 6, MOGR_FROM.' +
        'fc_group||'#39' ('#1074#1086#1079#1074#1088#1072#1090')'#39', 10,MED.PKGTMO.getnamebyid( MED.PKG_MEDSE' +
        'S.GET_PRODUCE_MO ), '#39#39' ) AS NAMEPOSTAV'
      '       FROM MED.TDOCS, MED.TPOSTAV, MED.TMO_GROUP MOGR_FROM'
      '            '
      
        'WHERE  :MO_GROUP = TDOCS.fk_mogroupid_to -- '#1089#1088#1072#1079#1091#1086#1090#1089#1077#1082#1072#1077#1084#1085#1077#1085#1091#1078#1085#1099 +
        #1077#1079#1072#1087#1080#1089#1080
      
        '  AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  TDOCS' +
        '.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to, :MO' +
        '_GROUP) = +1'
      
        '  AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077#1074#1086#1079#1074#1088#1072#1090#1072'- '#1087#1086#1089#1082#1086#1083#1100#1082#1091#1074#1086#1079#1074 +
        #1088#1072#1090#1084#1086#1078#1085#1086#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100#1090#1086#1083#1100#1082#1086#1074#1076#1074#1080#1078#1077#1085#1080#1080'('#1082#1086#1075#1076#1072#1087#1088#1080#1093#1086#1076'+'#1088#1072#1089#1093#1086#1076')'
      '  AND (not tdocs.fp_vidmove in (4,5))'
      '  AND ((:IS_RPO = 1)OR(tdocs.fp_vidmove <> 10))'
      '  AND TDOCS.FL_EDIT = 0 '
      
        '  AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:ADATA1) AND TRUNC(:ADA' +
        'TA2)'
      '  AND TDOCS.POSTAVID=TPOSTAV.POSTAVID (+)'
      '  AND TDOCS.fk_mogroupid_from = MOGR_FROM.groupid (+)'
      ') A,'
      'med.tdpc dp, med.tkart k'
      'where'
      '  dp.dpid = a.DPID and dp.kartid = k.kartid '
      'GROUP BY a.Rang, a.FC_RANG, A.NAMEPOSTAV'
      ''
      'ORDER BY a.Rang,  UPPER(A.NAMEPOSTAV)')
    Optimize = False
    Variables.Data = {
      0300000004000000070000003A4144415441310C000000000000000000000007
      0000003A4144415441320C0000000000000000000000090000003A4D4F5F4752
      4F5550030000000000000000000000070000003A49535F52504F030000000400
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000008000000464E5F50524943450100000000000A0000004E41
      4D45504F535441560100000000000400000052414E4701000000000007000000
      46435F52414E47010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 254
    Top = 286
  end
  object sd: TSaveDialog
    DefaultExt = 'xls'
    FileName = #1057#1087#1080#1089#1086#1082' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074'.xls'
    Filter = 'Excel Files (*.xls)|*.xls'
    Left = 484
    Top = 37
  end
  object odsPrihDocPoOneMedic: TOracleDataSet
    SQL.Strings = (
      '-- '#1087#1088#1080#1093#1086#1076
      'SELECT'
      
        '  TO_CHAR(MASTER_RANG.FN_ORDER)||'#39'. '#39'||MASTER1.FC_RANG as FC_RAN' +
        'G_ORDER,'
      '  MASTER1.FC_DOC as FC_DOC_SUMM, '
      '  MASTER1.NAMEPOSTAV as FC_NAMEPOSTAV_SUMM,'
      '  MASTER1.*,'
      '  DETAIL1.*,'
      
        '  rtrim(TO_CHAR(DETAIL1.FN_KOL, '#39'FM999G999G990D99999'#39'),'#39'.,'#39') as ' +
        'FC_KOL'
      '  '
      '  FROM'
      '    (SELECT'
      '       FN_PRICE AS FN_PRICE_MASTER,'
      '       TDOCS.FN_Rang,'
      
        '       DECODE(TDOCS.FN_RANG, 1,'#39#1055#1086#1089#1090#1072#1074#1097#1080#1082#1080#39', 2,'#39#1054#1090#1076#1077#1083#1077#1085#1080#1103#39',3,'#39#1054#1090 +
        #1076#1077#1083#1077#1085#1080#1103#39', 4,'#39#1054#1089#1090#1072#1090#1082#1080#39', 5,'#39#1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086#39', 6,'#39#1042#1086#1079#1074#1088#1072#1090#39', 7,'#39#1048#1079' '#1088#1077#1079#1077 +
        #1088#1074#1072#39', '#39#1055#1088#1080#1093#1086#1076#39') as FC_RANG,'
      '       FP_VIDMOVE,TDOCS.POSTAVID, TDOCS.FC_COMMENT, FP_VID, '
      '       MOOWNERID, TDOCS.DPID,'
      
        '       med.GET_DECODEDOCVIDMOVE(fp_vidmove)||'#39' '#8470' '#39'||TDOCS.fc_doc' +
        '||'#39' '#1086#1090' '#39'||to_char(TDOCS.fd_invoice,'#39'dd.mm.yyyy'#39') AS fc_DOC,'
      '       TRUNC(TDOCS.FD_DATA) AS DATA,'
      '       TDOCS.FD_INVOICE,'
      
        '       MED.PKGTDOCS.GET_DOC_SOURCE (TDOCS.fp_vid, TDOCS.fp_vidmo' +
        've, TDOCS.fk_mogroupid_FROM, TDOCS.postavid) as NAMEPOSTAV'
      
        '       FROM (SELECT TDOCS.*, DECODE(TDOCS.fp_vidmove, 1,1, 2,2, ' +
        '3,3, 9,4, 10,5, 6,6, 5,7, 255) as FN_Rang FROM MED.TDOCS) TDOCS ' +
        '--, MED.TMO, MED.TPOSTAV, MED.TMO T2 , MED.TMO_GROUP MOGR_FROM, ' +
        ' MED.TMO_GROUP MOGR_TO'
      
        '     WHERE :MO_GROUP = TDOCS.fk_mogroupid_to -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084' '#1085 +
        #1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '  AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  TDOCS' +
        '.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to, :MO' +
        '_GROUP) = +1'
      '  AND TDOCS.FL_EDIT = 0 '
      
        '  AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087#1086#1089#1082#1086#1083#1100#1082#1091' '#1074 +
        #1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085#1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086#1076'+'#1088#1072#1089#1093#1086#1076 +
        ')'
      '  AND (not tdocs.fp_vidmove in (4,5))'
      '  AND ((:IS_RPO = 1)OR(tdocs.fp_vidmove <> 10))'
      
        '  AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC (:pADATA1) AND TRUNC (:' +
        'pADATA2)'
      '    ) MASTER1,'
      ''
      '    (SELECT ROWNUM as FN_ORDER, RANG.* FROM'
      '     (SELECT'
      '       DISTINCT'
      '       TDOCS.FN_RANG'
      
        '     FROM   (SELECT TDOCS.*, DECODE(TDOCS.fp_vidmove, 1,1, 2,2, ' +
        '3,3, 9,4, 10,5, 6,6, 5,7, 255) as FN_Rang FROM MED.TDOCS) TDOCS ' +
        '--, MED.TMO, MED.TMO T2, MED.TMO_GROUP MOGR_FROM,  MED.TMO_GROUP' +
        ' MOGR_TO'
      
        '     WHERE TDOCS.fk_mogroupid_to = :MO_GROUP -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084' '#1085 +
        #1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '       AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(TO_DATE(:pADATA1))' +
        ' AND TRUNC(TO_DATE(:pADATA2))'
      
        '       AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  ' +
        'TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to' +
        ', :MO_GROUP) = +1'
      
        '       AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087#1086#1089#1082#1086#1083 +
        #1100#1082#1091' '#1074#1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085#1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086#1076'+'#1088 +
        #1072#1089#1093#1086#1076')'
      '       AND (not tdocs.fp_vidmove in (4,5))'
      '       AND TDOCS.FL_EDIT = 0  '
      '     ORDER BY TDOCS.FN_RANG'
      '    ) RANG) MASTER_RANG,     '
      '    '
      '    (SELECT '
      '          TDPC.DPID,'
      '          TDPC.DPCID,'
      '          TKART.MEDICID,'
      '          TDPC.FN_KOL,'
      '          TDPC.FN_KOL*TKART.FN_PRICE as FN_SUMM,'
      '          TKART.FN_PRICE AS FN_PRICE_DETAIL,'
      ''
      '          TKART.KARTID,'
      
        '          TMEDIC.FC_NAME ||'#39'( '#1087'. '#8470#39'||TKART.FN_PARTY_NUM||'#39')'#39' AS ' +
        'NAMEKART,'
      '          TKART.FC_SERIAL,'
      '          TEI.FC_NAME AS FC_EDIZM,'
      '          FS.FC_NAME as FC_finsource'
      '        FROM'
      
        '          MED.TDPC, MED.TKART, MED.TFINSOURCE FS, MED.TMEDIC, ME' +
        'D.TEI'
      '        WHERE'
      '          TDPC.KARTID = TKART.KARTID'
      '          AND TKART.FL_DEL = 0'
      '          AND TKART.MEDICID=TMEDIC.MEDICID'
      '          AND TKART.fk_finsource_id = fs.fk_id(+)'
      '          AND TMEDIC.MEDICID = :pMEDICID'
      '          AND TEI.EIID=TMEDIC.EIID'
      '          AND DPID IN (SELECT TDOCS.DPID'
      '                       FROM MED.TDOCS '
      
        '                       WHERE :MO_GROUP = TDOCS.fk_mogroupid_to -' +
        '- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084' '#1085#1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '                         AND MED.PKG_PRIHRASH.Get_PrihRashPrizna' +
        'k (TDOCS.FP_VID,  TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDO' +
        'CS.fk_mogroupid_to, :MO_GROUP) = +1'
      '                         AND TDOCS.FL_EDIT = 0 '
      
        '                         AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077 +
        ' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087#1086#1089#1082#1086#1083#1100#1082#1091' '#1074#1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085 +
        #1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086#1076'+'#1088#1072#1089#1093#1086#1076')'
      '                         AND (not tdocs.fp_vidmove in (4,5))'
      
        '                         AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC ' +
        '(:pADATA1) AND TRUNC (:pADATA2)'
      '                      )'
      '    ) DETAIL1'
      'WHERE DETAIL1.DPID = MASTER1.DPID'
      ''
      '   AND MASTER1.FN_RANG = MASTER_RANG.FN_RANG(+)'
      
        'ORDER BY MASTER1.FN_RANG, UPPER(MASTER1.NAMEPOSTAV), MASTER1.DAT' +
        'A ')
    Optimize = False
    Variables.Data = {
      0300000005000000080000003A504144415441310C0000000000000000000000
      080000003A504144415441320C0000000000000000000000090000003A4D4F5F
      47524F5550030000000000000000000000070000003A49535F52504F03000000
      040000000000000000000000090000003A504D45444943494403000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001C00000004000000445049440100000000000A00000046505F564944
      4D4F564501000000000008000000504F5354415649440100000000000A000000
      46435F434F4D4D454E540100000000000600000046505F564944010000000000
      090000004D4F4F574E455249440100000000000600000046435F444F43010000
      00000004000000444154410100000000000A0000004E414D45504F5354415601
      000000000006000000445049445F310100000000000500000044504349440100
      00000000070000004D45444943494401000000000006000000464E5F4B4F4C01
      000000000007000000464E5F53554D4D010000000000060000004B4152544944
      010000000000080000004E414D454B4152540100000000000900000046435F53
      455249414C0100000000000F000000464E5F50524943455F4D41535445520100
      000000000F000000464E5F50524943455F44455441494C010000000000080000
      0046435F4544495A4D0100000000000B00000046435F444F435F53554D4D0100
      000000001200000046435F4E414D45504F535441565F53554D4D010000000000
      0700000046435F52414E470100000000000D00000046435F52414E475F4F5244
      455201000000000007000000464E5F52414E470100000000000A00000046445F
      494E564F4943450100000000000600000046435F4B4F4C0100000000000C0000
      0046435F46494E534F55524345010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 423
    Top = 146
  end
  object odsTMedic: TOracleDataSet
    SQL.Strings = (
      'select m.* from med.v$tmedic m order by m.fc_name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000001C0000000700000046435F4E414D4501000000000004000000454949
      44010000000000080000004641524D4752494401000000000007000000554348
      47524944010000000000070000004D454449434944010000000000070000004C
      4556454C49440100000000000A00000046435F434F4D4D454E54010000000000
      06000000464C5F504B550100000000000C000000464B5F4E4F4D454E5F524C53
      0100000000000A00000046435F45414E434F444501000000000007000000464B
      5F545950450100000000000A000000464B5F504159545950450100000000000F
      000000464E5F465041434B494E555041434B0100000000000A000000464B5F46
      5041434B494401000000000007000000464E5F4D4153530100000000000C0000
      00464B5F4D415353554E4954530100000000000B00000046435F4E414D455F4C
      415401000000000008000000464C5F4C474F54410100000000000A000000464C
      5F56495349424C4501000000000011000000464C5F5052494E545F4C41545F4E
      414D4501000000000008000000464B5F504841524D0100000000000900000046
      41524D4752494432010000000000090000004641524D47524944330100000000
      001500000046435F494E5445524E4154494F4E414C5F4E414D45010000000000
      19000000464C5F56495349424C455F464F525F4E4F545F415054454B41010000
      0000000B000000464B5F534B4C41445F49440100000000000C000000464C5F45
      515549504D454E5401000000000009000000464B5F544954454D530100000000
      00}
    Session = os
    Left = 716
    Top = 28
  end
  object dsTMedic: TDataSource
    DataSet = odsTMedic
    Left = 716
    Top = 80
  end
  object frPrihDocPoOneMedic: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 422
    Top = 194
    ReportForm = {
      1900000046170000190000FFFF01000100FFFFFFFFFF09000000340800009A0B
      00002400000024000000240000002400000000FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000024000000F6020000D10000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E48656164657231000201000000005C010000F60200001F00000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200400200000B004D6173746572446174613100020100000000C8010000F602
      0000140000003100050001000000000000000000FFFFFF1F000000000C006672
      444244617461536574310000000004000500626567696E0D3E002020464E5F41
      4C4C5F4B4F4C20203A3D20464E5F414C4C5F4B4F4C202B205B6F647350726968
      446F63506F4F6E654D656469632E22464E5F4B4F4C225D3B0D40002020464E5F
      414C4C5F53554D4D203A3D20464E5F414C4C5F53554D4D202B205B6F64735072
      6968446F63506F4F6E654D656469632E22464E5F53554D4D225D3B0D0300656E
      6400FFFF000000000002000000010000000000000001000000C8000000140000
      00010000000000000200AB0200000B0050616765466F6F746572310002010000
      000054020000F6020000190000003000030001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200180300000D004D61737465
      72466F6F746572310002010000000020020000F6020000120000003100060001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200A40300000C0047726F75704865616465723100020100000000A4010000F6
      020000140000003000100001000000000000000000FFFFFF1F0000000020005B
      6F647350726968446F63506F4D656469632E224E414D45504F53544156225D00
      000000000000FFFF000000000002000000010000000000000001000000C80000
      0014000000010000000000000200100400000C0047726F7570466F6F74657231
      00020100000000F4010000F60200001400000030001100010000000000000000
      00FFFFFF1F00000000000000000000000000FFFF000000000002000000010000
      000000000001000000C800000014000000010000000000000000960400000500
      4D656D6F320002004A0000005C010000920000001E00000003000F00DC050000
      000000000000CCFFCC002C02000000000001000800C4EEEAF3ECE5EDF2000000
      00FFFF00000000000200000001000000000500417269616C0009000000020000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      2705000005004D656D6F33000200DC0000005C010000750000001E0000000300
      0F00DC050000000000000000CCFFCC002C02000000000001001300C8F1F22E20
      F4E8EDE0EDF1E8F0EEE2E0EDE8FF00000000FFFF000000000002000000010000
      00000500417269616C00090000000200000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000C505000006004D656D6F3431000200
      4A000000C8010000920000001400000003000F0001000000000000000000FFFF
      FF1F2C02000000000001001F005B6F647350726968446F63506F4F6E654D6564
      69632E2246435F444F43225D00000000FFFF0000000000020000000100000000
      0500417269616C00080000000000000000000A000000CC00020000000000FFFF
      FF00000000020000000000000000006906000006004D656D6F3433000200DC00
      0000C8010000750000001400000003000F0001000000000000000000FFFFFF1F
      2C020000000000010025005B6F647350726968446F63506F4F6E654D65646963
      2E2246435F46494E534F55524345225D00000000FFFF00000000000200000001
      000000000500417269616C000800000000000000000008000000CC0002000000
      0000FFFFFF00000000020000000000000000000407000006004D656D6F313300
      02002400000056020000AE020000140000000300000001000000000000000000
      FFFFFF1F2C02000000000001001C00F1F2F02E205B50414745235D20E8E7205B
      544F54414C50414745535D00000000FFFF000000000002000000010000000405
      00417269616C000A00000000000000000009000000CC00020000000000FFFFFF
      00000000020000000000000000008907000006004D656D6F3135000200240000
      0020020000C30100001100000003000F00DC050000000000000000FFFFFF1F2C
      02000000000001000600C8F2EEE3EE3A00000000FFFF00000000000200000001
      000000000500417269616C000A00000002000000000009000000CC0002000000
      0000FFFFFF00000000020000000000000000002508000006004D656D6F313700
      02006E02000020020000630000001100000023000F00DC050000000000000000
      FFFFFF1F2C020301100023232320232323202323302E303020F00001000D005B
      464E5F414C4C5F53554D4D5D00000000FFFF0000000000020000000100000000
      0500417269616C000C00000002000000000009000000CC00020000000000FFFF
      FF0000000002000000000000000000A908000006004D656D6F31310002002400
      00005C010000260000001E00000003000F00DC050000000000000000CCFFCC00
      2C02000000000001000500B920EF2FEF00000000FFFF00000000000200000001
      000000000500417269616C00090000000200000000000A000000CC0002000000
      0000FFFFFF00000000020000000000000000003009000006004D656D6F343000
      020024000000C8010000260000001400000003000F0001000000000000000000
      FFFFFF1F2C020000000000010008005B4C494E45235D2900000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000090000
      00CC00020000000000FFFFFF0000000002000000000000000000B60900000600
      4D656D6F3231000200510100005C0100003C0000001E00000003000F00DC0500
      00000000000000CCFFCC002C02000000000001000700C5E42E20E8E7EC000000
      00FFFF00000000000200000001000000000500417269616C0009000000020000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      3A0A000006004D656D6F32320002008D0100005C0100005A0000001E00000003
      000F00DC050000000000000000CCFFCC002C02000000000001000500D1E5F0E8
      FF00000000FFFF00000000000200000001000000000500417269616C00090000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000BF0A000006004D656D6F3233000200E60100005C010000370000001E
      00000003000F00DC050000000000000000CCFFCC002C02000000000001000600
      CAEEEB2DE2EE00000000FFFF0000000000020000000100000000050041726961
      6C00090000000200000000000A000000CC00020000000000FFFFFF0000000002
      000000000000000000450B000006004D656D6F32340002001D0200005C010000
      500000001E00000003000F00DC050000000000000000CCFFCC002C0200000000
      0001000700D6E5EDE02C20F000000000FFFF0000000000020000000100000000
      0500417269616C00090000000200000000000A000000CC00020000000000FFFF
      FF0000000002000000000000000000CC0B000006004D656D6F32350002006D02
      00005C010000640000001E00000003000F00DC050000000000000000CCFFCC00
      2C02000000000001000800D1F3ECECE02C20F000000000FFFF00000000000200
      000001000000000500417269616C00090000000200000000000A000000CC0002
      0000000000FFFFFF00000000020000000000000000006C0C000006004D656D6F
      343700020051010000C80100003C0000001400000003000F0001000000000000
      000000FFFFFF1F2C020000000000010021005B6F647350726968446F63506F4F
      6E654D656469632E2246435F4544495A4D225D00000000FFFF00000000000200
      000001000000000500417269616C00080000000000000000000A000000CC0002
      0000000000FFFFFF00000000020000000000000000000D0D000006004D656D6F
      34380002008D010000C80100005A0000001400000003000F0001000000000000
      000000FFFFFF1F2C020000000000010022005B6F647350726968446F63506F4F
      6E654D656469632E2246435F53455249414C225D00000000FFFF000000000002
      00000001000000000500417269616C00080000000000000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000AB0D000006004D656D
      6F3439000200E6010000C8010000370000001400000003000F00010000000000
      00000000FFFFFF1F2C02000000000001001F005B6F647350726968446F63506F
      4F6E654D656469632E22464E5F4B4F4C225D00000000FFFF0000000000020000
      0001000000000500417269616C00080000000000000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000620E000006004D656D6F35
      300002001D020000C8010000500000001400000003000F000100000000000000
      0000FFFFFF1F2C020301100023232320232323202323302E303020F000010028
      005B6F647350726968446F63506F4F6E654D656469632E22464E5F5052494345
      5F44455441494C225D00000000FFFF0000000000020000000100000000050041
      7269616C000800000000000000000009000000CC00020000000000FFFFFF0000
      000002000000000000000000110F000006004D656D6F35310002006D020000C8
      010000640000001400000003000F0001000000000000000000FFFFFF1F2C0203
      01100023232320232323202323302E303020F000010020005B6F647350726968
      446F63506F4F6E654D656469632E22464E5F53554D4D225D00000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000900
      0000CC00020000000000FFFFFF0000000002000000000000000000B20F000005
      004D656D6F360002004A000000A4010000870200001400000003000F00020000
      00000000000000CCFFFF002C020000000000010023005B6F647350726968446F
      63506F4F6E654D656469632E224E414D45504F53544156225D00000000FFFF00
      000000000200000001000000000500417269616C000900000002000000000008
      000000CC00020000000000FFFFFF000000000200000000000000000037100000
      05004D656D6F3700020024000000A4010000260000001400000003000F000200
      0000000000000000CCFFFF002C020000000000010007005B4C494E45235D0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      000000000A000000CC00020000000000FFFFFF00000000020000000000000004
      008610000005004C696E653100020024000000C8010000AB0200000000000001
      00080002000000000000000000FFFFFF002C020000000000000000000000FFFF
      000000000002000000010000000000003211000005004D656D6F380002002400
      0000F40100004A0200001400000003000F0002000000000000000000FFFFFF1F
      2C02000000000001002E00C8F2EEE3EE20EFEE20225B6F647350726968446F63
      506F4F6E654D656469632E224E414D45504F53544156225D2200000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000009
      000000CC00020000000000FFFFFF0000000002000000000000000000E7110000
      05004D656D6F390002006E020000F4010000630000001400000003000F000200
      0000000000000000FFFFFF1F2C020401100023232320232323202323302E3030
      20F000010027005B53554D285B6F647350726968446F63506F4F6E654D656469
      632E22464E5F53554D4D225D295D00000000FFFF000000000002000000010000
      00000500417269616C000A00000002000000000009000000CC00020000000000
      FFFFFF0000000002000000000000000000E912000005004D656D6F3400020024
      0000009B000000AC0200001B0000000300000001000000000000000000FFFFFF
      1F2C02000000000001001C00CEF2F7E5F220EFEE20EFF0E8F5EEE4F320ECE5E4
      E8EAE0ECE5EDF2E00004000500626567696E0D110020464E5F414C4C5F4B4F4C
      203A3D20303B0D440020464E5F414C4C5F53554D4D203A3D20303B202F2F20E8
      F2EEE3EEE2E0FF20F1F3ECECE020EFEE20F1F2EEEBE1F6F32022D1F3ECECE020
      EFEE20E4EEEAF3ECE5EDF2F3220D0300656E6400FFFF00000000000200000001
      000000000500417269616C000E00000002000000000002000000CC0002000000
      0000FFFFFF00000000020000000000000000008F13000006004D656D6F313400
      020024000000D3000000AC020000180000000300000001000000000000000000
      FFFFFF1F2C0200000000000100270020E7E020EFE5F0E8EEE420F1205B766172
      5F64617465315D20EFEE205B7661725F64617465325D00000000FFFF00000000
      000200000001000000000500417269616C000C0000000200000000000A000000
      CC00020000000000FFFFFF00000000020000000000000000002514000006004D
      656D6F323000020024000000410000005E0100000E0000000300000001000000
      000000000000FFFFFF1F2C02000000000001001700EDE0E8ECE5EDEEE2E0EDE8
      E520F3F7F0E5E6E4E5EDE8FF00000000FFFF0000000000020000000100000000
      0500417269616C0008000000000000000000020000000100020000000000FFFF
      FF0000000002000000000000000000B214000006004D656D6F32360002002400
      0000240000005E0100001C0000000300020001000000000000000000CCFFCC00
      2C02000000000001000E005B7661725F72656365697665725D00000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000012
      0000000100020000000000FFFFFF00000000020000000000000000003F150000
      06004D656D6F323700020024000000550000005E010000190000000300020001
      000000000000000000CCFFCC002C02000000000001000E005B7661725F6D6F5F
      67726F75705D00000000FFFF0000000000020000000100000000050041726961
      6C000C00000000000000000012000000CC00020000000000FFFFFF0000000002
      000000000000000000D815000006004D656D6F3238000200240000006F000000
      5E0100000E0000000300000001000000000000000000FFFFFF1F2C0200000000
      0001001A00EDE0E8ECE5EDEEE2E0EDE8E520EFEEE4F0E0E7E4E5EBE5EDE8FF00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      000000000002000000CC00020000000000FFFFFF000000000200000000000000
      00007216000005004D656D6F31000200E6010000200200003700000011000000
      23000F00DC050000000000000000FFFFFF1F2C02020110002323232023232320
      2323302E303020F00001000C005B464E5F414C4C5F4B4F4C5D00000000FFFF00
      000000000200000001000000000500417269616C000C00000002000000000009
      000000CC00020000000000FFFFFF0000000002000000000000000000FA160000
      05004D656D6F3500020024000000B8000000AC02000018000000030000000100
      0000000000000000FFFFFF1F2C02000000000001000A005B46435F4D45444943
      5D00000000FFFF00000000000200000001000000000500417269616C000C0000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      0000FEFEFF020000000A002043617465676F72793100000000040073756D6D00
      0000000000000000000000FC0000000000000000000000000000000058001BC5
      245FECD2E24076366E8DED4EE440}
  end
  object MainMenu1: TMainMenu
    Left = 360
    Top = 70
    object miPeriod: TMenuItem
      Caption = #1055#1077#1088#1080#1086#1076':'
      OnClick = miPeriodClick
    end
    object miMO_GROUP: TMenuItem
      Caption = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090'. '#1086#1090#1074'.:'
      OnClick = miMO_GROUPClick
    end
  end
  object frPrihApteka: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 256
    Top = 221
    ReportForm = {
      19000000841E0000190000FFFF01000100FFFFFFFFFF090000009A0B00003408
      00004800000024000000240000002400000001FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      0000240000002F040000B50000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200420100000B004D61737465
      72446174613100020100000000880100002F0400001400000031000500010000
      00000000000000FFFFFF1F000000000C0066724442445353656C446F63000000
      00000000FFFF000000000002000000010000000000000001000000C800000014
      000000010000000000000200AF0100000D004D6173746572466F6F7465723100
      020100000000E80100002F040000C80000003000060001000000000000000000
      FFFFFF1F00000000000000000000000000FFFF00000000000200000001000000
      0000000001000000C8000000140000000100000000000002001A0200000B0050
      616765466F6F7465723100020100000000200300002F04000014000000300003
      0001000000000000000000FFFFFF1F00000000000000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200870200000D004D617374657248656164657231000201000000001001
      00002F040000240000007000040001000000000000000000CCFFCC0000000000
      000000000000000000FFFF000000000002000000010000000000000001000000
      C8000000140000000100000000000000000903000005004D656D6F3200020066
      000000100100004C0000002400000003000F00DC050000000000000000CCFFCC
      002C02000000000001000400C4E0F2E000000000FFFF00000000000200000001
      000000000500417269616C000A0000000200000000000A000000CC0002000000
      0000FFFFFF00000000020000000000000000009003000005004D656D6F330002
      00E900000010010000B80000002400000003000F00DC050000000000000000CC
      FFCC002C02000000000001000900CFEEF1F2E0E2F9E8EA00000000FFFF000000
      00000200000001000000000500417269616C000A0000000200000000000A0000
      00CC00020000000000FFFFFF0000000002000000000000000000160400000500
      4D656D6F35000200B203000010010000580000002400000003000F00DC050000
      000000000000CCFFCC002C02000000000001000800D1F3ECECE02C20F0000000
      00FFFF00000000000200000001000000000500417269616C000A000000020000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      B004000005004D656D6F3600020066000000880100004C000000140000000300
      0F002C010000000000000000FFFFFF1F2C02000000000001001C005B6F647350
      726968417074656B612E2246445F494E564F494345225D00000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000020000
      00CC00020000000000FFFFFF00000000020000000000000000004A0500000500
      4D656D6F37000200E900000088010000B80000001400000003000F002C010000
      000000000000FFFFFF1F2C02000000000001001C005B6F647350726968417074
      656B612E224E414D45504F53544156225D00000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000000000000CC00020000
      000000FFFFFF0000000002000000000000000000E205000005004D656D6F3900
      0200B203000088010000580000001400000003000F0001000000000000000000
      FFFFFF1F2C02030100000001001A005B6F647350726968417074656B612E2246
      4E5F5052494345225D00000000FFFF0000000000020000000100000000050041
      7269616C000A00000000000000000001000000CC00020000000000FFFFFF0000
      0000020000000000000000006706000006004D656D6F313500020048000000E8
      0100001F0300001400000003000F00DC050000000000000000FFFFFF1F2C0200
      0000000001000600C8F2EEE3EE3A00000000FFFF000000000002000000010000
      00000500417269616C000A00000002000000000009000000CC00020000000000
      FFFFFF00000000020000000000000000000707000006004D656D6F3137000200
      67030000E8010000A30000001400000023000F00DC050000000000000000FFFF
      FF1F2C020301000000010021005B53554D285B6F647350726968417074656B61
      2E22464E5F5052494345225D295D00000000FFFF000000000002000000010000
      00000500417269616C000C00000002000000000001000000CC00020000000000
      FFFFFF0000000002000000000000000000A207000006004D656D6F3131000200
      4800000021030000C3030000110000000300000001000000000000000000FFFF
      FF1F2C02000000000001001C00F1F2F02E205B50414745235D20E8E7205B544F
      54414C50414745535D00000000FFFF0000000000020000000100000004050041
      7269616C000A00000000000000000009000000CC00020000000000FFFFFF0000
      0000020000000000000000002608000006004D656D6F31340002004800000010
      0100001E0000002400000003000F00DC050000000000000000CCFFCC002C0200
      0000000001000500B920EF2FEF00000000FFFF00000000000200000001000000
      000500417269616C000A0000000200000000000A000000CC00020000000000FF
      FFFF0000000002000000000000000000AD08000006004D656D6F313600020048
      000000880100001E0000001400000003000F002C010000000000000000FFFFFF
      1F2C020000000000010008005B4C494E45235D2900000000FFFF000000000002
      00000001000000000500417269616C000A00000000000000000001000000CC00
      020000000000FFFFFF00000000020000000000000000003809000005004D656D
      6F31000200480000007C000000C20300003B0000000300000001000000000000
      000000FFFFFF1F2C02000000000001000D00CFF0E8F5EEE420F2EEE2E0F0E000
      000000FFFF00000000000200000001000000000500417269616C000E00000002
      000000000012000000CC00020000000000FFFFFF000000000200000000000000
      0000DD09000006004D656D6F313000020048000000B7000000C2030000220000
      000300000001000000000000000000FFFFFF1F2C02000000000001002600E7E0
      20EFE5F0E8EEE420F1205B7661725F64617465315D20EFEE205B7661725F6461
      7465325D00000000FFFF00000000000200000001000000000500417269616C00
      0C0000000200000000000A000000CC00020000000000FFFFFF00000000020000
      00000000000000730A000006004D656D6F323600020048000000410000002B02
      0000110000000300000001000000000000000000FFFFFF1F2C02000000000001
      001700EDE0E8ECE5EDEEE2E0EDE8E520F3F7F0E5E6E4E5EDE8FF00000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      120000000100020000000000FFFFFF0000000002000000000000000000000B00
      0006004D656D6F323700020048000000250000002B0200001C00000003000200
      01000000000000000000CCFFCC002C02000000000001000E005B7661725F7265
      6365697665725D00000000FFFF00000000000200000001000000000500417269
      616C000A000000000000000000120000000100020000000000FFFFFF00000000
      02000000000000000000990B000006004D656D6F3331000200480000006B0000
      002B020000110000000300000001000000000000000000FFFFFF1F2C02000000
      000001001A00EDE0E8ECE5EDEEE2E0EDE8E520EFEEE4F0E0E7E4E5EBE5EDE8FF
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      00000000000012000000CC00020000000000FFFFFF0000000002000000000000
      000000280C000006004D656D6F3232000200480000000B020000A10000001400
      00000300000001000000000000000000FFFFFF1F2C02000000000001001000C2
      F1E5E3EE20E4EEEAF3ECE5EDF2EEE20000000000000000000000020000000100
      0000000500417269616C000A0000000000000000000000000001000200000000
      00FFFFFF0000000002000000000000000000AF0C000006004D656D6F32330002
      00E90000001F020000B8000000100000000300080001000000000000000000FF
      FFFF1F2C0200000000000100080028EAEEEB2DE2EE2900000000000000000000
      000200000001000000000500417269616C000600000000000000000002000000
      0100020000000000FFFFFF00000000020000000000000000003C0D000006004D
      656D6F3234000200480000002F020000A10000001C0000000300000001000000
      000000000000FFFFFF1F2C02000000000001000E00C4EEEAF3ECE5EDF2FB20F1
      E4E0EB00000000000000000000000200000001000000000500417269616C000A
      000000000000000000100000000100020000000000FFFFFF0000000002000000
      000000000000C60D000006004D656D6F3235000200E90000004B020000B80000
      000C0000000300080001000000000000000000FFFFFF1F2C0200000000000100
      0B0028E4EEEBE6EDEEF1F2FC2900000000000000000000000200000001000000
      000500417269616C0006000000000000000000020000000100020000000000FF
      FFFF00000000020000000000000000004E0E000006004D656D6F3239000200A4
      0100004B0200007E0000000C0000000300080001000000000000000000FFFFFF
      1F2C0200000000000100090028EFEEE4EFE8F1FC290000000000000000000000
      0200000001000000000500417269616C00060000000000000000000200000001
      00020000000000FFFFFF0000000002000000000000000000E20E000006004D65
      6D6F3330000200250200004B020000F20000000C000000030008000100000000
      0000000000FFFFFF1F2C0200000000000100150028F0E0F1F8E8F4F0EEE2EAE0
      20EFEEE4EFE8F1E8290000000000000000000000020000000100000000050041
      7269616C0006000000000000000000020000000100020000000000FFFFFF0000
      000002000000000000000000800F000006004D656D6F3332000200170300002F
      020000F30000001C0000000300000001000000000000000000FFFFFF1F2C0200
      0000000001001F00AB5F5F5F5FBB205F5F5F5F5F5F5F5F5F5F5F5F5F5F5F2020
      32305F5F5F20E300000000000000000000000200000001000000000500417269
      616C000A000000000000000000100000000100020000000000FFFFFF00000000
      020000000000000000000F10000006004D656D6F333300020048000000570200
      00A10000001C0000000300000001000000000000000000FFFFFF1F2C02000000
      000001001000C4EEEAF3ECE5EDF2FB20EFF0E8EDFFEB00000000000000000000
      000200000001000000000500417269616C000A00000000000000000010000000
      0100020000000000FFFFFF00000000020000000000000000009910000006004D
      656D6F3334000200E900000073020000B80000000C0000000300080001000000
      000000000000FFFFFF1F2C02000000000001000B0028E4EEEBE6EDEEF1F2FC29
      00000000000000000000000200000001000000000500417269616C0006000000
      000000000000020000000100020000000000FFFFFF0000000002000000000000
      0000002111000006004D656D6F3335000200A4010000730200007E0000000C00
      00000300080001000000000000000000FFFFFF1F2C0200000000000100090028
      EFEEE4EFE8F1FC29000000000000000000000002000000010000000005004172
      69616C0006000000000000000000020000000100020000000000FFFFFF000000
      0002000000000000000000B511000006004D656D6F3336000200250200007302
      0000F20000000C0000000300080001000000000000000000FFFFFF1F2C020000
      0000000100150028F0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E82900000000
      000000000000000200000001000000000500417269616C000600000000000000
      0000020000000100020000000000FFFFFF000000000200000000000000000053
      12000006004D656D6F33370002001703000057020000F30000001C0000000300
      000001000000000000000000FFFFFF1F2C02000000000001001F00AB5F5F5F5F
      BB205F5F5F5F5F5F5F5F5F5F5F5F5F5F5F202032305F5F5F20E3000000000000
      00000000000200000001000000000500417269616C000A000000000000000000
      100000000100020000000000FFFFFF0000000002000000000000000000DA1200
      0006004D656D6F3338000200480000007F020000A10000001C00000003000000
      01000000000000000000FFFFFF1F2C02000000000001000800CFF0EEE2E5F0E8
      EB00000000000000000000000200000001000000000500417269616C000A0000
      00000000000000100000000100020000000000FFFFFF00000000020000000000
      000000006413000006004D656D6F3339000200E90000009B020000B80000000C
      0000000300080001000000000000000000FFFFFF1F2C02000000000001000B00
      28E4EEEBE6EDEEF1F2FC29000000000000000000000002000000010000000005
      00417269616C0006000000000000000000020000000100020000000000FFFFFF
      0000000002000000000000000000EC13000006004D656D6F3430000200A40100
      009B0200007E0000000C0000000300080001000000000000000000FFFFFF1F2C
      0200000000000100090028EFEEE4EFE8F1FC2900000000000000000000000200
      000001000000000500417269616C000600000000000000000002000000010002
      0000000000FFFFFF00000000020000000000000000008014000006004D656D6F
      3431000200250200009B020000F20000000C0000000300080001000000000000
      000000FFFFFF1F2C0200000000000100150028F0E0F1F8E8F4F0EEE2EAE020EF
      EEE4EFE8F1E82900000000000000000000000200000001000000000500417269
      616C0006000000000000000000020000000100020000000000FFFFFF00000000
      020000000000000000001E15000006004D656D6F3432000200170300007F0200
      00F30000001C0000000300000001000000000000000000FFFFFF1F2C02000000
      000001001F00AB5F5F5F5FBB205F5F5F5F5F5F5F5F5F5F5F5F5F5F5F20203230
      5F5F5F20E300000000000000000000000200000001000000000500417269616C
      000A000000000000000000100000000100020000000000FFFFFF000000000200
      0000000000000000A315000006004D656D6F3132000200B20000001001000037
      0000002400000003000F0002000000000000000000CCFFCC002C020000000000
      01000600D1F7E5F220B900000000FFFF00000000000200000001000000000500
      417269616C000A0000000200000000000A0000000100020000000000FFFFFF00
      000000020000000000000000003A16000006004D656D6F3138000200B2000000
      88010000370000001400000003000F0001000000000000000000FFFFFF1F2C02
      0000000000010018005B6F647350726968417074656B612E2246435F444F4322
      5D00000000FFFF00000000000200000001000000000500417269616C000A0000
      00000000000000000000000100020000000000FFFFFF00000000020000000000
      00000000C816000006004D656D6F3230000200A1010000100100005700000024
      00000003000F00DC050000000000000000CCFFCC002C02000000000001000F00
      D3F1EBEEE2E8E520EFEBE0F2E5E6E000000000FFFF0000000000020000000100
      0000000500417269616C000A0000000200000000000A000000CC000200000000
      00FFFFFF00000000020000000000000000006017000006004D656D6F32310002
      00A101000088010000570000001400000003000F0001000000000000000000FF
      FFFF1F2C020000000000010019005B6F647350726968417074656B612E225041
      59434F4E44225D00000000FFFF00000000000200000001000000000500417269
      616C000A00000000000000000002000000CC00020000000000FFFFFF00000000
      02000000000000000000F617000006004D656D6F3433000200F8010000100100
      007B0000002400000003000F00DC050000000000000000CCFFCC002C02000000
      000001001700C8F1F2EEF7EDE8EA20F4E8EDE0EDF1E8F0EEE2E0EDE8FF000000
      00FFFF00000000000200000001000000000500417269616C000A000000020000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      9018000006004D656D6F3434000200F8010000880100007B0000001400000003
      000F0001000000000000000000FFFFFF1F2C02000000000001001B005B6F6473
      50726968417074656B612E2246494E534F55524345225D00000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000020000
      00CC00020000000000FFFFFF00000000020000000000000000001A1900000600
      4D656D6F34350002007302000010010000A40000001200000003000F00020000
      00000000000000CCFFCC002C02000000000001000B00CCE5E4E8EAE0ECE5EDF2
      FB00000000FFFF00000000000200000001000000000500417269616C000A0000
      000200000000000A0000000100020000000000FFFFFF00000000020000000000
      000000009E19000006004D656D6F343600020073020000220100005200000012
      00000003000F0002000000000000000000CCFFCC002C02000000000001000500
      C2F1E5E3EE00000000FFFF00000000000200000001000000000500417269616C
      000A0000000200000000000A0000000100020000000000FFFFFF000000000200
      0000000000000000291A000006004D656D6F3437000200C50200002201000052
      0000001200000003000F0002000000000000000000CCFFCC002C020000000000
      01000C00E220F22EF72E20C0EDE3F0EE00000000FFFF00000000000200000001
      000000000500417269616C000A0000000200000000000A000000010002000000
      0000FFFFFF0000000002000000000000000000B11A000006004D656D6F343800
      02001703000010010000500000002400000003000F00DC050000000000000000
      CCFFCC002C02000000000001000900CFE5F0E5E2FFE7EAE000000000FFFF0000
      0000000200000001000000000500417269616C000A0000000200000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000371B000006
      004D656D6F343900020067030000100100004B0000002400000003000F00DC05
      0000000000000000CCFFCC002C02000000000001000700CDE0F6E5EDEAE00000
      0000FFFF00000000000200000001000000000500417269616C000A0000000200
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      00D31B000006004D656D6F353100020073020000880100005200000014000000
      03000F0001000000000000000000FFFFFF1F2C02030100000001001D005B6F64
      7350726968417074656B612E22464E5F53554D4D5F474C46225D00000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      010000000100020000000000FFFFFF0000000002000000000000000000711C00
      0006004D656D6F3532000200C502000088010000520000001400000003000F00
      01000000000000000000FFFFFF1F2C02030100000001001F005B6F6473507269
      68417074656B612E22464E5F53554D4D5F414E47524F225D00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000100
      00000100020000000000FFFFFF00000000020000000000000000000F1D000006
      004D656D6F35330002001703000088010000500000001400000003000F000100
      0000000000000000FFFFFF1F2C02030100000001001F005B6F64735072696841
      7074656B612E22464E5F53554D4D5F5045524556225D00000000FFFF00000000
      000200000001000000000500417269616C000A00000000000000000001000000
      CC00020000000000FFFFFF0000000002000000000000000000AA1D000006004D
      656D6F353400020067030000880100004B0000001400000003000F0001000000
      000000000000FFFFFF1F2C00000000000001001C005B6F647350726968417074
      656B612E22464E5F4E4143454E4B41225D00000000FFFF000000000002000000
      01000000000500417269616C000A00000000000000000001000000CC00020000
      000000FFFFFF0000000002000000000000000000371E000006004D656D6F3238
      00020048000000520000002B0200001900000003000200010000000000000000
      00CCFFCC002C02000000000001000E005B7661725F6D6F5F67726F75705D0000
      0000FFFF00000000000200000001000000000500417269616C000C0000000000
      0000000012000000CC00020000000000FFFFFF000000000200000000000000FE
      FEFF020000000A002043617465676F72793100000000040073756D6D00010030
      000000000000000000FC0000000000000000000000000000000058008DF9BA39
      EDD2E24076366E8DED4EE440}
  end
  object odsPrihApteka: TOracleDataSet
    SQL.Strings = (
      'SELECT A.* FROM'
      '(SELECT'
      '              round(tdocs.fn_doc_summ,2) as fn_price,'
      '              round(tdocs.fn_summ_glf,2) fn_summ_glf,'
      '              round(tdocs.fn_summ_angro,2) fn_summ_angro,'
      '              round(tdocs.fn_summ_PEREV,2) fn_summ_PEREV,'
      
        '              round(tdocs.fn_summ_RASHODNIK,2) fn_summ_RASHODNIK' +
        ','
      '              tfinsource.fc_name finsource,'
      '              tpaycond.fc_name paycond,'
      
        '              DECODE(TDOCS.fn_nacenka_AVG, null, '#39#39', rtrim(TO_CH' +
        'AR(TDOCS.fn_nacenka_AVG, '#39'FM999G999G990D99'#39'),'#39'.,'#39')||'#39' '#1088'.'#39'||Chr(1' +
        '3)||Chr(10))|| DECODE(TDOCS.fn_nacenka_by_doc, null,'#39#39', TO_CHAR(' +
        'rtrim(TO_CHAR(TDOCS.fn_nacenka_by_doc, '#39'FM999G999G990D99'#39'),'#39'.,'#39')' +
        ')||'#39'%'#39') as fn_nacenka,'
      
        '               DECODE(TDOCS.fp_vidmove, 1,1, 9,2, 10,3, 6,4, 255' +
        ') as Rang,'
      
        '               TDOCS.FP_VIDMOVE, TDOCS.POSTAVID, TDOCS.MOTOID, T' +
        'DOCS.MOFROMID, TDOCS.FP_VID, '
      '               TDOCS.DPID, '
      '               TDOCS.fc_doc,'
      
        '               --to_char(TDOCS.fd_invoice,'#39'dd.mm.yyyy'#39') AS fd_in' +
        'voice,'
      '               TRUNC(TDOCS.FD_DATA) AS DATA,'
      
        '               TRUNC(TDOCS.FD_INVOICE) as FD_INVOICE, TDOCS.FC_K' +
        'ONTRAKT, TDOCS.FC_SCHET_FAKTURA,'
      
        '               decode(NVL(TMO.FC_NAME,'#39#39'),'#39#39', MOGR_TO.fc_group, ' +
        'MOGR_TO.fc_group ||'#39'('#39'|| TMO.FC_NAME||'#39')'#39') AS FC_NAME,'
      
        '               DECODE(TDOCS.fp_vidmove, 7, '#39#1057#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1087#1088#1086#1080#1079#1074#1086#1076 +
        #1089#1090#1074#1086' '#1074' '#1056#1055#1054#39', 8, '#39#1057#1087#1080#1089#1072#1085#1080#1077#39', MOGR_TO.fc_group) as FC_MO_GR_TO,'
      
        '               DECODE(TDOCS.FP_VIDMOVE, 1,TPOSTAV.FC_NAME, 9, '#39#1042 +
        #1074#1086#1076' '#1086#1089#1090#1072#1090#1082#1086#1074#39', 2,MOGR_FROM.fc_group, 3,MOGR_FROM.fc_group, 6, MO' +
        'GR_FROM.fc_group||'#39' ('#1074#1086#1079#1074#1088#1072#1090')'#39', 10,MED.PKGTMO.getnamebyid( MED.P' +
        'KG_MEDSES.GET_PRODUCE_MO ), '#39#39' ) AS NAMEPOSTAV,'
      '               MED.GET_DECODEDOCVID(FP_VIDMOVE) AS VIDDOC'
      '       FROM '
      '       (select '
      '  d.dpid,'
      
        '  d.FP_VIDMOVE, d.POSTAVID, d.MOTOID, d.MOFROMID, d.FC_COMMENT, ' +
        'd.FP_VID,'
      '  d.fd_invoice, d.fd_data, d.FC_KONTRAKT, d.FC_SCHET_FAKTURA,'
      
        '  d.fk_mogroupid_from,  d.fk_mogroupid_to, d.fc_doc,d.fk_finsour' +
        'ce_id,d.fk_paycond_id,'
      '  '
      '  sum(k.fn_price*dp.fn_kol) as fn_DOC_SUMM,'
      '  '
      
        '  sum(Round((k.fn_nacenka*dp.fn_kol*k.fn_price_mnf/100),2))  as ' +
        'fn_nacenka_AVG,'
      
        '  decode(sum(k.fn_price_mnf), 0,0, sum(Round((k.fn_nacenka*k.fn_' +
        'price_mnf),2)) / sum(k.fn_price_mnf)) as fn_nacenka_by_doc,'
      '  '
      '  sum( CASE WHEN glf.fc_synonim = '#39'GLF'#39
      '       THEN k.fn_price*dp.fn_kol'
      '       ELSE 0 END) AS fn_summ_glf,'
      '       '
      '  sum( CASE WHEN glf.fc_synonim = '#39'ANGRO'#39
      '       THEN k.fn_price*dp.fn_kol'
      '       ELSE 0 END) AS fn_summ_angro,'
      ''
      '  sum( CASE WHEN glf.fc_synonim = '#39'PEREV'#39
      '       THEN k.fn_price*dp.fn_kol'
      '       ELSE 0 END) AS fn_summ_PEREV,'
      ''
      '  sum( CASE WHEN glf.fc_synonim = '#39'RASHODNIK'#39
      '       THEN k.fn_price*dp.fn_kol'
      '       ELSE 0 END) AS fn_summ_RASHODNIK'
      '       '
      'from'
      
        '  MED.TDOCS d, med.tdpc dp, med.tkart k, med.tmedic m, med.tgrou' +
        'p_lf glf'
      
        ' where :MO_GROUP = d.fk_mogroupid_to and -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084' '#1085#1077' '#1085#1091 +
        #1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '       MED.PKG_PRIHRASH.Get_PrihRashPriznak (d.FP_VID,  d.FP_VID' +
        'MOVE, d.fk_mogroupid_from, d.fk_mogroupid_to, :MO_GROUP) = +1 AN' +
        'D '
      
        '       d.fp_vidmove <> 6 AND -- '#1074#1089#1077', '#1082#1088#1086#1084#1077#1074#1086#1079#1074#1088#1072#1090#1072'- '#1087#1086#1089#1082#1086#1083#1100#1082#1091#1074#1086#1079 +
        #1074#1088#1072#1090#1084#1086#1078#1085#1086#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100#1090#1086#1083#1100#1082#1086#1074#1076#1074#1080#1078#1077#1085#1080#1080'('#1082#1086#1075#1076#1072#1087#1088#1080#1093#1086#1076'+'#1088#1072#1089#1093#1086#1076')'
      '       (not d.fp_vidmove in (4,5)) AND '
      '       ((:IS_RPO = 1)OR(d.fp_vidmove <> 10)) AND '
      '        d.FL_EDIT = 0 AND '
      
        '       TRUNC(d.FD_DATA) BETWEEN TRUNC(:adata1) AND TRUNC(:adata2' +
        ') AND '
      
        '--       TRUNC(d.FD_DATA) BETWEEN TO_DATE('#39'01.03.2010'#39', '#39'dd.mm.y' +
        'yyy'#39') AND TO_DATE('#39'31.03.2010'#39', '#39'dd.mm.yyyy'#39') AND '
      '       d.dpid = dp.dpid and'
      '       dp.kartid = k.kartid and'
      '       k.medicid = m.medicid and'
      '       m.fk_group_lf = glf.fk_group_lf_id(+)'
      ''
      
        'GROUP BY d.DPID, d.FP_VIDMOVE, d.POSTAVID, d.MOTOID, d.MOFROMID,' +
        ' d.FC_COMMENT, d.FP_VID, d.fc_doc,'
      
        '         d.fd_invoice, d.fd_data, FC_KONTRAKT, d.FC_SCHET_FAKTUR' +
        'A, d.fk_mogroupid_from,  d.fk_mogroupid_to,d.fk_finsource_id,d.f' +
        'k_paycond_id) TDOCS,'
      
        '        MED.TMO, MED.TPOSTAV, MED.TMO T2 , MED.TMO_GROUP MOGR_FR' +
        'OM,  MED.TMO_GROUP MOGR_TO, med.tfinsource, med.tpaycond'
      'WHERE  '
      '  TDOCS.MOTOID = TMO.MOID(+)'
      '  AND TDOCS.POSTAVID=TPOSTAV.POSTAVID (+)'
      '  AND TDOCS.MOFROMID = T2.MOID (+)'
      '  AND TDOCS.fk_mogroupid_from = MOGR_FROM.groupid (+)'
      '  AND TDOCS.fk_mogroupid_to = MOGR_TO.groupid (+)'
      '  and tdocs.fk_finsource_id = tfinsource.fk_id (+)'
      '  and tdocs.fk_paycond_id = tpaycond.fk_id (+)'
      ') A'
      ''
      'ORDER BY A.Rang, UPPER(A.NAMEPOSTAV), A.DATA')
    Optimize = False
    Variables.Data = {
      0300000004000000070000003A4144415441310C00000007000000786D020101
      010100000000070000003A4144415441320C00000007000000786D021C010101
      00000000090000003A4D4F5F47524F55500300000004000000B8040000000000
      00070000003A49535F52504F03000000040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001600000004000000445049440100000000000600000046435F444F43
      0100000000000600000046505F564944010000000000080000004D4F46524F4D
      4944010000000000060000004D4F544F494401000000000008000000504F5354
      4156494401000000000008000000464E5F505249434501000000000007000000
      46435F4E414D450100000000000A0000004E414D45504F535441560100000000
      0004000000444154410100000000000A00000046505F5649444D4F5645010000
      00000006000000564944444F430100000000000400000052414E470100000000
      000B00000046435F4D4F5F47525F544F0100000000000A00000046445F494E56
      4F4943450100000000000B00000046435F4B4F4E5452414B5401000000000010
      00000046435F53434845545F46414B545552410100000000000B000000464E5F
      53554D4D5F474C460100000000000D000000464E5F53554D4D5F414E47524F01
      00000000000D000000464E5F53554D4D5F504552455601000000000009000000
      46494E534F5552434501000000000007000000504159434F4E44010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 257
    Top = 175
  end
  object frPrihDocPoOneMedic2: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 422
    Top = 242
    ReportForm = {
      19000000FB170000190000FFFF01000100FFFFFFFFFF09000000340800009A0B
      00002400000024000000240000002400000000FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000024000000F6020000D10000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D00436F6C756D
      6E48656164657231000201000000005C010000F60200001F00000030000E0001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200400200000B004D6173746572446174613100020100000000C8010000F602
      0000140000003100050001000000000000000000FFFFFF1F000000000C006672
      444244617461536574310000000004000500626567696E0D3E002020464E5F41
      4C4C5F4B4F4C20203A3D20464E5F414C4C5F4B4F4C202B205B6F647350726968
      446F63506F4F6E654D656469632E22464E5F4B4F4C225D3B0D40002020464E5F
      414C4C5F53554D4D203A3D20464E5F414C4C5F53554D4D202B205B6F64735072
      6968446F63506F4F6E654D656469632E22464E5F53554D4D225D3B0D0300656E
      6400FFFF000000000002000000010000000000000001000000C8000000140000
      00010000000000000200AB0200000B0050616765466F6F746572310002010000
      000054020000F6020000190000003000030001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200180300000D004D61737465
      72466F6F746572310002010000000020020000F6020000120000003100060001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200A40300000C0047726F75704865616465723100020100000000A4010000F6
      020000140000003000100001000000000000000000FFFFFF1F0000000020005B
      6F647350726968446F63506F4D656469632E224E414D45504F53544156225D00
      000000000000FFFF000000000002000000010000000000000001000000C80000
      0014000000010000000000000200100400000C0047726F7570466F6F74657231
      00020100000000F4010000F60200001400000030001100010000000000000000
      00FFFFFF1F00000000000000000000000000FFFF000000000002000000010000
      000000000001000000C800000014000000010000000000000000960400000500
      4D656D6F320002008A0000005C010000520000001E00000003000F00DC050000
      000000000000CCFFCC002C02000000000001000800C4EEEAF3ECE5EDF2000000
      00FFFF00000000000200000001000000000500417269616C0009000000020000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      2705000005004D656D6F33000200DC0000005C010000750000001E0000000300
      0F00DC050000000000000000CCFFCC002C02000000000001001300C8F1F22E20
      F4E8EDE0EDF1E8F0EEE2E0EDE8FF00000000FFFF000000000002000000010000
      00000500417269616C00090000000200000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000C505000006004D656D6F3431000200
      8A000000C8010000520000001400000003000F0001000000000000000000FFFF
      FF1F2C02000000000001001F005B6F647350726968446F63506F4F6E654D6564
      69632E2246435F444F43225D00000000FFFF0000000000020000000100000000
      0500417269616C00080000000000000000000A000000CC00020000000000FFFF
      FF00000000020000000000000000006906000006004D656D6F3433000200DC00
      0000C8010000750000001400000003000F0001000000000000000000FFFFFF1F
      2C020000000000010025005B6F647350726968446F63506F4F6E654D65646963
      2E2246435F46494E534F55524345225D00000000FFFF00000000000200000001
      000000000500417269616C000800000000000000000008000000CC0002000000
      0000FFFFFF00000000020000000000000000000407000006004D656D6F313300
      02002400000056020000AE020000140000000300000001000000000000000000
      FFFFFF1F2C02000000000001001C00F1F2F02E205B50414745235D20E8E7205B
      544F54414C50414745535D00000000FFFF000000000002000000010000000405
      00417269616C000A00000000000000000009000000CC00020000000000FFFFFF
      00000000020000000000000000008907000006004D656D6F3135000200240000
      0020020000C30100001100000003000F00DC050000000000000000FFFFFF1F2C
      02000000000001000600C8F2EEE3EE3A00000000FFFF00000000000200000001
      000000000500417269616C000A00000002000000000009000000CC0002000000
      0000FFFFFF00000000020000000000000000002508000006004D656D6F313700
      02006E02000020020000630000001100000023000F00DC050000000000000000
      FFFFFF1F2C020301100023232320232323202323302E303020F00001000D005B
      464E5F414C4C5F53554D4D5D00000000FFFF0000000000020000000100000000
      0500417269616C000C00000002000000000009000000CC00020000000000FFFF
      FF0000000002000000000000000000A908000006004D656D6F31310002002400
      00005C010000260000001E00000003000F00DC050000000000000000CCFFCC00
      2C02000000000001000500B920EF2FEF00000000FFFF00000000000200000001
      000000000500417269616C00090000000200000000000A000000CC0002000000
      0000FFFFFF00000000020000000000000000003009000006004D656D6F343000
      020024000000C8010000260000001400000003000F0001000000000000000000
      FFFFFF1F2C020000000000010008005B4C494E45235D2900000000FFFF000000
      00000200000001000000000500417269616C000A000000000000000000090000
      00CC00020000000000FFFFFF0000000002000000000000000000B60900000600
      4D656D6F3231000200510100005C0100003C0000001E00000003000F00DC0500
      00000000000000CCFFCC002C02000000000001000700C5E42E20E8E7EC000000
      00FFFF00000000000200000001000000000500417269616C0009000000020000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      3A0A000006004D656D6F32320002008D0100005C0100005A0000001E00000003
      000F00DC050000000000000000CCFFCC002C02000000000001000500D1E5F0E8
      FF00000000FFFF00000000000200000001000000000500417269616C00090000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000BF0A000006004D656D6F3233000200E60100005C010000370000001E
      00000003000F00DC050000000000000000CCFFCC002C02000000000001000600
      CAEEEB2DE2EE00000000FFFF0000000000020000000100000000050041726961
      6C00090000000200000000000A000000CC00020000000000FFFFFF0000000002
      000000000000000000450B000006004D656D6F32340002001D0200005C010000
      500000001E00000003000F00DC050000000000000000CCFFCC002C0200000000
      0001000700D6E5EDE02C20F000000000FFFF0000000000020000000100000000
      0500417269616C00090000000200000000000A000000CC00020000000000FFFF
      FF0000000002000000000000000000CC0B000006004D656D6F32350002006D02
      00005C010000640000001E00000003000F00DC050000000000000000CCFFCC00
      2C02000000000001000800D1F3ECECE02C20F000000000FFFF00000000000200
      000001000000000500417269616C00090000000200000000000A000000CC0002
      0000000000FFFFFF00000000020000000000000000006C0C000006004D656D6F
      343700020051010000C80100003C0000001400000003000F0001000000000000
      000000FFFFFF1F2C020000000000010021005B6F647350726968446F63506F4F
      6E654D656469632E2246435F4544495A4D225D00000000FFFF00000000000200
      000001000000000500417269616C00080000000000000000000A000000CC0002
      0000000000FFFFFF00000000020000000000000000000D0D000006004D656D6F
      34380002008D010000C80100005A0000001400000003000F0001000000000000
      000000FFFFFF1F2C020000000000010022005B6F647350726968446F63506F4F
      6E654D656469632E2246435F53455249414C225D00000000FFFF000000000002
      00000001000000000500417269616C00080000000000000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000AB0D000006004D656D
      6F3439000200E6010000C8010000370000001400000003000F00010000000000
      00000000FFFFFF1F2C02000000000001001F005B6F647350726968446F63506F
      4F6E654D656469632E22464E5F4B4F4C225D00000000FFFF0000000000020000
      0001000000000500417269616C00080000000000000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000620E000006004D656D6F35
      300002001D020000C8010000500000001400000003000F000100000000000000
      0000FFFFFF1F2C020301100023232320232323202323302E303020F000010028
      005B6F647350726968446F63506F4F6E654D656469632E22464E5F5052494345
      5F44455441494C225D00000000FFFF0000000000020000000100000000050041
      7269616C000800000000000000000009000000CC00020000000000FFFFFF0000
      000002000000000000000000110F000006004D656D6F35310002006D020000C8
      010000640000001400000003000F0001000000000000000000FFFFFF1F2C0203
      01100023232320232323202323302E303020F000010020005B6F647350726968
      446F63506F4F6E654D656469632E22464E5F53554D4D225D00000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000900
      0000CC00020000000000FFFFFF0000000002000000000000000000B20F000005
      004D656D6F360002004A000000A4010000870200001400000003000F00020000
      00000000000000CCFFFF002C020000000000010023005B6F647350726968446F
      63506F4F6E654D656469632E224E414D45504F53544156225D00000000FFFF00
      000000000200000001000000000500417269616C000900000002000000000008
      000000CC00020000000000FFFFFF000000000200000000000000000037100000
      05004D656D6F3700020024000000A4010000260000001400000003000F000200
      0000000000000000CCFFFF002C020000000000010007005B4C494E45235D0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      000000000A000000CC00020000000000FFFFFF00000000020000000000000004
      008610000005004C696E653100020024000000C8010000AB0200000000000001
      00080002000000000000000000FFFFFF002C020000000000000000000000FFFF
      000000000002000000010000000000003211000005004D656D6F380002002400
      0000F40100004A0200001400000003000F0002000000000000000000FFFFFF1F
      2C02000000000001002E00C8F2EEE3EE20EFEE20225B6F647350726968446F63
      506F4F6E654D656469632E224E414D45504F53544156225D2200000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000009
      000000CC00020000000000FFFFFF0000000002000000000000000000E7110000
      05004D656D6F390002006E020000F4010000630000001400000003000F000200
      0000000000000000FFFFFF1F2C020401100023232320232323202323302E3030
      20F000010027005B53554D285B6F647350726968446F63506F4F6E654D656469
      632E22464E5F53554D4D225D295D00000000FFFF000000000002000000010000
      00000500417269616C000A00000002000000000009000000CC00020000000000
      FFFFFF0000000002000000000000000000EA12000005004D656D6F3400020024
      0000009B000000AC0200001B0000000300000001000000000000000000FFFFFF
      1F2C02000000000001001D00D1EFF0E0E2EAE02E20CFEEF1F2F3EFEBE5EDE8E5
      20E220E0EFF2E5EAF30004000500626567696E0D110020464E5F414C4C5F4B4F
      4C203A3D20303B0D440020464E5F414C4C5F53554D4D203A3D20303B202F2F20
      E8F2EEE3EEE2E0FF20F1F3ECECE020EFEE20F1F2EEEBE1F6F32022D1F3ECECE0
      20EFEE20E4EEEAF3ECE5EDF2F3220D0300656E6400FFFF000000000002000000
      01000000000500417269616C000E00000002000000000002000000CC00020000
      000000FFFFFF00000000020000000000000000008013000006004D656D6F3230
      00020024000000410000005E0100000E00000003000000010000000000000000
      00FFFFFF1F2C02000000000001001700EDE0E8ECE5EDEEE2E0EDE8E520F3F7F0
      E5E6E4E5EDE8FF00000000FFFF00000000000200000001000000000500417269
      616C0008000000000000000000020000000100020000000000FFFFFF00000000
      020000000000000000000D14000006004D656D6F323600020024000000240000
      005E0100001C0000000300020001000000000000000000CCFFCC002C02000000
      000001000E005B7661725F72656365697665725D00000000FFFF000000000002
      00000001000000000500417269616C000A000000000000000000120000000100
      020000000000FFFFFF00000000020000000000000000009A14000006004D656D
      6F323700020024000000550000005E0100001900000003000200010000000000
      00000000CCFFCC002C02000000000001000E005B7661725F6D6F5F67726F7570
      5D00000000FFFF00000000000200000001000000000500417269616C000C0000
      0000000000000012000000CC00020000000000FFFFFF00000000020000000000
      000000003315000006004D656D6F3238000200240000006F0000005E0100000E
      0000000300000001000000000000000000FFFFFF1F2C02000000000001001A00
      EDE0E8ECE5EDEEE2E0EDE8E520EFEEE4F0E0E7E4E5EBE5EDE8FF00000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      02000000CC00020000000000FFFFFF0000000002000000000000000000CD1500
      0005004D656D6F31000200E601000020020000370000001100000023000F00DC
      050000000000000000FFFFFF1F2C020201100023232320232323202323302E30
      3020F00001000C005B464E5F414C4C5F4B4F4C5D00000000FFFF000000000002
      00000001000000000500417269616C000C00000002000000000009000000CC00
      020000000000FFFFFF00000000020000000000000000008A16000005004D656D
      6F3500020024000000B8000000AC0200003C0000000300000001000000000000
      000000FFFFFF1F2C02000000000002001600CCE5E4E8EAE0ECE5EDF23A205B46
      435F4D454449435D0D2600E7E020EFE5F0E8EEE420F1205B7661725F64617465
      315D20EFEE205B7661725F64617465325D00000000FFFF000000000002000000
      01000000000500417269616C000C0000000200000000000A000000CC00020000
      000000FFFFFF00000000020000000000000000000D17000006004D656D6F3130
      0002004A0000005C010000400000001E00000003000F00DC0500000000000000
      00CCFFCC002C02000000000001000400C4E0F2E000000000FFFF000000000002
      00000001000000000500417269616C00090000000200000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000AF17000006004D656D
      6F31320002004A000000C8010000400000001400000003000F00010000000000
      00000000FFFFFF1F2C020000000000010023005B6F647350726968446F63506F
      4F6E654D656469632E2246445F494E564F494345225D00000000FFFF00000000
      000200000001000000000500417269616C00080000000000000000000A000000
      CC00020000000000FFFFFF000000000200000000000000FEFEFF020000000A00
      2043617465676F72793100000000040073756D6D000000000000000000000000
      FC0000000000000000000000000000000058001BC5245FECD2E24076366E8DED
      4EE440}
  end
  object frPrihDocPoMedicEk1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 143
    Top = 239
    ReportForm = {
      1900000061170000190000FFFF01000100FFFFFFFFFF09000000340800009A0B
      00004800000024000000120000002400000000FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000024000000F6020000B50000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200470100000B004D61737465
      7244617461310002010000000014020000F60200001400000031000500010000
      00000000000000FFFFFF1F0000000011006672444253656C446F63506F4D6564
      696300000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200B20100000B0050616765466F6F7465
      72310002010000000094020000F6020000190000003000030001000000000000
      000000FFFFFF1F00000000000000000000000000FFFF00000000000200000001
      0000000000000001000000C80000001400000001000000000000020040020000
      0C0047726F757048656164657231000201000000008C010000F6020000680000
      003000100001000000000000000000FFFFFF1F0000000022005B6F6473507269
      68446F63506F4D65646963456B2E224E414D45504F53544156225D0000000000
      0000FFFF000000000002000000010000000000000001000000C8000000140000
      00010000000000000200AC0200000C0047726F7570466F6F7465723100020100
      00000048020000F6020000010000003000110001000000000000000000FFFFFF
      1F00000000000000000000000000FFFF00000000000200000001000000000000
      0001000000C80000001400000001000000000000020035030000050042616E64
      310002010000000038010000F602000028000000300010000100000000000000
      0000FFFFFF1F0000000024005B6F647350726968446F63506F4D65646963456B
      2E2246435F46494E534F55524345225D00000000000000FFFF00000000000200
      0000010000000000000001000000C800000014000000010000000000000200A1
      0300000C0047726F7570466F6F746572320002010000000068020000F6020000
      080000003000110001000000000000000000C0C0C00000000000000000000000
      000000FFFF000000000002000000010000000000000001000000C80000001400
      00000100000000000000004904000006004D656D6F343100020048000000BC01
      00003C000000140000000300070001000000000000000000FFFFFF1F2C000402
      0A0064642E6D6D2E797979790001001F005B6F647350726968446F63506F4D65
      646963456B2E2246445F44415441225D00000000FFFF00000000000200000001
      000000000500417269616C00080000000000000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000E404000006004D656D6F313300
      020048000000960200009C020000140000000300000001000000000000000000
      FFFFFF1F2C02000000000001001C00F1F2F02E205B50414745235D20E8E7205B
      544F54414C50414745535D00000000FFFF000000000002000000010000000405
      00417269616C000A00000000000000000009000000CC00020000000000FFFFFF
      00000000020000000000000000006F05000006004D656D6F3139000200480000
      00D60100000B0100001E00000003000F00DC050000000000000000CCFFCC002C
      02000000000001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF00000000
      000200000001000000000500417269616C00090000000200000000000A000000
      CC00020000000000FFFFFF0000000002000000000000000000F505000006004D
      656D6F323100020053010000D60100004B0000001E00000003000F00DC050000
      000000000000CCFFCC002C02000000000001000700C5E42E20E8E7EC00000000
      FFFF00000000000200000001000000000500417269616C000900000002000000
      00000A000000CC00020000000000FFFFFF000000000200000000000000000079
      06000006004D656D6F32320002009E010000D60100005A0000001E0000000300
      0F00DC050000000000000000CCFFCC002C02000000000001000500D1E5F0E8FF
      00000000FFFF00000000000200000001000000000500417269616C0009000000
      0200000000000A000000CC00020000000000FFFFFF0000000002000000000000
      000000FE06000006004D656D6F3233000200AA020000D60100002F0000001E00
      000003000F00DC050000000000000000CCFFCC002C02000000000001000600CA
      EEEB2DE2EE00000000FFFF00000000000200000001000000000500417269616C
      00090000000200000000000A000000CC00020000000000FFFFFF000000000200
      00000000000000009D07000006004D656D6F343600020048000000140200000B
      0100001400000003000F0001000000000000000000FFFFFF1F2C000000000000
      010020005B6F647350726968446F63506F4D65646963456B2E224E414D454B41
      5254225D00000000FFFF00000000000200000001000000000500417269616C00
      0800000000000000000008000000CC00020000000000FFFFFF00000000020000
      000000000000003C08000006004D656D6F343700020053010000140200004B00
      00001400000003000F0001000000000000000000FFFFFF1F2C02000000000001
      0020005B6F647350726968446F63506F4D65646963456B2E2246435F4544495A
      4D225D00000000FFFF00000000000200000001000000000500417269616C0008
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000000DC08000006004D656D6F34380002009E010000140200005A0000
      001400000003000F0001000000000000000000FFFFFF1F2C0200000000000100
      21005B6F647350726968446F63506F4D65646963456B2E2246435F5345524941
      4C225D00000000FFFF00000000000200000001000000000500417269616C0008
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      0000000000007909000006004D656D6F3439000200A9020000140200002F0000
      001400000003000F0001000000000000000000FFFFFF1F2C0200000000000100
      1E005B6F647350726968446F63506F4D65646963456B2E2246435F4B4F4C225D
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000002D0A000005004D656D6F3600020048000000900100009C020000140000
      0003000F0002000000000000000000CCFFFF002C020000000000010036002020
      20202020202020CFEEF1F2E0E2F9E8EA3A205B6F647350726968446F63506F4D
      65646963456B2E224E414D45504F53544156225D00000000FFFF000000000002
      00000001000000040500417269616C000900000002000000000008000000CC00
      020000000000FFFFFF0000000002000000000000000000AE0B000005004D656D
      6F34000200480000009B0000009C0200001B0000000300000001000000000000
      000000FFFFFF1F2C02000000000001001400CFEEF1F2F3EFEBE5EDE8E520E220
      E0EFF2E5EAF30006000500626567696E0D310020695F44504944203A3D20303B
      202F2F20EDEEECE5F020205B6F647353656C446F63507269685265702E224450
      4944225D0D2E0020695F726F775F6E756D5F64657461696C203A3D20303B202F
      2F20EDEEECE5F020F1F2F0EEEAE82064657461696C0D2D0020695F726F775F6E
      756D5F6D6173746572203A3D20303B202F2FEDEEECE5F020F1F2F0EEEAE8206D
      61737465720D4A0020695F464E5F50524943455F4D4153544552203A3D20303B
      202F2F20E8F2EEE3EEE2E0FF20F1F3ECECE020EFEE20F1F2EEEBE1F6F32022D1
      F3ECECE020EFEE20E4EEEAF3ECE5EDF2F3220D0300656E6400FFFF0000000000
      0200000001000000040500417269616C000E00000002000000000002000000CC
      00020000000000FFFFFF0000000002000000000000000000540C000006004D65
      6D6F313400020048000000B30000009C02000018000000030000000100000000
      0000000000FFFFFF1F2C0200000000000100270020E7E020EFE5F0E8EEE420F1
      205B7661725F64617465315D20EFEE205B7661725F64617465325D00000000FF
      FF00000000000200000001000000040500417269616C000C0000000200000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000EA0C
      000006004D656D6F323000020049000000410000004B0200000E000000030000
      0001000000000000000000FFFFFF1F2C02000000000001001700EDE0E8ECE5ED
      EEE2E0EDE8E520F3F7F0E5E6E4E5EDE8FF00000000FFFF000000000002000000
      01000000000500417269616C0008000000000000000000020000000100020000
      000000FFFFFF0000000002000000000000000000770D000006004D656D6F3236
      00020049000000240000004B0200001C00000003000200010000000000000000
      00CCFFCC002C02000000000001000E005B7661725F72656365697665725D0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      00000000120000000100020000000000FFFFFF00000000020000000000000000
      00040E000006004D656D6F323700020049000000550000004B02000019000000
      0300020001000000000000000000CCFFCC002C02000000000001000E005B7661
      725F6D6F5F67726F75705D00000000FFFF000000000002000000010000000005
      00417269616C000C00000000000000000012000000CC00020000000000FFFFFF
      00000000020000000000000000009D0E000006004D656D6F3238000200490000
      006F0000004B0200000E0000000300000001000000000000000000FFFFFF1F2C
      02000000000001001A00EDE0E8ECE5EDEEE2E0EDE8E520EFEEE4F0E0E7E4E5EB
      E5EDE8FF00000000FFFF00000000000200000001000000000500417269616C00
      0800000000000000000002000000CC00020000000000FFFFFF00000000020000
      00000000000000540F000005004D656D6F31000200480000004C0100009C0200
      001400000003000F0002000000000000000000C0C0C0002C0200000000000100
      3900C8F1F22E20F4E8EDE0EDF1E8F0EEE2E0EDE8FF3A205B6F64735072696844
      6F63506F4D65646963456B2E2246435F46494E534F55524345225D00000000FF
      FF00000000000200000001000000040500417269616C00090000000200000000
      0008000000CC00020000000000FFFFFF0000000002000000000000000000F00F
      000005004D656D6F3200020084000000BC0100003C0000001400000003000700
      01000000000000000000FFFFFF1F2C02000000000001001E005B6F6473507269
      68446F63506F4D65646963456B2E2246435F444F43225D00000000FFFF000000
      00000200000001000000000500417269616C00080000000000000000000A0000
      00CC00020000000000FFFFFF0000000002000000000000000000971000000500
      4D656D6F33000200C0000000BC0100003C000000140000000300070001000000
      000000000000FFFFFF1F2C0004020A0064642E6D6D2E797979790001001F005B
      6F647350726968446F63506F4D65646963456B2E2246445F44415441225D0000
      0000FFFF00000000000200000001000000000500417269616C00080000000000
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      004111000005004D656D6F35000200FC000000BC010000800000001400000003
      00070001000000000000000000FFFFFF1F2C0000000A0064642E6D6D2E797979
      7900010022005B6F647350726968446F63506F4D65646963456B2E2246435F50
      4159434F4E44225D00000000FFFF000000000002000000010000000005004172
      69616C00080000000000000000000A000000CC00020000000000FFFFFF000000
      0002000000000000000000EC11000005004D656D6F370002007C010000BC0100
      0080000000140000000300070001000000000000000000FFFFFF1F2C0000000A
      0064642E6D6D2E7979797900010023005B6F647350726968446F63506F4D6564
      6963456B2E2246435F4B4F4E5452414B54225D00000000FFFF00000000000200
      000001000000000500417269616C00080000000000000000000A000000CC0002
      0000000000FFFFFF00000000020000000000000000007812000006004D656D6F
      3130000200F8010000D60100004D0000001E00000003000F00DC050000000000
      000000CCFFCC002C02000000000001000D00D1F0EEEA20E3EEE4EDEEF1F2E800
      000000FFFF00000000000200000001000000000500417269616C000900000002
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      00000013000006004D656D6F313100020045020000D6010000650000001E0000
      0003000F00DC050000000000000000CCFFCC002C02000000000001000900D1E5
      F0F2F4E8EAE0F200000000FFFF00000000000200000001000000000500417269
      616C00090000000200000000000A000000CC00020000000000FFFFFF00000000
      020000000000000000009F13000006004D656D6F3132000200F8010000140200
      004D0000001400000003000F0001000000000000000000FFFFFF1F2C00000000
      0000010020005B6F647350726968446F63506F4D65646963456B2E2246435F47
      4F44454E225D00000000FFFF0000000000020000000100000000050041726961
      6C00080000000000000000000A000000CC00020000000000FFFFFF0000000002
      0000000000000000003D14000006004D656D6F31360002004502000014020000
      640000001400000003000F0001000000000000000000FFFFFF1F2C0200000000
      0001001F005B6F647350726968446F63506F4D65646963456B2E2246435F4345
      5254225D00000000FFFF00000000000200000001000000000500417269616C00
      080000000000000000000A000000CC00020000000000FFFFFF00000000020000
      00000000000000CA14000006004D656D6F313800020048000000A40100003C00
      00001800000003000D0001000000000000000000FFFFFF1F2C0004020A006464
      2E6D6D2E797979790001000400C4E0F2E000000000FFFF000000000002000000
      01000000000500417269616C00080000000200000000000A000000CC00020000
      000000FFFFFF00000000020000000000000000004F15000006004D656D6F3239
      00020084000000A40100003C0000001800000003000D00010000000000000000
      00FFFFFF1F2C02000000000001000600D1F7E5F220B900000000FFFF00000000
      000200000001000000000500417269616C00080000000200000000000A000000
      CC00020000000000FFFFFF0000000002000000000000000000E315000006004D
      656D6F3330000200C0000000A40100003C0000001800000003000D0001000000
      000000000000FFFFFF1F2C0004020A0064642E6D6D2E797979790001000B00C4
      E0F2E020EEEFEBE0F2FB00000000FFFF00000000000200000001000000000500
      417269616C00080000000200000000000A000000CC00020000000000FFFFFF00
      000000020000000000000000007A16000006004D656D6F3331000200FC000000
      A4010000800000001800000003000D0001000000000000000000FFFFFF1F2C00
      04020A0064642E6D6D2E797979790001000E00D3F1EBEEE2E8FF20EEEFEBE0F2
      FB00000000FFFF00000000000200000001000000000500417269616C00080000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      000000001517000006004D656D6F33320002007C010000A40100008000000018
      00000003000D0001000000000000000000FFFFFF1F2C0004020A0064642E6D6D
      2E797979790001001200D2E5EDE4E5F0202F20CAEEF2E8F0EEE2EAE000000000
      FFFF00000000000200000001000000000500417269616C000800000002000000
      00000A000000CC00020000000000FFFFFF000000000200000000000000FEFEFF
      020000000A002043617465676F72793100000000040073756D6D000000000000
      000000000000FC0000000000000000000000000000000058001BC5245FECD2E2
      4076366E8DED4EE440}
  end
  object odsPrihDocPoMedicEk: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      
        '  '#39#1044#1072#1090#1072': '#39'||to_char(TDOCS.FD_DATA,'#39'dd.mm.yyyy'#39')||'#39'  '#1057#1095#1077#1090': '#39'||TDO' +
        'CS.fc_doc||'#39'  '#1059#1089#1083#1086#1074#1080#1103' '#1086#1087#1083#1072#1090#1099': '#39'||pc.fc_name||'#39'  '#1058#1077#1085#1076#1077#1088'/'#1050#1086#1090#1080#1088#1086#1074#1082#1072 +
        ': '#39'||TDOCS.FC_KONTRAKT as FC_DOC_PARAM,'
      '  TDOCS.FN_PRICE AS FN_PRICE_DOC,'
      
        '  TDOCS.fc_doc, to_char(TDOCS.fd_invoice,'#39'dd.mm.yyyy'#39') as fc_inv' +
        'oice,   to_char(TDOCS.FD_DATA,'#39'dd.mm.yyyy'#39') AS FC_DATA,'
      
        '  TDOCS.FD_INVOICE, TDOCS.FD_DATA, TDOCS.FC_SCHET_FAKTURA, TDOCS' +
        '.FC_KONTRAKT, '
      
        '  fs.fc_name as FC_FINSOURCE, pc.fc_name as FC_PAYCOND, P.fc_nam' +
        'e as NAMEPOSTAV,'
      ''
      '  TDPC.DPCID,'
      '  TKART.MEDICID,'
      '  TDPC.FN_KOL,'
      
        '  rtrim(TO_CHAR(TDPC.FN_KOL, '#39'FM999G999G990D99999'#39'),'#39'.,'#39') as FC_' +
        'KOL,          '
      '  TDPC.FN_KOL*TKART.FN_PRICE as FN_SUMM,'
      '  TKART.FN_PRICE AS FN_PRICE_DETAIL,'
      ''
      '  TKART.KARTID,'
      
        '  TMEDIC.FC_NAME ||'#39'( '#1087'. '#8470#39'||TKART.FN_PARTY_NUM||'#39')'#39' AS NAMEKART' +
        ','
      '  TKART.FC_SERIAL,'
      
        '  DECODE(TKART.FD_GODEN, null,'#39#39', TO_CHAR(TKART.FD_GODEN,'#39'DD.MM.' +
        'YYYY'#39')) as FC_GODEN,'
      '  '
      '  TEI.FC_NAME AS FC_EDIZM,'
      '  pc.Sfc_value as FC_CERT'
      '                 '
      
        'FROM MED.TDOCS, MED.TFINSOURCE fs, MED.TPAYCOND pc, MED.TPOSTAV ' +
        'P,'
      '     MED.TDPC, MED.TKART, MED.TMEDIC, MED.TEI,'
      
        '     (select -- pfc_value - '#1085#1072#1079#1074#1072#1085#1080#1103' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1077#1081', Sfc_value -' +
        ' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1099
      
        '        p1.FK_ID as PFK_ID, p1.fn_parent as pfn_parent, nvl(p1.f' +
        'c_value, p2.fc_value) as  pfc_value             -- '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      
        '        ,p2.FK_ID as SFK_ID, p2.fn_parent as Sfn_parent, decode(' +
        'p1.FK_ID, null, null, p2.fc_value) as Sfc_value -- '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090
      
        '      from med.tprodcert  p1, med.tprodcert p2 where p1.fk_id(+)' +
        ' = p2.fn_parent) pc'
      '        '
      'WHERE'
      '      TDOCS.fk_mogroupid_to = :MO_GROUP '
      '  AND TDOCS.postavid = p.postavid(+)'
      '  AND TDOCS.FL_EDIT = 0 '
      '  AND tdocs.fp_vidmove = 1 -- '#1090#1086#1083#1100#1082#1086' '#1087#1088#1080#1093#1086#1076#1099' '#1086#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
      '  AND TDOCS.FK_FINSOURCE_ID = fs.fk_id(+)'
      '  AND TDOCS.FK_PAYCOND_ID = pc.fk_id(+)  '
      
        '  AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC (:pADATA1) AND TRUNC (:' +
        'pADATA2)'
      '  '
      '  AND TDPC.KARTID = TKART.KARTID'
      '  AND TKART.FL_DEL = 0'
      '  AND TKART.MEDICID = TMEDIC.MEDICID'
      '  AND TMEDIC.EIID = TEI.EIID(+) '
      '  and TKART.fn_prodcertid = pc.SFK_ID(+)  '
      '  AND TDPC.DPID = TDOCS.DPID'
      '               '
      'ORDER BY fs.fc_name, P.fc_name, TDOCS.FD_DATA ')
    Optimize = False
    Variables.Data = {
      0300000003000000080000003A504144415441310C0000000000000000000000
      080000003A504144415441320C0000000000000000000000090000003A4D4F5F
      47524F5550030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001F000000040000004450494401000000000002000000443101000000
      00000200000044320100000000000A00000046505F5649444D4F564501000000
      000008000000504F535441564944010000000000060000004D4F544F49440100
      00000000080000004D4F46524F4D49440100000000000A00000046435F434F4D
      4D454E540100000000000600000046505F564944010000000000090000004D4F
      4F574E455249440100000000000600000046435F444F43010000000000040000
      00444154410100000000000A0000004E414D45504F5354415601000000000006
      000000445049445F310100000000000500000044504349440100000000000700
      00004D45444943494401000000000006000000464E5F4B4F4C01000000000007
      000000464E5F53554D4D010000000000060000004B4152544944010000000000
      080000004E414D454B4152540100000000000900000046435F53455249414C01
      00000000000F000000464E5F50524943455F4D41535445520100000000000F00
      0000464E5F50524943455F44455441494C0100000000000800000046435F4544
      495A4D0100000000000B00000046435F444F435F53554D4D0100000000001200
      000046435F4E414D45504F535441565F53554D4D010000000000070000004643
      5F52414E470100000000000D00000046435F52414E475F4F5244455201000000
      000007000000464E5F52414E470100000000000A00000046445F494E564F4943
      450100000000000600000046435F4B4F4C010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 145
    Top = 192
  end
  object frPrihDocPoMedicEk2: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 143
    Top = 287
    ReportForm = {
      19000000B81C0000190000FFFF01000100FFFFFFFFFF09000000340800009A0B
      00004800000024000000120000002400000000FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      000024000000F6020000B50000003000000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200470100000B004D61737465
      724461746131000201000000001C020000F60200001400000031000500010000
      00000000000000FFFFFF1F0000000011006672444253656C446F63506F4D6564
      696300000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200B20100000B0050616765466F6F7465
      723100020100000000D4020000F6020000190000003000030001000000000000
      000000FFFFFF1F00000000000000000000000000FFFF00000000000200000001
      0000000000000001000000C8000000140000000100000000000002001F020000
      0D004D6173746572466F6F7465723100020100000000A0020000F60200001200
      00003100060001000000000000000000FFFFFF1F000000000000000000000000
      00FFFF000000000002000000010000000000000001000000C800000014000000
      010000000000000200AD0200000C0047726F7570486561646572310002010000
      000094010000F6020000680000003000100001000000000000000000FFFFFF1F
      0000000022005B6F647350726968446F63506F4D65646963456B2E224E414D45
      504F53544156225D00000000000000FFFF000000000002000000010000000000
      000001000000C800000014000000010000000000000200190300000C0047726F
      7570466F6F746572310002010000000048020000F60200001400000030001100
      01000000000000000000FFFFFF1F00000000000000000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      000200A2030000050042616E6431000201000000003C010000F6020000240000
      003000100001000000000000000000FFFFFF1F0000000024005B6F6473507269
      68446F63506F4D65646963456B2E2246435F46494E534F55524345225D000000
      00000000FFFF000000000002000000010000000000000001000000C800000014
      0000000100000000000002000E0400000C0047726F7570466F6F746572320002
      010000000078020000F60200000C0000003000110001000000000000000000C0
      C0C00000000000000000000000000000FFFF0000000000020000000100000000
      00000001000000C800000014000000010000000000000000B604000006004D65
      6D6F343100020048000000C40100003C00000014000000030007000100000000
      0000000000FFFFFF1F2C0004020A0064642E6D6D2E797979790001001F005B6F
      647350726968446F63506F4D65646963456B2E2246445F44415441225D000000
      00FFFF00000000000200000001000000000500417269616C0008000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      5105000006004D656D6F313300020048000000D60200009C0200001400000003
      00000001000000000000000000FFFFFF1F2C02000000000001001C00F1F2F02E
      205B50414745235D20E8E7205B544F54414C50414745535D00000000FFFF0000
      0000000200000001000000040500417269616C000A0000000000000000000900
      0000CC00020000000000FFFFFF0000000002000000000000000000D605000006
      004D656D6F313500020048000000A0020000A60100001100000003000F00DC05
      0000000000000000FFFFFF1F2C02000000000001000600C8F2EEE3EE3A000000
      00FFFF00000000000200000001000000000500417269616C000A000000020000
      00000009000000CC00020000000000FFFFFF0000000002000000000000000000
      8B06000006004D656D6F3137000200EE010000A0020000F60000001100000023
      000F00DC050000000000000000FFFFFF1F2C0204011000232323202323232023
      23302E303020F000010026005B53554D285B6F647350726968446F63506F4D65
      646963456B2E22464E5F53554D4D225D295D00000000FFFF0000000000020000
      0001000000000500417269616C000C00000002000000000009000000CC000200
      00000000FFFFFF00000000020000000000000000001607000006004D656D6F31
      3900020048000000DE010000BA0000001E00000003000F00DC05000000000000
      0000CCFFCC002C02000000000001000C00CDE0E8ECE5EDEEE2E0EDE8E5000000
      00FFFF00000000000200000001000000000500417269616C0009000000020000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      9C07000006004D656D6F323100020002010000DE010000360000001E00000003
      000F00DC050000000000000000CCFFCC002C02000000000001000700C5E42E20
      E8E7EC00000000FFFF00000000000200000001000000000500417269616C0009
      0000000200000000000A000000CC00020000000000FFFFFF0000000002000000
      0000000000002008000006004D656D6F323200020038010000DE010000450000
      001E00000003000F00DC050000000000000000CCFFCC002C0200000000000100
      0500D1E5F0E8FF00000000FFFF00000000000200000001000000000500417269
      616C00090000000200000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000A508000006004D656D6F32330002001F020000DE0100
      002F0000001E00000003000F00DC050000000000000000CCFFCC002C02000000
      000001000600CAEEEB2DE2EE00000000FFFF0000000000020000000100000000
      0500417269616C00090000000200000000000A000000CC00020000000000FFFF
      FF00000000020000000000000000002B09000006004D656D6F32340002004E02
      0000DE010000440000001E00000003000F00DC050000000000000000CCFFCC00
      2C02000000000001000700D6E5EDE02C20F000000000FFFF0000000000020000
      0001000000000500417269616C00090000000200000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000B209000006004D656D6F32
      3500020092020000DE010000520000001E00000003000F00DC05000000000000
      0000CCFFCC002C02000000000001000800D1F3ECECE02C20F000000000FFFF00
      000000000200000001000000000500417269616C00090000000200000000000A
      000000CC00020000000000FFFFFF0000000002000000000000000000510A0000
      06004D656D6F3436000200480000001C020000BA0000001400000003000F0001
      000000000000000000FFFFFF1F2C020000000000010020005B6F647350726968
      446F63506F4D65646963456B2E224E414D454B415254225D00000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000800
      0000CC00020000000000FFFFFF0000000002000000000000000000F00A000006
      004D656D6F3437000200020100001C020000360000001400000003000F000100
      0000000000000000FFFFFF1F2C020000000000010020005B6F64735072696844
      6F63506F4D65646963456B2E2246435F4544495A4D225D00000000FFFF000000
      00000200000001000000000500417269616C00080000000000000000000A0000
      00CC00020000000000FFFFFF0000000002000000000000000000900B00000600
      4D656D6F3438000200380100001C020000450000001400000003000F00010000
      00000000000000FFFFFF1F2C020000000000010021005B6F647350726968446F
      63506F4D65646963456B2E2246435F53455249414C225D00000000FFFF000000
      00000200000001000000000500417269616C00080000000000000000000A0000
      00CC00020000000000FFFFFF00000000020000000000000000002D0C00000600
      4D656D6F34390002001E0200001C0200002F0000001400000003000F00010000
      00000000000000FFFFFF1F2C02000000000001001E005B6F647350726968446F
      63506F4D65646963456B2E2246435F4B4F4C225D00000000FFFF000000000002
      00000001000000000500417269616C00080000000000000000000A000000CC00
      020000000000FFFFFF0000000002000000000000000000E30C000006004D656D
      6F35300002004D0200001C020000440000001400000003000F00010000000000
      00000000FFFFFF1F2C020301100023232320232323202323302E303020F00001
      0027005B6F647350726968446F63506F4D65646963456B2E22464E5F50524943
      455F44455441494C225D00000000FFFF00000000000200000001000000000500
      417269616C000800000000000000000009000000CC00020000000000FFFFFF00
      00000002000000000000000000910D000006004D656D6F353100020091020000
      1C020000520000001400000003000F0001000000000000000000FFFFFF1F2C02
      0301100023232320232323202323302E303020F00001001F005B6F6473507269
      68446F63506F4D65646963456B2E22464E5F53554D4D225D00000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000900
      0000CC00020000000000FFFFFF00000000020000000000000000003A0E000005
      004D656D6F3600020048000000980100009C0200001400000003000F00020000
      00000000000000CCFFFF002C02000000000001002B002020202020202020205B
      6F647350726968446F63506F4D65646963456B2E224E414D45504F5354415622
      5D00000000FFFF00000000000200000001000000040500417269616C00090000
      0002000000000008000000CC00020000000000FFFFFF00000000020000000000
      00000000E50E000005004D656D6F380002004800000048020000EA0100001400
      000003000F0002000000000000000000FFFFFF1F2C02000000000001002D00C8
      F2EEE3EE20EFEE20225B6F647350726968446F63506F4D65646963456B2E224E
      414D45504F53544156225D2200000000FFFF0000000000020000000100000000
      0500417269616C000A00000000000000000009000000CC00020000000000FFFF
      FF0000000002000000000000000000990F000005004D656D6F39000200320200
      0048020000B20000001400000003000F0002000000000000000000FFFFFF1F2C
      020401100023232320232323202323302E303020F000010026005B53554D285B
      6F647350726968446F63506F4D65646963456B2E22464E5F53554D4D225D295D
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      02000000000009000000CC00020000000000FFFFFF0000000002000000000000
      0000001A11000005004D656D6F34000200480000009B0000009C0200001B0000
      000300000001000000000000000000FFFFFF1F2C02000000000001001400CFEE
      F1F2F3EFEBE5EDE8E520E220E0EFF2E5EAF30006000500626567696E0D310020
      695F44504944203A3D20303B202F2F20EDEEECE5F020205B6F647353656C446F
      63507269685265702E2244504944225D0D2E0020695F726F775F6E756D5F6465
      7461696C203A3D20303B202F2F20EDEEECE5F020F1F2F0EEEAE8206465746169
      6C0D2D0020695F726F775F6E756D5F6D6173746572203A3D20303B202F2FEDEE
      ECE5F020F1F2F0EEEAE8206D61737465720D4A0020695F464E5F50524943455F
      4D4153544552203A3D20303B202F2F20E8F2EEE3EEE2E0FF20F1F3ECECE020EF
      EE20F1F2EEEBE1F6F32022D1F3ECECE020EFEE20E4EEEAF3ECE5EDF2F3220D03
      00656E6400FFFF00000000000200000001000000040500417269616C000E0000
      0002000000000002000000CC00020000000000FFFFFF00000000020000000000
      00000000C011000006004D656D6F313400020048000000B30000009C02000018
      0000000300000001000000000000000000FFFFFF1F2C02000000000001002700
      20E7E020EFE5F0E8EEE420F1205B7661725F64617465315D20EFEE205B766172
      5F64617465325D00000000FFFF00000000000200000001000000040500417269
      616C000C0000000200000000000A000000CC00020000000000FFFFFF00000000
      020000000000000000005612000006004D656D6F323000020049000000410000
      004B0200000E0000000300000001000000000000000000FFFFFF1F2C02000000
      000001001700EDE0E8ECE5EDEEE2E0EDE8E520F3F7F0E5E6E4E5EDE8FF000000
      00FFFF00000000000200000001000000000500417269616C0008000000000000
      000000020000000100020000000000FFFFFF0000000002000000000000000000
      E312000006004D656D6F323600020049000000240000004B0200001C00000003
      00020001000000000000000000CCFFCC002C02000000000001000E005B766172
      5F72656365697665725D00000000FFFF00000000000200000001000000000500
      417269616C000A000000000000000000120000000100020000000000FFFFFF00
      000000020000000000000000007013000006004D656D6F323700020049000000
      550000004B020000190000000300020001000000000000000000CCFFCC002C02
      000000000001000E005B7661725F6D6F5F67726F75705D00000000FFFF000000
      00000200000001000000000500417269616C000C000000000000000000120000
      00CC00020000000000FFFFFF0000000002000000000000000000091400000600
      4D656D6F3238000200490000006F0000004B0200000E00000003000000010000
      00000000000000FFFFFF1F2C02000000000001001A00EDE0E8ECE5EDEEE2E0ED
      E8E520EFEEE4F0E0E7E4E5EBE5EDE8FF00000000FFFF00000000000200000001
      000000000500417269616C000800000000000000000002000000CC0002000000
      0000FFFFFF0000000002000000000000000000AB14000005004D656D6F310002
      00480000004C0100009C0200001400000003000F0002000000000000000000C0
      C0C0002C020000000000010024005B6F647350726968446F63506F4D65646963
      456B2E2246435F46494E534F55524345225D00000000FFFF0000000000020000
      0001000000040500417269616C000900000002000000000008000000CC000200
      00000000FFFFFF00000000020000000000000000004715000005004D656D6F32
      00020084000000C40100003C0000001400000003000700010000000000000000
      00FFFFFF1F2C02000000000001001E005B6F647350726968446F63506F4D6564
      6963456B2E2246435F444F43225D00000000FFFF000000000002000000010000
      00000500417269616C00080000000000000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000EE15000005004D656D6F33000200C0
      000000C40100003C000000140000000300070001000000000000000000FFFFFF
      1F2C0004020A0064642E6D6D2E797979790001001F005B6F647350726968446F
      63506F4D65646963456B2E2246445F44415441225D00000000FFFF0000000000
      0200000001000000000500417269616C00080000000000000000000A000000CC
      00020000000000FFFFFF00000000020000000000000000009816000005004D65
      6D6F35000200FC000000C4010000800000001400000003000700010000000000
      00000000FFFFFF1F2C0004020A0064642E6D6D2E7979797900010022005B6F64
      7350726968446F63506F4D65646963456B2E2246435F504159434F4E44225D00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      00000000000A000000CC00020000000000FFFFFF000000000200000000000000
      00004317000005004D656D6F370002007C010000C40100008000000014000000
      0300070001000000000000000000FFFFFF1F2C0000000A0064642E6D6D2E7979
      797900010023005B6F647350726968446F63506F4D65646963456B2E2246435F
      4B4F4E5452414B54225D00000000FFFF00000000000200000001000000000500
      417269616C00080000000000000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000CF17000006004D656D6F31300002007D010000
      DE0100004D0000001E00000003000F00DC050000000000000000CCFFCC002C02
      000000000001000D00D1F0EEEA20E3EEE4EDEEF1F2E800000000FFFF00000000
      000200000001000000000500417269616C00090000000200000000000A000000
      CC00020000000000FFFFFF00000000020000000000000000005718000006004D
      656D6F3131000200CA010000DE010000550000001E00000003000F00DC050000
      000000000000CCFFCC002C02000000000001000900D1E5F0F2F4E8EAE0F20000
      0000FFFF00000000000200000001000000000500417269616C00090000000200
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      00F618000006004D656D6F31320002007D0100001C0200004D00000014000000
      03000F0001000000000000000000FFFFFF1F2C020000000000010020005B6F64
      7350726968446F63506F4D65646963456B2E2246435F474F44454E225D000000
      00FFFF00000000000200000001000000000500417269616C0008000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      9419000006004D656D6F3136000200CA0100001C020000540000001400000003
      000F0001000000000000000000FFFFFF1F2C02000000000001001F005B6F6473
      50726968446F63506F4D65646963456B2E2246435F43455254225D00000000FF
      FF00000000000200000001000000000500417269616C00080000000000000000
      000A000000CC00020000000000FFFFFF0000000002000000000000000000211A
      000006004D656D6F313800020048000000AC0100003C0000001800000003000D
      0001000000000000000000FFFFFF1F2C0004020A0064642E6D6D2E7979797900
      01000400C4E0F2E000000000FFFF000000000002000000010000000005004172
      69616C00080000000200000000000A000000CC00020000000000FFFFFF000000
      0002000000000000000000A61A000006004D656D6F323900020084000000AC01
      00003C0000001800000003000D0001000000000000000000FFFFFF1F2C020000
      00000001000600D1F7E5F220B900000000FFFF00000000000200000001000000
      000500417269616C00080000000200000000000A000000CC00020000000000FF
      FFFF00000000020000000000000000003A1B000006004D656D6F3330000200C0
      000000AC0100003C0000001800000003000D0001000000000000000000FFFFFF
      1F2C0004020A0064642E6D6D2E797979790001000B00C4E0F2E020EEEFEBE0F2
      FB00000000FFFF00000000000200000001000000000500417269616C00080000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000D11B000006004D656D6F3331000200FC000000AC0100008000000018
      00000003000D0001000000000000000000FFFFFF1F2C0004020A0064642E6D6D
      2E797979790001000E00D3F1EBEEE2E8FF20EEEFEBE0F2FB00000000FFFF0000
      0000000200000001000000000500417269616C00080000000200000000000A00
      0000CC00020000000000FFFFFF00000000020000000000000000006C1C000006
      004D656D6F33320002007C010000AC010000800000001800000003000D000100
      0000000000000000FFFFFF1F2C0004020A0064642E6D6D2E7979797900010012
      00D2E5EDE4E5F0202F20CAEEF2E8F0EEE2EAE000000000FFFF00000000000200
      000001000000000500417269616C00080000000200000000000A000000CC0002
      0000000000FFFFFF000000000200000000000000FEFEFF020000000A00204361
      7465676F72793100000000040073756D6D000000000000000000000000FC0000
      000000000000000000000000000058001BC5245FECD2E240AD3C6E8DED4EE440}
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
    Left = 640
    Top = 180
  end
  object odsPrihDocPoFinsource: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  MASTER1.*, DETAIL1.*,'
      
        '  rtrim(TO_CHAR(DETAIL1.FN_KOL, '#39'FM999G999G990D99999'#39'),'#39'.,'#39') as ' +
        'FC_KOL'
      ''
      '  FROM'
      '    (SELECT'
      '       FN_PRICE AS FN_PRICE_MASTER,'
      
        '       :pADATA1 AS D1, :pADATA2 AS D2,FP_VIDMOVE,TDOCS.POSTAVID,' +
        ' MOTOID, MOFROMID, TDOCS.FC_COMMENT, FP_VID, '
      '       MOOWNERID, TDOCS.DPID,'
      
        '--   '#39#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#8470' '#39'||FC_DOC||'#39' '#1086#1090' '#39'||to_char(FD_INVOICE,'#39'dd.mm.y' +
        'yyy'#39') AS FC_DOC, '
      
        '       med.GET_DECODEDOCVIDMOVE(fp_vidmove)||'#39' '#8470' '#39'||TDOCS.fc_doc' +
        '||'#39' '#1086#1090' '#39'||to_char(TDOCS.fd_invoice,'#39'dd.mm.yyyy'#39')||DECODE(:IS_KON' +
        'TRAKT_SHOW, 0,'#39#39', DECODE(TDOCS.FC_KONTRAKT, null,'#39#39', '#39', '#1082#1086#1085#1090#1088#1072#1082#1090 +
        ': '#39'||TDOCS.FC_KONTRAKT)) AS fc_DOC,'
      '       TRUNC(TDOCS.FD_DATA) AS DATA,'
      '       TDOCS.FD_INVOICE,'
      '-- TMO.FC_NAME, '
      
        '       decode(NVL(TMO.FC_NAME,'#39#39'),'#39#39', MOGR_TO.fc_group, MOGR_TO.' +
        'fc_group ||'#39'('#39'|| TMO.FC_NAME||'#39')'#39') AS FC_NAME,'
      
        '       DECODE(TDOCS.fp_vidmove, 7, '#39#1057#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086' '#1074' '#1056 +
        #1055#1054#39', 8, '#39#1057#1087#1080#1089#1072#1085#1080#1077#39', MOGR_TO.fc_group) as FC_MO_GR_TO,'
      
        '--       DECODE(TDOCS.FP_VID,1,TPOSTAV.FC_NAME,2,decode(NVL(T2.F' +
        'C_NAME,'#39#39'),'#39#39', MOGR_FROM.fc_group, MOGR_FROM.fc_group ||'#39'('#39'|| T2' +
        '.FC_NAME||'#39')'#39')) AS NAMEPOSTAV,'
      
        '       DECODE(TDOCS.FP_VIDMOVE, 1,TPOSTAV.FC_NAME, 9, '#39#1042#1074#1086#1076' '#1086#1089#1090#1072 +
        #1090#1082#1086#1074#39', 2,MOGR_FROM.fc_group, 3,MOGR_FROM.fc_group, 6, MOGR_FROM.' +
        'fc_group||'#39' ('#1074#1086#1079#1074#1088#1072#1090')'#39', 10,MED.PKGTMO.getnamebyid( MED.PKG_MEDSE' +
        'S.GET_PRODUCE_MO ), '#39#39' ) AS NAMEPOSTAV,'
      
        '--       DECODE(TDOCS.fp_vidmove, 1,TPOSTAV.FC_NAME, 9,'#39#1042#1074#1086#1076' '#1086#1089#1090 +
        #1072#1090#1082#1086#1074#39'/*MED.PKG_MEDSES.GET_MOGROUP_NAME( TDOCS.fk_mogroupid_to)*' +
        '/, 10,MED.PKGTMO.getnamebyid( MED.PKG_MEDSES.GET_PRODUCE_MO ), '#39 +
        #39' ) AS NAMEPOSTAV,'
      '       MED.GET_DECODEDOCVID(FP_VIDMOVE) AS VIDDOC'
      
        '       FROM MED.TDOCS, MED.TMO, MED.TPOSTAV, MED.TMO T2 , MED.TM' +
        'O_GROUP MOGR_FROM,  MED.TMO_GROUP MOGR_TO'
      
        '     WHERE :MO_GROUP = TDOCS.fk_mogroupid_to -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077#1084' '#1085 +
        #1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      '  AND  TDOCS.MOTOID = TMO.MOID(+)'
      '--  AND TDOCS.FP_VID IN (1,3) '
      '--  AND TDOCS.FP_VIDMOVE IN (1,5,6)'
      
        '  AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID,  TDOCS' +
        '.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid_to, :MO' +
        '_GROUP) = +1'
      
        '  AND tdocs.fp_vidmove <> 6 -- '#1074#1089#1077', '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072' - '#1087#1086#1089#1082#1086#1083#1100#1082#1091' '#1074 +
        #1086#1079#1074#1088#1072#1090' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074' '#1076#1074#1080#1078#1077#1085#1080#1080' ('#1082#1086#1075#1076#1072' '#1087#1088#1080#1093#1086#1076'+'#1088#1072#1089#1093#1086#1076 +
        ')'
      '  AND (not tdocs.fp_vidmove in (4,5))'
      '  AND ((:IS_RPO = 1)OR(tdocs.fp_vidmove <> 10))'
      '  AND TDOCS.FL_EDIT = 0 '
      
        '  AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC (:pADATA1) AND TRUNC (:' +
        'pADATA2)'
      '  AND TDOCS.POSTAVID=TPOSTAV.POSTAVID (+)'
      '--  AND TMO.MOID=:AMOID'
      '  AND TDOCS.MOFROMID = T2.MOID (+)'
      '  AND TDOCS.fk_mogroupid_from = MOGR_FROM.groupid (+)'
      '  AND TDOCS.fk_mogroupid_to = MOGR_TO.groupid (+)'
      '     ORDER BY DATA DESC'
      '    ) MASTER1,'
      '    (SELECT '
      '          TDPC.DPID,'
      '          TDPC.DPCID,'
      '          TKART.MEDICID,'
      '          TDPC.FN_KOL,'
      '          TDPC.FN_KOL*TKART.FN_PRICE as FN_SUMM,'
      '--          FN_SUMM,'
      
        '--          DECODE(FN_KOL,0,0,ROUND(FN_SUMM / FN_KOL,2)) AS FN_P' +
        'RICE_DETAIL,'
      '          TKART.FN_PRICE AS FN_PRICE_DETAIL,'
      ''
      '          TKART.KARTID,'
      '          NVL(FS.FC_NAME,'#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39') FC_FINSOURCE,'
      '          TMEDIC.FC_NAME as MEDICNAME,'
      
        '          TMEDIC.FC_NAME ||'#39'( '#1087'. '#8470#39'||TKART.FN_PARTY_NUM||'#39')'#39' AS ' +
        'NAMEKART,'
      '          TKART.FC_SERIAL,'
      '          TKART.FN_PARTY_NUM,'
      '          TEI.FC_NAME AS FC_EDIZM,'
      '--          tmedictype.fc_name as FC_medictype'
      '          UG.fc_uchgr  as FC_medictype'
      '        FROM'
      
        '          MED.TDPC, MED.TKART, MED.TMEDIC, MED.TEI, MED.TUCHGR U' +
        'G, MED.TFINSOURCE FS, MED.TDOCS --med.tmedictype'
      '        WHERE'
      '          TDPC.KARTID = TKART.KARTID'
      '          AND TKART.FL_DEL = 0'
      '          AND TKART.FK_FINSOURCE_ID = FS.FK_ID (+)'
      '          AND TKART.MEDICID=TMEDIC.MEDICID'
      '          AND TEI.EIID(+)=TMEDIC.EIID'
      '          and TDPC.DPID = TDOCS.DPID'
      
        '          and :MO_GROUP = TDOCS.fk_mogroupid_to -- '#1089#1088#1072#1079#1091' '#1086#1090#1089#1077#1082#1072#1077 +
        #1084' '#1085#1077#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      
        '          AND MED.PKG_PRIHRASH.Get_PrihRashPriznak (TDOCS.FP_VID' +
        ',  TDOCS.FP_VIDMOVE, TDOCS.fk_mogroupid_from, TDOCS.fk_mogroupid' +
        '_to, :MO_GROUP) = +1'
      '          AND TDOCS.FL_EDIT = 0 '
      
        '          AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC (:pADATA1) AND ' +
        'TRUNC (:pADATA2)                    '
      ''
      '--          AND TMEDIC.FL_VISIBLE = 1            '
      '--          AND TMEDIC.fk_type = tmedictype.fk_id(+)'
      '          AND #uchgrid# = ug.uchgrid'
      '        ORDER BY TDPC.DPCID'
      '       '
      '    ) DETAIL1'
      '  WHERE '
      '  MASTER1.DPID = DETAIL1.DPID'
      
        '  ORDER BY UPPER(FC_FINSOURCE), LOWER(MEDICNAME), MASTER1.NAMEPO' +
        'STAV, MASTER1.DATA, FN_PARTY_NUM')
    Optimize = False
    Variables.Data = {
      0300000005000000080000003A504144415441310C0000000700000078700B01
      01010100000000080000003A504144415441320C0000000700000078710B1E18
      3C3C00000000090000003A4D4F5F47524F555003000000040000009D04000000
      000000070000003A49535F52504F030000000400000000000000000000001100
      00003A49535F4B4F4E5452414B545F53484F5703000000040000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      0400000021000000040000004450494401000000000002000000443101000000
      00000200000044320100000000000A00000046505F5649444D4F564501000000
      000008000000504F535441564944010000000000060000004D4F544F49440100
      00000000080000004D4F46524F4D49440100000000000A00000046435F434F4D
      4D454E540100000000000600000046505F564944010000000000090000004D4F
      4F574E455249440100000000000600000046435F444F43010000000000040000
      00444154410100000000000700000046435F4E414D450100000000000A000000
      4E414D45504F5354415601000000000006000000564944444F43010000000000
      06000000445049445F3101000000000005000000445043494401000000000007
      0000004D45444943494401000000000006000000464E5F4B4F4C010000000000
      07000000464E5F53554D4D010000000000060000004B41525449440100000000
      00080000004E414D454B4152540100000000000900000046435F53455249414C
      0100000000000F000000464E5F50524943455F4D41535445520100000000000F
      000000464E5F50524943455F44455441494C0100000000000A00000046445F49
      4E564F4943450100000000000B00000046435F4D4F5F47525F544F0100000000
      00090000004D454449434E414D450100000000000C000000464E5F5041525459
      5F4E554D0100000000000800000046435F4544495A4D0100000000000C000000
      46435F4D45444943545950450100000000000600000046435F4B4F4C01000000
      00000C00000046435F46494E534F55524345010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 421
    Top = 348
  end
  object frPrihDocPoFinsource: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 421
    Top = 402
    ReportForm = {
      1900000012170000190000FFFF01000100FFFFFFFFFF090000009A0B00003408
      00004800000024000000190000002400000001FFFF00000000FFFF0100000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200080100000C005265706F72745469746C65310002010000
      0000240000002F040000A50000003000000001000000000000000000FFFFFF1F
      0000000000000000000004000500626567696E0D15002020464E5F47524F5550
      5F53554D4D203A3D20303B0D15002020464E5F49544F474F5F53554D4D203A3D
      20303B0D0300656E6400FFFF0000000000020000000100000000000000010000
      00C800000014000000010000000000000200750100000D004D61737465724865
      616465723100020100000000280100002F0400002700000030000E0001000000
      000000000000FFFFFF1F00000000000000000000000000FFFF00000000000200
      0000010000000000000001000000C800000014000000010000000000000200EB
      0100000B004D6173746572446174613100020100000000940100002F04000014
      0000003100050001000000000000000000FFFFFF1F000000000B00667244426F
      6473506F737400000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200580200000D004D61737465
      72466F6F7465723100020100000000040200002F040000190000003100060001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200C30200000B0050616765466F6F7465723100020100000000380200002F04
      0000140000003000030001000000000000000000FFFFFF1F0000000000000000
      0000000000FFFF000000000002000000010000000000000001000000C8000000
      140000000100000000000002002F0300000C0047726F7570466F6F7465723100
      020100000000C60100002F040000140000003000110001000000000000000000
      FFFFFF1F00000000000000000000000000FFFF00000000000200000001000000
      0000000001000000C800000014000000010000000000000200E60300000C0047
      726F75704865616465723100020100000000640100002F040000140000003000
      100001000000000000000000FFFFFF1F0000000026005B6F647350726968446F
      63506F46696E736F757263652E2246435F46494E534F55524345225D00000000
      03000500626567696E0D15002020464E5F47524F55505F53554D4D203A3D2030
      3B0D0300656E6400FFFF000000000002000000010000000000000001000000C8
      000000140000000100000000000000006804000005004D656D6F32000200B301
      000028010000540000002700000003000F00DC050000000000000000CCFFCC00
      2C02000000000001000400C4E0F2E000000000FFFF0000000000020000000100
      0000000500417269616C000A0000000200000000000A000000CC000200000000
      00FFFFFF0000000002000000000000000000EE04000005004D656D6F33000200
      0702000028010000A00000002700000003000F00DC050000000000000000CCFF
      CC002C02000000000001000800C4EEEAF3ECE5EDF200000000FFFF0000000000
      0200000001000000000500417269616C000A0000000200000000000A000000CC
      00020000000000FFFFFF00000000020000000000000000007505000005004D65
      6D6F34000200A702000028010000870000002700000003000F00DC0500000000
      00000000CCFFCC002C02000000000001000900CFEEF1F2E0E2F9E8EA00000000
      FFFF00000000000200000001000000000500417269616C000A00000002000000
      00000A000000CC00020000000000FFFFFF000000000200000000000000000012
      06000006004D656D6F3431000200B30100009401000054000000140000000300
      0F002C010000000000000000FFFFFF1F2C02000000000001001E005B6F647350
      726968446F63506F46696E736F757263652E2244415441225D00000000FFFF00
      000000000200000001000000000500417269616C000800000000000000000008
      000000CC00020000000000FFFFFF0000000002000000000000000000B1060000
      06004D656D6F34320002000702000094010000A00000001400000003000F002C
      010000000000000000FFFFFF1F2C020000000000010020005B6F647350726968
      446F63506F46696E736F757263652E2246435F444F43225D00000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000800
      0000CC00020000000000FFFFFF00000000020000000000000000005407000006
      004D656D6F3434000200A702000094010000870000001400000003000F002C01
      0000000000000000FFFFFF1F2C020000000000010024005B6F64735072696844
      6F63506F46696E736F757263652E224E414D45504F53544156225D00000000FF
      FF00000000000200000001000000000500417269616C00080000000000000000
      0008000000CC00020000000000FFFFFF0000000002000000000000000000D907
      000006004D656D6F31350002004800000004020000180300001900000003000F
      00DC050000000000000000FFFFFF1F2C02000000000001000600C8F2EEE3EE3A
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      02000000000009000000CC00020000000000FFFFFF0000000002000000000000
      0000007B08000006004D656D6F31370002006003000004020000B60000001900
      000023000F00DC050000000000000000FFFFFF1F2C0204011400232323202323
      2320232323202323302E303020F00001000F005B464E5F49544F474F5F53554D
      4D5D00000000FFFF00000000000200000001000000000500417269616C000A00
      000002000000000009000000CC00020000000000FFFFFF000000000200000000
      00000000001609000006004D656D6F31310002004800000039020000CE030000
      110000000300000001000000000000000000FFFFFF1F2C02000000000001001C
      00F1F2F02E205B50414745235D20E8E7205B544F54414C50414745535D000000
      00FFFF00000000000200000001000000040500417269616C000A000000000000
      00000009000000CC00020000000000FFFFFF0000000002000000000000000000
      9A09000006004D656D6F313400020048000000280100001E0000002700000003
      000F00DC050000000000000000CCFFCC002C02000000000001000500B920EF2F
      EF00000000FFFF00000000000200000001000000000500417269616C000A0000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000230A000006004D656D6F343000020048000000940100001E00000014
      00000003000F0001000000000000000000FFFFFF1F2C02000000000002000700
      5B4C494E45235D0D000000000000FFFF00000000000200000001000000000500
      417269616C00080000000000000000000A000000CC00020000000000FFFFFF00
      00000002000000000000000000AE0A000006004D656D6F323100020066000000
      280100000D0100002700000003000F00DC050000000000000000CCFFCC002C02
      000000000001000C00CDE0E8ECE5EDEEE2E0EDE8E500000000FFFF0000000000
      0200000001000000000500417269616C000A0000000200000000000A000000CC
      00020000000000FFFFFF0000000002000000000000000000350B000006004D65
      6D6F32330002007301000028010000400000002700000003000F00DC05000000
      0000000000CCFFCC002C02000000000001000800C5E42E20E8E7EC2E00000000
      FFFF00000000000200000001000000000500417269616C000A00000002000000
      00000A000000CC00020000000000FFFFFF0000000002000000000000000000BA
      0B000006004D656D6F32340002002E0300002801000032000000270000000300
      0F00DC050000000000000000CCFFCC002C02000000000001000600CAEEEB2DE2
      EE00000000FFFF00000000000200000001000000000500417269616C000A0000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000400C000006004D656D6F323500020060030000280100004D00000027
      00000003000F00DC050000000000000000CCFFCC002C02000000000001000700
      D6E5EDE02C20F000000000FFFF00000000000200000001000000000500417269
      616C000A0000000200000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000C70C000006004D656D6F3236000200AD030000280100
      00690000002700000003000F00DC050000000000000000CCFFCC002C02000000
      000001000800D1F3ECECE02C20F000000000FFFF000000000002000000010000
      00000500417269616C000A0000000200000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000680D000006004D656D6F3237000200
      66000000940100000D0100001400000003000F0001000000000000000000FFFF
      FF1F2C020000000000010022005B6F647350726968446F63506F46696E736F75
      7263652E224E414D454B415254225D00000000FFFF0000000000020000000100
      0000000500417269616C000800000000000000000008000000CC000200000000
      00FFFFFF0000000002000000000000000000090E000006004D656D6F32380002
      007301000094010000400000001400000003000F0001000000000000000000FF
      FFFF1F2C020000000000010022005B6F647350726968446F63506F46696E736F
      757263652E2246435F4544495A4D225D00000000FFFF00000000000200000001
      000000000500417269616C00080000000000000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000A80E000006004D656D6F323900
      02002E03000094010000320000001400000003000F0001000000000000000000
      FFFFFF1F2C020000000000010020005B6F647350726968446F63506F46696E73
      6F757263652E2246435F4B4F4C225D00000000FFFF0000000000020000000100
      0000000500417269616C00080000000000000000000A000000CC000200000000
      00FFFFFF00000000020000000000000000005E0F000006004D656D6F33300002
      0060030000940100004D0000001400000003000F0001000000000000000000FF
      FFFF1F2C0204010E0023232320232323202323302E303000010029005B6F6473
      50726968446F63506F46696E736F757263652E22464E5F50524943455F444554
      41494C225D00000000FFFF00000000000200000001000000000500417269616C
      000800000000000000000009000000CC00020000000000FFFFFF000000000200
      0000000000000000AD10000006004D656D6F3331000200AD0300009401000069
      0000001400000003000F0001000000000000000000FFFFFF1F2C020401120023
      23232023232320232323202323302E303000010021005B6F647350726968446F
      63506F46696E736F757263652E22464E5F53554D4D225D000400050062656769
      6E0D45002020464E5F47524F55505F53554D4D203A3D20464E5F47524F55505F
      53554D4D202B205B6F647350726968446F63506F46696E736F757263652E2246
      4E5F53554D4D225D3B0D45002020464E5F49544F474F5F53554D4D203A3D2046
      4E5F49544F474F5F53554D4D202B205B6F647350726968446F63506F46696E73
      6F757263652E22464E5F53554D4D225D3B0D0300656E6400FFFF000000000002
      00000001000000000500417269616C000800000000000000000009000000CC00
      020000000000FFFFFF00000000020000000000000000005011000005004D656D
      6F360002004800000090000000CE0300001B0000000300000001000000000000
      000000FFFFFF1F2C02000000000001002500CEF2F7E5F220EFEE20EFF0E8F5EE
      E4F320EFEE20E3F0F3EFEFE0EC20F3F7E5F2EDEEF1F2E800000000FFFF000000
      00000200000001000000000500417269616C000E000000020000000000020000
      00CC00020000000000FFFFFF0000000002000000000000000000F41100000500
      4D656D6F3700020048000000A8000000CE030000180000000300000001000000
      000000000000FFFFFF1F2C02000000000001002600E7E020EFE5F0E8EEE420F1
      205B7661725F64617465315D20EFEE205B7661725F64617465325D00000000FF
      FF00000000000200000001000000000500417269616C000C0000000200000000
      000A000000CC00020000000000FFFFFF00000000020000000000000000008912
      000005004D656D6F3800020048000000400000005E0200000E00000003000000
      01000000000000000000FFFFFF1F2C02000000000001001700EDE0E8ECE5EDEE
      E2E0EDE8E520F3F7F0E5E6E4E5EDE8FF00000000FFFF00000000000200000001
      000000000500417269616C000800000000000000000002000000010002000000
      0000FFFFFF00000000020000000000000000001513000005004D656D6F390002
      0048000000240000005E0200001C0000000300020001000000000000000000CC
      FFCC002C02000000000001000E005B7661725F72656365697665725D00000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      0000120000000100020000000000FFFFFF0000000002000000000000000000A2
      13000006004D656D6F313300020048000000550000005E020000190000000300
      020001000000000000000000CCFFCC002C02000000000001000E005B7661725F
      6D6F5F67726F75705D00000000FFFF0000000000020000000100000000050041
      7269616C000C00000000000000000012000000CC00020000000000FFFFFF0000
      0000020000000000000000003B14000006004D656D6F3136000200480000006F
      0000005E0200000E0000000300000001000000000000000000FFFFFF1F2C0200
      0000000001001A00EDE0E8ECE5EDEEE2E0EDE8E520EFEEE4F0E0E7E4E5EBE5ED
      E8FF00000000FFFF00000000000200000001000000000500417269616C000800
      000000000000000002000000CC00020000000000FFFFFF000000000200000000
      0000000000FF14000006004D656D6F313200020048000000C601000018030000
      140000000300090002000000000000000000FFFFFF1F2C020000000000010045
      00C8F2EEE3EE20EFEE20E8F1F22E20F4E8EDE0EDF1E8F0EEE2E0EDE8FF20225B
      6F647350726968446F63506F46696E736F757263652E2246435F46494E534F55
      524345225D2200000000FFFF0000000000020000000100000000050041726961
      6C000A00000002000000000009000000CC00020000000000FFFFFF0000000002
      0000000000000000009F15000006004D656D6F313800020060030000C6010000
      B60000001400000003000F0002000000000000000000FFFFFF1F2C0204011200
      2323232023232320232323202323302E30300001000F005B464E5F47524F5550
      5F53554D4D5D00000000FFFF0000000000020000000100000000050041726961
      6C000A00000002000000000009000000CC00020000000000FFFFFF0000000002
      0000000000000000004416000005004D656D6F310002006600000064010000B0
      0300001400000003000F0002000000000000000000CCFFFF002C020000000000
      01002700205B6F647350726968446F63506F46696E736F757263652E2246435F
      46494E534F55524345225D00000000FFFF000000000002000000010000000005
      00417269616C0009000000020000000000080000000100020000000000FFFFFF
      0000000002000000000000000000C516000005004D656D6F3500020048000000
      640100001E0000001400000003000F0002000000000000000000CCFFFF002C02
      0000000000020000000D000000000000FFFF0000000000020000000100000000
      0500417269616C00080000000000000000000A000000CC00020000000000FFFF
      FF000000000200000000000000FEFEFF020000000A002043617465676F727931
      00000000040073756D6D00010030000000000000000000FC0000000000000000
      000000000000000058008DF9BA39EDD2E240AD3C6E8DED4EE440}
  end
  object frxPrihDocITOG: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872700000000
    ReportOptions.LastChange = 41220.460968657400000000
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
      '  FN_SUMM_ALL := FN_SUMM_ALL + <frxDBReport1."FN_PRICE">;'
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
    Left = 320
    Top = 336
    Datasets = <
      item
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
      end
      item
        DataSet = frxdsNacenkaUcenka
        DataSetName = 'frxdsNacenkaUcenka'
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
            #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1111#1056#1109' '#1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169#1057#1107' '#1056#1111#1056#1109' '#1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1039#1056#1112)
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
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
        RowCount = 0
        Stretched = True
        object Memo11: TfrxMemoView
          Width = 56.692950000000000000
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
            '[frxDBReport1."NAMEPOSTAV"]')
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
            '[frxDBReport1."FN_PRICE"]')
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
        Height = 18.897637795275600000
        Top = 238.110390000000000000
        Width = 1009.134510000000000000
        object Memo8: TfrxMemoView
          Width = 56.692950000000000000
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
          Left = 56.692950000000000000
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
        Condition = 'frxDBReport1."FC_RANG"'
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
            
              #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' [frxDBReport1."FC_RANG"]: [FORMATFLOAT('#39'###,###,' +
              '###,###,##0.,00.'#39', SUM(<frxDBReport1."FN_PRICE">,MasterData1))]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header2: TfrxHeader
        Height = 18.897637800000000000
        Top = 385.512060000000000000
        Width = 1009.134510000000000000
        object Memo15: TfrxMemoView
          Width = 56.692950000000000000
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
            #1056#1116#1056#176#1057#8224#1056#181#1056#1029#1056#1108#1056#176' ('#1056#160#1056#1119#1056#1115')')
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
        DataSet = frxdsNacenkaUcenka
        DataSetName = 'frxdsNacenkaUcenka'
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
            '[frxdsNacenkaUcenka."FN_NACHENKA"]')
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
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1029#1056#176#1057#8224#1056#181#1056#1029#1056#1108#1056#176' ('#1056#160#1056#1119#1056#1115')')
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
            '[SUM(<frxDBNacenkaUcenka."FN_NACHENKA">,MasterData2)]')
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
  object frxDBReport1: TfrxDBDataset
    UserName = 'frxDBReport1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 616
    Top = 304
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
    Left = 616
    Top = 256
    Datasets = <
      item
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
        Top = 18.897650000000000000
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
        Top = 540.472790000000000000
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
        Top = 623.622450000000000000
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
        Top = 823.937540000000000000
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
        Top = 582.047620000000000000
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
        Top = 498.897960000000000000
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
        Top = 427.086890000000000000
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
  object frxdsNacenkaUcenka: TfrxDBDataset
    UserName = 'frxdsNacenkaUcenka'
    CloseDataSource = False
    DataSet = odsNacenkaUcenka
    BCDToCurrency = False
    Left = 320
    Top = 432
  end
  object frxPrihDocPoDOC: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872700000000
    ReportOptions.LastChange = 41220.485355902800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      '  '
      'end.')
    Left = 328
    Top = 104
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
            
              #1056#1038#1056#1109#1056#1111#1057#1026#1056#1109#1056#1030#1056#1109#1056#1169#1056#1105#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1057#8249#1056#8470' '#1057#1026#1056#181#1056#181#1057#1027#1057#8218#1057#1026'  '#1056#1111#1056#1109' '#1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169 +
              #1056#1029#1057#8249#1056#1112' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176#1056#1112)
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
          Left = 56.692950000000000000
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
          Width = 56.692950000000000000
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
          Left = 56.692950000000000000
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
        Condition = 'frxDBReport1."NAMEPOSTAV"'
        object Memo33: TfrxMemoView
          Width = 56.692950000000000000
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
          Left = 56.692950000000000000
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
            '[frxDBReport1."NAMEPOSTAV"]')
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
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' "[frxDBReport1."NAMEPOSTAV"]"')
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
          Left = 831.496600000000000000
          Width = 177.637910000000000000
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
          Width = 831.496600000000000000
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
          Top = 60.472480000000010000
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
          Top = 60.472480000000010000
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
          Top = 86.929189999999900000
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
          Top = 86.929189999999900000
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
          Top = 86.929189999999900000
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
          Top = 98.267780000000010000
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
  object frxPrihDocPoMedic: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872700000000
    ReportOptions.LastChange = 41220.487942141200000000
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
    Left = 192
    Top = 112
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
            #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1111#1056#1109' '#1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169#1057#1107)
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
          Width = 34.015770000000000000
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
          Left = 566.929500000000000000
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
          Width = 563.149970000000000000
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
          Width = 34.015770000000000000
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
          Left = 566.929500000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
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
        Condition = 'frxDBReport1."NAMEPOSTAV"'
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
            '[frxDBReport1."NAMEPOSTAV"]')
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
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' "[frxDBReport1."NAMEPOSTAV"]"')
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
  object frxPrihDocPoMedicType: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872700000000
    ReportOptions.LastChange = 41220.495545879640000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin        '
      ''
      'end.')
    Left = 136
    Top = 440
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
            
              #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1111#1056#1109' '#1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169#1057#1107' '#1056#1111#1056#1109' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111#1056#176#1056#1112' '#1057#1107#1057#8225#1056#181#1057#8218#1056#1029#1056#1109#1057 +
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
          Font.Height = -11
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
          Font.Height = -11
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
          Font.Height = -11
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
          Font.Height = -11
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
          Font.Height = -11
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
        object Memo27: TfrxMemoView
          Left = 623.622450000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."NAMEPOSTAV"]')
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
          Font.Height = -11
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
          Font.Height = -11
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
            #1056#1119#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1057#8240#1056#1105#1056#1108)
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
  object frxPrihDocPoFinsource: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872700000000
    ReportOptions.LastChange = 41220.498740300930000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin        '
      ''
      'end.')
    Left = 504
    Top = 400
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
            
              #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1111#1056#1109' '#1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169#1057#1107' '#1056#1111#1056#1109' '#1056#1105#1057#1027#1057#8218#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108#1056#176#1056#1112' '#1057#8222#1056#1105#1056#1029#1056 +
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
          Font.Height = -11
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
          Font.Height = -11
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
          Font.Height = -11
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
          Font.Height = -11
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
          Font.Height = -11
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
        object Memo27: TfrxMemoView
          Left = 623.622450000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."NAMEPOSTAV"]')
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
          Font.Height = -11
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
          Font.Height = -11
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
            #1056#1119#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1057#8240#1056#1105#1056#1108)
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
            
              #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1105#1057#1027#1057#8218'. '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039' "[frxDBRepo' +
              'rt1."FC_FINSOURCE"]"')
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
  object frxPrihDocPoOneMedic: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872700000000
    ReportOptions.LastChange = 41220.513329247680000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin        '
      ''
      'end.')
    Left = 504
    Top = 192
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
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 181.417440000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
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
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1111#1056#1109' '#1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169#1057#1107' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 158.740260000000000000
          Width = 718.110700000000000000
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
        object Memo16: TfrxMemoView
          Align = baWidth
          Top = 136.063080000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[FC_MEDIC]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
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
          Font.Height = -11
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
          Left = 45.354360000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 616.063390000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Left = 423.307360000000000000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_SERIAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 249.448980000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_FINSOURCE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 366.614410000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
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
        object Memo28: TfrxMemoView
          Left = 491.338900000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 551.811380000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
        Top = 525.354670000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baRight
          Left = 540.472790000000000000
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
        Top = 260.787570000000000000
        Width = 718.110700000000000000
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
          Left = 249.448980000000000000
          Width = 117.165430000000000000
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
            #1056#152#1057#1027#1057#8218#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 616.063390000000000000
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
        object Memo18: TfrxMemoView
          Left = 45.354360000000000000
          Width = 204.094620000000000000
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
            #1056#8221#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 366.614410000000000000
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
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 423.307360000000000000
          Width = 68.031540000000010000
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
            #1056#1038#1056#181#1057#1026#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 491.338900000000000000
          Width = 60.472480000000000000
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
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 551.811380000000000000
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
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBReport1."NAMEPOSTAV"'
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
          Width = 718.110700000000000000
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
            '[frxDBReport1."NAMEPOSTAV"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 404.409710000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo14: TfrxMemoView
          Width = 616.063390000000000000
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
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' "[frxDBReport1."NAMEPOSTAV"]"')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 616.063390000000000000
          Width = 102.047310000000000000
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
        Top = 445.984540000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo30: TfrxMemoView
          Left = 616.063390000000000000
          Width = 102.047310000000000000
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
          Width = 616.063390000000000000
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
  object frxPrihApteka: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872700000000
    ReportOptions.LastChange = 41220.621480243050000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      '  '
      'end.')
    Left = 312
    Top = 224
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
            #1056#1119#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#176)
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
        Top = 298.582870000000000000
        Width = 1009.134510000000000000
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
        RowCount = 0
        Stretched = True
        object Memo11: TfrxMemoView
          Width = 37.795300000000000000
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
          Left = 343.937230000000000000
          Width = 94.488188980000000000
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
            '[frxDBReport1."PAYCOND"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 925.984850000000000000
          Width = 83.149586770000000000
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
          Left = 37.795300000000000000
          Width = 71.811070000000000000
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
            '[frxDBReport1."FD_INVOICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 109.606370000000000000
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
            '[frxDBReport1."FC_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 185.196970000000000000
          Width = 158.740260000000000000
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
            '[frxDBReport1."NAMEPOSTAV"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 438.425480000000000000
          Width = 170.078740160000000000
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
            '[frxDBReport1."FINSOURCE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 608.504330000000000000
          Width = 83.149598979999990000
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
            '[frxDBReport1."FN_SUMM_GLF"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 691.653990000000000000
          Width = 83.149598979999990000
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
            '[frxDBReport1."FN_SUMM_ANGRO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 774.803650000000000000
          Width = 75.590551180000000000
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
            '[frxDBReport1."FN_SUMM_PEREV"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 850.394250000000000000
          Width = 75.590551180000000000
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
            '[frxDBReport1."FN_NACENKA"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 619.842920000000000000
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
          Width = 37.795300000000000000
          Height = 37.795275590000000000
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
            #1074#8222#8211
            #1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 343.937230000000000000
          Width = 94.488188980000000000
          Height = 37.795275590000000000
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
            #1056#1032#1057#1027#1056#187#1056#1109#1056#1030#1056#1105#1056#181' '#1056#1111#1056#187#1056#176#1057#8218#1056#181#1056#182#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 925.984850000000000000
          Width = 83.149586770000000000
          Height = 37.795275590000000000
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
          Left = 37.795300000000000000
          Width = 71.811070000000000000
          Height = 37.795275590000000000
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
        object Memo29: TfrxMemoView
          Left = 109.606370000000000000
          Width = 75.590600000000000000
          Height = 37.795275590000000000
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
            #1056#1038#1057#8225#1056#181#1057#8218' '#1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 185.196970000000000000
          Width = 158.740260000000000000
          Height = 37.795275590000000000
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
            #1056#1119#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1057#8240#1056#1105#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 438.425480000000000000
          Width = 170.078740160000000000
          Height = 37.795275590000000000
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
            #1056#152#1057#1027#1057#8218#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 608.504330000000000000
          Width = 166.299258980000000000
          Height = 18.897625590000000000
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
            #1056#1114#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 608.504330000000000000
          Top = 18.897650000000000000
          Width = 83.149606300000000000
          Height = 18.897625590000000000
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
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 691.653990000000000000
          Top = 18.897650000000000000
          Width = 83.149606300000000000
          Height = 18.897625590000000000
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
            #1056#1030' '#1057#8218'.'#1057#8225'. '#1056#1106#1056#1029#1056#1110#1057#1026#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 774.803650000000000000
          Width = 75.590551180000000000
          Height = 37.795275590000000000
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
            #1056#1119#1056#181#1057#1026#1056#181#1056#1030#1057#1039#1056#183#1056#1108#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 850.394250000000000000
          Width = 75.590551180000000000
          Height = 37.795275590000000000
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
            #1056#1116#1056#176#1057#8224#1056#181#1056#1029#1056#1108#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 219.212740000000000000
        Top = 340.157700000000000000
        Width = 1009.134510000000000000
        Stretched = True
        object Memo30: TfrxMemoView
          Left = 850.394250000000000000
          Width = 158.740186770000000000
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
          Width = 850.394250000000000000
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
          Top = 60.472480000000010000
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
          Top = 60.472480000000010000
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
          Top = 86.929189999999900000
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
          Top = 86.929189999999900000
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
          Top = 86.929189999999900000
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
          Top = 98.267780000000010000
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
  object frxPrihDocPoOneMedic2: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872700000000
    ReportOptions.LastChange = 41220.623445810180000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin        '
      ''
      'end.')
    Left = 504
    Top = 240
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
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 181.417440000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
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
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1111#1056#1109' '#1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169#1057#1107' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 158.740260000000000000
          Width = 718.110700000000000000
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
        object Memo16: TfrxMemoView
          Align = baWidth
          Top = 136.063080000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[FC_MEDIC]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
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
          Font.Height = -11
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
          Left = 109.606370000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FC_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 616.063390000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Left = 423.307360000000000000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_SERIAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 249.448980000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_FINSOURCE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 366.614410000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
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
        object Memo28: TfrxMemoView
          Left = 491.338900000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 551.811380000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FN_PRICE_DETAIL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 45.354360000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."FD_INVOICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 525.354670000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baRight
          Left = 540.472790000000000000
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
        Top = 260.787570000000000000
        Width = 718.110700000000000000
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
          Left = 249.448980000000000000
          Width = 117.165430000000000000
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
            #1056#152#1057#1027#1057#8218#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 616.063390000000000000
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
        object Memo18: TfrxMemoView
          Left = 109.606370000000000000
          Width = 139.842610000000000000
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
            #1056#8221#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 366.614410000000000000
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
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 423.307360000000000000
          Width = 68.031540000000010000
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
            #1056#1038#1056#181#1057#1026#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 491.338900000000000000
          Width = 60.472480000000000000
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
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 551.811380000000000000
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
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 45.354360000000000000
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
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBReport1."NAMEPOSTAV"'
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
          Width = 718.110700000000000000
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
            '[frxDBReport1."NAMEPOSTAV"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 404.409710000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo14: TfrxMemoView
          Width = 616.063390000000000000
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
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' "[frxDBReport1."NAMEPOSTAV"]"')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 616.063390000000000000
          Width = 102.047310000000000000
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
        Top = 445.984540000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo30: TfrxMemoView
          Left = 616.063390000000000000
          Width = 102.047310000000000000
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
          Width = 616.063390000000000000
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
  object frxPrihDocPoMedicEk1: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872700000000
    ReportOptions.LastChange = 41220.638309305560000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin        '
      ''
      'end.')
    Left = 208
    Top = 240
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
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 158.740260000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
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
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1057#1027#1057#8218#1057#1107#1056#1111#1056#187#1056#181#1056#1029#1056#1105#1056#181' '#1056#1030' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1057#1107)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 136.063080000000000000
          Width = 718.110700000000000000
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
        Top = 419.527830000000000000
        Width = 718.110700000000000000
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
        RowCount = 0
        Stretched = True
        object Memo12: TfrxMemoView
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."NAMEKART"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 374.173470000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_SERIAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 313.700990000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
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
        object Memo26: TfrxMemoView
          Left = 449.764070000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_GODEN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 529.134199999999900000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FC_CERT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 498.897960000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baRight
          Left = 529.134200000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 117.165430000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBReport1."NAMEPOSTAV"'
        object Memo10: TfrxMemoView
          Left = 642.520100000000000000
          Top = 79.370130000000010000
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
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Top = 79.370130000000010000
          Width = 313.700990000000000000
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
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 313.700990000000000000
          Top = 79.370130000000010000
          Width = 60.472480000000000000
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
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 374.173470000000000000
          Top = 79.370130000000010000
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
            #1056#1038#1056#181#1057#1026#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 449.764070000000000000
          Top = 79.370130000000010000
          Width = 79.370130000000000000
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
            #1056#1038#1057#1026#1056#1109#1056#1108' '#1056#1110#1056#1109#1056#1169#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 529.134199999999900000
          Top = 79.370130000000010000
          Width = 113.385900000000000000
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
            #1056#1038#1056#181#1057#1026#1057#8218#1056#1105#1057#8222#1056#1105#1056#1108#1056#176#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '      '#1056#1119#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1057#8240#1056#1105#1056#1108': [frxDBReport1."NAMEPOSTAV"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 30.236220472440950000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 75.590600000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 30.236220472440950000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#8225#1056#181#1057#8218' '#1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 151.181200000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176
            #1056#1109#1056#1111#1056#187#1056#176#1057#8218#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 226.771800000000000000
          Top = 18.897650000000000000
          Width = 113.385900000000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1057#1027#1056#187#1056#1109#1056#1030#1056#1105#1057#1039' '#1056#1109#1056#1111#1056#187#1056#176#1057#8218#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 340.157700000000000000
          Top = 18.897650000000000000
          Width = 109.606370000000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#181#1056#1029#1056#1169#1056#181#1057#1026' / '#1056#1113#1056#1109#1057#8218#1056#1105#1057#1026#1056#1109#1056#1030#1056#1108#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Top = 49.133890000000010000
          Width = 75.590600000000000000
          Height = 26.456692913385830000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FD_DATA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 75.590600000000000000
          Top = 49.133890000000010000
          Width = 75.590600000000000000
          Height = 26.456692913385830000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FC_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 151.181200000000000000
          Top = 49.133890000000010000
          Width = 75.590600000000000000
          Height = 26.456692913385830000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FD_DATA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 226.771800000000000000
          Top = 49.133890000000010000
          Width = 113.385900000000000000
          Height = 26.456692913385830000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FC_PAYCOND"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 340.157700000000000000
          Top = 49.133890000000010000
          Width = 109.606370000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FC_KONTRAKT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBReport1."FC_FINSOURCE"'
        Stretched = True
        object Memo16: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            
              #1056#152#1057#1027#1057#8218#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039': [frxDBReport1."FC' +
              '_FINSOURCE"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxPrihDocPoMedicEk2: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41219.429049872700000000
    ReportOptions.LastChange = 41220.643049826390000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin        '
      ''
      'end.')
    Left = 208
    Top = 288
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
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 158.740260000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
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
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1057#1027#1057#8218#1057#1107#1056#1111#1056#187#1056#181#1056#1029#1056#1105#1056#181' '#1056#1030' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1057#1107)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 136.063080000000000000
          Width = 718.110700000000000000
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
        Top = 419.527830000000000000
        Width = 718.110700000000000000
        DataSet = frxDBReport1
        DataSetName = 'frxDBReport1'
        RowCount = 0
        Stretched = True
        object Memo12: TfrxMemoView
          Width = 226.771653543307100000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBReport1."NAMEKART"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 279.685220000000000000
          Width = 68.031496062992130000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_SERIAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 226.771800000000000000
          Width = 52.913385830000000000
          Height = 18.897650000000000000
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
        object Memo26: TfrxMemoView
          Left = 347.716760000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_GODEN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 521.575140000000100000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
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
            '[frxDBReport1."FC_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 427.086890000000000000
          Width = 94.488188976377960000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FC_CERT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 578.268090000000000000
          Width = 64.251968500000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FN_PRICE_DETAIL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBReport1."FN_SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 612.283860000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baRight
          Left = 529.134200000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 117.165430000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBReport1."NAMEPOSTAV"'
        object Memo10: TfrxMemoView
          Left = 521.575140000000100000
          Top = 79.370130000000010000
          Width = 56.692913390000000000
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
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Top = 79.370130000000010000
          Width = 226.771653543307100000
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
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 226.771800000000000000
          Top = 79.370130000000010000
          Width = 52.913385830000000000
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
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 279.685220000000000000
          Top = 79.370130000000010000
          Width = 68.031496062992130000
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
            #1056#1038#1056#181#1057#1026#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 347.716760000000000000
          Top = 79.370130000000010000
          Width = 79.370130000000000000
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
            #1056#1038#1057#1026#1056#1109#1056#1108' '#1056#1110#1056#1109#1056#1169#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 427.086890000000000000
          Top = 79.370130000000010000
          Width = 94.488188976377960000
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
            #1056#1038#1056#181#1057#1026#1057#8218#1056#1105#1057#8222#1056#1105#1056#1108#1056#176#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '      '#1056#1119#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1057#8240#1056#1105#1056#1108': [frxDBReport1."NAMEPOSTAV"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 30.236220472440950000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 75.590600000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 30.236220472440950000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#8225#1056#181#1057#8218' '#1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 151.181200000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176
            #1056#1109#1056#1111#1056#187#1056#176#1057#8218#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 226.771800000000000000
          Top = 18.897650000000000000
          Width = 113.385900000000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1057#1027#1056#187#1056#1109#1056#1030#1056#1105#1057#1039' '#1056#1109#1056#1111#1056#187#1056#176#1057#8218#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 340.157700000000000000
          Top = 18.897650000000000000
          Width = 109.606370000000000000
          Height = 30.236220470000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#181#1056#1029#1056#1169#1056#181#1057#1026' / '#1056#1113#1056#1109#1057#8218#1056#1105#1057#1026#1056#1109#1056#1030#1056#1108#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Top = 49.133890000000010000
          Width = 75.590600000000000000
          Height = 26.456692913385830000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FD_DATA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 75.590600000000000000
          Top = 49.133890000000010000
          Width = 75.590600000000000000
          Height = 26.456692913385830000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FC_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 151.181200000000000000
          Top = 49.133890000000010000
          Width = 75.590600000000000000
          Height = 26.456692913385830000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FD_DATA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 226.771800000000000000
          Top = 49.133890000000010000
          Width = 113.385900000000000000
          Height = 26.456692913385830000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FC_PAYCOND"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 340.157700000000000000
          Top = 49.133890000000010000
          Width = 109.606370000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBReport1."FC_KONTRAKT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 578.268090000000000000
          Top = 79.370130000000010000
          Width = 64.251968500000000000
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
            #1056#166#1056#181#1056#1029#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 642.520100000000000000
          Top = 79.370130000000010000
          Width = 75.590551180000000000
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
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBReport1."FC_FINSOURCE"'
        Stretched = True
        object Memo16: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            
              #1056#152#1057#1027#1057#8218#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039': [frxDBReport1."FC' +
              '_FINSOURCE"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 461.102660000000000000
        Width = 718.110700000000000000
        object Memo36: TfrxMemoView
          Width = 578.268090000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' [frxDBReport1."NAMEPOSTAV"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 578.268090000000000000
          Width = 139.842561180000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
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
      object GroupFooter2: TfrxGroupFooter
        Height = 7.559060000000000000
        Top = 502.677490000000000000
        Width = 718.110700000000000000
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 532.913730000000000000
        Width = 718.110700000000000000
        object Memo38: TfrxMemoView
          Width = 578.268090000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 578.268090000000000000
          Width = 139.842561180000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
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
    end
  end
end
