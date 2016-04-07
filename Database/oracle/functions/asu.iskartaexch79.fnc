DROP FUNCTION ASU.ISKARTAEXCH79
/

--
-- ISKARTAEXCH79  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   CANCELEXCHLIST (Table)
--   SCHET (Table)
--   SLUCH (Table)
--
CREATE OR REPLACE FUNCTION ASU.IsKartaExch79(aPacId Number) RETURN  number is
  vCount Number;
begin
  select count(*)
    into vCount
    from (select s.fk_pacid
            from exch79.schet sc
           inner join exch79.sluch s on s.fk_schetcode = sc.code
            left join exch79.cancelexchlist c on c.fk_pacid = s.fk_pacid
           where sc.fn_is_exch = 1
             and c.fk_talonid is null
             and c.fk_pacid is null
             and s.fk_pacid = aPacId
           group by s.fk_pacid);

  return vCount;
end;
/

SHOW ERRORS;


