DROP FUNCTION ASU.GET_MAX_RESULTID_OWNER
/

--
-- GET_MAX_RESULTID_OWNER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TRESAN (Table)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_MAX_RESULTID_OWNER" 
  ( pFK_NAZID IN NUMBER,pFK_OWNER IN NUMBER,pFK_COLID IN NUMBER)
  RETURN NUMBER IS
--
-- Purpose:Возвращает максимальный IDшник из резанов у набора чилдов с оунером, передаваемым как параметр
--
-- By Philip A. Milovanov
--
-- Created 05.12.2001 21:59
CURSOR c ( cpFK_NAZID NUMBER,cpFK_OWNER NUMBER)IS
            SELECT MAX(TRESAN.FK_ID)
            FROM TRESAN,TSMID
            WHERE TSMID.FK_OWNER=cpFK_OWNER AND
                  TRESAN.FK_NAZID=cpFK_NAZID AND
                  TRESAN.FK_SMID=TSMID.FK_ID;
CURSOR cCol ( cpFK_NAZID NUMBER,cpFK_OWNER NUMBER,cpFK_COLID NUMBER)IS
            SELECT MAX(TRESAN.FK_ID)
            FROM TRESAN,TSMID
            WHERE TSMID.FK_OWNER=cpFK_OWNER AND
                  TRESAN.FK_NAZID=cpFK_NAZID AND
                  TRESAN.FK_SMID=TSMID.FK_ID AND
                  TRESAN.FK_COLID=cpFK_COLID;
i NUMBER;
BEGIN
  IF pFK_COLID IS NULL THEN
    OPEN c(pFK_NAZID,pFK_OWNER);
    FETCH c INTO i;
    CLOSE c;
  ELSE
    OPEN cCol(pFK_NAZID,pFK_OWNER,pFK_COLID);
    FETCH cCol INTO i;
    CLOSE cCol;
  END IF;
  RETURN i;
END; -- Function GET_MAX_RESILTID_OWNER
/

SHOW ERRORS;


