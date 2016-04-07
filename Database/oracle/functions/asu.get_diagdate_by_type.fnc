DROP FUNCTION ASU.GET_DIAGDATE_BY_TYPE
/

--
-- GET_DIAGDATE_BY_TYPE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   TSMID (Table)
--   PKG_STATUTIL (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_DIAGDATE_BY_TYPE" (pfk_pacid IN NUMBER, ptype IN VARCHAR2, pvid IN VARCHAR2) RETURN DATE IS
-- Created 20060921 by Serg
-- Функция возвращает дату постановки диагноза
CURSOR c
IS
  SELECT D.FD_DATE
         FROM TSMID,
              TDIAG D
         WHERE D.FK_PACID = pfk_pacid
         AND D.FK_SMDIAGID = TSMID.FK_ID
         AND D.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID(ptype)
         AND D.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID(pvid);
 D DATE;

BEGIN
 OPEN C;
  FETCH C INTO D;
 CLOSE C;
 RETURN D;
END;
/

SHOW ERRORS;


