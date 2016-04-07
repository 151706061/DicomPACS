DROP PACKAGE ASU.PKG_IBXML
/

--
-- PKG_IBXML  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_IBXML" 
  IS

 --собирает раздел ИБ
 PROCEDURE SET_IB_RAZ(pPacid NUMBER,pRazid NUMBER,pRAZClob  OUT NUMBER);
  --отображение раздела разделов,подразделов или всей ИБ (трансформация)
 FUNCTION GET_IB(pFk_pacid NUMBER,pSotrID NUMBER,pAppId NUMBER,pRAZiD NUMBER:=-1,pEvent VARCHAR2:='NOEVENT',pVid NUMBER:=0) RETURN CLOB;
 --отображение ИБ в виде буклета(первая страница и температурный лист)
 FUNCTION GET_IB_BOOKLET(pFk_pacid NUMBER) RETURN CLOB;
 --отображение ИБ для вебсервера
 FUNCTION GET_IB_WEB(pPAcid NUMBER) RETURN CLOB;
 --возможна ли печать раздела?(0/1)
 FUNCTION IS_RAZPRINT(pRAZiD NUMBER) RETURN NUMBER;
 --возвращает полную ИБ для печати
 FUNCTION get_fullibprint(pFk_pacid NUMBER) RETURN CLOB;
 -- возвращает кол-во смидов для раздела
 FUNCTION GET_RAZSMIDCNT(pPacid NUMBER,pRazID NUMBER,pSmid NUMBER) RETURN NUMBER;
 -- заполняет кол-во элементов раздела
 PROCEDURE UPDATE_IBRAZ_CNT(pPacid NUMBER,pRazid NUMBER,pSmid NUMBER,pCnt NUMBER);
 -- проверяет раздел на актуальность (0 OR 1)
 FUNCTION CHECK_RAZ(pPacid NUMBER,pRazID NUMBER) RETURN NUMBER;
 --возвращает тип раздела (0-визуальный,1-логический)
 FUNCTION GET_RAZTYPE(pRazid NUMBER) RETURN NUMBER;
 --общие сведения, первая страница
 FUNCTION SET_FST(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --Инд карта беременное или родильницы
 FUNCTION GET_KARTBER(pPAcid NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --дисп карта
 FUNCTION GET_DISP_KARTA(pPAcid NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB ;
 --ученая степерь сотрудников
 function GET_SOTR_RANK(id number) return varchar2;
 --осмотры
 FUNCTION SET_OSM(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --осмотры в HTML (при изменении изменить в pkg_consultrep)
 FUNCTION GET_HTM_OSM(pResId NUMBER) RETURN CLOB;
 --обоснования диагнозов
 FUNCTION SET_OBOSN(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 /*--дневники
 FUNCTION SET_DNEV(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;*/
 --обследования
 FUNCTION SET_OBSLED(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --эпикризы в html для печати
 FUNCTION SET_HTM_EPIKR(pEpikID NUMBER) RETURN CLOB;
 --эпикризы
 FUNCTION SET_EPIKR(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --оперативное лечение
 FUNCTION SET_OPER(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --РОды
 FUNCTION SET_RODI(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --отметки среднего мед. персонала
 FUNCTION SET_SROTMET(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --клинико-патологоанатомическое заключение
 FUNCTION SET_PATOLOG(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --Выписка из ИБ
 FUNCTION SET_IBVIP(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --температурный лист(невизуальный раздел)
 FUNCTION SET_TEMPLIST(pFK_PACID NUMBER) RETURN CLOB;
  --температурный лист(заглушка) для печати (используется только при печати)
 FUNCTION SET_TEMPLISTBLANK(pPacid NUMBER) RETURN CLOB;
 --заключение о госпитализации
 FUNCTION SET_GOSPZAKL(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER) RETURN CLOB;
 --удаляет элемент из ИБ
 --0-ок,1-не пренадлежит тек.сотруднику
 FUNCTION DELETE_EVENT(pRazID NUMBER,pEventID NUMBER,pSotrId NUMBER) RETURN NUMBER;
 --обнуляет контрольную сумму раздела
 PROCEDURE RESET_RAZDEL(pRazSyn VARCHAR,pPAcid NUMBER);
 --возвращает таблицу с диагнозами для назначения
 FUNCTION GET_DIAGBLOCK(pfk_nazid NUMBER,pFk_pacid NUMBER) RETURN CLOB ;
 --собирает блок назначений для родительского назначения
 FUNCTION GET_NAZBLOCK(pfk_nazid NUMBER) RETURN VARCHAR;
  ----------------------------------------------
 FUNCTION GET_PROTHOPER(CL CLOB,pPacid NUMBER,pDate DATE,sVrach VARCHAR,sTime VARCHAR) RETURN CLOB;
 --название диагноза для xml
 FUNCTION get_diagname(pDiagID IN NUMBER) RETURN VARCHAR2;
 FUNCTION  PROCESS (sourceID NUMBER) RETURN CLOB;
 FUNCTION GET_HTMBODY(CL CLOB) RETURN CLOB;
 --возвращает тип док-та пациента
 FUNCTION GET_DOC(pPAcid NUMBER) RETURN NUMBER;
 --возвращает параметры перерливания крови из Tib
 FUNCTION GET_PERELIV (pfk_PACID NUMBER,pSYN VARCHAR2 ) RETURN VARCHAR;
 -- Возвращает диагноз с места направления
 FUNCTION GET_DIAG_NAPR(pPAcid NUMBER) RETURN VARCHAR ;
 PROCEDURE GET_IB_PHP(pXSL_RAZD in out CLOB,pXSL in out CLOB,pXML in out CLOB, pFk_pacid NUMBER,pSotrID NUMBER,pAppId NUMBER,pRAZiD NUMBER:=-1,pEvent VARCHAR2:='NOEVENT',pVid NUMBER:=0);



  PROCEDURE GET_IB_BOOKLET_PHP(pXSL in out CLOB,pXML in out CLOB,pFk_pacid NUMBER);
END;
/

SHOW ERRORS;


