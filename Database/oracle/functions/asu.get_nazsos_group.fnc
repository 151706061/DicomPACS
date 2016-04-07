DROP FUNCTION ASU.GET_NAZSOS_GROUP
/

--
-- GET_NAZSOS_GROUP  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZGROUP (Table)
--   TRESAN (Table)
--   TSMID_RIGHTS (Table)
--   GET_NAZSOS (Function)
--   GET_SOSBYNAZ (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAZSOS_GROUP" (pFD_DATE IN DATE, pFN_PROBE IN NUMBER, pFK_GROUPID IN NUMBER,  pFK_SOTRID IN NUMBER,
 pFK_VRACHID IN NUMBER, pFK_PACID IN NUMBER, pFD_RUN IN DATE, pFK_NAZTYPEID IN NUMBER, pFD_DATERUN IN DATE default null) RETURN  VARCHAR IS
    CURSOR cNAZSOS IS (SELECT /*+rule*/ DISTINCT GET_NAZSOS(GET_SOSBYNAZ(TNAZGROUP.FK_NAZID)) FC_SOST, GET_SOSBYNAZ(TNAZGROUP.FK_NAZID) FK_NAZSOSID
                       FROM TNAZGROUP, TRESAN
                       WHERE TNAZGROUP.FK_GROUPID = pFK_GROUPID
                             AND TNAZGROUP.FN_PROBE = pFN_PROBE
                             AND TNAZGROUP.FK_PACID = pFK_PACID
                             AND TNAZGROUP.FK_VRACHID = pFK_VRACHID
                             AND TNAZGROUP.FD_RUN = pFD_RUN
                             and (tnazgroup.fd_date = pFD_DATERUN or pFD_DATERUN is null)
                             AND TRESAN.FK_NAZID (+) = TNAZGROUP.FK_NAZID
                             AND TRUNC(TNAZGROUP.FD_REGIST) = TRUNC(pFD_DATE)
                             AND FK_NAZTYPEID = pFK_NAZTYPEID
                             AND EXISTS (SELECT FK_ID
                                         FROM TSMID_RIGHTS
                                         WHERE FK_SOTRID = pFK_SOTRID
                                               AND FK_SMID = TNAZGROUP.FK_SMID)
                             AND TRESAN.FL_ZAKL (+) = 1 );

 strSOS  VARCHAR(20);
 strSOS2 VARCHAR(20);
 nFK_SOS NUMBER;
 i NUMBER;
 k NUmber;
BEGIN
    nFK_SOS := -1;
    i := 0;
    FOR strSOS IN cNAZSOS LOOP
        i := i + 1;
        IF (nFK_SOS = 4) THEN
           k := 1;
        ELSIF (nFK_SOS = 1) THEN
           k := 1;
        ELSIF (nFK_SOS = 23) THEN
           k := 1;
        ELSIF (strSOS.FK_NAZSOSID = 4) THEN
            nFK_SOS := strSOS.FK_NAZSOSID;
            strSOS2 := strSOS.FC_SOST;
        ELSIF (strSOS.FK_NAZSOSID = 1) THEN
            nFK_SOS := strSOS.FK_NAZSOSID;
            strSOS2 := strSOS.FC_SOST ;
        ELSIF (strSOS.FK_NAZSOSID = 23) THEN
            nFK_SOS := strSOS.FK_NAZSOSID;
            strSOS2 := strSOS.FC_SOST;
        ELSIF (nFK_SOS <> 4) AND (nFK_SOS <> 1) AND (nFK_SOS <> 23) THEN
            nFK_SOS := strSOS.FK_NAZSOSID;
            strSOS2 := strSOS.FC_SOST;
        END IF;
    END LOOP;
    IF i > 1 AND ((nFK_SOS <> 4) AND (nFK_SOS <> 1) AND (nFK_SOS <> 23)) THEN
        RETURN 'Выполняется';
    END IF;
    RETURN strSOS2;

END;
/

SHOW ERRORS;


