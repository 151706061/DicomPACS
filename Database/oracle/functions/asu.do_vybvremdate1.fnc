DROP FUNCTION ASU.DO_VYBVREMDATE1
/

--
-- DO_VYBVREMDATE1  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE FUNCTION ASU."DO_VYBVREMDATE1" 
  ( pacid IN integer)
  RETURN  date IS
 cursor c1 is select fd_data1 from tsroky where fk_pryb=7 and fk_pacid=pacid;
 d date;
BEGIN
  open c1;
--  if not c1%notfound then
     fetch c1 into d;
--  end if;
  close c1;
  return(d);
END;
/

SHOW ERRORS;


