object frmActions: TfrmActions
  Left = 478
  Top = 138
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = #1044#1077#1081#1089#1090#1074#1080#1103
  ClientHeight = 248
  ClientWidth = 206
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 200
    Height = 211
    Margins.Top = 0
    ActivePage = cxTabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = pcMainChange
    ExplicitLeft = 32
    ExplicitTop = 144
    ExplicitWidth = 289
    ExplicitHeight = 193
    ClientRectBottom = 211
    ClientRectRight = 200
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      ImageIndex = 0
      object grActions: TcxGrid
        Left = 0
        Top = 0
        Width = 200
        Height = 187
        Align = alClient
        TabOrder = 0
        object tvActions: TcxGridDBTableView
          OnKeyDown = tvActionsKeyDown
          NavigatorButtons.ConfirmDelete = False
          OnCellDblClick = tvActionsCellDblClick
          DataController.DataSource = dsActions
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          OptionsView.Indicator = True
          object tvActionsName: TcxGridDBColumn
            DataBinding.FieldName = 'FC_NAME'
          end
        end
        object grActionsLevel1: TcxGridLevel
          GridView = tvActions
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = #1056#1072#1081#1086#1085#1099
      ImageIndex = 1
      object grRaion: TcxGrid
        Left = 0
        Top = 0
        Width = 200
        Height = 187
        Align = alClient
        TabOrder = 0
        object tvRaion: TcxGridDBTableView
          OnKeyDown = tvRaionKeyDown
          NavigatorButtons.ConfirmDelete = False
          OnCellDblClick = tvRaionCellDblClick
          DataController.DataSource = dsRaion
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          OptionsView.Indicator = True
          object cxGridDBColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'FC_NAME'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = tvRaion
        end
      end
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 200
    Height = 28
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object lbCapAct: TcxLabel
      Left = 7
      Top = 4
      Caption = #1057#1086#1073#1099#1090#1080#1103
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object bMove: TcxButton
      AlignWithMargins = True
      Left = 143
      Top = 1
      Width = 28
      Height = 25
      Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1092#1086#1088#1084#1091
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnMouseDown = bMoveMouseDown
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE3B8FF9900FF9900FF9900FF9900FF9900FF
        9900FF9900FF9900FF9900FF9900FF9900FF9900FFE3B8FFFFFFFFFFFFFF9900
        FFE5E5FFE5E5FFE5E5FFE5E5FFE3E3FFE0E0FFDEDEFFDBDBFFD7D7FFD4D4FFCF
        CFFFCCCCFF9900FFFFFFFFFFFFFF9900FFEAEAFFEAEAFFEAEAFFEAEAFFE6E6FF
        E5E5FFE1E1FFDEDEFFDBDBFFD6D6FFD2D2FFCFCFFF9900FFFFFFFFFFFFFF9900
        FFF0F0FFF0F0FFF0F0FFEEEEFFECECFFE8E8FFE5E5FFE1E1FFDEDEFFD9D9FFD6
        D6FFD1D1FF9900FFFFFFFFFFFFFF9900FFF5F5FFF5F5FFF5F5FFF3F3FFF0F0FF
        EEEEFFE8E8FFE5E5FFE0E0FFDCDCFFD7D7FFD2D2FF9900FFFFFFFFFFFFFF9900
        FFFBFBFFFBFBFFFBFBFFF9F9FFF5F5FFF0F0FFECECFFE6E6FFE3E3FFDEDEFFD9
        D9FFD4D4FF9900FFFFFFFFFFFFFF9900FFFFFFFFFFFFFFFFFFFFFDFDFFF9F9FF
        F3F3FFEEEEFFEAEAFFE5E5FFE0E0FFDBDBFFD6D6FF9900FFFFFFFFFFFFFF9900
        FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFF5F5FFF0F0FFEAEAFFE5E5FFE0E0FFDB
        DBFFD6D6FF9900FFFFFFFFFFFFFF9900FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFF
        F5F5FFF0F0FFEAEAFFE5E5FFE0E0FFDBDBFFD6D6FF9900FFFFFFFFFFFFFF9900
        FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFF5F5FFF0F0FFEAEAFFE5E5FFE0E0FFDB
        DBFFD6D6FF9900FFFFFFFFFFFFFF9900D6D6D6D6D6D6D6D6D6D6D6D6D6D3D3D6
        CECED6CBCBD6C7C7D6C3C3D6BFBFD6BABAD6B6B6FF9900FFFFFFFFFFFFFF9900
        FF9900EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB85
        00F79100FF9900FFFFFFFFFFFFFF9900FFCC99FFCC99FFCC99FFCC99FFCC99FF
        CC99FFCC99FFCC99FFCC99FFCC99FFCC99FFAD3DFF9900FFFFFFFFFFFFFFE3B8
        FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF99
        00FF9900FFE3B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bClose: TcxButton
      AlignWithMargins = True
      Left = 170
      Top = 1
      Width = 28
      Height = 25
      Action = aClose
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF5251CE0B15AE9E88A4FFDBA53630AC2C29B2DA
        BAA8FFA318FF9900FF9900FF9900FF9900FF9900FFE3B8FFFFFFFFFFFF2E28AC
        2C72FF1534D42135C4174EFF155CFF3639C4FFF0F0FFDBDBFFD7D7FFD4D4FFCF
        CFFFCCCCFF9900FFFFFFFFFFFF9F89B11325C62C67FF255DFF205BFF1522BECD
        C8EDFFEBEBFFDEDEFFDBDBFFD6D6FFD2D2FFCFCFFF9900FFFFFFFFFFFFFFC266
        BEBBE21022BF2D66FF1C49F47876CBFFF6F6FFE5E5FFE1E1FFDEDEFFD9D9FFD6
        D6FFD1D1FF9900FFFFFFFFFFFFFFD0892D2CAF3F7DFF1C3FDD2961FF1323C5E5
        E1F4FFEDEDFFE5E5FFE0E0FFDCDCFFD7D7FFD2D2FF9900FFFFFFFFFFFFFFD89E
        161EC2396DFF8B8BD43A3BB72B6DFF2A2CBFFFF7F7FFE6E6FFE3E3FFDEDEFFD9
        D9FFD4D4FF9900FFFFFFFFFFFFFFAA2BBDBDF14242C4FFFFFFF4F3FC3434BFC4
        C2F1FFF4F4FFEAEAFFE5E5FFE0E0FFDBDBFFD6D6FF9900FFFFFFFFFFFFFF9900
        FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFFF8F8FFF0F0FFEAEAFFE5E5FFE0E0FFDB
        DBFFD6D6FF9900FFFFFFFFFFFFFF9900FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFF
        F5F5FFF0F0FFEAEAFFE5E5FFE0E0FFDBDBFFD6D6FF9900FFFFFFFFFFFFFF9900
        FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFF5F5FFF0F0FFEAEAFFE5E5FFE0E0FFDB
        DBFFD6D6FF9900FFFFFFFFFFFFFF9900D6D6D6D6D6D6D6D6D6D6D6D6D6D3D3D6
        CECED6CBCBD6C7C7D6C3C3D6BFBFD6BABAD6B6B6FF9900FFFFFFFFFFFFFF9900
        FF9900EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB85
        00F79100FF9900FFFFFFFFFFFFFF9900FFCC99FFCC99FFCC99FFCC99FFCC99FF
        CC99FFCC99FFCC99FFCC99FFCC99FFCC99FFAD3DFF9900FFFFFFFFFFFFFFE3B8
        FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF99
        00FF9900FFE3B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object dsActions: TDataSource
    DataSet = odsActions
    Left = 24
    Top = 56
  end
  object odsActions: TOracleDataSet
    SQL.Strings = (
      
        'select 1 as fk_id, '#39#1053#1072' '#1083#1080#1085#1080#1102#39' as fc_name, 1 as fn_order from dua' +
        'l'
      'union all'
      
        'select 2 as fk_id, '#39#1057#1084#1077#1085#1072' '#1079#1072#1082#1086#1085#1095#1077#1085#1072#39' as fc_name, 2 as fn_order f' +
        'rom dual'
      'union all'
      
        'select 3 as fk_id, '#39#1059#1096#1077#1083' '#1085#1072' '#1086#1073#1077#1076#39' as fc_name, 3 as fn_order from' +
        ' dual'
      'union all'
      
        'select 4 as fk_id, '#39#1042#1077#1088#1085#1091#1083#1089#1103' '#1089' '#1086#1073#1077#1076#1072#39' as fc_name, 4 as fn_order ' +
        'from dual'
      'union all'
      
        'select 5 as fk_id, '#39#1054#1090#1083#1091#1095#1080#1083#1089#1103#39' as fc_name, 5 as fn_order from du' +
        'al'
      'union all'
      
        'select 6 as fk_id, '#39#1048#1079' '#1084#1072#1096#1080#1085#1099#39' as fc_name, 6 as fn_order from du' +
        'al'
      'union all'
      
        'select 7 as fk_id, '#39#1042' '#1084#1072#1096#1080#1085#1091#39' as fc_name, 7 as fn_order from dua' +
        'l'
      'union all'
      'select 8 as fk_id, '#39#1055#1086#1083#1086#1084#1082#1072#39' as fc_name, 8 as fn_order from dual'
      'union all'
      
        'select 9 as fk_id, '#39#1054#1090#1088#1077#1084#1086#1085#1090#1080#1088#1086#1074#1072#1083#1089#1103#39' as fc_name, 9 as fn_order ' +
        'from dual'
      'union all'
      
        'select 10 as fk_id, '#39#1057#1085#1103#1090' '#1089' '#1083#1080#1085#1080#1080#39' as fc_name, 10 as fn_order fr' +
        'om dual'
      'union all'
      
        'select 11 as fk_id, '#39#1053#1072' '#1087#1077#1088#1089#1086#1085#1072#1083#1082#1091#39' as fc_name, 11 as fn_order f' +
        'rom dual'
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 24
    Top = 104
  end
  object dsRaion: TDataSource
    DataSet = odsRaion
    Left = 88
    Top = 57
  end
  object odsRaion: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name from taxi.ts_raion'
      ' where fl_del = 0'
      'order by fn_order ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 88
    Top = 105
  end
  object jvFrmStor: TJvFormStorage
    AppStorage = frmMain.AppStorage
    AppStoragePath = 'frmActions\'
    Options = [fpLocation]
    StoredValues = <>
    Left = 134
    Top = 54
  end
  object al: TActionList
    Left = 139
    Top = 114
    object aClose: TAction
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ShortCut = 27
      OnExecute = aCloseExecute
    end
  end
end
