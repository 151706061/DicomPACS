-- Start of DDL Script for Package Body ASU.PKG_IMP_POST_NAKL
-- Generated 28.09.08 20:45:27 from ASU@M080829

CREATE OR REPLACE 
PACKAGE asu.pkg_imp_post_nakl
  IS

   FUNCTION NAKL_FOOD_PRICE_CHECK
    ( aPostID IN NUMBER, 
      aFoodID IN NUMBER,
      aNaklDate IN DATE,
      aNaklPrice  IN NUMBER,
      atspis_prod_id OUT NUMBER) RETURN NUMBER;

  PROCEDURE SET_IMP_STATUS(aFK_ID IN NUMBER, aNaklDate IN DATE, aFK_FROM IN NUMBER, aFN_IMP_TYPE IN NUMBER);

PROCEDURE CALC_IMP_STATUS(aFK_ID IN NUMBER, aNaklDate IN DATE, aFK_FROM IN NUMBER, aFN_IMP_TYPE IN NUMBER, aFN_STATUS OUT NUMBER, atspis_prod_id OUT NUMBER);
  FUNCTION DECODE_FN_STATUS( aFN_STATUS NUMBER) RETURN VARCHAR2;
  FUNCTION NAKL_PRICE_CHECK_BY_DOGOVOR
    ( aPostID IN NUMBER, 
      aItemID IN NUMBER, -- позиция из спецфикации - продукт или медикамент
      aNaklDate IN DATE,
      aNaklPrice  IN NUMBER,
      atspis_prod_id OUT NUMBER,
      aNAKL_TYPE IN NUMBER DEFAULT 0) RETURN NUMBER;
  
  FUNCTION DOC_INS(afc_doc_num        ASU.TIMP_DOCS.FC_DOC_NUM%TYPE,
                    afd_doc_date       ASU.TIMP_DOCS.fd_doc_date%TYPE,
                    afc_from           ASU.TIMP_DOCS.fc_from%TYPE,
                    afc_to             ASU.TIMP_DOCS.fc_to%TYPE,
                    afc_comment        ASU.TIMP_DOCS.fc_comment%TYPE,
                    afn_imp_type       ASU.TIMP_DOCS.fn_imp_type%TYPE,
                    afc_excel_filename ASU.TIMP_DOCS.fc_excel_filename%TYPE) RETURN NUMBER;
  
  PROCEDURE DOC_DEL(afk_id ASU.TIMP_DOCS.FK_ID%TYPE);
  
  PROCEDURE DOC_UPD(afk_id            ASU.TIMP_DOCS.FK_ID%TYPE,
                    afc_doc_num        ASU.TIMP_DOCS.FC_DOC_NUM%TYPE,
                    afd_doc_date       ASU.TIMP_DOCS.fd_doc_date%TYPE,
                    afc_from           ASU.TIMP_DOCS.fc_from%TYPE,
                    afc_to             ASU.TIMP_DOCS.fc_to%TYPE,
                    afc_comment        ASU.TIMP_DOCS.fc_comment%TYPE,
                    afn_imp_type       ASU.TIMP_DOCS.fn_imp_type%TYPE,
                    afc_excel_filename ASU.TIMP_DOCS.fc_excel_filename%TYPE);
  PROCEDURE IMP_DEL(afk_id ASU.timp_post_nakl.FK_ID%TYPE);
  FUNCTION IMP_INS(afc_post          ASU.TIMP_POST_NAKL.fc_post%TYPE,
                    afc_name          ASU.TIMP_POST_NAKL.fc_name%TYPE,
                    afc_ei            ASU.TIMP_POST_NAKL.fc_ei%TYPE,
                    afc_kol           ASU.TIMP_POST_NAKL.fc_kol%TYPE,
                    afc_kol_zak       ASU.TIMP_POST_NAKL.fc_kol_zak%TYPE,
                    afc_price         ASU.TIMP_POST_NAKL.fc_price%TYPE,
                    afc_goden_do      ASU.TIMP_POST_NAKL.fc_goden_do%TYPE,
                    afk_post_id       ASU.TIMP_POST_NAKL.fk_post_id%TYPE,
                    afk_name_id       ASU.TIMP_POST_NAKL.fk_name_id%TYPE,
                    afk_ei_id         ASU.TIMP_POST_NAKL.fk_ei_id%TYPE,
                    afn_kol           ASU.TIMP_POST_NAKL.fn_kol%TYPE,
                    afn_kol_zak       ASU.TIMP_POST_NAKL.fn_kol_zak%TYPE,
                    afn_price         ASU.TIMP_POST_NAKL.fn_price%TYPE,
                    afd_goden_do      ASU.TIMP_POST_NAKL.fd_goden_do%TYPE,
                    afl_is_imported   ASU.TIMP_POST_NAKL.fl_is_imported%TYPE,
                    afn_imp_group_num ASU.TIMP_POST_NAKL.fn_imp_group_num%TYPE,
                    afn_imp_type      ASU.TIMP_POST_NAKL.fn_imp_type%TYPE,
                    afn_status        ASU.TIMP_POST_NAKL.fn_status%TYPE,
                    afc_serial        ASU.TIMP_POST_NAKL.fc_serial%TYPE,
                    afk_timp_docs     ASU.TIMP_POST_NAKL.fk_timp_docs%TYPE,
                    afl_is_from_excel ASU.TIMP_POST_NAKL.fl_is_from_excel%TYPE                    
                    ) RETURN NUMBER;
  PROCEDURE IMP_UPD(afk_id           ASU.TIMP_POST_NAKL.FK_ID%TYPE,
                    afc_post          ASU.TIMP_POST_NAKL.fc_post%TYPE,
                    afc_name          ASU.TIMP_POST_NAKL.fc_name%TYPE,
                    afc_ei            ASU.TIMP_POST_NAKL.fc_ei%TYPE,
                    afc_kol           ASU.TIMP_POST_NAKL.fc_kol%TYPE,
                    afc_kol_zak       ASU.TIMP_POST_NAKL.fc_kol_zak%TYPE,
                    afc_price         ASU.TIMP_POST_NAKL.fc_price%TYPE,
                    afc_goden_do      ASU.TIMP_POST_NAKL.fc_goden_do%TYPE,
                    afk_post_id       ASU.TIMP_POST_NAKL.fk_post_id%TYPE,
                    afk_name_id       ASU.TIMP_POST_NAKL.fk_name_id%TYPE,
                    afk_ei_id         ASU.TIMP_POST_NAKL.fk_ei_id%TYPE,
                    afn_kol           ASU.TIMP_POST_NAKL.fn_kol%TYPE,
                    afn_kol_zak       ASU.TIMP_POST_NAKL.fn_kol_zak%TYPE,
                    afn_price         ASU.TIMP_POST_NAKL.fn_price%TYPE,
                    afd_goden_do      ASU.TIMP_POST_NAKL.fd_goden_do%TYPE,
                    afl_is_imported   ASU.TIMP_POST_NAKL.fl_is_imported%TYPE,
                    afn_imp_group_num ASU.TIMP_POST_NAKL.fn_imp_group_num%TYPE,
                    afn_imp_type      ASU.TIMP_POST_NAKL.fn_imp_type%TYPE,
                    afn_status        ASU.TIMP_POST_NAKL.fn_status%TYPE,
                    afc_serial        ASU.TIMP_POST_NAKL.fc_serial%TYPE,
                    afk_timp_docs     ASU.TIMP_POST_NAKL.fk_timp_docs%TYPE,
                    afl_is_from_excel ASU.TIMP_POST_NAKL.fl_is_from_excel%TYPE);
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY asu.pkg_imp_post_nakl
IS
--============================================================================--
-- Проверка по поставщику и наименованию в действующих договорах
-- наличие и соответствие цены
-- Возвращает:
--  0 - цена найдена в действующих документах
-- -1 - найдена 1 запись, но цена не совпадает (-- случай, когда цена по договору больше - поставщик отдает дешевле договора)
-- -4 - найдена 1 запись, но цена не совпадает (-- случай, когда цена по договору меньше - поставщик завысил цену)
-- -2 - найдена несколько записей, цена не совпадает
-- -3 - записи не найдены
-- Автор: Воронов О.А. 18.08.2008
--============================================================================--
   FUNCTION DOC_INS(afc_doc_num        ASU.TIMP_DOCS.FC_DOC_NUM%TYPE,
                    afd_doc_date       ASU.TIMP_DOCS.fd_doc_date%TYPE,
                    afc_from           ASU.TIMP_DOCS.fc_from%TYPE,
                    afc_to             ASU.TIMP_DOCS.fc_to%TYPE,
                    afc_comment        ASU.TIMP_DOCS.fc_comment%TYPE,
                    afn_imp_type       ASU.TIMP_DOCS.fn_imp_type%TYPE,
                    afc_excel_filename ASU.TIMP_DOCS.fc_excel_filename%TYPE) RETURN NUMBER
   IS
     nRes NUMBER;
   BEGIN
     insert into asu.timp_docs a (a.fc_doc_num, a.fd_doc_date, a.fc_from, a.fc_to, 
                                  a.fc_comment, a.fn_imp_type, a.fc_excel_filename)
                          values (afc_doc_num, afd_doc_date, afc_from, afc_to, 
                                  afc_comment, afn_imp_type, afc_excel_filename)
                          returning a.fk_id into nRes;
     return nRes;                             
   END DOC_INS;
--============================================================================--      
   PROCEDURE DOC_UPD(afk_id            ASU.TIMP_DOCS.FK_ID%TYPE,
                    afc_doc_num        ASU.TIMP_DOCS.FC_DOC_NUM%TYPE,
                    afd_doc_date       ASU.TIMP_DOCS.fd_doc_date%TYPE,
                    afc_from           ASU.TIMP_DOCS.fc_from%TYPE,
                    afc_to             ASU.TIMP_DOCS.fc_to%TYPE,
                    afc_comment        ASU.TIMP_DOCS.fc_comment%TYPE,
                    afn_imp_type       ASU.TIMP_DOCS.fn_imp_type%TYPE,
                    afc_excel_filename ASU.TIMP_DOCS.fc_excel_filename%TYPE)
   IS
   BEGIN
     update asu.timp_docs a set a.fc_doc_num        = afc_doc_num,
                                a.fd_doc_date       = afd_doc_date,
                                a.fc_from           = afc_from,
                                a.fc_to             = afc_to,
                                a.fc_comment        = afc_comment,
                                a.fn_imp_type       = afn_imp_type,
                                a.fc_excel_filename = afc_excel_filename
                          where a.fk_id = afk_id;      
   END DOC_UPD;   
--============================================================================--      
   PROCEDURE DOC_DEL(afk_id ASU.TIMP_DOCS.FK_ID%TYPE)
   IS
   BEGIN
     delete from asu.timp_docs a where a.fk_id = afk_id;      
   END DOC_DEL;   
--============================================================================--   
   FUNCTION IMP_INS(afc_post          ASU.TIMP_POST_NAKL.fc_post%TYPE,
                    afc_name          ASU.TIMP_POST_NAKL.fc_name%TYPE,
                    afc_ei            ASU.TIMP_POST_NAKL.fc_ei%TYPE,
                    afc_kol           ASU.TIMP_POST_NAKL.fc_kol%TYPE,
                    afc_kol_zak       ASU.TIMP_POST_NAKL.fc_kol_zak%TYPE,
                    afc_price         ASU.TIMP_POST_NAKL.fc_price%TYPE,
                    afc_goden_do      ASU.TIMP_POST_NAKL.fc_goden_do%TYPE,
                    afk_post_id       ASU.TIMP_POST_NAKL.fk_post_id%TYPE,
                    afk_name_id       ASU.TIMP_POST_NAKL.fk_name_id%TYPE,
                    afk_ei_id         ASU.TIMP_POST_NAKL.fk_ei_id%TYPE,
                    afn_kol           ASU.TIMP_POST_NAKL.fn_kol%TYPE,
                    afn_kol_zak       ASU.TIMP_POST_NAKL.fn_kol_zak%TYPE,
                    afn_price         ASU.TIMP_POST_NAKL.fn_price%TYPE,
                    afd_goden_do      ASU.TIMP_POST_NAKL.fd_goden_do%TYPE,
                    afl_is_imported   ASU.TIMP_POST_NAKL.fl_is_imported%TYPE,
                    afn_imp_group_num ASU.TIMP_POST_NAKL.fn_imp_group_num%TYPE,
                    afn_imp_type      ASU.TIMP_POST_NAKL.fn_imp_type%TYPE,
                    afn_status        ASU.TIMP_POST_NAKL.fn_status%TYPE,
                    afc_serial        ASU.TIMP_POST_NAKL.fc_serial%TYPE,
                    afk_timp_docs     ASU.TIMP_POST_NAKL.fk_timp_docs%TYPE,
                    afl_is_from_excel ASU.TIMP_POST_NAKL.fl_is_from_excel%TYPE                    
                    ) RETURN NUMBER
   IS
     nRes NUMBER;
   BEGIN
     insert into asu.TIMP_POST_NAKL a (
       a.fc_post, a.fc_name, a.fc_ei, a.fc_kol, a.fc_kol_zak, a.fc_price,
       a.fc_goden_do, a.fk_post_id, a.fk_name_id, a.fk_ei_id, a.fn_kol,
       a.fn_kol_zak, a.fn_price, a.fd_goden_do, 
       a.fl_is_imported, a.fn_imp_group_num, a.fn_imp_type, a.fn_status,
       a.fc_serial, a.fk_timp_docs, a.fl_is_from_excel)
                          values (
       afc_post, afc_name, afc_ei, afc_kol, afc_kol_zak, afc_price,
       afc_goden_do, afk_post_id, afk_name_id, afk_ei_id, afn_kol,
       afn_kol_zak, afn_price, afd_goden_do, 
       afl_is_imported, afn_imp_group_num, afn_imp_type, afn_status,
       afc_serial, afk_timp_docs, afl_is_from_excel)
                          returning a.fk_id into nRes;
     return nRes;                             
   END IMP_INS;
--============================================================================--      
   PROCEDURE IMP_UPD(afk_id           ASU.TIMP_POST_NAKL.FK_ID%TYPE,
                    afc_post          ASU.TIMP_POST_NAKL.fc_post%TYPE,
                    afc_name          ASU.TIMP_POST_NAKL.fc_name%TYPE,
                    afc_ei            ASU.TIMP_POST_NAKL.fc_ei%TYPE,
                    afc_kol           ASU.TIMP_POST_NAKL.fc_kol%TYPE,
                    afc_kol_zak       ASU.TIMP_POST_NAKL.fc_kol_zak%TYPE,
                    afc_price         ASU.TIMP_POST_NAKL.fc_price%TYPE,
                    afc_goden_do      ASU.TIMP_POST_NAKL.fc_goden_do%TYPE,
                    afk_post_id       ASU.TIMP_POST_NAKL.fk_post_id%TYPE,
                    afk_name_id       ASU.TIMP_POST_NAKL.fk_name_id%TYPE,
                    afk_ei_id         ASU.TIMP_POST_NAKL.fk_ei_id%TYPE,
                    afn_kol           ASU.TIMP_POST_NAKL.fn_kol%TYPE,
                    afn_kol_zak       ASU.TIMP_POST_NAKL.fn_kol_zak%TYPE,
                    afn_price         ASU.TIMP_POST_NAKL.fn_price%TYPE,
                    afd_goden_do      ASU.TIMP_POST_NAKL.fd_goden_do%TYPE,
                    afl_is_imported   ASU.TIMP_POST_NAKL.fl_is_imported%TYPE,
                    afn_imp_group_num ASU.TIMP_POST_NAKL.fn_imp_group_num%TYPE,
                    afn_imp_type      ASU.TIMP_POST_NAKL.fn_imp_type%TYPE,
                    afn_status        ASU.TIMP_POST_NAKL.fn_status%TYPE,
                    afc_serial        ASU.TIMP_POST_NAKL.fc_serial%TYPE,
                    afk_timp_docs     ASU.TIMP_POST_NAKL.fk_timp_docs%TYPE,
                    afl_is_from_excel ASU.TIMP_POST_NAKL.fl_is_from_excel%TYPE)
   IS
   BEGIN
     update asu.TIMP_POST_NAKL a 
                set a.fc_post          = afc_post,
                    a.fc_name          = afc_name,
                    a.fc_ei            = afc_ei,
                    a.fc_kol           = afc_kol,
                    a.fc_kol_zak       = afc_kol_zak,
                    a.fc_price         = afc_price,
                    a.fc_goden_do      = afc_goden_do,
                    a.fk_post_id       = afk_post_id,
                    a.fk_name_id       = afk_name_id,
                    a.fk_ei_id         = afk_ei_id,
                    a.fn_kol           = afn_kol,
                    a.fn_kol_zak       = afn_kol_zak,
                    a.fn_price         = afn_price,
                    a.fd_goden_do      = afd_goden_do,
                    a.fl_is_imported   = afl_is_imported,
                    a.fn_imp_group_num = afn_imp_group_num,
                    a.fn_imp_type      = afn_imp_type,
                    a.fn_status        = afn_status,
                    a.fc_serial        = afc_serial,
                    a.fk_timp_docs     = afk_timp_docs,
                    a.fl_is_from_excel = afl_is_from_excel
                          where a.fk_id = afk_id;      
   END IMP_UPD;   
--============================================================================--   
   PROCEDURE IMP_DEL(afk_id ASU.timp_post_nakl.FK_ID%TYPE)
   IS
   BEGIN
     delete from asu.TIMP_POST_NAKL a where a.fk_id = afk_id;      
   END IMP_DEL;        
--============================================================================--   
   FUNCTION NAKL_PRICE_CHECK_BY_DOGOVOR
    ( aPostID IN NUMBER, 
      aItemID IN NUMBER, -- позиция из спецфикации - продукт или медикамент
      aNaklDate IN DATE,
      aNaklPrice  IN NUMBER,
      atspis_prod_id OUT NUMBER,
      aNAKL_TYPE IN NUMBER DEFAULT 0) RETURN NUMBER
    IS
     ptspis_prod_id NUMBER;
     pKol NUMBER;
     pPrice NUMBER;
     pRecCount NUMBER;
     
     CURSOR cSPIS_DOG_ITEMS(pPostID NUMBER, pItemID NUMBER) IS
     SELECT a.fk_id, a.fn_kol, a.fn_price
  FROM buh.tspis_prod a, buh.tspecname c, buh.tdog_post d
  where a.fk_specname_id = c.fk_id
    and c.fk_dog_id = d.fk_id
    and d.fk_company = pPostID
    and a.fk_ts_names_id = pItemID
    and TRUNC(aNaklDate) BETWEEN TRUNC(d.fd_begin) AND TRUNC(d.fd_end)
    and d.fn_activ = 0
    and d.fk_type = aNAKL_TYPE;

   BEGIN 
     atspis_prod_id := null;
     ptspis_prod_id := null;
     pRecCount := 0;
     OPEN cSPIS_DOG_ITEMS(aPostID, aItemID);
     LOOP
       FETCH cSPIS_DOG_ITEMS INTO ptspis_prod_id, pKol, pPrice;
       EXIT WHEN cSPIS_DOG_ITEMS%NOTFOUND;
       pRecCount := pRecCount + 1;
       atspis_prod_id := ptspis_prod_id; 
       if pPrice = aNaklPrice then 
         atspis_prod_id := ptspis_prod_id;
         CLOSE cSPIS_DOG_ITEMS;
         return 0;
       end if;
     END LOOP;       
     CLOSE cSPIS_DOG_ITEMS;
     -- сюда попадаем только в случае выхода из цикла когда cSPIS_PROD%NOTFOUND
     if pRecCount =0 then
       ptspis_prod_id := null;
       return -3;
     end if;
     if pRecCount > 1 then
       ptspis_prod_id := null;
       return -2;
     end if;
     if pRecCount = 1 then
       if pPrice > aNaklPrice then  -- случай, когда цена по договору больше - поставщик отдает дешевле договора
         atspis_prod_id := ptspis_prod_id;
         return -1;
       end if;        
       if pPrice < aNaklPrice then  -- случай, когда цена по договору меньше - поставщик хочет наебать
         atspis_prod_id := ptspis_prod_id;
         return -4;
       end if;           
     end if;     
   END NAKL_PRICE_CHECK_BY_DOGOVOR;
--============================================================================--   
   FUNCTION NAKL_FOOD_PRICE_CHECK
    ( aPostID IN NUMBER, 
      aFoodID IN NUMBER,
      aNaklDate IN DATE,
      aNaklPrice  IN NUMBER,
      atspis_prod_id OUT NUMBER) RETURN NUMBER
    IS
   BEGIN 
     return NAKL_PRICE_CHECK_BY_DOGOVOR(aPostID, aFoodID, aNaklDate, aNaklPrice, atspis_prod_id, 0);
   END NAKL_FOOD_PRICE_CHECK;
--============================================================================--   
-- функция дает расшифровку статуса, возвращаемую процедурой CALC_IMP_STATUS(..., aFN_STATUS, ...)
--============================================================================--   
FUNCTION DECODE_FN_STATUS( aFN_STATUS NUMBER) RETURN VARCHAR2 IS
BEGIN
   CASE NVL(aFN_STATUS,-1)
           WHEN 0  THEN return 'ОК';
           WHEN 1  THEN return 'Не указан поставщик';
           WHEN 2  THEN return 'Не указано наименование';
           WHEN 3  THEN return 'Не найдена единица измерения';
           WHEN 4  THEN return 'Цена не совпадает с договорной';
           WHEN 5  THEN return 'Продукт не найден в договоре';
           WHEN 6  THEN return 'Кол-во поставки не указано';
           WHEN 7  THEN return 'Не указано кол-во заказа';
           WHEN 8  THEN return 'Не указана цена';
           WHEN 9  THEN return 'Не указан срок годности';
           WHEN -1 THEN return 'Не проверено';
           ELSE return '';
   END CASE;              
END;
--============================================================================--   
-- значения aFN_STATUS смотри в DECODE_FN_STATUS
--============================================================================--   
PROCEDURE CALC_IMP_STATUS(aFK_ID IN NUMBER, aNaklDate IN DATE, aFK_FROM IN NUMBER, aFN_IMP_TYPE IN NUMBER, aFN_STATUS OUT NUMBER, atspis_prod_id OUT NUMBER)
IS
CURSOR cIMP_FOOD(pFK_ID NUMBER) IS
SELECT p.fc_name, n.fc_name, ei.fc_ei, ipn.fk_post_id, ipn.fk_name_id, ipn.fk_ei_id, fn_price, FN_KOL, fn_kol_zak, fd_goden_do
  FROM asu.timp_post_nakl ipn, buh.ts_names n, buh.ts_ei ei, buh.ts_org p
  where ipn.fk_name_id = n.fk_id(+)
    and ipn.fk_ei_id   = ei.fk_id(+)
    and ipn.fk_post_id = p.fk_id(+)
    and ipn.fk_id      = pFK_ID;

CURSOR cIMP_MED(pFK_ID NUMBER) IS
SELECT p.fc_name, m.fc_name, ei.fc_name as fc_ei, ipn.fk_post_id, ipn.fk_name_id, ipn.fk_ei_id, fn_price, FN_KOL, fn_kol_zak, fd_goden_do
  FROM asu.timp_post_nakl ipn, med.tmedic m, med.tei ei, med.tpostav p
  where ipn.fk_name_id = m.medicid(+)
    and ipn.fk_ei_id   = ei.eiid(+)
    and ipn.fk_post_id = p.postavid(+)
    and ipn.fk_id      = pFK_ID;
  
  pfc_post_name VARCHAR2(500);
  pfc_name      VARCHAR2(500);
  pfc_ei        VARCHAR2(50);
  pfk_company_id NUMBER;
  pfk_name_id NUMBER;
  pfk_ei_id NUMBER;
  pfn_price NUMBER;
  pfn_kol NUMBER;
  pfn_kol_zak NUMBER;  
  pfd_goden_do DATE;  
  pPRICE_CHECK_RES NUMBER;
BEGIN
   if aFN_IMP_TYPE = 0 then
     OPEN cIMP_FOOD(aFK_ID);
     FETCH cIMP_FOOD INTO pfc_post_name, pfc_name, pfc_ei, pfk_company_id, pfk_name_id, pfk_ei_id, pfn_price, pfn_kol, pfn_kol_zak, pfd_goden_do;
     close cIMP_FOOD;
   else
     OPEN cIMP_MED(aFK_ID);
     FETCH cIMP_MED INTO pfc_post_name, pfc_name, pfc_ei, pfk_company_id, pfk_name_id, pfk_ei_id, pfn_price, pfn_kol, pfn_kol_zak, pfd_goden_do;
     close cIMP_MED;     
   end if;  
   
   atspis_prod_id := null;
   aFN_STATUS := null;
--   if (pfc_post_name is null)or(pfk_company_id is null) then -- так было раньше
  if (aFK_FROM is null) then
     aFN_STATUS := 1;
   else
     if (pfc_name is null)or(pfk_name_id is null) then
       aFN_STATUS := 2;
     else
       if (pfc_ei is null)or(pfk_ei_id is null) then
        aFN_STATUS := 3;
       else
         if pfn_kol is null then       
           aFN_STATUS := 6;       
         else  
           if pfn_kol_zak is null then
             aFN_STATUS := 7;
           else  
             if pfn_price is null then
               aFN_STATUS := 8;
             else       
               if pfd_goden_do is null then
                 aFN_STATUS := 9;
               else                
                 pPRICE_CHECK_RES := NAKL_FOOD_PRICE_CHECK(pfk_company_id, pfk_name_id, aNaklDate, pfn_price, atspis_prod_id);
                 if pPRICE_CHECK_RES = 0 then
                   aFN_STATUS := 0;
                 else
                   if pPRICE_CHECK_RES = -3 then -- продукт не найден в договоре
                     aFN_STATUS := 5;           
                   else
                     aFN_STATUS := 4;           
                   end if; 
                 end if;                    
               end if;                                       
             end if;                   
           end if;  
         end if;
       end if;     
     end if;
   end if;
END CALC_IMP_STATUS;
--============================================================================--   
PROCEDURE SET_IMP_STATUS(aFK_ID IN NUMBER, aNaklDate IN DATE, aFK_FROM IN NUMBER, aFN_IMP_TYPE IN NUMBER)
IS
  ptspis_prod_id NUMBER; 
  pFN_STATUS NUMBER;
BEGIN
   CALC_IMP_STATUS(aFK_ID, aNaklDate, aFK_FROM, aFN_IMP_TYPE, pFN_STATUS, ptspis_prod_id);
   update asu.timp_post_nakl set FN_STATUS=pFN_STATUS, FK_tspis_prod_id=ptspis_prod_id  where fk_id = aFK_ID;   
END SET_IMP_STATUS;
--============================================================================--   
END;
/


-- End of DDL Script for Package Body ASU.PKG_IMP_POST_NAKL

