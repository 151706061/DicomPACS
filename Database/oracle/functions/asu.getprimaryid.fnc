DROP FUNCTION ASU.GETPRIMARYID
/

--
-- GETPRIMARYID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GETPRIMARYID" (ID IN NUMBER, Name IN VARCHAR2)
  RETURN NUMBER
IS
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
  CurOwnerId   NUMBER(15,0);
  CurId        NUMBER(15,0);
  MainId       NUMBER(15,0);

  CURSOR c1
  IS
    SELECT fk_id, fk_owner
      FROM tsmid
     START WITH fk_id = id
     CONNECT BY PRIOR fk_owner = fk_id;

  CURSOR c2
  IS
    SELECT fk_id
      FROM tsmid
     WHERE fc_name = name;
-- Declare program variables as shown above

BEGIN
  OPEN c1;
  OPEN c2;
--    if not c2%found then
  FETCH c2 INTO MainId;
--    else
---      close c1;
--      close c2;
--      raise_application_error(-20000, '?????? ??????????? ??? ?????? ???????? ? GetPrimary: '||Name);
--      return -1;
--    end if;
  LOOP
    FETCH c1 INTO CurId, CurOwnerID;
    IF MainId = CurOwnerID THEN
      CLOSE c1;
      CLOSE c2;
      RETURN CurId;
    END IF;
    EXIT WHEN c1%NOTFOUND;
  END LOOP;
  CLOSE c1;
  CLOSE c2;
--    raise_application_error(-20000, '?????? ??????????? ??? ?????? ??????? ???????  ? GetPrimary:'||Name);
  RETURN -1;
END;
/

SHOW ERRORS;


