DROP FUNCTION ASU.GET_SMIDFROMNAZ
/

--
-- GET_SMIDFROMNAZ  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAN (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SMIDFROMNAZ" (pFK_ID IN BINARY_INTEGER) RETURN BINARY_INTEGER IS
  --
  -- Purpose: получение кода СМИД по коду назначения
  --
  -- mod by TimurLan 20/07/06
  CURSOR c IS
    SELECT /*+ first_row*/FK_SMID FROM TNAZAN WHERE FK_ID = pFK_ID;
  i BINARY_INTEGER;
BEGIN
  OPEN c;
  FETCH c INTO i;
  CLOSE c;
  RETURN i;
END;
/

SHOW ERRORS;


