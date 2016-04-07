DROP FUNCTION ASU.GET_FORMULA_RESULT
/

--
-- GET_FORMULA_RESULT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   T_ECONOM_INFORM (Table)
--   TS_ECONOM_INDICES (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_formula_result(pFormula in varchar2, pSum in number) return number is
  cursor cVal is
    select eid.fk_id, eif.fn_value, eid.fc_name
      from buh.ts_econom_indices eid, buh.t_econom_inform eif
     where eif.fk_econ_equal = eid.fk_equalid;
  sFormula varchar2(32767);
  nRes number;
begin
  nRes:=pSum;

  if pFormula is not null then
    sFormula:=lower(pFormula);
    sFormula:=replace(sFormula, 'x', to_char(pSum));
    for C in cVal loop
      sFormula:=replace(sFormula, '['||to_char(C.FC_NAME)||':'||to_char(C.fk_id)||']', to_char(C.fn_value));
    end loop;
    sFormula:='select '||sFormula||' from dual';
    execute immediate sFormula into nRes;
  end if;

  return(nRes);

  exception
    when others then return(0);
end get_formula_result;
/

SHOW ERRORS;


