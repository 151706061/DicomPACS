DROP FUNCTION ASU.GET_HEAL_COST
/

--
-- GET_HEAL_COST  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   THEAL_SMID (Table)
--   PKG_PLATUSLUG (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_HEAL_COST" (pSmid in  NUMBER) return number is

  v_healid NUMBER;
  v_cost   NUMBER;
BEGIN

 v_cost := 0;

 SELECT nvl(max(fk_heal), 0) into v_healid FROM ASU.THEAL_SMID WHERE FK_SMID = pSmid;
 SELECT PKG_PLATUSLUG.GET_USLUG_COST(v_healid) into v_cost FROM dual;

 RETURN v_cost;

end Get_Heal_Cost;
/

SHOW ERRORS;


