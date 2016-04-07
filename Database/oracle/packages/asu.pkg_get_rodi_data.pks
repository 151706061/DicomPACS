DROP PACKAGE ASU.PKG_GET_RODI_DATA
/

--
-- PKG_GET_RODI_DATA  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_GET_RODI_DATA" 
  IS
  function GetNazOsmotr(pPacID Number) RETURN NUMBER;
  function GetPacBerem(pPacID Number) RETURN NUMBER;
  function GetResult(pSmidSynOsm Varchar2, pVarType Varchar2,  pNazOsmotr  Number) return varchar;
  function GetCombo(pSmidSynOsm Varchar2, pNazOsmotr  Number) RETURN NUMBER;
  function GetEdit(pSmidSynOsm Varchar2, pNazOsmotr  Number) RETURN VARCHAR ;
  function GetNumber(pSmidSynOsm Varchar2, pNazOsmotr  Number) RETURN NUMBER;
  function GetDate(pSmidSynOsm Varchar2, pNazOsmotr  Number) RETURN VARCHAR;
  function GetLsDate(pPacID NUMBER) RETURN Varchar2;

  function GetResult(pSmidID NUMBER, pVarType Varchar2,  pNazOsmotr  Number) return varchar;
  function GetCombo(pSmidID Number, pNazOsmotr  Number) RETURN NUMBER;
  function GetEdit(pSmidID Number, pNazOsmotr  Number) RETURN VARCHAR ;
  function GetNumber(pSmidID Number, pNazOsmotr  Number) RETURN NUMBER;
  function GetDate(pSmidID Number, pNazOsmotr  Number) RETURN VARCHAR;

END;
/

SHOW ERRORS;


