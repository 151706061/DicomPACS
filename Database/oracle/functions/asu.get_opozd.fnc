DROP FUNCTION ASU.GET_OPOZD
/

--
-- GET_OPOZD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_PLANZAEZD (Function)
--   DO_PRYBDATE (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_OPOZD" 
(pacid in number)
return number
is
res number;
begin
  res:=do_prybdate(pacid)-get_planzaezd(pacid);
  if res<0 then
    res:=0;
  end if;
  return res;
end;
/

SHOW ERRORS;


