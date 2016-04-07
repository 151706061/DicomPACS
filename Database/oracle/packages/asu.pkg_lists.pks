DROP PACKAGE ASU.PKG_LISTS
/

--
-- PKG_LISTS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_LISTS" is

  -- Author  : TIMURLAN
  -- Created : 03.02.2006 9:58:34

  FUNCTION GET_PAC_VRACHPO(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2;
  -- возвращает ФИО врачей ПО по ПАЦУ (ч/запятую)
  FUNCTION GET_PAC_SOST(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2;
    -- возвращает тяжесть состояния по ПАЦУ
  FUNCTION GET_PAC_SOST_DATE(pPACID IN BINARY_INTEGER, pDate in  date) RETURN NUMBER;
   -- состояние пациента на дату(осмотры + темп.лист)
  FUNCTION GET_PAC_KONTROL(pFK_PACID IN BINARY_INTEGER) RETURN BINARY_INTEGER;
  -- возвращает 1 если в реанимации или 0 если на контроле
  FUNCTION GET_PAC_REANIM_OTD(pFK_PACID IN BINARY_INTEGER, pSotrID IN BINARY_INTEGER) RETURN BINARY_INTEGER; -- Created Nefedov 09.02.07
  -- Возвращает если в реанимационном отделении текущего сотрудника

  FUNCTION GET_PAC_REJIM(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2;
  -- возвращает режим по ПАЦУ (ч/запятую)
  FUNCTION GET_PAC_DIETA(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2;
  -- возвращает диету по ПАЦУ (ч/запятую)

  FUNCTION GET_PAC_SESTR(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2;
  -- возвращает сестринское наблюдение по НАЗНАЧЕНЮ
  FUNCTION GET_PAC_SESTRKRATN(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2;
  -- возвращает кратность наблюдений по НАЗНАЧЕНЮ  (ч/запятую)
  FUNCTION GET_NAZ_PATH(pFK_NAZID IN BINARY_INTEGER) RETURN VARCHAR2;
  -- возвращает путь введения по НАЗНАЧЕНЮ

  FUNCTION GET_DIAG_MAIN(pFK_PACID IN NUMBER) RETURN VARCHAR2;
  -- возвращает основной диагноз по пациенту
  FUNCTION GET_DIAG_CLINIK(pFK_PACID IN NUMBER) RETURN VARCHAR2;
  --возвращает текущий диагноз по пациенту
  FUNCTION GET_DIAG_ANATOM(pFK_PACID IN NUMBER) RETURN VARCHAR2;
  --возвращает клинико-паталогоанатомический диагноз по пациенту
  FUNCTION GET_DIAG_NAPR(pFK_PACID IN NUMBER) RETURN VARCHAR2;
  --возвращает диагноз направившего учреждения по пациенту
  FUNCTION GET_DIAG_PRIPOSTUP(pFK_PACID IN NUMBER) RETURN VARCHAR2;
  --возвращает диагноз при поступлении по пациенту
  --возврачает причину отказа в госпитализации
  FUNCTION GET_PAC_GOSPOTKAZ(pFK_PACID IN NUMBER) RETURN VARCHAR2;
  --возвращает название операции
  FUNCTION GET_OPER_NAME(pNazID NUMBER) RETURN VARCHAR;
  --возвращает дату предпоследнего обращения
  FUNCTION GET_LAST_OSM(pNazid NUMBER) RETURN DATE;
end PKG_LISTS;
/

SHOW ERRORS;


