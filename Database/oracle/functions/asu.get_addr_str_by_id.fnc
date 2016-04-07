DROP FUNCTION ASU.GET_ADDR_STR_BY_ID
/

--
-- GET_ADDR_STR_BY_ID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TADRESS (Table)
--   GET_KLADR_ADDR_BY_ID (Function)
--   GET_OLD_ADR_BY_ID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_ADDR_STR_BY_ID" (pfk_id IN TADRESS.FK_ID%TYPE) RETURN VARCHAR2 IS
 -- Возвращает строку адреса (Если есть, то КЛАДР, иначе обычный адрес)
 -- Created 20080917 by Linnikov
 gKladrID  TADRESS.FK_KLADR%TYPE;
 gHouse    TADRESS.FC_HOUSE%TYPE;
 gKorpus   TADRESS.FC_KORPUS%TYPE;
 gKvartira TADRESS.FC_KVARTIRA%TYPE;
 gTmpRes   VARCHAR2(1000);

 FUNCTION ADD_COMMA(pStr IN VARCHAR2, pPrefix IN VARCHAR2) RETURN VARCHAR2 IS
 BEGIN
  IF pStr IS NULL THEN
   RETURN pStr;
  ELSE
   RETURN pPrefix || '. ' || pStr || ', ';
  END IF;
 END;

BEGIN
 SELECT MAX(FK_KLADR), MAX(FC_HOUSE), MAX(FC_KORPUS), MAX(FC_KVARTIRA)
   INTO gKladrID, gHouse, gKorpus, gKvartira
   FROM TADRESS
  WHERE FK_ID = pfk_id;
 IF NVL(gKladrID, 0) <= 0 THEN
  gTmpRes := GET_OLD_ADR_BY_ID(pfk_id);
 ELSE
  gTmpRes := GET_KLADR_ADDR_BY_ID(gKladrID) || ADD_COMMA(gHouse, 'д') ||
             ADD_COMMA(gKorpus, 'корп') || ADD_COMMA(gKvartira, 'кв');
  gTmpRes := SUBSTR(gTmpRes, 1, LENGTH(TRIM(gTmpRes)) - 1);
 END IF;
 RETURN(gTmpRes);
END GET_ADDR_STR_BY_ID;
/

SHOW ERRORS;


