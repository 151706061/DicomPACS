DROP FUNCTION ASU.IS_SELO
/

--
-- IS_SELO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TADRESS (Table)
--   TTOWN (Table)
--   TKLADR (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_SELO" (pfk_adrid IN TADRESS.FK_ID%TYPE) RETURN NUMBER IS
 l_kladr_id TADRESS.FK_KLADR%TYPE;
 l_town_id  TADRESS.FK_TOWNID%TYPE;
 l_str      TADRESS.FC_ADR%TYPE;
 l_tmp      NUMBER;
BEGIN
 SELECT NVL(MAX(FK_KLADR), 0), NVL(MAX(FK_TOWNID), 0), MAX(FC_ADR)
   INTO l_kladr_id, l_town_id, l_str
   FROM TADRESS
  WHERE FK_ID = pfk_adrid;
 -- КЛАДР
 IF l_kladr_id > 0 THEN
  SELECT COUNT(FC_PREFIX)
    INTO l_tmp
    FROM tkladr
   WHERE FC_PREFIX = 'г'
  CONNECT BY fk_id = PRIOR fk_owner
   START WITH fk_id = l_kladr_id;
  IF l_tmp > 0 THEN
   RETURN 0; -- Город
  ELSE
   RETURN 1;
  END IF;
  -- Старый формат (Не КЛАДР - строка)
 ELSE
  IF LENGTH(TRIM(l_str)) > 0 THEN
   IF INSTR(UPPER(l_str), 'Г.') > 0 THEN
    RETURN 0;
   ELSE
    RETURN 1;
   END IF;
  ELSE
  -- Старый формат (Не КЛАДР но и не строка)
   SELECT COUNT(FK_ID)
     INTO l_tmp
     FROM TTOWN
    WHERE FK_ID = l_town_id
      AND FC_NAME LIKE '%.';
   IF l_tmp > 0 THEN
    RETURN 1; -- Село
   ELSE
    RETURN 0;
   END IF;
  END IF;
 END IF;
END IS_SELO;
/

SHOW ERRORS;


