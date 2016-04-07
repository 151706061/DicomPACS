DROP FUNCTION ASU.GET_PACAGEONVYB
/

--
-- GET_PACAGEONVYB  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPERESEL (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACAGEONVYB" (pFK_PACID IN NUMBER)
  RETURN NUMBER
--  deterministic
IS
-- Purpose: возвращает возраст пациента на момент выписки
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Sam      Create
  res   NUMBER;

  CURSOR c1
  IS
    SELECT (MONTHS_BETWEEN (fd_data2, fd_rojd) / 12) AS fn_age
      FROM tkarta, tperesel
     WHERE tkarta.fk_id = pFK_PACID
       AND tperesel.fk_id = (SELECT max (fk_id)
                               FROM tperesel
                              WHERE fk_pacid = tkarta.fk_id);
BEGIN
  OPEN c1;
  FETCH c1 INTO res;
  CLOSE c1;
  IF res IS NULL THEN
    res  := -1;
  END IF;
  RETURN res;
END;-- Function GET_PACAGEONVYB
/

SHOW ERRORS;


DROP SYNONYM STAT.GET_PACAGEONVYB
/

--
-- GET_PACAGEONVYB  (Synonym) 
--
--  Dependencies: 
--   GET_PACAGEONVYB (Function)
--
CREATE SYNONYM STAT.GET_PACAGEONVYB FOR ASU.GET_PACAGEONVYB
/


