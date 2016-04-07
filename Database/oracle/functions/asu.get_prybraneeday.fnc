DROP FUNCTION ASU.GET_PRYBRANEEDAY
/

--
-- GET_PRYBRANEEDAY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_PLANZAEZD (Function)
--   DO_VYBDATE (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_PRYBRANEEDAY" 
(pacid in number)
return number
is
res number;
begin
  res:=get_planzaezd(pacid)-do_vybdate(pacid);
  if res<0 or res is null then
    res:=0;
  end if;
  return res;
end;
/

SHOW ERRORS;


