DROP FUNCTION ASU.GET_COUNT_OUT
/

--
-- GET_COUNT_OUT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_OUT" (pFD_DATAC IN DATE) -- Modified by TimurLan
  RETURN NUMBER IS
  Cursor c IS select /* + rule */count(fk_id) from tsroky where
--                   fd_data1=pFD_DATAC and fk_pryb=3;
                   TRUNC(fd_data1) = pFD_DATAC and fk_pryb=3;
  i NUMBER;
BEGIN
 OPEN c;
 FETCH c INTO i;
 CLOSE c;
 RETURN i;
END;
/

SHOW ERRORS;


