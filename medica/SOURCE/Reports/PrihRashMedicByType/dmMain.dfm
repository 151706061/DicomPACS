object fdmMain: TfdmMain
  OldCreateOrder = False
  Height = 476
  Width = 666
  object odsOstByMonth: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      'ROUND(SUM(A.FN_START_VspomSr),2) as FN_START_VspomSr,'
      'ROUND(SUM(A.FN_START_Med)    ,2) as FN_START_Med,'
      'ROUND(SUM(A.FN_START_Perev)  ,2) as FN_START_Perev,'
      'ROUND(SUM(A.FN_START_Tara)   ,2) as FN_START_Tara,'
      ''
      'ROUND(SUM(A.FN_END_VspomSr),2) as FN_END_VspomSr,'
      'ROUND(SUM(A.FN_END_Med)    ,2) as FN_END_Med,'
      'ROUND(SUM(A.FN_END_Perev)  ,2) as FN_END_Perev,'
      'ROUND(SUM(A.FN_END_Tara)   ,2) as FN_END_Tara'
      ''
      'FROM'
      '(SELECT '
      
        'CASE WHEN (TRUNC(D.FD_DATA) < TRUNC(:DATE1) AND LOWER(TRIM(UG.FC' +
        '_UCHGR)) LIKE '#39'%'#1074#1089#1087#1086#1084#1086#1075#1072#1090#1077#1083'%'#39') THEN K.FN_PRICE*C.FN_KOL*D.mnoj E' +
        'LSE 0 END AS FN_START_VspomSr,'
      
        'CASE WHEN (TRUNC(D.FD_DATA) < TRUNC(:DATE1) AND LOWER(TRIM(UG.FC' +
        '_UCHGR)) LIKE '#39'%'#1084#1077#1076#1080#1082#1072#1084'%'#39')     THEN K.FN_PRICE*C.FN_KOL*D.mnoj E' +
        'LSE 0 END AS FN_START_Med,'
      
        'CASE WHEN (TRUNC(D.FD_DATA) < TRUNC(:DATE1) AND LOWER(TRIM(UG.FC' +
        '_UCHGR)) LIKE '#39'%'#1087#1077#1088#1077#1074#1103#1079'%'#39')     THEN K.FN_PRICE*C.FN_KOL*D.mnoj E' +
        'LSE 0 END AS FN_START_Perev,'
      
        'CASE WHEN (TRUNC(D.FD_DATA) < TRUNC(:DATE1) AND LOWER(TRIM(UG.FC' +
        '_UCHGR)) = '#39#1090#1072#1088#1072#39')             THEN K.FN_PRICE*C.FN_KOL*D.mnoj E' +
        'LSE 0 END AS FN_START_Tara,'
      ''
      
        'CASE WHEN TRUNC(D.FD_DATA) <= TRUNC(:DATE2) AND LOWER(TRIM(UG.FC' +
        '_UCHGR)) LIKE '#39'%'#1074#1089#1087#1086#1084#1086#1075#1072#1090#1077#1083'%'#39' THEN K.FN_PRICE*C.FN_KOL*D.mnoj EL' +
        'SE 0 END AS FN_END_VspomSr,'
      
        'CASE WHEN TRUNC(D.FD_DATA) <= TRUNC(:DATE2) AND LOWER(TRIM(UG.FC' +
        '_UCHGR)) LIKE '#39'%'#1084#1077#1076#1080#1082#1072#1084'%'#39'     THEN K.FN_PRICE*C.FN_KOL*D.mnoj EL' +
        'SE 0 END AS FN_END_Med,'
      
        'CASE WHEN TRUNC(D.FD_DATA) <= TRUNC(:DATE2) AND LOWER(TRIM(UG.FC' +
        '_UCHGR)) LIKE '#39'%'#1087#1077#1088#1077#1074#1103#1079'%'#39'     THEN K.FN_PRICE*C.FN_KOL*D.mnoj EL' +
        'SE 0 END AS FN_END_Perev,'
      
        'CASE WHEN TRUNC(D.FD_DATA) <= TRUNC(:DATE2) AND LOWER(TRIM(UG.FC' +
        '_UCHGR)) = '#39#1090#1072#1088#1072#39'             THEN K.FN_PRICE*C.FN_KOL*D.mnoj EL' +
        'SE 0 END AS FN_END_Tara'
      'FROM (SELECT TDOCS.*, '
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUPID ) ' +
        'as mnoj             '
      '      FROM MED.TDOCS '
      '      WHERE TDOCS.FL_EDIT = 0'
      
        '        AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(TO_DATE('#39'01.01.20' +
        '00'#39', '#39'DD.MM.YYYY'#39')) AND TRUNC(:DATE2)'
      '        AND (not tdocs.FP_VIDMOVE in (4,5))'
      
        '        AND :MOGROUPID in (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGRO' +
        'UPID_FROM) '
      '        AND TDOCS.FP_VIDMOVE <> 6 -- '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072
      '      ) D,'
      '      MED.TDPC C, MED.TKART K, MED.TMEDIC M, MED.TUCHGR UG'
      'WHERE D.DPID = C.DPID'
      '  AND C.KARTID = K.KARTID'
      '  AND K.FL_DEL = 0'
      '  AND K.MEDICID = M.MEDICID'
      '  AND #uchgrid# = UG.UCHGRID'
      ') A')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445310C00000000000000000000000A00
      00003A4D4F47524F55504944030000000000000000000000060000003A444154
      45320C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000010000000464E5F53544152545F5653504F4D535201000000
      00000C000000464E5F53544152545F4D45440100000000000E000000464E5F53
      544152545F50455245560100000000000D000000464E5F53544152545F544152
      410100000000000E000000464E5F454E445F5653504F4D53520100000000000A
      000000464E5F454E445F4D45440100000000000C000000464E5F454E445F5045
      5245560100000000000B000000464E5F454E445F54415241010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 29
    Top = 14
  end
  object odsTSMINI: TOracleDataSet
    SQL.Strings = (
      
        'select sm.fk_id, sm.fc_section, sm.fc_key, sm.fc_value from asu.' +
        'tsmini sm'
      'where'
      ' UPPER(sm.fc_section) = UPPER(:aSection)'
      ' AND UPPER(sm.fc_key) = UPPER(:aKey)')
    Optimize = False
    Variables.Data = {
      0300000002000000090000003A4153454354494F4E0500000000000000000000
      00050000003A414B4559050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000A00000046435F5345
      4354494F4E0100000000000600000046435F4B45590100000000000800000046
      435F56414C5545010000000000}
    Cursor = crSQLWait
    Session = os
    Left = 450
    Top = 180
  end
  object odsPrihDocs: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      
        '  med.GET_DECODEDOCVIDMOVE(d.fp_vidmove)||'#39' '#8470' '#39'||D.fc_doc||'#39' '#1086#1090' ' +
        #39'||to_char(D.fd_invoice,'#39'dd.mm.yyyy'#39') AS fc_docmix,'
      '  B.*'
      '  '
      'FROM'
      'MED.TDOCS D,'
      '(SELECT '
      'A.DPID,'
      'ROUND(SUM(A.FN_VspomSr),2) as FN_VspomSr,'
      'ROUND(SUM(A.FN_Med),2) as FN_Med,'
      'ROUND(SUM(A.FN_Perev),2) as FN_Perev,'
      'ROUND(SUM(A.FN_Tara),2) as FN_Tara'
      ''
      'FROM'
      '(SELECT '
      'D.DPID,'
      
        'CASE WHEN LOWER(TRIM(UG.FC_UCHGR)) LIKE '#39'%'#1074#1089#1087#1086#1084#1086#1075#1072#1090#1077#1083'%'#39' THEN K.F' +
        'N_PRICE*C.FN_KOL ELSE 0 END AS FN_VspomSr,'
      
        'CASE WHEN LOWER(TRIM(UG.FC_UCHGR)) LIKE '#39'%'#1084#1077#1076#1080#1082#1072#1084'%'#39' THEN K.FN_PR' +
        'ICE*C.FN_KOL ELSE 0 END AS FN_Med,'
      
        'CASE WHEN LOWER(TRIM(UG.FC_UCHGR)) LIKE '#39'%'#1087#1077#1088#1077#1074#1103#1079'%'#39' THEN K.FN_PR' +
        'ICE*C.FN_KOL ELSE 0 END AS FN_Perev,'
      
        'CASE WHEN LOWER(TRIM(UG.FC_UCHGR)) = '#39#1090#1072#1088#1072#39' THEN K.FN_PRICE*C.FN' +
        '_KOL ELSE 0 END AS FN_Tara'
      'FROM (SELECT TDOCS.*, '
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUPID ) ' +
        'as mnoj             '
      '      FROM MED.TDOCS '
      '      WHERE TDOCS.FL_EDIT = 0'
      
        '        AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(TO_DATE(:DATE1)) ' +
        'AND TRUNC(TO_DATE(:DATE2))'
      '--        AND TDOCS.FP_VIDMOVE <> 6 -- '#1090#1086#1083#1100#1082#1086' '#1085#1077' '#1074#1086#1079#1074#1088#1072#1090
      '        AND (not TDOCS.FP_VIDMOVE in (4,5))'
      
        '        AND :MOGROUPID in (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGRO' +
        'UPID_FROM) '
      '      ) D,'
      '      MED.TDPC C, MED.TKART K, MED.TMEDIC M, MED.TUCHGR UG'
      'WHERE D.DPID = C.DPID'
      '  AND D.mnoj > 0'
      ''
      '  AND C.KARTID = K.KARTID'
      '  AND K.FL_DEL = 0'
      '  AND K.MEDICID = M.MEDICID'
      '  AND #uchgrid# = UG.UCHGRID'
      ') A'
      'GROUP BY DPID'
      ')B'
      'WHERE D.DPID = B.DPID'
      
        'AND(FN_VspomSr <> 0 or FN_Med <> 0 or FN_Perev <> 0 or FN_Tara <' +
        '> 0)'
      ''
      'ORDER BY D.fd_data --UPPER(FC_UCHGR)'
      '')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445320C00000000000000000000000600
      00003A44415445310C00000000000000000000000A0000003A4D4F47524F5550
      4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000900000046435F444F434D49580100000000000400000044
      5049440100000000000A000000464E5F5653504F4D5352010000000000060000
      00464E5F4D454401000000000008000000464E5F504552455601000000000007
      000000464E5F54415241010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 109
    Top = 12
  end
  object odsServerDate: TOracleDataSet
    SQL.Strings = (
      'select sysdate from dual')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {04000000010000000700000053595344415445010000000000}
    Session = os
    Left = 452
    Top = 126
  end
  object odsNacenkaUcenka: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '    SUM(A.FN_NACHENKA) as FN_NACHENKA,'
      '    SUM(FN_UCHENKA) as FN_UCHENKA'
      'FROM ('
      '    SELECT '
      '    FD_DATA,'
      '/*    FK_ID,'
      '    FK_MEDICID,'
      '    FC_NAME,'
      '    FC_SERIAL,'
      '    FC_UEDIZM, '
      '    FN_NUMBER,'
      '    FN_AMOUNT,'
      '    FN_FPACKINUPACK,'
      '    FN_PRICE_FOR_1,'
      '    FN_SUMMA_TRUNCED,'
      '    FN_SUMMA,'
      '    FN_SUMMA_FOR_INGRIDIENTS,*/'
      '    CASE WHEN FN_SUMMA_FOR_INGRIDIENTS<=FN_SUMMA'
      '     THEN ROUND(FN_SUMMA-FN_SUMMA_FOR_INGRIDIENTS,2)'
      '     ELSE 0 end FN_NACHENKA,'
      '    CASE WHEN FN_SUMMA_FOR_INGRIDIENTS>FN_SUMMA'
      '     THEN ROUND(FN_SUMMA_FOR_INGRIDIENTS-FN_SUMMA,2)'
      '     ELSE 0 end FN_UCHENKA/*,'
      
        '    FN_AMOUNT AS FN_AMOUNT_POLUCHENO, -- '#1055#1054#1051#1059#1063#1045#1053#1054#1045' '#1050#1054#1051'-'#1042#1054', '#1053#1054' '#1058#1040 +
        #1050' '#1050#1040#1050' '#1059' '#1053#1040#1057' '#1053#1045' '#1052#1054#1046#1045#1058' '#1041#1067#1058#1068' '#1076#1077#1083#1092#1080' '#1085#1077' '#1076#1072#1089#1090' '#1089#1086#1079#1076#1072#1090#1100' '#1073#1086#1083#1100#1096#1077' '#1087#1088#1086#1080#1079#1074#1086#1076#1080 +
        #1084#1086#1075#1086' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072', '#1095#1077#1084' '#1077#1089#1090#1100' '#1076#1083#1103' '#1085#1077#1075#1086' '#1080#1085#1075#1088#1080#1076#1080#1077#1085#1090#1086#1074', '#1090#1086' '#1082#1086#1083'-'#1074#1086' '#1080' '#1087#1086 +
        #1083#1091#1095#1077#1085#1086' '#1088#1072#1074#1085#1086'.'
      '    FL_EDIT,'
      '    DECODE(FL_EDIT,0,'#39#1044#1072#39',1,'#39#1053#1077#1090#39') AS PODPISAN,'
      '    fk_doc_prih,'
      '    fk_doc_rash*/'
      'FROM'
      '('
      'SELECT'
      '    ROWNUM,'
      '    FK_ID,'
      '    FD_DATA,'
      '    FK_MEDICID,'
      '    FC_NAME,'
      '    FC_SERIAL,'
      '    FC_UEDIZM,'
      '    FN_NUMBER, '
      '    FN_AMOUNT,'
      '    FN_FPACKINUPACK,'
      ''
      '    DETAIL2.FN_SUMMA_FOR_INGRIDIENTS,'
      
        '    ROUND(DETAIL2.FN_SUMMA_FOR_INGRIDIENTS / MASTER2.FN_AMOUNT,2' +
        ') AS FN_PRICE_FOR_1,'
      
        '    ROUND(ROUND(DETAIL2.FN_SUMMA_FOR_INGRIDIENTS / MASTER2.FN_AM' +
        'OUNT,2) * MASTER2.FN_AMOUNT,2) AS FN_SUMMA_TRUNCED, -- '#1054#1050#1056#1059#1043#1051#1045#1053#1053 +
        #1040#1071
      
        '    ROUND(ROUND(DETAIL2.FN_SUMMA_FOR_INGRIDIENTS / MASTER2.FN_AM' +
        'OUNT,2) * MASTER2.FN_AMOUNT,2) AS FN_SUMMA,'
      '    FL_EDIT,'
      '    fk_doc_prih,'
      '   fk_doc_rash'
      '  FROM'
      '   ('
      'SELECT'
      '    ROWNUM,'
      '    KS.FK_ID,'
      '    KS.FD_DATA,'
      '    KS.FK_MEDICID,'
      '    M.FC_NAME,'
      '    KS.FC_SERIAL,'
      '    TEI.FC_NAME AS FC_UEDIZM, '
      '    KS.FN_NUMBER,'
      '    KS.FN_AMOUNT,'
      '    M.FN_FPACKINUPACK,'
      '    KS.FL_EDIT,'
      '    KS.fk_doc_prih,'
      '    KS.fk_doc_rash'
      '        '
      '  FROM MED.TKARTCOMPOS KS, MED.TMEDIC M, MED.TEI'
      '  WHERE KS.FK_MEDICID=M.MEDICID (+)'
      
        '    AND TRUNC(KS.FD_DATA) BETWEEN TRUNC(TO_DATE(:DATE1)) AND TRU' +
        'NC(TO_DATE(:DATE2))'
      '    AND M.EIID = TEI.EIID (+)'
      '  ORDER BY ROWNUM'
      '   '
      ''
      ''
      '   )MASTER2,'
      '   ('
      'SELECT  '
      '    FK_TKARTCOMPOSID,'
      '    SUM(FN_SUMMA) AS FN_SUMMA_FOR_INGRIDIENTS '
      '  FROM  '
      '(SELECT'
      '    MASTER1.FK_TKARTCOMPOSID,'
      '--    MASTER1.FK_KART_ITEM,'
      '--    DETAIL1.FN_PRICE,'
      '    Round(DETAIL1.FN_PRICE * MASTER1.FN_AMOUNT,2) AS FN_SUMMA'
      '  FROM'
      '   (SELECT'
      '        K_ITEM.FK_TKARTCOMPOSID,'
      '        K_ITEM.FK_KART_ITEM,'
      '        K_ITEM.FN_AMOUNT'
      '      FROM'
      '        MED.TKARTCO_ITEM K_ITEM,'
      '        MED.TKARTCOMPOS KS'
      '      WHERE KS.FK_ID=K_ITEM.FK_TKARTCOMPOSID'
      
        '       AND TRUNC(KS.FD_DATA) BETWEEN TRUNC(TO_DATE(:DATE1)) AND ' +
        'TRUNC(TO_DATE(:DATE2))'
      ''
      '   )MASTER1,'
      '   ('
      '     SELECT Q.*--, NVL( ROUND(OST.FN_PRICE,2) ,0) AS FN_PRICE  '
      '       FROM'
      '       (SELECT'
      '          TKART.KARTID,'
      '          TKART.FN_PRICE,'
      '          TMEDIC.FN_FPACKINUPACK'
      
        '         FROM  MED.TKART,  MED.TMO,  MED.TMEDIC, (SELECT T.MOID ' +
        'FROM MED.TMO T'
      '               START WITH T.MOID = MED.PKG_MEDSES.GET_CURMO'
      '               CONNECT BY PRIOR T.MOID = T.FK_PARENT) A'
      '         WHERE  TKART.FL_DEL = 0'
      '           AND  TKART.MOID = TMO.MOID'
      '           AND  TKART.MEDICID = TMEDIC.MEDICID'
      '          '#9'AND  A.MOID = TKART.MOID'
      '        UNION'
      '        SELECT'
      '          TKART.KARTID,'
      '          TKART.FN_PRICE,          '
      '          TMEDIC.FN_FPACKINUPACK'
      
        '         FROM  MED.TKART , MED.TMO, MED.TMEDIC, MED.TDPC, MED.TD' +
        'OCS'
      '         WHERE    TKART.FL_DEL = 0'
      '           AND    TKART.MOID = TMO.MOID'
      '           AND    TKART.MEDICID = TMEDIC.MEDICID'
      '           AND    TDPC.DPID = TDOCS.DPID'
      '           AND    TDPC.KARTID = TKART.KARTID'
      '-- '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1103' '#1079#1072#1087#1080#1089#1077#1081
      '           AND    TDOCS.fk_mogroupid_to = :MOGROUPID) Q'
      '--           AND TDOCS.MOTOID = MED.PKG_MEDSES.GET_CURMO) Q'
      ''
      '      WHERE '
      '           Q.KARTID IN (SELECT DISTINCT K_ITEM.FK_KART_ITEM'
      
        '                           FROM MED.TKARTCO_ITEM K_ITEM, MED.TKA' +
        'RTCOMPOS KS'
      
        '                           WHERE KS.FK_ID=K_ITEM.FK_TKARTCOMPOSI' +
        'D'
      
        '                             AND TRUNC(KS.FD_DATA) BETWEEN TRUNC' +
        '(TO_DATE(:DATE1)) AND TRUNC(TO_DATE(:DATE2))'
      '                        )    '
      '   ) DETAIL1'
      '  WHERE DETAIL1.KARTID = MASTER1.FK_KART_ITEM '
      ')  '
      'GROUP BY FK_TKARTCOMPOSID  '
      '      '
      '      '
      '   ) DETAIL2'
      '  WHERE MASTER2.FK_ID = DETAIL2.FK_TKARTCOMPOSID(+)'
      ')  '
      
        'WHERE TRUNC(FD_DATA) BETWEEN TRUNC(TO_DATE(:DATE1)) AND TRUNC(TO' +
        '_DATE(:DATE2))'
      '--ORDER BY FD_DATA ASC'
      ') A'
      ''
      '')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445310C00000000000000000000000600
      00003A44415445320C00000000000000000000000A0000003A4D4F47524F5550
      4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000B000000464E5F4E414348454E4B410100000000000A0000
      00464E5F554348454E4B41010000000000}
    Cursor = crSQLWait
    Session = os
    Left = 196
    Top = 8
  end
  object odsRashDocs: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      
        '  med.GET_DECODEDOCVIDMOVE(d.fp_vidmove)||'#39' '#8470' '#39'||D.fc_doc||'#39' '#1086#1090' ' +
        #39'||to_char(D.fd_invoice,'#39'dd.mm.yyyy'#39') AS fc_docmix,'
      '  B.*'
      '  '
      'FROM'
      'MED.TDOCS D,'
      '(SELECT '
      'A.DPID,'
      'ROUND(SUM(A.FN_VspomSr),2) as FN_VspomSr,'
      'ROUND(SUM(A.FN_Med),2) as FN_Med,'
      'ROUND(SUM(A.FN_Perev),2) as FN_Perev,'
      'ROUND(SUM(A.FN_Tara),2) as FN_Tara'
      ''
      'FROM'
      '(SELECT '
      'D.DPID,'
      
        'CASE WHEN LOWER(TRIM(UG.FC_UCHGR)) LIKE '#39'%'#1074#1089#1087#1086#1084#1086#1075#1072#1090#1077#1083'%'#39' THEN K.F' +
        'N_PRICE*C.FN_KOL ELSE 0 END AS FN_VspomSr,'
      
        'CASE WHEN LOWER(TRIM(UG.FC_UCHGR)) LIKE '#39'%'#1084#1077#1076#1080#1082#1072#1084'%'#39' THEN K.FN_PR' +
        'ICE*C.FN_KOL ELSE 0 END AS FN_Med,'
      
        'CASE WHEN LOWER(TRIM(UG.FC_UCHGR)) LIKE '#39'%'#1087#1077#1088#1077#1074#1103#1079'%'#39' THEN K.FN_PR' +
        'ICE*C.FN_KOL ELSE 0 END AS FN_Perev,'
      
        'CASE WHEN LOWER(TRIM(UG.FC_UCHGR)) = '#39#1090#1072#1088#1072#39' THEN K.FN_PRICE*C.FN' +
        '_KOL ELSE 0 END AS FN_Tara'
      'FROM (SELECT TDOCS.*, '
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUPID ) ' +
        'as mnoj             '
      '      FROM MED.TDOCS '
      '      WHERE TDOCS.FL_EDIT = 0'
      '        AND (not tdocs.FP_VIDMOVE in (4,5))'
      
        '        AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC' +
        '(:DATE2)'
      '--        AND TDOCS.FP_VIDMOVE in (7,8) -- '#1090#1086#1083#1100#1082#1086' '#1089#1087#1080#1089#1072#1085#1080#1103
      '        AND TDOCS.FP_VID = 3'
      
        '        AND :MOGROUPID in (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGRO' +
        'UPID_FROM) '
      '      ) D,'
      '      MED.TDPC C, MED.TKART K, MED.TMEDIC M, MED.TUCHGR UG'
      'WHERE D.DPID = C.DPID'
      '  AND D.mnoj < 0'
      '  AND C.KARTID = K.KARTID'
      '  AND K.FL_DEL = 0'
      '  AND K.MEDICID = M.MEDICID'
      '  AND #uchgrid# = UG.UCHGRID'
      ') A'
      'GROUP BY DPID'
      ')B'
      'WHERE D.DPID = B.DPID'
      
        'AND(FN_VspomSr <> 0 or FN_Med <> 0 or FN_Perev <> 0 or FN_Tara <' +
        '> 0)'
      ''
      ''
      'ORDER BY D.fd_data --UPPER(FC_UCHGR)')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445320C00000000000000000000000600
      00003A44415445310C00000000000000000000000A0000003A4D4F47524F5550
      4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000900000046435F444F434D49580100000000000400000044
      5049440100000000000A000000464E5F5653504F4D5352010000000000060000
      00464E5F4D454401000000000008000000464E5F504552455601000000000007
      000000464E5F54415241010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 283
    Top = 4
  end
  object odsRashTreb: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      'ROUND(SUM(A.FN_VspomSr),2) as FN_VspomSr,'
      'ROUND(SUM(A.FN_Med),2) as FN_Med,'
      'ROUND(SUM(A.FN_Perev),2) as FN_Perev,'
      'ROUND(SUM(A.FN_Tara),2) as FN_Tara'
      ''
      'FROM'
      '(SELECT '
      
        'CASE WHEN LOWER(TRIM(UG.FC_UCHGR)) LIKE '#39'%'#1074#1089#1087#1086#1084#1086#1075#1072#1090#1077#1083'%'#39' THEN K.F' +
        'N_PRICE*C.FN_KOL ELSE 0 END AS FN_VspomSr,'
      
        'CASE WHEN LOWER(TRIM(UG.FC_UCHGR)) LIKE '#39'%'#1084#1077#1076#1080#1082#1072#1084'%'#39' THEN K.FN_PR' +
        'ICE*C.FN_KOL ELSE 0 END AS FN_Med,'
      
        'CASE WHEN LOWER(TRIM(UG.FC_UCHGR)) LIKE '#39'%'#1087#1077#1088#1077#1074#1103#1079'%'#39' THEN K.FN_PR' +
        'ICE*C.FN_KOL ELSE 0 END AS FN_Perev,'
      
        'CASE WHEN LOWER(TRIM(UG.FC_UCHGR)) = '#39#1090#1072#1088#1072#39' THEN K.FN_PRICE*C.FN' +
        '_KOL ELSE 0 END AS FN_Tara'
      'FROM (SELECT TDOCS.*, '
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUPID ) ' +
        'as mnoj             '
      '      FROM MED.TDOCS '
      '      WHERE TDOCS.FL_EDIT = 0'
      '        AND (not tdocs.FP_VIDMOVE in (4,5))'
      
        '        AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC' +
        '(:DATE2)'
      '        AND TDOCS.FP_VIDMOVE in (2,3) -- '#1090#1086#1083#1100#1082#1086' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103
      
        '        AND :MOGROUPID in (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGRO' +
        'UPID_FROM) '
      '      ) D,'
      '      MED.TDPC C, MED.TKART K, MED.TMEDIC M, MED.TUCHGR UG'
      'WHERE D.DPID = C.DPID'
      '  AND D.mnoj < 0'
      '  AND C.KARTID = K.KARTID'
      '  AND K.FL_DEL = 0'
      '  AND K.MEDICID = M.MEDICID'
      '  AND #uchgrid# = UG.UCHGRID'
      ') A'
      '')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445320C00000000000000000000000600
      00003A44415445310C00000000000000000000000A0000003A4D4F47524F5550
      4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000A000000464E5F5653504F4D535201000000000006000000
      464E5F4D454401000000000008000000464E5F50455245560100000000000700
      0000464E5F54415241010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 364
    Top = 4
  end
  object odsGroupMo: TOracleDataSet
    SQL.Strings = (
      'SELECT * from'
      '(SELECT groupid, fc_group, fl_del, 0 as FN_ORDER'
      
        'FROM med.tmo_group WHERE (fl_del = 0) and (UPPER(fc_group) like ' +
        #39'%'#1040#1055#1058#1045#1050#1040'%'#39')'
      'UNION'
      'SELECT groupid, fc_group, fl_del, 1 as FN_ORDER'
      
        'FROM med.tmo_group WHERE fl_del = 0 and (not (UPPER(fc_group) li' +
        'ke '#39'%'#1040#1055#1058#1045#1050#1040'%'#39'))'
      ')'
      'ORDER BY FN_ORDER, UPPER(fc_group)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000040000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C0100000000000800000046
      4E5F4F52444552010000000000}
    Session = os
    Left = 446
    Top = 3
  end
  object dsGroupMo: TDataSource
    DataSet = odsGroupMo
    Left = 448
    Top = 63
  end
  object os: TOracleSession
    LogonDatabase = 'ASU'
    Left = 448
    Top = 254
  end
  object frDBRashTreb: TfrxDBDataset
    UserName = 'odsRashTreb'
    CloseDataSource = False
    DataSet = odsRashTreb
    BCDToCurrency = False
    Left = 363
    Top = 61
  end
  object frDBRashDocs: TfrxDBDataset
    UserName = 'odsRashDocs'
    CloseDataSource = False
    DataSet = odsRashDocs
    BCDToCurrency = False
    Left = 285
    Top = 69
  end
  object frDBNacenkaUcenka: TfrxDBDataset
    UserName = 'odsNacenkaUcenka'
    CloseDataSource = False
    DataSet = odsNacenkaUcenka
    BCDToCurrency = False
    Left = 195
    Top = 71
  end
  object frDBPrihDocs: TfrxDBDataset
    UserName = 'odsPrihDocs'
    CloseDataSource = False
    DataSet = odsPrihDocs
    BCDToCurrency = False
    Left = 111
    Top = 65
  end
  object frDBOstByMonth: TfrxDBDataset
    UserName = 'odsOstByMonth'
    CloseDataSource = False
    DataSet = odsOstByMonth
    BCDToCurrency = False
    Left = 31
    Top = 65
  end
  object odsPrihDocs_GR_LF: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      
        ' -- med.GET_DECODEDOCVIDMOVE(d.fp_vidmove)||'#39' '#8470' '#39'||D.fc_doc||'#39' '#1086 +
        #1090' '#39'||to_char(D.fd_invoice,'#39'dd.mm.yyyy'#39') AS fc_docmix,'
      '  B.*'
      ' '
      'FROM'
      '(SELECT '
      'A.fc_postav,'
      'SUM(A.FN_ANGRO) as FN_ANGRO,'
      'SUM(A.FN_GLF) as FN_GLF,'
      'SUM(A.FN_Perev) as FN_Perev,'
      'SUM(A.FN_EXTEMPOR) as FN_EXTEMPOR,'
      'SUM(A.FN_RASHODNIK) as FN_RASHODNIK,'
      'SUM(A.FN_ALL_SUM) as FN_ALL_SUM'
      ''
      'FROM'
      '(SELECT '
      'D.fc_postav, '
      
        'CASE WHEN GLF.FC_SYNONIM = '#39'ANGRO'#39' THEN K.FN_PRICE*C.FN_KOL ELSE' +
        ' 0 END AS FN_ANGRO,'
      
        'CASE WHEN GLF.FC_SYNONIM = '#39'GLF'#39' THEN K.FN_PRICE*C.FN_KOL ELSE 0' +
        ' END AS FN_GLF,'
      
        'CASE WHEN GLF.FC_SYNONIM = '#39'PEREV'#39' THEN K.FN_PRICE*C.FN_KOL ELSE' +
        ' 0 END AS FN_Perev,'
      
        'CASE WHEN GLF.FC_SYNONIM = '#39'EXTEMPOR'#39' THEN K.FN_PRICE*C.FN_KOL E' +
        'LSE 0 END AS FN_EXTEMPOR,'
      
        'CASE WHEN GLF.FC_SYNONIM = '#39'RASHODNIK'#39' THEN K.FN_PRICE*C.FN_KOL ' +
        'ELSE 0 END AS FN_RASHODNIK,'
      ''
      'K.FN_PRICE*C.FN_KOL as FN_ALL_SUM'
      ''
      'FROM (SELECT TDOCS.DPID, p.fc_name as fc_postav,'
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUPID ) ' +
        'as mnoj             '
      '      FROM MED.TDOCS,  MED.TPOSTAV P'
      '      WHERE TDOCS.FL_EDIT = 0'
      
        '        AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC' +
        '(:DATE2)'
      '        AND TDOCS.FP_VIDMOVE <> 6 -- '#1090#1086#1083#1100#1082#1086' '#1085#1077' '#1074#1086#1079#1074#1088#1072#1090
      '        AND (not TDOCS.FP_VIDMOVE in (4,5))'
      
        '        AND :MOGROUPID in (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGRO' +
        'UPID_FROM) '
      '        AND TDOCS.postavid = p.postavid(+)'
      '      ) D,'
      '      MED.TDPC C, MED.TKART K, MED.TMEDIC M, med.TGROUP_LF GLF'
      'WHERE D.DPID = C.DPID'
      '  AND D.mnoj > 0'
      ''
      '  AND C.KARTID = K.KARTID'
      '  AND K.FL_DEL = 0'
      '  AND K.MEDICID = M.MEDICID'
      '  AND M.FK_GROUP_LF = GLF.FK_GROUP_LF_ID(+)'
      ') A'
      'GROUP BY A.fc_postav'
      ')B'
      
        'WHERE  FN_ALL_SUM <> 0 --(FN_ANGRO<>0) or (FN_GLF<>0) or (FN_Per' +
        'ev<>0) or (FN_EXTEMPOR<>0) or (FN_RASHODNIK<>0)'
      ''
      'ORDER BY B.fc_postav')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445320C00000007000000786D031F0101
      0100000000060000003A44415445310C00000007000000786D03010101010000
      00000A0000003A4D4F47524F5550494403000000040000009D04000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000008000000464E5F504552455601000000000007000000464E
      5F544152410100000000000900000046435F504F535441560100000000000800
      0000464E5F414E47524F01000000000006000000464E5F474C46010000000000
      0B000000464E5F455854454D504F520100000000000A000000464E5F414C4C5F
      53554D010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 109
    Top = 156
  end
  object odsOstByMonth_GR_LF: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      'SUM(A.FN_START_ANGRO)     as FN_START_ANGRO,'
      'SUM(A.FN_START_GLF)       as FN_START_GLF,'
      'SUM(A.FN_START_Perev)     as FN_START_Perev,'
      'SUM(A.FN_START_EXTEMPOR)  as FN_START_EXTEMPOR,'
      'SUM(A.FN_START_RASHODNIK) as FN_START_RASHODNIK,'
      'SUM(A.FN_START_ALL)       as FN_START_ALL,'
      ''
      ''
      'SUM(A.FN_END_ANGRO)     as FN_END_ANGRO,'
      'SUM(A.FN_END_GLF)       as FN_END_GLF,'
      'SUM(A.FN_END_Perev)     as FN_END_Perev,'
      'SUM(A.FN_END_EXTEMPOR)  as FN_END_EXTEMPOR,'
      'SUM(A.FN_END_RASHODNIK) as FN_END_RASHODNIK,'
      'SUM(A.FN_END_ALL)       as FN_END_ALL'
      ''
      ''
      'FROM'
      '(SELECT '
      
        'CASE WHEN D.TRUNC_FD_DATA < TRUNC(:date1) AND GLF.FC_SYNONIM = '#39 +
        'ANGRO'#39' THEN K.FN_PRICE*C.FN_KOL*d.mnoj ELSE 0 END AS FN_START_AN' +
        'GRO,'
      
        'CASE WHEN D.TRUNC_FD_DATA < TRUNC(:date1) AND GLF.FC_SYNONIM = '#39 +
        'GLF'#39' THEN K.FN_PRICE*C.FN_KOL*d.mnoj ELSE 0 END AS FN_START_GLF,'
      
        'CASE WHEN D.TRUNC_FD_DATA < TRUNC(:date1) AND GLF.FC_SYNONIM = '#39 +
        'PEREV'#39' THEN K.FN_PRICE*C.FN_KOL*d.mnoj ELSE 0 END AS FN_START_Pe' +
        'rev,'
      
        'CASE WHEN D.TRUNC_FD_DATA < TRUNC(:date1) AND GLF.FC_SYNONIM = '#39 +
        'EXTEMPOR'#39' THEN K.FN_PRICE*C.FN_KOL*d.mnoj ELSE 0 END AS FN_START' +
        '_EXTEMPOR,'
      
        'CASE WHEN D.TRUNC_FD_DATA < TRUNC(:date1) AND GLF.FC_SYNONIM = '#39 +
        'RASHODNIK'#39' THEN K.FN_PRICE*C.FN_KOL*d.mnoj ELSE 0 END AS FN_STAR' +
        'T_RASHODNIK,'
      
        'CASE WHEN D.TRUNC_FD_DATA < TRUNC(:date1) THEN K.FN_PRICE*C.FN_K' +
        'OL*d.mnoj ELSE 0 END AS FN_START_ALL,'
      ''
      ''
      
        'CASE WHEN D.TRUNC_FD_DATA <= TRUNC(:date2) AND GLF.FC_SYNONIM = ' +
        #39'ANGRO'#39' THEN K.FN_PRICE*C.FN_KOL*d.mnoj ELSE 0 END AS FN_END_ANG' +
        'RO,'
      
        'CASE WHEN D.TRUNC_FD_DATA <= TRUNC(:date2) AND GLF.FC_SYNONIM = ' +
        #39'GLF'#39' THEN K.FN_PRICE*C.FN_KOL*d.mnoj ELSE 0 END AS FN_END_GLF,'
      
        'CASE WHEN D.TRUNC_FD_DATA <= TRUNC(:date2) AND GLF.FC_SYNONIM = ' +
        #39'PEREV'#39' THEN K.FN_PRICE*C.FN_KOL*d.mnoj ELSE 0 END AS FN_END_Per' +
        'ev,'
      
        'CASE WHEN D.TRUNC_FD_DATA <= TRUNC(:date2) AND GLF.FC_SYNONIM = ' +
        #39'EXTEMPOR'#39' THEN K.FN_PRICE*C.FN_KOL*d.mnoj ELSE 0 END AS FN_END_' +
        'EXTEMPOR,'
      
        'CASE WHEN D.TRUNC_FD_DATA <= TRUNC(:date2) AND GLF.FC_SYNONIM = ' +
        #39'RASHODNIK'#39' THEN K.FN_PRICE*C.FN_KOL*d.mnoj ELSE 0 END AS FN_END' +
        '_RASHODNIK,'
      
        'CASE WHEN D.TRUNC_FD_DATA <= TRUNC(:date2) THEN K.FN_PRICE*C.FN_' +
        'KOL*d.mnoj ELSE 0 END AS FN_END_ALL'
      ''
      'FROM (SELECT TDOCS.*, TRUNC(FD_DATA) as TRUNC_FD_DATA,'
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUPID ) ' +
        'as mnoj             '
      '      FROM MED.TDOCS '
      '      WHERE TDOCS.FL_EDIT = 0'
      
        '        AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(TO_DATE('#39'01.01.20' +
        '00'#39', '#39'DD.MM.YYYY'#39')) AND TRUNC(:date2)'
      '        AND (not tdocs.FP_VIDMOVE in (4,5))'
      
        '        AND :MOGROUPID in (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGRO' +
        'UPID_FROM) '
      '        AND TDOCS.FP_VIDMOVE <> 6 -- ????? ????????'
      '      ) D,'
      '      MED.TDPC C, MED.TKART K, MED.TMEDIC M, med.TGROUP_LF GLF'
      'WHERE D.DPID = C.DPID'
      '  AND C.KARTID = K.KARTID'
      '  AND K.FL_DEL = 0'
      '  AND K.MEDICID = M.MEDICID'
      '  AND M.FK_GROUP_LF = GLF.FK_GROUP_LF_ID(+)'
      ') A')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445310C00000000000000000000000A00
      00003A4D4F47524F55504944030000000000000000000000060000003A444154
      45320C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000E000000464E5F53544152545F5045524556010000000000
      0D000000464E5F53544152545F544152410100000000000C000000464E5F454E
      445F50455245560100000000000B000000464E5F454E445F5441524101000000
      00000E000000464E5F53544152545F414E47524F0100000000000C000000464E
      5F53544152545F474C4601000000000011000000464E5F53544152545F455854
      454D504F520100000000000C000000464E5F454E445F414E47524F0100000000
      000A000000464E5F454E445F474C460100000000000F000000464E5F454E445F
      455854454D504F52010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 29
    Top = 158
  end
  object odsRashDocs_GR_LF: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      
        '--  med.GET_DECODEDOCVIDMOVE(d.fp_vidmove)||'#39' ? '#39'||D.fc_doc||'#39' ?' +
        '? '#39'||to_char(D.fd_invoice,'#39'dd.mm.yyyy'#39') AS fc_docmix,'
      '  B.*'
      '  '
      'FROM'
      '(SELECT '
      'A.fc_postav,'
      'SUM(A.FN_ANGRO) as FN_ANGRO,'
      'SUM(A.FN_GLF) as FN_GLF,'
      'SUM(A.FN_Perev) as FN_Perev,'
      'SUM(A.FN_EXTEMPOR) as FN_EXTEMPOR,'
      'SUM(A.FN_RASHODNIK) as FN_RASHODNIK,'
      'SUM(A.FN_ALL_SUM) as FN_ALL_SUM'
      ''
      'FROM'
      '(SELECT '
      'nvl(D.fc_postav, '#39#1056#1072#1089#1093#1086#1076' '#1085#1072' '#1089#1090#1086#1088#1086#1085#1091#39') as fc_postav,'
      
        'CASE WHEN GLF.FC_SYNONIM = '#39'ANGRO'#39' THEN K.FN_PRICE*C.FN_KOL ELSE' +
        ' 0 END AS FN_ANGRO,'
      
        'CASE WHEN GLF.FC_SYNONIM = '#39'GLF'#39' THEN K.FN_PRICE*C.FN_KOL ELSE 0' +
        ' END AS FN_GLF,'
      
        'CASE WHEN GLF.FC_SYNONIM = '#39'PEREV'#39' THEN K.FN_PRICE*C.FN_KOL ELSE' +
        ' 0 END AS FN_Perev,'
      
        'CASE WHEN GLF.FC_SYNONIM = '#39'EXTEMPOR'#39' THEN K.FN_PRICE*C.FN_KOL E' +
        'LSE 0 END AS FN_EXTEMPOR,'
      
        'CASE WHEN GLF.FC_SYNONIM = '#39'RASHODNIK'#39' THEN K.FN_PRICE*C.FN_KOL ' +
        'ELSE 0 END AS FN_RASHODNIK,'
      'K.FN_PRICE*C.FN_KOL as FN_ALL_SUM'
      ''
      'FROM (SELECT TDOCS.DPID, p.fc_name as fc_postav,'
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUPID ) ' +
        'as mnoj             '
      '      FROM MED.TDOCS, MED.TPOSTAV P'
      '      WHERE TDOCS.FL_EDIT = 0'
      
        '        AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC' +
        '(:DATE2)'
      '--        AND TDOCS.FP_VID = 3'
      '        AND (not tdocs.FP_VIDMOVE in (4,5))  '
      
        '        AND :MOGROUPID in (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGRO' +
        'UPID_FROM) '
      '        AND TDOCS.postavid = p.postavid(+)'
      '      ) D,'
      '      MED.TDPC C, MED.TKART K, MED.TMEDIC M, med.TGROUP_LF GLF'
      'WHERE D.DPID = C.DPID'
      '  AND D.mnoj < 0'
      '  AND C.KARTID = K.KARTID'
      '  AND K.FL_DEL = 0'
      '  AND K.MEDICID = M.MEDICID'
      '  AND M.FK_GROUP_LF = GLF.FK_GROUP_LF_ID(+)'
      ') A'
      'GROUP BY A.fc_postav'
      ')B'
      
        'WHERE (FN_ANGRO<>0 or FN_GLF<>0 or FN_Perev<>0 or FN_EXTEMPOR<>0' +
        ' or FN_RASHODNIK<>0)'
      ''
      'ORDER BY B.fc_postav')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445320C00000000000000000000000600
      00003A44415445310C00000000000000000000000A0000003A4D4F47524F5550
      4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000008000000464E5F504552455601000000000007000000464E
      5F544152410100000000000900000046435F504F535441560100000000000800
      0000464E5F414E47524F01000000000006000000464E5F474C46010000000000
      0B000000464E5F455854454D504F520100000000000A000000464E5F414C4C5F
      53554D010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 283
    Top = 156
  end
  object frDBPrihDocs_GR_LF: TfrxDBDataset
    UserName = 'odsPrihDocs_GR_LF'
    CloseDataSource = False
    DataSet = odsPrihDocs_GR_LF
    BCDToCurrency = False
    Left = 111
    Top = 209
  end
  object frDBstByMonth_GR_LF: TfrxDBDataset
    UserName = 'odsOstByMonth_GR_LF'
    CloseDataSource = False
    DataSet = odsOstByMonth_GR_LF
    BCDToCurrency = False
    Left = 31
    Top = 209
  end
  object frDBRashDocs_GR_LF: TfrxDBDataset
    UserName = 'odsRashDocs_GR_LF'
    CloseDataSource = False
    DataSet = odsRashDocs_GR_LF
    BCDToCurrency = False
    Left = 285
    Top = 213
  end
  object frxDBOstByMonth_TM: TfrxDBDataset
    UserName = 'odsOstByMonth_TM'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FN_START_MED=FN_START_MED'
      'FN_START_VES=FN_START_VES'
      'FN_START_PEREV=FN_START_PEREV'
      'FN_END_MED=FN_END_MED'
      'FN_END_VES=FN_END_VES'
      'FN_END_PEREV=FN_END_PEREV')
    DataSet = odsOstByMonth_TM
    BCDToCurrency = False
    Left = 32
    Top = 360
  end
  object odsOstByMonth_TM: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      'ROUND(SUM(A.FN_START_Med),2)   as FN_START_Med,'
      'ROUND(SUM(A.FN_START_Ves),2)   as FN_START_Ves,'
      'ROUND(SUM(A.FN_START_Perev),2) as FN_START_Perev,'
      ''
      'ROUND(SUM(A.FN_END_Med),2)   as FN_END_Med,'
      'ROUND(SUM(A.FN_END_Ves),2)   as FN_END_Ves,'
      'ROUND(SUM(A.FN_END_Perev),2) as FN_END_Perev'
      ''
      'FROM'
      '(SELECT '
      
        'CASE WHEN (TRUNC(D.FD_DATA) < TRUNC(:DATE1) AND UPPER(TRIM(UG.FC' +
        '_SYNONIM)) = '#39'MEDIC'#39')    THEN K.FN_PRICE*C.FN_KOL*D.mnoj ELSE 0 ' +
        'END AS FN_START_Med,'
      
        'CASE WHEN (TRUNC(D.FD_DATA) < TRUNC(:DATE1) AND UPPER(TRIM(UG.FC' +
        '_SYNONIM)) = '#39'VESOVIE'#39')  THEN K.FN_PRICE*C.FN_KOL*D.mnoj ELSE 0 ' +
        'END AS FN_START_Ves,'
      
        'CASE WHEN (TRUNC(D.FD_DATA) < TRUNC(:DATE1) AND UPPER(TRIM(UG.FC' +
        '_SYNONIM)) = '#39'PEREVYAZ'#39') THEN K.FN_PRICE*C.FN_KOL*D.mnoj ELSE 0 ' +
        'END AS FN_START_Perev,'
      ''
      ''
      
        'CASE WHEN TRUNC(D.FD_DATA) <= TRUNC(:DATE2) AND UPPER(TRIM(UG.FC' +
        '_SYNONIM)) = '#39'MEDIC'#39'    THEN K.FN_PRICE*C.FN_KOL*D.mnoj ELSE 0 E' +
        'ND AS FN_END_Med,'
      
        'CASE WHEN TRUNC(D.FD_DATA) <= TRUNC(:DATE2) AND UPPER(TRIM(UG.FC' +
        '_SYNONIM)) = '#39'VESOVIE'#39'  THEN K.FN_PRICE*C.FN_KOL*D.mnoj ELSE 0 E' +
        'ND AS FN_END_Ves,'
      
        'CASE WHEN TRUNC(D.FD_DATA) <= TRUNC(:DATE2) AND UPPER(TRIM(UG.FC' +
        '_SYNONIM)) = '#39'PEREVYAZ'#39' THEN K.FN_PRICE*C.FN_KOL*D.mnoj ELSE 0 E' +
        'ND AS FN_END_Perev'
      'FROM (SELECT TDOCS.*, '
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUPID ) ' +
        'as mnoj             '
      '      FROM MED.TDOCS '
      '      WHERE TDOCS.FL_EDIT = 0'
      
        '        AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(TO_DATE('#39'01.01.20' +
        '00'#39', '#39'DD.MM.YYYY'#39')) AND TRUNC(:DATE2)'
      '        AND (not tdocs.FP_VIDMOVE in (4,5))'
      
        '        AND :MOGROUPID in (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGRO' +
        'UPID_FROM) '
      '        AND TDOCS.FP_VIDMOVE <> 6 -- '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1072
      '      ) D,'
      '      MED.TDPC C, MED.TKART K, MED.TMEDIC M, MED.TUCHGR UG'
      'WHERE D.DPID = C.DPID'
      '  AND C.KARTID = K.KARTID'
      '  AND K.FL_DEL = 0'
      '  AND K.MEDICID = M.MEDICID'
      '  AND #uchgrid# = UG.UCHGRID'
      ') A')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445310C00000000000000000000000A00
      00003A4D4F47524F55504944030000000000000000000000060000003A444154
      45320C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000C000000464E5F53544152545F4D45440100000000000E00
      0000464E5F53544152545F50455245560100000000000A000000464E5F454E44
      5F4D45440100000000000C000000464E5F454E445F5045524556010000000000
      0C000000464E5F53544152545F5645530100000000000A000000464E5F454E44
      5F564553010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 29
    Top = 310
  end
  object odsPrihDocs_TM: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      'ROUND(SUM(A.FN_Med),2) as FN_Med,'
      'ROUND(SUM(A.FN_Ves),2) as FN_Ves,'
      'ROUND(SUM(A.FN_Perev),2) as FN_Perev'
      ''
      'FROM'
      '(SELECT '
      
        'CASE WHEN UPPER(TRIM(UG.FC_SYNONIM)) = '#39'MEDIC'#39' THEN K.FN_PRICE*C' +
        '.FN_KOL ELSE 0 END AS FN_Med,'
      
        'CASE WHEN UPPER(TRIM(UG.FC_SYNONIM)) = '#39'VESOVIE'#39' THEN K.FN_PRICE' +
        '*C.FN_KOL ELSE 0 END AS FN_Ves,'
      
        'CASE WHEN UPPER(TRIM(UG.FC_SYNONIM)) = '#39'PEREVYAZ'#39' THEN K.FN_PRIC' +
        'E*C.FN_KOL ELSE 0 END AS FN_Perev'
      'FROM (SELECT TDOCS.*, '
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUPID ) ' +
        'as mnoj             '
      '      FROM MED.TDOCS '
      '      WHERE TDOCS.FL_EDIT = 0'
      
        '        AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(TO_DATE(:DATE1)) ' +
        'AND TRUNC(TO_DATE(:DATE2))'
      '--        AND TDOCS.FP_VIDMOVE <> 6 -- '#1090#1086#1083#1100#1082#1086' '#1085#1077' '#1074#1086#1079#1074#1088#1072#1090
      '        AND (not TDOCS.FP_VIDMOVE in (4,5))'
      
        '        AND :MOGROUPID in (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGRO' +
        'UPID_FROM) '
      '      ) D,'
      '      MED.TDPC C, MED.TKART K, MED.TMEDIC M, MED.TUCHGR UG'
      'WHERE D.DPID = C.DPID'
      '  AND D.mnoj > 0'
      ''
      '  AND C.KARTID = K.KARTID'
      '  AND K.FL_DEL = 0'
      '  AND K.MEDICID = M.MEDICID'
      '  AND #uchgrid# = UG.UCHGRID'
      ') A'
      '')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445320C00000000000000000000000600
      00003A44415445310C00000000000000000000000A0000003A4D4F47524F5550
      4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000006000000464E5F4D454401000000000008000000464E5F50
      4552455601000000000006000000464E5F564553010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 141
    Top = 308
  end
  object frxDBPrihDocs_TM: TfrxDBDataset
    UserName = 'odsPrihDocs_TM'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FN_MED=FN_MED'
      'FN_VES=FN_VES'
      'FN_PEREV=FN_PEREV')
    DataSet = odsPrihDocs_TM
    BCDToCurrency = False
    Left = 144
    Top = 360
  end
  object odsRashDocs_TM: TOracleDataSet
    SQL.Strings = (
      'select * from'
      '(SELECT '
      'FC_GROUP,'
      'ROUND(SUM(A.FN_Med),2) as FN_Med,'
      'ROUND(SUM(A.FN_Ves),2) as FN_Ves,'
      'ROUND(SUM(A.FN_Perev),2) as FN_Perev'
      ''
      'FROM'
      '(SELECT '
      'G.FC_GROUP,'
      
        'CASE WHEN UPPER(TRIM(UG.FC_SYNONIM)) = '#39'MEDIC'#39' THEN K.FN_PRICE*C' +
        '.FN_KOL ELSE 0 END AS FN_Med,'
      
        'CASE WHEN UPPER(TRIM(UG.FC_SYNONIM)) = '#39'VESOVIE'#39' THEN K.FN_PRICE' +
        '*C.FN_KOL ELSE 0 END AS FN_Ves,'
      
        'CASE WHEN UPPER(TRIM(UG.FC_SYNONIM)) = '#39'PEREVYAZ'#39' THEN K.FN_PRIC' +
        'E*C.FN_KOL ELSE 0 END AS FN_Perev'
      'FROM (SELECT TDOCS.*, '
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUPID ) ' +
        'as mnoj             '
      '      FROM MED.TDOCS '
      '      WHERE TDOCS.FL_EDIT = 0'
      
        '        AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC' +
        '(:DATE2)'
      '        AND TDOCS.FP_VID = 2'
      
        '        AND :MOGROUPID in (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGRO' +
        'UPID_FROM) '
      '      ) D,'
      
        '      MED.TDPC C, MED.TKART K, MED.TMEDIC M, MED.TUCHGR UG, MED.' +
        'TMO_GROUP G'
      'WHERE D.DPID = C.DPID'
      '  AND D.mnoj < 0'
      '  AND C.KARTID = K.KARTID'
      '  AND K.FL_DEL = 0'
      '  AND K.MEDICID = M.MEDICID'
      '  AND #uchgrid# = UG.UCHGRID'
      '  AND D.FK_MOGROUPID_TO = G.GROUPID'
      ') A'
      'WHERE (FN_Ves <> 0 or FN_Med <> 0 or FN_Perev <> 0)'
      'GROUP BY A.FC_GROUP'
      'ORDER BY UPPER(FC_GROUP))'
      ''
      'UNION ALL'
      ''
      'SELECT '
      #39'<b>'#1057#1087#1080#1089#1072#1085#1080#1103'</b>'#39' FC_GROUP,'
      'ROUND(SUM(A.FN_Med),2) as FN_Med,'
      'ROUND(SUM(A.FN_Ves),2) as FN_Ves,'
      'ROUND(SUM(A.FN_Perev),2) as FN_Perev'
      ''
      'FROM'
      '(SELECT '
      
        'CASE WHEN UPPER(TRIM(UG.FC_SYNONIM)) = '#39'MEDIC'#39' THEN K.FN_PRICE*C' +
        '.FN_KOL ELSE 0 END AS FN_Med,'
      
        'CASE WHEN UPPER(TRIM(UG.FC_SYNONIM)) = '#39'VESOVIE'#39' THEN K.FN_PRICE' +
        '*C.FN_KOL ELSE 0 END AS FN_Ves,'
      
        'CASE WHEN UPPER(TRIM(UG.FC_SYNONIM)) = '#39'PEREVYAZ'#39' THEN K.FN_PRIC' +
        'E*C.FN_KOL ELSE 0 END AS FN_Perev'
      'FROM (SELECT TDOCS.*, '
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUPID ) ' +
        'as mnoj             '
      '      FROM MED.TDOCS '
      '      WHERE TDOCS.FL_EDIT = 0'
      '        AND (not tdocs.FP_VIDMOVE in (4,5))'
      
        '        AND TRUNC(TDOCS.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC' +
        '(:DATE2)'
      '        AND TDOCS.FP_VID = 3'
      
        '        AND :MOGROUPID in (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGRO' +
        'UPID_FROM) '
      '      ) D,'
      '      MED.TDPC C, MED.TKART K, MED.TMEDIC M, MED.TUCHGR UG'
      'WHERE D.DPID = C.DPID'
      '  AND D.mnoj < 0'
      '  AND C.KARTID = K.KARTID'
      '  AND K.FL_DEL = 0'
      '  AND K.MEDICID = M.MEDICID'
      '  AND #uchgrid# = UG.UCHGRID'
      ') A')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445320C00000000000000000000000600
      00003A44415445310C00000000000000000000000A0000003A4D4F47524F5550
      4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000006000000464E5F4D454401000000000008000000464E5F50
      455245560100000000000800000046435F47524F555001000000000006000000
      464E5F564553010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 243
    Top = 308
  end
  object frxDBRashDocs_TM: TfrxDBDataset
    UserName = 'odsRashDocs_TM'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FC_GROUP=FC_GROUP'
      'FN_MED=FN_MED'
      'FN_VES=FN_VES'
      'FN_PEREV=FN_PEREV')
    DataSet = odsRashDocs_TM
    BCDToCurrency = False
    Left = 248
    Top = 360
  end
end
