DROP FUNCTION ASU.GET_LAB_CUR_DAY
/

--
-- GET_LAB_CUR_DAY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMINI (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_LAB_CUR_DAY" RETURN DATE IS
    dDate DATE;

BEGIN
    dDate := NULL;
    SELECT TO_DATE(DECODE(FC_VALUE, NULL, to_char(sysdate, 'dd.mm.yyyy hh24:mi:ss'), FC_VALUE), 'dd.mm.yyyy hh24:mi:ss') INTO dDate FROM TSMINI WHERE FC_SECTION = 'LAB' AND FC_KEY = 'CUR_DAY';
    RETURN dDate;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN trunc(sysdate, 'dd.mm.yyyy hh24:mi:ss');
    WHEN OTHERS THEN
      RETURN trunc(sysdate, 'dd.mm.yyyy hh24:mi:ss');
END;
/

SHOW ERRORS;


