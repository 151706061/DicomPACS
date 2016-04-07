DROP FUNCTION ASU.GET_PLANZAEZD
/

--
-- GET_PLANZAEZD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PLANZAEZD" 
  ( pacid in number )
  RETURN  date IS

 cursor c1 is select fd_data1 from tsroky where fk_pacid=pacid and fk_pryb=1;
 res date;
BEGIN
  open c1;
  fetch c1 into res;
  close c1;
  return res;
END;
/

SHOW ERRORS;


