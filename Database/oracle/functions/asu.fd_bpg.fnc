DROP FUNCTION ASU.FD_BPG
/

--
-- FD_BPG  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."FD_BPG" 
  RETURN NUMBER
  IS --by aAdmin.exe
BEGIN
  Return 25509;
END;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.FD_BPG TO PUBLIC
/
