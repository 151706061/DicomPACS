DROP FUNCTION ASU.GET_LAST_FLUORO_PREVIOUS
/

--
-- GET_LAST_FLUORO_PREVIOUS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZIS (Table)
--   TSMINI (Table)
--   TIB (Table)
--   TAMBULANCE (Table)
--   TSHABLON_XRAY_ZAKL (Table)
--   GET_OWNER_FROM_SMID (Function)
--   GET_PASS_REGISTRATOR (Function)
--   GET_VIPNAZ (Function)
--   GET_XRAY_FLU (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_LAST_FLUORO_PREVIOUS" (PFK_PACID IN NUMBER) -- передается peplid
  RETURN VARCHAR2 IS

sRes VARCHAR2(1000);
dRUN VARCHAR(20); 
dRUN_PREV VARCHAR(20);

CURSOR c IS SELECT TO_CHAR(FD_RUN, 'dd.mm.yyyy', 'nls_date_language=russian'),
                   LAG(FD_RUN) OVER (PARTITION BY TNAZIS.FK_PACID ORDER BY TNAZIS.FD_RUN) FD_RUN_PREV
              FROM ASU.TNAZIS
             WHERE GET_OWNER_FROM_SMID(TNAZIS.FK_SMID) = GET_XRAY_FLU
               AND TNAZIS.FK_PACID IN (SELECT FK_ID FROM TAMBULANCE WHERE FK_PEPLID = PFK_PACID
                                        UNION
                                       SELECT FK_ID FROM TKARTA WHERE FK_PEPLID = PFK_PACID)
               AND (TNAZIS.FK_NAZSOSID = GET_VIPNAZ OR TNAZIS.FK_NAZSOSID = GET_PASS_REGISTRATOR)
               AND NOT EXISTS (SELECT 1 
                                 FROM ASU.TIB 
                                WHERE FK_PACID = TNAZIS.FK_ID 
                                  AND FK_BID IN (SELECT FK_ID FROM ASU.TSHABLON_XRAY_ZAKL
                                                 START WITH FK_ID IN (SELECT TO_NUMBER(FC_VALUE) 
                                                                        FROM ASU.TSMINI 
                                                                       WHERE FC_SECTION = 'XRAY' 
                                                                         AND FC_KEY = 'DOOBSLEDOVAN')
                                                 CONNECT BY PRIOR FK_ID = FK_OWNER))
            ORDER BY FD_RUN DESC;
BEGIN 
  OPEN c;
  FETCH c INTO dRUN, dRUN_PREV;
  CLOSE c;
  IF dRUN_PREV IS NULL THEN
    sRes := dRUN;
  ELSE
    sRes := dRUN_PREV;
  END IF;      
    RETURN sRes ;
END; -- Created: Prihodko; Comments: Возвращает дату ПРЕДпоследней флюорографии (используется для плана по предприятиям)
/

SHOW ERRORS;


