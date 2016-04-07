DROP FUNCTION ASU.IS_PAC_KMNS
/

--
-- IS_PAC_KMNS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   PKG_REGIST_PACFUNC (Package)
--   IS_PEPL_KMNS (Function)
--
CREATE OR REPLACE FUNCTION ASU."IS_PAC_KMNS" (pPaclID NUMBER) RETURN NUMBER IS
  --created by Spassliy S.N. 03122008
  Res NUMBER;
BEGIN
  RETURN ASU.IS_PEPL_KMNS(asu.pkg_regist_pacfunc.GET_PEPL_ID(pPaclID));
END;
/

SHOW ERRORS;


