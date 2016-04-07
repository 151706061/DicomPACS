object dm_Import: Tdm_Import
  OldCreateOrder = False
  Height = 257
  Width = 203
  object oqAddDoc: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '  insert into MED.TIMP_DOC  a (a.fc_src_doc_num, a.fc_src_doc_da' +
        'te, a.fc_src_postav,'
      
        '                               a.fc_src_kontrakt, a.fc_src_vid_o' +
        'plati, a.fc_src_schet_faktura, a.fc_src_comment,'
      
        '                               a.fc_src_summa_s_nds, a.fc_src_ko' +
        'lvo_pos, a.fc_imp_filename, '
      
        '                               a.FC_DOC_DATE_FORMAT, a.FC_PARTY_' +
        'GODNOST_FORMAT)'
      
        '                       values (:pfc_src_doc_num, :pfc_src_doc_da' +
        'te, :pfc_src_postav,'
      
        '                               :pfc_src_kontrakt, :pfc_src_vid_o' +
        'plati, :pfc_src_schet_faktura, :pfc_src_comment, '
      
        '                               :pfc_src_summa_s_nds, :pfc_src_ko' +
        'lvo_pos, :pfc_imp_filename,'
      
        '                               :pFC_DOC_DATE_FORMAT, :pFC_PARTY_' +
        'GODNOST_FORMAT)'
      '  returning a.fk_id into :pDocID;'
      'end;')
    Optimize = False
    Variables.Data = {
      030000000D000000070000003A50444F43494403000000040000000300000000
      000000100000003A5046435F5352435F444F435F4E554D050000000000000000
      000000110000003A5046435F5352435F444F435F444154450500000000000000
      000000000F0000003A5046435F5352435F504F53544156050000000000000000
      000000130000003A5046435F5352435F5649445F4F504C415449050000000000
      000000000000140000003A5046435F5352435F53554D4D415F535F4E44530500
      00000000000000000000120000003A5046435F5352435F4B4F4C564F5F504F53
      050000000000000000000000110000003A5046435F494D505F46494C454E414D
      45050000000000000000000000160000003A5046435F5352435F53434845545F
      46414B54555241050000000000000000000000110000003A5046435F5352435F
      4B4F4E5452414B54050000000000000000000000100000003A5046435F535243
      5F434F4D4D454E54050000000000000000000000140000003A5046435F444F43
      5F444154455F464F524D4154050000000000000000000000190000003A504643
      5F50415254595F474F444E4F53545F464F524D41540500000000000000000000
      00}
    Left = 18
    Top = 158
  end
  object oqAddDocItem: TOracleQuery
    SQL.Strings = (
      'begin'
      
        'INSERT INTO med.timp_doc_items a (a.fk_imp_doc_id, a.fc_src_num,' +
        ' a.fc_src_medic_torg_name,'
      
        '                                  a.fc_src_medic_id_their, a.fc_' +
        'src_medic_ed_izm,'
      
        '                                  a.fc_src_medic_kolvo, a.fc_src' +
        '_party_seria,'
      
        '                                  a.fc_src_party_godnost, a.fc_s' +
        'rc_party_price_bez_nds,'
      
        '                                  a.fc_src_party_summ_nds, a.fc_' +
        'src_nds,'
      
        '                                  a.fc_src_party_proizvoditel, a' +
        '.fc_src_party_sertifikat)'
      
        '                          VALUES (:pfk_imp_doc_id, :pfc_src_num,' +
        ' :pfc_src_medic_torg_name,'
      
        '                                  :pfc_src_medic_id_their, :pfc_' +
        'src_medic_ed_izm,'
      
        '                                  :pfc_src_medic_kolvo, :pfc_src' +
        '_party_seria,'
      
        '                                  :pfc_src_party_godnost, :pfc_s' +
        'rc_party_price_bez_nds,'
      
        '                                  :pfc_src_party_summ_nds, :pfc_' +
        'src_nds,'
      
        '                                  :pfc_src_party_proizvoditel, :' +
        'pfc_src_party_sertifikat)'
      '  returning a.fk_id into :pFK_ID;'
      'end;')
    Optimize = False
    Variables.Data = {
      030000000E0000000F0000003A50464B5F494D505F444F435F49440300000000
      000000000000000C0000003A5046435F5352435F4E554D050000000000000000
      000000180000003A5046435F5352435F4D454449435F544F52475F4E414D4505
      0000000000000000000000170000003A5046435F5352435F4D454449435F4944
      5F5448454952050000000000000000000000150000003A5046435F5352435F4D
      454449435F45445F495A4D050000000000000000000000140000003A5046435F
      5352435F4D454449435F4B4F4C564F050000000000000000000000140000003A
      5046435F5352435F50415254595F534552494105000000000000000000000016
      0000003A5046435F5352435F50415254595F474F444E4F535405000000000000
      00000000001C0000003A5046435F5352435F50415254595F50524943455F4245
      5A5F4E4453050000000000000000000000170000003A5046435F5352435F5041
      5254595F53554D4D5F4E44530500000000000000000000000C0000003A504643
      5F5352435F4E44530500000000000000000000001B0000003A5046435F535243
      5F50415254595F50524F495A564F444954454C05000000000000000000000019
      0000003A5046435F5352435F50415254595F534552544946494B415405000000
      0000000000000000070000003A50464B5F4944030000000000000000000000}
    Cursor = crSQLWait
    Left = 92
    Top = 158
  end
  object opdXLS: TOpenDialog
    DefaultExt = 'xls'
    Filter = '*.xls|*.xls'
    Options = [ofEnableSizing]
    Left = 12
    Top = 16
  end
  object opdXML: TOpenDialog
    DefaultExt = 'xml'
    Filter = '*.xml|*.xml'
    Options = [ofEnableSizing]
    Left = 16
    Top = 80
  end
  object XMLDocument1: TXMLDocument
    Left = 78
    Top = 12
    DOMVendorDesc = 'MSXML'
  end
  object odsNaklByDogovor: TOracleDataSet
    SQL.Strings = (
      'select'
      '  dogovor.*,'
      
        '  nvl(dogovor.fk_dog_medicid, nakl.fk_nakl_medicid) as fk_medici' +
        'd,'
      
        '  decode(dogovor.fk_dog_medicid, null, nakl.fc_nakl_medic, dogov' +
        'or.fc_dog_medic) as fc_medic, '
      
        '  decode(dogovor.fk_dog_medicid, null, nakl.fc_nakl_ei, dogovor.' +
        'fc_dog_ei) as fc_ei, '
      
        '  decode(dogovor.fk_dog_medicid, null, nakl.fn_nakl_price, dogov' +
        'or.fn_dog_price) as fn_price,   '
      '  dogovor.fn_dog_kol, dogovor.fn_dog_price, dogovor.fn_dog_sum,'
      '  nakl.fn_nakl_price, nakl.fn_nakl_sum, nakl.fn_nakl_kol,'
      '  '
      '  (dogovor.fn_dog_kol - nakl.fn_nakl_kol) as fn_nedopost_kol,'
      '  (dogovor.fn_dog_sum - nakl.fn_nakl_sum) as fn_nedopost_sum'
      ''
      'from  '
      '('
      
        '  SELECT a.fk_ts_names_id as fk_dog_medicid, m.fc_name as fc_dog' +
        '_medic, a.fn_kol as fn_dog_kol, '
      
        '         nvl(ei.fc_name, ei.fc_fullname) as fc_dog_ei, a.fn_pric' +
        'e as fn_dog_price, a.fn_kol*a.fn_price as fn_dog_sum'
      
        '  FROM buh.tspis_prod a, buh.tspecname c, buh.tdog_post d, med.t' +
        'medic m, med.tei ei'
      '  where a.fk_specname_id = c.fk_id'
      '    and a.fk_ei = ei.eiid(+)'
      '    and c.fk_dog_id = d.fk_id'
      '    and d.fk_company = :pPostID'
      '    and a.fk_ts_names_id = m.medicid'
      '    and d.FC_NUM = :pFC_DOG_NUM'
      '    and d.FN_ACTIV = 0'
      '    and d.fk_type = 1'
      ') dogovor,'
      ''
      '('
      '  select '
      '    m.medicid as fk_nakl_medicid, m.fc_name as fc_nakl_medic,'
      '    sum(dp.fn_kol) as fn_nakl_kol, k.fn_price as fn_nakl_price,'
      
        '    sum(dp.fn_kol*k.fn_price) as fn_nakl_sum, ei.fc_name as fc_n' +
        'akl_ei'
      '  from '
      
        '    med.tdocs d, med.tdpc dp, med.tkart k, med.tmedic m, med.tei' +
        ' ei'
      '  where d.dpid = dp.dpid and'
      '        d.fp_vidmove = 1 and'
      '        dp.kartid = k.kartid and'
      '        k.medicid = m.medicid and'
      '        m.eiid = ei.eiid(+) and'
      '        d.postavid    = :pPostID and'
      '        d.fc_kontrakt = :pFC_DOG_NUM'
      '  group by m.medicid, m.fc_name, k.fn_price, ei.fc_name      '
      ') nakl        '
      ''
      'where '
      '  dogovor.fk_dog_medicid = nakl.fk_nakl_medicid(+)')
    Optimize = False
    Variables.Data = {
      0300000002000000080000003A50504F53544944030000000000000000000000
      0C0000003A5046435F444F475F4E554D050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001900000005000000464B5F49440100000000000B00000046445F444F
      435F444154450100000000000E00000046435F5352435F444F435F4E554D0100
      000000000F00000046435F5352435F444F435F444154450100000000000D0000
      0046435F5352435F504F535441560100000000001100000046435F5352435F56
      49445F4F504C4154490100000000001200000046435F5352435F53554D4D415F
      535F4E44530100000000001000000046435F5352435F4B4F4C564F5F504F5301
      00000000000B00000046445F494E535F444154450100000000000C0000004644
      5F454449545F4441544501000000000009000000464B5F494E535F4D4F010000
      0000000A000000464B5F454449545F4D4F0100000000000A000000464B5F504F
      53545F49440100000000000E000000464E5F53554D4D415F535F4E4453010000
      0000000C000000464E5F4B4F4C564F5F504F530100000000000F00000046435F
      494D505F46494C454E414D450100000000001400000046435F5352435F534348
      45545F46414B5455524101000000000011000000464E5F494D505F444F435F53
      54415455530100000000001100000046435F494D505F444F435F535441545553
      0100000000000F00000046435F5352435F4B4F4E5452414B540100000000000E
      00000046435F5352435F434F4D4D454E5401000000000010000000464C5F4348
      45434B5F444F474F564F520100000000000D000000464C5F49535F434845434B
      45440100000000000D000000464B5F4D4F5F434845434B45440100000000000F
      00000046445F434845434B45445F44415445010000000000}
    CommitOnPost = False
    Left = 92
    Top = 92
  end
end
