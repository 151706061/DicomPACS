DROP FUNCTION ASU.GET_FULLPATH_WITH_OWNER
/

--
-- GET_FULLPATH_WITH_OWNER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_FULLPATH_WITH_OWNER" (id IN NUMBER)
  RETURN VARCHAR2
IS
  sName   tsmid.fc_name%type;
  rn      NUMBER;
  sRes    VARCHAR2(4000);

  CURSOR c1
  IS
    SELECT fc_name, ROWNUM
      FROM (SELECT fk_id, fc_name, fk_owner
              FROM tsmid
             START WITH fk_id = id
             CONNECT BY PRIOR fk_owner = fk_id)
     ORDER BY ROWNUM desc;
BEGIN
  sRes := '';
  OPEN c1;
  FETCH c1 INTO sName, rn;
  IF c1%FOUND THEN
    sRes := sRes || sName || ':';
  END IF;
  LOOP
    FETCH c1 INTO sName, rn;
    EXIT WHEN c1%NOTFOUND;
    sRes := sRes || ' ' || sName;
  END LOOP;
  CLOSE c1;
  IF SUBSTR (sRes, LENGTH (sRes), 1) = ':' THEN
    sRes := SUBSTR (sRes, 1, LENGTH (sRes) - 1);
  END IF;
  RETURN sRes;
END;
/

SHOW ERRORS;


