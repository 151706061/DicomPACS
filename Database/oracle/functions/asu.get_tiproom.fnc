DROP FUNCTION ASU.GET_TIPROOM
/

--
-- GET_TIPROOM  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TTIPROOM (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_TIPROOM" (pFK_ID IN NUMBER)
  RETURN VARCHAR2
IS
  sTmp   ttiproom.fc_vid%TYPE;

  CURSOR c
  IS
    SELECT fc_vid
      FROM ttiproom
     WHERE fk_id = pFK_ID;
BEGIN
  OPEN c;
  FETCH c INTO sTmp;
  CLOSE c;
  RETURN sTmp;
END;                                                                                                                                                         -- Function GET_PUTTYPE
/

SHOW ERRORS;


