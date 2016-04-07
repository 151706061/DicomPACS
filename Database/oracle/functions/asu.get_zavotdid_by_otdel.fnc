DROP FUNCTION ASU.GET_ZAVOTDID_BY_OTDEL
/

--
-- GET_ZAVOTDID_BY_OTDEL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSOTR (Synonym)
--   GET_ZAVOTDSPECID (Function)
--   GET_ZAV_OTDEL_FUNCT_VID (Function)
--
CREATE OR REPLACE FUNCTION ASU.GET_ZAVOTDID_BY_OTDEL(pOtdelid IN NUMBER)
  --возвращает по коду отделения его зав отделением
  --created by Marriage at 11.03.2012
  RETURN number
IS
  res   number := -1;

  CURSOR cOld
  IS
    SELECT nvl(fk_id,-1) fk_id  FROM tsotr  WHERE fk_otdelid = pOtdelid AND fk_spravid = GET_ZAVOTDSPECID and TSotr.FL_DEL = 0;

  CURSOR cNew
  IS
    SELECT nvl(fk_id,-1) fk_id  FROM tsotr  WHERE fk_otdelid = pOtdelid AND TSotr.Fl_Zav_Otd = 1 and TSotr.FL_DEL = 0;

BEGIN
  if GET_ZAV_OTDEL_FUNCT_VID = 0 then
   OPEN cOld;
   FETCH cOld into res;
   CLOSE cOld;
  else
   OPEN cNew;
   FETCH cNew into res;
   CLOSE cNew;
  end if;
  return res;
END;
/

SHOW ERRORS;


