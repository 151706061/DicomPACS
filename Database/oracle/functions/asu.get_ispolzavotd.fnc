DROP FUNCTION ASU.GET_ISPOLZAVOTD
/

--
-- GET_ISPOLZAVOTD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   GET_PACVRACH (Function)
--   GET_ZAVOTDID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_ISPOLZAVOTD" (fk_smid IN NUMBER, fk_pacid IN NUMBER)
  RETURN NUMBER
IS
--
-- Purpose: ¬озвращает исполнител€ назначени€ "конс. зав. отделением"
--          если это не оно то возвращаетс€ -1
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
  CURSOR cSmId (pFK_SMID IN NUMBER)
  IS
    SELECT fc_synonim
      FROM tsmid
     WHERE fk_id = pFK_SMID;
  sSyn   VARCHAR2(255);
  nRes   NUMBER;
BEGIN
  OPEN cSMID (fk_smid);
  FETCH cSMID INTO sSyn;
  CLOSE cSmID;
  nRes:=-1;
  IF sSyn = 'KONS_ZAVOTD' THEN
    nRes := get_zavotdid (get_pacvrach (fk_pacid));
  END IF;
  RETURN nRes;
END;   -- Function GET_ISPOLZAVOTD
/

SHOW ERRORS;


