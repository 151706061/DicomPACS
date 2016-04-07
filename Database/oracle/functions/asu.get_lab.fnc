DROP FUNCTION ASU.GET_LAB
/

--
-- GET_LAB  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_LAB" (pFK_SMID IN NUMBER) RETURN  NUMBER IS
    CURSOR cLab IS SELECT FK_ID FROM TSMID WHERE ROWNUM = 1 AND (FC_SYNONIM = 'ANAL_IMMUN_SPID'
                                                                 OR FC_SYNONIM = 'ANAL_CLINIC'
                                                                 OR FC_SYNONIM = 'ANAL_BAK'
                                                                 OR FC_SYNONIM = 'RAZ_BIOHIM'
                                                                 /*OR FC_SYNONIM = 'ANAL_BIOHIM' */
                                                                 OR FC_SYNONIM = 'PCR_BIOHIM'
                                                                 OR FC_SYNONIM = 'ANAL_IMMUN'
                                                                 OR FC_SYNONIM = 'ANAL_GORMON'
                                                                 )
                                           START WITH FK_ID = pFK_SMID CONNECT BY PRIOR FK_OWNER = FK_ID;
    nFK_ID NUMBER;
BEGIN
    OPEN cLab;
    FETCH cLab INTO nFK_ID;
    CLOSE cLab;
    IF nFK_ID IS NOT NULL THEN
        RETURN nFK_ID;
     ELSE
        RETURN -1;
     END IF;
EXCEPTION
   WHEN others THEN
       RETURN -1;
END;
/

SHOW ERRORS;


