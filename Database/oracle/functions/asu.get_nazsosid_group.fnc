DROP FUNCTION ASU.GET_NAZSOSID_GROUP
/

--
-- GET_NAZSOSID_GROUP  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAN (Table)
--   TNAZGROUP (Table)
--   TSMID_RIGHTS (Table)
--   GET_NAZ_OTKAZ (Function)
--   GET_NAZ_PROCESS (Function)
--   GET_VIPNAZ (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAZSOSID_GROUP" (pFD_DATE IN DATE, pFN_PROBE IN NUMBER, pFK_GROUPID IN NUMBER,  pFK_SOTRID IN NUMBER, pFK_VRACHID IN NUMBER, pFK_PACID IN NUMBER, pFD_RUN IN DATE, pFK_NAZTYPEID IN NUMBER, pFD_DATERUN IN DATE) RETURN  NUMBER IS
     CURSOR cNAZSOS IS SELECT TNAZAN.FK_NAZSOSID
                       FROM TNAZGROUP, TNAZAN
                       WHERE TNAZGROUP.FK_NAZID = TNAZAN.FK_ID
                             AND TNAZGROUP.FK_GROUPID = pFK_GROUPID
                             AND TNAZGROUP.FN_PROBE = pFN_PROBE
                             AND TNAZGROUP.FK_PACID = pFK_PACID
                             AND TNAZGROUP.FK_VRACHID = pFK_VRACHID
                             AND TNAZGROUP.FD_RUN = pFD_RUN
                             AND TNAZGROUP.FD_DATE = pFD_DATERUN
                             AND TNAZGROUP.FD_REGIST >= TRUNC(pFD_DATE) AND TNAZGROUP.FD_REGIST < TRUNC(pFD_DATE + 1)
                             AND TNAZAN.FK_NAZTYPEID = pFK_NAZTYPEID
                             AND TNAZAN.FK_SMID IN (SELECT FK_SMID
                                         FROM TSMID_RIGHTS
                                         WHERE FK_SOTRID = pFK_SOTRID)
                      GROUP BY FK_NAZSOSID;

 nFK_SOS NUMBER;
 i number;
BEGIN
    nFK_SOS := -1;
    i := 0;
    FOR strSOS IN cNAZSOS LOOP
        i := i + 1;
        IF (nFK_SOS = GET_NAZ_PROCESS) or (nFK_SOS = GET_VIPNAZ) or (nFK_SOS = GET_NAZ_OTKAZ) THEN
           null;
        ELSIF (strSOS.FK_NAZSOSID = GET_NAZ_PROCESS) THEN
            nFK_SOS := strSOS.FK_NAZSOSID;
        ELSIF (strSOS.FK_NAZSOSID = GET_VIPNAZ) THEN
            nFK_SOS := strSOS.FK_NAZSOSID;
        ELSIF (strSOS.FK_NAZSOSID = GET_NAZ_OTKAZ) THEN
            nFK_SOS := strSOS.FK_NAZSOSID;
        ELSIF (nFK_SOS <> GET_NAZ_PROCESS) AND (nFK_SOS <> GET_VIPNAZ) AND (nFK_SOS <> GET_NAZ_OTKAZ) THEN
            nFK_SOS := strSOS.FK_NAZSOSID;
        END IF;
    END LOOP;
    IF i > 1 AND ((nFK_SOS <> GET_NAZ_PROCESS) AND (nFK_SOS <> GET_VIPNAZ) AND (nFK_SOS <> GET_NAZ_OTKAZ)) THEN
        RETURN GET_NAZ_PROCESS;
    END IF;
    RETURN nFK_SOS;

END;
/

SHOW ERRORS;


