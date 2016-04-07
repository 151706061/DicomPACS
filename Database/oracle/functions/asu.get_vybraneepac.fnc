DROP FUNCTION ASU.GET_VYBRANEEPAC
/

--
-- GET_VYBRANEEPAC  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   GET_PLANVYB (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_VYBRANEEPAC" 
  ( dat in date)
  RETURN  number IS
 cursor c1 is select count(fk_pacid) as r from tsroky where fk_pryb=3 and fd_data1=dat  and get_planvyb(fk_pacid)>fd_data1;
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


