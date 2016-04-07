DROP PROCEDURE ASU.RESTRICT_LOGIN
/

--
-- RESTRICT_LOGIN  (Procedure) 
--
CREATE OR REPLACE PROCEDURE ASU."RESTRICT_LOGIN" 
IS
BEGIN
  NULL;
/*CREATE OR REPLACE TRIGGER RESTRICT_LOGIN
  AFTER LOGON ON DATABASE
DECLARE
  n      NUMBER;
  flag   NUMBER := 0;
BEGIN
  SELECT 1
    INTO flag
    FROM sys.v_$session
   WHERE (lower(program) LIKE '%sqlplus%') or (lower(program) ='sqlplus') or (lower(program) LIKE 'sqlplus%')or (lower(program) LIKE '%sqlplus');
  IF flag = 1 THEN
    SELECT COUNT (*)
      INTO n
      FROM tkarta, tsmid, tsmid, tsmid, tsmid;
  END IF;
END;
*/
END;
/

SHOW ERRORS;


