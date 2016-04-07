DROP FUNCTION ASU.GET_ROOTID
/

--
-- GET_ROOTID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_ROOTID" (id IN NUMBER)
  RETURN NUMBER
  deterministic
IS
  CURSOR c1
  IS
    SELECT   /*+rule*/fk_id
      FROM tsmid
     START WITH fk_id = id
     CONNECT BY PRIOR fk_owner = fk_id
     ORDER BY ROWNUM desc;

  res   NUMBER;
BEGIN
  OPEN c1;
  FETCH c1 INTO res;
  RETURN res;
  CLOSE c1;
/*  EXCEPTION
    WHEN OTHERS THEN
      raise_application_error(-20003,'tsmid.FK_ID = '||id);*/
END;
/

SHOW ERRORS;


