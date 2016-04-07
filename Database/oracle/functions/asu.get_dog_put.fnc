DROP FUNCTION ASU.GET_DOG_PUT
/

--
-- GET_DOG_PUT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_DOG_PUT" ( pfk_dogid IN number)
  RETURN  number IS
cursor cGetPuts is select /*+rule*/
  count(*)
 from   TKARTA
 where (TKARTA.FK_KOD2=2) and (TKARTA.FK_KOD=pfk_dogid);
 nPut number;
BEGIN
 open cGetPuts ;
 fetch cGetPuts  into nPut;
 close cGetPuts ;
 return nvl(nPut,0);
END;
/

SHOW ERRORS;


