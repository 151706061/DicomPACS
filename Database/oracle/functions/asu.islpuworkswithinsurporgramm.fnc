DROP FUNCTION ASU.ISLPUWORKSWITHINSURPORGRAMM
/

--
-- ISLPUWORKSWITHINSURPORGRAMM  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMINI (Table)
--
CREATE OR REPLACE FUNCTION ASU."ISLPUWORKSWITHINSURPORGRAMM" return NUMBER
is --работает ЛПУ со страховыми программами
   --by A.Nakorjakov 280808
  v_value ASU.TSMINI.FC_VALUE%TYPE;
  v_res NUMBER;
begin
  select nvl(max(fc_value),'0') into v_value
  from asu.tsmini s where s.fc_section = 'INSUR_PROGRAMM' and s.fc_key = 'WORKS_INSUR_PROGRAMM';
  if v_value = '0' then
    v_res := 0;
  else
    v_res := 1;
  end if;
  return v_res;
end;
/

SHOW ERRORS;


