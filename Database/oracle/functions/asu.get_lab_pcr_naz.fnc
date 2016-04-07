DROP FUNCTION ASU.GET_LAB_PCR_NAZ
/

--
-- GET_LAB_PCR_NAZ  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAN (Table)
--   TLABREG (Table)
--   TSMID_RIGHTS (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_LAB_PCR_NAZ" (pFN_PROBE NUMBER, pFD_REGIST DATE, pFK_PACID NUMBER, pFK_SOTRID NUMBER)  RETURN  VARCHAR2 IS
    CURSOR cNAZ IS SELECT TNAZAN.FC_NAME 
                   FROM TNAZAN,
                        TLABREG
                   WHERE TNAZAN.FK_ID = TLABREG.FK_NAZID
                         AND TNAZAN.FK_PACID = pFK_PACID
                         AND FN_PROBE = pFN_PROBE
                         AND TLABREG.FD_REGIST >= TRUNC(pFD_REGIST)
                         AND TLABREG.FD_REGIST < TRUNC(pFD_REGIST + 1)
                         AND EXISTS (SELECT FK_ID 
                                     FROM TSMID_RIGHTS
                                     WHERE FK_SOTRID = pFK_SOTRID
                                           AND FK_SMID = TNAZAN.FK_SMID);
    sRes VARCHAR2(4000);
BEGIN 
  sRes := '';
  FOR p IN cNAZ LOOP
    sRes := p.FC_NAME || '; ' || sRes;
  END LOOP;  
  RETURN sRes;
END;
/

SHOW ERRORS;


