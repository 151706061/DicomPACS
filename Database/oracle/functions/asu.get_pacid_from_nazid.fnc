DROP FUNCTION ASU.GET_PACID_FROM_NAZID
/

--
-- GET_PACID_FROM_NAZID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAN (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACID_FROM_NAZID" (pFK_ID IN BINARY_INTEGER)
  RETURN BINARY_INTEGER IS
  --
  -- Purpose: ¬озращает код пациента из кода назначени€
  -- By Philip A. Milovanov
  -- mod by TimurLan 20/07/06
  CURSOR c IS
    SELECT /*+ first_rows*/FK_PACID FROM TNAZAN WHERE FK_ID = pFK_ID;
  n BINARY_INTEGER;
BEGIN
  OPEN c;
  FETCH c INTO n;
  CLOSE c;
  RETURN n;
END;
/

SHOW ERRORS;


