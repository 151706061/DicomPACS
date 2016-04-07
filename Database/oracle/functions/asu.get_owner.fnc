DROP FUNCTION ASU.GET_OWNER
/

--
-- GET_OWNER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_OWNER" 
  ( nID IN NUMBER)
  RETURN  NUMBER IS
--
-- Получение онера для лаборатории
--
  CURSOR c1(id NUMBER) IS
    SELECT/*+rule*/ FK_ID
      FROM tsmid
     WHERE FL_SHOWANAL in (1,2,3)and FK_ID<>id
     START WITH fk_id = id
    CONNECT BY PRIOR fk_owner = fk_id
     ORDER BY ROWNUM;
  res NUMBER;
BEGIN
  OPEN c1(nID);
  FETCH c1 INTO res;
  RETURN res;
  CLOSE c1;
END;
/

SHOW ERRORS;


