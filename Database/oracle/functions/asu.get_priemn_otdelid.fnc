DROP FUNCTION ASU.GET_PRIEMN_OTDELID
/

--
-- GET_PRIEMN_OTDELID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMINI (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PRIEMN_OTDELID" 
  RETURN  NUMBER IS
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Nefedov S.M. 22.02.2006  Возвращает код приёмного отделения
-- ---------   ------  -------------------------------------------
CURSOR cOtdel IS
    SELECT to_number(fc_value) nOtdelID
    FROM tsmini
    where UPPER(fc_section)='CONFIG'
    and UPPER(fc_key)='PRIEMN_OTD_VRACH';
    nOtdelID NUMBER;
BEGIN 
    OPEN cOtdel;
    FETCH cOtdel INTO nOtdelID;
    CLOSE cOtdel;
    
    RETURN nvl(nOtdelID,0);
END;
/

SHOW ERRORS;


