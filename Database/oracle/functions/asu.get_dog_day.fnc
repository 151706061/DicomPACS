DROP FUNCTION ASU.GET_DOG_DAY
/

--
-- GET_DOG_DAY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_PACDAYS (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_DOG_DAY" ( pfk_dogid IN number)
  RETURN  number IS
cursor cGetDays is select /*+rule*/
  sum(get_pacdays(TKARTA.fk_id))
 from   TKARTA
 where (TKARTA.FK_KOD2=2) and (TKARTA.FK_KOD=pfk_dogid);

 nDays number;
BEGIN
 open cGetDays;
 fetch cGetDays into nDays;
 close cGetDays;
 return nvl(nDays,0);
END;
/

SHOW ERRORS;


