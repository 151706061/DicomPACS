object fmSetPacSpis_HiTech: TfmSetPacSpis_HiTech
  Left = 0
  Top = 0
  Caption = #1042#1080#1076#1099' '#1087#1086#1084#1086#1097#1080' '#1087#1086' '#1087#1072#1094#1080#1077#1085#1090#1072#1084
  ClientHeight = 472
  ClientWidth = 712
  Color = clBtnFace
  Constraints.MinHeight = 499
  Constraints.MinWidth = 560
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
  object grbPac: TcxGroupBox
    Left = 0
    Top = 36
    Align = alTop
    Caption = ' '#1055#1072#1094#1080#1077#1085#1090#1099' '
    TabOrder = 0
    Height = 244
    Width = 712
    object grPac: TcxGrid
      Left = 2
      Top = 18
      Width = 708
      Height = 224
      Align = alClient
      TabOrder = 0
      object grPacDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsPacList
        DataController.KeyFieldNames = 'FK_ID'
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = #1050#1086#1083'-'#1074#1086': 0'
            Kind = skCount
            Column = grPac_FC_FIO
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object grPac_FC_IB: TcxGridDBColumn
          Caption = #8470' '#1048#1041
          DataBinding.FieldName = 'FC_IB'
          PropertiesClassName = 'TcxTextEditProperties'
          Options.Editing = False
          Width = 69
        end
        object grPac_FC_FIO: TcxGridDBColumn
          Caption = #1060#1048#1054
          DataBinding.FieldName = 'FC_FIO'
          PropertiesClassName = 'TcxTextEditProperties'
          Options.Editing = False
          Width = 148
        end
        object grPac_FD_ROJD: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          DataBinding.FieldName = 'FD_ROJD'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          Options.Editing = False
          Width = 65
        end
        object grPac_FD_DATA1: TcxGridDBColumn
          Caption = #1055#1086#1089#1090#1091#1087#1080#1083
          DataBinding.FieldName = 'FD_DATA1'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          Options.Editing = False
          Width = 52
        end
        object grPac_FD_DATA2: TcxGridDBColumn
          Caption = #1042#1099#1073#1099#1083
          DataBinding.FieldName = 'FD_DATA2'
          Options.Editing = False
          Width = 51
        end
        object grPac_FC_ROOM: TcxGridDBColumn
          Caption = #1055#1072#1083#1072#1090#1072
          DataBinding.FieldName = 'FC_ROOM'
          Options.Editing = False
          Width = 62
        end
        object grPac_VID_POM_HITECH: TcxGridDBColumn
          Caption = #1042#1080#1076' '#1087#1086#1084#1086#1097#1080
          DataBinding.FieldName = 'FK_VID_POM_HITECH'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.ClearKey = 46
          Properties.DropDownAutoSize = True
          Properties.DropDownSizeable = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'FK_ID'
          Properties.ListColumns = <
            item
              Width = 200
              FieldName = 'FC_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsSpisanieVid
          Properties.OnEditValueChanged = grPac_VID_POM_HITECHPropertiesEditValueChanged
          Width = 105
        end
        object grPac_fn_spis_sum: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072' '#1089#1087#1080#1089#1072#1085#1080#1081
          DataBinding.FieldName = 'fn_spis_sum'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Options.Editing = False
          Width = 64
        end
      end
      object grPacLevel1: TcxGridLevel
        GridView = grPacDBTableView1
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 280
    Width = 712
    Height = 8
    AlignSplitter = salTop
    Control = grbPac
  end
  object grbSpis: TcxGroupBox
    Left = 0
    Top = 288
    Align = alClient
    Caption = ' '#1057#1087#1080#1089#1072#1085#1080#1103' '
    TabOrder = 2
    Height = 184
    Width = 712
    object grPacSpis: TcxGrid
      Left = 2
      Top = 18
      Width = 708
      Height = 164
      Align = alClient
      TabOrder = 0
      object grPacSpisDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsPacSpis
        DataController.KeyFieldNames = 'max_kartid'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = #1050#1086#1083'-'#1074#1086': 0'
            Kind = skCount
          end
          item
            Format = #1057#1091#1084#1084#1072': 0.00'
            Kind = skSum
            Column = grPacSpis_fn_sum
          end
          item
            Format = #1057#1090#1088#1086#1082': 0'
            Kind = skCount
            Column = grPacSpis_fc_medic
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object grPacSpis_fc_medic: TcxGridDBColumn
          Caption = #1052#1077#1076#1080#1082#1072#1084#1077#1085#1090
          DataBinding.FieldName = 'fc_medic'
          SortIndex = 0
          SortOrder = soAscending
          Width = 227
        end
        object grPacSpis_fn_kol: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086
          DataBinding.FieldName = 'fn_kol'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.DisplayFormat = '### ### ### ##0.###'
          Width = 43
        end
        object grPacSpis_fc_ei: TcxGridDBColumn
          Caption = #1045#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'fc_ei'
          Width = 53
        end
        object grPacSpis_fn_sum: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072
          DataBinding.FieldName = 'fn_sum'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Width = 87
        end
        object grPacSpis_FD_DATE_SPIS: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1087#1080#1089#1072#1085#1080#1103' ('#1087#1086#1089#1083#1077#1076#1085#1103#1103')'
          DataBinding.FieldName = 'FD_DATE_SPIS'
          PropertiesClassName = 'TcxDateEditProperties'
          Width = 78
        end
        object grPacSpis_fc_finsource: TcxGridDBColumn
          Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
          DataBinding.FieldName = 'fc_finsource'
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 128
        end
      end
      object grPacSpisLevel1: TcxGridLevel
        GridView = grPacSpisDBTableView1
      end
    end
  end
  object paCur: TPanel
    Left = 0
    Top = 0
    Width = 712
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object lcbCurMOGroup: TcxLookupComboBox
      Left = 94
      Top = 15
      Hint = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090'. '#1086#1090#1074'., '#1074' '#1082#1086#1090#1086#1088#1086#1081' '#1087#1088#1086#1080#1089#1093#1086#1076#1080#1083#1086' '#1089#1087#1080#1089#1072#1085#1080#1077
      Properties.DropDownAutoSize = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'GROUPID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_GROUP'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsMO_GROUP
      Properties.OnChange = lcbCurMOGroupPropertiesChange
      TabOrder = 0
      Width = 211
    end
    object cxLabel2: TcxLabel
      Left = 94
      Top = -1
      AutoSize = False
      Caption = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090'. '#1086#1090#1074'.'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Height = 17
      Width = 211
      AnchorX = 200
      AnchorY = 8
    end
    object deCurDate: TcxDateEdit
      Left = 6
      Top = 15
      Hint = #1044#1072#1090#1072' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103' '#1086#1089#1090#1072#1090#1082#1086#1074
      EditValue = 0d
      ParentFont = False
      Properties.DateButtons = [btnToday]
      Properties.ImmediatePost = True
      Properties.InputKind = ikMask
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnChange = deCurDatePropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 85
    end
    object cxLabel1: TcxLabel
      Left = 6
      Top = 0
      AutoSize = False
      Caption = #1044#1072#1090#1072
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Height = 17
      Width = 85
      AnchorX = 49
      AnchorY = 9
    end
    object buRefresh: TcxButton
      Left = 328
      Top = 8
      Width = 81
      Height = 28
      Action = acRefresh
      TabOrder = 4
    end
    object buPrint: TcxButton
      Left = 424
      Top = 8
      Width = 97
      Height = 28
      Action = acPrintByPac
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object buPrintByVID_POM_HITECH: TcxButton
      Left = 527
      Top = 8
      Width = 112
      Height = 28
      Action = acPrintByVID_POM_HITECH
      TabOrder = 6
    end
  end
  object odsPacList: TOracleDataSet
    SQL.Strings = (
      '-- '#1089#1087#1080#1089#1086#1082' '#1087#1072#1094#1080#1077#1085#1090#1086#1074
      'SELECT T.RID as "ROWID",'
      '       T.FK_ID,'
      '       T.FK_ID FK_PACID,'
      '       T.FK_PEPLID,'
      '       T.FK_VRACHID,'
      '       T.FK_OTDELID,'
      '       T.FK_IBID FC_IB, --'#8470#1048#1041
      
        '       SUBSTR(ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_FIO(T.FK_PEPLID),' +
        '1,100) FC_FIO, --'#1060#1048#1054
      
        '       ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_AGE_NOW(T.FK_PEPLID) FN_' +
        'AGE, --'#1042#1086#1079#1088#1072#1089#1090
      
        '       SUBSTR(LOGIN.GET_SOTRNAME(FK_VRACHID),1,100) AS FC_VRACH,' +
        ' --'#1051#1077#1095'. '#1074#1088#1072#1095
      
        '       SUBSTR(STAT.PKG_FRFORM30.GET_LAST_DIAG(T.FK_ID),1,200) as' +
        ' FC_DIAG1, --DS '#1090#1077#1082#1091#1097#1080#1081
      
        '       ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME(T.FK_ID) as FD_DATA' +
        '1, --'#1055#1086#1089#1090#1091#1087#1080#1083
      
        '       ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(T.FK_ID) as  FD_DA' +
        'TA2, --'#1042#1099#1073#1099#1083
      '       T.FD_ROJD, --'#1044#1072#1090#1072' '#1088#1086#1078#1076'.'
      '       T.FC_PALATA AS FC_ROOM,'
      '       T.FK_VID_POM_HITECH,'
      '       T.fn_spis_sum'
      ''
      '  FROM (SELECT K.ROWID as RID,'
      '               K.FK_ID,'
      '               K.FK_PEPLID,'
      '               K.FD_ROJD,'
      '               K.FK_IBID,'
      
        '               ASU.PKG_REGIST_PACFUNC.GET_PAC_VRACHID(K.FK_ID) A' +
        'S FK_VRACHID,'
      '               ROOM.FC_PALATA as FC_PALATA,'
      '               ROOM.FK_OTDELID,'
      '               tl2.fk_id2 as FK_VID_POM_HITECH,'
      '               pac_spis.fn_spis_sum'
      '        '
      '          FROM ASU.TKARTA K,'
      
        '               (SELECT R.FK_ID FK_ROOMID, R.FC_PALATA, R.FK_OTDE' +
        'LID, p.fk_pacid'
      
        '                  FROM ASU.TROOM R,                             ' +
        '            -- '#1076#1072#1090#1072' '#1087#1077#1088#1077#1074#1086#1076#1072' '#1074' '#1087#1072#1083#1072#1090#1091' ('#1080#1083#1080' '#1074#1099#1087#1080#1089#1082#1080') '#1087#1086' '#1090#1077#1082'. '#1086#1090#1076#1077 +
        #1083#1077#1085#1080#1102
      
        '                       (select p2.fk_pacid, p2.fk_palataid from ' +
        'ASU.TPERESEL p2 where p2.fd_data1 >= :pDate or p2.fd_data2 >= :p' +
        'Date) P'
      
        '                 WHERE R.FK_OTDELID = LOGIN.GET_SOTR_OTDELID(:FK' +
        '_VRACHID)'
      '                   and R.fk_id = P.fk_palataid '
      '                    '
      '               ) ROOM,'
      
        '               (SELECT tl.fk_id1, tl.fk_id2 from ASU.TTABLES_LIN' +
        'KS tl where tl.fc_table1_name = '#39'ASU.TKARTA'#39' and tl.fc_table2_na' +
        'me = '#39'MED.TSPISANIEVID'#39') tl2,'
      ''
      
        '               (select d.fk_mogroupid_to as FK_PACID, sum(dp.fn_' +
        'kol*k.fn_price) as fn_spis_sum FROM med.tdocs d, med.tdpc dp, me' +
        'd.tkart k'
      
        '                where d.fp_vid = 3 and d.fp_vidmove = 8 and d.fn' +
        '_spisanievid = 3'
      '                  and d.dpid = dp.dpid and dp.kartid = k.kartid'
      '                  and d.fk_mogroupid_from = :MO_GROUP_ID'
      '                group by d.fk_mogroupid_to) pac_spis'
      '                '
      '         WHERE K.FK_ID = ROOM.fk_pacid'
      '           and K.FK_ID = tl2.fk_id1(+)'
      '           and K.FK_ID = pac_spis.FK_PACID(+)'
      'group by'
      '  K.ROWID,'
      '  K.FK_ID,'
      '  K.FK_PEPLID,'
      '  K.FD_ROJD,'
      '  K.FK_IBID,'
      '  ROOM.FC_PALATA,'
      '  ROOM.FK_OTDELID,'
      '  tl2.fk_id2,'
      '  pac_spis.fn_spis_sum'
      ') T')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A50444154450C00000000000000000000000B00
      00003A464B5F565241434849440300000000000000000000000C0000003A4D4F
      5F47524F55505F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F4143434F554E540100000000000E000000
      46435F5245504F52545449544C450100000000000D000000464B5F5455434847
      5254595045010000000000}
    Cursor = crSQLWait
    OnApplyRecord = odsPacListApplyRecord
    Session = dmMain.os
    AfterOpen = odsPacListAfterOpen
    BeforeEdit = odsPacListBeforeEdit
    AfterScroll = odsPacListAfterScroll
    Left = 24
    Top = 64
  end
  object dsPacList: TDataSource
    DataSet = odsPacList
    Left = 96
    Top = 64
  end
  object odsPacSpis: TOracleDataSet
    SQL.Strings = (
      '-- '#1042#1057#1045' '#1057#1055#1048#1057#1040#1053#1048#1071
      'SELECT'
      
        '  max(k.kartid) as max_kartid,m.medicid, m.fc_name as fc_medic, ' +
        'sum(dp.fn_kol) as fn_kol, uei.fc_name as fc_ei, sum(dp.fn_kol*k.' +
        'fn_price) as fn_sum, max(dp.FD_DATE_SPIS) as FD_DATE_SPIS,'
      
        '  fs.fc_name as fc_finsource, rtrim(TO_CHAR(sum(dp.FN_KOL), '#39'FM9' +
        '99G999G990D999'#39'),'#39'.,'#39') as fc_kol'
      
        'FROM med.tdocs d, med.tdpc dp, med.tkart k, med.tmedic m, med.te' +
        'i uei, med.tmo mo, med.TFinSource fs'
      'where d.fp_vid = 3 and d.fp_vidmove = 8 and d.fn_spisanievid = 3'
      '  and d.dpid = dp.dpid'
      '  and dp.kartid = k.kartid '
      '  and k.fk_finsource_id = fs.fk_id(+)'
      '  and k.medicid = m.medicid'
      '  and m.eiid = uei.eiid(+)'
      '  and dp.FK_CREATE_MO_ID = mo.moid(+)'
      '  and d.fk_mogroupid_to = :PacID -- '#1082#1083#1077#1077#1084' '#1087#1072#1094#1077#1074' '#1089#1086' '#1089#1087#1080#1089#1072#1085#1080#1103#1084#1080
      '  and d.fk_mogroupid_from = :MO_GROUP_ID'
      'group by m.medicid, fs.fc_name, m.fc_name, uei.fc_name  '
      'order by upper(fs.fc_name), m.fc_name'
      
        '--        and (dp.FD_DATE_SPIS >= TRUNC(asu.PKG_AMEDSES_EXE.get_' +
        'cur_spis_date)) and (dp.FD_DATE_SPIS < TRUNC(asu.PKG_AMEDSES_EXE' +
        '.get_cur_spis_date)+1)'
      '')
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A50414349440300000000000000000000000C00
      00003A4D4F5F47524F55505F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F4143434F554E540100000000000E000000
      46435F5245504F52545449544C450100000000000D000000464B5F5455434847
      5254595045010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 24
    Top = 336
  end
  object dsPacSpis: TDataSource
    DataSet = odsPacSpis
    Left = 96
    Top = 336
  end
  object odsSpisanieVid: TOracleDataSet
    SQL.Strings = (
      'SELECT  TSPISANIEVID.*'
      ' FROM MED.TSPISANIEVID'
      
        'WHERE NVL(TSPISANIEVID.FL_DEL,0) = 0 and (TSPISANIEVID.FN_DOCTYP' +
        'E = 14)'
      'ORDER BY Lower(FC_NAME)')
    Optimize = False
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000006000000464C5F44454C0100000000000A000000464E5F44
      4F4354595045010000000000}
    Cursor = crSQLWait
    UniqueFields = 'FK_ID'
    UpdatingTable = 'MED.TSPISANIEVID'
    Session = dmMain.os
    Left = 472
    Top = 82
  end
  object dsSpisanieVid: TDataSource
    DataSet = odsSpisanieVid
    Left = 472
    Top = 128
  end
  object odsMO_GROUP: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  MG.*'
      'FROM MED.TMO_GROUP MG'
      'WHERE MG.FL_DEL = 0'
      'ORDER BY MG.FC_GROUP')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000040000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C0100000000000800000046
      4B5F504841524D010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 180
    Top = 28
  end
  object dsMO_GROUP: TDataSource
    DataSet = odsMO_GROUP
    Left = 182
    Top = 76
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = '%FORM_NAME%\'
    StoredProps.Strings = (
      'grbPac.Height')
    StoredValues = <>
    Left = 40
    Top = 144
  end
  object ActionList1: TActionList
    Images = dmMain.ilMain
    Left = 328
    Top = 88
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 15
      OnExecute = acRefreshExecute
    end
    object acPrintByPac: TAction
      Caption = #1055#1086' '#1087#1072#1094#1080#1077#1085#1090#1091
      Hint = #1055#1077#1095#1072#1090#1100' '#1086#1090#1095#1077#1090#1072' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1084#1091' '#1087#1072#1094#1080#1077#1085#1090#1091
      ImageIndex = 32
      OnExecute = acPrintByPacExecute
    end
    object acPrintByVID_POM_HITECH: TAction
      Caption = #1055#1086' '#1074#1080#1076#1091' '#1087#1086#1084#1086#1097#1080
      Hint = #1055#1077#1095#1072#1090#1100' '#1086#1090#1095#1077#1090#1072' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1084#1091' '#1074#1080#1076#1091' '#1087#1086#1084#1086#1097#1080
      ImageIndex = 32
      OnExecute = acPrintByVID_POM_HITECHExecute
    end
  end
  object frxReport1: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38545.443404583300000000
    ReportOptions.LastChange = 41176.693365995370000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  summ, summ_group : double;'
      '  NaimKol : integer;                                   '
      ''
      'procedure Memo30OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  summ := summ +  <frxdsPacSpis."FN_SUM">;'
      
        '  summ_group := summ_group + <frxdsPacSpis."FN_SUM">;           ' +
        '                                              '
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' NaimKol := 0;                '
      ' summ := 0;'
      ' summ_group := 0;                   '
      'end;'
      ''
      
        'procedure Memo8OnPreviewClick(Sender: TfrxView; Button: TMouseBu' +
        'tton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1091#1095#1077#1088#1077#1078#1076#1077#1085#1080#1103#39', '#39#1053#1072#1079#1074#1072#1085#1080#1077':'#39', s)' +
        ';  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      ''
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_CLIENT_NAME'#39',  s2);'
      'end;'
      ''
      
        'procedure Memo9OnPreviewClick(Sender: TfrxView; Button: TMouseBu' +
        'tton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#39', '#39#1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080 +
        #1077':'#39', s);  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      ''
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_PODRAZDELENIE'#39',  s2);'
      'end;'
      ''
      
        'procedure Memo42OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := InputBox('#39#39', '#39#1055#1088#1080#1082#1072#1079' :'#39', s);  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      ''
      '  IniWriteString2('#39'Act_Spis'#39', '#39'PrikazOt'#39',  s2);'
      'end;'
      ''
      'procedure Memo24OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  NaimKol := NaimKol + 1;                        '
      '  if <LINE> = 1 then summ_group := 0;        '
      'end;'
      ''
      'begin'
      '  '
      'end.')
    OnGetValue = frxReport1GetValue
    OnUserFunction = frxReport1UserFunction
    Left = 396
    Top = 88
    Datasets = <
      item
        DataSet = frxdsPacSpis
        DataSetName = 'frxdsPacSpis'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      Columns = 1
      ColumnWidth = 180.000000000000000000
      ColumnPositions.Strings = (
        '0')
      LargeDesignHeight = True
      OnBeforePrint = 'Page1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        Height = 245.559060000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          ShiftMode = smDontShift
          Left = 416.000000000000000000
          Width = 260.000000000000000000
          Height = 19.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1032#1056#1118#1056#8217#1056#8226#1056#160#1056#8211#1056#8221#1056#1106#1056#174)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          ShiftMode = smDontShift
          Top = 49.000000000000000000
          Width = 400.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1056#181')')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          ShiftMode = smDontShift
          Top = 95.000000000000000000
          Width = 400.000000000000000000
          Height = 19.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181')')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          ShiftMode = smDontShift
          Top = 3.000000000000000000
          Width = 400.000000000000000000
          Height = 46.000000000000000000
          OnPreviewClick = 'Memo8OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_CLIENT_NAME]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo9: TfrxMemoView
          ShiftMode = smDontShift
          Top = 65.000000000000000000
          Width = 400.000000000000000000
          Height = 30.000000000000000000
          OnPreviewClick = 'Memo9OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_PODRAZDELENIE]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo43: TfrxMemoView
          ShiftMode = smDontShift
          Left = 416.000000000000000000
          Top = 19.000000000000000000
          Width = 260.000000000000000000
          Height = 30.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo47: TfrxMemoView
          ShiftMode = smDontShift
          Left = 416.000000000000000000
          Top = 49.000000000000000000
          Width = 260.000000000000000000
          Height = 46.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo15: TfrxMemoView
          ShiftMode = smDontShift
          Left = 416.000000000000000000
          Top = 95.000000000000000000
          Width = 260.000000000000000000
          Height = 19.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '"___"  __________________  20___ '#1056#1110'.')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo76: TfrxMemoView
          ShiftMode = smDontShift
          Top = 130.000000000000000000
          Width = 676.000000000000000000
          Height = 26.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1106#1056#1108#1057#8218' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1105#1057#1039' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1056#1109#1056#1030' '#1074#8222#8211' ___ '#1056#1109#1057#8218'  "' +
              '__"  __________  20__ '#1056#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          ShiftMode = smDontShift
          Top = 156.000000000000000000
          Width = 676.000000000000000000
          Height = 26.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1056#1105#1056#1169' '#1056#1111#1056#1109#1056#1112#1056#1109#1057#8240#1056#1105': [VAR_VID_POM_HITECH]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          ShiftMode = smDontShift
          Top = 182.000000000000000000
          Width = 676.000000000000000000
          Height = 26.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218': [VAR_PAC_FIO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          ShiftMode = smDontShift
          Top = 208.000000000000000000
          Width = 676.000000000000000000
          Height = 26.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [VAR_FC_DATE1] '#1056#1111#1056#1109' [VAR_FC_DATE2]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.000000000000000000
        Top = 695.433520000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frxdsPacSpis
        DataSetName = 'frxdsPacSpis'
        RowCount = 0
        Stretched = True
        object Memo24: TfrxMemoView
          ShiftMode = smDontShift
          Width = 37.559060000000000000
          Height = 22.000000000000000000
          OnBeforePrint = 'Memo24OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[LINE#]')
        end
        object Memo26: TfrxMemoView
          ShiftMode = smDontShift
          Left = 38.000000000000000000
          Width = 354.133890000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxdsPacSpis."fc_medic"]')
        end
        object Memo27: TfrxMemoView
          ShiftMode = smDontShift
          Left = 392.000000000000000000
          Width = 88.000000000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsPacSpis."FC_EI"]')
        end
        object Memo28: TfrxMemoView
          ShiftMode = smDontShift
          Left = 480.000000000000000000
          Width = 72.456710000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsPacSpis."FC_KOL"]')
        end
        object Memo30: TfrxMemoView
          ShiftMode = smDontShift
          Left = 552.000000000000000000
          Width = 124.000000000000000000
          Height = 22.000000000000000000
          OnBeforePrint = 'Memo30OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxdsPacSpis."FN_SUM"]')
        end
      end
      object MasterFooter1: TfrxFooter
        Height = 25.102350000000000000
        Top = 782.362710000000000000
        Width = 680.315400000000000000
        Stretched = True
        object Memo81: TfrxMemoView
          ShiftMode = smDontShift
          Left = 392.000000000000000000
          Top = 1.550710000000000000
          Width = 88.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          ShiftMode = smDontShift
          Left = 480.000000000000000000
          Top = 1.550710000000000000
          Width = 196.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[summ]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 102.456710000000000000
        Top = 1031.811690000000000000
        Width = 680.315400000000000000
        object Memo18: TfrxMemoView
          ShiftMode = smDontShift
          Top = 3.000000000000000000
          Width = 195.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          ShiftMode = smDontShift
          Top = 27.000000000000000000
          Width = 195.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105': ')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 3.000000000000000000
          Width = 481.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[PRED] [DOLPRED]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 27.000000000000000000
          Width = 481.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom1] [DolKom1]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 51.000000000000000000
          Width = 481.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom2] [DolKom2]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 74.000000000000000000
          Width = 481.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom3] [DolKom3]')
          ParentFont = False
        end
      end
      object MasterHeader1: TfrxHeader
        Height = 50.000000000000000000
        Top = 582.047620000000000000
        Width = 680.315400000000000000
        object Memo3: TfrxMemoView
          ShiftMode = smDontShift
          Width = 37.559060000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          ShiftMode = smDontShift
          Left = 38.000000000000000000
          Width = 354.133890000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          ShiftMode = smDontShift
          Left = 392.000000000000000000
          Width = 88.000000000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          ShiftMode = smDontShift
          Left = 480.000000000000000000
          Width = 72.456710000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          ShiftMode = smDontShift
          Left = 552.000000000000000000
          Width = 124.000000000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          VAlign = vaCenter
        end
      end
      object MasterData6: TfrxMasterData
        Height = 122.881880000000000000
        Top = 325.039580000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
        object Memo31: TfrxMemoView
          ShiftMode = smDontShift
          Top = 25.000000000000000000
          Width = 195.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          ShiftMode = smDontShift
          Top = 50.000000000000000000
          Width = 195.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105': ')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 25.000000000000000000
          Width = 481.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[PRED] [DOLPRED]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 50.000000000000000000
          Width = 481.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom1] [DolKom1]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 73.000000000000000000
          Width = 481.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom2] [DolKom2]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 96.000000000000000000
          Width = 481.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom3] [DolKom3]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          ShiftMode = smDontShift
          Width = 195.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1057#1039' '#1056#1030' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#181':')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 47.000000000000000000
        Top = 472.441250000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
        Stretched = True
        object Memo2: TfrxMemoView
          ShiftMode = smDontShift
          Width = 195.000000000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#183#1056#1029#1056#176#1057#8225#1056#181#1056#1029#1056#176' '#1056#1111#1057#1026#1056#1105#1056#1108#1056#176#1056#183#1056#1109#1056#1112' '#1056#1109#1057#8218' ')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          ShiftMode = smDontShift
          Top = 22.441250000000000000
          Width = 676.000000000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              'c'#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1056#187#1056#1105' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#1105#1056#8470' '#1056#176#1056#1108#1057#8218'  '#1056#1030' '#1057#8218#1056#1109#1056#1112', '#1057#8225#1057#8218#1056#1109' '#1056 +
              #1111#1056#1109' '#1057#1107#1056#1108#1056#176#1056#183#1056#176#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1111#1057#1026#1056#1105#1057#8225#1056#1105#1056#1029#1056#181' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1109' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056 +
              #176#1056#1112#1056#181#1056#1029#1057#8218#1056#1109#1056#1030':')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 0.441250000000000000
          Width = 481.000000000000000000
          Height = 22.000000000000000000
          OnPreviewClick = 'Memo42OnPreviewClick'
          ShowHint = False
          StretchMode = smMaxHeight
          Cursor = crHandPoint
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Prikaz]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.000000000000000000
        Top = 1156.536180000000000000
        Width = 680.315400000000000000
        object Memo25: TfrxMemoView
          ShiftMode = smDontShift
          Width = 676.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [PAGE#] '#1056#1105#1056#183' [TotalPages#]')
          VAlign = vaCenter
        end
      end
      object MasterData4: TfrxMasterData
        Height = 20.000000000000000000
        Top = 540.472790000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
        Stretched = True
        object meSpisano: TfrxMemoView
          ShiftMode = smDontShift
          Top = 0.102040000000000000
          Width = 676.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[GETSPISANO]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData5: TfrxMasterData
        Height = 98.841990000000000000
        Top = 831.496600000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
        Stretched = True
        object Memo16: TfrxMemoView
          ShiftMode = smDontShift
          Top = 28.000000000000000000
          Width = 68.000000000000000000
          Height = 44.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107)
        end
        object Memo17: TfrxMemoView
          ShiftMode = smDontShift
          Top = 72.000000000000000000
          Width = 676.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1056#1105#1056#181' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          ShiftMode = smDontShift
          Width = 676.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#181#1056#1112#1057#1107' '#1056#176#1056#1108#1057#8218#1057#1107' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1109': [G' +
              'ET_NAIM_KOL(<NaimKol>, 2)] '#1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039'(-'#1056#1105#1056#8470')')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          ShiftMode = smDontShift
          Left = 67.811070000000000000
          Top = 28.000000000000000000
          Width = 608.000000000000000000
          Height = 44.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MONEYSTR(<summ>)]')
          ParentFont = False
        end
      end
      object Band1: TfrxMasterData
        Height = 20.000000000000000000
        Top = 952.441560000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
        Stretched = True
        object Memo4: TfrxMemoView
          ShiftMode = smDontShift
          Width = 676.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clGreen
          Memo.UTF8 = (
            '[GETZAKLKOM]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 20.000000000000000000
        Top = 653.858690000000000000
        Width = 680.315400000000000000
        Condition = 'frxdsPacSpis."fc_finsource"'
        object Memo34: TfrxMemoView
          ShiftMode = smDontShift
          Width = 676.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            
              '  '#1056#152#1057#1027#1057#8218'. '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039': [frxdsPacSpis."fc_finsou' +
              'rce"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 20.000000000000000000
        Top = 740.787880000000000000
        Width = 680.315400000000000000
        object Memo39: TfrxMemoView
          ShiftMode = smDontShift
          Width = 480.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1105#1057#1027#1057#8218'. '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039': [frxdsPacS' +
              'pis."fc_finsource"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          ShiftMode = smDontShift
          Left = 480.000000000000000000
          Width = 196.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[summ_group]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxdsPacSpis: TfrxDBDataset
    UserName = 'frxdsPacSpis'
    CloseDataSource = False
    DataSet = odsPrintPacSpis
    BCDToCurrency = False
    Left = 400
    Top = 144
  end
  object frxAct_Spis_HITECH: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38545.443404583300000000
    ReportOptions.LastChange = 41145.507668287030000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  summ, summ_group : double;'
      '  NaimKol : integer;                                   '
      ''
      'procedure Memo30OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  summ := summ +  <frxdsSpisByHitech."FN_SUM">;'
      
        '  summ_group := summ_group + <frxdsSpisByHitech."FN_SUM">;      ' +
        '                                                   '
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' NaimKol := 0;                '
      ' summ := 0;'
      ' summ_group := 0;                   '
      'end;'
      ''
      
        'procedure Memo8OnPreviewClick(Sender: TfrxView; Button: TMouseBu' +
        'tton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1091#1095#1077#1088#1077#1078#1076#1077#1085#1080#1103#39', '#39#1053#1072#1079#1074#1072#1085#1080#1077':'#39', s)' +
        ';  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      ''
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_CLIENT_NAME'#39',  s2);'
      'end;'
      ''
      
        'procedure Memo9OnPreviewClick(Sender: TfrxView; Button: TMouseBu' +
        'tton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#39', '#39#1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080 +
        #1077':'#39', s);  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      ''
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_PODRAZDELENIE'#39',  s2);'
      'end;'
      ''
      
        'procedure Memo42OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := InputBox('#39#39', '#39#1055#1088#1080#1082#1072#1079' :'#39', s);  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      ''
      '  IniWriteString2('#39'Act_Spis'#39', '#39'PrikazOt'#39',  s2);'
      'end;'
      ''
      'procedure Memo24OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  NaimKol := NaimKol + 1;                        '
      '  if <LINE> = 1 then summ_group := 0;        '
      'end;'
      ''
      'begin'
      '  '
      'end.')
    OnGetValue = frxReport1GetValue
    OnUserFunction = frxReport1UserFunction
    Left = 548
    Top = 88
    Datasets = <
      item
        DataSet = frxdsSpisByHitech
        DataSetName = 'frxdsSpisByHitech'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      Columns = 1
      ColumnWidth = 180.000000000000000000
      ColumnPositions.Strings = (
        '0')
      LargeDesignHeight = True
      OnBeforePrint = 'Page1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        Height = 233.559060000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          ShiftMode = smDontShift
          Left = 416.000000000000000000
          Width = 260.000000000000000000
          Height = 19.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1032#1056#1118#1056#8217#1056#8226#1056#160#1056#8211#1056#8221#1056#1106#1056#174)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          ShiftMode = smDontShift
          Top = 49.000000000000000000
          Width = 400.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1056#181')')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          ShiftMode = smDontShift
          Top = 95.000000000000000000
          Width = 400.000000000000000000
          Height = 19.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181')')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          ShiftMode = smDontShift
          Top = 3.000000000000000000
          Width = 400.000000000000000000
          Height = 46.000000000000000000
          OnPreviewClick = 'Memo8OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_CLIENT_NAME]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo9: TfrxMemoView
          ShiftMode = smDontShift
          Top = 65.000000000000000000
          Width = 400.000000000000000000
          Height = 30.000000000000000000
          OnPreviewClick = 'Memo9OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_PODRAZDELENIE]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo43: TfrxMemoView
          ShiftMode = smDontShift
          Left = 416.000000000000000000
          Top = 19.000000000000000000
          Width = 260.000000000000000000
          Height = 30.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo47: TfrxMemoView
          ShiftMode = smDontShift
          Left = 416.000000000000000000
          Top = 49.000000000000000000
          Width = 260.000000000000000000
          Height = 46.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo15: TfrxMemoView
          ShiftMode = smDontShift
          Left = 416.000000000000000000
          Top = 95.000000000000000000
          Width = 260.000000000000000000
          Height = 19.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '"___"  __________________  20___ '#1056#1110'.')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo76: TfrxMemoView
          ShiftMode = smDontShift
          Top = 130.000000000000000000
          Width = 676.000000000000000000
          Height = 26.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1106#1056#1108#1057#8218' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1105#1057#1039' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1056#1109#1056#1030' '#1074#8222#8211' ___ '#1056#1109#1057#8218'  "' +
              '__"  __________  20__ '#1056#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          ShiftMode = smDontShift
          Top = 156.000000000000000000
          Width = 676.000000000000000000
          Height = 26.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1056#1105#1056#1169' '#1056#1111#1056#1109#1056#1112#1056#1109#1057#8240#1056#1105': [VAR_VID_POM_HITECH]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          ShiftMode = smDontShift
          Top = 182.000000000000000000
          Width = 676.000000000000000000
          Height = 26.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027' [VAR_FC_DATE1] '#1056#1111#1056#1109' [VAR_FC_DATE2]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.000000000000000000
        Top = 684.094930000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frxdsSpisByHitech
        DataSetName = 'frxdsSpisByHitech'
        RowCount = 0
        Stretched = True
        object Memo24: TfrxMemoView
          ShiftMode = smDontShift
          Width = 37.559060000000000000
          Height = 22.000000000000000000
          OnBeforePrint = 'Memo24OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[LINE#]')
        end
        object Memo26: TfrxMemoView
          ShiftMode = smDontShift
          Left = 38.000000000000000000
          Width = 354.133890000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxdsSpisByHitech."fc_medic"]')
        end
        object Memo27: TfrxMemoView
          ShiftMode = smDontShift
          Left = 392.000000000000000000
          Width = 88.000000000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsSpisByHitech."FC_EI"]')
        end
        object Memo28: TfrxMemoView
          ShiftMode = smDontShift
          Left = 480.000000000000000000
          Width = 72.456710000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsSpisByHitech."FC_KOL"]')
        end
        object Memo30: TfrxMemoView
          ShiftMode = smDontShift
          Left = 552.000000000000000000
          Width = 124.000000000000000000
          Height = 22.000000000000000000
          OnBeforePrint = 'Memo30OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxdsSpisByHitech."FN_SUM"]')
        end
      end
      object MasterFooter1: TfrxFooter
        Height = 25.102350000000000000
        Top = 771.024120000000000000
        Width = 680.315400000000000000
        Stretched = True
        object Memo81: TfrxMemoView
          ShiftMode = smDontShift
          Left = 392.000000000000000000
          Top = 1.550710000000000000
          Width = 88.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          ShiftMode = smDontShift
          Left = 480.000000000000000000
          Top = 1.550710000000000000
          Width = 196.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[summ]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 102.456710000000000000
        Top = 1020.473100000000000000
        Width = 680.315400000000000000
        object Memo18: TfrxMemoView
          ShiftMode = smDontShift
          Top = 3.000000000000000000
          Width = 195.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          ShiftMode = smDontShift
          Top = 27.000000000000000000
          Width = 195.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105': ')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 3.000000000000000000
          Width = 481.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[PRED]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 27.000000000000000000
          Width = 481.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom1]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 51.000000000000000000
          Width = 481.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom2]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 74.000000000000000000
          Width = 481.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom3]')
          ParentFont = False
        end
      end
      object MasterHeader1: TfrxHeader
        Height = 50.000000000000000000
        Top = 570.709030000000000000
        Width = 680.315400000000000000
        object Memo3: TfrxMemoView
          ShiftMode = smDontShift
          Width = 37.559060000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          ShiftMode = smDontShift
          Left = 38.000000000000000000
          Width = 354.133890000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          ShiftMode = smDontShift
          Left = 392.000000000000000000
          Width = 88.000000000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          ShiftMode = smDontShift
          Left = 480.000000000000000000
          Width = 72.456710000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          ShiftMode = smDontShift
          Left = 552.000000000000000000
          Width = 124.000000000000000000
          Height = 50.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          VAlign = vaCenter
        end
      end
      object MasterData6: TfrxMasterData
        Height = 122.881880000000000000
        Top = 313.700990000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
        object Memo31: TfrxMemoView
          ShiftMode = smDontShift
          Top = 25.000000000000000000
          Width = 195.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          ShiftMode = smDontShift
          Top = 50.000000000000000000
          Width = 195.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105': ')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 25.000000000000000000
          Width = 481.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[PRED] [DOLPRED]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 50.000000000000000000
          Width = 481.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom1] [DolKom1]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 73.000000000000000000
          Width = 481.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom2] [DolKom2]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 96.000000000000000000
          Width = 481.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Kom3] [DolKom3]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          ShiftMode = smDontShift
          Width = 195.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1057#1039' '#1056#1030' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#181':')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 47.000000000000000000
        Top = 461.102660000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
        Stretched = True
        object Memo2: TfrxMemoView
          ShiftMode = smDontShift
          Width = 195.000000000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#183#1056#1029#1056#176#1057#8225#1056#181#1056#1029#1056#176' '#1056#1111#1057#1026#1056#1105#1056#1108#1056#176#1056#183#1056#1109#1056#1112' '#1056#1109#1057#8218' ')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          ShiftMode = smDontShift
          Top = 22.441250000000000000
          Width = 676.000000000000000000
          Height = 22.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              'c'#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1056#187#1056#1105' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#1105#1056#8470' '#1056#176#1056#1108#1057#8218'  '#1056#1030' '#1057#8218#1056#1109#1056#1112', '#1057#8225#1057#8218#1056#1109' '#1056 +
              #1111#1056#1109' '#1057#1107#1056#1108#1056#176#1056#183#1056#176#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1111#1057#1026#1056#1105#1057#8225#1056#1105#1056#1029#1056#181' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1109' '#1056#1112#1056#181#1056#1169#1056#1105#1056#1108#1056 +
              #176#1056#1112#1056#181#1056#1029#1057#8218#1056#1109#1056#1030':')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          ShiftMode = smDontShift
          Left = 195.000000000000000000
          Top = 0.441250000000000000
          Width = 481.000000000000000000
          Height = 22.000000000000000000
          OnPreviewClick = 'Memo42OnPreviewClick'
          ShowHint = False
          StretchMode = smMaxHeight
          Cursor = crHandPoint
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Prikaz]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.000000000000000000
        Top = 1145.197590000000000000
        Width = 680.315400000000000000
        object Memo25: TfrxMemoView
          ShiftMode = smDontShift
          Width = 676.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [PAGE#] '#1056#1105#1056#183' [TotalPages#]')
          VAlign = vaCenter
        end
      end
      object MasterData4: TfrxMasterData
        Height = 20.000000000000000000
        Top = 529.134200000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
        Stretched = True
        object meSpisano: TfrxMemoView
          ShiftMode = smDontShift
          Top = 0.102040000000000000
          Width = 676.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[GETSPISANO]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData5: TfrxMasterData
        Height = 98.841990000000000000
        Top = 820.158010000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
        Stretched = True
        object Memo16: TfrxMemoView
          ShiftMode = smDontShift
          Top = 28.000000000000000000
          Width = 68.000000000000000000
          Height = 44.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107)
        end
        object Memo17: TfrxMemoView
          ShiftMode = smDontShift
          Top = 72.000000000000000000
          Width = 676.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1056#1105#1056#181' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          ShiftMode = smDontShift
          Width = 676.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#181#1056#1112#1057#1107' '#1056#176#1056#1108#1057#8218#1057#1107' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1109': [G' +
              'ET_NAIM_KOL(<NaimKol>, 2)] '#1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039'(-'#1056#1105#1056#8470')')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          ShiftMode = smDontShift
          Left = 67.811070000000000000
          Top = 28.000000000000000000
          Width = 608.000000000000000000
          Height = 44.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MONEYSTR(<summ>)]')
          ParentFont = False
        end
      end
      object Band1: TfrxMasterData
        Height = 20.000000000000000000
        Top = 941.102970000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
        Stretched = True
        object Memo4: TfrxMemoView
          ShiftMode = smDontShift
          Width = 676.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clGreen
          Memo.UTF8 = (
            '[GETZAKLKOM]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 20.000000000000000000
        Top = 642.520100000000000000
        Width = 680.315400000000000000
        Condition = 'frxdsSpisByHitech."fc_finsource"'
        object Memo34: TfrxMemoView
          ShiftMode = smDontShift
          Width = 676.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            
              '  '#1056#152#1057#1027#1057#8218'. '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039': [frxdsSpisByHitech."fc_f' +
              'insource"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 20.000000000000000000
        Top = 729.449290000000000000
        Width = 680.315400000000000000
        object Memo39: TfrxMemoView
          ShiftMode = smDontShift
          Width = 480.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1105#1057#1027#1057#8218'. '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039': [frxdsSpis' +
              'ByHitech."fc_finsource"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          ShiftMode = smDontShift
          Left = 480.000000000000000000
          Width = 196.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[summ_group]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxdsSpisByHitech: TfrxDBDataset
    UserName = 'frxdsSpisByHitech'
    CloseDataSource = False
    DataSet = odsSpisByHitech
    BCDToCurrency = False
    Left = 552
    Top = 144
  end
  object odsSpisByHitech: TOracleDataSet
    SQL.Strings = (
      '-- '#1042#1057#1045' '#1057#1055#1048#1057#1040#1053#1048#1071
      'SELECT'
      
        '  max(k.kartid) as max_kartid,m.medicid, m.fc_name as fc_medic, ' +
        'sum(dp.fn_kol) as fn_kol, uei.fc_name as fc_ei, sum(dp.fn_kol*k.' +
        'fn_price) as fn_sum, max(dp.FD_DATE_SPIS) as FD_DATE_SPIS,'
      
        '  fs.fc_name as fc_finsource, rtrim(TO_CHAR(sum(dp.FN_KOL), '#39'FM9' +
        '99G999G990D999'#39'),'#39'.,'#39') as fc_kol'
      
        'FROM med.tdocs d, med.tdpc dp, med.tkart k, med.tmedic m, med.te' +
        'i uei, med.tmo mo, med.TFinSource fs'
      
        'where d.fp_vid = 3 and d.fp_vidmove = 8 and d.fn_spisanievid = 3' +
        ' and d.fl_edit = 0'
      '  and d.dpid = dp.dpid'
      '  and dp.kartid = k.kartid '
      '  and k.fk_finsource_id = fs.fk_id(+)'
      '  and k.medicid = m.medicid'
      '  and m.eiid = uei.eiid(+)'
      '  and dp.FK_CREATE_MO_ID = mo.moid(+)'
      
        '  and d.fk_mogroupid_to in (select tl.fk_id1 from asu.ttables_li' +
        'nks tl where tl.fc_table1_name = '#39'ASU.TKARTA'#39' and fk_id2 = :VID_' +
        'POM_HITECH and fc_table2_name = '#39'MED.TSPISANIEVID'#39')'
      '  and d.fk_mogroupid_from = :MO_GROUP_ID'
      
        '  and TRUNC(:DATE1) <= dp.FD_DATE_SPIS and dp.FD_DATE_SPIS < TRU' +
        'NC(:DATE2+1)'
      'group by m.medicid, fs.fc_name, m.fc_name, uei.fc_name  '
      'order by upper(fs.fc_name), m.fc_name')
    Optimize = False
    Variables.Data = {
      03000000040000000C0000003A4D4F5F47524F55505F49440300000000000000
      000000000F0000003A5649445F504F4D5F484954454348030000000000000000
      000000060000003A44415445310C0000000000000000000000060000003A4441
      5445320C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F4143434F554E540100000000000E000000
      46435F5245504F52545449544C450100000000000D000000464B5F5455434847
      5254595045010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 624
    Top = 80
  end
  object odsPrintPacSpis: TOracleDataSet
    SQL.Strings = (
      '-- '#1042#1057#1045' '#1057#1055#1048#1057#1040#1053#1048#1071
      'SELECT'
      
        '  max(k.kartid) as max_kartid,m.medicid, m.fc_name as fc_medic, ' +
        'sum(dp.fn_kol) as fn_kol, uei.fc_name as fc_ei, sum(dp.fn_kol*k.' +
        'fn_price) as fn_sum, max(dp.FD_DATE_SPIS) as FD_DATE_SPIS,'
      
        '  fs.fc_name as fc_finsource, rtrim(TO_CHAR(sum(dp.FN_KOL), '#39'FM9' +
        '99G999G990D999'#39'),'#39'.,'#39') as fc_kol'
      
        'FROM med.tdocs d, med.tdpc dp, med.tkart k, med.tmedic m, med.te' +
        'i uei, med.tmo mo, med.TFinSource fs'
      
        'where d.fp_vid = 3 and d.fp_vidmove = 8 and d.fn_spisanievid = 3' +
        ' and d.fl_edit = 0'
      '  and d.dpid = dp.dpid'
      '  and dp.kartid = k.kartid '
      '  and k.fk_finsource_id = fs.fk_id(+)'
      '  and k.medicid = m.medicid'
      '  and m.eiid = uei.eiid(+)'
      '  and dp.FK_CREATE_MO_ID = mo.moid(+)'
      '  and d.fk_mogroupid_to = :PacID -- '#1082#1083#1077#1077#1084' '#1087#1072#1094#1077#1074' '#1089#1086' '#1089#1087#1080#1089#1072#1085#1080#1103#1084#1080
      '  and d.fk_mogroupid_from = :MO_GROUP_ID'
      
        '  and (TRUNC(:DATE1) <= dp.FD_DATE_SPIS) and (dp.FD_DATE_SPIS < ' +
        'TRUNC(:DATE2+1))'
      ''
      'group by m.medicid, fs.fc_name, m.fc_name, uei.fc_name  '
      'order by upper(fs.fc_name), m.fc_name'
      '')
    Optimize = False
    Variables.Data = {
      0300000004000000060000003A50414349440300000000000000000000000C00
      00003A4D4F5F47524F55505F4944030000000000000000000000060000003A44
      415445310C0000000000000000000000060000003A44415445320C0000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F4143434F554E540100000000000E000000
      46435F5245504F52545449544C450100000000000D000000464B5F5455434847
      5254595045010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 400
    Top = 200
  end
end
