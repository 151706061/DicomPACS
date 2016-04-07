object dmMoveEdit: TdmMoveEdit
  OldCreateOrder = False
  Height = 634
  Width = 383
  object oqUpdateFK_VID_POST: TOracleQuery
    SQL.Strings = (
      'update med.tdocs d set d.fk_vid_post = :pfk_vid_post'
      ' where d.dpid = :pdpid')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A50445049440300000000000000000000000D00
      00003A50464B5F5649445F504F5354030000000000000000000000}
    Left = 68
    Top = 116
  end
  object oqUpdateFC_KONTRAKT: TOracleQuery
    SQL.Strings = (
      'update med.tdocs d set d.FC_KONTRAKT = :pFC_KONTRAKT'
      ' where d.dpid = :pdpid')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A50445049440300000000000000000000000D00
      00003A5046435F4B4F4E5452414B54050000000000000000000000}
    Left = 68
    Top = 166
  end
  object oqDoSetDocToTreb: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '  UPDATE MED.TTREB  SET FK_DPID = :FK_DPID   WHERE FK_ID = :FK_I' +
        'D;'
      ''
      '  UPDATE MED.TDOCS SET FL_TREB = 1 WHERE dpid = :FK_DPID;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000002000000080000003A464B5F44504944030000000000000000000000
      060000003A464B5F4944030000000000000000000000}
    Cursor = crSQLWait
    Left = 42
    Top = 4
  end
  object oqCheckNaznByDoc: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '  select DECODE(count(1),0,0,1) into :IsTrebByNaz from ASU.TNAZM' +
        'ED NM, MED.TTREB T WHERE T.fk_dpid = :DPID and NM.fk_treb = T.fk' +
        '_id;'
      'end;'
      '')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000020000000C0000003A49535452454242594E415A0300000004000000
      0000000000000000050000003A44504944030000000000000000000000}
    Left = 44
    Top = 50
  end
  object oqUpdateFC_SCHET_FAKTURA: TOracleQuery
    SQL.Strings = (
      'update med.tdocs d set d.FC_SCHET_FAKTURA = :pFC_SCHET_FAKTURA'
      ' where d.dpid = :pdpid')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A50445049440300000000000000000000001200
      00003A5046435F53434845545F46414B54555241050000000000000000000000}
    Left = 66
    Top = 216
  end
  object odsTDOCS: TOracleDataSet
    SQL.Strings = (
      
        'SELECT d.*, (SELECT max(fk_id) FROM med.ttreb t WHERE t.fk_dpid ' +
        '= d.dpid) fk_trebid FROM MED.TDOCS d WHERE d.dpid = :aDPID')
    Optimize = False
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000008000000504F535441564944010000000000070000004643
      5F4E414D450100000000000B00000046435F424F5353444F4C47010000000000
      0A00000046435F424F535346494F010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 170
    Top = 12
  end
  object odsTTREB: TOracleDataSet
    SQL.Strings = (
      
        'SELECT TTREB.*, MED.GET_TREBSTATUS(TTREB.fk_id) AS FK_PROCESSED ' +
        'FROM MED.TTREB WHERE FK_ID = :aFK_TREB')
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A41464B5F545245420300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000400000008000000504F535441564944010000000000070000004643
      5F4E414D450100000000000B00000046435F424F5353444F4C47010000000000
      0A00000046435F424F535346494F010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 240
    Top = 6
  end
  object odsTrebByDoc: TOracleDataSet
    SQL.Strings = (
      'SELECT TTREB.* FROM MED.TTREB WHERE FK_DPID = :aDPID')
    Optimize = False
    Variables.Data = {
      0300000001000000060000003A41445049440300000004000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000008000000504F535441564944010000000000070000004643
      5F4E414D450100000000000B00000046435F424F5353444F4C47010000000000
      0A00000046435F424F535346494F010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 314
    Top = 6
  end
  object odsKonractsList: TOracleDataSet
    SQL.Strings = (
      'SELECT d.fc_kontrakt'
      '    FROM med.tdocs d'
      '   WHERE d.fp_vidmove = 1 '
      '     and d.fc_kontrakt is not null '
      '     and d.FK_MOGROUPID_TO = MED.PKG_MEDSES.get_cur_mogroup     '
      '--and d.FK_SKLAD_ID = MED.PKG_MEDSES.get_cur_mo_sklad_id'
      'GROUP BY d.fc_kontrakt')
    ReadBuffer = 50
    Optimize = False
    QBEDefinition.QBEFieldDefs = {04000000010000000B00000046435F4B4F4E5452414B54010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 180
    Top = 400
  end
  object dsKonractsList: TDataSource
    DataSet = odsKonractsList
    Left = 276
    Top = 406
  end
  object dsSchetFaktura: TDataSource
    DataSet = odsSchetFaktura
    Left = 276
    Top = 346
  end
  object odsSchetFaktura: TOracleDataSet
    SQL.Strings = (
      'SELECT d.fc_schet_faktura'
      '    FROM med.tdocs d'
      '   WHERE d.fp_vidmove = 1 '
      '     and d.fc_schet_faktura is not null '
      '     and d.FK_MOGROUPID_TO = MED.PKG_MEDSES.get_cur_mogroup     '
      '--and d.FK_SKLAD_ID = MED.PKG_MEDSES.get_cur_mo_sklad_id'
      'GROUP BY d.fc_schet_faktura')
    ReadBuffer = 50
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000010000001000000046435F53434845545F46414B5455524101000000
      0000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 184
    Top = 342
  end
  object odsMO_GroupFrom: TOracleDataSet
    SQL.Strings = (
      'SELECT gr.groupid as FK_ID, gr.fc_group as FC_NAME, FK_SKLAD_ID'
      '  FROM med.tmo_group gr'
      'where '
      '  gr.fl_del = 0'
      'ORDER BY LOWER(gr.fc_group)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 184
    Top = 70
  end
  object odsMO_GroupTo: TOracleDataSet
    SQL.Strings = (
      
        'SELECT gr.groupid as FK_ID, gr.fc_group as FC_NAME, gr.FK_SKLAD_' +
        'ID, gr.fc_quota_code_1'
      '  FROM med.tmo_group gr,'
      
        '       (select c.*, p.* from med.tcross_table_check c, med.tcros' +
        's_table_params p'
      '        where (c.fk_key1 = med.pkg_medses.get_cur_mogroup) and'
      
        '              (c.fk_cross_params_id = p.fk_id) and p.fc_synonim ' +
        '= '#39'CROSS_VISIBLE_MO_GROUP'#39') cp'
      ''
      ' where gr.fl_del = 0'
      '   and gr.groupid = cp.fk_key2(+)'
      '   and nvl(cp.fn_value,1) = 1'
      ' ORDER BY LOWER(gr.fc_group)'
      ''
      
        '/*SELECT gr.groupid as FK_ID, gr.fc_group as FC_NAME, gr.FK_SKLA' +
        'D_ID, gr.fc_quota_code_1'
      '  FROM med.tmo_group gr'
      'where '
      '  gr.fl_del = 0'
      'ORDER BY LOWER(gr.fc_group)'
      '*/')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 186
    Top = 124
  end
  object odsPostav: TOracleDataSet
    SQL.Strings = (
      'SELECT POSTAVID as FK_ID, TPOSTAV.*'
      '  FROM MED.TPOSTAV TPOSTAV'
      '  WHERE FL_DEL = 0'
      
        '    AND (POSTAVID<>MED.PKGTPOSTAV.GET_PRODUCE_POSTAV or :RPO <> ' +
        '0)'
      '  ORDER BY LOWER(FC_NAME)')
    Optimize = False
    Variables.Data = {
      0300000001000000040000003A52504F03000000040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000008000000504F535441564944010000000000070000004643
      5F4E414D450100000000000B00000046435F424F5353444F4C47010000000000
      0A00000046435F424F535346494F010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 186
    Top = 178
  end
  object odsMO_TO: TOracleDataSet
    SQL.Strings = (
      'SELECT MOID as FK_ID, FC_NAME FROM MED.TMO'
      'ORDER BY UPPER(FC_NAME)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000046435F4E414D4501000000000005000000464B5F
      4944010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 184
    Top = 280
  end
  object odsMO_FROM: TOracleDataSet
    SQL.Strings = (
      'SELECT MOID as FK_ID, FC_NAME FROM MED.TMO'
      'ORDER BY UPPER(FC_NAME)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000046435F4E414D4501000000000005000000464B5F
      4944010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 188
    Top = 230
  end
  object dsMO_GroupFrom: TDataSource
    DataSet = odsMO_GroupFrom
    Left = 278
    Top = 68
  end
  object dsMO_GroupTo: TDataSource
    DataSet = odsMO_GroupTo
    Left = 280
    Top = 128
  end
  object dsPostav: TDataSource
    DataSet = odsPostav
    Left = 282
    Top = 180
  end
  object dsMO_FROM: TDataSource
    DataSet = odsMO_FROM
    Left = 280
    Top = 236
  end
  object dsMO_TO: TDataSource
    DataSet = odsMO_TO
    Left = 278
    Top = 292
  end
  object oqKartClear: TOracleQuery
    SQL.Strings = (
      'DELETE FROM MED.TDPC WHERE TDPC.DPID = :ADPID')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    Cursor = crSQLWait
    Left = 75
    Top = 286
  end
  object oqKartEnteredOst: TOracleQuery
    SQL.Strings = (
      'begin'
      '-- '#1085#1077#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099'  '#1088#1072#1089#1093#1086#1076
      'SELECT NVL(RES_KOL,0) INTO :RES_KOL'
      'FROM ('
      
        '      SELECT SUM(TDPC.FN_KOL) AS RES_KOL--, SUM(TDPC.FN_FAS) as ' +
        'RES_KOL_FAS'
      '      FROM'
      '         MED.TDOCS,'
      '         MED.TDPC'
      '      WHERE TDOCS.DPID = :ADPID'
      '        AND TDOCS.FL_EDIT <> 0'
      '        AND TDPC.DPID = TDOCS.DPID'
      '        AND TDPC.KARTID = :AKARTID'
      '      ); '
      ''
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A41445049440300000000000000000000000800
      00003A414B4152544944030000000000000000000000080000003A5245535F4B
      4F4C0400000008000000000000000000000000000000}
    Cursor = crSQLWait
    Left = 72
    Top = 340
  end
  object odsCheckSpisMedicOnGiven: TOracleDataSet
    SQL.Strings = (
      'select'
      ' NVL(mg.FK_NAZMARK, -1) as FK_NAZMARK'
      'from tmedicgiven mg'
      'where '
      '    mg.FK_DPCID = :DPCID')
    Optimize = False
    Variables.Data = {0300000001000000060000003A4450434944030000000000000000000000}
    Session = dmMain.os
    Left = 74
    Top = 248
  end
  object oqSetKartFinSource: TOracleQuery
    SQL.Strings = (
      'begin'
      '  UPDATE MED.TKART K '
      '  set K.FK_FINSOURCE_ID = :PFK_FINSOURCE_ID'
      
        '  where k.kartid in(SELECT dp.kartid from med.tdpc dp where dp.d' +
        'pid = :pDPID );'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000002000000110000003A50464B5F46494E534F555243455F4944030000
      000000000000000000060000003A5044504944030000000000000000000000}
    Cursor = crSQLWait
    Left = 74
    Top = 412
  end
  object odsProfil: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      '  FROM MED.TPROFIL'
      ' WHERE FL_DEL = 0'
      ' ORDER BY LOWER(FC_NAME)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000008000000504F535441564944010000000000070000004643
      5F4E414D450100000000000B00000046435F424F5353444F4C47010000000000
      0A00000046435F424F535346494F010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 186
    Top = 458
  end
  object dsProfil: TDataSource
    DataSet = odsProfil
    Left = 282
    Top = 460
  end
  object odsComment: TOracleDataSet
    SQL.Strings = (
      'SELECT d.fc_comment'
      '    FROM med.tdocs d'
      '   WHERE d.fp_vidmove = :pVidmove'
      '     AND d.fc_comment not like '#39'%'#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080'%'#39
      'GROUP BY d.fc_comment'
      'order by upper(fc_comment)')
    ReadBuffer = 50
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A505649444D4F56450300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000010000001000000046435F53434845545F46414B5455524101000000
      0000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 184
    Top = 518
  end
  object dsComment: TDataSource
    DataSet = odsComment
    Left = 268
    Top = 514
  end
end
