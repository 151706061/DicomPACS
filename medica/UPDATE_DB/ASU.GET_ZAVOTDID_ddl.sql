-- Start of DDL Script for Function ASU.GET_ZAVOTDID
-- Generated 11.01.08 9:30:27 from ASU@ASU

CREATE OR REPLACE 
FUNCTION asu.get_zavotdid (vrachid IN NUMBER)
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
       AND tsotr.fk_spravid = GET_ZAVOTDSPECID;
/*    SELECT   DISTINCT fk_sotrid
      FROM tpass, tsotr
     WHERE tsotr.fk_otdid = (SELECT fk_otdid
                               FROM tsotr
                              WHERE fk_id = vrachid)
       AND tpass.fk_sotrid = tsotr.fk_id
       AND fk_specid = GET_ZAVOTDSPECID;*/
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



-- End of DDL Script for Function ASU.GET_ZAVOTDID

