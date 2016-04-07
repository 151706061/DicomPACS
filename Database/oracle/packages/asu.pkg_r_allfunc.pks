DROP PACKAGE ASU.PKG_R_ALLFUNC
/

--
-- PKG_R_ALLFUNC  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_R_ALLFUNC" 
 is
  -- Author  : TIMURLAN
  -- Created : 01.04.2002 9:55:36
  -- Purpose : 4 %PKG_R_% 's common proc. & func. only
 FUNCTION RETURN_VALUE (nValue IN NUMBER) RETURN VARCHAR2;
 FUNCTION RETURN_VALUE (cValue IN VARCHAR2) RETURN VARCHAR2;
 FUNCTION COUNT_SROK (pFK_PACID IN NUMBER) RETURN NUMBER;

 FUNCTION GET_COUNT_INC (pFD_DATAC IN DATE) RETURN NUMBER;
 -- количество заехавших за день
 FUNCTION GET_COUNT_INC_KORP (pFD_DATAC IN DATE,pFK_KORPID IN NUMBER) RETURN NUMBER;
 -- количество заехавших за день по корпусу или всем корпусам
 FUNCTION GET_COUNT_INC (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE) RETURN NUMBER;
 -- количество заехавших в периоде
 FUNCTION GET_COUNT_INC_PRIZN (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_PRIZN IN NUMBER) RETURN NUMBER;
 -- количество заехавших в периоде в соотв. С ПРИЗНАКОМ
 FUNCTION GET_COUNT_INC_VID (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_KOD2 IN NUMBER) RETURN NUMBER;
 -- количество заехавших в периоде в соотв. С ТИПОМ ПРИБЫТИЯ
 FUNCTION GET_COUNT_INC_VOZR (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFN_VOZR IN NUMBER,pFL_BIGGER IN NUMBER) RETURN NUMBER;
 -- количество заехавших в периоде в соотв. С ВОЗРАСТОМ
 FUNCTION GET_COUNT_INC_SKK (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFL_SKK IN NUMBER) RETURN NUMBER;
 -- количество заехавших в периоде с наличием СКК
 FUNCTION GET_COUNT_INC_VOZR_SKK (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFN_VOZR IN NUMBER,pFL_BIGGER IN NUMBER,pFL_SKK IN NUMBER) RETURN NUMBER;
 -- количество заехавших в периоде в соотв. С ВОЗРАСТОМ и наличием СКК
 FUNCTION GET_COUNT_INC_PUT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN NUMBER;
 -- количество заехавших в периоде с путевками (СЧИТАЕМ К-ВО ПУТЕВОК)
 FUNCTION GET_COUNT_INC_PUT (pFD_DATA IN DATE) RETURN NUMBER;
 -- количество заехавших с путевками (СЧИТАЕМ К-ВО ПУТЕВОК)
 FUNCTION GET_COUNT_PEREHOD_PUT (pFD_DATA IN DATE) RETURN NUMBER;
 -- количество переходящих пуветок
 FUNCTION GET_COUNT_OUT(pFD_DATAC IN DATE) RETURN NUMBER;
 -- количество выписавшихся за день
 FUNCTION GET_COUNT_OUT_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER) RETURN NUMBER;
 -- количество выписавшихся за день по корпусу или всем корпусам
 FUNCTION GET_COUNT_OUT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN NUMBER;
 -- количество выписавшихся за период
 FUNCTION GET_COUNT_TEMPOUT(pFD_DATAC IN DATE) RETURN NUMBER;
 -- количество выписавшихся (временно) за день
 FUNCTION GET_COUNT_TEMPOUT_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER) RETURN NUMBER;
 -- количество выписавшихся (временно) за день по корпусу или всем корпусам
 FUNCTION GET_COUNT_RECOVER(pFD_DATAC IN DATE) RETURN NUMBER;
 -- количество восстановившихся за день
 FUNCTION GET_COUNT_RECOVER_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER) RETURN NUMBER;
 -- количество восстановившихся за день по корпусу или всем корпусам

 FUNCTION GET_COUNT_PRYB(pFD_DATAC IN DATE) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) за день
 FUNCTION GET_COUNT_PRYB2(pFD_DATAC IN DATE) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) за день + планирование!
 FUNCTION GET_COUNT_PRYB_VID(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) за день по ТИПУ ПРИБЫТИЯ !
 FUNCTION GET_COUNT_PRYB_VID2(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) за день по ТИПУ ПРИБЫТИЯ ! + планирование!
 FUNCTION GET_COUNT_PRYB_PALATA(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) за день по ТИПУ ПАЛАТЫ !
 FUNCTION GET_COUNT_PRYB_PALATA2(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) за день по ТИПУ ПАЛАТЫ ! + планирование!
 FUNCTION GET_COUNT_PRYB_PUT(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) за день по ТИПУ ПУТЕВКИ !
 FUNCTION GET_COUNT_PRYB_PUT2(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) за день по ТИПУ ПУТЕВКИ ! + планирование!
 FUNCTION GET_COUNT_PRYB_AGE(pFD_DATAC IN DATE, pFN_AGE IN NUMBER, pFL_GREATER IN NUMBER) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) за день по ВОЗРАСТУ
 FUNCTION GET_COUNT_PRYB_KORP(pFD_DATAC IN DATE, pFK_KORPID IN NUMBER) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) за день по корпусу или всем корпусам
 FUNCTION GET_COUNT_PRYB (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) в периоде
 FUNCTION GET_COUNT_PRYB2 (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) в периоде + планиорвание!
 FUNCTION GET_COUNT_PRYB_PRIZN (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_PRIZN IN NUMBER) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) в периоде в соотв. с ПРИЗНАКОМ
 FUNCTION GET_COUNT_PRYB_SHORT (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) в периоде по КОРОТКОМУ СРОКУ
 FUNCTION GET_COUNT_PRYB_SHORT_PRIZN (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_PRIZN IN NUMBER) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) в периоде по КОРОТКОМУ СРОКУ в соотв. с ПРИЗНАКОМ
 FUNCTION GET_COUNT_PRYB_VID (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KOD2 IN NUMBER) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) в периоде в соотв. с ТИПОМ ПРИБЫТИЯ !
 FUNCTION GET_COUNT_PRYB_VID2 (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KOD2 IN NUMBER) RETURN VARCHAR2;
 -- количество заехавших (+ восстановившихся) в периоде в соотв. с ТИПОМ ПРИБЫТИЯ ! + планирование!

 FUNCTION GET_COUNT_VYB(pFD_DATAC IN DATE) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) за день
 FUNCTION GET_COUNT_VYB2(pFD_DATAC IN DATE) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) за день + планирование!
 FUNCTION GET_COUNT_VYB_VID(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) за день по ТИПУ ПРИБЫТИЯ !
 FUNCTION GET_COUNT_VYB_VID2(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) за день по ТИПУ ПРИБЫТИЯ ! + планирование!
 FUNCTION GET_COUNT_VYB_PALATA(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) за день по ТИПУ ПАЛАТЫ !
 FUNCTION GET_COUNT_VYB_PALATA2(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) за день по ТИПУ ПАЛАТЫ ! + планирование!
 FUNCTION GET_COUNT_VYB_PUT(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) за день по ТИПУ ПУТЕВКИ !
 FUNCTION GET_COUNT_VYB_PUT2(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) за день по ТИПУ ПУТЕВКИ ! + планирование!
 FUNCTION GET_COUNT_VYB_AGE(pFD_DATAC IN DATE, pFN_AGE IN NUMBER, pFL_GREATER IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) за день по ВОЗРАСТУ
 FUNCTION GET_COUNT_VYB_KORP(pFD_DATAC IN DATE, pFK_KORPID IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) за день по корпусу или всем корпусам
 FUNCTION GET_COUNT_VYB (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) в периоде
 FUNCTION GET_COUNT_VYB2 (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) в периоде + планирование!
 FUNCTION GET_COUNT_VYB_PRIZN (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_PRIZN IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) в периоде в соотв. с ПРИЗНАКОМ
 FUNCTION GET_COUNT_VYB_SHORT (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) в периоде по КОРОТКОМУ СРОКУ
 FUNCTION GET_COUNT_VYBSHORTPRIZN (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_PRIZN IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) в периоде по КОРОТКОМУ СРОКУ в соотв. с ПРИЗНАКОМ
 FUNCTION GET_COUNT_VYB_VID (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_KOD2 IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) в периоде в соотв. с ТИПОМ ПРИБЫТИЯ !
 FUNCTION GET_COUNT_VYB_VID2 (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_KOD2 IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) в периоде в соотв. с ТИПОМ ПРИБЫТИЯ ! + планирование!
 FUNCTION GET_COUNT_VYB_VID_PRIZN (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_KOD2 IN NUMBER,pFK_PRIZNID IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) в периоде в соотв. с ТИПОМ ПРИБЫТИЯ & с ПРИЗНАКОМ
 FUNCTION GET_COUNT_VYB_VID_SHORT (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_KOD2 IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) в периоде в соотв. с ТИПОМ ПРИБЫТИЯ по КОРОТКОМУ СРОКУ
 FUNCTION GET_COUNT_VYB_VID_SHORT_PRIZN (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_KOD2 IN NUMBER,pFK_PRIZNID IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) в периоде в соотв. с ТИПОМ ПРИБЫТИЯ по КОРОТКОМУ СРОКУ & с ПРИЗНАКОМ
 FUNCTION GET_COUNT_VYB_SUBVID (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_KOD2 IN NUMBER,pFK_KOD IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) в периоде в соотв. с ТИПОМ и ПОДТИПОМ ПРИБЫТИЯ
 FUNCTION GET_COUNT_VYB_SVID_PRIZN (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_KOD2 IN NUMBER,pFK_KOD IN NUMBER,pFK_PRIZNID IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) в периоде в соотв. с ТИПОМ и ПОДТИПОМ ПРИБЫТИЯ & с ПРИЗНАКОМ
 FUNCTION GET_COUNT_VYB_SVID_SHORT (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_KOD2 IN NUMBER,pFK_KOD IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) в периоде в соотв. с ТИПОМ и ПОДТИПОМ ПРИБЫТИЯ по КОРОТКОМУ СРОКУ
 FUNCTION GET_COUNT_VYB_SVID_SHORT_PRIZN (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_KOD2 IN NUMBER,pFK_KOD IN NUMBER,pFK_PRIZNID IN NUMBER) RETURN VARCHAR2;
 -- количество выписавшихся (+ временно) в периоде в соотв. с ТИПОМ и ПОДТИПОМ ПРИБЫТИЯ по КОРОТКОМУ СРОКУ & с ПРИЗНАКОМ
 FUNCTION GET_COUNTV_OPOZD (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN NUMBER;
 -- количество опоздавших в периоде (выписанных)
 FUNCTION GET_COUNTV_OPOZD_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER) RETURN NUMBER;
 -- количество опоздавших в периоде (выписанных) & с ПРИЗНАКОМ
 FUNCTION GET_COUNTV_OPOZD_SHORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN NUMBER;
 -- количество опоздавших в периоде (выписанных) по КОРОТКОМУ СРОКУ
 FUNCTION GET_COUNTV_OPOZD_SHORT_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER) RETURN NUMBER;
 -- количество опоздавших в периоде (выписанных) по КОРОТКОМУ СРОКУ & с ПРИЗНАКОМ
 FUNCTION GET_COUNTV_EARLY(pFD_DATAC IN DATE) RETURN NUMBER;
 -- количество досрочно выписавшихся за день
 FUNCTION GET_COUNTV_EARLY_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER) RETURN NUMBER;
 -- количество досрочно выписавшихся за день по корпусу или всем корпусам
 FUNCTION GET_COUNTV_EARLY (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN NUMBER;
 -- количество досрочно выписавшихся в периоде
 FUNCTION GET_COUNTV_EARLY_TEMP(pFD_DATAC IN DATE) RETURN NUMBER;
 -- количество досрочно выписавшихся (временно) за день
 FUNCTION GET_COUNTV_EARLY_TEMP_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER) RETURN NUMBER;
 -- количество досрочно выписавшихся (временно) за день по корпусу или всем корпусам
 FUNCTION GET_COUNTV_EARLY_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER) RETURN NUMBER;
 -- количество досрочно выписавшихся в периоде & с ПРИЗНАКОМ
 FUNCTION GET_COUNTV_EARLY_SHORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN NUMBER;
 -- количество досрочно выписавшихся в периоде по КОРОТКОМУ СРОКУ
 FUNCTION GET_COUNTV_EARLY_SHORT_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER) RETURN NUMBER;
 -- количество досрочно выписавшихся в периоде по КОРОТКОМУ СРОКУ & с ПРИЗНАКОМ
 FUNCTION GET_COUNT_PRODL_NAL(pFD_DATAC IN DATE) RETURN NUMBER;
 -- количество продливших лечение за наличку
 FUNCTION GET_COUNT_PRODL_NAL_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER) RETURN NUMBER;
 -- количество продливших лечение за наличку по корпусу или всем корпусам
 FUNCTION GET_COUNT_PRODL_OPOZD(pFD_DATAC IN DATE) RETURN NUMBER;
 -- количество продливших лечение в счет опоздания
 FUNCTION GET_COUNT_PRODL_OPOZD_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER) RETURN NUMBER;
 -- количество продливших лечение в счет опоздания по корпусу или всем корпусам
 FUNCTION GET_COUNTV_PRODL (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN NUMBER;
 -- количество продлившихся в периоде (выписанных)
 FUNCTION GET_COUNTV_PRODL_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER) RETURN NUMBER;
 -- количество продлившихся в периоде (выписанных) & с ПРИЗНАКОМ
 FUNCTION GET_COUNTV_PRODL_SHORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN NUMBER;
 -- количество продлившихся в периоде (выписанных) по КОРОТКОМУ СРОКУ
 FUNCTION GET_COUNTV_PRODL_SHORT_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER) RETURN NUMBER;
 -- количество продлившихся в периоде (выписанных) по КОРОТКОМУ СРОКУ & с ПРИЗНАКОМ
 FUNCTION GET_COUNTV_PRODL (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRYB IN NUMBER) RETURN NUMBER;
 -- количество продлившихся в периоде (выписанных) по ТИПУ ПРИБЫТИЯ !
 FUNCTION GET_COUNTV_PRODL_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER, pFK_PRYB IN NUMBER) RETURN NUMBER;
 -- количество продлившихся в периоде (выписанных) & с ПРИЗНАКОМ по ТИПУ ПРИБЫТИЯ !
 FUNCTION GET_COUNTV_PRODL_SHORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRYB IN NUMBER) RETURN NUMBER;
 -- количество продлившихся в периоде (выписанных) по КОРОТКОМУ СРОКУ по ТИПУ ПРИБЫТИЯ !
 FUNCTION GET_COUNTV_PRODL_SHORT_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER, pFK_PRYB IN NUMBER) RETURN NUMBER;
 -- количество продлившихся в периоде (выписанных) по КОРОТКОМУ СРОКУ & с ПРИЗНАКОМ по ТИПУ ПРИБЫТИЯ !

 FUNCTION GET_COUNT_MORNING(pFD_DATAC IN DATE) RETURN NUMBER;
 -- количество проживающих на начало дня (0:00)
 FUNCTION GET_COUNT_MORNING2(pFD_DATAC IN DATE) RETURN NUMBER;
 -- количество проживающих на начало дня (0:00) + планирование!
 FUNCTION GET_COUNT_MORNING_PRIZN(pFD_DATAC IN DATE,pFK_PRIZNID IN NUMBER) RETURN NUMBER;
 -- количество проживающих на начало дня (0:00) с ПРИЗНАКОМ
 FUNCTION GET_COUNT_MORNING_SHORT(pFD_DATAC IN DATE) RETURN NUMBER;
 -- количество проживающих на начало дня (0:00) по КОРОТКОМУ СРОКУ
 FUNCTION GET_COUNT_MORNING_SHORT_PRIZN(pFD_DATAC IN DATE,pFK_PRIZNID IN NUMBER) RETURN NUMBER;
 -- количество проживающих на начало дня (0:00) по КОРОТКОМУ СРОКУ & с ПРИЗНАКОМ
 FUNCTION GET_COUNT_MORNING_VID(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER) RETURN NUMBER;
 -- количество проживающих на начало дня (0:00) по ТИПУ ПРИБЫТИЯ !
 FUNCTION GET_COUNT_MORNING_VID2(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER) RETURN NUMBER;
 -- количество проживающих на начало дня (0:00) по ТИПУ ПРИБЫТИЯ ! + планирование!
 FUNCTION GET_COUNT_MORNING_PALATA(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER) RETURN NUMBER;
 -- количество проживающих на начало дня (0:00) по ТИПУ ПАЛАТЫ !
 FUNCTION GET_COUNT_MORNING_PALATA2(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER) RETURN NUMBER;
 -- количество проживающих на начало дня (0:00) по ТИПУ ПАЛАТЫ ! + планирование!
 FUNCTION GET_COUNT_MORNING_PUT(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER) RETURN NUMBER;
 -- количество проживающих на начало дня (0:00) по ТИПУ ПУТЕВКИ !
 FUNCTION GET_COUNT_MORNING_PUT2(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER) RETURN NUMBER;
 -- количество проживающих на начало дня (0:00) по ТИПУ ПУТЕВКИ ! + планирование!
 FUNCTION GET_COUNT_MORNING_AGE (pFD_DATAC IN DATE, pFN_AGE IN NUMBER, pFL_GREATER IN NUMBER) RETURN NUMBER;
 -- количество проживающих на начало дня (0:00) по ВОЗРАСТУ
 FUNCTION GET_COUNT_MORNING_KORP(pFD_DATAC IN DATE, pFK_KORPID IN NUMBER) RETURN NUMBER;
 -- количество проживающих на час Х:ХХ по корпусу или всем корпусам
end PKG_R_ALLFUNC;
/

SHOW ERRORS;


