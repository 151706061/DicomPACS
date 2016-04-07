DROP FUNCTION ASU.GET_PACROJD
/

--
-- GET_PACROJD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TAMBULANCE (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACROJD" 
  ( pFK_ID IN NUMBER)
  RETURN  DATE IS
CURSOR c(pID NUMBER) IS SELECT FD_ROJD FROM TKARTA WHERE FK_ID=pID
                       UNION SELECT FD_ROJD FROM TAMBULANCE WHERE FK_ID=pID;
d DATE;
BEGIN
  OPEN c(pFK_ID);
  FETCH c INTO d;
  CLOSE c;
  RETURN d;
END; -- Function GET_PACROJD
/

SHOW ERRORS;

