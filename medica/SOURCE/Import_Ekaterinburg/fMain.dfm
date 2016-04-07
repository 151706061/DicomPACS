object Form1: TForm1
  Left = 395
  Top = 140
  Caption = 'Form1'
  ClientHeight = 541
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 674
    Height = 49
    Align = alTop
    TabOrder = 0
    DesignSize = (
      674
      49)
    object bbuStart: TBitBtn
      Left = 16
      Top = 8
      Width = 100
      Height = 29
      Caption = #1053#1072#1095#1072#1090#1100' '#1080#1084#1087#1086#1088#1090
      TabOrder = 0
      OnClick = bbuStartClick
    end
    object bbuExit: TBitBtn
      Left = 560
      Top = 8
      Width = 100
      Height = 29
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 1
      OnClick = bbuExitClick
    end
    object bbuSaveToDB: TBitBtn
      Left = 140
      Top = 8
      Width = 100
      Height = 29
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1041#1044
      Enabled = False
      TabOrder = 2
      OnClick = bbuSaveToDBClick
    end
    object Button1: TButton
      Left = 276
      Top = 8
      Width = 119
      Height = 29
      Action = acRefreshDocs
      TabOrder = 3
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 49
    Width = 674
    Height = 492
    ActivePage = tsDocs
    Align = alClient
    TabOrder = 1
    object tsEdIzm: TTabSheet
      Caption = #1045#1076'. '#1080#1079#1084'.'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grEdIzm: TcxGrid
        Left = 0
        Top = 0
        Width = 666
        Height = 464
        Align = alClient
        TabOrder = 0
        object grEdIzmTableView1: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #1050#1086#1083'-'#1074#1086': ### ###'
              Kind = skCount
              Column = grEdIzmTableView1Name
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object grEdIzmTableView1Key: TcxGridColumn
            Caption = #1048#1089#1093'. '#1082#1086#1076
            MinWidth = 64
            Options.HorzSizing = False
          end
          object grEdIzmTableView1Name: TcxGridColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 526
          end
          object grEdIzmTableView1EIID: TcxGridColumn
            Caption = #1053#1072#1096' '#1082#1086#1076
            MinWidth = 92
            Options.HorzSizing = False
            Width = 92
          end
        end
        object grEdIzmLevel1: TcxGridLevel
          GridView = grEdIzmTableView1
        end
      end
    end
    object tsFarmGr: TTabSheet
      Caption = #1060#1072#1088#1084'. '#1075#1088'.'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grFarmGr: TcxGrid
        Left = 0
        Top = 0
        Width = 666
        Height = 464
        Align = alClient
        TabOrder = 0
        object grFarmGrTableView1: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #1050#1086#1083'-'#1074#1086': ### ###'
              Kind = skCount
              Column = name
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object key: TcxGridColumn
            Caption = #1048#1089#1093'. '#1082#1086#1076
            MinWidth = 64
            Options.HorzSizing = False
          end
          object name: TcxGridColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 526
          end
          object farmgr_id: TcxGridColumn
            Caption = #1053#1072#1096' '#1082#1086#1076
            MinWidth = 92
            Options.HorzSizing = False
            Width = 92
          end
        end
        object cxGridLevel3: TcxGridLevel
          GridView = grFarmGrTableView1
        end
      end
    end
    object tsUchGr: TTabSheet
      Caption = #1059#1095'. '#1075#1088#1091#1087#1087#1099
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grUchGr: TcxGrid
        Left = 0
        Top = 0
        Width = 666
        Height = 464
        Align = alClient
        TabOrder = 0
        object grUchGrTableView: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #1050#1086#1083'-'#1074#1086': ### ###'
              Kind = skCount
              Column = grUchGrName
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object grUchGrKey: TcxGridColumn
            Caption = #1048#1089#1093'. '#1082#1086#1076
            MinWidth = 64
            Options.HorzSizing = False
          end
          object grUchGrName: TcxGridColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 526
          end
          object grUchGrUchgrID: TcxGridColumn
            Caption = #1053#1072#1096' '#1082#1086#1076
            MinWidth = 92
            Options.HorzSizing = False
            Width = 92
          end
        end
        object cxGridLevel4: TcxGridLevel
          GridView = grUchGrTableView
        end
      end
    end
    object tsGroup_LF: TTabSheet
      Caption = #1043#1088#1091#1087#1087#1099' '#1051'.'#1060'.'
      ImageIndex = 9
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grGROUP_LF: TcxGrid
        Left = 0
        Top = 0
        Width = 666
        Height = 464
        Align = alClient
        TabOrder = 0
        object grGROUP_LFTableView: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #1050#1086#1083'-'#1074#1086': ### ###'
              Kind = skCount
              Column = grGROUP_LFTableViewName
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object grGROUP_LFTableViewKey: TcxGridColumn
            Caption = #1048#1089#1093'. '#1082#1086#1076
            MinWidth = 64
            Options.HorzSizing = False
          end
          object grGROUP_LFTableViewName: TcxGridColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 526
          end
          object grGROUP_LFTableViewTheirCode: TcxGridColumn
            Caption = #1053#1072#1096' '#1082#1086#1076
            MinWidth = 92
            Options.HorzSizing = False
            Width = 92
          end
        end
        object cxGridLevel10: TcxGridLevel
          GridView = grGROUP_LFTableView
        end
      end
    end
    object tsPost: TTabSheet
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082#1080
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grPostav: TcxGrid
        Left = 0
        Top = 0
        Width = 666
        Height = 464
        Align = alClient
        TabOrder = 0
        object grPostavTableView: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #1050#1086#1083'-'#1074#1086': ### ###'
              Kind = skCount
              Column = grPostavName
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object grPostavKey: TcxGridColumn
            Caption = #1048#1089#1093'. '#1082#1086#1076
            MinWidth = 30
            Options.HorzSizing = False
            Width = 30
          end
          object grPostavName: TcxGridColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            MinWidth = 50
            Width = 97
          end
          object grPostavFC_KONTRAKT_N: TcxGridColumn
            Caption = #8470' '#1082#1086#1085#1090#1088#1072#1082#1090#1072
            Width = 29
          end
          object grPostavFD_KONTRAKT_BEGIN: TcxGridColumn
            Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1082#1086#1085#1090#1088#1072#1082#1090#1072
            DataBinding.ValueType = 'DateTime'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.InputKind = ikMask
            Properties.SaveTime = False
            Properties.ShowTime = False
            Width = 28
          end
          object grPostavFD_KONTRAKT_END: TcxGridColumn
            Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1082#1086#1085#1090#1088#1072#1082#1090#1072
            DataBinding.ValueType = 'DateTime'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.SaveTime = False
            Properties.ShowTime = False
            Width = 28
          end
          object grPostavFC_ADDRESS: TcxGridColumn
            Caption = #1040#1076#1088#1077#1089
            Width = 30
          end
          object grPostavFC_PHONE: TcxGridColumn
            Caption = #1058#1077#1083#1077#1092#1086#1085
            Width = 28
          end
          object grPostavFC_R_S: TcxGridColumn
            Caption = #1056#1072#1089#1095'. '#1089#1095#1077#1090
            Width = 28
          end
          object grPostavFC_K_S: TcxGridColumn
            Caption = #1050#1086#1088#1088'. '#1089#1095#1077#1090
            Width = 29
          end
          object grPostavFC_INN: TcxGridColumn
            Caption = #1048#1053#1053
            Width = 28
          end
          object grPostavFC_BIK: TcxGridColumn
            Caption = #1041#1048#1050
            Width = 28
          end
          object grPostavFC_OKPO: TcxGridColumn
            Caption = #1054#1050#1055#1054
            Width = 29
          end
          object grPostavFC_OKONH: TcxGridColumn
            Caption = #1054#1050#1054#1053#1061
            Width = 29
          end
          object grPostavFC_BANK: TcxGridColumn
            Caption = #1041#1072#1085#1082
            Width = 28
          end
          object grPostavFC_LICENSE_N: TcxGridColumn
            Caption = #8470' '#1083#1080#1094#1077#1085#1079#1080#1080
            Width = 29
          end
          object grPostavFD_LICENSE: TcxGridColumn
            Caption = #1057#1088#1086#1082' '#1083#1080#1094#1077#1085#1079#1080#1080
            DataBinding.ValueType = 'DateTime'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.SaveTime = False
            Properties.ShowTime = False
            Width = 28
          end
          object grPostavPostavID: TcxGridColumn
            Caption = #1053#1072#1096' '#1082#1086#1076
            MinWidth = 30
            Options.HorzSizing = False
            Width = 30
          end
        end
        object cxGridLevel5: TcxGridLevel
          GridView = grPostavTableView
        end
      end
    end
    object tsMOGroup: TTabSheet
      Caption = #1043#1088#1091#1087#1087#1099' '#1052#1054
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grMO_GROUP: TcxGrid
        Left = 0
        Top = 0
        Width = 666
        Height = 464
        Align = alClient
        TabOrder = 0
        object grMO_GROUPTableView: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #1050#1086#1083'-'#1074#1086': ### ###'
              Kind = skCount
              Column = grMO_GROUP_NAME
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object grMO_GROUP_Key: TcxGridColumn
            Caption = #1048#1089#1093'. '#1082#1086#1076
            MinWidth = 64
            Options.HorzSizing = False
          end
          object grMO_GROUP_NAME: TcxGridColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 526
          end
          object grMO_GROUP_ID: TcxGridColumn
            Caption = #1053#1072#1096' '#1082#1086#1076
            MinWidth = 92
            Options.HorzSizing = False
            Width = 92
          end
        end
        object cxGridLevel6: TcxGridLevel
          GridView = grMO_GROUPTableView
        end
      end
    end
    object tsMedics: TTabSheet
      Caption = #1052#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grMEDIC: TcxGrid
        Left = 0
        Top = 0
        Width = 666
        Height = 464
        Align = alClient
        TabOrder = 0
        object grMEDICTableView1: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #1050#1086#1083'-'#1074#1086': ### ###'
              Kind = skCount
              Column = grMEDICTorgName
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object grMEDICTheirKey: TcxGridColumn
            Caption = #1048#1089#1093'. '#1082#1086#1076
            MinWidth = 64
            Options.HorzSizing = False
          end
          object grMEDICTorgName: TcxGridColumn
            Caption = #1058#1086#1088#1075'. '#1085#1072#1079#1074#1072#1085#1080#1077
            Width = 150
          end
          object grMEDICLatName: TcxGridColumn
            Caption = #1051#1072#1090'. '#1085#1072#1079#1074#1072#1085#1080#1077
            Width = 124
          end
          object grMEDICEdIzm: TcxGridColumn
            Caption = #1045#1076'. '#1080#1079#1084'.'
            Width = 75
          end
          object grMEDICKolInUp: TcxGridColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1074' '#1091#1087'.'
          end
          object grMEDICUchGr: TcxGridColumn
            Caption = #1059#1095'. '#1075#1088#1091#1087#1087#1072
            Width = 72
          end
          object grMEDICGroup_LF: TcxGridColumn
            Caption = #1043#1088#1091#1087#1087#1072' '#1051#1060
          end
          object grMEDICFarmGr: TcxGridColumn
            Caption = #1060#1072#1088#1084'. '#1075#1088#1091#1087#1087#1072
            Width = 75
          end
          object grMEDICOurID: TcxGridColumn
            Caption = #1053#1072#1096' '#1082#1086#1076
            MinWidth = 92
            Options.HorzSizing = False
            Width = 92
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = grMEDICTableView1
        end
      end
    end
    object tsFinSource: TTabSheet
      Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089'.'
      ImageIndex = 7
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grFinSource: TcxGrid
        Left = 0
        Top = 0
        Width = 666
        Height = 464
        Align = alClient
        TabOrder = 0
        object grFinSourceTableView1: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #1050#1086#1083'-'#1074#1086': ### ###'
              Kind = skCount
              Column = grFinSourceName
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object grFinSourceTheirKey: TcxGridColumn
            Caption = #1048#1089#1093'. '#1082#1086#1076
            MinWidth = 64
            Options.HorzSizing = False
          end
          object grFinSourceName: TcxGridColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 526
          end
          object grFinSourceOurKey: TcxGridColumn
            Caption = #1053#1072#1096' '#1082#1086#1076
            MinWidth = 92
            Options.HorzSizing = False
            Width = 92
          end
        end
        object cxGridLevel8: TcxGridLevel
          GridView = grFinSourceTableView1
        end
      end
    end
    object tsPayCond: TTabSheet
      Caption = #1059#1089#1083#1086#1074#1080#1103' '#1086#1087#1083#1072#1090#1099
      ImageIndex = 8
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grPayCond: TcxGrid
        Left = 0
        Top = 0
        Width = 666
        Height = 464
        Align = alClient
        TabOrder = 0
        object grPayCondTableView: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #1050#1086#1083'-'#1074#1086': ### ###'
              Kind = skCount
              Column = grPayCondName
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object grPayCondTheirID: TcxGridColumn
            Caption = #1048#1089#1093'. '#1082#1086#1076
            MinWidth = 64
            Options.HorzSizing = False
          end
          object grPayCondName: TcxGridColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 526
          end
          object grPayCondOurID: TcxGridColumn
            Caption = #1053#1072#1096' '#1082#1086#1076
            MinWidth = 92
            Options.HorzSizing = False
            Width = 92
          end
        end
        object cxGridLevel9: TcxGridLevel
          GridView = grPayCondTableView
        end
      end
    end
    object tsDocs: TTabSheet
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Splitter1: TSplitter
        Left = 0
        Top = 244
        Width = 666
        Height = 11
        Cursor = crVSplit
        Align = alTop
      end
      object grParties: TcxGrid
        Left = 0
        Top = 255
        Width = 666
        Height = 209
        Align = alClient
        TabOrder = 0
        object cxGridDBTableView2: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsAddedParties
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = cxGridDBTableView2FC_NAME
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object cxGridDBTableView2Column1: TcxGridDBColumn
            Caption = #1048#1089#1093'. ID'
            DataBinding.FieldName = 'FK_THEIR_KEY_FIELD_VALUE'
          end
          object cxGridDBTableView2FC_NAME: TcxGridDBColumn
            Caption = #1052#1077#1076#1080#1082#1072#1084#1077#1085#1090
            DataBinding.FieldName = 'FC_NAME'
            SortIndex = 0
            SortOrder = soAscending
            Width = 200
          end
          object cxGridDBTableView2FC_UEDIZM: TcxGridDBColumn
            Caption = #1045#1076'. '#1080#1079#1084'.'
            DataBinding.FieldName = 'FC_UEDIZM'
            Width = 108
          end
          object cxGridDBTableView2FC_SERIAL: TcxGridDBColumn
            Caption = #1057#1077#1088#1080#1103
            DataBinding.FieldName = 'FC_SERIAL'
            Width = 87
          end
          object cxGridDBTableView2FD_GODEN: TcxGridDBColumn
            Caption = #1043#1086#1076#1077#1085' '#1076#1086
            DataBinding.FieldName = 'FD_GODEN'
            Width = 109
          end
          object cxGridDBTableView2FN_KOL: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086
            DataBinding.FieldName = 'FN_KOL'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.ValueType = vtFloat
            Width = 109
          end
          object cxGridDBTableView2FN_PRICE: TcxGridDBColumn
            Caption = #1062#1077#1085#1072', '#1088
            DataBinding.FieldName = 'FN_PRICE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 109
          end
          object cxGridDBTableView2Column2: TcxGridDBColumn
            Caption = #1053#1072#1096' ID'
            DataBinding.FieldName = 'DPCID'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
      object grDocs: TcxGrid
        Left = 0
        Top = 0
        Width = 666
        Height = 244
        Align = alTop
        TabOrder = 1
        object grDocsDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsAddedDocs
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = cxGridDBColumn2
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = #1048#1089#1093'. ID'
            DataBinding.FieldName = 'FK_THEIR_KEY_FIELD_VALUE'
            Width = 53
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'FC_DOC_TYPE'
            Width = 100
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            DataBinding.FieldName = 'FC_DOC_DESCR'
            Width = 104
          end
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = #8470' '#1076#1086#1082'-'#1090#1072
            DataBinding.FieldName = 'FC_DOC'
            Width = 83
          end
          object cxGridDBColumn5: TcxGridDBColumn
            Caption = #1044#1072#1090#1072
            DataBinding.FieldName = 'FD_DATA'
            Width = 103
          end
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = #1048#1089#1090#1086#1095#1085#1080#1082
            DataBinding.FieldName = 'FC_DOC_SOURCE'
            Width = 105
          end
          object cxGridDBColumn7: TcxGridDBColumn
            Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
            DataBinding.FieldName = 'FC_DOC_DESTINATION'
            Width = 104
          end
          object grDocsDBTableView1Column1: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'FN_PRICE'
          end
          object grDocsDBTableView1Column2: TcxGridDBColumn
            Caption = #1053#1072#1096' ID'
            DataBinding.FieldName = 'DPID'
          end
        end
        object cxGridLevel7: TcxGridLevel
          GridView = grDocsDBTableView1
        end
      end
    end
  end
  object dsAddedDocs: TDataSource
    DataSet = odsAddedDocs
    Left = 402
    Top = 238
  end
  object OracleSession1: TOracleSession
    LogonUsername = 'asu'
    LogonPassword = 'asu'
    LogonDatabase = 'ASU'
    RollbackOnDisconnect = True
    Left = 32
    Top = 6
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
      '  pfn_party_num NUMBER;'
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
      '    fk_prs_party_proizvoditel, fk_prs_party_sertifikat'
      ''
      '  FROM MED.TIMP_DOC_ITEMS'
      
        '  where (fk_imp_doc_id = :pFK_IMP_DOC_ID) and ( FN_IMP_STATUS >=' +
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
      
        '                         FK_MOGROUPID_TO = med.PKG_MEDSES.get_cu' +
        'r_mogroup,'
      '                         MOOWNERID = med.PKG_MEDSES.get_curmo,'
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
        ' fd_goden,    fn_price, fn_kol, FN_PRODCERTID) '
      
        '                   VALUES (i.medicid, pfn_party_num, i.FC_SERIAL' +
        ', i.FD_GODEN_DO, i.FN_PRICE, i.FN_KOL, nvl(i.fk_prs_party_sertif' +
        'ikat,i.fk_prs_party_proizvoditel) ) RETURNING kartid into pFK_Ka' +
        'rtID;'
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
    Optimize = False
    Variables.Data = {
      03000000020000000F0000003A50464B5F494D505F444F435F49440300000000
      000000000000000A0000003A50464B5F444F43494403000000040000009F5100
      0000000000}
    Cursor = crSQLWait
    Left = 316
    Top = 72
  end
  object oqAdd_TMEDIC: TOracleQuery
    SQL.Strings = (
      'begin'
      #9#9'insert into med.tmedic('
      #9#9#9'fc_name,'
      #9#9#9'fc_comment,'
      #9#9#9'uchgrid,'
      #9#9#9'eiid,'
      #9#9#9'farmgrid,'
      #9#9#9'levelid,'
      #9#9#9'fk_nomen_rls,'
      #9#9#9
      #9#9#9'fk_type,'
      #9#9#9'fk_paytype,'
      '                  fc_eancode,'#9#9#9
      '                  fn_fpackinupack,'
      #9#9#9'fk_fpackid,'
      #9#9#9'fn_mass,'
      #9#9#9'fk_massunits,'
      #9#9#9'fl_lgota,'
      #9#9#9'fc_name_lat,'
      #9#9#9'fl_print_lat_name,'
      '                    fk_group_lf'
      #9#9')'
      '        values ('
      #9#9#9':fc_name,'
      #9#9#9#39#1044#1086#1073#1072#1074#1083#1077#1085' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1089' '#1087#1086#1084#1086#1097#1100#1102' Import_Ekaterinburg'#39','
      #9#9#9':uchgrid,'
      #9#9#9':eiid,'
      #9#9#9':farmgrid,'
      #9#9#9'1,'
      #9#9#9'null,'
      #9#9#9'null,'
      #9#9#9'null,'
      '                  :fc_eancone,'
      '                  :kolfinu,'
      #9#9#9':fedizmid,'
      #9#9#9':fn_dozka,'
      #9#9#9':fk_dozkaunit,'
      #9#9#9'0,'
      #9#9#9':fc_name_lat,'
      #9#9#9'0,'
      '                     :fk_group_lf'
      #9#9') returning medicid into :FK_ID;'
      'end;')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      030000000C000000080000003A46435F4E414D45050000000000000000000000
      080000003A55434847524944030000000000000000000000050000003A454949
      44030000000000000000000000090000003A4641524D47524944030000000000
      0000000000000B0000003A46435F45414E434F4E450500000000000000000000
      00080000003A4B4F4C46494E55040000000000000000000000090000003A4645
      44495A4D4944030000000000000000000000090000003A464E5F444F5A4B4104
      00000000000000000000000D0000003A464B5F444F5A4B41554E495403000000
      00000000000000000C0000003A46435F4E414D455F4C41540500000000000000
      00000000060000003A464B5F49440300000000000000000000000C0000003A46
      4B5F47524F55505F4C46030000000000000000000000}
    Cursor = crSQLWait
    Left = 34
    Top = 258
  end
  object oqAdd_TEI: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '  INSERT INTO MED.tei (fc_name) VALUES (:FC_NAME) returning eiid' +
        ' into :FK_ID;'
      'end;')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A464B5F49440300000004000000FE0000000000
      0000080000003A46435F4E414D45050000000000000000000000}
    Cursor = crSQLWait
    Left = 30
    Top = 92
  end
  object oqAdd_TFARMGR: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '  INSERT INTO med.tfarmgr (fc_farmgr) VALUES (:fc_farmgr) return' +
        'ing FARMGRID into :FK_ID;'
      'end;')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A464B5F49440300000004000000AD0100000000
      00000A0000003A46435F4641524D4752050000000000000000000000}
    Cursor = crSQLWait
    Left = 30
    Top = 148
  end
  object oqAdd_TUCHGR: TOracleQuery
    SQL.Strings = (
      'begin'
      
        ' INSERT INTO med.tuchgr (fc_uchgr) VALUES (:fc_uchgr) returning ' +
        'UCHGRID into :FK_ID; '
      'end;')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A464B5F49440300000004000000CC0000000000
      0000090000003A46435F5543484752050000000000000000000000}
    Cursor = crSQLWait
    Left = 108
    Top = 94
  end
  object oqAdd_TMO_GROUP: TOracleQuery
    SQL.Strings = (
      'begin'
      
        ' INSERT INTO MED.tmo_group (fc_group) VALUES (:fc_group)  return' +
        'ing groupid into :FK_ID; '
      'end;')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A464B5F494403000000040000007D0100000000
      0000090000003A46435F47524F5550050000000000000000000000}
    Cursor = crSQLWait
    Left = 34
    Top = 202
  end
  object oqAdd_TKART_TDPC: TOracleQuery
    SQL.Strings = (
      'declare'
      '  pfc_party_num VARCHAR2(50);'
      '  pfn_party_num NUMBER;'
      'begin'
      '--         INSERT INTO med.tkart'
      
        '--                     (kartid, fc_name,                        ' +
        '                             medicid,  moid,  fd_goden,  fc_seri' +
        'al,  fn_prodcertid, fk_mogroupid, fn_price, fn_kol  )'
      
        '--         VALUES      (NULL,   '#39#1055#1072#1088#1090#1080#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1072' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' ' +
        #1087#1088#1086#1075#1088#1072#1084#1084#1086#1081' MedicaImporter1'#39', :medicid, -1,    :fd_goden, :fc_ser' +
        'ial, null,          :MOGROUP_ID,  :price,   :fn_kol )'
      '--         RETURNING   kartid into :FK_ID; '
      ''
      '    if :pFK_KartID is null then'
      
        '      select NVL(MAX(TKart.fn_party_num),'#39'0'#39') into pfc_party_num' +
        '  from med.TKart where TKart.medicid = :pmedicid;'
      '      pfn_party_num := TO_NUMBER(pfc_party_num) + 1;'
      
        '      INSERT INTO MED.TKART (medicid,   fn_party_num,  fc_serial' +
        ',  fd_goden,    fn_price, fn_kol, FN_PRODCERTID, FK_FINSOURCE_ID' +
        ') '
      
        '                     VALUES (:pmedicid, pfn_party_num, :pFC_SERI' +
        'AL, :pFD_GODEN_DO, :pFN_PRICE, :pFN_KOL, :pFN_PRODCERTID, :pFK_F' +
        'INSOURCE_ID ) RETURNING kartid into :pFK_KartID;'
      '    end if;'
      ''
      '    INSERT INTO MED.TDPC (dpid,     kartid,   fn_kol)'
      
        '                  VALUES (:pFK_DOCID, :pFK_KartID, :pFN_KOL) ret' +
        'urning dpcid into :pDPCID;'
      'end;')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      030000000A000000090000003A504D4544494349440300000000000000000000
      000B0000003A5046435F53455249414C0500000000000000000000000D000000
      3A5046445F474F44454E5F444F0C00000000000000000000000A0000003A5046
      4E5F5052494345040000000000000000000000080000003A50464E5F4B4F4C04
      00000000000000000000000A0000003A50464B5F444F43494403000000000000
      0000000000070000003A5044504349440300000000000000000000000B000000
      3A50464B5F4B4152544944030000000000000000000000110000003A50464B5F
      46494E534F555243455F49440300000000000000000000000F0000003A50464E
      5F50524F44434552544944030000000000000000000000}
    Cursor = crSQLWait
    Left = 34
    Top = 314
  end
  object oqAdd_TDOCS: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '  insert into med.tdocs (fd_data,   fc_doc,   fp_vid,   fp_vidmo' +
        've,   postavid,'
      
        '                         fc_comment,    fl_edit, fd_invoice, fk_' +
        'mogroupid,'
      
        '                         fk_mogroupid_from,   fk_mogroupid_to,  ' +
        ' motoid,   mofromid,'
      
        '                         MOOWNERID, FC_KONTRAKT, FK_FINSOURCE_ID' +
        ', FK_PAYCOND_ID)'
      
        '                  values(:pfd_data, :pfc_doc, :pfp_vid, :pfp_vid' +
        'move, :ppostavid,'
      
        '                         :pfc_comment,  0,       :pfd_data,  :pf' +
        'k_mogroupid,'
      
        '                         :pfk_mogroupid_from, :pfk_mogroupid_to,' +
        ' :pmotoid, :pmofromid,'
      
        '                         -1       , :pFC_KONTRAKT, :pFK_FINSOURC' +
        'E_ID, :pFK_PAYCOND_ID)'
      '  RETURNING   dpid into :FK_ID; '
      'end;')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      030000000F000000060000003A464B5F494403000000040000009E9101000000
      0000090000003A5046445F444154410C0000000000000000000000080000003A
      5046505F5649440300000000000000000000000C0000003A5046505F5649444D
      4F56450300000000000000000000000E0000003A50464B5F4D4F47524F555049
      44030000000000000000000000110000003A50464B5F4D4F47524F555049445F
      544F0300000000000000000000000C0000003A5046435F434F4D4D454E540500
      00000000000000000000130000003A50464B5F4D4F47524F555049445F46524F
      4D0300000000000000000000000D0000003A5046435F4B4F4E5452414B540500
      00000000000000000000080000003A5046435F444F4305000000000000000000
      00000A0000003A50504F53544156494403000000000000000000000008000000
      3A504D4F544F49440300000000000000000000000A0000003A504D4F46524F4D
      4944030000000000000000000000110000003A50464B5F46494E534F55524345
      5F49440300000000000000000000000F0000003A50464B5F504159434F4E445F
      4944030000000000000000000000}
    Cursor = crSQLWait
    Left = 34
    Top = 366
  end
  object oqUpdateTDOCS_FN_PRICE: TOracleQuery
    SQL.Strings = (
      'begin'
      '  update med.tdocs'
      '  set FN_PRICE = med.pkg_prihrash.getsumdoc(:dpid,1)'
      '  where dpid = :dpid;'
      'end;')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {0300000001000000050000003A44504944030000000000000000000000}
    Cursor = crSQLWait
    Left = 34
    Top = 422
  end
  object oqTDOCS_Commit: TOracleQuery
    SQL.Strings = (
      'begin'
      ' null;'
      '--  update med.tmedic'
      '--  set fc_comment = fc_comment|| '#39'(Commited)'#39
      '--  where fc_comment like '#39'%(MedicaImporter1)'#39';'
      'end;')
    Session = OracleSession1
    Optimize = False
    Left = 282
    Top = 274
  end
  object oqTMEDIC_Commit: TOracleQuery
    SQL.Strings = (
      'begin'
      'update med.tmedic'
      
        'set fc_comment = '#39#1044#1086#1073#1072#1074#1083#1077#1085' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1089' '#1087#1086#1084#1086#1097#1100#1102' MedicaImporte' +
        'r1 (Commited)'#39
      
        'where fc_comment = '#39#1044#1086#1073#1072#1074#1083#1077#1085' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1089' '#1087#1086#1084#1086#1097#1100#1102' MedicaImpor' +
        'ter1'#39';'
      'end;')
    Session = OracleSession1
    Optimize = False
    Left = 282
    Top = 212
  end
  object oqTKART_Commit: TOracleQuery
    SQL.Strings = (
      'begin'
      'UPDATE med.tkart'
      
        'SET fc_name = '#39#1055#1072#1088#1090#1080#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1072' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1086#1081' MedicaI' +
        'mporter1 (Commited)'#39
      
        'WHERE fc_name = '#39#1055#1072#1088#1090#1080#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1072' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1086#1081' Medic' +
        'aImporter1'#39';'
      'end;')
    Session = OracleSession1
    Optimize = False
    Left = 280
    Top = 154
  end
  object odsTMEDIC: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '       TMEDIC.ROWID, TMEDIC.medicid,'
      
        '       TMEDIC.fc_name, TMEDIC.eiid, TMEDIC.farmgrid, TMEDIC.uchg' +
        'rid, TMEDIC.medicid as FK_ID, TMEDIC.levelid,'
      
        '       TMEDIC.fc_comment, TMEDIC.fl_pku, TMEDIC.fk_nomen_rls, TM' +
        'EDIC.fc_eancode, TMEDIC.fk_type,'
      
        '       TMEDIC.fk_paytype, TMEDIC.fn_fpackinupack, TMEDIC.fk_fpac' +
        'kid, TMEDIC.fn_mass,'
      
        '       TMEDIC.fk_massunits, TMEDIC.fc_name_lat, TMEDIC.fl_lgota,' +
        ' TMEDIC.fl_visible,       '
      '       '
      '       TUCHGR.FC_UCHGR AS FC_UCHNAME, '
      '       TFARMGR.FC_FARMGR AS FC_FARMNAME,'
      '       TEI.FC_NAME AS FC_UEDIZM,'
      '       T2.FC_NAME AS FC_FEDIZM,'
      '       TMASSUNITS.FC_SHORTNAME AS FC_MASSUNITS'
      ''
      'FROM'
      '  MED.TMEDIC,'
      '  MED.TUCHGR,'
      '  MED.TFARMGR, '
      '  MED.TEI,'
      '  MED.TEI T2,'
      '  MED.TMASSUNITS'
      'WHERE '
      '      TMEDIC.UCHGRID = TUCHGR.UCHGRID(+)'
      '  AND TMEDIC.FARMGRID = TFARMGR.FARMGRID(+)'
      '  AND TMEDIC.EIID = TEI.EIID (+)'
      '  AND TMEDIC.FK_FPACKID = T2.EIID (+)'
      '  AND TMEDIC.FK_MASSUNITS = TMASSUNITS.FK_ID (+)'
      '')
    ReadBuffer = 300
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000180000000700000046435F4E414D450100000000000A00000046435F
      5543484E414D450100000000000B00000046435F4641524D4E414D4501000000
      000006000000464C5F504B550100000000000C000000464B5F4E4F4D454E5F52
      4C530100000000000A00000046435F45414E434F444501000000000007000000
      464B5F545950450100000000000900000046435F554544495A4D010000000000
      0A000000464B5F465041434B49440100000000000F000000464E5F465041434B
      494E555041434B0100000000000900000046435F464544495A4D010000000000
      07000000464E5F4D4153530100000000000C000000464B5F4D415353554E4954
      530100000000000C00000046435F4D415353554E4954530100000000000B0000
      0046435F4E414D455F4C41540100000000000700000055434847524944010000
      0000000A000000464B5F50415954595045010000000000040000004549494401
      0000000000080000004641524D47524944010000000000070000004C4556454C
      49440100000000000A00000046435F434F4D4D454E5401000000000008000000
      464C5F4C474F54410100000000000A000000464C5F56495349424C4501000000
      000005000000464B5F4944010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    QueryAllRecords = False
    CommitOnPost = False
    Session = OracleSession1
    FilterOptions = [foNoPartialCompare]
    Left = 172
    Top = 384
  end
  object odsTEI: TOracleDataSet
    SQL.Strings = (
      
        'SELECT a.eiid as FK_ID, a.fc_name --, a.fc_okei, a.fk_rlsdrugfor' +
        'm, a.fl_xxx, a.fk_pharm'
      '  FROM med.tei a')
    ReadBuffer = 50
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000060000000700000046435F4E414D450100000000000700000046435F
      4F4B45490100000000000E000000464B5F524C5344525547464F524D01000000
      000006000000464C5F58585801000000000008000000464B5F504841524D0100
      0000000005000000464B5F4944010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    QueryAllRecords = False
    CommitOnPost = False
    Session = OracleSession1
    FilterOptions = [foNoPartialCompare]
    Left = 174
    Top = 94
  end
  object odsTFARMGR: TOracleDataSet
    SQL.Strings = (
      'SELECT a.fc_farmgr, a.farmgrid as FK_ID, a.fk_frmgr_rls'
      '  FROM med.tfarmgr a')
    ReadBuffer = 50
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000040000000900000046435F4641524D47520100000000000C00000046
      4B5F46524D47525F524C5301000000000008000000464B5F504841524D010000
      00000005000000464B5F4944010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    QueryAllRecords = False
    CommitOnPost = False
    Session = OracleSession1
    FilterOptions = [foNoPartialCompare]
    Left = 176
    Top = 140
  end
  object odsTUCHGR: TOracleDataSet
    SQL.Strings = (
      'SELECT a.fc_uchgr, a.uchgrid as fk_id'
      'FROM med.tuchgr a')
    ReadBuffer = 50
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000040000000800000046435F554348475201000000000006000000464C
      5F4D415401000000000008000000464B5F504841524D01000000000005000000
      464B5F4944010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    QueryAllRecords = False
    CommitOnPost = False
    Session = OracleSession1
    FilterOptions = [foNoPartialCompare]
    Left = 176
    Top = 214
  end
  object odsTMO_GROUP: TOracleDataSet
    SQL.Strings = (
      'SELECT a.groupid as FK_ID, a.fc_group, a.fl_del'
      '  FROM med.tmo_group a')
    ReadBuffer = 50
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000800000046435F4752
      4F555001000000000006000000464C5F44454C010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    QueryAllRecords = False
    CommitOnPost = False
    Session = OracleSession1
    FilterOptions = [foNoPartialCompare]
    Left = 176
    Top = 328
  end
  object odsAddedParties: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '--       TKART.ROWID, '
      '  dp.dpcid,     '
      '  m.fc_name,       '
      '  ei.FC_NAME AS FC_UEDIZM,'
      '  dp.FN_KOL,'
      '  k.FN_PRICE,'
      '  k.FD_GODEN,'
      '  k.FC_SERIAL,'
      '  pc.FC_VALUE as FC_CERT,'
      '  li.FK_THEIR_KEY_FIELD_VALUE'
      'FROM'
      '  MED.TDPC dp,'
      '  MED.TKART K,'
      '  MED.TMEDIC M,'
      '  MED.TEI ei,'
      '  med.tprodcert pc,'
      '  med.TLINK_IMPNAKL li'
      ''
      ''
      'WHERE '
      
        '--  ((TDOCS.FC_COMMENT not like '#39'%(Commited)'#39') AND (TDOCS.FC_COM' +
        'MENT like '#39'%(MedicaImporter1)'#39')) AND'
      '  dp.DPID = :pDPID AND'
      '  k.KARTID = dp.KARTID AND'
      
        '--  TKART.FC_NAME = '#39#1055#1072#1088#1090#1080#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1072' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1086#1081' M' +
        'edicaImporter1'#39' AND'
      '  k.medicid = m.medicid AND'
      '  k.FN_PRODCERTID = pc.fk_id(+) and'
      '  m.EIID = ei.EIID (+) and'
      ''
      
        '  li.FK_POST_ID = -1 and li.FN_THEIR_TABLE_NUM in( 13, 15 ) and ' +
        'dp.dpcid = li.FK_OUR_KEY_FIELD_VALUE(+)')
    ReadBuffer = 300
    Optimize = False
    Variables.Data = {0300000001000000060000003A5044504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000700000046435F4E414D450100000000000900000046435F
      554544495A4D01000000000006000000464E5F4B4F4C01000000000008000000
      464E5F50524943450100000000000800000046445F474F44454E010000000000
      0900000046435F53455249414C0100000000000700000046435F434552540100
      0000000005000000445043494401000000000018000000464B5F54484549525F
      4B45595F4649454C445F56414C5545010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = OracleSession1
    Left = 124
    Top = 408
  end
  object dsAddedParties: TDataSource
    DataSet = odsAddedParties
    Left = 122
    Top = 474
  end
  object oqAdd_TPOSTAV: TOracleQuery
    SQL.Strings = (
      'begin'
      ''
      ' '
      'INSERT INTO med.tpostav (FC_NAME, '
      'FC_KONTRAKT_N,'
      'FD_KONTRAKT_BEGIN,'
      'FD_KONTRAKT_END,'
      'FC_ADDRESS,'
      'FC_PHONE,'
      'FC_R_S,'
      'FC_K_S,'
      'FC_INN,'
      'FC_BIK,'
      'FC_OKPO,'
      'FC_OKONH,'
      'FC_BANK,'
      'FC_LICENSE_N,'
      'FD_LICENSE)'
      ''
      ' VALUES (:FC_NAME,'
      ':FC_KONTRAKT_N,'
      ':FD_KONTRAKT_BEGIN,'
      ':FD_KONTRAKT_END,'
      ':FC_ADDRESS,'
      ':FC_PHONE,'
      ':FC_R_S,'
      ':FC_K_S,'
      ':FC_INN,'
      ':FC_BIK,'
      ':FC_OKPO,'
      ':FC_OKONH,'
      ':FC_BANK,'
      ':FC_LICENSE_N,'
      ':FD_LICENSE) returning postavid into :FK_ID;'
      'end;')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0300000010000000080000003A46435F4E414D45050000000000000000000000
      060000003A464B5F49440300000000000000000000000E0000003A46435F4B4F
      4E5452414B545F4E050000000000000000000000120000003A46445F4B4F4E54
      52414B545F424547494E0C0000000000000000000000100000003A46445F4B4F
      4E5452414B545F454E440C00000000000000000000000B0000003A46435F4144
      4452455353050000000000000000000000090000003A46435F50484F4E450500
      00000000000000000000070000003A46435F525F530500000000000000000000
      00070000003A46435F4B5F53050000000000000000000000070000003A46435F
      494E4E050000000000000000000000070000003A46435F42494B050000000000
      000000000000080000003A46435F4F4B504F0500000000000000000000000900
      00003A46435F4F4B4F4E48050000000000000000000000080000003A46435F42
      414E4B0500000000000000000000000D0000003A46435F4C4943454E53455F4E
      0500000000000000000000000B0000003A46445F4C4943454E53450C00000000
      00000000000000}
    Cursor = crSQLWait
    Left = 106
    Top = 160
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'mdb'
    Filter = '*.mdb|*.mdb'
    Options = [ofEnableSizing]
    Left = 98
    Top = 8
  end
  object odsTPostav: TOracleDataSet
    SQL.Strings = (
      'SELECT a.postavid as  fk_id, a.fc_name'
      'FROM med.tpostav a')
    ReadBuffer = 50
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000040000000800000046435F554348475201000000000006000000464C
      5F4D415401000000000008000000464B5F504841524D01000000000005000000
      464B5F4944010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    QueryAllRecords = False
    CommitOnPost = False
    Session = OracleSession1
    FilterOptions = [foNoPartialCompare]
    Left = 178
    Top = 266
  end
  object oqInsTLINK_IMPNAKL: TOracleQuery
    SQL.Strings = (
      'begin'
      '  delete from med.tlink_impnakl a'
      '        where (a.fk_post_id = :pfk_post_id) and'
      '              (a.fn_their_table_num = :pfn_their_table_num) and'
      
        '              (a.fk_their_key_field_value = :pfk_their_key_field' +
        '_value);'
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
      'end;')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0300000006000000100000003A5046435F54484549525F56414C554505000000
      0000000000000000120000003A50464E5F4F55525F5441424C455F4E554D0300
      000000000000000000000C0000003A50464B5F504F53545F4944030000000000
      000000000000180000003A50464B5F4F55525F4B45595F4649454C445F56414C
      5545030000000000000000000000140000003A50464E5F54484549525F544142
      4C455F4E554D0300000000000000000000001A0000003A50464B5F5448454952
      5F4B45595F4649454C445F56414C5545030000000000000000000000}
    Left = 282
    Top = 352
  end
  object odsTLINK_IMPNAKL: TOracleDataSet
    SQL.Strings = (
      'SELECT a.fk_id, a.fn_our_table_num, a.fk_our_key_field_value,'
      
        '       a.fk_post_id, a.fn_their_table_num, a.fk_their_key_field_' +
        'value,'
      '       a.fc_their_value'
      'FROM med.tlink_impnakl a'
      ''
      
        'where (a.fk_their_key_field_value = :pfk_their_key_field_value) ' +
        'and'
      '      (a.fn_their_table_num = :pfn_their_table_num) and'
      '      (a.fk_post_id = :pfk_post_id) and'
      '      (a.fn_our_table_num = :pfn_our_table_num)'
      '')
    Optimize = False
    Variables.Data = {
      03000000040000000C0000003A50464B5F504F53545F49440300000000000000
      00000000140000003A50464E5F54484549525F5441424C455F4E554D03000000
      00000000000000001A0000003A50464B5F54484549525F4B45595F4649454C44
      5F56414C5545030000000000000000000000120000003A50464E5F4F55525F54
      41424C455F4E554D030000000000000000000000}
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
    Session = OracleSession1
    Left = 408
    Top = 342
  end
  object odsAddedDocs: TOracleDataSet
    SQL.Strings = (
      'select '
      '  d.*, '
      
        '  decode(d.fp_vid, 1,'#39#1055#1088#1080#1093#1086#1076#39', 2,'#39#1044#1074#1080#1078#1077#1085#1080#1077#39', 3,'#39#1056#1072#1089#1093#1086#1076#39', '#39#39') as ' +
        'FC_DOC_TYPE,'
      
        '  MED.PKGTDOCS.GET_DOC_DESTINATION ( d.fp_Vid, d.fp_VidMove, d.F' +
        'K_MOGROUPID_TO,  d.PostavID) as FC_DOC_DESTINATION,'
      
        '  MED.PKGTDOCS.GET_DOC_SOURCE ( d.fp_Vid, d.fp_VidMove, d.FK_MOG' +
        'ROUPID_FROM,  d.PostavID  ) as FC_DOC_SOURCE,'
      '  MED.GET_DECODEDOCVIDMOVE(d.fp_VidMove) as FC_DOC_DESCR,'
      '  li.FK_THEIR_KEY_FIELD_VALUE'
      ''
      
        'from med.tdocs d, (select li.FK_OUR_KEY_FIELD_VALUE, li.FK_THEIR' +
        '_KEY_FIELD_VALUE from med.TLINK_IMPNAKL li where li.FK_POST_ID =' +
        ' -1 and li.FN_OUR_TABLE_NUM = 8) li'
      'where'
      '  d.fp_vidmove in(1,2,8) and d.mofromid = -1 and'
      '  d.dpid = li.FK_OUR_KEY_FIELD_VALUE(+)'
      '  '
      '')
    ReadBuffer = 500
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000001B0000000A00000046435F434F4D4D454E5401000000000004000000
      44504944010000000000090000004D4F4F574E45524944010000000000070000
      0046445F444154410100000000000600000046435F444F430100000000000600
      000046505F564944010000000000080000004D4F46524F4D4944010000000000
      060000004D4F544F494401000000000008000000504F53544156494401000000
      000008000000464E5F50524943450100000000000A00000046505F5649444D4F
      564501000000000007000000464C5F454449540100000000000A00000046445F
      494E564F49434501000000000007000000464C5F545245420100000000000E00
      0000464E5F53504953414E49455649440100000000000C000000464B5F4D4F47
      524F555049440100000000000F000000464B5F4D4F47524F555049445F544F01
      000000000011000000464B5F4D4F47524F555049445F46524F4D010000000000
      0B000000464B5F534B4C41445F49440100000000000B000000464B5F5649445F
      504F53540100000000000B00000046435F4B4F4E5452414B5401000000000010
      00000046435F53434845545F46414B545552410100000000000B00000046435F
      444F435F545950450100000000001200000046435F444F435F44455354494E41
      54494F4E0100000000000D00000046435F444F435F534F555243450100000000
      000C00000046435F444F435F444553435201000000000018000000464B5F5448
      4549525F4B45595F4649454C445F56414C5545010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    CommitOnPost = False
    Session = OracleSession1
    BeforeOpen = odsAddedDocsBeforeOpen
    AfterOpen = odsAddedDocsAfterOpen
    AfterScroll = odsAddedDocsAfterScroll
    Left = 402
    Top = 188
  end
  object ActionList1: TActionList
    Left = 454
    Top = 4
    object acRefreshDocs: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      ShortCut = 116
      Visible = False
      OnExecute = acRefreshDocsExecute
    end
  end
  object oqClearOst: TOracleQuery
    SQL.Strings = (
      'declare'
      '  pDPCID NUMBER;'
      'begin'
      '  MED.PKG_MEDSES.RESETDATEPERIOD;'
      '  MED.PKG_MEDSES.set_curmo_group(:pAptekaID);'
      '  '
      '  -- '#1095#1080#1089#1090#1080#1084' '#1082#1088#1091#1087#1085#1099#1077' '#1086#1089#1090#1072#1090#1082#1080' > 0.00001'
      
        '  for OstBig in(SELECT a.kartid, a.medicid, a.fn_fpackinupack, a' +
        '.fn_price, a.fn_kolost,'
      '                  a.fn_ost_type, a.dpcid'
      '           FROM med.vmedkart_kolost a'
      
        '           where a.fn_kolost < -0.00001 and a.fn_kolost <> 0) lo' +
        'op'
      '  '
      '   delete from med.tdpc dp1 '
      '    where dp1.dpcid in ('
      
        '    select dp.dpcid from med.tdocs d,med.tdpc dp where d.dpid = ' +
        'dp.dpid and d.fp_vidmove = 8 and'
      '          dp.kartid = OstBig.kartid and '
      
        '          MED.PKG_PRIHRASH.Get_PrihRashPriznak( d.FP_VID, d.FP_V' +
        'IDMOVE,'
      '                                        d.fk_mogroupid_from,'
      '                                        d.fk_mogroupid_to,'
      
        '                                        MED.PKG_MEDSES.get_cur_m' +
        'ogroup ) < 0);'
      '  end loop;'
      '  '
      '  '
      '  -- '#1095#1080#1089#1090#1080#1084' '#1084#1077#1083#1082#1080#1077' '#1086#1089#1090#1072#1090#1082#1080
      
        '  for OstSmall in(SELECT a.kartid, a.medicid, a.fn_fpackinupack,' +
        ' a.fn_price, a.fn_kolost,'
      '                         a.fn_ost_type, a.dpcid'
      '                  FROM med.vmedkart_kolost a'
      
        '                  where a.fn_kolost > -0.00001 and a.fn_kolost <' +
        ' 0.00001 and a.fn_kolost <> 0) loop'
      '  '
      '    select dpcid into pDPCID '
      '    from'
      '     (select dp.dpcid, dp.fn_kol from med.tdocs d, med.tdpc dp'
      '      where d.dpid = dp.dpid and'
      '            dp.kartid = OstSmall.kartid and '
      
        '            MED.PKG_PRIHRASH.Get_PrihRashPriznak( d.FP_VID, d.FP' +
        '_VIDMOVE,'
      '                                        d.fk_mogroupid_from,'
      '                                        d.fk_mogroupid_to,'
      
        '                                        MED.PKG_MEDSES.get_cur_m' +
        'ogroup ) < 0'
      '      order by d.fd_data desc)'
      '    where rownum < 2;'
      '    '
      
        '    update med.tdpc set fn_kol = fn_kol+OstSmall.fn_kolost where' +
        ' dpcid = pDPCID;'
      '  end loop;'
      ''
      
        '  update med.tdocs set FN_PRICE = med.pkg_prihrash.getsumdoc(dpi' +
        'd,1);'
      'end;  ')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50415054454B41494403000000000000000000
      0000}
    Cursor = crSQLWait
    Left = 284
    Top = 416
  end
  object odsTFinSource: TOracleDataSet
    SQL.Strings = (
      'SELECT a.*'
      'FROM med.TFinSource a')
    ReadBuffer = 50
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000040000000800000046435F554348475201000000000006000000464C
      5F4D415401000000000008000000464B5F504841524D01000000000005000000
      464B5F4944010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    QueryAllRecords = False
    CommitOnPost = False
    Session = OracleSession1
    FilterOptions = [foNoPartialCompare]
    Left = 200
    Top = 434
  end
  object odsTPayCond: TOracleDataSet
    SQL.Strings = (
      'SELECT a.*'
      'FROM med.TPayCond a')
    ReadBuffer = 50
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000040000000800000046435F554348475201000000000006000000464C
      5F4D415401000000000008000000464B5F504841524D01000000000005000000
      464B5F4944010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    QueryAllRecords = False
    CommitOnPost = False
    Session = OracleSession1
    FilterOptions = [foNoPartialCompare]
    Left = 206
    Top = 482
  end
  object oqAddTFinSource: TOracleQuery
    SQL.Strings = (
      'begin'
      
        ' INSERT INTO MED.tFinSource (fc_name) VALUES (:fc_name)  returni' +
        'ng FK_ID into :FK_ID; '
      'end;')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A464B5F494403000000040000001B0000000000
      0000080000003A46435F4E414D45050000000000000000000000}
    Cursor = crSQLWait
    Left = 38
    Top = 478
  end
  object oqAddTPayCond: TOracleQuery
    SQL.Strings = (
      'begin'
      
        ' INSERT INTO MED.tPayCond (fc_name) VALUES (:fc_name)  returning' +
        ' FK_ID into :FK_ID; '
      'end;')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A464B5F49440300000004000000050000000000
      0000080000003A46435F4E414D45050000000000000000000000}
    Cursor = crSQLWait
    Left = 310
    Top = 476
  end
  object oqDelDocs_Dpc_Karts: TOracleQuery
    SQL.Strings = (
      'begin'
      '  delete from med.tdocs;'
      '  delete from med.tdpc;'
      '  delete from med.tkart;'
      'end;')
    Session = OracleSession1
    Optimize = False
    Cursor = crSQLWait
    Left = 504
    Top = 112
  end
  object odsTProdCert: TOracleDataSet
    SQL.Strings = (
      
        'select p.fk_id, p.fn_parent, p.fc_value as fc_name, p.fk_sklad_i' +
        'd'
      
        ' from med.tprodcert p where ( ((:pIsCert = 0)and(p.fn_parent = 0' +
        ')) or ((:pIsCert = 1)and(p.fn_parent <> 0)) )')
    Optimize = False
    Variables.Data = {
      0300000001000000080000003A50495343455254030000000400000000000000
      00000000}
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
    QueryAllRecords = False
    CommitOnPost = False
    Session = OracleSession1
    Left = 116
    Top = 286
  end
  object oqTProdCert: TOracleQuery
    SQL.Strings = (
      'begin'
      
        ' INSERT INTO MED.TProdCert (fc_value, fn_parent) VALUES (:fc_nam' +
        'e, :fn_parent)  returning fk_id into :FK_ID; '
      'end;')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A464B5F494403000000040000007D0100000000
      0000080000003A46435F4E414D450500000000000000000000000A0000003A46
      4E5F504152454E54030000000000000000000000}
    Cursor = crSQLWait
    Left = 112
    Top = 232
  end
  object oqAdd_TGROUP_LF: TOracleQuery
    SQL.Strings = (
      'begin'
      
        ' INSERT INTO med.tgroup_LF (FC_GROUP_LF) VALUES (:fc_GROUP_LF) r' +
        'eturning FK_GROUP_LF_ID into :FK_ID; '
      'end;')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A464B5F49440300000004000000260000000000
      00000C0000003A46435F47524F55505F4C46050000000000000000000000}
    Cursor = crSQLWait
    Left = 508
    Top = 182
  end
  object odsTGROUP_LF: TOracleDataSet
    SQL.Strings = (
      'SELECT a.fc_GROUP_LF, a.FK_GROUP_LF_ID as fk_id'
      'FROM med.tGROUP_LF a')
    ReadBuffer = 50
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000040000000800000046435F554348475201000000000006000000464C
      5F4D415401000000000008000000464B5F504841524D01000000000005000000
      464B5F4944010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    QueryAllRecords = False
    CommitOnPost = False
    Session = OracleSession1
    FilterOptions = [foNoPartialCompare]
    Left = 512
    Top = 238
  end
end
