DROP FUNCTION ASU.GET_CORRECTDATE
/

--
-- GET_CORRECTDATE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_CORRECTDATE" (pDate IN DATE) RETURN DATE IS
  -- Created by Kulechek 11,12,2007
  -- Puppose: При обратотке кривой даты - возвращает null.
  -- Added format 'DD.MM.YYYY' by Nefedov 31.01.2008
  -- Добавлена проверка на корректность даты ( первые 2 цыфры в годе )
  -- Edited by Zhukov 18,11,2009
  -- Puppose: ускоряем работу get_correctdate, данное решение должно работать в 15 раз быстрее, со временем нужно отказаться от этой функции

  StrYear     VARCHAR2(4);
  NumYearNow  NUMBER;
  NumYearDate NUMBER;
BEGIN
  IF MONTHS_BETWEEN(SYSDATE, pDate) < 2400 THEN
    RETURN PDate;
  ELSE
    RETURN NULL;
  END IF;

  /* --Узнаем какой сейчас век
  SELECT TO_CHAR(SYSDATE, 'YYYY') INTO StrYear FROM DUAL;
  StrYear    := SubStr(StrYear, 1, 2);
  NumYearNow := TO_NUMBER(StrYear);

  --К какому веку принадлежит передаваемая дата
  SELECT TO_CHAR(pDate, 'YYYY') INTO StrYear FROM DUAL;
  StrYear     := SubStr(StrYear, 1, 2);
  NumYearDate := TO_NUMBER(StrYear);

  IF NumYearDate >= NumYearNow - 2 THEN
    RETURN to_date(to_char(pDate, 'DD.MM.YYYY'), 'DD.MM.YYYY');
  ELSE
    RETURN NULL;
  END IF;*/
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
/

SHOW ERRORS;


