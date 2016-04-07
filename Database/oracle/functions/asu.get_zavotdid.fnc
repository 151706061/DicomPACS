DROP FUNCTION ASU.GET_ZAVOTDID
/

--
-- GET_ZAVOTDID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSOTR (Synonym)
--
CREATE OR REPLACE FUNCTION ASU."GET_ZAVOTDID" (vrachid IN NUMBER)
  --возвращает по коду врача его зав отделением

  RETURN number
IS
  res   number;

  CURSOR c1
  IS
    SELECT DISTINCT tsotr.fk_id
      FROM  tsotr, (SELECT fk_otdid
                               FROM tsotr
                              WHERE fk_id = vrachid) t1
     WHERE tsotr.fk_otdid =t1.fk_otdid
       --AND tsotr.fk_spravid = GET_ZAVOTDSPECID
       AND tsotr.fl_zav_otd = 1 -- New algoritm
       and tsotr.fl_del = 0;
BEGIN
  OPEN c1;
  FETCH c1 INTO res;
  if c1%notfound then
    res:=-1;
  end if;
  CLOSE c1;
  RETURN res;
END;
/

SHOW ERRORS;


DROP SYNONYM STAT.GET_ZAVOTDID
/

--
-- GET_ZAVOTDID  (Synonym) 
--
--  Dependencies: 
--   GET_ZAVOTDID (Function)
--
CREATE SYNONYM STAT.GET_ZAVOTDID FOR ASU.GET_ZAVOTDID
/


