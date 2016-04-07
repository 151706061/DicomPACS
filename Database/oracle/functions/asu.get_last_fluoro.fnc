DROP FUNCTION ASU.GET_LAST_FLUORO
/

--
-- GET_LAST_FLUORO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZIS (Table)
--   TSMINI (Table)
--   TIB (Table)
--   TAMBULANCE (Table)
--   TSHABLON_XRAY_ZAKL (Table)
--   TSMID (Table)
--   GET_OWNER_FROM_SMID (Function)
--   GET_PASS_REGISTRATOR (Function)
--   GET_VIPNAZ (Function)
--   GET_XRAY_FLU (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_LAST_FLUORO" (PFK_PACID IN NUMBER, nFlag IN NUMBER DEFAULT 0) -- передается peplid
RETURN VARCHAR2 IS
sRes VARCHAR2(1000);
CURSOR c IS SELECT TO_CHAR(FD_RUN, 'dd.mm.yyyy', 'nls_date_language=russian')||', '||'№ '||
                   (DECODE((SELECT MAX(FC_CHAR) 
                              FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = 'XRAY_FLU_NUMBER')),
                           NULL, 
                           (SUBSTR(FC_REMARK, 21, (length(FC_REMARK)+1)-21)),
                           (SELECT MAX(FC_CHAR) 
                             FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = 'XRAY_FLU_NUMBER')))) 
                   ||' '||FC_NAME AS LastFlu 
              FROM ASU.TNAZIS
             WHERE ASU.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID) = ASU.GET_XRAY_FLU
               AND TNAZIS.FK_PACID IN (SELECT FK_ID FROM ASU.TAMBULANCE WHERE FK_PEPLID = PFK_PACID
                                        UNION
                                       SELECT FK_ID FROM ASU.TKARTA WHERE FK_PEPLID = PFK_PACID)
               AND (TNAZIS.FK_NAZSOSID = ASU.GET_VIPNAZ OR TNAZIS.FK_NAZSOSID = ASU.GET_PASS_REGISTRATOR)
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
            
CURSOR cDef IS SELECT TO_CHAR(FD_RUN, 'dd.mm.yyyy', 'nls_date_language=russian')||', '||'№ '||
                      (DECODE((SELECT MAX(FC_CHAR) 
                             FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = 'XRAY_FLU_NUMBER')),
                           NULL, 
                           (SUBSTR(FC_REMARK, 21, (length(FC_REMARK)+1)-21)),
                           (SELECT MAX(FC_CHAR) 
                             FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = 'XRAY_FLU_NUMBER')))) 
              FROM ASU.TNAZIS
             WHERE ASU.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID) = ASU.GET_XRAY_FLU
               AND TNAZIS.FK_PACID IN (SELECT FK_ID FROM ASU.TAMBULANCE WHERE FK_PEPLID = PFK_PACID
                                        UNION
                                       SELECT FK_ID FROM ASU.TKARTA WHERE FK_PEPLID = PFK_PACID)
               AND (TNAZIS.FK_NAZSOSID = ASU.GET_VIPNAZ OR TNAZIS.FK_NAZSOSID = ASU.GET_PASS_REGISTRATOR)
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
  IF nFlag = 1 THEN -- если флаг = 1, то выводим дату, номер и полное название исследования (флюорографии)
    OPEN c;
    FETCH c INTO sRes;
    CLOSE c;
  ELSE -- если флаг = 0(по умолчанию), то выводим только дату и номер исследования (флюорографии)   
    OPEN cDef;
    FETCH cDef INTO sRes;
    CLOSE cDef;
  END IF;  
    
    RETURN sRes ;
END; -- Created : Prihodko; Comments: Возвращает строку - дату и название последней флюорографии
                            --09.04.2009 : добавил в курсоры проверку на дообследование 
                            --             (флюорографии с заключением, равным "дообследование" не должны учитываться в общем плане)
/

SHOW ERRORS;


