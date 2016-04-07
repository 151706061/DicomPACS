DROP PROCEDURE ASU.GET_ADDR_PARTS_BY_ID
/

--
-- GET_ADDR_PARTS_BY_ID  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TADRESS (Table)
--   GET_COUNTRY (Function)
--   GET_KLADR_ADDR_PARTS_BY_ID (Procedure)
--   GET_RAION (Function)
--   GET_REGION (Function)
--   GET_STREET (Function)
--   GET_TOWN (Function)
--
CREATE OR REPLACE PROCEDURE ASU."GET_ADDR_PARTS_BY_ID" (pfk_id    IN TADRESS.FK_ID%TYPE,
                                                pCountry  OUT VARCHAR2,
                                                pRegion   OUT VARCHAR2,
                                                pRaion    OUT VARCHAR2,
                                                pCity     OUT VARCHAR2,
                                                pStreeT    OUT VARCHAR2,
                                                pHouse    OUT TADRESS.FC_HOUSE%TYPE,
                                                pKorpus   OUT TADRESS.FC_KORPUS%TYPE,
                                                pKvartira OUT TADRESS.FC_KVARTIRA%TYPE)
  IS
  -- Возвращает части адреса (Если есть, то из КЛАДР, иначе из Комбобоксов)
  -- Created 20081003 by Spasskiy S.N.
BEGIN
  FOR C IN (SELECT FK_KLADR,
                   ASU.GET_COUNTRY(TADRESS.FK_COUNTRYID) FC_COUNTRY,
                   ASU.GET_REGION(TADRESS.FK_REGIONID) FС_REGION,
                   ASU.GET_RAION(TADRESS.FK_RAIONID) FC_RAION,
                   ASU.GET_STREET(TADRESS.FK_STREETID) FC_STREET,
                   ASU.GET_TOWN(TADRESS.FK_TOWNID) FC_TOWN,
                   FC_HOUSE,
                   FC_KORPUS,
                   FC_KVARTIRA
              FROM TADRESS
             WHERE FK_ID = pfk_id) LOOP
     pHouse    := C.FC_HOUSE;
     pKorpus   := C.FC_KORPUS;
     pKvartira := C.FC_KVARTIRA;
    IF nvl(C.FK_KLADR,0) <= 0 THEN
      pCountry  := C.FC_COUNTRY;
      pRegion   := C.FС_REGION;
      pRaion    := C.FC_RAION;
      pCity     := C.FC_TOWN;
      pStreeT   := C.FC_STREET;
      EXIT;
    ELSE
      pCountry  := 'РОССИЙСКАЯ ФЕДЕРАЦИЯ';
      ASU.GET_KLADR_ADDR_PARTS_BY_ID(c.fk_kladr, pRegion, pRaion, pCity, pStreet);
    END IF;
  END LOOP;

END GET_ADDR_PARTS_BY_ID;
/

SHOW ERRORS;


