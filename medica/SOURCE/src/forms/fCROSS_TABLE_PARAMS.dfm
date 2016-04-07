object frmCROSS_TABLE_PARAMS: TfrmCROSS_TABLE_PARAMS
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '
  ClientHeight = 320
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 726
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 718
      end>
    BorderWidth = 1
    EdgeBorders = [ebLeft, ebTop, ebRight]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 709
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 57
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object tbuAdd: TToolButton
        Left = 0
        Top = 0
        Action = acAdd
        AllowAllUp = True
        Style = tbsCheck
      end
      object tbuEdit: TToolButton
        Left = 57
        Top = 0
        Action = acEdit
        AllowAllUp = True
        Style = tbsCheck
      end
      object ToolButton4: TToolButton
        Left = 114
        Top = 0
        Action = acDel
      end
      object ToolButton7: TToolButton
        Left = 171
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 179
        Top = 0
        Action = acRefresh
      end
      object ToolButton6: TToolButton
        Left = 236
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 244
        Top = 0
        Action = acClose
      end
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 42
    Width = 726
    Height = 278
    Align = alClient
    TabOrder = 1
    object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsCROSS_TABLE_PARAMS
      DataController.KeyFieldNames = 'FK_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Appending = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Bands = <
        item
          Width = 243
        end
        item
          Caption = #1058#1072#1073#1083#1080#1094#1072' 1'
          Width = 249
        end
        item
          Caption = #1058#1072#1073#1083#1080#1094#1072' 2'
          Width = 220
        end>
      object cxGrid1DBBandedTableView1_fk_id: TcxGridDBBandedColumn
        Caption = 'ID'
        DataBinding.FieldName = 'fk_id'
        Options.Editing = False
        Width = 32
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1_fc_cross_name: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'fc_cross_name'
        Width = 143
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1_fp_check_type: TcxGridDBBandedColumn
        Caption = #1058#1080#1087' '#1087#1088#1072#1074
        DataBinding.FieldName = 'fp_check_type'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            Caption = #1058#1080#1087
            FieldName = 'FC_NAME'
          end>
        Properties.ListSource = dsParamValueType
        Width = 68
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1_FC_SYNONIM: TcxGridDBBandedColumn
        Caption = #1057#1080#1085#1086#1085#1080#1084
        DataBinding.FieldName = 'FC_SYNONIM'
        PropertiesClassName = 'TcxTextEditProperties'
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1_FC_TABLE1_COMMENT: TcxGridDBBandedColumn
        Caption = #1055#1086#1076#1087#1080#1089#1100
        DataBinding.FieldName = 'FC_TABLE1_COMMENT'
        PropertiesClassName = 'TcxTextEditProperties'
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1_fc_table1: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099
        DataBinding.FieldName = 'fc_table1'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 95
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1_fc_name_field1: TcxGridDBBandedColumn
        Caption = #1055#1086#1083#1077' '#1089' '#1085#1072#1079#1074#1072#1085#1080#1077#1084
        DataBinding.FieldName = 'fc_name_field1'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 77
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1_fc_key_field1: TcxGridDBBandedColumn
        Caption = #1050#1083#1102#1095#1077#1074#1086#1077' '#1087#1086#1083#1077
        DataBinding.FieldName = 'fc_key_field1'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 77
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1_FC_TABLE2_COMMENT: TcxGridDBBandedColumn
        Caption = #1055#1086#1076#1087#1080#1089#1100
        DataBinding.FieldName = 'FC_TABLE2_COMMENT'
        PropertiesClassName = 'TcxTextEditProperties'
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1_fc_table2: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099
        DataBinding.FieldName = 'fc_table2'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 90
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1_fc_name_field2: TcxGridDBBandedColumn
        Caption = #1055#1086#1083#1077' '#1089' '#1085#1072#1079#1074#1072#1085#1080#1077#1084
        DataBinding.FieldName = 'fc_name_field2'
        Width = 65
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1_fc_key_field2: TcxGridDBBandedColumn
        Caption = #1050#1083#1102#1095#1077#1074#1086#1077' '#1087#1086#1083#1077
        DataBinding.FieldName = 'fc_key_field2'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 65
        Position.BandIndex = 2
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBBandedTableView1
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 304
    Top = 24
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      ImageIndex = 1
      ShortCut = 16499
      OnExecute = acCloseExecute
    end
    object acDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 22
      ShortCut = 119
      OnExecute = acDelExecute
    end
    object acEdit: TAction
      AutoCheck = True
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 3
      ShortCut = 114
      OnExecute = acEditExecute
    end
    object acAdd: TAction
      AutoCheck = True
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 21
      ShortCut = 115
      OnExecute = acAddExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 15
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
  end
  object odsCROSS_TABLE_PARAMS: TOracleDataSet
    SQL.Strings = (
      'SELECT a.ROWID, a.*'
      'FROM med.tcross_table_params a')
    Optimize = False
    SequenceField.Field = 'FK_ID'
    SequenceField.Sequence = 'MED.SEQ_TCROSS_TABLE_PARAMS'
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F5244455201000000000009000000464C
      5F4E4F54444F430100000000000A00000046435F53594E4F4E494D0100000000
      00}
    UniqueFields = 'FK_ID'
    Session = dmMain.os
    Left = 232
    Top = 144
  end
  object dsCROSS_TABLE_PARAMS: TDataSource
    DataSet = odsCROSS_TABLE_PARAMS
    Left = 228
    Top = 194
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmUchGr\'
    StoredValues = <>
    Left = 304
    Top = 104
  end
  object odsParamValueType: TOracleDataSet
    SQL.Strings = (
      'select 1 as FK_ID, '#39#1063#1077#1082#1073#1086#1082#1089#39' as FC_NAME from DUAL'
      'UNION ALL'
      'select 2 as FK_ID, '#39#1063#1080#1089#1083#1086#39' as FC_NAME from DUAL')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F5244455201000000000009000000464C
      5F4E4F54444F430100000000000A00000046435F53594E4F4E494D0100000000
      00}
    Session = dmMain.os
    Left = 40
    Top = 144
  end
  object dsParamValueType: TDataSource
    DataSet = odsParamValueType
    Left = 36
    Top = 194
  end
end
