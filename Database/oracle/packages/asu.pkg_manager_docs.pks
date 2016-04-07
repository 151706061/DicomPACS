DROP PACKAGE ASU.PKG_MANAGER_DOCS
/

--
-- PKG_MANAGER_DOCS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_MANAGER_DOCS" IS
  FUNCTION GET_PROC_PACLIST(pSPEC IN NUMBER, pDATE IN DATE,pRecept in number) RETURN NUMBER;  --Возвращает код документа в TCLOBS (ЕЖЕДНЕВНЫЙ ОТЧЕТ О
                                                                            --ПРОХОЖДЕНИИ ПРОЦЕДУР ПАЦИЕНТАМИ)
  FUNCTION GET_DOC_HEADER(pNAME IN VARCHAR2) RETURN VARCHAR2;  --Возвращает заголовок HTML файла, в качестве параметра передается
                                                                    --название санатория
  FUNCTION GET_DOC_STYLES1 RETURN VARCHAR2;      --Записывает таблицу стилей для отчета в уже открытый клоб
  FUNCTION GET_DOC_STYLES2 RETURN VARCHAR2;      --Записывает таблицу стилей для отчета в уже открытый клоб
  FUNCTION GET_TITLE_DOC(pNAME IN VARCHAR2) RETURN VARCHAR2;  --Возвращает шапку документа
  FUNCTION GET_PAC_PROCLIST (pPAC_ID IN NUMBER, nMODE IN NUMBER) RETURN NUMBER;  --Возвращает код документа в TCLOBS
  FUNCTION GET_KAB(pSMID IN NUMBER,pSOTRID IN NUMBER) RETURN NUMBER;                                                                                                   --(СПИСОК НАЗНАЧЕНИЙ ПАЦИЕНТА ПО ДНЯМ)
END; -- Package Specification PKG_MANAGER_DOCS
/

SHOW ERRORS;


