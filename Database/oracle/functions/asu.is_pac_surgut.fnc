DROP FUNCTION ASU.IS_PAC_SURGUT
/

--
-- IS_PAC_SURGUT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   PKG_REGIST_PACFUNC (Package)
--   IS_PEPL_SURGUT (Function)
--
CREATE OR REPLACE FUNCTION ASU."IS_PAC_SURGUT" (pPaclID NUMBER) RETURN NUMBER IS
  -- Created by Ищуков С.С. 07,09,2015
BEGIN
  RETURN ASU.IS_PEPL_SURGUT(asu.pkg_regist_pacfunc.GET_PEPL_ID(pPaclID));
END;
/

SHOW ERRORS;


