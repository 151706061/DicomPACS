DROP FUNCTION ASU.GET_DOG_SUM
/

--
-- GET_DOG_SUM  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_DOG_SUM" ( pfk_dogid IN number)
  RETURN  number IS
cursor cGetDays is select /*+rule*/
  sum(nvl(TKARTA.fn_sum,0))
 from   TKARTA
 where (TKARTA.FK_KOD2=2) and (TKARTA.FK_KOD=pfk_dogid);

 nSum number;
BEGIN
 open cGetDays;
 fetch cGetDays into nSum;
 close cGetDays;
 return nvl(nSum,0);
END;
/

SHOW ERRORS;


