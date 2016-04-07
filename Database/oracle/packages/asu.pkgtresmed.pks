DROP PACKAGE ASU.PKGTRESMED
/

--
-- PKGTRESMED  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TRESMED (Table)
--   TRESMEDCONT (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKGTRESMED" 
IS
  TYPE ttresmedcont IS TABLE OF tresmedcont%ROWTYPE
    INDEX BY BINARY_INTEGER;
  aOldResMedCont     ttresmedcont;
  aNewResMedCont     ttresmedcont;
  aEmptyResMedCont   ttresmedcont;
  sOpertaion char(1) default ''; -- I - insert, U - update, D - delete
/*-------------------------------------------------------------------------------------------*\
|               Cursors
\*-------------------------------------------------------------------------------------------*/
  CURSOR cGetByID (pFK_ID IN INTEGER)
  IS
    SELECT FD_DATA, FK_SOTRID, FK_NAZMEDID, FK_APOSTAVSHIKID, FK_RECEPTID
      FROM tresmed
     WHERE fk_id = pFK_ID;
  CURSOR cGetcountNazVyp (pFK_NAZID IN NUMBER)
  IS
    SELECT COUNT (fk_id)
      FROM tresmed
     WHERE fk_nazmedid = pFK_NAZID;
/*-------------------------------------------------------------------------------------------*\
|               Procedures
\*-------------------------------------------------------------------------------------------*/
  PROCEDURE DoCopy (nResMedID IN NUMBER, nCount IN NUMBER);
  FUNCTION DoSet (
    pFD_DATA            IN   DATE,
    pFK_SOTRID          IN   NUMBER,
    pFK_NAZMEDID        IN   NUMBER,
    pFK_APOSTAVSHIKID   IN   NUMBER,
    pFK_RECEPTID        IN   NUMBER DEFAULT -1,
    pFK_ID              IN   INTEGER DEFAULT -1,
    --вставляет медикаменты по умолчанию
    pDEFAULT            IN   NUMBER DEFAULT 1)
    RETURN NUMBER;
  PROCEDURE DoDel (pfk_id IN INTEGER);
  PROCEDURE GetByID (pfk_id IN INTEGER, pFD_DATE OUT DATE, pFK_SOTRID OUT NUMBER, pFK_NAZMEDID OUT NUMBER, pFK_APOSTAVSHIKID OUT NUMBER, pFK_RECEPTID OUT NUMBER);
  FUNCTION countNazVyp (pFK_NAZID IN NUMBER)
    RETURN NUMBER;
  PROCEDURE DoSetCon (pFK_RESMEDID IN NUMBER, pFK_MEDICID IN NUMBER, pFN_KOL IN NUMBER, pFK_MEDKARTID IN NUMBER);
  PROCEDURE RebuildSaldoTable;
  PROCEDURE RebuildSaldoTableForMedKart (pFK_MEDKARTID IN NUMBER, dFrom IN DATE);
END PKGtresmed;
-- END PL/SQL BLOCK (do not remove this line) ----------------------------------
/

SHOW ERRORS;


