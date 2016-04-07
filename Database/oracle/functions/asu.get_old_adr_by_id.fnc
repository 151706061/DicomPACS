DROP FUNCTION ASU.GET_OLD_ADR_BY_ID
/

--
-- GET_OLD_ADR_BY_ID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_OUTPUT (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TCOUNTRY (Table)
--   TADRESS (Table)
--   TRAION (Table)
--   TTOWN (Table)
--   TINTOWN (Table)
--   TREGION (Table)
--   PKG_SMINI (Package)
--   GET_COUNTRY (Function)
--   GET_INTOWN (Function)
--   GET_RAION (Function)
--   GET_REGION (Function)
--   GET_STREET (Function)
--   GET_TOWN (Function)
--   TSTREET (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_OLD_ADR_BY_ID" (pfk_id IN TADRESS.FK_ID%TYPE)
  RETURN VARCHAR2 IS

  -- Возвращает адрес в старом формате (Не КЛАДР)
  -- Created 20080723 by Linnikov
  --------------------------------------------------
  -- Edited by Spasskiy S.N.
  -- Выводить или нет адрес написанный руками настравается в TSMINI
  --------------------------------------------------

  l_stradress TADRESS.FC_ADR%TYPE;
  l_country   TCOUNTRY.FC_NAME%TYPE;
  l_region    TREGION.FC_NAME%TYPE;
  l_raion     TRAION.FC_NAME%TYPE;
  l_town      TTOWN.FC_NAME%TYPE;
  l_intown    TINTOWN.FC_NAME%TYPE;
  l_street    TSTREET.FC_NAME%TYPE;
  l_house     VARCHAR2(20);
  l_korpus    VARCHAR2(20);
  l_kvartira  VARCHAR2(20);
  l_res       VARCHAR2(300);

  FUNCTION ADD_COMMA(pStr IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    IF pStr IS NULL THEN
      RETURN pStr;
    ELSE
      RETURN pStr || ', ';
    END IF;
  END;

BEGIN
  -- Если указан адрес строкой - возвращаем его
  SELECT TRIM(FC_ADR) INTO l_stradress FROM TADRESS WHERE FK_ID = pfk_id;
  /*
   Commented by Spasskiy 06102008
   IF LENGTH(l_stradress) > 0 THEN
    RETURN l_stradress;
   END IF;
  */

  -- Если адрес строкой не указан - собираем адрес
  SELECT GET_COUNTRY(FK_COUNTRYID),
         GET_REGION(FK_REGIONID),
         GET_RAION(FK_RAIONID),
         GET_TOWN(FK_TOWNID),
         GET_INTOWN(FK_INTOWNID),
         GET_STREET(FK_STREETID),
         DECODE(FC_HOUSE, '', '', 'д. ' || FC_HOUSE),
         DECODE(FC_KORPUS, '', '', 'корп. ' || FC_KORPUS),
         DECODE(FC_KVARTIRA, '', '', 'кв. ' || FC_KVARTIRA)
    INTO l_country,
         l_region,
         l_raion,
         l_town,
         l_intown,
         l_street,
         l_house,
         l_korpus,
         l_kvartira
    FROM TADRESS
   WHERE FK_ID = pfk_id;
  -- Добавляем разделители (запятые)
  l_res := ADD_COMMA(l_country) || ADD_COMMA(l_region) ||
           ADD_COMMA(l_raion) || ADD_COMMA(l_town) || ADD_COMMA(l_intown) ||
           ADD_COMMA(l_street) || ADD_COMMA(l_house) || ADD_COMMA(l_korpus) ||
           ADD_COMMA(l_kvartira);
  -- Убираем крайнюю правую запятую
  l_res := SUBSTR(l_res, 1, length(l_res) - 2);
  -- Дописываем адрем строкой в зависимости от настройки
  
  dbms_output.put_line(l_res);
  
  IF ASU.PKG_SMINI.READSTRING('IBTITUL_LIST', 'IS_PRINT_POCHT_ADR', '1') = '1' THEN
    l_res := l_res || ' ' || l_stradress;
  END IF;
  
  dbms_output.put_line(l_res);
  
  IF coalesce(TRIM(l_res), ' ') = ' '
  THEN 
    l_res := l_stradress;
  END IF; 
  
  RETURN l_res;
END;
/

SHOW ERRORS;


