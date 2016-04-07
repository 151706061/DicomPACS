DROP FUNCTION ASU.GET_MAPPING_SPR_STR
/

--
-- GET_MAPPING_SPR_STR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TEXCHANGE_COMPANY (Table)
--   TEXCHANGE_OWN (Table)
--   TEXCHANGE_THEIR (Table)
--   TTABLES (Table)
--   GET_IEMK_COMPANY_ID (Function)
--
CREATE OR REPLACE FUNCTION ASU.GET_MAPPING_SPR_STR(pTHEIR_SPR_NAME VARCHAR2, pOWN_SPR_NAME VARCHAR2, pOWN_CODE NUMBER, pCOMP_IDV NUMBER DEFAULT ASU.GET_IEMK_COMPANY_ID)
 RETURN VARCHAR2
IS
--Возвращает строковое значение из справочника соответсвий
-- pTHEIR_SPR_NAME  -  название "их" справочника
-- pOWN_SPR_NAME - название "нашего" справочника
-- pOWN_CODE - ключ из "нашего" справочника
-- pCOMP_IDV - ID строки для "комапнии" в справочнике соответсвий
  retVal  exch43.texchange_their.FC_VALUE%TYPE;
BEGIN
   select MAX(td_t.FC_VALUE) INTO retVal
   from exch43.texchange_company tc
       inner join exch43.ttables tt_t on tt_t.fk_company = tc.fk_id
       inner join exch43.texchange_their td_t on td_t.fk_table = tt_t.fk_id
       inner join exch43.texchange_own td_o on td_o.fk_their = td_t.fk_id
       inner join exch43.ttables tt_o on tt_o.fk_id = td_o.fk_table
   where td_t.fl_del = 0 and td_o.fl_del = 0
       AND tc.fk_id = pCOMP_IDV AND tt_t.fc_name = pTHEIR_SPR_NAME
       AND tt_o.fc_name = pOWN_SPR_NAME AND td_o.fn_code = pOWN_CODE;

   RETURN retVal;
END;
/

SHOW ERRORS;


