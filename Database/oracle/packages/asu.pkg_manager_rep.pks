DROP PACKAGE ASU.PKG_MANAGER_REP
/

--
-- PKG_MANAGER_REP  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.PKG_MANAGER_REP
  IS
  FUNCTION get_nazlist_table(pPACID IN NUMBER, pSotrID IN NUMBER DEFAULT NULL, pProcCab IN NUMBER DEFAULT 0) RETURN NUMBER;
--  FUNCTION get_priemlist(pVRACHID IN NUMBER,date1 IN DATE,date2 IN DATE) RETURN NUMBER;
  FUNCTION get_priemlist_prev(pVRACHID IN NUMBER,date1 IN DATE,date2 IN DATE, pFK_SMID in number) RETURN NUMBER;
  function get_pac_primary_diag(ppacid IN NUMBER) return VARCHAR2;
  function get_nazoper_diag(pNAZOPERID IN NUMBER) return varchar2;
  FUNCTION get_nazlist_table(pPACID IN NUMBER, pStartDate IN DATE, pIsUseStartDate IN NUMBER, pSotrID IN NUMBER DEFAULT NULL, pProcCab IN NUMBER DEFAULT 0)  RETURN NUMBER;
FUNCTION get_priemlist(pVRACHID IN NUMBER,date1 IN DATE,date2 IN DATE, pFK_KABINETID in number)
  RETURN NUMBER;
  
  
  FUNCTION get_priemlist_okb(pVRACHID IN NUMBER,date1 IN DATE,date2 IN DATE, ppFK_KABINETID in number)
  RETURN NUMBER;
END;
/

SHOW ERRORS;


