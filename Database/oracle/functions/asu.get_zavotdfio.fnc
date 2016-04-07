DROP FUNCTION ASU.GET_ZAVOTDFIO
/

--
-- GET_ZAVOTDFIO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSOTR (Table)
--   DO_VRACHFIO (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_ZAVOTDFIO" (vrachid IN NUMBER)
   --возвращает по коду врача его зав отделением
RETURN VARCHAR2
IS
   res   VARCHAR2 (500);

   CURSOR c1
   IS
     /* SELECT DISTINCT do_vrachfio (fk_sotrid)
                 FROM tpass, tsotr
                WHERE tsotr.fk_otdid = (SELECT fk_otdid
                                          FROM tsotr
                                         WHERE fk_id = vrachid)
                  AND tpass.fk_sotrid = tsotr.fk_id
                  AND fk_specid = get_zavotdspecid;*/
     select do_vrachfio (fk_id) from login.tsotr
      where fl_zav_otd =1
        and fk_otdelid in (select nvl(max(fk_otdelid),-1) from login.tsotr where fk_id = vrachid);

BEGIN
   OPEN c1;

   FETCH c1
    INTO res;

   CLOSE c1;

   RETURN res;
END;
/

SHOW ERRORS;


