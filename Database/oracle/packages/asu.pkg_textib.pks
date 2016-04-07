DROP PACKAGE ASU.PKG_TEXTIB
/

--
-- PKG_TEXTIB  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_TEXTIB" 
 IS
  -- LastUpdated : 01.07.2005 by TimurLan
  -- LastUpdated : 19.07.2005 by Xander
  --полная история болезни
  FUNCTION getFullIbClobID(pFK_PACID IN NUMBER,pFK_SOTRID IN NUMBER DEFAULT -1) RETURN NUMBER;

  -- заголовок епикриза
  FUNCTION getEpikrizHeaderText(pFK_PACID IN NUMBER,
                                bDIAG     IN NUMBER,
                                bHEADER   IN NUMBER) RETURN VARCHAR2;

  -- полчить код клоба с текстом всего эпикриза
  FUNCTION getFullEpikrizTextClobID(pFK_PACID IN NUMBER,
                                    pfl_diagn IN NUMBER,
                                    pfl_zakl  IN NUMBER,
                                    pFL_lab   IN NUMBER,
                                    pfl_diag  IN NUMBER,
                                    pfl_lech  IN NUMBER,
                                    pfl_kons  IN NUMBER) RETURN NUMBER;

  --формирует и заносит в епикриз заключение
  FUNCTION getVrachRek(pFK_PACID IN NUMBER) RETURN CLOB;
  PROCEDURE DoSetEpikriz(pFK_PACID     IN NUMBER,
                         pfk_clobid    IN NUMBER,
                         pfk_epclobid  IN NUMBER,
                         pfk_rekclobid IN NUMBER,
                         pFL_PODPIS    IN NUMBER,
                         pFK_VRACHID   IN NUMBER);

  --возвращает клоб с разделом истории болезни
  FUNCTION getRazdelIbText(pFK_PACID IN NUMBER DEFAULT NULL,
                           nStartID  IN NUMBER,
                           sCaption  IN VARCHAR2,
                           sDefault  IN VARCHAR2) RETURN CLOB;
  FUNCTION getStatNazIbClob(pFK_PACID IN NUMBER, bEp IN NUMBER) RETURN CLOB;

  --Настраиваемая ПОЛНАЯ история болезни  by TimurLan
  FUNCTION getFullIbClobID_by_SET(pFC_PACID IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1,pFN_CALLTYPE IN NUMBER DEFAULT 1) RETURN NUMBER; -- by TimurLan Сбор полной ИБ
  FUNCTION SET_getIbHeader(pFC_PACID IN VARCHAR2,pFN_MODE  IN NUMBER DEFAULT 0,pFN_TYPE  IN NUMBER DEFAULT 1) RETURN CLOB; -- by TimurLan Заголовок ИБ
  FUNCTION SET_getIbEnder(pFC_PACID IN VARCHAR2,pFN_MODE  IN NUMBER DEFAULT 0,pFN_TYPE  IN NUMBER DEFAULT 1) RETURN CLOB; -- by TimurLan Конец ИБ
  FUNCTION SET_getIbDiags(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Диагнозы пациента
  FUNCTION SET_GET_PAC_PROTIV(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Показания к лечению
  FUNCTION SET_getanambolIbText(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Анамнез болезни
  FUNCTION SET_getRazdelIbText1(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Жалобы
  FUNCTION SET_getRazdelIbText2(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Анамнез жизни
  FUNCTION SET_getRazdelIbText3(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Эпиданамнез
  FUNCTION SET_getRazdelIbText4(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Данные объективных исследований
  FUNCTION SET_GET_PAGE_BREAK(pFK_PACID IN NUMBER DEFAULT NULL) RETURN CLOB; -- by TimurLan Разрыв страницы
  FUNCTION SET_GET_HR(pFK_PACID IN NUMBER DEFAULT NULL) RETURN CLOB; -- by TimurLan Горизонтальная линия
  FUNCTION SET_GET_RAZD_BREAK(pFK_PACID IN NUMBER DEFAULT NULL) RETURN CLOB; -- by TimurLan Разделитель разделов ИБ
  FUNCTION SET_do_diagbytype1(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Основной диагноз
  FUNCTION SET_do_diagbytype2(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Сопутствующий диагноз
  FUNCTION SET_GET_NAZRESULTKEK_IB(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Заседание КЭК
  FUNCTION SET_getNazListIbText(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Лист диагностических назначениий
  FUNCTION SET_getProcListIbText(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Лист лечебных назначенний
  FUNCTION SET_GetNazMed(pFK_PACID IN NUMBER DEFAULT NULL, pFN_MODE IN NUMBER DEFAULT 0)RETURN CLOB; -- by TimurLan Лист медикаментозных назначений
  FUNCTION SET_getTechBolIbText(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Динамика наблюдений
  FUNCTION SET_getResAnIbText(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Результаты анализов
  FUNCTION SET_getResNazIbText1(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Результаты диагностических исследований
  FUNCTION SET_getResNazIbText2(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Консультации специалистов
  FUNCTION SET_getFirstPatalogy(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Впервые выявленные патологии
  FUNCTION SET_getEpikrizHeaderText(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0)RETURN CLOB; -- by TimurLan Выписной эпикриз
  FUNCTION SET_getStatNazIbClob(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Отпущенные процедуры
  FUNCTION SET_getVrachZakl(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Заключение лечащего врача
  FUNCTION SET_getVrachRek(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Рекомендации лечащего врача
  FUNCTION SET_getPodpisiIbText(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Подписи ИБ
  FUNCTION SET_getStomIbText(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB; -- by TimurLan Курс стоматологического лечения
  FUNCTION getFullIbClobID_by_SET2(pFC_PACID IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1,pFN_CALLTYPE IN NUMBER DEFAULT 2) RETURN NUMBER;
  FUNCTION getFullIbClobID_by_SET3(pFC_PARAM IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1,pFN_CALLTYPE IN NUMBER DEFAULT 2) RETURN NUMBER;
  FUNCTION SET_getIbHeader2(pFC_PACID IN VARCHAR2,pFN_MODE  IN NUMBER DEFAULT 0,pFN_TYPE  IN NUMBER DEFAULT 1) RETURN CLOB;
  FUNCTION getIbHeader3(pFK_PEPLID IN NUMBER) RETURN VARCHAR2;
  FUNCTION GET_NAZ_RESULT(pFK_NAZID IN NUMBER) RETURN CLOB;
   --первичный осмотр by XANDER
  FUNCTION SET_FIRSTOSM(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB;
  --Предоперационный эпикриз by XANDER
  FUNCTION SET_EPIKRIZ1(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB;
  --Предоперационный эпикриз анастезиолога by XANDER
  FUNCTION SET_EPIKRIZ2(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB;
  --Протокол операции   by XANDER
  FUNCTION SET_OPERPROT(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB;
  --Карта анастезии   by XANDER
  FUNCTION SET_ANASTKARTA(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB;
  --Клинико-патологоанатомический эпикриз   by XANDER
  FUNCTION SET_EPIKRIZ3(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB;
  --Запись результатов измерений температуры, других исследований и процедур  by XANDER
  FUNCTION SET_TEMPLIST(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB;

END;
/

SHOW ERRORS;


