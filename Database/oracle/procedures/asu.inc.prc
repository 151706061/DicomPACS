DROP PROCEDURE ASU.INC
/

--
-- INC  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PROCEDURE ASU."INC" 
   ( n in out number)
   IS
BEGIN
  n:=n+1;
  return;
END; -- Procedure INC
/

SHOW ERRORS;


