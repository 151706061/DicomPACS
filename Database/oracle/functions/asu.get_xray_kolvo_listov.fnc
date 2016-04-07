DROP FUNCTION ASU.GET_XRAY_KOLVO_LISTOV
/

--
-- GET_XRAY_KOLVO_LISTOV  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZIS (Table)
--   TIB (Table)
--   TSMID (Table)
--   GET_LABVIP (Function)
--   TPODPISNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_XRAY_KOLVO_LISTOV" (PSMID IN NUMBER, PDATE1 IN DATE, PDATE2 IN DATE, nKey IN NUMBER DEFAULT 0)
  RETURN NUMBER IS
  
  CURSOR cRes IS SELECT SUM(T.SUMNUM) 
                   FROM (SELECT SUM(TIB.FN_NUM) AS SUMNUM 
                           FROM ASU.TIB, ASU.TNAZIS
                          WHERE TIB.FK_PACID = TNAZIS.FK_ID
                            AND TNAZIS.FD_RUN >= PDATE1
                            AND TNAZIS.FD_RUN <= PDATE2
                            AND TIB.FK_SMEDITID = PSMID
                            AND EXISTS (SELECT NULL FROM TPODPISNAZ WHERE FK_NAZID = TNAZIS.FK_ID AND FK_SOS = ASU.GET_LABVIP)
                         GROUP BY TNAZIS.FC_TYPE) T;

  CURSOR cResVsego IS SELECT SUM(T.SUMNUM) 
                        FROM (SELECT SUM(TIB.FN_NUM) AS SUMNUM 
                               FROM ASU.TIB, ASU.TNAZIS
                              WHERE TIB.FK_PACID = TNAZIS.FK_ID
                                AND TNAZIS.FD_RUN >= PDATE1
                                AND TNAZIS.FD_RUN <= PDATE2
                                AND TIB.FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'XRAY_KOLVO_LISTOV'))
                                AND EXISTS (SELECT NULL FROM TPODPISNAZ WHERE FK_NAZID = TNAZIS.FK_ID AND FK_SOS = ASU.GET_LABVIP)
                              GROUP BY TNAZIS.FC_TYPE) T;                       
  nRes NUMBER;
BEGIN 
  IF nKey = 0 THEN
    OPEN cRes;
    FETCH cRes INTO nRes;
    CLOSE cRes;  
  ELSE
    OPEN cResVsego;
    FETCH cResVsego INTO nRes;
    CLOSE cResVsego;
  END IF;    
  
  RETURN nRes;
END;
/

SHOW ERRORS;


