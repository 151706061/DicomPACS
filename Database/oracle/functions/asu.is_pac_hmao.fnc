DROP FUNCTION ASU.IS_PAC_HMAO
/

--
-- IS_PAC_HMAO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   PKG_REGIST_PACFUNC (Package)
--   IS_PEPL_HMAO (Function)
--
CREATE OR REPLACE FUNCTION ASU."IS_PAC_HMAO" (pPaclID NUMBER) RETURN NUMBER IS
  -- Created by Ищуков С.С. 01,09,2015
BEGIN
  RETURN ASU.IS_PEPL_HMAO(asu.pkg_regist_pacfunc.GET_PEPL_ID(pPaclID));
END;
/

SHOW ERRORS;


