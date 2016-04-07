DROP PACKAGE ASU.PKG_DONOR
/

--
-- PKG_DONOR  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_DONOR" IS

  -- Author  : Spasskiy S.N.
  -- Created : 02.08.2007 17:47:32
  -- Purpose :

  PROCEDURE LinkPosNaz(pAMBID IN NUMBER, pPosID IN NUMBER, pNazId IN NUMBER);
  --номер обращения по коду пац(последнее по дате)
  FUNCTION Get_PosNum(pAmbid NUMBER) RETURN NUMBER;
  --номер обращения по обращению
  FUNCTION Get_PosNum1(pPosId NUMBER) RETURN NUMBER;
  --результат обращения
  PROCEDURE Get_PosResult(pNazid NUMBER);
  --является ли аутодонором
  FUNCTION IS_AUTODONOR(pAmbid NUMBER) RETURN NUMBER;

  --группа крови - by A.Nakorjakov (17-08-2007)
  FUNCTION Get_BloodGr(pAmbid NUMBER) RETURN VARCHAR2;
  --группа крови - ИД - by A.Nakorjakov (17-08-2007)
  FUNCTION Get_BloodGr_ID(pAmbid NUMBER) RETURN NUMBER;
  --ИД резуса смиде в ветке регистрацонная карта - личные данные
  FUNCTION GET_LICHDANDON_REZUS RETURN NUMBER;
  --резус - by A.Nakorjakov (17-08-2007)
  FUNCTION Get_Rezus(pAmbid NUMBER) RETURN VARCHAR2;
  --резус - ИД - by A.Nakorjakov (17-08-2007)
  FUNCTION Get_Rezus_ID(pAmbid NUMBER) RETURN NUMBER;
  -- вид кроводачи
  FUNCTION GET_VIDDONOR(pPosId IN NUMBER) RETURN number;
  --результат последних лабораторных исследований по синониму исследований для паца pPacId - by A.Nakorjakov (17-09-2007)
  FUNCTION GET_LAST_LABNAZ_RES(pPacId NUMBER, pSyn VARCHAR2) RETURN VARCHAR2;
END PKG_DONOR;
/

SHOW ERRORS;


