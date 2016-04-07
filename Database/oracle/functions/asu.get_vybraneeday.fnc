DROP FUNCTION ASU.GET_VYBRANEEDAY
/

--
-- GET_VYBRANEEDAY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_PLANVYB (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_VYBRANEEDAY" 
(pacid in number)
return number
is
res number;
begin
  res:=get_planvyb(pacid)-get_planvyb(pacid);
  if res<0 then
    res:=0;
  end if;
  return res;
end;
/

SHOW ERRORS;


