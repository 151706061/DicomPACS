DROP FUNCTION ASU.GET_NAZ_KOL_VO
/

--
-- GET_NAZ_KOL_VO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_NAZ_KOL_VO (aNazID IN NUMBER, aSmid IN NUMBER) RETURN NUMBER IS
  vResult NUMBER;
begin
  select nvl(Max(ti.fn_num), 0)
    into vResult
    from (select ts.fk_id
            from asu.tsmid ts
           where ts.fc_synonim = 'KOL_VO'
          connect by prior ts.fk_id = ts.fk_owner
           start with ts.fk_id = aSmid) ts
   inner join asu.tib ti on ti.fk_smeditid = ts.fk_id
   where ti.fk_pacid = aNazID;

  return(vResult);
end;
/

SHOW ERRORS;


