object dmMain: TdmMain
  OldCreateOrder = False
  Height = 258
  Width = 495
  object odsRepByDoc: TOracleDataSet
    SQL.Strings = (
      'SELECT null as a'
      '--------- BEGIN ---------'
      '       , d.dpid as dpid'
      '       , TRUNC(d.fd_data) as fd_data'
      '       , TRUNC(d.fd_invoice) as fd_invoice'
      '       , d.fc_doc as fc_doc'
      '       , d.fc_comment as fc_comment'
      '       , d.fc_schet_faktura as fc_schet_faktura'
      '       , d.postavid as postavid'
      
        '       , (select fc_inn from med.tpostav p where p.postavid = d.' +
        'postavid) as postav_inn'
      '       , d.fn_price as fn_price'
      '       , d.fl_edit as fl_edit'
      
        '       , substr(med.GET_DECODEDOCVIDMOVE(fp_vidmove)||'#39' '#8470' '#39'||D.f' +
        'c_doc||'#39' '#1086#1090' '#39'||to_char(D.fd_invoice,'#39'dd.mm.yyyy'#39'),1,150) AS fc_d' +
        'ocmix'
      
        '       , substr(MED.PKGTDOCS.GET_SPISANIE_DETAIL_DESCR(d.fp_vid,' +
        ' d.fp_vidmove, d.fn_spisanievid, d.fk_mogroupid_to),1, 150) as F' +
        'C_VID_SPISANIE'
      
        '       , substr(MED.PKGTDOCS.GET_DOC_SOURCE (D.fp_vid, D.fp_vidm' +
        'ove, D.fk_mogroupid_FROM, D.postavid),1,150) as fc_OTKUDA'
      
        '       , substr(MED.PKGTDOCS.GET_DOC_DESTINATION(D.fp_vid, D.fp_' +
        'vidmove, D.fk_mogroupid_TO, D.postavid),1,150) AS fc_KUDA'
      '       , substr(InitCap(mofrom.fc_name),1,150) as fc_OTKUDA_MO'
      '       , substr(InitCap(moto.fc_name),1,150) AS fc_KUDA_MO'
      
        '       , substr(med.GET_DECODEDOCVIDMOVE(d.fp_vidmove),1,50) as ' +
        'FC_DOCNAME'
      
        '       , DECODE(d.FN_PrihRashPriznak, -1,'#39#1056#1072#1089#1093#1086#1076#39', 1,'#39#1055#1088#1080#1093#1086#1076#39', '#39 +
        #39') as FC_DVIG_TYPE'
      '       , fs_d.fc_name as FC_DOC_FINSOURCE'
      '       , pc.fc_name as fc_DOC_paycond'
      '       , d.FC_KONTRAKT as FC_KONTRAKT'
      '--------- END ---------'
      
        '  FROM (select d.*, MED.PKG_PRIHRASH.Get_PrihRashPriznak( d.FP_V' +
        'ID, d.FP_VIDMOVE,'
      
        '                                                              d.' +
        'fk_mogroupid_from,'
      
        '                                                              d.' +
        'fk_mogroupid_to,'
      
        '                                                              :p' +
        'CUR_MOGROUP ) as FN_PrihRashPriznak from med.tdocs d'
      
        '        where ((:pDATE1_FILTERED = 0)or(TRUNC(d.fd_data) >= TRUN' +
        'C(:pDATE1)))'
      
        '          AND ((:pDATE2_FILTERED = 0)or(TRUNC(d.fd_data) <= TRUN' +
        'C(:pDATE2)))) d'
      
        '        ,med.tfinsource fs_d, med.tpaycond pc, med.tmo moto, med' +
        '.tmo mofrom'
      ''
      'where '
      
        '    ((((:pPrihDoc = 1)and(d.FN_PrihRashPriznak = 1)) or ((:pRash' +
        'Doc = 1)and(d.FN_PrihRashPriznak = -1))) or ((:pPrihDoc = 0) and' +
        ' (:pRashDoc = 0)))'
      '    and d.fk_paycond_id = pc.fk_id(+)'
      '    and d.fk_finsource_id = fs_d.fk_id(+)'
      '    and d.mofromid = mofrom.moid(+)'
      '    and d.motoid = moto.moid(+)'
      '--((:pPrihDoc = 0)or(d.FN_PrihRashPriznak = 1))'
      '-- or ((:pRashDoc = 0)or(d.FN_PrihRashPriznak = -1))'
      ' '
      ''
      '')
    ReadBuffer = 500
    Optimize = False
    Variables.Data = {
      0300000007000000100000003A5044415445315F46494C544552454403000000
      040000000000000000000000070000003A5044415445310C0000000000000000
      000000100000003A5044415445325F46494C5445524544030000000400000000
      00000000000000070000003A5044415445320C00000000000000000000000D00
      00003A504355525F4D4F47524F55500300000004000000000000000000000009
      0000003A5050524948444F430300000004000000000000000000000009000000
      3A5052415348444F4303000000040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001100000008000000464E5F5052494345010000000000040000004450
      49440100000000000700000046445F444154410100000000000600000046435F
      444F430100000000000A00000046435F434F4D4D454E54010000000000080000
      00504F53544156494401000000000007000000464C5F45444954010000000000
      0A00000046445F494E564F4943450100000000000A00000046435F444F434E41
      4D450100000000000F00000046435F5649445F53504953414E49450100000000
      000900000046435F4F544B5544410100000000000700000046435F4B55444101
      000000000001000000410100000000000900000046435F444F434D4958010000
      0000000C00000046435F445649475F545950450100000000001000000046435F
      444F435F46494E534F555243450100000000000E00000046435F444F435F5041
      59434F4E44010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 174
    Top = 10
  end
  object dsRep: TDataSource
    DataSet = odsRepByDocAndMedics
    Left = 66
    Top = 18
  end
  object os: TOracleSession
    AfterLogOn = osAfterLogOn
    LogonDatabase = 'ASU'
    Left = 433
    Top = 122
  end
  object oqGetDateTime: TOracleQuery
    SQL.Strings = (
      'begin'
      '  :Res := sysdate;'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000001000000040000003A5245530C00000007000000786C0A090C0A2C00
      000000}
    Left = 432
    Top = 196
  end
  object odsTMO_GROUP: TOracleDataSet
    SQL.Strings = (
      'SELECT groupid, fc_group, fl_del'
      'FROM med.tmo_group '
      'where fl_del = 0'
      'ORDER BY UPPER(fc_group) ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C010000000000}
    Session = os
    Left = 170
    Top = 73
  end
  object dsTMO_GROUP: TDataSource
    DataSet = odsTMO_GROUP
    Left = 170
    Top = 129
  end
  object odsTPOSTAV: TOracleDataSet
    SQL.Strings = (
      'SELECT p.*'
      'FROM med.tpostav p'
      '--ORDER BY UPPER(fc_group) ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000700000006000000464C5F44454C01000000000008000000504F5354
      415649440100000000000700000046435F4E414D450100000000000B00000046
      435F424F5353444F4C470100000000000A00000046435F424F535346494F0100
      0000000009000000464E5F4D4F545950450100000000000C00000046435F5245
      4B56495A495449010000000000}
    Session = os
    Left = 249
    Top = 73
  end
  object dsTPOSTAV: TDataSource
    DataSet = odsTPOSTAV
    Left = 249
    Top = 129
  end
  object odsRepByDocAndMedics: TOracleDataSet
    SQL.Strings = (
      'SELECT null as a'
      '--------- BEGIN ---------'
      '       , d.dpid as dpid'
      '       , TRUNC(d.fd_data) as fd_data'
      '       , TRUNC(d.fd_invoice) as fd_invoice'
      '       , d.fc_doc as fc_doc'
      '       , d.fc_comment as fc_comment'
      '       , d.fc_schet_faktura as fc_schet_faktura'
      '       , d.postavid as postavid'
      
        '       , (select fc_inn from med.tpostav p where p.postavid = d.' +
        'postavid) as postav_inn'
      '       , d.fn_price as fn_price'
      '       , d.fl_edit as fl_edit'
      '       , d.FC_KONTRAKT as FC_KONTRAKT'
      
        '       , substr(med.GET_DECODEDOCVIDMOVE(fp_vidmove)||'#39' '#8470' '#39'||D.f' +
        'c_doc||'#39' '#1086#1090' '#39'||to_char(D.fd_invoice,'#39'dd.mm.yyyy'#39'),1,150) AS fc_d' +
        'ocmix'
      
        '       , substr(MED.PKGTDOCS.GET_SPISANIE_DETAIL_DESCR(d.fp_vid,' +
        ' d.fp_vidmove, d.fn_spisanievid, d.fk_mogroupid_to),1, 150) as F' +
        'C_VID_SPISANIE'
      
        '       , substr(MED.PKGTDOCS.GET_DOC_SOURCE (D.fp_vid, D.fp_vidm' +
        'ove, D.fk_mogroupid_FROM, D.postavid),1,150) as fc_OTKUDA'
      
        '       , substr(MED.PKGTDOCS.GET_DOC_DESTINATION(D.fp_vid, D.fp_' +
        'vidmove, D.fk_mogroupid_TO, D.postavid),1,150) AS fc_KUDA'
      '       , substr(InitCap(mofrom.fc_name),1,150) as fc_OTKUDA_MO'
      '       , substr(InitCap(moto.fc_name),1,150) AS fc_KUDA_MO'
      
        '       , substr(med.GET_DECODEDOCVIDMOVE(d.fp_vidmove),1,50) as ' +
        'FC_DOCNAME'
      
        '       , DECODE(d.FN_PrihRashPriznak, -1,'#39#1056#1072#1089#1093#1086#1076#39', 1,'#39#1055#1088#1080#1093#1086#1076#39', '#39 +
        #39') as FC_DVIG_TYPE'
      '       , fs_d.fc_name as FC_DOC_FINSOURCE'
      '       , pc.fc_name as fc_DOC_paycond'
      '       , dp.fn_kol as fn_kol_up'
      '       , dp.fn_kol*m.fn_fpackinupack as fn_kol_fas'
      '       , k.fn_price as fn_party_price'
      '       , k.fd_goden as fd_goden'
      '       , k.fc_serial as fc_serial'
      '       , (k.fn_price*dp.fn_kol) as FN_MED_SUM'
      '       , LTRIM(m.fc_name) as fc_medicname'
      '       , SUBSTR(LTRIM(m.fc_name),1,1) as FC_FIRST_LETTER'
      '       , substr(m.fc_name_lat,1,255) as fc_name_lat'
      '       , m.fn_fpackinupack as fn_fpackinupack'
      '       , eu.fc_name as fc_up_ei'
      '       , ef.fc_name as fc_fas_ei'
      '       , u.fc_uchgr as fc_uchgr'
      '       , fg.fc_farmgr as fc_farmgr '
      '       , dp.FD_DATE_SPIS as FD_DATE_SPIS'
      '       , dp.FK_CREATE_MO_ID as FK_CREATE_MO_ID'
      '       , dp.fd_create as fd_create'
      '       , dp.fk_edit_mo_id as fk_edit_mo_id'
      '       , dp.fd_edit as fd_edit'
      ''
      '       , m.medicid as medicid'
      '       , dp.kartid as kartid'
      '       , dp.dpcid as dpcid'
      '       , m.fk_sklad_id as fk_sklad_id'
      '       , m.FL_EQUIPMENT as FL_EQUIPMENT'
      '       , fs_k.fc_name as FC_KART_FINSOURCE'
      '       , pc.pfc_value as fc_prod'
      '       , pc.Sfc_value as fc_cert'
      '       , pc.fc_foreighn as fc_foreighn'
      '       , k.FN_NDS as FN_NDS'
      '       , k.FN_NACENKA as FN_NACENKA'
      '       , k.FN_PRICE_MNF as FN_PRICE_MNF'
      '       , k.FL_JNVLS as FL_JNVLS'
      '       , m.FL_MIBP as FL_MIBP'
      '       , m.FC_INTERNATIONAL_NAME as FC_INTERNATIONAL_NAME'
      '       , k.FC_QUOTA_CODE as FC_QUOTA_CODE'
      '       , trim(m.Fn_Mass || '#39' '#39' || mu.fc_shortname) as fc_doza'
      
        '       , (SELECT max(tn1.name) FROM med.tmedic m1, rls.nomen n1,' +
        ' rls.prep p1, rls.tradenames tn1 WHERE m1.fk_nomen_rls = n1.id A' +
        'ND tn1.id = p1.tradenameid AND p1.id = n1.prepid AND m1.medicid ' +
        '= m.medicid) AS fc_tradename'
      
        '       , (select max(REPLACE(REPLACE(NAME,'#39'</sub>'#39','#39#39'),'#39'<sub>'#39','#39 +
        #39')) from rls.clsatc where id = m.fk_atc) as fc_atc'
      
        '       , (SELECT max(REPLACE(REPLACE(NAME,'#39'</sub>'#39','#39#39'),'#39'<sub>'#39','#39 +
        #39')) FROM rls.clsatc WHERE ID IN (SELECT ID FROM rls.clsatc WHERE' +
        ' parentid = 0 AND ID <> 0) START WITH ID = m.fk_atc CONNECT BY i' +
        'd = PRIOR parentid AND ID <> 0) as fc_atc_root'
      ''
      '--------- END ---------'
      
        '  FROM (select d.*, MED.PKG_PRIHRASH.Get_PrihRashPriznak( d.FP_V' +
        'ID, d.FP_VIDMOVE,'
      
        '                                                              d.' +
        'fk_mogroupid_from,'
      
        '                                                              d.' +
        'fk_mogroupid_to,'
      
        '                                                              :p' +
        'CUR_MOGROUP ) as FN_PrihRashPriznak from med.tdocs d '
      '  where '
      
        '     ((:pDATE1_FILTERED = 0)or(TRUNC(d.fd_data) >= TRUNC(:pDATE1' +
        ')))'
      
        ' AND ((:pDATE2_FILTERED = 0)or(TRUNC(d.fd_data) <= TRUNC(:pDATE2' +
        ')))) d'
      ''
      ''
      
        '      ,med.tdpc dp, med.tkart k, med.tmedic m, med.tuchgr u, med' +
        '.tei ef, med.tei eu, med.tmo mofrom, med.tmo moto'
      
        '      , med.tfinsource fs_k, med.tfinsource fs_d, med.tpaycond p' +
        'c, med.tfarmgr fg, med.tmassunits mu,'
      
        '      (select -- pfc_value - '#1085#1072#1079#1074#1072#1085#1080#1103' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1077#1081', Sfc_value ' +
        '- '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1099
      
        '        p1.FK_ID as PFK_ID, p1.fn_parent as pfn_parent, nvl(p1.f' +
        'c_value, p2.fc_value) as  pfc_value, decode(p2.FK_ID, null, null' +
        ', decode(p2.fl_foreighn, 1, '#39#1048#1084#1087#1086#1088#1090#1085#1099#1081#39', '#39#1054#1090#1077#1095#1077#1089#1090#1074#1077#1085#1085#1099#1081#39')) fc_fo' +
        'reighn              -- '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      
        '        ,p2.FK_ID as SFK_ID, p2.fn_parent as Sfn_parent, decode(' +
        'p1.FK_ID, null, null, p2.fc_value) as Sfc_value -- '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090
      
        '      from med.tprodcert  p1, med.tprodcert p2 where p1.fk_id(+)' +
        ' = p2.fn_parent) pc'
      '  where '
      '       k.fn_prodcertid = pc.SFK_ID(+)'
      '    and d.fk_paycond_id = pc.fk_id(+)'
      '    and d.fk_finsource_id = fs_d.fk_id(+)'
      '    and k.fk_finsource_id = fs_k.fk_id(+)'
      '    and d.mofromid = mofrom.moid(+)'
      '    and d.motoid = moto.moid(+)'
      '    and m.fk_fpackid = ef.eiid(+)'
      '    and m.eiid = eu.eiid(+)'
      '    and m.uchgrid = u.uchgrid(+)'
      '    and m.farmgrid = fg.farmgrid(+)'
      '    AND m.fk_massunits = mu.fk_id(+)'
      '    and k.medicid = m.medicid'
      '    and dp.kartid = k.kartid'
      '    and d.dpid = dp.dpid(+)'
      
        '    and ( (((:pPrihDoc = 1)and(d.FN_PrihRashPriznak = 1)) or ((:' +
        'pRashDoc = 1)and(d.FN_PrihRashPriznak = -1))) or ((:pPrihDoc = 0' +
        ') and (:pRashDoc = 0)) )'
      ' order by d.dpid'
      '')
    ReadBuffer = 500
    Optimize = False
    Variables.Data = {
      03000000070000000D0000003A504355525F4D4F47524F555003000000040000
      000000000000000000100000003A5044415445315F46494C5445524544030000
      00040000000000000000000000070000003A5044415445310C00000000000000
      00000000100000003A5044415445325F46494C54455245440300000004000000
      0000000000000000070000003A5044415445320C000000000000000000000009
      0000003A5050524948444F430300000004000000000000000000000009000000
      3A5052415348444F4303000000040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000002C00000008000000464E5F5052494345010000000000040000004450
      49440100000000000700000046445F444154410100000000000600000046435F
      444F430100000000000A00000046435F434F4D4D454E54010000000000080000
      00504F53544156494401000000000007000000464C5F45444954010000000000
      0A00000046445F494E564F4943450100000000000A00000046435F444F434E41
      4D450100000000000F00000046435F5649445F53504953414E49450100000000
      000900000046435F4F544B5544410100000000000700000046435F4B55444101
      00000000000900000046435F444F434D495801000000000009000000464E5F4B
      4F4C5F55500100000000000A000000464E5F4B4F4C5F4641530100000000000E
      000000464E5F50415254595F50524943450100000000000800000046445F474F
      44454E0100000000000900000046435F53455249414C0100000000000C000000
      46435F4D454449434E414D450100000000000B00000046435F4E414D455F4C41
      540100000000000F000000464E5F465041434B494E555041434B010000000000
      0800000046435F55505F45490100000000000900000046435F4641535F454901
      00000000000800000046435F55434847520100000000000C00000046435F4456
      49475F545950450100000000000F00000046435F46495253545F4C4554544552
      0100000000000A000000464E5F4D45445F53554D0100000000000C0000004644
      5F444154455F53504953010000000000070000004D4544494349440100000000
      00060000004B4152544944010000000000050000004450434944010000000000
      0B000000464B5F534B4C41445F49440100000000000C000000464C5F45515549
      504D454E540100000000001000000046435F444F435F46494E534F5552434501
      00000000000E00000046435F444F435F504159434F4E440100000000000F0000
      00464B5F4352454154455F4D4F5F49440100000000000900000046445F435245
      4154450100000000000D000000464B5F454449545F4D4F5F4944010000000000
      0700000046445F454449540100000000001100000046435F4B4152545F46494E
      534F555243450100000000000700000046435F50524F44010000000000070000
      0046435F4345525401000000000001000000410100000000000B00000046435F
      4B4F4E5452414B54010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 286
    Top = 14
  end
  object odsRepByOst: TOracleDataSet
    SQL.Strings = (
      'SELECT null as a'
      '--------- BEGIN ---------'
      '       , a.kartid as kartid'
      '       , a.medicid as medicid'
      '       , a.fn_fpackinupack as fn_fpackinupack'
      '       , a.fn_price as fn_party_price'
      '       , a.fn_kolost as fn_kol_up'
      '       , a.fn_kolost*a.fn_fpackinupack as fn_kol_fas'
      '       , a.fn_ost_type as fn_ost_type'
      ''
      '       , k.fn_price as fn_party_price'
      '       , k.fd_goden as fd_goden'
      '       , k.fc_serial as fc_serial'
      '       , k.fn_price*a.fn_kolost as FN_MED_SUM'
      '       , LTRIM(m.fc_name) as fc_medicname'
      '       , SUBSTR(LTRIM(m.fc_name),1,1) as FC_FIRST_LETTER'
      '       , substr(m.fc_name_lat,1,255) as fc_name_lat'
      '       , eu.fc_name as fc_up_ei'
      '       , ef.fc_name as fc_fas_ei'
      '       , u.fc_uchgr as fc_uchgr'
      '       , fg.fc_farmgr as fc_farmgr '
      ''
      '       , m.fk_sklad_id as fk_sklad_id'
      '       , m.FL_EQUIPMENT as FL_EQUIPMENT'
      '       , fs_k.fc_name as FC_KART_FINSOURCE'
      '       , pc.pfc_value as fc_prod'
      '       , pc.Sfc_value as fc_cert'
      '       , pc.fc_foreighn as fc_foreighn'
      '       , k.FN_NDS as FN_NDS'
      '       , k.FN_NACENKA as FN_NACENKA'
      '       , k.FN_PRICE_MNF as FN_PRICE_MNF'
      '       , k.FL_JNVLS as FL_JNVLS'
      '       , m.FL_MIBP as FL_MIBP'
      '       , m.FC_INTERNATIONAL_NAME as FC_INTERNATIONAL_NAME'
      '       , k.FC_QUOTA_CODE as FC_QUOTA_CODE'
      '       , trim(m.Fn_Mass || '#39' '#39' || mu.fc_shortname) as fc_doza'
      
        '       , (SELECT max(tn1.name) FROM med.tmedic m1, rls.nomen n1,' +
        ' rls.prep p1, rls.tradenames tn1 WHERE m1.fk_nomen_rls = n1.id A' +
        'ND tn1.id = p1.tradenameid AND p1.id = n1.prepid AND m1.medicid ' +
        '= m.medicid) AS fc_tradename'
      
        '       , (select max(REPLACE(REPLACE(NAME,'#39'</sub>'#39','#39#39'),'#39'<sub>'#39','#39 +
        #39')) from rls.clsatc where id = m.fk_atc) as fc_atc'
      
        '       , (SELECT max(REPLACE(REPLACE(NAME,'#39'</sub>'#39','#39#39'),'#39'<sub>'#39','#39 +
        #39')) FROM rls.clsatc WHERE ID IN (SELECT ID FROM rls.clsatc WHERE' +
        ' parentid = 0 AND ID <> 0) START WITH ID = m.fk_atc CONNECT BY i' +
        'd = PRIOR parentid AND ID <> 0) as fc_atc_root'
      ''
      '--------- END ---------'
      ''
      '  FROM med.vmedkart_kolost a,'
      
        '      med.tkart k, med.tmedic m, med.tuchgr u, med.tei ef, med.t' +
        'ei eu, med.tfinsource fs_k, med.tfarmgr fg, med.tmassunits mu,'
      
        '      (select -- pfc_value - '#1085#1072#1079#1074#1072#1085#1080#1103' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1077#1081', Sfc_value ' +
        '- '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1099
      
        '        p1.FK_ID as PFK_ID, p1.fn_parent as pfn_parent, nvl(p1.f' +
        'c_value, p2.fc_value) as  pfc_value, decode(p2.FK_ID, null, null' +
        ', decode(p2.fl_foreighn, 1, '#39#1048#1084#1087#1086#1088#1090#1085#1099#1081#39', '#39#1054#1090#1077#1095#1077#1089#1090#1074#1077#1085#1085#1099#1081#39')) fc_fo' +
        'reighn              -- '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      
        '        ,p2.FK_ID as SFK_ID, p2.fn_parent as Sfn_parent, decode(' +
        'p1.FK_ID, null, null, p2.fc_value) as Sfc_value -- '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090
      
        '      from med.tprodcert  p1, med.tprodcert p2 where p1.fk_id(+)' +
        ' = p2.fn_parent) pc'
      '  where '
      '       k.fn_prodcertid = pc.SFK_ID(+)'
      '    and a.kartid = k.kartid'
      '    and a.medicid = m.medicid'
      '    and m.uchgrid = u.uchgrid(+)'
      '    and m.farmgrid = fg.farmgrid(+)'
      '    and m.eiid = eu.eiid(+)'
      '    and m.fk_fpackid = ef.eiid(+)'
      '    AND m.fk_massunits = mu.fk_id(+)'
      '    and k.fk_finsource_id =  fs_k.fk_id(+)'
      '')
    ReadBuffer = 500
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000170000000100000041010000000000060000004B4152544944010000
      000000070000004D4544494349440100000000000F000000464E5F465041434B
      494E555041434B0100000000000E000000464E5F50415254595F505249434501
      000000000009000000464E5F4B4F4C5F55500100000000000A000000464E5F4B
      4F4C5F4641530100000000000B000000464E5F4F53545F545950450100000000
      0010000000464E5F50415254595F50524943455F310100000000000800000046
      445F474F44454E0100000000000900000046435F53455249414C010000000000
      0A000000464E5F4D45445F53554D0100000000000C00000046435F4D45444943
      4E414D450100000000000F00000046435F46495253545F4C4554544552010000
      0000000B00000046435F4E414D455F4C41540100000000000800000046435F55
      505F45490100000000000900000046435F4641535F4549010000000000080000
      0046435F55434847520100000000000B000000464B5F534B4C41445F49440100
      000000000C000000464C5F45515549504D454E540100000000000D0000004643
      5F46494E43534F555243450100000000000700000046435F50524F4401000000
      00000700000046435F43455254010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 406
    Top = 16
  end
  object oqRepByOstInit: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '--  :PDATE1_FILTERED, :PDATE1, :PDATE2_FILTERED, :PDATE2, :PCUR_' +
        'MOGROUP'
      '  med.PKG_MEDSES.ResetDatePeriod;'
      ''
      '  if :PDATE1_FILTERED = 1 then'
      '    med.PKG_MEDSES.set_data1(:pDATE1);'
      '  end if;'
      ''
      '  if :PDATE2_FILTERED = 1 then'
      '    med.PKG_MEDSES.set_data2(:pDATE2);'
      '  end if;'
      '  med.PKG_MEDSES.set_curmo_group(:PCUR_MOGROUP);'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000005000000070000003A5044415445310C000000000000000000000007
      0000003A5044415445320C00000000000000000000000D0000003A504355525F
      4D4F47524F5550030000000000000000000000100000003A5044415445315F46
      494C544552454403000000040000000000000000000000100000003A50444154
      45325F46494C544552454403000000040000000000000000000000}
    Left = 372
    Top = 136
  end
  object JvAppIniFileStorage1: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    AutoFlush = True
    AutoReload = True
    FileName = 'repPrihRashDocs.ini'
    SubStorages = <>
    SynchronizeFlushReload = True
    Left = 66
    Top = 92
  end
  object odsTMO: TOracleDataSet
    SQL.Strings = (
      'SELECT mo.*'
      'FROM med.tmo mo')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000700000046435F4E414D4501000000000009000000464E5F
      4D4F54595045010000000000040000004D4F494401000000000006000000464C
      5F43524D01000000000009000000464B5F504152454E54010000000000090000
      00464B5F534F5452494401000000000007000000464C5F545245420100000000
      0008000000464E5F47524F55500100000000000F000000464B5F4355524D4F47
      524F555049440100000000000B000000464B5F534B4C41445F49440100000000
      00}
    Session = os
    Left = 313
    Top = 73
  end
  object dsTMO: TDataSource
    DataSet = odsTMO
    Left = 313
    Top = 129
  end
end
