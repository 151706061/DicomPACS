DROP FUNCTION ASU.GET_FULLPATH_SHA_BIO
/

--
-- GET_FULLPATH_SHA_BIO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   GET_ANALBIOHIM (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_FULLPATH_SHA_BIO" (id IN NUMBER)
  RETURN VARCHAR2
IS
  sName   tsmid.fc_name%type;
  rn      NUMBER;
  rl      NUMBER;
  sRes    VARCHAR2(4000);
  pSmidID NUMBER;
  CURSOR c1
  IS
    SELECT fc_name, ROWNUM, fl_showprint
      FROM (SELECT fk_id, fc_name, fl_showprint, fk_owner
              FROM tsmid
             START WITH fk_id = id
             CONNECT BY PRIOR fk_owner = fk_id)
     WHERE fk_owner <> 0
     ORDER BY ROWNUM desc;
  CURSOR c2 IS SELECT FK_OWNER FROM TSMID WHERE FK_ID = id;
BEGIN
  OPEN c2;
  FETCH c2 INTO pSmidID;
  CLOSE c2;

  IF pSmidID = GET_ANALBIOHIM THEN
    RETURN 'Общая биохимия';
  END IF;

  sRes := '';
  OPEN c1;
  FETCH c1 INTO sName, rn, rl;
  IF c1%FOUND and rl=1 THEN
    sRes := sRes || sName || ':';
  END IF;
  LOOP
    FETCH c1 INTO sName, rn,rl;
    EXIT WHEN c1%NOTFOUND;
    if rl=1 then
       sRes := sRes || ' ' || sName;
    end if;
  END LOOP;
  CLOSE c1;
  IF SUBSTR (sRes, LENGTH (sRes), 1) = ':' THEN
    sRes := SUBSTR (sRes, 1, LENGTH (sRes) - 1);
  END IF;
  RETURN sRes;
END;
/

SHOW ERRORS;


