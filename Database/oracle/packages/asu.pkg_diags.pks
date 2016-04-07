DROP PACKAGE ASU.PKG_DIAGS
/

--
-- PKG_DIAGS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_DIAGS"
  IS
--
-- Purpose: Работа с диагнозами
--
-- By Philip A. Milovanov
--
  PROCEDURE SET_SHOWIB(pFK_ID IN NUMBER);
  FUNCTION GET_MKB_10(pFK_PACID IN NUMBER) RETURN VARCHAR2;

/*----------------------------------------------------------------------------*/
/*     Далее идут функции, которые возвращают различные диагнозы пациентов    */
/*----------------------------------------------------------------------------*/
/* Author: Neronov A.S.  27.06.2011                                           */
/*----------------------------------------------------------------------------*/
  FUNCTION GET_MKB10_FROM_DIAG(pDiagid in number) return varchar2;
  FUNCTION GET_DIAG_MAIN(pPacid in number, pNazid in number) return number;
  FUNCTION GET_DIAG_ZAKL(pPacid in number, pNazid in number) return number;
  FUNCTION GET_DIAG_PRED(pPacid in number, pNazid in number) return number;
  FUNCTION GET_DIAG_SOPUT(pPacid in number, pNazid in number) return number;
  FUNCTION GET_DIAG_NAPR(pPacid in number, pNazid in number) return number;
END PKG_DIAGS; -- Package Specification PKG_DIAGS
/

SHOW ERRORS;


