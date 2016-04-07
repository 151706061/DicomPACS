DROP FUNCTION ASU.DO_GETEDITID
/

--
-- DO_GETEDITID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."DO_GETEDITID" (PID IN NUMBER)
  RETURN NUMBER
IS
  CURSOR c1
  IS
    SELECT LEVEL, fk_id, fc_type
      FROM tsmid
     START WITH fk_id = PID
     CONNECT BY PRIOR fk_owner = fk_id;

  lev     NUMBER;
  id      NUMBER;
  stype   VARCHAR2(100);
BEGIN
  OPEN c1;
  LOOP
    FETCH c1 INTO lev, id, stype;
    IF     (lev <> 1)
       AND (  (stype = 'VARCHAR2')
           OR (sType = 'NUMBER')) THEN
      RETURN (id);
    END IF;
    EXIT WHEN (c1%NOTFOUND);
  END LOOP;
  RETURN (-1);
END;
/

SHOW ERRORS;


