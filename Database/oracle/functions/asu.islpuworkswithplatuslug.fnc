DROP FUNCTION ASU.ISLPUWORKSWITHPLATUSLUG
/

--
-- ISLPUWORKSWITHPLATUSLUG  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMINI (Table)
--
CREATE OR REPLACE FUNCTION ASU."ISLPUWORKSWITHPLATUSLUG" return NUMBER
is --работает ЛПУ с платными услугами
   --by A.Nakorjakov 280808
  v_value ASU.TSMINI.FC_VALUE%TYPE;
  v_res NUMBER;
begin
  select nvl(max(fc_value),'0') into v_value
  from asu.tsmini s where s.fc_section = 'PLAT_USLUG' and s.fc_key = 'WORKS_PLAT_USLUG';
  if v_value = '0' then
    v_res := 0;
  else
    v_res := 1;
  end if;
  return v_res;
end;
/

SHOW ERRORS;


