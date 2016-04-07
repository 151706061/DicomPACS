DROP FUNCTION ASU.GET_ORDER
/

--
-- GET_ORDER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_ORDER" 
  ( pFK_ID IN NUMBER)
  RETURN  NUMBER IS
--
-- Purpose: Returns FN_ORDER OF FK_ID's plus FN_ORDER OF FK_OWNER
--
-- Wrote by Philip A. Milovanov
CURSOR c (pID NUMBER) IS
  select sum(fN_order) from tsmid start with fk_id=pID connect by prior fk_owner=fk_id;
--select fN_order from tsmid start with fk_id=pID connect by prior fk_owner=fk_id;
--SELECT T1.FN_ORDER+T2.FN_ORDER FROM TSMID T1,TSMID T2 WHERE T1.FK_ID=pID AND T2.FK_ID=T1.FK_OWNER;
i NUMBER;
BEGIN
  OPEN c(pFK_ID);
  FETCH c INTO i;
  CLOSE c;
  RETURN i;
END; -- Function GET_ORDER
/

SHOW ERRORS;


