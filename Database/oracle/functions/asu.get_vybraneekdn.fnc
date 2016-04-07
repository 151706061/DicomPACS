DROP FUNCTION ASU.GET_VYBRANEEKDN
/

--
-- GET_VYBRANEEKDN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   GET_PLANVYB (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_VYBRANEEKDN" 
  ( dat in date)
  RETURN  number IS
 cursor c1 is select sum(fn_kol) as r from tsroky where fk_pryb=3 and fd_data1=dat and get_planvyb(fk_pacid)>fd_data1;
 res number;
BEGIN
  open c1;
  fetch c1 into res;
  if res is null then
    res:=0;
   end if;
  return res;
END;
/

SHOW ERRORS;


