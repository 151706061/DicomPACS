DROP FUNCTION ASU.GET_LAST_FLUORO_DATE
/

--
-- GET_LAST_FLUORO_DATE  (Function) 
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
CREATE OR REPLACE FUNCTION ASU."GET_LAST_FLUORO_DATE" (PFK_PACID IN NUMBER, nFlag IN NUMBER DEFAULT 0) -- передается peplid
RETURN VARCHAR2 IS
sRes VARCHAR2(1000);
CURSOR c IS SELECT TO_CHAR(FD_RUN, 'dd.mm.yyyy', 'nls_date_language=russian')||' '||'-'||' '||
                   TO_CHAR(ADD_MONTHS(FD_RUN, 12), 'dd.mm.yyyy', 'nls_date_language=russian') 
              FROM TNAZIS
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

CURSOR cNotDef IS SELECT TO_CHAR(FD_RUN, 'dd.mm.yyyy', 'nls_date_language=russian')
              FROM TNAZIS
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
  IF nFlag = 1 THEN
    OPEN cNotDef;
    FETCH cNotDef INTO sRes;
    CLOSE cNotDef;
  ELSE 
    OPEN c;
    FETCH c INTO sRes;
    CLOSE c;
  END IF;
    RETURN sRes ;
END; --Created: Prihodko; Comments: Возврщает : если nFlag = 1 то дату последней флюорографии, если nFlag <> 1 то дату последней флюорографии 
     --и дату следующей флюорографии по плану
/

SHOW ERRORS;


