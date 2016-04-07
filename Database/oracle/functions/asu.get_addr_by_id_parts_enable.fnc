DROP FUNCTION ASU.GET_ADDR_BY_ID_PARTS_ENABLE
/

--
-- GET_ADDR_BY_ID_PARTS_ENABLE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TADRESS (Table)
--   GET_ADDR_PARTS_BY_ID (Procedure)
--
CREATE OR REPLACE FUNCTION ASU."GET_ADDR_BY_ID_PARTS_ENABLE" (pfk_id    IN TADRESS.FK_ID%TYPE,
                                                              pAddCountry  number DEFAULT 1,
                                                              pAddRegion   number DEFAULT 1,
                                                              pAddRaion    number DEFAULT 1,
                                                              pAddCity     number DEFAULT 1,
                                                              pAddStreet   number DEFAULT 1,
                                                              pAddHouse    number DEFAULT 1,
                                                              pAddKorpus   number DEFAULT 1,
                                                              pAddKvartira number DEFAULT 1) RETURN VARCHAR2 IS
  -- Возвращает адрес по ID, различные части адреса включаются в результат, если соответствующий флаг (pAdd) установлен в 1
  -- Created 20101013 by Efimov V.A.
  pCountry  VARCHAR2(100);
  pRegion   VARCHAR2(100);
  pRaion    VARCHAR2(100);
  pCity     VARCHAR2(100);
  pStreeT   VARCHAR2(100);
  pHouse    TADRESS.FC_HOUSE%TYPE;
  pKorpus   TADRESS.FC_KORPUS%TYPE;
  pKvartira TADRESS.FC_KVARTIRA%TYPE;
  vResult   VARCHAR2(1000);

  FUNCTION ADD_COMMA(pBeforeStr IN VARCHAR2, pAddStr IN VARCHAR2, pPrefix IN VARCHAR2 DEFAULT '') RETURN VARCHAR2 IS
    vPrefix Varchar2(10);
    vAddStrPrefix Varchar2(10);
  BEGIN
    select substr(pAddStr, 1, length(pPrefix)) into vAddStrPrefix from dual;

    if pPrefix = vAddStrPrefix then
      vPrefix := '';
    else
      select decode(pPrefix, null, '', pPrefix || '. ') into vPrefix from dual;
    END IF;

    IF pBeforeStr is null THEN
      RETURN vPrefix || pAddStr;
    ELSE
      if pAddStr is null then
        RETURN pBeforeStr;
      ELSE
        RETURN pBeforeStr || ', ' || vPrefix || pAddStr;
      END IF;
    END IF;
  END;

BEGIN
  ASU.GET_ADDR_PARTS_BY_ID(pfk_id,
                           pCountry,
                           pRegion,
                           pRaion,
                           pCity,
                           pStreeT,
                           pHouse,
                           pKorpus,
                           pKvartira);

  vResult := '';

  if pAddCountry = 1 then
    vResult := ADD_COMMA(vResult, pCountry);
  end if;
  if pAddRegion = 1 then
    vResult := ADD_COMMA(vResult, pRegion);
  end if;
  if pAddRaion = 1 then
    vResult := ADD_COMMA(vResult, pRaion, 'p');
  end if;
  if pAddCity = 1 then
    vResult := ADD_COMMA(vResult, pCity, 'г');
  end if;
  if pAddStreet = 1 then
    vResult := ADD_COMMA(vResult, pStreet, 'ул');
  end if;
  if pAddHouse = 1 then
    vResult := ADD_COMMA(vResult, pHouse, 'д');
  end if;
  if pAddKorpus = 1 then
    vResult := ADD_COMMA(vResult, pKorpus, 'корп');
  end if;
  if pAddKvartira = 1 then
    vResult := ADD_COMMA(vResult, pKvartira, 'кв');
  end if;

  return(vResult);

END GET_ADDR_BY_ID_PARTS_ENABLE;
/

SHOW ERRORS;


