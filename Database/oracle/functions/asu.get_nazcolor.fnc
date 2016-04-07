DROP FUNCTION ASU.GET_NAZCOLOR
/

--
-- GET_NAZCOLOR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TLABSORT (Table)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAZCOLOR" (pFK_ID IN NUMBER) RETURN VARCHAR IS
  CURSOR cColor IS SELECT FC_REMARK
                   FROM TLABSORT, TSMID
                   WHERE TLABSORT.FK_SMID IN (SELECT FK_ID
                                            FROM TSMID
                                            START WITH FK_ID = pFK_ID
                                            CONNECT BY PRIOR FK_ID = FK_OWNER)
                         AND FK_COLOR = TSMID.FK_ID;
  cCol VARCHAR(30);
  cRes VARCHAR(30);
BEGIN
    FOR cCol IN cColor LOOP
        cRes := cCol.FC_REMARK;
    END LOOP;
  RETURN cRes;
END; -- Function GET_DEFAULT_FROM_SMID
/

SHOW ERRORS;


