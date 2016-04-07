DROP FUNCTION ASU.GET_COUNT_OUT_KORP_FLOOR
/

--
-- GET_COUNT_OUT_KORP_FLOOR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TROOM (Table)
--   TPERESEL (Table)
--   GET_MAXPERESELID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_OUT_KORP_FLOOR" (pFD_DATAC IN DATE, pfk_korpid IN NUMBER, pfn_floor IN NUMBER)
  RETURN NUMBER
IS
  CURSOR c
  IS
    SELECT/* + rule */
       COUNT (tperesel.fk_id)
      FROM tperesel, troom
     WHERE TRUNC(fd_data2) = pFD_DATAC-- Modified by TimurLan
       AND tperesel.fk_id = get_maxpereselid (fk_pacid)
       AND troom.fk_korpid = pFK_KORPID
       AND fn_floor = pfn_floor
       AND tperesel.fk_palataid = troom.fk_id;
  i   NUMBER;
BEGIN
  OPEN c;
  FETCH c INTO i;
  CLOSE c;
  RETURN i;
END;
/

SHOW ERRORS;


