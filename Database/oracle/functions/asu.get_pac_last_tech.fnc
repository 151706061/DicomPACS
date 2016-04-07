DROP FUNCTION ASU.GET_PAC_LAST_TECH
/

--
-- GET_PAC_LAST_TECH  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TTECHBOLEZNI (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PAC_LAST_TECH" 
  ( pFK_ID IN NUMBER)
  RETURN  DATE IS
  CURSOR c(pID NUMBER) IS select max(fd_date) from ttechbolezni where fk_pacid=pID;
  d DATE;
BEGIN
  OPEN c(pFK_ID);
  FETCH c INTO d;
  CLOSE c;
  RETURN d;
END; -- Function GET_PAC_LAST_TECH
/

SHOW ERRORS;


