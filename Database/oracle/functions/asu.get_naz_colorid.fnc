DROP FUNCTION ASU.GET_NAZ_COLORID
/

--
-- GET_NAZ_COLORID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TLABSORT (Table)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAZ_COLORID" (pFK_ID IN NUMBER) RETURN NUMBER IS
  CURSOR cColor IS SELECT FK_COLOR
                   FROM TLABSORT, TSMID
                   WHERE TLABSORT.FK_SMID IN (SELECT FK_ID
                                            FROM TSMID
                                            START WITH FK_OWNER = pFK_ID
                                            CONNECT BY PRIOR FK_ID = FK_OWNER)
                         AND FK_COLOR = TSMID.FK_ID
                         AND ROWNUM = 1;
  cCol NUMBER;
  cRes NUMBER;
BEGIN
    FOR cCol IN cColor LOOP
        cRes := cCol.FK_COLOR;
        RETURN cRes;
    END LOOP;
  RETURN cRes;
END;
/

SHOW ERRORS;


