DROP FUNCTION ASU.GET_COUNT_CONS
/

--
-- GET_COUNT_CONS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZKONS (Table)
--   GET_VIPNAZ (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_CONS" (pfk_pacid IN NUMBER) RETURN NUMBER IS

   -- created by Serg
   -- updated 20080410 by Linnikov

 CURSOR c
 IS
 SELECT COUNT(K.FK_ID)
        FROM TNAZKONS K
        WHERE K.FK_NAZSOSID = GET_VIPNAZ
        AND K.FK_PACID = pfk_pacid;

 D NUMBER;

 BEGIN
  OPEN C;
  FETCH C INTO D;
  CLOSE C;
  RETURN D;
 END;
/

SHOW ERRORS;


