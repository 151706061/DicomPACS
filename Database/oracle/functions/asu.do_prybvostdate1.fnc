DROP FUNCTION ASU.DO_PRYBVOSTDATE1
/

--
-- DO_PRYBVOSTDATE1  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE FUNCTION ASU."DO_PRYBVOSTDATE1" 
  ( pacid IN integer)
  RETURN  date IS
 cursor c1 is select fd_data1 from tsroky where fk_pryb=4 and fk_pacid=pacid;
 d date;
BEGIN
  open c1;
  fetch c1 into d;
  close c1;
  return(d);
END;
/

SHOW ERRORS;


