DROP PACKAGE ASU.PKG_EXCH_UPLOAD_MASTER
/

--
-- PKG_EXCH_UPLOAD_MASTER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.pkg_exch_upload_master IS

  native_region NUMBER := 86; -- Родной регион (по справочнику ОФОМС)

  -- pPoly: 0 - стационар, 1 - поликлиника, 2 - стационар + поликлиника
  PROCEDURE FILL_FIRST_TABLE(pBeg DATE, pEnd DATE, pPoly IN NUMBER);
  PROCEDURE FILL_FIRST_TABLE_H(pBeg DATE, pEnd DATE, pPoly IN NUMBER);
  PROCEDURE FILL_FIRST_TABLE_T(pBeg DATE, pEnd DATE, pPoly IN NUMBER);
  PROCEDURE FILL_FIRST_TABLE_NOT_H(pBeg DATE, pEnd DATE, pPoly IN NUMBER);
  PROCEDURE FILL_ADR_FIRST_TABLE;
  PROCEDURE ADD_ROW_ADR_FIRST_TABLE(pPacid IN NUMBER);
  PROCEDURE CLEAR_FIRST_TABLE;
  PROCEDURE CUT_FIRST_TABLE(pregion IN NUMBER, pcompany IN NUMBER);
  PROCEDURE CUT_FIRST_TABLE_H(pregion IN NUMBER, pcompany IN NUMBER);
  PROCEDURE CUT_FIRST_TABLE_T(pregion IN NUMBER, pcompany IN NUMBER);
  PROCEDURE CUT_FIRST_TABLE_NOT_H(pregion IN NUMBER, pcompany IN NUMBER);
  PROCEDURE FILL_LAST_TABLE_ROW(pfk_pacid IN NUMBER, pfk_talonid IN NUMBER, pfk_peplid IN NUMBER, pfk_companyid IN NUMBER, pfp_poly IN NUMBER);
  PROCEDURE CLEAR_LAST_TABLE;
  PROCEDURE CLEAR_MOVE_TABLE;
  PROCEDURE CLEAR_MOVE_BED_TABLE;
  PROCEDURE FILL_TOOTH_TABLE(pfk_nazid IN NUMBER);
  FUNCTION GET_SEGMENT(pfk_nazid IN NUMBER, pfn_num IN NUMBER) RETURN NUMBER;
  FUNCTION GET_ZUBNUM(pfk_nazid IN NUMBER, pfn_num IN NUMBER) RETURN NUMBER;
  FUNCTION GET_POVERHN(pfk_nazid IN NUMBER, pfn_num IN NUMBER) RETURN VARCHAR2;

  function GET_COLUMN_CHAR_LEN(aOWNER IN VARCHAR2, aTABLE IN VARCHAR2, aCOLUMN IN VARCHAR2) RETURN NUMBER;

  procedure FILL_TABLE_ROWS;
  procedure FILL_USL;
  procedure FILL_OPER;

  procedure Calculate(pBeg DATE, pEnd DATE);
--  procedure SetCalculateParams(pBeg DATE, pEnd DATE);
--  procedure CalculateByParams;

  procedure UploadLPU;
  procedure UploadUSL(pID IN NUMBER, pID_ILL IN NUMBER);
  procedure UploadOper(pID IN NUMBER, pID_ILL IN NUMBER);
  procedure UploadMove(pID IN NUMBER, pID_ILL IN NUMBER);
  procedure UploadMoveBed(pID IN NUMBER, pID_ILL IN NUMBER);
  procedure UploadToMIC;

  -- по умолчанию рассчитывает и выгружает данные за вчерашний день
  procedure CalculateAndUploadToMIC(pBeg DATE default sysdate - 1, pEnd DATE default sysdate - 1);

END pkg_exch_upload_master;
/

SHOW ERRORS;


