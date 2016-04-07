DROP FUNCTION ASU.ISTALONEXCH79
/

--
-- ISTALONEXCH79  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   CANCELEXCHLIST (Table)
--   SCHET (Table)
--   SLUCH (Table)
--
CREATE OR REPLACE FUNCTION ASU.IsTalonExch79(aTalonID Number) RETURN number is
  vCount Number;
begin
  select count(*)
    into vCount
    from (select s.fk_talonid
            from exch79.schet sc
           inner join exch79.sluch s on s.fk_schetcode = sc.code
            left join exch79.cancelexchlist c on c.fk_talonid = s.fk_talonid
           where sc.fn_is_exch = 1
             and s.fk_talonid = aTalonID
           group by s.fk_talonid);

  return vCount;
end;
/

SHOW ERRORS;


