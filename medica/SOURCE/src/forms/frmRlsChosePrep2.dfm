inherited frameRlsChosePrep2: TframeRlsChosePrep2
  Width = 820
  Height = 478
  ExplicitWidth = 820
  ExplicitHeight = 478
  object Splitter1: TSplitter
    Left = 0
    Top = 277
    Width = 820
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 820
    Height = 277
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 820
      Height = 66
      Align = alTop
      TabOrder = 0
      DesignSize = (
        820
        66)
      object edFilter: TEdit
        Left = 8
        Top = 39
        Width = 804
        Height = 21
        Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' (Enter)'
        Anchors = [akLeft, akTop, akRight]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object rgFilter: TRadioGroup
        Left = 8
        Top = 2
        Width = 804
        Height = 32
        Anchors = [akLeft, akTop, akRight]
        Caption = #1060#1080#1083#1100#1090#1088':'
        Columns = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #1058#1086#1088#1075#1086#1074#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' (F5)'
          #1051#1072#1090#1080#1085#1089#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' (F6)'
          #1050#1086#1076' EAN (F7)')
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 66
      Width = 820
      Height = 211
      Align = alClient
      TabOrder = 1
      object cxGridRlsPreps: TcxGrid
        Left = 1
        Top = 1
        Width = 818
        Height = 209
        Align = alClient
        TabOrder = 0
        object cxGridRlsPrepsDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsRlsPreps
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.RowSeparatorColor = clBtnShadow
          Styles.ContentEven = dmMain.cxStyleGridEvenRow
          Styles.ContentOdd = dmMain.cxStyleGridOddRow
          Styles.Selection = dmMain.cxStyleGridSelectedRow
          object cxGridRlsPrepsDBTableView1Column1: TcxGridDBColumn
            Caption = #1058#1086#1088#1075#1086#1074#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_TRADENAME'
            Options.Editing = False
            Options.Grouping = False
            Width = 238
          end
          object cxGridRlsPrepsDBTableView1Column2: TcxGridDBColumn
            Caption = #1051#1072#1090#1080#1085#1089#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_LATINNAME'
            Options.Editing = False
            Options.Grouping = False
            Width = 237
          end
          object cxGridRlsPrepsDBTableView1Column3: TcxGridDBColumn
            Caption = #1052#1077#1078#1076#1091#1085#1072#1088#1086#1076#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_INT_NAME'
            Options.Editing = False
            Options.Grouping = False
            Width = 341
          end
        end
        object cxGridRlsPrepsLevel1: TcxGridLevel
          GridView = cxGridRlsPrepsDBTableView1
        end
      end
    end
  end
  object cxGridPrepSelect: TcxGrid
    Left = 0
    Top = 280
    Width = 820
    Height = 198
    Align = alClient
    TabOrder = 1
    object cxGridPrepSelectDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPrepSelect
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = dmMain.cxStyleGridDetailEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridDetailOddRow
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      object cxGridPrepSelectDBTableView1Column1: TcxGridDBColumn
        Caption = 'FK_ID'
        Visible = False
      end
      object cxGridPrepSelectDBTableView1Column2: TcxGridDBColumn
        Caption = #1050#1086#1076' EAN'
        DataBinding.FieldName = 'FC_EANCODE'
        Options.Editing = False
        Options.Grouping = False
        Width = 179
      end
      object cxGridPrepSelectDBTableView1Column3: TcxGridDBColumn
        Caption = #1055#1088#1077#1087#1072#1088#1072#1090
        DataBinding.FieldName = 'FC_PREP'
        Options.Editing = False
        Options.Grouping = False
        Width = 639
      end
    end
    object cxGridPrepSelectLevel1: TcxGridLevel
      GridView = cxGridPrepSelectDBTableView1
    end
  end
  object dsRlsPreps: TDataSource
    DataSet = odsRlsPreps
    Left = 96
    Top = 176
  end
  object odsPrepSelect: TOracleDataSet
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000A00000005000000464B5F49440100000000000A00000046435F4541
      4E434F44450100000000000C00000046435F54524144454E414D450100000000
      000C00000046435F4C4154494E4E414D450100000000000700000046435F5052
      45500100000000000600000044464D41535301000000000009000000464B5F44
      464D4153530100000000000C0000004452554753494E505041434B0100000000
      000B000000464B5F4D415353554E4954010000000000080000004641524D4752
      4944010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    FilterOptions = [foCaseInsensitive]
    Left = 26
    Top = 380
  end
  object dsPrepSelect: TDataSource
    DataSet = odsPrepSelect
    Left = 100
    Top = 416
  end
  object odsRlsPreps: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '      VPREPRLS.FK_ID,       '
      '      VPREPRLS.TRADENAME AS FC_TRADENAME,'
      '       VPREPRLS.LATINNAME AS FC_LATINNAME,'
      '       RLS.Get_ActmattersList(VPREPRLS.FK_ID) as FC_PREP'
      ''
      
        '  FROM RLS.VPREPRLS, RLS.VNOMENRLS, RLS.TPREP_PHARMAGROUP, MED.T' +
        'FARMGR '
      ' WHERE VPREPRLS.FK_ID = VNOMENRLS.FK_PREP '
      '   AND VPREPRLS.FK_ID = RLS.TPREP_PHARMAGROUP.FK_PREP'
      
        '   AND MED.TFARMGR.FK_FRMGR_RLS(+) = RLS.TPREP_PHARMAGROUP.FK_PH' +
        'ARMGROUP'
      '    '
      '   AND 1 = 0')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000A00000005000000464B5F49440100000000000A00000046435F4541
      4E434F44450100000000000C00000046435F54524144454E414D450100000000
      000C00000046435F4C4154494E4E414D450100000000000700000046435F5052
      45500100000000000600000044464D41535301000000000009000000464B5F44
      464D4153530100000000000C0000004452554753494E505041434B0100000000
      000B000000464B5F4D415353554E4954010000000000080000004641524D4752
      4944010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    FilterOptions = [foCaseInsensitive]
    BeforeOpen = odsRlsPrepsBeforeOpen
    AfterOpen = odsRlsPrepsAfterOpen
    AfterScroll = odsRlsPrepsAfterScroll
    Left = 28
    Top = 176
  end
end
