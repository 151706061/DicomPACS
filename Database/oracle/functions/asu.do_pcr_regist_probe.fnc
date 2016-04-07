DROP FUNCTION ASU.DO_PCR_REGIST_PROBE
/

--
-- DO_PCR_REGIST_PROBE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   ALL_OBJECTS (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAN (Table)
--   TSMINI (Table)
--   TLABREG (Table)
--   TLAB_PCR_LOT (Table)
--   TLAB_PCR_REGIST (Table)
--   SEQ_LAB_PCR (Sequence)
--   TSMID_RIGHTS (Table)
--   GET_NAZ_CANCEL (Function)
--   GET_VIPNAZ (Function)
--
CREATE OR REPLACE FUNCTION ASU."DO_PCR_REGIST_PROBE" (pFK_PACID NUMBER, pFN_PROBE IN OUT NUMBER, pFK_SOTRID NUMBER, pFK_SOURCE IN OUT NUMBER, pFD_NAZ DATE, pFK_PLACE NUMBER default 0) RETURN NUMBER IS
    CURSOR cNaz IS
        SELECT TNAZAN.FK_ID
        FROM TLABREG,
             TNAZAN
        WHERE FD_REGIST >= SYSDATE - (SELECT TO_NUMBER(FC_VALUE) FROM TSMINI WHERE FC_SECTION = 'LAB' AND FC_KEY = 'REGIST_DAY')
              AND TNAZAN.FK_ID = TLABREG.FK_NAZID
              AND TNAZAN.FK_PACID = pFK_PACID
              AND TLABREG.FN_PROBE = pFN_PROBE
              AND TNAZAN.FK_NAZSOSID != GET_VIPNAZ
              AND TNAZAN.FK_NAZSOSID != GET_NAZ_CANCEL
              AND TNAZAN.FD_NAZ >= TRUNC(pFD_NAZ)
              AND TNAZAN.FD_NAZ < TRUNC(pFD_NAZ) + 1
              AND EXISTS (SELECT FK_ID
                          FROM TSMID_RIGHTS
                          WHERE TSMID_RIGHTS.FK_SMID = TNAZAN.FK_SMID
                                AND FK_SOTRID = pFK_SOTRID)  
              AND NOT EXISTS (SELECT FK_ID 
                              FROM TLAB_PCR_REGIST
                              WHERE FK_NAZID = TNAZAN.FK_ID);
    CURSOR cLot IS
        SELECT FK_ID, FN_HEIGHT, FN_WIDTH FROM TLAB_PCR_LOT WHERE FK_SMID = pFK_SOURCE; 
        
    CURSOR cPlace(pFK_LOTID NUMBER, pFN_HEIGHT NUMBER, pFN_WIDTH NUMBER) IS
        SELECT MIN(FN_NUMBER)
        FROM (SELECT ROWNUM FN_NUMBER FROM ALL_OBJECTS WHERE ROWNUM <= pFN_HEIGHT * pFN_WIDTH)
        WHERE FN_NUMBER NOT IN (SELECT FN_PLACE 
                                FROM TLAB_PCR_REGIST
                                WHERE FK_LOTID = pFK_LOTID
                                      AND FN_SOS = 0
                                GROUP BY FN_PLACE);
   nLot NUMBER;                                
   nPlace NUMBER;
   nIsPlace BOOLEAN;
BEGIN
  IF pFK_SOURCE != 0 AND pFK_PLACE != 0 THEN
      FOR p IN cNaz LOOP
        INSERT INTO TLAB_PCR_REGIST(FK_ID, FK_SOTRID, FD_REGIST, FK_LOTID, FN_PLACE, FK_NAZID, FN_SOS)
            VALUES (SEQ_LAB_PCR.NEXTVAL, pFK_SOTRID, SYSDATE, pFK_SOURCE, pFK_PLACE, p.FK_ID, 0);
      END LOOP;  
      pFN_PROBE := pFK_PLACE;
      RETURN 1;  
  END IF;  
  
  nIsPlace := False;  
  FOR p IN cLot LOOP    
    nLot := p.FK_ID;
    
    OPEN cPlace(nLot, p.FN_HEIGHT, p.FN_WIDTH);
    FETCH cPlace INTO nPlace;
    CLOSE cPlace;
    
    IF nPlace IS NOT NULL THEN
        nIsPlace := True;
        EXIT;
    END IF;
  END LOOP;
  
  IF nIsPlace = False THEN
    RETURN 0;
  END IF;
  
  FOR p IN cNaz LOOP
    INSERT INTO TLAB_PCR_REGIST(FK_ID, FK_SOTRID, FD_REGIST, FK_LOTID, FN_PLACE, FK_NAZID, FN_SOS)
        VALUES (SEQ_LAB_PCR.NEXTVAL, pFK_SOTRID, SYSDATE, nLot, nPlace, p.FK_ID, 0);
  END LOOP;
  pFN_PROBE := nPlace;
  pFK_SOURCE := nLot; 
  RETURN 1;
END; -- Procedure
/

SHOW ERRORS;


