DROP FUNCTION ASU.GET_DISTRICTID_BY_ADDRID
/

--
-- GET_DISTRICTID_BY_ADDRID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TOTDEL (Synonym)
--   TADRESS (Table)
--   TDISTRICT (Table)
--   TDISTRICT_NAME (Table)
--   GET_VRACHOTD (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_DISTRICTID_BY_ADDRID" (pAdrID IN TADRESS.FK_ID%TYPE,
     pSotrId IN TDISTRICT_NAME.FK_SOTR%TYPE DEFAULT -1,
     pOtdID  IN TOTDEL.FK_ID%TYPE DEFAULT -1)

 RETURN TDISTRICT.FK_ID%TYPE IS
 -- Created 20081010 by Linnikov
 -- Определяет код участка по коду адреса

 -- deemaric edit  19.11.2008
 -- добавил необязательный параметр pSotrId
 -- теперь ф-ция может выбирать код участка с учетом отделения в котором работает сотрудник
 
  -- deemaric edit  16.16.2008
  -- добавил необязательный параметр pOtdID
  -- теперь ф-ция может выбирать код участка с переданным id отделения

 lStreet   TADRESS.FK_KLADR%TYPE;
 lHouse    TADRESS.FC_HOUSE%TYPE;
 lDistrict TDISTRICT.FK_ID%TYPE;

 /* ----- ЛОКАЛЬНАЯ Ф-ЦИЯ ВЫБИРАЕТ БЕЗ УЧЕТА ОТДЕЛЕНИЯ СОТРУДНИКА ---- */
 FUNCTION get_district_without_sotr RETURN TDISTRICT.FK_ID%TYPE IS
   lDistrict TDISTRICT.FK_ID%TYPE;
 BEGIN
  SELECT NVL(MAX(D.FK_ID), 0)
    INTO lDistrict
    FROM TDISTRICT D
   WHERE D.FK_KLADR = lStreet
     AND ((TO_NUMBER(TRANSLATE(lHouse, '0' || TRANSLATE(lHouse, '_1234567890', '_'), '0')) BETWEEN
         D.FN_FROM AND D.FN_TO) OR
         UPPER(',' || TRANSLATE(D.FC_RANGE, '1 ', '1') || ',') LIKE UPPER('%,' || lHouse || ',%'))
     AND NOT UPPER(',' || TRANSLATE(D.FC_ANTIRANGE, '1 ', '1') || ',') LIKE UPPER('%,' || lHouse || ',%');

  RETURN lDistrict;
 END;

 /* ----- ЛОКАЛЬНАЯ Ф-ЦИЯ ВЫБИРАЕТ С УЧЕТОМ ОТДЕЛЕНИЯ СОТРУДНИКА ---- */
 FUNCTION get_district_with_sotr RETURN TDISTRICT.FK_ID%TYPE IS
   lDistrict TDISTRICT.FK_ID%TYPE;
 BEGIN
  SELECT NVL(MAX(D.FK_ID), 0)
    INTO lDistrict
    FROM TDISTRICT D, TDISTRICT_NAME DN
   WHERE D.FK_DISTRICT = DN.FK_ID
     AND ((TO_NUMBER(TRANSLATE(lHouse, '0' || TRANSLATE(lHouse, '_1234567890', '_'), '0')) BETWEEN
         D.FN_FROM AND D.FN_TO) OR
         UPPER(',' || TRANSLATE(D.FC_RANGE, '1 ', '1') || ',') LIKE UPPER('%,' || lHouse || ',%'))
     AND NOT UPPER(',' || TRANSLATE(D.FC_ANTIRANGE, '1 ', '1') || ',') LIKE UPPER('%,' || lHouse || ',%')
    -- AND get_vrachotd(dn.fk_sotr) = get_vrachotd(pSotrId)
     AND get_vrachotd(dn.fk_sotr) in
       (select fk_id
          from totdel
        connect by prior fk_id = fk_ownerid
         start with fk_id = get_vrachotd(pSotrId))
     AND D.FK_KLADR = lStreet;
     
     RETURN lDistrict;
 END;
     
 /* ----- ЛОКАЛЬНАЯ Ф-ЦИЯ ВЫБИРАЕТ С УЧЕТОМ ОТДЕЛЕНИЯ СОТРУДНИКА ---- */
 FUNCTION get_district_with_otd RETURN TDISTRICT.FK_ID%TYPE IS
   lDistrict TDISTRICT.FK_ID%TYPE;
 BEGIN
  SELECT NVL(MAX(D.FK_ID), 0)
    INTO lDistrict
    FROM TDISTRICT D, TDISTRICT_NAME DN
   WHERE D.FK_DISTRICT = DN.FK_ID
     AND ((TO_NUMBER(TRANSLATE(lHouse, '0' || TRANSLATE(lHouse, '_1234567890', '_'), '0')) BETWEEN
         D.FN_FROM AND D.FN_TO) OR
         UPPER(',' || TRANSLATE(D.FC_RANGE, '1 ', '1') || ',') LIKE UPPER('%,' || lHouse || ',%'))
     AND NOT UPPER(',' || TRANSLATE(D.FC_ANTIRANGE, '1 ', '1') || ',') LIKE UPPER('%,' || lHouse || ',%')    
     AND get_vrachotd(dn.fk_sotr) in
       (select fk_id
          from totdel
        connect by prior fk_id = fk_ownerid
         start with fk_id = pOtdID)
     AND D.FK_KLADR = lStreet;

  RETURN lDistrict;
 END;

BEGIN

 SELECT MAX(FK_KLADR), MAX(FC_HOUSE) INTO lStreet, lHouse FROM TADRESS WHERE FK_ID = pAdrID;

 IF (lStreet IS NULL) OR (lHouse IS NULL) THEN
  RETURN(-1);
 END IF;

 IF pSotrId = -1 THEN
  IF pOtdID = -1 THEN
   lDistrict := get_district_without_sotr;
  ELSE
   lDistrict := get_district_with_otd;
  END IF;
 ELSE
  lDistrict := get_district_with_sotr;
 END IF;

 RETURN lDistrict;

END GET_DISTRICTID_BY_ADDRID;
/

SHOW ERRORS;


