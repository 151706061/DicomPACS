object frmMOinGroup: TfrmMOinGroup
  Left = 401
  Top = 353
  HelpContext = 44
  Caption = #1043#1088#1091#1087#1087#1099' '#1052#1054
  ClientHeight = 291
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 513
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 509
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 500
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 58
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object tbuSelect: TToolButton
        Left = 0
        Top = 0
        Action = acSelect
        Visible = False
      end
      object tbuAdd: TToolButton
        Left = 58
        Top = 0
        Action = acAdd
      end
      object tbuChange: TToolButton
        Left = 116
        Top = 0
        Action = acEdit
      end
      object tbuDel: TToolButton
        Left = 174
        Top = 0
        Action = acDel
      end
      object ToolButton7: TToolButton
        Left = 232
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 240
        Top = 0
        Action = acRefresh
      end
      object ToolButton6: TToolButton
        Left = 298
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 306
        Top = 0
        Action = acClose
      end
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 40
    Width = 513
    Height = 251
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsMO
      DataController.Filter.MaxValueListCount = 1000
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = cxGrid1DBTableView1FC_GROUP
        end>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnPopup.MaxDropDownItemCount = 12
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.Indicator = True
      Preview.AutoHeight = False
      Preview.MaxLineCount = 2
      Styles.ContentEven = dmMain.cxStyleGridEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridOddRow
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      Styles.Footer = dmMain.cxStyleFooter
      object cxGrid1DBTableView1FK_ID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_ID'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = False
        Visible = False
        Options.Filtering = False
        Width = 119
      end
      object cxGrid1DBTableView1FC_GROUP: TcxGridDBColumn
        Caption = #1043#1088#1091#1087#1087#1072
        DataBinding.FieldName = 'FC_GROUP'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = False
        Options.Editing = False
        Options.Filtering = False
        Width = 234
      end
      object cxGrid1DBTableView1FC_NAME: TcxGridDBColumn
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1100#1085#1086' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081
        DataBinding.FieldName = 'FC_NAME'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = False
        Options.Editing = False
        Options.Filtering = False
        Width = 388
      end
      object cxGrid1DBTableView1FL_CUR_MOGROUP: TcxGridDBColumn
        Caption = #1058#1077#1082'. '#1075#1088#1091#1087#1087#1072' '#1084#1072#1090'. '#1086#1090#1074'.'
        DataBinding.FieldName = 'FL_CUR_MOGROUP'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Options.Editing = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 32
    Top = 192
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
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 3
      ShortCut = 114
      OnExecute = acEditExecute
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
    object acShowColumnEditor: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1082#1086#1083#1086#1085#1086#1082
      ShortCut = 16453
    end
    object acSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      HelpContext = 41
      HelpType = htContext
      ImageIndex = 30
      ShortCut = 13
      OnExecute = acSelectExecute
    end
  end
  object dsMO: TDataSource
    DataSet = odsMO
    Left = 32
    Top = 144
  end
  object odsMO: TOracleDataSet
    SQL.Strings = (
      'SELECT MIG.FK_ID,'
      '       MIG.fk_group,'
      '       MIG.FK_MO,'
      '       MG.FC_GROUP,'
      '       M.FC_NAME,'
      
        '       DECODE(M.fk_curmogroupid, MIG.fk_group, 1, 0) as FL_CUR_M' +
        'OGROUP'
      '       '
      '       FROM MED.TMO_IN_GROUP MIG,'
      '            MED.TMO_GROUP MG,'
      '            MED.TMO M'
      '       WHERE MG.FL_DEL = 0'
      '       AND MIG.FL_DEL = 0'
      '       AND MG.GROUPID = MIG.FK_GROUP'
      '       AND M.MOID = MIG.FK_MO'
      '       AND M.FL_DEL = 0'
      '       AND M.MOID = NVL(:CurMOID, M.MOID)'
      'ORDER BY FC_NAME')
    Optimize = False
    Variables.Data = {
      0300000001000000080000003A4355524D4F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000800000046435F47524F555001000000000005000000464B
      5F49440100000000000700000046435F4E414D4501000000000008000000464B
      5F47524F555001000000000005000000464B5F4D4F0100000000000E00000046
      4C5F4355525F4D4F47524F5550010000000000}
    Session = dmMain.os
    Left = 32
    Top = 96
  end
  object oqDel: TOracleQuery
    SQL.Strings = (
      '-- '#1092#1080#1079#1080#1095#1077#1089#1082#1080' '#1091#1076#1072#1083#1103#1077#1084' - '#1080#1073#1086' '#1085#1077#1092#1080#1075
      'delete from MED.TMO_IN_GROUP WHERE FK_ID = :pfk_id'
      ''
      '/*UPDATE TMO_IN_GROUP'
      ' SET FL_DEL = 1'
      'WHERE FK_ID = :pfk_id'
      '*/')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {0300000001000000070000003A50464B5F4944030000000000000000000000}
    Left = 72
    Top = 96
  end
  object oqSetCurMOGroup: TOracleQuery
    SQL.Strings = (
      'DECLARE'
      '  nGroup_COUNT NUMBER;'
      '  MOID_ NUMBER;'
      '  GROUP_ID NUMBER;'
      '  CUR_GROUP_ID NUMBER;'
      ''
      'BEGIN'
      '  SELECT count(M.MOID) INTO MOID_'
      '  FROM MED.TMO M'
      '  WHERE M.MOID = :PFK_MO;'
      '  '
      
        '  IF NVL(MOID_,0) > 0 then -- '#1087#1088#1086#1074#1077#1088#1082#1072' '#1095#1090#1086' '#1084#1072#1090'. '#1086#1090#1074'. '#1074#1086#1086#1073#1097#1077' '#1089#1091#1097#1077 +
        #1089#1090#1074#1091#1077#1090
      
        '    SELECT M.fk_curmogroupid INTO CUR_GROUP_ID -- '#1073#1077#1088#1077#1084' '#1090#1077#1082#1091#1097#1091#1102' ' +
        #1075#1088#1091#1087#1087#1091
      '    FROM MED.TMO M'
      '    WHERE M.MOID = :PFK_MO;'
      ''
      
        '    SELECT COUNT(T.FK_ID), NVL(MIN(T.fk_group),-1) --'#1089#1095#1080#1090#1072#1077#1084' '#1082#1086#1083 +
        '-'#1074#1086' '#1085#1072#1079#1085#1072#1095#1077#1085#1085#1099#1093' '#1075#1088#1091#1087#1087
      '      INTO nGroup_COUNT, GROUP_ID'
      '      FROM MED.TMO_IN_GROUP T'
      '     WHERE T.FK_MO = :PFK_MO'
      '       AND T.fl_del = 0;'
      ''
      
        '    IF nGroup_COUNT in (0,1) THEN -- '#1086#1089#1090#1072#1083#1072#1089#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1086#1076#1085#1072' '#1075#1088#1091#1087#1087 +
        #1072' - '#1089#1090#1072#1074#1080#1084' '#1077#1077'      '
      
        '      UPDATE MED.TMO SET fk_curmogroupid = GROUP_ID WHERE moid =' +
        ' :PFK_MO;'
      '--      MED.PKG_MEDSES.set_curmo_group(GROUP_ID);'
      '      commit;'
      '    ELSE'
      '      IF (GROUP_ID <> CUR_GROUP_ID) THEN  -- '
      
        '        SELECT COUNT(T.FK_ID) -- '#1074#1072#1083#1080#1076#1085#1072' '#1083#1080' '#1090#1077#1082#1091#1097#1072#1103' '#1075#1088#1091#1087#1087#1072' '#1084#1072#1090'. ' +
        #1086#1090#1074'.?'
      '          INTO nGroup_COUNT'
      '          FROM MED.TMO_IN_GROUP T'
      '         WHERE T.FK_MO = :PFK_MO'
      '           AND T.FK_GROUP = CUR_GROUP_ID'
      '           AND T.fl_del = 0;      '
      
        '         IF nGroup_COUNT = 0 THEN -- '#1077#1089#1083#1080' '#1091' '#1084#1072#1090'. '#1086#1090#1074'. '#1084#1085#1086#1075#1086' '#1075#1088#1091#1087 +
        #1087' '#1080' '#1090#1077#1082#1091#1097#1072#1103' '#1085#1077' '#1091#1082#1072#1079#1099#1074#1072#1077#1090' '#1085#1080' '#1085#1072' '#1086#1076#1085#1091' '#1080#1079' '#1085#1080#1093
      
        '           UPDATE MED.TMO SET fk_curmogroupid = GROUP_ID WHERE m' +
        'oid = :PFK_MO;'
      '           MED.PKG_MEDSES.set_curmo_group(GROUP_ID);'
      '           commit;'
      '         END IF; -- IF nGroup_COUNT = 0 THEN'
      '      END IF; --  IF (GROUP_ID <> CUR_GROUP_ID) THEN '
      
        '    END IF; -- ELSE IF nGroup_COUNT in (0,1) THEN -- '#1086#1089#1090#1072#1083#1072#1089#1090#1100' '#1090 +
        #1086#1083#1100#1082#1086' '#1086#1076#1085#1072' '#1075#1088#1091#1087#1087#1072' - '#1089#1090#1072#1074#1080#1084' '#1077#1077' '
      
        '  END IF; -- IF NVL(MOID_,0) > 0 then -- '#1087#1088#1086#1074#1077#1088#1082#1072' '#1095#1090#1086' '#1084#1072#1090'. '#1086#1090#1074'. ' +
        #1074#1086#1086#1073#1097#1077' '#1089#1091#1097#1077#1089#1090#1074#1091#1077#1090
      'END;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {0300000001000000070000003A50464B5F4D4F030000000000000000000000}
    Left = 234
    Top = 72
  end
end
