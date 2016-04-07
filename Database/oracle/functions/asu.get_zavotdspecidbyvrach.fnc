DROP FUNCTION ASU.GET_ZAVOTDSPECIDBYVRACH
/

--
-- GET_ZAVOTDSPECIDBYVRACH  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPASS (Table)
--   GET_ZAVOTDSPECID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_ZAVOTDSPECIDBYVRACH" (vrachid IN NUMBER)
  --возвращает по коду врача его зав отделением

  RETURN number
IS
  res   number;

  CURSOR c1
  IS
    SELECT   /*+rule*/DISTINCT fk_specid
      FROM tpass
     WHERE fk_sotrid=vrachid
     and fk_specid=asu.get_zavotdspecid;

BEGIN
  OPEN c1;
  FETCH c1 INTO res;
  CLOSE c1;
  RETURN nvl(res,0);
END;
/

SHOW ERRORS;


