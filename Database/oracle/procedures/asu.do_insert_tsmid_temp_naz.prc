DROP PROCEDURE ASU.DO_INSERT_TSMID_TEMP_NAZ
/

--
-- DO_INSERT_TSMID_TEMP_NAZ  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   SEQ_TSMID_TEMP_NAZ (Sequence)
--   TNAZGROUP (Table)
--   TSMID (Table)
--   TSMID_RIGHTS (Table)
--   TSMID_TEMP_NAZ (Table)
--   TEXPAN (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_INSERT_TSMID_TEMP_NAZ" (pFD_DATE IN DATE, pFN_PROBE IN NUMBER, pFK_GROUPID IN NUMBER,  pFK_SOTRID IN NUMBER, pFK_VRACHID IN NUMBER, pFK_PACID IN NUMBER, pFD_RUN IN DATE, pNAZ_TYPE IN NUMBER, pFD_DATERUN IN DATE) IS
 CURSOR cNAZ IS SELECT TSMID.FK_ID, TNAZGROUP.FK_NAZID FK_NAZID
                FROM TNAZGROUP, TSMID
                WHERE TNAZGROUP.FK_GROUPID = pFK_GROUPID
                      AND TNAZGROUP.FK_PACID = pFK_PACID
                      AND TNAZGROUP.FN_PROBE = pFN_PROBE
                      AND TNAZGROUP.FK_VRACHID = pFK_VRACHID
                      AND TNAZGROUP.FK_SMID = TSMID.FK_ID
                      AND TNAZGROUP.FD_DATE =  pFD_DATERUN
                      AND TRUNC(TNAZGROUP.FD_REGIST) = TRUNC(pFD_DATE)
                      AND TNAZGROUP.FD_RUN = pFD_RUN
                      AND FK_NAZTYPEID = pNAZ_TYPE
                    --  AND TSMID.FL_DEL = 0
                      AND EXISTS (SELECT FK_ID
                                  FROM TSMID_RIGHTS
                                  WHERE FK_SOTRID = pFK_SOTRID
                                         AND FK_SMID = TNAZGROUP.FK_SMID)
                ORDER BY  TSMID.FN_ORDER;

 CURSOR GET_HEADER(pFK_NAZID IN NUMBER, pFK_SMID IN NUMBER) IS SELECT FK_ID, FC_TYPE
                                FROM TSMID
                                WHERE  FL_SHOWANAL = 4
                         --              AND TSMID.FL_DEL = 0
                                       AND FK_ID IN (SELECT FK_SMID FROM TEXPAN WHERE FK_NAZID=pFK_NAZID)
                                       AND FK_OWNER = pFK_SMID
                                       AND fl_del = 0
                                ORDER BY TSMID.FN_ORDER;
    i NUMBER;
    j NUMBER;
BEGIN
  FOR j in cNAZ loop
    for i in GET_HEADER(j.FK_NAZID, j.FK_ID) loop
        INSERT INTO TSMID_TEMP_NAZ
        SELECT SEQ_TSMID_TEMP_NAZ.NEXTVAL FK_ID, FK_ID FK_SMID, j.FK_ID FK_SMIDNAZID, j.FK_NAZID FK_NAZID, FN_ORDER, FK_OWNER
        FROM TSMID
        WHERE  FK_ID = i.FK_ID;

        IF i.FC_TYPE ='FOLDER' THEN
         INSERT INTO TSMID_TEMP_NAZ
         SELECT SEQ_TSMID_TEMP_NAZ.NEXTVAL FK_ID, T.*
         FROM(SELECT FK_ID FK_SMID, j.FK_ID FK_SMIDNAZID, j.FK_NAZID FK_NAZID, FN_ORDER, FK_OWNER
         FROM TSMID
         WHERE  FL_SHOWANAL = 4
                AND TSMID.FL_DEL = 0
                AND FK_ID IN (SELECT FK_SMID FROM TEXPAN WHERE FK_NAZID=j.FK_NAZID)
         START WITH FK_OWNER = i.FK_ID
         CONNECT BY PRIOR FK_ID = FK_OWNER
         ORDER BY TSMID.FN_ORDER)T;
        END IF;
    end loop;
  end loop;
END;
/

SHOW ERRORS;


