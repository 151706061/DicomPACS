object fmDOC_AUTONUM: TfmDOC_AUTONUM
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1072#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  ClientHeight = 492
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 630
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 622
      end>
    BorderWidth = 1
    EdgeBorders = [ebLeft, ebTop, ebRight]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 613
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
      object ToolButton3: TToolButton
        Left = 0
        Top = 0
        Action = acAdd
      end
      object tbuEdit: TToolButton
        Left = 57
        Top = 0
        Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
        AllowAllUp = True
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        ImageIndex = 3
        Style = tbsCheck
        OnClick = tbuEditClick
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
      object tbuRefresh: TToolButton
        Left = 179
        Top = 0
        Action = acRefresh
      end
      object Panel2: TPanel
        Left = 236
        Top = 0
        Width = 109
        Height = 36
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object abuSetDocPeriod: TJvArrowButton
          Left = 95
          Top = 0
          Width = 14
          Height = 36
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076' '#1080#1079' '#1089#1087#1080#1089#1082#1072
          Align = alRight
          ArrowWidth = 15
          DropDown = pmFilterPeriod
          Flat = True
          FillFont.Charset = DEFAULT_CHARSET
          FillFont.Color = clWindowText
          FillFont.Height = -11
          FillFont.Name = 'MS Sans Serif'
          FillFont.Style = []
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 95
          Height = 36
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object dedDate1: TcxDateEdit
            Left = 18
            Top = 0
            Hint = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
            EditValue = 0d
            Enabled = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DateButtons = [btnToday]
            Properties.InputKind = ikMask
            Properties.PostPopupValueOnTab = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            OnKeyDown = dedDate1KeyDown
            Width = 77
          end
          object dedDate2: TcxDateEdit
            Left = 18
            Top = 16
            Hint = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
            EditValue = 0d
            Enabled = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DateButtons = [btnToday]
            Properties.InputKind = ikMask
            Properties.PostPopupValueOnTab = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 3
            OnKeyDown = dedDate2KeyDown
            Width = 77
          end
          object chbDate1: TcxCheckBox
            Left = 0
            Top = 0
            ParentColor = False
            Style.Color = clBtnFace
            TabOrder = 0
            OnClick = chbDate1Click
            Width = 21
          end
          object chbDate2: TcxCheckBox
            Left = 0
            Top = 16
            ParentColor = False
            Style.Color = clBtnFace
            TabOrder = 2
            OnClick = chbDate2Click
            Width = 21
          end
        end
      end
      object ToolButton10: TToolButton
        Left = 345
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbuCounters: TToolButton
        Left = 353
        Top = 0
        AutoSize = True
        Caption = #1057#1095#1105#1090#1095#1080#1082#1080
        ImageIndex = 66
        Style = tbsCheck
        OnClick = tbuCountersClick
      end
      object ToolButton2: TToolButton
        Left = 413
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbuClose: TToolButton
        Left = 421
        Top = 0
        Action = acClose
      end
      object ToolButton9: TToolButton
        Left = 478
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 3
        Style = tbsSeparator
      end
    end
  end
  object grAutonum: TcxGrid
    Left = 0
    Top = 42
    Width = 630
    Height = 308
    Align = alClient
    TabOrder = 1
    object grAutonumDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = grAutonumDBTableView1FocusedRecordChanged
      DataController.DataSource = dsTDOCS_AUTONUM
      DataController.KeyFieldNames = 'FK_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1050#1086#1083'-'#1074#1086' '#1089#1090#1088#1086#1082': 0'
          Kind = skCount
        end
        item
          Kind = skCount
          Column = grAutonum_fp_vidmove
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GridLineColor = clBlack
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.ContentEven = dmMain.cxStyleGridEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridOddRow
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      object grAutonum_fk_id: TcxGridDBColumn
        Caption = 'id'
        DataBinding.FieldName = 'fk_id'
        Visible = False
        Options.Editing = False
        Width = 49
      end
      object grAutonum_fd_start: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
        DataBinding.FieldName = 'FD_START'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.DateButtons = [btnToday]
        Properties.SaveTime = False
        Properties.ShowTime = False
        Width = 71
      end
      object grAutonum_fp_vid: TcxGridDBColumn
        Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'fp_vid'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            Width = 100
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsFP_VID
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 89
      end
      object grAutonum_fp_vidmove: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        DataBinding.FieldName = 'fp_vidmove'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            Width = 250
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsDocsList
        Properties.OnChange = grAutonum_fp_vidmovePropertiesChange
        Width = 106
      end
      object grAutonum_fk_mogroup_id: TcxGridDBColumn
        Caption = #1043#1088#1091#1087#1087#1072' '#1052#1054
        DataBinding.FieldName = 'fk_mogroup_id'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ClearKey = 46
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.KeyFieldNames = 'groupid'
        Properties.ListColumns = <
          item
            Width = 350
            FieldName = 'fc_name'
          end>
        Properties.ListOptions.AnsiSort = True
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsMO_GROUP
        Width = 99
      end
      object grAutonum_fn_type_autonum: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1072#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1080
        DataBinding.FieldName = 'fn_type_autonum'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            Width = 250
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsType_Autonum
        Properties.OnChange = grAutonum_fn_type_autonumPropertiesChange
        Width = 115
      end
      object grAutonum_fk_tdocs_autonum_counter_id: TcxGridDBColumn
        Caption = #1057#1095#1105#1090#1095#1080#1082
        DataBinding.FieldName = 'FK_TDOCS_AUTONUM_COUNTER_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ClearKey = 46
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            Width = 150
            FieldName = 'FC_COUNTER'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsTDOCS_AUTONUM_COUNTER1
        Width = 86
      end
      object grAutonum_fl_enabled: TcxGridDBColumn
        Caption = #1042#1082#1083'.'
        DataBinding.FieldName = 'fl_enabled'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Width = 50
      end
    end
    object grAutonumLevel1: TcxGridLevel
      GridView = grAutonumDBTableView1
    end
  end
  object grbCounters: TcxGroupBox
    Left = 0
    Top = 358
    Align = alBottom
    Caption = ' '#1057#1095#1105#1090#1095#1080#1082#1080' '
    TabOrder = 2
    Visible = False
    Height = 134
    Width = 630
    object grCounters: TcxGrid
      Left = 2
      Top = 18
      Width = 626
      Height = 114
      Align = alClient
      TabOrder = 0
      object grCountersDBTableView1: TcxGridDBTableView
        PopupMenu = pmCounters
        NavigatorButtons.ConfirmDelete = False
        OnCustomDrawCell = grCountersDBTableView1CustomDrawCell
        OnFocusedRecordChanged = grAutonumDBTableView1FocusedRecordChanged
        DataController.DataSource = dsTDOCS_AUTONUM_COUNTER2
        DataController.KeyFieldNames = 'FK_ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = #1050#1086#1083'-'#1074#1086' '#1089#1090#1088#1086#1082': 0'
            Kind = skCount
          end
          item
            Kind = skCount
            Column = grCounters_fk_id
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.OnDataChanged = grCountersDBTableView1DataControllerDataChanged
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GridLineColor = clBlack
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        Styles.ContentEven = dmMain.cxStyleGridEvenRow
        Styles.ContentOdd = dmMain.cxStyleGridOddRow
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        object grCounters_fk_id: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'fk_id'
          Options.Editing = False
          Width = 420
        end
        object grCounters_FN_STARTNUM: TcxGridDBColumn
          Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
          DataBinding.FieldName = 'FN_STARTNUM'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.ValueType = vtInt
          Width = 101
        end
        object grCounters_fn_curnum: TcxGridDBColumn
          Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088
          DataBinding.FieldName = 'fn_curnum'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.ImmediatePost = True
          Properties.ValueType = vtInt
          Width = 91
        end
      end
      object grCountersLevel1: TcxGridLevel
        GridView = grCountersDBTableView1
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 350
    Width = 630
    Height = 8
    AlignSplitter = salBottom
    Control = grbCounters
    Visible = False
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
    object acAdd: TAction
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
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'fmDOC_AUTONUM\'
    StoredValues = <>
    Left = 328
    Top = 216
  end
  object odsTDOCS_AUTONUM: TOracleDataSet
    SQL.Strings = (
      'select an.ROWID, an.*'
      'from med.TDOCS_AUTONUM an'
      'where '
      
        '  (an.FD_START >= TRUNC(:DATE1) or :FILTERED_BY_DATE1 = 0) and (' +
        'an.FD_START < TRUNC(:DATE2+1) or :FILTERED_BY_DATE2 = 0)'
      '')
    Optimize = False
    Variables.Data = {
      0300000004000000060000003A44415445310C00000000000000000000001200
      00003A46494C54455245445F42595F4441544531030000000000000000000000
      060000003A44415445320C0000000000000000000000120000003A46494C5445
      5245445F42595F4441544532030000000000000000000000}
    SequenceField.Field = 'FK_ID'
    SequenceField.Sequence = 'MED.SEQ_TDOCS_AUTONUM'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000800000005000000464B5F49440100000000001B000000464B5F5444
      4F43535F4155544F4E554D5F434F554E5445525F494401000000000008000000
      46445F53544152540100000000000600000046505F5649440100000000000A00
      000046505F5649444D4F56450100000000000D000000464B5F4D4F47524F5550
      5F49440100000000000A000000464C5F454E41424C45440100000000000F0000
      00464E5F545950455F4155544F4E554D010000000000}
    Cursor = crSQLWait
    UniqueFields = 'FK_ID'
    RefreshOptions = [roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'med.TDOCS_AUTONUM'
    Session = dmMain.os
    Left = 69
    Top = 88
  end
  object dsTDOCS_AUTONUM: TDataSource
    DataSet = odsTDOCS_AUTONUM
    Left = 69
    Top = 136
  end
  object odsDocsList: TOracleDataSet
    SQL.Strings = (
      
        'select 1 as FK_ID, 1 as FP_VID, 0 as FN_DEF_AUTONUM, med.get_dec' +
        'odedocvidmove(1) as FC_NAME from DUAL'
      'UNION ALL'
      
        'select 2 as FK_ID, 2 as FP_VID, 0 as FN_DEF_AUTONUM, med.get_dec' +
        'odedocvidmove(2) as FC_NAME from DUAL'
      'UNION ALL'
      
        'select 3 as FK_ID, 2 as FP_VID, 1 as FN_DEF_AUTONUM, med.get_dec' +
        'odedocvidmove(3) as FC_NAME from DUAL'
      'UNION ALL'
      
        'select 4 as FK_ID, 2 as FP_VID, 1 as FN_DEF_AUTONUM, med.get_dec' +
        'odedocvidmove(4) as FC_NAME from DUAL'
      'UNION ALL'
      
        'select 5 as FK_ID, 2 as FP_VID, 1 as FN_DEF_AUTONUM, med.get_dec' +
        'odedocvidmove(5) as FC_NAME from DUAL'
      'UNION ALL'
      
        'select 6 as FK_ID, 2 as FP_VID, 1 as FN_DEF_AUTONUM, med.get_dec' +
        'odedocvidmove(6) as FC_NAME from DUAL'
      'UNION ALL'
      
        'select 7 as FK_ID, 3 as FP_VID, 1 as FN_DEF_AUTONUM, med.get_dec' +
        'odedocvidmove(7) as FC_NAME from DUAL'
      'UNION ALL'
      
        'select 8 as FK_ID, 3 as FP_VID, 1 as FN_DEF_AUTONUM, med.get_dec' +
        'odedocvidmove(8) as FC_NAME from DUAL'
      'UNION ALL'
      
        'select 9 as FK_ID, 1 as FP_VID, 1 as FN_DEF_AUTONUM, med.get_dec' +
        'odedocvidmove(9) as FC_NAME from DUAL'
      'UNION ALL'
      
        'select 10 as FK_ID, 1 as FP_VID, 1 as FN_DEF_AUTONUM, med.get_de' +
        'codedocvidmove(10) as FC_NAME from DUAL'
      'UNION ALL'
      
        'select 11 as FK_ID, 3 as FP_VID, 1 as FN_DEF_AUTONUM, med.get_de' +
        'codedocvidmove(11) as FC_NAME from DUAL'
      'UNION ALL'
      
        'select 12 as FK_ID, 3 as FP_VID, 1 as FN_DEF_AUTONUM, med.get_de' +
        'codedocvidmove(12) as FC_NAME from DUAL'
      'UNION ALL'
      
        'select 13 as FK_ID, 3 as FP_VID, 1 as FN_DEF_AUTONUM, med.get_de' +
        'codedocvidmove(13) as FC_NAME from DUAL'
      'UNION ALL'
      
        'select 14 as FK_ID, 3 as FP_VID, 1 as FN_DEF_AUTONUM, med.get_de' +
        'codedocvidmove(14) as FC_NAME from DUAL')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000600000046505F5649
      440100000000000700000046435F4E414D45010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 232
    Top = 88
  end
  object dsDocsList: TDataSource
    DataSet = odsDocsList
    Left = 232
    Top = 136
  end
  object odsMO_GROUP: TOracleDataSet
    SQL.Strings = (
      
        'select mg.groupid, mg.fc_group||'#39' ('#39'||(TO_CHAR(mg.groupid))||'#39')'#39 +
        ' as fc_name'
      'from med.tmo_group mg'
      'where mg.fl_del=0')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000047524F555049440100000000000700000046435F
      4E414D45010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 312
    Top = 88
  end
  object dsMO_GROUP: TDataSource
    DataSet = odsMO_GROUP
    Left = 312
    Top = 136
  end
  object odsType_Autonum: TOracleDataSet
    SQL.Strings = (
      
        'select 0 as FK_ID, med.get_docs_autonum_type_text(0) as FC_NAME ' +
        'from DUAL'
      'UNION ALL'
      
        'select 1 as FK_ID, med.get_docs_autonum_type_text(1) as FC_NAME ' +
        'from DUAL'
      'UNION ALL'
      
        'select 2 as FK_ID, med.get_docs_autonum_type_text(2) as FC_NAME ' +
        'from DUAL'
      'UNION ALL'
      
        'select 3 as FK_ID, med.get_docs_autonum_type_text(3) as FC_NAME ' +
        'from DUAL')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 406
    Top = 88
  end
  object dsType_Autonum: TDataSource
    DataSet = odsType_Autonum
    Left = 406
    Top = 136
  end
  object odsFP_VID: TOracleDataSet
    SQL.Strings = (
      'select 1 as FK_ID, '#39#1055#1088#1080#1093#1086#1076#39' as FC_NAME from DUAL'
      'UNION ALL'
      'select 2 as FK_ID, '#39#1044#1074#1080#1078#1077#1085#1080#1077#39' as FC_NAME from DUAL'
      'UNION ALL'
      'select 3 as FK_ID, '#39#1056#1072#1089#1093#1086#1076#39' as FC_NAME from DUAL')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 161
    Top = 88
  end
  object dsFP_VID: TDataSource
    DataSet = odsFP_VID
    Left = 161
    Top = 136
  end
  object odsTDOCS_AUTONUM_COUNTER1: TOracleDataSet
    SQL.Strings = (
      'select anc.ROWID, anc.*,'
      
        '       TO_CHAR(anc.FK_ID)||'#39': '#8470#39'||TO_CHAR(anc.fn_startnum)||'#39' - ' +
        #39'||TO_CHAR(anc.fn_curnum) as FC_COUNTER'
      'from med.TDOCS_AUTONUM_COUNTER anc')
    Optimize = False
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000B000000464E5F5354
      4152544E554D01000000000009000000464E5F4355524E554D0100000000000A
      00000046435F434F554E544552010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 73
    Top = 192
  end
  object dsTDOCS_AUTONUM_COUNTER1: TDataSource
    DataSet = odsTDOCS_AUTONUM_COUNTER1
    Left = 73
    Top = 240
  end
  object pmFilterPeriod: TPopupMenu
    Left = 238
    Top = 216
    object N19: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = N19Click
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N20: TMenuItem
      Tag = 5
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1076#1077#1085#1100
      OnClick = N19Click
    end
    object N18: TMenuItem
      Tag = 4
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
      OnClick = N19Click
    end
    object N16: TMenuItem
      Tag = 2
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1075#1086#1076
      OnClick = N19Click
    end
    object N21: TMenuItem
      Caption = '-'
    end
    object N17: TMenuItem
      Tag = 3
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1084#1077#1089#1103#1094
      OnClick = N19Click
    end
    object N15: TMenuItem
      Tag = 1
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1075#1086#1076
      OnClick = N19Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Tag = 6
      Caption = #1057#1083#1077#1076#1091#1097#1080#1081' '#1075#1086#1076
      OnClick = N19Click
    end
  end
  object dsTDOCS_AUTONUM_COUNTER2: TDataSource
    DataSet = odsTDOCS_AUTONUM_COUNTER2
    Left = 196
    Top = 424
  end
  object odsTDOCS_AUTONUM_COUNTER2: TOracleDataSet
    SQL.Strings = (
      'select anc.ROWID, anc.*'
      'from med.TDOCS_AUTONUM_COUNTER anc')
    Optimize = False
    SequenceField.Field = 'FK_ID'
    SequenceField.Sequence = 'MED.SEQ_TDOCS_AUTONUM_COUNTER'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000B000000464E5F5354
      4152544E554D01000000000009000000464E5F4355524E554D0100000000000A
      00000046435F434F554E544552010000000000}
    Cursor = crSQLWait
    UniqueFields = 'FK_ID'
    RefreshOptions = [roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'MED.TDOCS_AUTONUM_COUNTER'
    Session = dmMain.os
    Left = 196
    Top = 376
  end
  object pmCounters: TPopupMenu
    Left = 320
    Top = 408
    object miChangeCounter: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1095#1105#1090#1095#1080#1082
      OnClick = miChangeCounterClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object miDelCounter: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1095#1105#1090#1095#1080#1082
      OnClick = miDelCounterClick
    end
  end
end
