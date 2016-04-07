DROP PACKAGE ASU.PKG_R_KDNFUNC
/

--
-- PKG_R_KDNFUNC  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_R_KDNFUNC" 
 is
  -- Author  : TIMURLAN
  -- Created : 01.04.2002 13:56:22
  -- Purpose : 4 %PKG_R_% 's KDN count's proc. & func. only
 FUNCTION GET_KDN (pFD_DATAC IN DATE) RETURN NUMBER;
 -- KDN
 FUNCTION GET_KDN2 (pFD_DATAC IN DATE) RETURN NUMBER;
 -- KDN + планирование!
 FUNCTION GET_KDN_KORP (pFD_DATAC IN DATE,pFK_KORPID IN NUMBER) RETURN NUMBER;
 -- KDN по корпусу или всем корпусам
 FUNCTION GET_KDN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN NUMBER;
 -- KDN в периоде
 FUNCTION GET_KDN2 (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN NUMBER;
 -- KDN в периоде + планирование!
 FUNCTION GET_KDN_PEREHOD (pFD_DATA IN DATE) RETURN NUMBER;
 -- Переходящие KDN
 FUNCTION GET_KDNV_OPOZD (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN NUMBER;
 -- KDN опоздавших в периоде (выписанных)
 FUNCTION GET_KDNV_OPOZD_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER) RETURN NUMBER;
 -- KDN опоздавших в периоде (выписанных) в соотв. с ПРИЗНАКОМ
 FUNCTION GET_KDNV_OPOZD_SHORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN NUMBER;
 -- KDN опоздавших в периоде (выписанных) по КОРОТКОМУ СРОКУ
 FUNCTION GET_KDNV_OPOZD_SHORT_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER) RETURN NUMBER;
 -- KDN опоздавших в периоде (выписанных) по КОРОТКОМУ СРОКУ в соотв. с ПРИЗНАКОМ
 FUNCTION GET_KDNV_EARLY (pFD_DATAC IN DATE) RETURN NUMBER;
 -- KDN выбывших досрочно
 FUNCTION GET_KDNV_EARLY (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN NUMBER;
 -- KDN выбывших досрочно в периоде
 FUNCTION GET_KDNV_EARLY_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER) RETURN NUMBER;
 -- KDN выбывших досрочно в периоде в соотв. с ПРИЗНАКОМ
 FUNCTION GET_KDNV_EARLY_SHORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN NUMBER;
 -- KDN выбывших досрочно в периоде по КОРОТКОМУ СРОКУ
 FUNCTION GET_KDNV_EARLY_SHORT_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER) RETURN NUMBER;
 -- KDN выбывших досрочно в периоде по КОРОТКОМУ СРОКУ в соотв. с ПРИЗНАКОМ
 FUNCTION GET_KDNV_PRODL (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN NUMBER;
 -- KDN продлившихся в периоде (выписанных)
 FUNCTION GET_KDNV_PRODL_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER) RETURN NUMBER;
 -- KDN продлившихся в периоде (выписанных) в соотв. с ПРИЗНАКОМ
 FUNCTION GET_KDNV_PRODL_SHORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE) RETURN NUMBER;
 -- KDN продлившихся в периоде (выписанных) по КОРОТКОМУ СРОКУ
 FUNCTION GET_KDNV_PRODL_SHORT_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER) RETURN NUMBER;
 -- KDN продлившихся в периоде (выписанных) по КОРОТКОМУ СРОКУ в соотв. с ПРИЗНАКОМ
 FUNCTION GET_KDNV_PRODL (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRYB IN NUMBER) RETURN NUMBER;
 -- KDN продлившихся в периоде (выписанных) по ТИПУ ПРИБЫТИЯ !
 FUNCTION GET_KDNV_PRODL_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER, pFK_PRYB IN NUMBER) RETURN NUMBER;
 -- KDN продлившихся в периоде (выписанных) в соотв. с ПРИЗНАКОМ по ТИПУ ПРИБЫТИЯ !
 FUNCTION GET_KDNV_PRODL_SHORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRYB IN NUMBER) RETURN NUMBER;
 -- KDN продлившихся в периоде (выписанных) по КОРОТКОМУ СРОКУ по ТИПУ ПРИБЫТИЯ !
 FUNCTION GET_KDNV_PRODL_SHORT_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER, pFK_PRYB IN NUMBER) RETURN NUMBER;
 -- KDN продлившихся в периоде (выписанных) по КОРОТКОМУ СРОКУ в соотв. с ПРИЗНАКОМ по ТИПУ ПРИБЫТИЯ !
end PKG_R_KDNFUNC;
/

SHOW ERRORS;


