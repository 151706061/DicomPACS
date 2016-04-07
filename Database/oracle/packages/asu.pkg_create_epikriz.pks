DROP PACKAGE ASU.PKG_CREATE_EPIKRIZ
/

--
-- PKG_CREATE_EPIKRIZ  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_CREATE_EPIKRIZ" IS

--Новая функция, которая возращает номер клоба НОВОГО ЭПИКРИЗА
FUNCTION get_EPIKRIZ(pFC_PACID IN VARCHAR2, -- массив из идешников назначений, консультаций, осмотров и т.д.
                     pFK_PACID IN NUMBER, --идешник пациента
                     pFK_ID    IN NUMBER, --идешник эпикриза из таблицы TEPIKRIZ
                     pFN_VIEW  IN NUMBER,
                     pFC_NAME  IN VARCHAR2) --если запрашивается только текст без переформирования эпикриза
                     RETURN NUMBER;

-- заголовок епикриза
FUNCTION getEpikrizHeaderText(pFK_PACID IN NUMBER,
                              bDIAG     IN NUMBER,
                              bHEADER   IN NUMBER,
                              pFC_NAME  IN VARCHAR2,
                              pFC_PACID IN VARCHAR2) RETURN VARCHAR2;

-- получить код клоба с текстом всего эпикриза
FUNCTION getFullEpikrizTextClobID(pFK_PACID IN NUMBER,
                                  pfl_diagn IN NUMBER,
                                  pfl_zakl  IN NUMBER,
                                  pFL_lab   IN NUMBER,
                                  pfl_diag  IN NUMBER,
                                  pfl_lech  IN NUMBER,
                                  pfl_kons  IN NUMBER,
                                  pFK_ID    IN NUMBER) RETURN NUMBER;

PROCEDURE DoSetEpikriz(pFK_PACID     IN NUMBER,
                       pfk_clobid    IN NUMBER,
                       pfk_epclobid  IN NUMBER,
                       pfk_rekclobid IN NUMBER,
                       pFL_PODPIS    IN NUMBER,
                       pFK_VRACHID   IN NUMBER,
                       pFK_ID        IN NUMBER); --KOLYA 22.01.05
                                  
FUNCTION getVrachZakl(pFK_PACID IN NUMBER, pFK_ID IN NUMBER) RETURN CLOB;
FUNCTION getResAnIbText2(pFK_PACID IN NUMBER, pFC_PACID IN VARCHAR2) RETURN CLOB;
FUNCTION getResNazIbTextEpikriz(pFK_PACID IN NUMBER, nStartID  IN NUMBER, sCaption  IN VARCHAR2) RETURN CLOB;
FUNCTION getStatNazIbClob(pFK_PACID IN NUMBER, bEp IN NUMBER) RETURN CLOB;
/* COMMENTED BY SILL 10.02.06 */
/*FUNCTION GetNazMed(pFK_PACID IN NUMBER) RETURN CLOB;*/
FUNCTION getVrachRek(pFK_PACID IN NUMBER, pFK_ID IN NUMBER) RETURN CLOB;
FUNCTION getPodpisiIbText(pFK_PACID IN NUMBER) RETURN VARCHAR2; --ПОДПИСИ

FUNCTION SET_GET_RAZD_BREAK(pFK_PACID IN NUMBER) RETURN CLOB;
PROCEDURE DoZaklText(pFK_PACID IN NUMBER, pFK_ID IN NUMBER);


/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION getFullIbClobID_by_SET(pFC_PACID IN VARCHAR2,
                                pFN_MODE IN NUMBER DEFAULT 0,
                                pFN_TYPE IN NUMBER DEFAULT 1,
                                pFN_CALLTYPE IN NUMBER DEFAULT 0,
                                pFK_PACID IN NUMBER,
                                pFN_VIEW IN NUMBER) RETURN NUMBER; -- by TimurLan Сбор полной ИБ
PROCEDURE DoInitPacList(cFK_PACID IN VARCHAR2);
FUNCTION SET_getIbHeader(pFC_PACID IN VARCHAR2, pFN_MODE  IN NUMBER DEFAULT 0,pFN_TYPE  IN NUMBER DEFAULT 1) RETURN CLOB; -- by TimurLan Заголовок ИБ
FUNCTION getIbHeaderNormal(pFK_PACID IN NUMBER) RETURN VARCHAR2;
FUNCTION SET_getIbEnder(pFC_PACID IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1) RETURN CLOB;
FUNCTION decodeFC_PacID(cFK_PACID IN OUT VARCHAR2) RETURN NUMBER;

FUNCTION getFullIbClobID_by_SET1(pFC_PACID IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1,pFN_CALLTYPE IN NUMBER DEFAULT 1, pFK_PACID IN NUMBER, pFN_VIEW IN NUMBER) RETURN NUMBER;
FUNCTION getFullIbClobID_by_SET2(pFC_PACID IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1,pFN_CALLTYPE IN NUMBER DEFAULT 2, pFK_PACID IN NUMBER, pFN_VIEW IN NUMBER) RETURN NUMBER;
FUNCTION getFullIbClobID_by_SET3(pFC_PARAM IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1,pFN_CALLTYPE IN NUMBER DEFAULT 2, pFK_PACID IN NUMBER, pFN_VIEW IN NUMBER) RETURN NUMBER;
FUNCTION SET_getIbHeader2(pFC_PACID IN VARCHAR2,pFN_MODE  IN NUMBER DEFAULT 0,pFN_TYPE  IN NUMBER DEFAULT 1) RETURN CLOB;
FUNCTION GET_NAZ_RESULT(pFK_NAZID IN NUMBER) RETURN CLOB;
FUNCTION getIbHeader3(pFK_PEPLID IN NUMBER) RETURN VARCHAR2;
FUNCTION getResAnIbText(pFK_PACID IN NUMBER) RETURN CLOB;

/*----------------------------------------------------------------------------------------------------------------------------------*/
--FUNCTION get_STRPACID(pFK_PACID IN NUMBER, pFC_PACID IN VARCHAR2) RETURN VARCHAR2; --???

END;
/

SHOW ERRORS;


