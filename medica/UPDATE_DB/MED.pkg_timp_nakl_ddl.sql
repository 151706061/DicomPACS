-- Start of DDL Script for Package Body MED.PKG_TIMP_NAKL
-- Generated 30-мар-2011 16:32:21 from MED@H100609

CREATE OR REPLACE 
PACKAGE             med.pkg_timp_nakl
  IS
  PROCEDURE SET_IMP_ITEM_STATUS(aFK_ID IN NUMBER);
  FUNCTION CALC_IMP_ITEM_STATUS(aFK_ID IN NUMBER) RETURN NUMBER;
  FUNCTION DECODE_IMP_ITEM_STATUS( aFN_STATUS NUMBER) RETURN VARCHAR2;
  FUNCTION CALC_IMP_DOC_STATUS( aDOC_ID NUMBER, aDOC_NUM VARCHAR2, aDOC_DATE DATE, aDOC_POSTAV NUMBER, aFL_CHECK_DOGOVOR NUMBER default 0, aFL_IS_CHECKED NUMBER default 0 ) RETURN NUMBER;
  FUNCTION DECODE_IMP_DOC_STATUS(aFN_DOC_STATUS NUMBER ) RETURN VARCHAR2;
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY     med.pkg_timp_nakl
IS
--============================================================================--
-- функция дает расшифровку документа статуса, возвращаемую процедурой CALC_IMP_STATUS(..., aFN_STATUS, ...)
--============================================================================--
FUNCTION DECODE_IMP_DOC_STATUS(aFN_DOC_STATUS NUMBER ) RETURN VARCHAR2 IS
BEGIN
  if aFN_DOC_STATUS is null THEN return 'Не проверено'; end if;

  CASE aFN_DOC_STATUS
       WHEN  0 THEN return 'ОК';
       WHEN -1 THEN return 'Не указан номер документа';
       WHEN -2 THEN return 'Не указана дата документа';
       WHEN -3 THEN return 'Не указан поставщик';
       WHEN -4 THEN return 'Не все позиции готовы для импорта';
       WHEN -5 THEN return 'Импорт документа не утвержден';
       ELSE return '';
  END CASE;
END DECODE_IMP_DOC_STATUS;

FUNCTION CALC_IMP_DOC_STATUS( aDOC_ID NUMBER, aDOC_NUM VARCHAR2, aDOC_DATE DATE, aDOC_POSTAV NUMBER, aFL_CHECK_DOGOVOR NUMBER default 0, aFL_IS_CHECKED NUMBER default 0) RETURN NUMBER IS
BEGIN
  if aDOC_NUM is null then return -1; end if;
  if aDOC_DATE is null then return -2; end if;
  if NVL(aDOC_POSTAV,-1) < 0 then return -3; end if;
  for c in(select
             idi.*
           from med.timp_doc_items idi
           where idi.fk_imp_doc_id = aDOC_ID) loop
    if c.FN_IMP_STATUS < 0 then return -4; end if;
  end loop;

  if (nvl(aFL_CHECK_DOGOVOR,0) = 1)and(nvl(aFL_IS_CHECKED,0) = 0) then
    return -5;
  end if;
  return 0;
END CALC_IMP_DOC_STATUS;
--============================================================================--
-- функция дает расшифровку статуса, возвращаемую процедурой CALC_IMP_STATUS(..., aFN_STATUS, ...)
--============================================================================--
FUNCTION DECODE_IMP_ITEM_STATUS( aFN_STATUS NUMBER) RETURN VARCHAR2 IS
BEGIN
  if aFN_STATUS is null THEN return 'Не проверено'; end if;

  CASE aFN_STATUS
       WHEN  2 THEN return 'Не указан срок годности';
       WHEN  1 THEN return 'Не найдена единица измерения';
       WHEN  0 THEN return 'ОК';
       WHEN -1 THEN return 'Не указан поставщик';
       WHEN -2 THEN return 'Не указано наименование';
       WHEN -3 THEN return 'Кол-во поставки не указано';
       WHEN -4 THEN return 'Не указана цена';
       WHEN -5 THEN return 'Цена без НДС не совпадает с указанной в договоре';
       WHEN -6 THEN return 'Кол-во больше, чем указано в договоре';
       WHEN -7 THEN return 'Позиции нет в договоре';
       ELSE return '';
  END CASE;
END;
--============================================================================--
-- значения aFN_STATUS смотри в DECODE_FN_STATUS
--============================================================================--
FUNCTION CALC_IMP_ITEM_STATUS(aFK_ID IN NUMBER) RETURN NUMBER
IS

CURSOR cIMP_MED(pFK_ID NUMBER) IS
SELECT p.fc_name,  m.fc_name, ei.fc_name as fc_ei, p.postavid, m.medicid, ei.eiid,
       DECODE(nvl(idi.fn_prs_medic_kolvo,0),0,nvl(idi.fn_prs_party_summ_nds,0), nvl(idi.fn_prs_party_summ_nds,0)/nvl(idi.fn_prs_medic_kolvo,0)) fn_price_nds,  idi.FN_PRS_PARTY_PRICE,
       idi.fn_prs_medic_kolvo, idi.fd_prs_party_godnost,
       id.FL_CHECK_DOGOVOR, id.FD_DOC_DATE, id.FC_SRC_KONTRAKT, id.FD_IMPORT, id.fk_spec_id
  FROM MED.TIMP_DOC id,  MED.TIMP_DOC_ITEMS idi, med.tmedic m, med.tei ei, med.tpostav p
  where id.fk_id = idi.fk_imp_doc_id
    and idi.fk_prs_medic_id_our = m.medicid(+)
    and idi.fk_prs_medic_ed_izm   = ei.eiid(+)
    and id.fk_post_id  = p.postavid(+)
    and idi.fk_id      = pFK_ID;

CURSOR cSPIS_DOG_ITEMS(pPostID NUMBER, pFC_DOG_NUM VARCHAR2, pItemID NUMBER) IS
     SELECT /*a.fk_id, */a.fn_kol, a.fn_price
  FROM buh.tspis_prod a, buh.tspecname c, buh.tdog_post d
  where a.fk_specname_id = c.fk_id
    and c.fk_dog_id = d.fk_id
    and d.fk_company = pPostID
    and a.fk_ts_names_id = pItemID
    and d.FC_NUM = pFC_DOG_NUM
--    and TRUNC(pNaklDate) BETWEEN TRUNC(d.fd_begin) AND TRUNC(d.fd_end)
    and d.fn_activ = 0
    and d.fk_type = 1; -- только медикаменты

CURSOR cEXISTS_PRIH_NAKL(pPostID NUMBER, pFC_DOG_NUM VARCHAR2, pItemID NUMBER) IS
  select sum(dp.fn_kol) as fn_sum_kol
  from med.tdocs d, med.tdpc dp, med.tkart k
  where d.dpid = dp.dpid and
        d.fp_vidmove = 1 and
        dp.kartid = k.kartid and
        d.postavid    = pPostID and
        d.fc_kontrakt = pFC_DOG_NUM and
        k.medicid     = pItemID;


  pfc_post_name VARCHAR2(500);
  pfc_name      VARCHAR2(500);
  pfc_ei        VARCHAR2(50);
  pfk_postavid_id NUMBER;
  pfk_name_id NUMBER;
  pfk_ei_id NUMBER;
  pfn_price_s_nds NUMBER;
  pFN_PRS_PARTY_PRICE NUMBER;
  pfn_kol NUMBER;
  pfn_kol_zak NUMBER;
  pfd_goden_do DATE;
  pFL_CHECK_DOGOVOR NUMBER(1);
  pFD_DOC_DATE DATE;
  pFD_IMPORT DATE;
  pFC_SRC_KONTRAKT VARCHAR2(70);
  pfk_spec_id NUMBER;

  pfn_dog_kol   number;
  pfn_dog_price number;
  pfn_EXISTS_PRIH_NAKL_kol number;

BEGIN
   OPEN  cIMP_MED(aFK_ID);
   FETCH cIMP_MED INTO pfc_post_name, pfc_name, pfc_ei, pfk_postavid_id,
                       pfk_name_id, pfk_ei_id, pfn_price_s_nds, pFN_PRS_PARTY_PRICE,
                       pfn_kol, pfd_goden_do, pFL_CHECK_DOGOVOR, pFD_DOC_DATE,
                       pFC_SRC_KONTRAKT, pFD_IMPORT, pfk_spec_id;
   close cIMP_MED;

  if (pfk_postavid_id is null)or(pfc_post_name is null) then  return -1; end if;
  if (pfc_name is null)or(pfk_name_id is null) then return -2; end if;
  if (pfn_kol is null) then return -3; end if;
  if (pfn_price_s_nds is null) then return -4; end if;
  if (pFL_CHECK_DOGOVOR=1)and(pfk_spec_id is null) then
    OPEN cSPIS_DOG_ITEMS(pfk_postavid_id, pFC_SRC_KONTRAKT, pfk_name_id);
    FETCH cSPIS_DOG_ITEMS INTO pfn_dog_kol, pfn_dog_price;
    close cSPIS_DOG_ITEMS;

    if pfn_dog_kol is null then return -7; end if;
    if (pFN_PRS_PARTY_PRICE is null) or (pfn_dog_price <> pFN_PRS_PARTY_PRICE) then return -5; end if;

    -- такая схема подразумевает что любой импортированный документ уже не участвует в проверке
    if pFD_IMPORT is null then
      OPEN  cEXISTS_PRIH_NAKL(pfk_postavid_id, pFC_SRC_KONTRAKT, pfk_name_id);
      FETCH cEXISTS_PRIH_NAKL INTO pfn_EXISTS_PRIH_NAKL_kol;
      close cEXISTS_PRIH_NAKL;
      if pfn_dog_kol < (nvl(pfn_EXISTS_PRIH_NAKL_kol,0)+pfn_kol) then return -6; end if;
    end if;
  end if;
  if (pfc_ei is null)or(pfk_ei_id is null) then Return 1; end if;
  if (pfd_goden_do is null) then return 2; end if;

  return 0;
END CALC_IMP_ITEM_STATUS;
--============================================================================--
PROCEDURE SET_IMP_ITEM_STATUS(aFK_ID IN NUMBER)
IS
  pFN_IMP_STATUS NUMBER;
BEGIN
  pFN_IMP_STATUS := CALC_IMP_ITEM_STATUS(aFK_ID);
   update med.TIMP_DOC_ITEMS set FN_IMP_STATUS=pFN_IMP_STATUS  where fk_id = aFK_ID;
END SET_IMP_ITEM_STATUS;
--============================================================================--
END;
/


-- End of DDL Script for Package Body MED.PKG_TIMP_NAKL

