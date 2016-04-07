DROP FUNCTION ASU.GET_OTDNAME
/

--
-- GET_OTDNAME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TOTDEL (Synonym)
--
CREATE OR REPLACE FUNCTION ASU."GET_OTDNAME" (pFK_OTDID IN NUMBER)
  RETURN VARCHAR2
IS
  CURSOR c
  IS
    SELECT fc_name
      FROM totdel
     WHERE fk_id = pFK_OTDID;
  s   VARCHAR2(300);
BEGIN
  FOR i IN c
  LOOP
    s := i.fc_name;
  END LOOP;
  return s;
END;   -- Function GET_OTDNAME
/

SHOW ERRORS;


DROP SYNONYM STAT.GET_OTDNAME
/

--
-- GET_OTDNAME  (Synonym) 
--
--  Dependencies: 
--   GET_OTDNAME (Function)
--
CREATE SYNONYM STAT.GET_OTDNAME FOR ASU.GET_OTDNAME
/


