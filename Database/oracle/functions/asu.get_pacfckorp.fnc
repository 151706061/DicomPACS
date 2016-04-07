DROP FUNCTION ASU.GET_PACFCKORP
/

--
-- GET_PACFCKORP  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TROOM (Table)
--   GET_PACPALATAID (Function)
--   TKORP (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACFCKORP" -- Created by TimurLan for PKG_REGIST_REPORTS
  ( pFK_ID IN NUMBER)
  RETURN  VARCHAR2 IS
  dTemp VARCHAR2(40);
  CURSOR cTemp IS SELECT tkorp.fc_name
                    FROM tkorp, troom
                   WHERE tkorp.fk_id = troom.fk_korpid
                     AND troom.fk_id = (GET_PACPALATAID(pFK_ID));
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO dTemp;
  CLOSE cTemp;
  RETURN dTemp;
END;
/

SHOW ERRORS;


