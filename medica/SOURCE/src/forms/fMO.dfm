object frmMO: TfrmMO
  Left = 322
  Top = 226
  HelpContext = 4
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'  '#1084#1072#1090#1077#1088#1080#1072#1083#1100#1085#1086' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1093
  ClientHeight = 486
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'StMedsestra.chm'
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 727
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 723
      end>
    Images = dmMain.ilMain
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 714
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
      object ToolButton2: TToolButton
        Left = 57
        Top = 0
        Action = acEdit
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
  object paMo: TPanel
    Left = 0
    Top = 40
    Width = 727
    Height = 446
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object tlMO: TcxDBTreeList
      Left = 0
      Top = 0
      Width = 727
      Height = 446
      Align = alClient
      Bands = <
        item
          Caption.AlignHorz = taCenter
        end>
      BufferedPaint = True
      DataController.DataSource = dsMO
      DataController.ParentField = 'fk_parent'
      DataController.KeyField = 'MOID'
      DragMode = dmAutomatic
      LookAndFeel.Kind = lfUltraFlat
      OptionsBehavior.CellHints = True
      OptionsBehavior.GoToNextCellOnTab = True
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.AutoDragCopy = True
      OptionsBehavior.DragCollapse = False
      OptionsBehavior.ExpandOnIncSearch = True
      OptionsBehavior.ShowHourGlass = False
      OptionsBehavior.IncSearch = True
      OptionsCustomizing.BandCustomizing = False
      OptionsCustomizing.BandVertSizing = False
      OptionsCustomizing.ColumnVertSizing = False
      OptionsData.Editing = False
      OptionsSelection.HideFocusRect = False
      OptionsSelection.HideSelection = True
      OptionsSelection.InvertSelect = False
      OptionsView.CellEndEllipsis = True
      OptionsView.CellTextMaxLineCount = -1
      OptionsView.ShowEditButtons = ecsbFocused
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      ParentColor = False
      PopupMenu = pm
      Preview.AutoHeight = False
      Preview.MaxLineCount = 2
      RootValue = -1
      TabOrder = 0
      OnCustomDrawCell = tlMOCustomDrawCell
      OnDblClick = acEditExecute
      OnDragOver = cxDBTreeList1DragOver
      OnMoveTo = cxDBTreeList1MoveTo
      object tlMO_FC_NAME: TcxDBTreeListColumn
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Caption.Text = #1052#1072#1090#1077#1088#1080#1072#1083#1100#1085#1086' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081
        DataBinding.FieldName = 'FC_NAME'
        Width = 174
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soAscending
        SummaryFooter.Format = #1050#1086#1083'-'#1074#1086': ### ###'
        SummaryFooter.Kind = skCount
        SummaryFooter.FieldName = 'FC_NAME'
      end
      object tlMO_FC_OTDEL: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Caption.Text = #1054#1090#1076#1077#1083#1077#1085#1080#1077
        DataBinding.FieldName = 'FC_OTDEL'
        Width = 107
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlMO_TYPELST: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Visible = False
        Caption.Text = #1058#1080#1087' '#1091#1095'. '#1075#1088#1091#1087#1087#1099
        DataBinding.FieldName = 'TYPELST'
        Options.Hidden = True
        Position.ColIndex = 8
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlMO_FC_CRM: TcxDBTreeListColumn
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Caption.Text = #1052#1077#1076#1080#1082'. '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
        DataBinding.FieldName = 'FC_CRM'
        Width = 82
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlMO_fk_parent: TcxDBTreeListColumn
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Visible = False
        Caption.Text = #1050#1086#1076' '#1088#1086#1076#1080#1090#1077#1083#1103' '#1052#1054
        DataBinding.FieldName = 'fk_parent'
        Position.ColIndex = 9
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlMO_FC_TREB: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Caption.Text = #1054#1073#1088#1072#1073#1086#1090#1082#1072' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1081
        DataBinding.FieldName = 'FC_TREB'
        Width = 83
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlMO_FC_CUR_GROUP_NAME: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Caption.Text = #1058#1077#1082'. '#1075#1088#1091#1087#1087#1072
        DataBinding.FieldName = 'FC_CUR_GROUP_NAME'
        Width = 83
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlMO_MOID: TcxDBTreeListColumn
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Caption.Text = #1050#1086#1076' '#1052#1054
        DataBinding.FieldName = 'MOID'
        Width = 83
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlMO_FK_SOTRID: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Visible = False
        Caption.Text = #1050#1086#1076' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
        DataBinding.FieldName = 'FK_SOTRID'
        Position.ColIndex = 6
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlMO_FC_SKLAD_NAME: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Caption.Text = #1057#1082#1083#1072#1076
        DataBinding.FieldName = 'FC_SKLAD_NAME'
        Width = 82
        Position.ColIndex = 7
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
  end
  object al: TActionList
    Left = 584
    Top = 88
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
      OnExecute = acShowColumnEditorExecute
    end
  end
  object FormStorage: TJvFormStorage
    AppStoragePath = 'frmMO\'
    StoredValues = <>
    Left = 584
    Top = 248
  end
  object odsMO: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '    M.ROWID,'
      '    M.MOID, '
      '    M.FC_NAME, '
      '    M.FL_CRM,'
      '    DECODE(M.FL_CRM,1,'#39#1044#1040#39',0,'#39#1053#1045#1058#39') AS FC_CRM,'
      '    MED.GET_MO_UCHGRTYPE_LST(M.MOID) AS TYPELST, '
      '    M.FK_PARENT,'
      ' '#9'M.FK_SOTRID,'
      '    S.FK_OTDID,'
      '    O.FC_NAME AS FC_OTDEL,'
      #9'   FL_TREB,'
      '   '#9'DECODE(FL_TREB,0,'#39#1053#1045#1058#39',1,'#39#1044#1040#39') AS FC_TREB,'
      '--    NVL(COUNT_DOC.COUNT_OF_DOCS ,-1) AS COUNT_OF_DOCS,'
      '    mg.fc_group as FC_CUR_GROUP_NAME,'
      '    M.FK_SKLAD_ID,'
      '    sk.fc_name as FC_SKLAD_NAME,'
      '    M.FL_DEL'
      
        'FROM MED.TMO M, (select FC_NAME, FK_SOTRID as FK_ID, FK_OTDELID ' +
        'as FK_OTDID from med.vsotr_by_otdel where FN_LEVEl = 1) S, (sele' +
        'ct FC_NAME, FK_OTDELID as FK_ID from med.vsotr_by_otdel where FN' +
        '_LEVEl = 0) O, med.tmo_group mg/*,'
      '   (SELECT COUNT(1) as COUNT_OF_DOCS, MOID FROM'
      '     (SELECT MOFROMID AS MOID FROM MED.TDOCS'
      '      UNION ALL'
      '      SELECT MOTOID AS MOID FROM MED.TDOCS'
      '      UNION ALL'
      '      SELECT FK_MOTOID AS MOID FROM MED.TTREB'
      '      UNION ALL'
      '      SELECT FK_MOFROMID AS MOID FROM MED.TTREB'
      '     )  WHERE (MOID is not null)and(MOID > 0)'
      '     GROUP BY MOID'
      '   ) COUNT_DOC*/,'
      '   med.tsklad sk'
      ''
      'WHERE M.FK_SOTRID = S.FK_ID (+)'
      '  AND S.FK_OTDID = O.FK_ID (+)'
      '--  AND M.FC_NAME <> '#39#39
      '  AND M.MOID <> MED.PKGTMO.GET_PRODUCE_POSTAV_TMO'
      '--  AND M.MOID = COUNT_DOC.MOID (+)'
      '  and M.fk_curmogroupid = MG.GROUPID(+)'
      '  and M.FK_SKLAD_ID = sk.FK_ID(+)'
      '  and NVL(M.FL_DEL,0) = 0'
      '--ORDER By UPPER(M.FC_NAME)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000F0000000700000046435F4E414D45010000000000040000004D4F49
      4401000000000006000000464C5F43524D01000000000009000000464B5F5041
      52454E5401000000000007000000545950454C53540100000000000600000046
      435F43524D01000000000009000000464B5F534F545249440100000000000800
      000046435F4F5444454C01000000000008000000464B5F4F5444494401000000
      000007000000464C5F545245420100000000000700000046435F545245420100
      000000000D000000434F554E545F4F465F444F43530100000000001100000046
      435F4355525F47524F55505F4E414D450100000000000B000000464B5F534B4C
      41445F49440100000000000D00000046435F534B4C41445F4E414D4501000000
      0000}
    Cursor = crSQLWait
    UpdatingTable = 'MED.TMO'
    Session = dmMain.os
    DesignActivation = True
    AfterScroll = odsMOAfterScroll
    Left = 16
    Top = 72
  end
  object dsMO: TDataSource
    DataSet = odsMO
    Left = 16
    Top = 128
  end
  object pm: TPopupMenu
    Left = 64
    Top = 72
    object N1: TMenuItem
      Action = acShowColumnEditor
    end
  end
end
