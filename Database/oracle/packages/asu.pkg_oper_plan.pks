DROP PACKAGE ASU.PKG_OPER_PLAN
/

--
-- PKG_OPER_PLAN  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_OPER_PLAN" 
  IS
   --created by Netrebenko
   --modified by A.Nakorjakov 14.07.08
   FUNCTION GetSotrList(pFK_NAZID IN NUMBER, pFP_MEMTYPE IN NUMBER) RETURN VARCHAR2;

END; -- Package spec
/

SHOW ERRORS;


