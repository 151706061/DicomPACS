object frmMedicSel: TfrmMedicSel
  Left = 394
  Top = 299
  Width = 640
  Height = 480
  Caption = #1057#1087#1080#1089#1086#1082' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 632
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 628
      end>
    BorderWidth = 1
    EdgeBorders = [ebTop]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 615
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 56
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton8: TToolButton
        Left = 0
        Top = 0
        Action = acSelect
      end
      object ToolButton9: TToolButton
        Left = 56
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 64
        Top = 0
        Action = acRefresh
      end
      object ToolButton6: TToolButton
        Left = 120
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 128
        Top = 0
        Action = acClose
      end
    end
  end
  object gr: TdxDBTreeList
    Left = 0
    Top = 42
    Width = 632
    Height = 404
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderMinRowCount = 2
    HeaderPanelRowCount = 1
    KeyField = 'MEDICID'
    ParentField = 'FK_MEDIC_PARENT'
    Align = alClient
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnDblClick = dxDBTreeList1DblClick
    DataSource = dsMedicLst
    DblClkExpanding = False
    GridLineColor = clAppWorkSpace
    HideFocusRect = True
    LookAndFeel = lfFlat
    OptionsBehavior = [etoAutoDragDrop, etoAutoDragDropCopy, etoAutoSearch, etoAutoSort, etoCaseInsensitive, etoDblClick, etoDragExpand, etoDragScroll, etoEnterShowEditor, etoImmediateEditor, etoTabThrough]
    OptionsView = [etoAutoWidth, etoBandHeaderWidth, etoHideFocusRect, etoUseBitmap, etoUseImageIndexForSelected]
    ShowGrid = True
    ShowLines = False
    TreeLineColor = clGrayText
    object grFC_NAME: TdxDBTreeListMaskColumn
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      Sorted = csUp
      Width = 91
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FC_NAME'
    end
    object grFC_UEDIZM: TdxDBTreeListMaskColumn
      Caption = #1059#1087'. '#1077#1076'. '#1080#1079#1084'.'
      Width = 39
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FC_UEDIZM'
    end
    object grFN_FPACKINUPACK: TdxDBTreeListMaskColumn
      Caption = #1050#1086#1083'-'#1074#1086' '#1074' '#1091#1087#1072#1082#1086#1074#1082#1077
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FN_FPACKINUPACK'
    end
    object grFC_FEDIZM: TdxDBTreeListMaskColumn
      Caption = #1060#1072#1089'. '#1077#1076'. '#1080#1079#1084'.'
      Width = 42
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FC_FEDIZM'
    end
    object grFC_PREP: TdxDBTreeListMaskColumn
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1056#1051#1057
      Width = 66
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FC_PREP'
    end
    object grFC_EANCODE: TdxDBTreeListMaskColumn
      Caption = #1050#1086#1076' EAN'
      Width = 41
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FC_EANCODE'
    end
    object grFC_UCHNAME: TdxDBTreeListMaskColumn
      Caption = #1059#1095#1105#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
      Width = 42
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FC_UCHNAME'
    end
    object grFC_FARMNAME: TdxDBTreeListMaskColumn
      Caption = #1060#1072#1088#1084#1072#1082'. '#1075#1088'.'
      Width = 39
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FC_FARMNAME'
    end
    object grFC_MEDICTYPE: TdxDBTreeListMaskColumn
      Caption = #1058#1080#1087
      Width = 34
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FC_MEDICTYPE'
    end
    object grFC_MEDPAYTYPE: TdxDBTreeListMaskColumn
      Caption = #1058#1080#1087' '#1086#1087#1083#1072#1090#1099
      Width = 32
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FC_MEDPAYTYPE'
    end
    object grFN_MASS: TdxDBTreeListMaskColumn
      Caption = #1052#1072#1089#1089#1072' '#1051#1060
      Width = 36
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FN_MASS'
    end
    object grFC_MASSUNITS: TdxDBTreeListMaskColumn
      Caption = #1045#1076'. '#1084#1072#1089#1089#1099' '#1051#1060
      Width = 37
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FC_MASSUNITS'
    end
    object grFC_SPECIALMEDIC: TdxDBTreeListMaskColumn
      Caption = #1053#1072#1088#1082#1086#1090#1080#1095#1077#1089#1082#1080#1077', '#1089#1080#1083#1100#1085#1086#1076#1077#1081#1089#1090#1074'. '#1080' '#1103#1076#1086#1074#1080#1090#1099#1077
      Width = 37
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FC_SPECIALMEDIC'
    end
    object grFC_LGOTA: TdxDBTreeListMaskColumn
      Caption = #1051#1100#1075#1086#1090#1085#1099#1081
      Width = 21
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FC_LGOTA'
    end
    object grMEDICID: TdxDBTreeListMaskColumn
      Caption = #1050#1086#1076
      Width = 20
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MEDICID'
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 128
    Top = 72
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      ImageIndex = 1
      ShortCut = 16499
      OnExecute = acCloseExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 15
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
    object acSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 30
      ShortCut = 13
      OnExecute = acSelectExecute
    end
    object acSecret: TAction
      Caption = 'acSecret'
      ShortCut = 49232
    end
  end
  object odsMedicLst: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      #9'   FC_NAME,'
      '    MEDICID,'
      '    FC_UCHNAME, '
      '    FC_FARMNAME,'
      '    FL_PKU,'
      '    FK_NOMEN_RLS,'
      '    FC_PREP,'
      '    FC_EANCODE,'
      '    FK_TYPE,'
      '    FC_MEDICTYPE,'
      '    FK_PAYTYPE,'
      '    FC_MEDPAYTYPE,'
      '    FC_UEDIZM,'
      '    FK_FPACKID,'
      '    FN_FPACKINUPACK,'
      '    FC_FEDIZM,'
      '    FN_MASS, '
      '    FK_MASSUNITS,'
      '    FC_MASSUNITS,'
      '    FK_SPECIALMEDIC,'
      '    FC_SPECIALMEDIC,'
      '    FC_LGOTA,'
      '    FK_MEDIC_PARENT'
      '  FROM    '
      '   (SELECT'
      #9'       TMEDIC.FC_NAME,'
      '       '#9'TMEDIC.MEDICID,'
      '       '#9'TUCHGR.FC_UCHGR AS FC_UCHNAME, '
      '       '#9'TFARMGR.FC_FARMGR AS FC_FARMNAME,'
      '       '#9'DECODE(FL_PKU, 0, '#39#1053#1045#1058#39', 1, '#39#1044#1040#39') AS FL_PKU,'
      '       '#9'TMEDIC.FK_NOMEN_RLS,'
      '       '#9'VPREPRLS.RESULT || VNOMENRLS.RESULT AS FC_PREP,'
      '       '#9'TMEDIC.FC_EANCODE,'
      '       '#9'TMEDIC.FK_TYPE,'
      '       '#9'TMEDICTYPE.FC_NAME AS FC_MEDICTYPE,'
      '       '#9'TMEDIC.FK_PAYTYPE,'
      '       '#9'TPAYTYPE.FC_NAME AS FC_MEDPAYTYPE,'
      '       '#9'TEI.FC_NAME AS FC_UEDIZM,'
      '       '#9'TMEDIC.FK_FPACKID,'
      '       '#9'TMEDIC.FN_FPACKINUPACK,'
      '       '#9'T2.FC_NAME AS FC_FEDIZM,'
      '       '#9'TMEDIC.FN_MASS AS FN_MASS, '
      '       '#9'TMASSUNITS.FK_ID AS FK_MASSUNITS,'
      '       '#9'TMASSUNITS.FC_SHORTNAME AS FC_MASSUNITS,'
      '       '#9'TMEDIC_TSPECIALMEDIC.FK_SPECIALMEDIC,'
      '       '#9'TSPECIALMEDIC.FC_NAME AS FC_SPECIALMEDIC,'
      
        '        DECODE(FL_LGOTA, 0, '#39#1053#1077#1090#39', 1, '#39#1044#1072#39', '#39#1053#1077' '#1080#1079#1074#1077#1089#1090#1085#1086#39') AS FC' +
        '_LGOTA,'
      '       '#9'to_number(null) AS FK_MEDIC_PARENT'
      '      FROM'
      '       '#9'MED.TMEDIC,'
      '      '#9' MED.TMEDICTYPE,'
      '     '#9' '#9'MED.TUCHGR,'
      '     '#9' '#9'MED.TFARMGR, '
      '     '#9' '#9'RLS.VPREPRLS,'
      '     '#9' '#9'RLS.VNOMENRLS,'
      '     '#9' '#9'MED.TPAYTYPE,'
      '     '#9' '#9'MED.TEI,'
      '     '#9' '#9'MED.TEI T2,'
      '     '#9' '#9'MED.TMASSUNITS,'
      '     '#9' '#9'MED.TMEDIC_TSPECIALMEDIC,'
      '     '#9' '#9'MED.TSPECIALMEDIC,'
      '     '#9' '#9'('
      '     '#9' '#9#9'SELECT DISTINCT TT.FK_TUCHGRTYPE'
      '     '#9' '#9#9'FROM ('
      '     '#9' '#9#9#9'SELECT MOID FROM MED.TMO'
      '     '#9' '#9#9#9'START WITH MOID = :MOID'
      '     '#9' '#9#9#9'CONNECT BY PRIOR MOID = FK_PARENT'
      '     '#9' '#9#9'     ) A,'
      '     '#9' '#9#9'MED.TMO_TUCHGRTYPE TT'
      '     '#9' '#9#9'WHERE A.MOID = TT.MOID'
      '     '#9' '#9') F'
      '     '#9' '#9'--MED.tmedicomplex mc'
      '     '#9'WHERE TMEDICTYPE.FK_ID = TMEDIC.FK_TYPE'
      '     '#9' '#9'AND TMEDIC.UCHGRID = TUCHGR.UCHGRID'
      '     '#9' '#9'AND TMEDIC.FARMGRID = TFARMGR.FARMGRID'
      '     '#9' '#9'AND TMEDIC.FK_NOMEN_RLS = VNOMENRLS.FK_ID'
      '     '#9' '#9'AND VNOMENRLS.FK_PREP = VPREPRLS.FK_ID'
      '     '#9' '#9'AND TUCHGR.FL_MAT(+) = f.FK_TUCHGRTYPE'
      '     '#9' '#9'AND TMEDIC.FK_PAYTYPE = TPAYTYPE.FK_ID (+)'
      '     '#9' '#9'AND TMEDIC.EIID = TEI.EIID (+)'
      '     '#9' '#9'AND TMEDIC.FK_FPACKID = T2.EIID (+)'
      '     '#9' '#9'AND TMEDIC.FK_MASSUNITS = TMASSUNITS.FK_ID (+)  '
      '     '#9' '#9'AND TMEDIC.MEDICID = TMEDIC_TSPECIALMEDIC.MEDICID (+)'
      
        '     '#9' '#9'AND TMEDIC_TSPECIALMEDIC.FK_SPECIALMEDIC = Tspecialmedic' +
        '.Fk_Id (+)'
      '     '#9' '#9'AND TMEDIC.FL_VISIBLE = 1'
      '   '
      '   UNION ALL'
      '   SELECT'
      #9'       TMEDIC.FC_NAME,'
      '       '#9'TMEDIC.MEDICID,'
      '       '#9'TUCHGR.FC_UCHGR AS FC_UCHNAME, '
      '       '#9'TFARMGR.FC_FARMGR AS FC_FARMNAME,'
      '       '#9'DECODE(FL_PKU, 0, '#39#1053#1045#1058#39', 1, '#39#1044#1040#39') AS FL_PKU,'
      '       '#9'TMEDIC.FK_NOMEN_RLS,'
      '       '#9'VPREPRLS.RESULT || VNOMENRLS.RESULT AS FC_PREP,'
      '       '#9'TMEDIC.FC_EANCODE,'
      '       '#9'TMEDIC.FK_TYPE,'
      '       '#9'TMEDICTYPE.FC_NAME AS FC_MEDICTYPE,'
      '       '#9'TMEDIC.FK_PAYTYPE,'
      '       '#9'TPAYTYPE.FC_NAME AS FC_MEDPAYTYPE,'
      '       '#9'TEI.FC_NAME AS FC_UEDIZM,'
      '       '#9'TMEDIC.FK_FPACKID,'
      '       '#9'TMEDIC.FN_FPACKINUPACK,'
      '       '#9'T2.FC_NAME AS FC_FEDIZM,'
      '       '#9'TMEDIC.FN_MASS AS FN_MASS, '
      '       '#9'TMASSUNITS.FK_ID AS FK_MASSUNITS,'
      '       '#9'TMASSUNITS.FC_SHORTNAME AS FC_MASSUNITS,'
      '       '#9'TMEDIC_TSPECIALMEDIC.FK_SPECIALMEDIC,'
      '       '#9'TSPECIALMEDIC.FC_NAME AS FC_SPECIALMEDIC,'
      
        '        DECODE(FL_LGOTA, 0, '#39#1053#1077#1090#39', 1, '#39#1044#1072#39', '#39#1053#1077' '#1080#1079#1074#1077#1089#1090#1085#1086#39') AS FC' +
        '_LGOTA,'
      '       '#9'MC.FK_MEDIC AS FK_MEDIC_PARENT'
      '      FROM'
      '       '#9'MED.TMEDIC,'
      '      '#9' MED.TMEDICTYPE,'
      '     '#9' '#9'MED.TUCHGR,'
      '     '#9' '#9'MED.TFARMGR, '
      '     '#9' '#9'RLS.VPREPRLS,'
      '     '#9' '#9'RLS.VNOMENRLS,'
      '     '#9' '#9'MED.TPAYTYPE,'
      '     '#9' '#9'MED.TEI,'
      '     '#9' '#9'MED.TEI T2,'
      '     '#9' '#9'MED.TMASSUNITS,'
      '     '#9' '#9'MED.TMEDIC_TSPECIALMEDIC,'
      '     '#9' '#9'MED.TSPECIALMEDIC,'
      '     '#9' '#9'('
      '     '#9' '#9#9'SELECT DISTINCT TT.FK_TUCHGRTYPE'
      '     '#9' '#9#9'FROM ('
      '     '#9' '#9#9#9'SELECT MOID FROM MED.TMO'
      '     '#9' '#9#9#9'START WITH MOID = :MOID'
      '     '#9' '#9#9#9'CONNECT BY PRIOR MOID = FK_PARENT'
      '     '#9' '#9#9'     ) A,'
      '     '#9' '#9#9'MED.TMO_TUCHGRTYPE TT'
      '     '#9' '#9#9'WHERE A.MOID = TT.MOID'
      '     '#9' '#9') F,'
      '     '#9' '#9'MED.tmedicomplex mc'
      '     '#9'WHERE TMEDICTYPE.FK_ID = TMEDIC.FK_TYPE'
      '     '#9' '#9'AND TMEDIC.UCHGRID = TUCHGR.UCHGRID'
      '     '#9' '#9'AND TMEDIC.FARMGRID = TFARMGR.FARMGRID'
      '     '#9' '#9'AND TMEDIC.FK_NOMEN_RLS = VNOMENRLS.FK_ID'
      '     '#9' '#9'AND VNOMENRLS.FK_PREP = VPREPRLS.FK_ID'
      '     '#9' '#9'AND TUCHGR.FL_MAT(+) = f.FK_TUCHGRTYPE'
      '     '#9' '#9'AND TMEDIC.FK_PAYTYPE = TPAYTYPE.FK_ID (+)'
      '     '#9' '#9'AND TMEDIC.EIID = TEI.EIID (+)'
      '     '#9' '#9'AND TMEDIC.FK_FPACKID = T2.EIID (+)'
      '     '#9' '#9'AND TMEDIC.FK_MASSUNITS = TMASSUNITS.FK_ID (+)  '
      '     '#9' '#9'AND TMEDIC.MEDICID = TMEDIC_TSPECIALMEDIC.MEDICID (+)'
      
        '     '#9' '#9'AND TMEDIC_TSPECIALMEDIC.FK_SPECIALMEDIC = Tspecialmedic' +
        '.Fk_Id (+)'
      '     '#9' '#9'AND TMEDIC.FL_VISIBLE = 1'
      '     '#9' '#9'AND mc.fk_medicitem = tmedic.medicid'
      ''
      '   )'
      'ORDER BY FC_NAME        '
      ''
      ''
      '/*'
      'SELECT'
      #9'TMEDIC.FC_NAME,'
      #9'TMEDIC.MEDICID,'
      #9'TUCHGR.FC_UCHGR AS FC_UCHNAME, '
      #9'TFARMGR.FC_FARMGR AS FC_FARMNAME,'
      #9'DECODE(FL_PKU, 0, '#39#1053#1045#1058#39', 1, '#39#1044#1040#39') AS FL_PKU,'
      #9'TMEDIC.FK_NOMEN_RLS,'
      #9'VPREPRLS.RESULT || VNOMENRLS.RESULT AS FC_PREP,'
      #9'TMEDIC.FC_EANCODE,'
      #9'TMEDIC.FK_TYPE,'
      #9'TMEDICTYPE.FC_NAME AS FC_MEDICTYPE,'
      #9'TMEDIC.FK_PAYTYPE,'
      #9'TPAYTYPE.FC_NAME AS FC_MEDPAYTYPE,'
      #9'TEI.FC_NAME AS FC_UEDIZM,'
      #9'TMEDIC.FK_FPACKID,'
      #9'TMEDIC.FN_FPACKINUPACK,'
      #9'T2.FC_NAME AS FC_FEDIZM,'
      #9'TMEDIC.FN_MASS AS FN_MASS, '
      #9'TMASSUNITS.FK_ID AS FK_MASSUNITS,'
      #9'TMASSUNITS.FC_SHORTNAME AS FC_MASSUNITS,'
      #9'TMEDIC_TSPECIALMEDIC.FK_SPECIALMEDIC,'
      #9'TSPECIALMEDIC.FC_NAME AS FC_SPECIALMEDIC,'
      #9'decode(fl_lgota, 0, '#39#1053#1077#1090#39', 1, '#39#1044#1072#39', '#39#1053#1077' '#1080#1079#1074#1077#1089#1090#1085#1086#39') as fc_lgota,'
      #9'mc.fk_medic as fk_medic_parent'
      'FROM'
      #9'TMEDIC,'
      #9'TMEDICTYPE,'
      #9'TUCHGR,'
      #9'TFARMGR, '
      #9'VPREPRLS,'
      #9'VNOMENRLS,'
      #9'TPAYTYPE,'
      #9'TEI,'
      #9'TEI T2,'
      #9'TMASSUNITS,'
      #9'TMEDIC_TSPECIALMEDIC,'
      #9'TSPECIALMEDIC,'
      #9'('
      #9#9'SELECT DISTINCT TT.FK_TUCHGRTYPE'
      #9#9'FROM ('
      #9#9#9'SELECT MOID FROM TMO'
      #9#9#9'START WITH MOID = :MOID'
      #9#9#9'CONNECT BY PRIOR MOID = FK_PARENT'
      #9#9') A,'
      #9#9'TMO_TUCHGRTYPE TT'
      #9#9'WHERE A.MOID = TT.MOID'
      #9') F,'
      #9'tmedicomplex mc'
      'WHERE TMEDICTYPE.FK_ID = TMEDIC.FK_TYPE'
      #9'AND TMEDIC.UCHGRID = TUCHGR.UCHGRID'
      #9'AND TMEDIC.FARMGRID = TFARMGR.FARMGRID'
      #9'AND TMEDIC.FK_NOMEN_RLS = VNOMENRLS.FK_ID'
      #9'AND VNOMENRLS.FK_PREP = VPREPRLS.FK_ID'
      #9'AND TUCHGR.FL_MAT(+) = f.FK_TUCHGRTYPE'
      #9'AND TMEDIC.FK_PAYTYPE = TPAYTYPE.FK_ID (+)'
      #9'AND TMEDIC.EIID = TEI.EIID (+)'
      #9'AND TMEDIC.FK_FPACKID = T2.EIID (+)'
      #9'AND TMEDIC.FK_MASSUNITS = TMASSUNITS.FK_ID (+)  '
      #9'AND TMEDIC.MEDICID = TMEDIC_TSPECIALMEDIC.MEDICID (+)'
      
        #9'AND TMEDIC_TSPECIALMEDIC.FK_SPECIALMEDIC = Tspecialmedic.Fk_Id ' +
        '(+)'
      #9'and tmedic.fl_del = 0'
      #9'and mc.fk_medicitem(+) = tmedic.medicid'
      '  '
      'ORDER BY TMEDIC.FC_NAME'
      '*/')
    Variables.Data = {0300000001000000050000003A4D4F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000170000000700000046435F4E414D450100000000000A00000046435F
      5543484E414D450100000000000B00000046435F4641524D4E414D4501000000
      0000070000004D45444943494401000000000006000000464C5F504B55010000
      0000000C000000464B5F4E4F4D454E5F524C530100000000000700000046435F
      505245500100000000000A00000046435F45414E434F44450100000000000700
      0000464B5F545950450100000000000C00000046435F4D454449435459504501
      00000000000D00000046435F4D4544504159545950450100000000000A000000
      464B5F504159545950450100000000000900000046435F554544495A4D010000
      0000000A000000464B5F465041434B49440100000000000F000000464E5F4650
      41434B494E555041434B0100000000000900000046435F464544495A4D010000
      0000000F000000464B5F5350454349414C4D454449430100000000000F000000
      46435F5350454349414C4D4544494301000000000007000000464E5F4D415353
      0100000000000C000000464B5F4D415353554E4954530100000000000C000000
      46435F4D415353554E4954530100000000000800000046435F4C474F54410100
      000000000F000000464B5F4D454449435F504152454E54010000000000}
    Cursor = crSQLWait
    ReadOnly = True
    Session = dmMain.os
    FilterOptions = [foNoPartialCompare]
    Left = 24
    Top = 72
  end
  object dsMedicLst: TDataSource
    DataSet = odsMedicLst
    Left = 88
    Top = 72
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppRegistryStorage
    AppStoragePath = 'frmMedicSel\'
    StoredValues = <>
    Left = 184
    Top = 72
  end
end
