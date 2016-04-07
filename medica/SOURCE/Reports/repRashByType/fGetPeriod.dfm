object frmGetPeriod: TfrmGetPeriod
  Left = 0
  Top = 0
  Caption = #1056#1072#1089#1093#1086#1076' '#1087#1086' '#1090#1080#1087#1091
  ClientHeight = 351
  ClientWidth = 1053
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 1053
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 1047
      end>
    Images = ilImages
    ParentShowHint = False
    ShowHint = True
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 1040
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 82
      Caption = 'ToolBar1'
      Images = ilImages
      ShowCaptions = True
      TabOrder = 0
      object btnSave: TToolButton
        Left = 0
        Top = 0
        Action = aSave
        AutoSize = True
      end
      object btnCancel: TToolButton
        Left = 86
        Top = 0
        Action = aCancel
      end
      object btnExpot: TToolButton
        Left = 168
        Top = 0
        Action = acExcelExport
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 145
    Width = 1053
    Height = 206
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    object grdRep: TcxGrid
      Left = 0
      Top = 0
      Width = 1053
      Height = 206
      Align = alClient
      TabOrder = 0
      object grdRepDBBandedTableView1: TcxGridDBBandedTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsRep
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsCustomize.BandsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.HeaderAutoHeight = True
        Bands = <
          item
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
          end
          item
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103
          end>
        object grdRepDBBandedTableView1_DPID: TcxGridDBBandedColumn
          Caption = #1050#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          DataBinding.FieldName = 'DPID'
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 11
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_FC_DOC: TcxGridDBBandedColumn
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090
          HeaderAlignmentHorz = taCenter
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_FC_DOC_TYPE: TcxGridDBBandedColumn
          Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          DataBinding.FieldName = 'FC_DOC_TYPE'
          HeaderAlignmentHorz = taCenter
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_FD_PERIOD_LAST_DATE: TcxGridDBBandedColumn
          Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          DataBinding.FieldName = 'FD_PERIOD_LAST_DATE'
          HeaderAlignmentHorz = taCenter
          Width = 30
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_fc_mogroupid_from: TcxGridDBBandedColumn
          Caption = #1054#1090#1082#1091#1076#1072
          DataBinding.FieldName = 'fc_mogroupid_from'
          HeaderAlignmentHorz = taCenter
          Width = 38
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_fc_mogroupid_to: TcxGridDBBandedColumn
          Caption = #1050#1091#1076#1072
          DataBinding.FieldName = 'fc_mogroupid_to'
          HeaderAlignmentHorz = taCenter
          Width = 37
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_zametki: TcxGridDBBandedColumn
          Caption = #1047#1072#1084#1077#1090#1082#1080' '#1087#1086' '#1076#1086#1082'.'
          HeaderAlignmentHorz = taCenter
          Width = 20
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_FN_DOC_SUMM: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          DataBinding.FieldName = 'FN_DOC_SUMM'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 30
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_fc_pod: TcxGridDBBandedColumn
          Caption = #1055#1086#1076#1087#1080#1089#1072#1085
          DataBinding.FieldName = 'fc_pod'
          HeaderAlignmentHorz = taCenter
          Width = 20
          Position.BandIndex = 0
          Position.ColIndex = 7
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_fc_contrakt: TcxGridDBBandedColumn
          Caption = #1050#1086#1085#1090#1088#1072#1082#1090
          HeaderAlignmentHorz = taCenter
          Width = 20
          Position.BandIndex = 0
          Position.ColIndex = 8
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_fc_invoice: TcxGridDBBandedColumn
          Caption = #1057#1095#1077#1090'-'#1092#1072#1082#1090#1091#1088#1072
          HeaderAlignmentHorz = taCenter
          Width = 20
          Position.BandIndex = 0
          Position.ColIndex = 9
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_inn_post: TcxGridDBBandedColumn
          Caption = #1048#1053#1053' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
          HeaderAlignmentHorz = taCenter
          Width = 28
          Position.BandIndex = 0
          Position.ColIndex = 10
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_FC_MEDIC_NAME: TcxGridDBBandedColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_MEDIC_NAME'
          HeaderAlignmentHorz = taCenter
          Width = 58
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_FC_UP_EDIZM: TcxGridDBBandedColumn
          Caption = #1059#1087'. '#1077#1076'.'#1080#1079#1084
          DataBinding.FieldName = 'FC_UP_EDIZM'
          HeaderAlignmentHorz = taCenter
          Width = 40
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_FN_KOL: TcxGridDBBandedColumn
          Caption = #1050#1086#1083'-'#1074#1086' ('#1091#1087'.)'
          DataBinding.FieldName = 'FN_KOL'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 38
          Position.BandIndex = 1
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_FN_PRICE: TcxGridDBBandedColumn
          Caption = #1062#1077#1085#1072' '#1079#1072' '#1091#1087'., '#1088
          DataBinding.FieldName = 'FN_PRICE'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 39
          Position.BandIndex = 1
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_FN_SUMM: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1084#1072', '#1088
          DataBinding.FieldName = 'FN_SUMM'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 38
          Position.BandIndex = 1
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_FC_SERIAL: TcxGridDBBandedColumn
          Caption = #1057#1077#1088#1080#1103
          DataBinding.FieldName = 'FC_SERIAL'
          HeaderAlignmentHorz = taCenter
          Width = 39
          Position.BandIndex = 1
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_FC_UCHGR: TcxGridDBBandedColumn
          Caption = #1059#1095'. '#1075#1088#1091#1087#1087#1072
          DataBinding.FieldName = 'FC_UCHGR'
          HeaderAlignmentHorz = taCenter
          Width = 40
          Position.BandIndex = 1
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_FK_MEDICID: TcxGridDBBandedColumn
          Caption = #1050#1086#1076' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103
          DataBinding.FieldName = 'FK_MEDICID'
          HeaderAlignmentHorz = taCenter
          Width = 38
          Position.BandIndex = 1
          Position.ColIndex = 7
          Position.RowIndex = 0
        end
        object grdRepDBBandedTableView1_FC_FIN_SOURCE: TcxGridDBBandedColumn
          Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103' '#1087#1072#1088#1090#1080#1080
          DataBinding.FieldName = 'FC_FIN_SOURCE'
          HeaderAlignmentHorz = taCenter
          Width = 39
          Position.BandIndex = 1
          Position.ColIndex = 8
          Position.RowIndex = 0
        end
      end
      object grdRepLevel1: TcxGridLevel
        GridView = grdRepDBBandedTableView1
      end
    end
  end
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 40
    Width = 1053
    Height = 105
    Align = alTop
    BevelInner = bvLowered
    BevelKind = bkFlat
    TabOrder = 2
    TabStop = False
    object cbMonth: TComboBox
      Left = 78
      Top = 37
      Width = 145
      Height = 21
      AutoDropDown = True
      AutoCloseUp = True
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
    end
    object edtYear: TSpinEdit
      Left = 365
      Top = 37
      Width = 100
      Height = 22
      MaxValue = 3000
      MinValue = 1900
      TabOrder = 3
      Value = 1900
    end
    object lcbMO_GROUP: TDBLookupComboBox
      Left = 78
      Top = 65
      Width = 145
      Height = 21
      KeyField = 'GROUPID'
      ListField = 'FC_GROUP'
      ListSource = dsGroupMo
      TabOrder = 4
    end
    object lcbRashType: TDBLookupComboBox
      Left = 78
      Top = 10
      Width = 163
      Height = 21
      KeyField = 'FP_VIDMOVE'
      ListField = 'FC_VIDMOVE'
      ListSource = dsRashType
      TabOrder = 0
    end
    object lcbSpisanieVid: TDBLookupComboBox
      Left = 320
      Top = 10
      Width = 145
      Height = 21
      KeyField = 'FK_SPISANIEVID'
      ListField = 'FC_SPISANIE'
      ListSource = dsSpisanieVid
      TabOrder = 1
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      ShowCaption = False
      Hidden = True
      ShowBorder = False
      object dxLayoutControl1Group1: TdxLayoutGroup
        ShowCaption = False
        Hidden = True
        ShowBorder = False
        object dxLayoutControl1Group3: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          object lci_lcbRashType: TdxLayoutItem
            Caption = #1058#1080#1087' '#1088#1072#1089#1093#1086#1076#1072
            Control = lcbRashType
            ControlOptions.ShowBorder = False
          end
          object lci_lcbSpisanieVid: TdxLayoutItem
            Caption = #1042#1080#1076' '#1089#1087#1080#1089#1072#1085#1080#1103
            Control = lcbSpisanieVid
            ControlOptions.ShowBorder = False
          end
        end
        object dxLayoutControl1Group2: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          object lci_cbMonth: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #1052#1077#1089#1103#1094
            Control = cbMonth
            ControlOptions.ShowBorder = False
          end
          object lci_edtYear: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahRight
            Caption = #1043#1086#1076
            Control = edtYear
            ControlOptions.ShowBorder = False
          end
        end
      end
      object lci_lcbMO_GROUP: TdxLayoutItem
        Caption = #1043#1088#1091#1087#1087#1072' '#1052#1054
        Control = lcbMO_GROUP
        ControlOptions.ShowBorder = False
      end
    end
  end
  object os: TOracleSession
    LogonDatabase = 'asu'
    Left = 132
    Top = 8
  end
  object ilImages: TImageList
    Left = 344
    Bitmap = {
      494C0101030004005C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006A0000006A0000006A0000006A0000006A0000006A0000006A
      0000006A0000006A0000006A0000006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B0000007B00
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000080000000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000095655F00A5696A00A5696A00A569
      6A00A5696A00006A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B000000007B00007B00
      00007B0000007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000007B00000000000000
      00007B7B7B00000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B000000000000000000000000000000000098686000FBE5C000F4D5AD00F0CF
      9F00EFCA9600006A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      00007B0000007B0000007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000007B0000007B000000
      00007B7B7B007B7B7B0000000000000000000000000000007B00000000000000
      00007B7B7B000000000000000000000000009D6B6200FCE7C900F2D5B500F0D0
      A900EECB9E00006A0000FFFFFF0078BB7800006A00001C831C00FAFCFA006AB4
      6A00006A00004DA34D00FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      0000007B0000007B00007B0000007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000007B0000007B000000
      7B0000000000000000007B7B7B000000000000007B0000007B0000007B000000
      7B0000000000000000000000000000000000A36F6400FEEED400F4DDC000F2D7
      B500F0D1AA00006A0000FFFFFF00FFFFFF00B4DAB400016C01000D780D00006A
      00006AB46A00FFFFFF00FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      0000007B0000007B0000007B00007B0000007B7B7B007B7B7B00000000000000
      000000000000000000000000000000000000000000000000FF0000007B000000
      7B0000007B00000000000000000000007B0000007B0000007B0000007B000000
      7B0000000000000000000000000000000000A7746600FFF4E100F6E1CA00F3DC
      BF00F2D7B400006A0000FFFFFF00FFFFFF00FFFFFF004EA44E00006A00000A76
      0A00FAFCFA00FFFFFF00FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      000000FF0000007B0000007B0000007B00007B0000007B7B7B007B7B7B000000
      00000000000000000000000000000000000000000000000000000000FF000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B00000000000000
      000000000000000000000000000000000000AD786900FFFBEE00F7E7D500F4E1
      CA00F3DCBF00006A0000FFFFFF00FFFFFF005FAD5F00006A00004AA14A00016C
      010023892300EEF7EE00FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      000000FF000000FF0000007B0000007B0000007B00007B0000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000007B0000007B0000007B0000007B0000007B0000000000000000000000
      000000000000000000000000000000000000B47E6B00FFFFFB00F8EDE100F7E6
      D400F6E1C900006A0000FFFFFF00469F4600006A000060AD6000FFFFFF00BBDD
      BB00016B010023892300FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B000000000000FF0000007B0000007B0000007B00007B0000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      00000000FF0000007B0000007B0000007B0000007B007B7B7B00000000000000
      000000000000000000000000000000000000BA836D00FFFFFF00FCF4EE00FAED
      E100F8E9D500006A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B000000000000FF000000FF0000007B0000007B0000007B00007B00
      00007B7B7B000000000000000000000000000000000000000000000000000000
      00000000FF0000007B0000007B0000007B0000007B00000000007B7B7B000000
      000000000000000000000000000000000000BF877000FFFFFF00FFFBFA00FEF4
      ED00FAEEE000006A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063FF000000FF0000007B
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      FF0000007B0000007B0000007B0000007B0000007B0000007B00000000007B7B
      7B0000000000000000000000000000000000C48C7200FFFFFF00FFFFFF00FFFC
      FA00FCF4ED00006A0000006A0000006A0000006A0000006A0000006A0000006A
      0000006A0000006A0000006A0000006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000A5FF0000007B0000007B
      00007B0000007B7B7B007B7B7B00000000000000000000000000000000000000
      FF0000007B0000007B0000007B000000FF000000FF0000007B00000000000000
      00007B7B7B00000000000000000000000000CA917400FFFFFF00FFFFFF00FFFF
      FF00FFFCFA00FCF4ED00FAEDDE00F8E7D400FCEBD300E3D3BB00B7AD9C00A569
      6A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF0000007B
      0000007B00007B0000007B7B7B007B7B7B0000000000000000000000FF000000
      7B0000007B00000000007B7B7B0000000000000000000000FF0000007B000000
      7B00000000007B7B7B000000000000000000CE957600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFCFA00FCF6EB00FAEFE000A5696A00A5696A00A5696A00A569
      6A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      0000007B0000007B00007B0000007B7B7B00000000000000FF0000007B000000
      7B00000000007B7B7B00000000000000000000000000000000000000FF000000
      7B0000007B00000000000000000000000000D3977800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFC00F4EBE600A5696A00E2A35B00EF993800BB70
      4F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF0000007B00007B0000007B7B7B0000000000000000000000FF000000
      7B00848484000000000000000000000000000000000000000000000000000000
      FF0000007B0000007B000000000000000000D59A7900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F8F8FE00A5696A00E5A55F00C2805C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000007B00007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000000000000000D0906B00D0906B00D0906B00D090
      6B00D0906B00D0906B00D0906B00D0906B00A5696A00BB7F6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00E7FFFFFFF8000000C3FF8FFF00000000
      81FF078F0000000000FF038700000000007F810700000000003F800F00000000
      001FC01F00000000001FE03F00000000040FF03F000000000407F01F00000000
      8F03E00F00000000FF01E007000F0000FFC0C183000F0000FFE083C3000F0000
      FFF0C7E1001F0000FFF8FFF3003F000000000000000000000000000000000000
      000000000000}
  end
  object alActions: TActionList
    Images = ilImages
    Left = 384
    object aSave: TAction
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 0
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 1
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object acExcelExport: TAction
      Caption = #1042' Excel'
      Hint = #1069#1082#1087#1086#1088#1090' '#1074' Excel'
      ImageIndex = 2
      OnExecute = acExcelExportExecute
    end
  end
  object oqInitMO: TOracleQuery
    SQL.Strings = (
      'begin'
      '  SELECT NVL(MAX(MOID),-1) into :nMOID FROM'
      '   (SELECT MOID FROM MED.TMO T '
      '     where T.FL_DEL = 0 and '
      
        '           T.FK_SOTRID IN (SELECT a.FK_SOTRID FROM login.TAPPSOT' +
        'R a '
      
        '                            WHERE a.FK_ID =:pAppSotrID and coale' +
        'sce (a.FL_DEL, 0) = 0) );         '
      '                            '
      
        '  SELECT nvl( MAX(fk_curmogroupid), -1) into :nMO_GROUP FROM med' +
        '.tmo where moid = :nMOID;'
      '  '
      
        '  select NVL(MAX(m.fl_treb),0)into :PFL_Provizor from med.tmo m ' +
        'where m.MOID = :nMOID;  '
      '  '
      
        '  select trunc(sysdate) into :pCurDate from dual;               ' +
        '                    '
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      03000000050000000B0000003A50415050534F545249440300000004000000DB
      A3020000000000060000003A4E4D4F4944030000000400000006050000000000
      000A0000003A4E4D4F5F47524F55500300000004000000980700000000000009
      0000003A50435552444154450C0000000700000078720901010101000000000D
      0000003A50464C5F50524F56495A4F5203000000040000000100000000000000}
    Left = 276
  end
  object odsRep: TOracleDataSet
    SQL.Strings = (
      'select d.DPID, '
      '       med.GET_DECODEDOCVIDMOVE (d.fp_vidmove) as FC_DOC_TYPE,'
      '       d.FD_DATA,'
      
        '       to_char ( last_day ( :pDATE_TO ), '#39'DD.MM.YYYY'#39' ) FD_PERIO' +
        'D_LAST_DATE,'
      
        '       MED.PKGTDOCS.GET_DOC_SOURCE (D.fp_vid, D.fp_vidmove, D.fk' +
        '_mogroupid_FROM, D.postavid) as fc_mogroupid_from,'
      
        '       MED.PKGTDOCS.GET_DOC_DESTINATION(D.fp_vid, D.fp_vidmove, ' +
        'D.fk_mogroupid_TO, D.postavid) AS fc_mogroupid_to,'
      '       d.FN_PRICE as FN_DOC_SUMM,   '
      '       d.fn_spisanievid,'
      '       decode(d.fl_edit,0,'#39#1044#1072#39',1,'#39#1053#1077#1090#39') as fc_pod,'
      '       m.FC_NAME as FC_MEDIC_NAME,'
      '       ei.FC_NAME as FC_UP_EDIZM,'
      '       dpc.FN_KOL,'
      '       dpc.FN_PRICE,'
      '       dpc.FN_KOL *  dpc.FN_PRICE as FN_SUMM, '
      '       dpc.FC_SERIAL, '
      '       uchgr.FC_UCHGR,'
      '       m.MEDICID FK_MEDICID,          '
      '       fin.FC_NAME as FC_FIN_SOURCE '
      '  from med.TDOCS d            '
      ' inner join ( select dpc.DPID,'
      '                     k.MEDICID,                      '
      '                     k.FN_PRICE,'
      '                     k.FC_SERIAL,'
      '                     k.FK_FINSOURCE_ID,'
      '                     sum(dpc.FN_KOL) as FN_KOL'
      '                from med.tdpc dpc '
      '               inner join med.TKART k'
      '                  on dpc.KARTID = k.KARTID'
      '               group by dpc.DPID,'
      '                     k.MEDICID,                      '
      '                     k.FN_PRICE,'
      '                     k.FC_SERIAL,'
      '                     k.FK_FINSOURCE_ID ) dpc'
      '    on d.DPID = dpc.DPID                  '
      '  left join med.tmedic m'
      '    on dpc.meDICID = m.MEDICID    '
      '  left join med.TEI ei '
      '    on m.EIID = ei.EIID'
      '  left join med.TUCHGR uchgr'
      '    on m.UCHGRID = uchgr.UCHGRID'
      '  left join med.TFINSOURCE fin'
      '    on dpc.fK_FINSOURCE_ID = fin.FK_ID'
      '  left join ( select pins.fk_pacid '
      '                from asu.tkarta k'
      '               inner join asu.tpac_insurance pins'
      '                  on k.fk_id = pins.fk_pacid'
      '               inner join asu.tinsurdocs ind'
      '                  on pins.fk_insurdocid = ind.fk_id    '
      '               where ind.fk_typedocid = 21 -- '#1087#1083#1072#1090#1085#1080#1082#1080
      
        '                 and sysdate between coalesce(ind.fd_begin, sysd' +
        'ate) and coalesce(ind.fd_prolong, ind.fd_end, sysdate)'
      '               group by pins.fk_pacid ) k'
      '    on d.fk_mogroupid_to = k.fk_pacid'
      '   and d.fp_vid = 3 /*'#1040#1082#1090' '#1089#1087#1080#1089#1072#1085#1080#1103' '#1058#1052#1062' '#1085#1072' '#1089#1090#1072#1094'. '#1087#1072#1094#1080#1077#1085#1090#1072'*/'
      '   and d.fp_vidmove = 8'
      '   and d.fn_spisanievid = 3'
      '  left join ( select t.fk_id fk_ambtalonid'
      '                from asu.tambtalon t'
      '               inner join asu.tinsurdocs ind'
      '                  on t.fk_insuranceid = ind.fk_id'
      '               where ind.fk_typedocid = 21 -- '#1087#1083#1072#1090#1085#1080#1082#1080
      
        '                 and sysdate between coalesce(ind.fd_begin, sysd' +
        'ate) and coalesce(ind.fd_prolong, ind.fd_end, sysdate)'
      '               group by t.fk_id ) amb'
      '    on d.fk_mogroupid_to = amb.fk_ambtalonid                '
      '   and d.fp_vid = 3 /* '#1040#1082#1090' '#1089#1087#1080#1089#1072#1085#1080' '#1058#1052#1062' '#1085#1072' '#1072#1084#1073' '#1090#1072#1083#1086#1085' */'
      '   and d.fp_vidmove = 8'
      '   and d.fn_spisanievid = 6        '
      ' where trunc(d.FD_DATA) >= trunc(:pDATE_FROM)'
      '   and trunc(d.FD_DATA) <= trunc(:pDATE_TO)   '
      '   and d.FK_MOGROUPID_FROM = :pCUR_MOGROUP'
      '   and d.FP_VIDMOVE = :pFP_VIDMOVE   '
      
        '   and k.fk_pacid is null  -- '#1089#1087#1080#1089#1072#1085#1080#1077' '#1053#1045' '#1085#1072' '#1089#1090#1072#1094#1080#1086#1085#1072#1088#1085#1086#1075#1086' '#1087#1083#1072#1090#1085 +
        #1080#1082#1072
      
        '   and amb.fk_ambtalonid is null -- '#1089#1087#1080#1089#1072#1085#1080#1077' '#1053#1045' '#1085#1072' '#1087#1083#1072#1090#1085#1099#1081' '#1072#1084#1073'.'#1090 +
        #1072#1083#1086#1085'    '
      '   :pSpisanieCond'
      '   and MED.PKG_PRIHRASH.Get_PrihRashPriznak( d.FP_VID, '
      '                                             d.FP_VIDMOVE,'
      
        '                                             d.fk_mogroupid_from' +
        ','
      '                                             d.fk_mogroupid_to,'
      '                                             :pCUR_MOGROUP ) < 0'
      '')
    Optimize = False
    Variables.Data = {
      0300000005000000090000003A50444154455F544F0C00000007000000787009
      1E183C3C000000000B0000003A50444154455F46524F4D0C0000000700000078
      700901010101000000000D0000003A504355525F4D4F47524F55500300000004
      00000097070000000000000C0000003A5046505F5649444D4F56450300000004
      00000002000000000000000E0000003A5053504953414E4945434F4E44010000
      000000000000000000}
    Cursor = crSQLWait
    Session = os
    Left = 216
    Top = 128
  end
  object odsRashType: TOracleDataSet
    SQL.Strings = (
      
        'select FP_VIDMOVE, MED.get_decodedocvidmove (FP_VIDMOVE) as FC_V' +
        'IDMOVE'
      '  from ( select 2 as FP_VIDMOVE from dual '
      '         union all                       '
      '         select 3 as FP_VIDMOVE from dual'
      '         union all                       '
      '         select 4 as FP_VIDMOVE from dual'
      '         union all                       '
      '         select 7 as FP_VIDMOVE from dual'
      '         union all                       '
      '         select 8 as FP_VIDMOVE from dual'
      '         union all                       '
      '         select 11 as FP_VIDMOVE from dual'
      '         union all                       '
      '         select 12 as FP_VIDMOVE from dual'
      '         union all                       '
      '         select 13 as FP_VIDMOVE from dual'
      '         union all                       '
      '         select 14 as FP_VIDMOVE from dual'
      '  ) t       '
      'order by 1  ')
    Optimize = False
    Session = os
    Left = 120
    Top = 128
  end
  object dsRashType: TDataSource
    DataSet = odsRashType
    OnDataChange = dsRashTypeDataChange
    Left = 120
    Top = 160
  end
  object odsGroupMo: TOracleDataSet
    SQL.Strings = (
      'select TG.GROUPID, TG.FC_GROUP'
      '  from MED.TMO_GROUP TG'
      ' inner join MED.TMO_IN_GROUP TIG'
      '    on TG.GROUPID = TIG.FK_GROUP'
      ' inner join MED.TMO TMO'
      '    on TIG.FK_MO = TMO.MOID'
      '  left join (select A.FK_SOTRID'
      '               from LOGIN.TAPPSOTR A'
      '              where A.FK_ID = :PAPPSOTRID'
      '                and COALESCE(A.FL_DEL, 0) = 0) SOTR'
      '    on TMO.FK_SOTRID = SOTR.FK_SOTRID'
      ' where COALESCE(TMO.FL_DEL, 0) = 0'
      '   and COALESCE(TIG.FL_DEL, 0) = 0'
      '   and COALESCE(TG.FL_DEL, 0) = 0'
      '   and (:PFL_PROVIZOR = 1 or SOTR.FK_SOTRID > 0)'
      ' group by TG.GROUPID, TG.FC_GROUP'
      ' order by 2')
    Optimize = False
    Variables.Data = {
      03000000020000000B0000003A50415050534F5452494403000000040000005D
      C30200000000000D0000003A50464C5F50524F56495A4F520500000002000000
      310000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C010000000000}
    Session = os
    Left = 82
    Top = 127
  end
  object dsGroupMo: TDataSource
    DataSet = odsGroupMo
    Left = 80
    Top = 157
  end
  object dsRep: TDataSource
    DataSet = odsRep
    Left = 216
    Top = 160
  end
  object sd: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Excel Files (*.xls)|*.xls'
    Left = 308
    Top = 65531
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = JvAppIniFileStorage1
    AppStoragePath = '%FORM_NAME%\'
    StoredProps.Strings = (
      'grdRepDBBandedTableView1_fc_contrakt.Visible'
      'grdRepDBBandedTableView1_fc_contrakt.Width'
      'grdRepDBBandedTableView1_FC_DOC.Visible'
      'grdRepDBBandedTableView1_FC_DOC.Width'
      'grdRepDBBandedTableView1_FC_DOC_TYPE.Visible'
      'grdRepDBBandedTableView1_FC_DOC_TYPE.Width'
      'grdRepDBBandedTableView1_FC_FIN_SOURCE.Visible'
      'grdRepDBBandedTableView1_FC_FIN_SOURCE.Width'
      'grdRepDBBandedTableView1_fc_invoice.Visible'
      'grdRepDBBandedTableView1_fc_invoice.Width'
      'grdRepDBBandedTableView1_FC_MEDIC_NAME.Visible'
      'grdRepDBBandedTableView1_FC_MEDIC_NAME.Width'
      'grdRepDBBandedTableView1_fc_mogroupid_from.Visible'
      'grdRepDBBandedTableView1_fc_mogroupid_from.Width'
      'grdRepDBBandedTableView1_fc_mogroupid_to.Visible'
      'grdRepDBBandedTableView1_fc_mogroupid_to.Width'
      'grdRepDBBandedTableView1_fc_pod.Visible'
      'grdRepDBBandedTableView1_fc_pod.Width'
      'grdRepDBBandedTableView1_FC_SERIAL.Visible'
      'grdRepDBBandedTableView1_FC_SERIAL.Width'
      'grdRepDBBandedTableView1_FC_UCHGR.Visible'
      'grdRepDBBandedTableView1_FC_UCHGR.Width'
      'grdRepDBBandedTableView1_FC_UP_EDIZM.Visible'
      'grdRepDBBandedTableView1_FC_UP_EDIZM.Width'
      'grdRepDBBandedTableView1_FD_PERIOD_LAST_DATE.Visible'
      'grdRepDBBandedTableView1_FD_PERIOD_LAST_DATE.Width'
      'grdRepDBBandedTableView1_FK_MEDICID.Visible'
      'grdRepDBBandedTableView1_FK_MEDICID.Width'
      'grdRepDBBandedTableView1_FN_DOC_SUMM.Visible'
      'grdRepDBBandedTableView1_FN_DOC_SUMM.Width'
      'grdRepDBBandedTableView1_FN_KOL.Visible'
      'grdRepDBBandedTableView1_FN_KOL.Width'
      'grdRepDBBandedTableView1_FN_PRICE.Visible'
      'grdRepDBBandedTableView1_FN_PRICE.Width'
      'grdRepDBBandedTableView1_FN_SUMM.Visible'
      'grdRepDBBandedTableView1_FN_SUMM.Width'
      'grdRepDBBandedTableView1_inn_post.Visible'
      'grdRepDBBandedTableView1_inn_post.Width'
      'grdRepDBBandedTableView1_zametki.Visible'
      'grdRepDBBandedTableView1_zametki.Width'
      'grdRepDBBandedTableView1_DPID.Visible'
      'grdRepDBBandedTableView1_DPID.Width')
    StoredValues = <>
    Left = 344
    Top = 272
  end
  object JvAppIniFileStorage1: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    AutoFlush = True
    AutoReload = True
    FileName = 'repRashByType.ini'
    FlushOnDestroy = False
    SubStorages = <>
    Left = 288
    Top = 272
  end
  object odsSpisanieVid: TOracleDataSet
    SQL.Strings = (
      
        'select 1 as FK_SPISANIEVID, '#39#1087#1086' '#1087#1088#1080#1095#1080#1085#1077#39' as FC_SPISANIE from dua' +
        'l'
      'union all'
      'select 2, '#39#1085#1072' '#1086#1090#1076#1077#1083#1077#1085#1080#1077#39' from dual'
      'union all'
      'select 3, '#39#1085#1072' '#1087#1072#1094#1080#1077#1085#1090#1072#39' from dual'
      'union all'
      'select 6, '#39#1085#1072' '#1072#1084#1073'.'#1090#1072#1083#1086#1085#39' from dual'
      'order by 1')
    Optimize = False
    Session = os
    Left = 160
    Top = 128
  end
  object dsSpisanieVid: TDataSource
    DataSet = odsSpisanieVid
    Left = 160
    Top = 160
  end
end
