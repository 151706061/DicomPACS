DROP FUNCTION ASU.GET_SHORT_ADDR_BY_ID
/

--
-- GET_SHORT_ADDR_BY_ID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TADRESS (Table)
--   GET_KLADR_ADDR_BY_ID (Function)
--   TSTREET (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SHORT_ADDR_BY_ID" (pfk_id IN TADRESS.FK_ID%TYPE)
 RETURN VARCHAR2 IS
 -- Возвращает короткий адрес (улицу, дом ...)(Если есть, то КЛАДР, иначе комбобокс)
 -- Created 20081022 by Linnikov
 gKladrID   TADRESS.FK_KLADR%TYPE;
 gHouse     TADRESS.FC_HOUSE%TYPE;
 gKorpus    TADRESS.FC_KORPUS%TYPE;
 gKvartira  TADRESS.FC_KVARTIRA%TYPE;
 gOldStreet TADRESS.FK_STREETID%TYPE;
 gTmpRes    VARCHAR2(1000);

 FUNCTION ADD_COMMA(pStr IN VARCHAR2, pPrefix IN VARCHAR2) RETURN VARCHAR2 IS
 BEGIN
  IF pStr IS NULL THEN
   RETURN pStr;
  ELSE
   RETURN pPrefix || '. ' || pStr || ', ';
  END IF;
 END;

BEGIN
 SELECT MAX(FK_KLADR), MAX(FC_HOUSE), MAX(FC_KORPUS), MAX(FC_KVARTIRA), MAX(FK_STREETID)
   INTO gKladrID, gHouse, gKorpus, gKvartira, gOldStreet
   FROM TADRESS
  WHERE FK_ID = pfk_id;
 IF NVL(gKladrID, 0) <= 0 THEN
  SELECT MAX(FC_NAME) INTO gTmpRes FROM TSTREET WHERE FK_ID = gOldStreet;
  IF gTmpRes IS NOT NULL THEN
   gTmpRes := gTmpRes || ', ';
  END IF;
 ELSE
  gTmpRes := GET_KLADR_ADDR_BY_ID(gKladrID, 4);
 END IF;
 gTmpRes := gTmpRes || ADD_COMMA(gHouse, 'д') || ADD_COMMA(gKorpus, 'корп') ||
            ADD_COMMA(gKvartira, 'кв');
 gTmpRes := SUBSTR(gTmpRes, 1, LENGTH(TRIM(gTmpRes)) - 1);
 RETURN(gTmpRes);
END GET_SHORT_ADDR_BY_ID;
/

SHOW ERRORS;


