DROP FUNCTION ASU.GET_OPOZDKDN
/

--
-- GET_OPOZDKDN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   GET_PLANZAEZD (Function)
--   DO_PRYBDATE (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_OPOZDKDN" 
  ( dat in date)
  RETURN  number IS
 cursor c1 is select sum(do_prybdate(fk_pacid)-get_planzaezd(fk_pacid)) as r from tsroky where fk_pryb=2 and fd_data1=dat and do_prybdate(fk_pacid)>get_planzaezd(fk_pacid);
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


