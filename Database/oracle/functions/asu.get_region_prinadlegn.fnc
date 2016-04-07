DROP FUNCTION ASU.GET_REGION_PRINADLEGN
/

--
-- GET_REGION_PRINADLEGN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TCOUNTRY (Table)
--   TADRESS (Table)
--   TRAION (Table)
--   TTOWN (Table)
--   TSMID (Table)
--   TREGION (Table)
--   GET_CURR_CITY_KLADR_ID (Function)
--   GET_CURR_RAION_KLADR_ID (Function)
--   GET_CURR_REGION_KLADR_ID (Function)
--   TKLADR (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_REGION_PRINADLEGN" (pfk_adrid IN TADRESS.FK_ID%TYPE)
 RETURN TSMID.FK_ID%TYPE IS
 l_kladr_id   TADRESS.FK_KLADR%TYPE;
 l_country_id TADRESS.FK_COUNTRYID%TYPE;
 l_region_id  TADRESS.FK_REGIONID%TYPE;
 l_raion_id   TADRESS.FK_RAIONID%TYPE;
 l_town_id    TADRESS.FK_TOWNID%TYPE;
 l_tmp        NUMBER;
 l_tmp_res    TSMID.FC_SYNONIM%TYPE;
 l_res        TSMID.FK_ID%TYPE;
BEGIN
 -- Выбираем адреса КЛАДР, строку, комбобоксы
 SELECT NVL(MAX(FK_KLADR), 0),
        NVL(MAX(FK_COUNTRYID), 0),
        NVL(MAX(FK_REGIONID), 0),
        NVL(MAX(FK_RAIONID), 0),
        NVL(MAX(FK_TOWNID), 0)
   INTO l_kladr_id, l_country_id, l_region_id, l_raion_id, l_town_id
   FROM TADRESS
  WHERE FK_ID = pfk_adrid;
 -- КЛАДР
 IF l_kladr_id > 0 THEN
  SELECT COUNT(FK_ID)
    INTO l_Tmp
    FROM TKLADR
   WHERE FK_ID = GET_CURR_CITY_KLADR_ID
  CONNECT BY FK_ID = PRIOR FK_OWNER
   START WITH FK_ID = l_kladr_id;
  IF l_Tmp > 0 THEN
   l_tmp_res := 'MZ_GOROD';
  ELSE
   SELECT COUNT(FK_ID)
     INTO l_Tmp
     FROM TKLADR
    WHERE FK_ID = GET_CURR_RAION_KLADR_ID
   CONNECT BY FK_ID = PRIOR FK_OWNER
    START WITH FK_ID = l_kladr_id;
   IF l_Tmp > 0 THEN
    l_tmp_res := 'MZ_RAION';
   ELSE
    SELECT COUNT(FK_ID)
      INTO l_Tmp
      FROM TKLADR
     WHERE FK_ID = GET_CURR_REGION_KLADR_ID
    CONNECT BY FK_ID = PRIOR FK_OWNER
     START WITH FK_ID = l_kladr_id;
    IF l_Tmp > 0 THEN
     l_tmp_res := 'MZ_SUBJECT';
    ELSE
     l_tmp_res := 'MZ_RF';
    END IF;
   END IF;
  END IF;
  -- Старый формат (Не КЛАДР - строка)
 ELSE
  -- Начало нового
  SELECT NVL(MAX(FK_ID), 0)
    INTO l_tmp
    FROM TTOWN
   WHERE FL_DEFAULT = 1
     AND FK_ID = l_town_id;
  IF l_Tmp > 0 THEN
   l_tmp_res := 'MZ_GOROD';
  ELSE
   SELECT NVL(MAX(FK_ID), 0)
     INTO l_tmp
     FROM TRAION
    WHERE FL_DEFAULT = 1
      AND FK_ID = l_raion_id;
   IF l_Tmp > 0 THEN
    l_tmp_res := 'MZ_RAION';
   ELSE
    SELECT NVL(MAX(FK_ID), 0)
      INTO l_tmp
      FROM TREGION
     WHERE FL_DEFAULT = 1
       AND FK_ID = l_region_id;
    IF l_Tmp > 0 THEN
     l_tmp_res := 'MZ_SUBJECT';
    ELSE
     SELECT NVL(MAX(FK_ID), 0)
       INTO l_tmp
       FROM TCOUNTRY
      WHERE FL_DEFAULT = 1
        AND FK_ID = l_country_id;
     IF l_Tmp > 0 THEN
      l_tmp_res := 'MZ_RF';
     ELSE
      IF l_country_id > 0 THEN
       l_tmp_res := 'MZ_INOSTR';
      ELSE
       l_tmp_res := 'MZ_UNKNOWN';
      END IF;
     END IF;
    END IF;
   END IF;
  END IF;
 END IF;
 SELECT MAX(FK_ID) INTO l_res FROM TSMID WHERE FC_SYNONIM = l_tmp_res;
 RETURN(l_res);
END GET_REGION_PRINADLEGN;
/

SHOW ERRORS;


