DROP PACKAGE ASU.PKG_MANAGER
/

--
-- PKG_MANAGER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_MANAGER" IS -- MODIFICATION HISTORY
-- Mikrom      22.02.2001
-- Mjdified by PHP (Netrebenko Evgeniy) 04.11.2003
  PROCEDURE DO_DEL_PAC_FROM_KONS(pNAZID IN NUMBER);
  PROCEDURE DO_INSERT_PAC_KONS(pNAZID IN NUMBER, pDATETIME IN DATE);
  FUNCTION GET_NAZPROC_COUNT_IB(pID IN NUMBER) RETURN NUMBER; -- Возвращает количество процедур которое храниться в TIB, на данное назначение.
  FUNCTION GET_NAZPROC_MASK(pID IN NUMBER) RETURN VARCHAR2; -- Возвращает маску прохождения процедур на данное назначение.
  PROCEDURE INSERT_SOMEPROC(pSMID IN NUMBER, pPACID IN NUMBER, pNAZID IN NUMBER, pSOSID IN NUMBER, pDAYINS DATE, pFK_ISPOLKABID in number default -1); --Вставляет количество
  FUNCTION GET_NUM_OF_SUNDAY RETURN NUMBER;
  FUNCTION GET_NAZPROC_SOSID(pID IN NUMBER) RETURN NUMBER;  -- Возвращает код статуса, который надо присвоить назначению, в зависимости от                                                          -- того, какой статус имеют все процедуры, данного назначения.
  FUNCTION GET_NAZPROC_COUNT_NEVIP(pID IN NUMBER) RETURN NUMBER;  -- Возвращает кол-во невыполненых процедур на данное назначение.
  FUNCTION GET_NAZPROC_COUNT_NOTINRASPIS(pID IN NUMBER) RETURN NUMBER; --Возвращает кол-во процедур не занесенных в расписание на данное назначение
  PROCEDURE INSERT_PAC_PROC_IN_RASPIS(pID IN NUMBER, pPACID IN NUMBER, pNAZID IN NUMBER, pLECH_ID OUT NUMBER); --Записывает пациента на данный период                                                                                                             --в расписании и обновляет запись в                                                                                                             --таблеце процедур.
  PROCEDURE DELETE_PAC_FROM_RASPIS(pID IN NUMBER, pPACID IN NUMBER, pNAZID IN NUMBER); --Удаляет пациента из графика прохождения процедур.
  FUNCTION GET_PROC_SOS(pNAZID IN NUMBER, pDAYINS IN DATE) RETURN VARCHAR2;     --Возвращает статус процедуры на текущий день
  FUNCTION GET_PROC_SOS_ID(pNAZID IN NUMBER, pDAYINS IN DATE) RETURN NUMBER;    --Возвращает код статуса процедуры на текущий день
  FUNCTION GET_PROC_COUNT_TODAY(pNAZID IN NUMBER, pDAYINS IN DATE) RETURN NUMBER;
  FUNCTION GET_PACSEX(pID IN NUMBER) RETURN VARCHAR2;  --Возвращает первую букву пола пациента
  FUNCTION IS_NOT_PACVYB(pPACID IN NUMBER) RETURN NUMBER;  --Возвращает 1- если пациент выписан.
  FUNCTION GET_IS_PAC_PROC_IN_RASPIS(pID IN NUMBER) RETURN NUMBER; --Возвращает 1 если все процедуры пациента разнесены по расписанию
  FUNCTION IS_PAC_BUSY_IN_PERIOD(pPACID IN NUMBER, pFK_GRAPH  IN NUMBER) RETURN NUMBER; --Возвращает 1 если пациент в это время занят
  FUNCTION GET_SMID_TIME_LENGTH(pSMID IN NUMBER) RETURN NUMBER;  --Возвращает продолжительность pSMID
  FUNCTION GET_NAZ_NOTINRASPIS(pID IN NUMBER) RETURN NUMBER;
  FUNCTION create_temp_graph_table (ppacid IN NUMBER, pgraphid IN NUMBER, pnazid IN NUMBER, ppacsex IN NUMBER,pDayC IN NUMBER default 30) RETURN NUMBER;
  FUNCTION get_graph_period (pgraphid IN NUMBER, pdate DATE) RETURN NUMBER;
  FUNCTION get_naz_time_period (pnazid IN NUMBER, pdate DATE) RETURN NUMBER;
  FUNCTION get_smid_interval (sm1 IN NUMBER, sm2 IN NUMBER) RETURN NUMBER;
  PROCEDURE delete_for_day (pid IN NUMBER);
  PROCEDURE DO_UPDATE_NAZPROC(pNAZID IN NUMBER);
  FUNCTION IS_TIME_IN_BUSY_PERIOD(pNAZVRACHID NUMBER, pDATE DATE, pTIME DATE, pPRIEMINT NUMBER)  return NUMBER;
  FUNCTION get_graphid_period (pFK_GRAPHID IN NUMBER) RETURN NUMBER;
  procedure DoUpdateAfterInsert(pFK_GRAPHID in number, DefPeriod in number );
  procedure DoUpdateAfterInsertShablon(pFK_GRAPHID in number, DefPeriod in number );

END; -- Package Specification PKG_MANAGER
/

SHOW ERRORS;


