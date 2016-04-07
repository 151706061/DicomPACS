DROP FUNCTION ASU.GET_NAZEXIST_GROUP
/

--
-- GET_NAZEXIST_GROUP  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZGROUP (Table)
--   TRESAN (Table)
--   TSMID_RIGHTS (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAZEXIST_GROUP" (pFD_DATE IN DATE, pFN_PROBE IN NUMBER, pFK_GROUPID IN NUMBER,  pFK_SOTRID IN NUMBER, pFK_VRACHID IN NUMBER, pFK_PACID IN NUMBER, pFD_RUN IN DATE, pFK_NAZTYPEID IN NUMBER) RETURN NUMBER IS
    CURSOR cNAZZAKL IS (SELECT /*+rule*/ TRESAN.FL_ZAKL
                       FROM TNAZGROUP, TRESAN
                       WHERE TNAZGROUP.FK_GROUPID = pFK_GROUPID
                             AND TNAZGROUP.FN_PROBE = pFN_PROBE
                             AND TNAZGROUP.FK_PACID = pFK_PACID
                             AND TNAZGROUP.FK_VRACHID = pFK_VRACHID
                             AND TNAZGROUP.FD_RUN = pFD_RUN
                             AND TRESAN.FK_NAZID (+) = TNAZGROUP.FK_NAZID
                             AND TRUNC(TNAZGROUP.FD_REGIST) = TRUNC(pFD_DATE)
                             AND FK_NAZTYPEID = pFK_NAZTYPEID
                             AND EXISTS (SELECT FK_ID
                                         FROM TSMID_RIGHTS
                                         WHERE FK_SOTRID = pFK_SOTRID
                                               AND FK_SMID = TNAZGROUP.FK_SMID)
                             AND TRESAN.FL_ZAKL (+) = 1);

 nNAZZAKL NUMBER;
 tempZakl NUMBER;
BEGIN
    FOR nNAZZAKL IN cNAZZAKL LOOP
        tempZakl := nNAZZAKL.FL_ZAKL;
        IF (tempZakl = 0) THEN
            RETURN 0;
        END IF;
    END LOOP;
    RETURN tempZakl;
END;
/

SHOW ERRORS;


