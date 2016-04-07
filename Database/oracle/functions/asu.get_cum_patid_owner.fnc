DROP FUNCTION ASU.GET_CUM_PATID_OWNER
/

--
-- GET_CUM_PATID_OWNER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TRESAN (Table)
--   TPATNAME (Table)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_CUM_PATID_OWNER" 
  ( pFK_NAZID IN NUMBER,pFK_OWNER IN NUMBER,pFK_COLID IN NUMBER)
  RETURN NUMBER IS
--
-- Purpose:Возвращает максимальный IDшник патологии из резанов у набора чилдов с оунером, передаваемым как параметр
--
-- By Philip A. Milovanov
--
-- Created 05.12.2001 22:26
CURSOR c ( cpFK_NAZID NUMBER,cpFK_OWNER NUMBER)IS
        SELECT TRESAN.FK_PATID
        FROM TRESAN,TSMID,TPATNAME
        WHERE TSMID.FK_OWNER=cpFK_OWNER AND
              TRESAN.FK_NAZID=cpFK_NAZID AND
              TRESAN.FK_SMID=TSMID.FK_ID AND
              TRESAN.FK_PATID=TPATNAME.FK_ID AND
              FP_PRIOR=(SELECT MAX(FP_PRIOR)
                          FROM TRESAN,TSMID,TPATNAME
                          WHERE TSMID.FK_OWNER=cpFK_OWNER AND
                              TRESAN.FK_NAZID=cpFK_NAZID AND
                              TRESAN.FK_SMID=TSMID.FK_ID AND
                              TRESAN.FK_PATID=TPATNAME.FK_ID);
CURSOR cCol ( cpFK_NAZID NUMBER,cpFK_OWNER NUMBER,cpFK_COLID NUMBER)IS
        SELECT TRESAN.FK_PATID
        FROM TRESAN,TSMID,TPATNAME
        WHERE TSMID.FK_OWNER=cpFK_OWNER AND
              TRESAN.FK_NAZID=cpFK_NAZID AND
              TRESAN.FK_SMID=TSMID.FK_ID AND
              TRESAN.FK_COLID=cpFK_COLID AND
              TRESAN.FK_PATID=TPATNAME.FK_ID AND
              FP_PRIOR=(SELECT MAX(FP_PRIOR)
                          FROM TRESAN,TSMID,TPATNAME
                          WHERE TSMID.FK_OWNER=cpFK_OWNER AND
                              TRESAN.FK_NAZID=cpFK_NAZID AND
                              TRESAN.FK_SMID=TSMID.FK_ID AND
                              TRESAN.FK_COLID=cpFK_COLID AND
                              TRESAN.FK_PATID=TPATNAME.FK_ID);
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


