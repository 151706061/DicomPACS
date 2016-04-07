DROP FUNCTION ASU.IS_AMBULANCE
/

--
-- IS_AMBULANCE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TAMBULANCE (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_AMBULANCE" 
  ( pFK_ID IN NUMBER)
  RETURN  NUMBER IS
--
-- Purpose:
--
-- MODIFICATION HISTORY
-- Person      		Date    Comments
-- ---------   		------  -------------------------------------------
-- Philip A. Milovanov
CURSOR c IS SELECT /*+first_row*/FK_ID FROM TKARTA WHERE FK_ID=pFK_ID;
CURSOR c1 IS SELECT /*+first_row*/FK_ID FROM TAMBULANCE WHERE FK_ID=pFK_ID;
i NUMBER;
BEGIN
  OPEN C;
  FETCH C INTO i;
  CLOSE C;
  IF i is not null then
    return 0;
  end if;
  OPEN C1;
  FETCH C1 INTO i;
  CLOSE C1;
  IF I is not null  then
    return 1;
  end if;

  RETURN -1;
END;
/

SHOW ERRORS;


