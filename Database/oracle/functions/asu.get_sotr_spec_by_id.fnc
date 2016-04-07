DROP FUNCTION ASU.GET_SOTR_SPEC_BY_ID
/

--
-- GET_SOTR_SPEC_BY_ID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TS_SPRAV (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SOTR_SPEC_BY_ID" (pfk_id IN NUMBER) RETURN VARCHAR2 IS
  Res VARCHAR2(100);
-- Created by Ищуков С.С. 08,09,2015
BEGIN
  select FC_NAME
    into Res
    from ASU.TS_SPRAV
   where FK_ID = pfk_id;

  RETURN Res;
END;
/

SHOW ERRORS;


