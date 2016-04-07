DROP FUNCTION ASU.GET_REANIM_FOR_XRAY
/

--
-- GET_REANIM_FOR_XRAY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMINI (Table)
--   TROOM (Table)
--   PKG_LISTS (Package)
--   PKG_PRIEMREP (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_REANIM_FOR_XRAY" (PFK_PACID IN NUMBER)
  RETURN NUMBER IS
  
  CURSOR cPacKontrol IS SELECT PKG_LISTS.GET_PAC_KONTROL(PFK_PACID) FROM DUAL;
  CURSOR cOtdel IS SELECT COUNT(*)
                     FROM ASU.TROOM
                    WHERE STAT.PKG_PRIEMREP.GET_PACPALATAID (PFK_PACID, SYSDATE) = TROOM.FK_ID
                      and fk_otdelid IN (SELECT FC_VALUE  
                                           FROM TSMINI
                                          WHERE FC_SECTION = 'XRAY'
                                            AND FC_KEY LIKE 'ÐÅÀÍÈÌÀÖÈÎÍÍÎÅ_ÎÒÄÅËÅÍÈÅ%');
  
  nRes NUMBER;
  nÑnt NUMBER;

BEGIN 
  OPEN cPacKontrol;
  FETCH cPacKontrol INTO nRes;
  CLOSE cPacKontrol;
  IF (nRes IS NULL) OR (nRes = 0) THEN
    OPEN cOtdel;
    FETCH cOtdel INTO nÑnt;
    CLOSE cOtdel;
    IF nÑnt > 0 THEN
      nRes := 1;
    ELSE
      nRes := 0;
    END IF;      
  ELSE
    nRes := 1;  
  END IF;    
  RETURN nRes;
END;
/

SHOW ERRORS;


