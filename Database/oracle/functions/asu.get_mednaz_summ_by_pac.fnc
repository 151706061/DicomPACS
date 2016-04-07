DROP FUNCTION ASU.GET_MEDNAZ_SUMM_BY_PAC
/

--
-- GET_MEDNAZ_SUMM_BY_PAC  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZMED (Table)
--   TNAZMEDLECH (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_mednaz_summ_by_pac
  ( aFK_PACID IN NUMBER) RETURN NUMBER IS
  RES NUMBER;
BEGIN
  select
    sum(nml.fn_summ) into RES
  from asu.tnazmed nm, asu.tnazmedlech nml
  where nm.fk_id = nml.FK_NAZMEDID
    and nm.fk_pacid = aFK_PACID;

  return nvl(RES,0);
END;
/

SHOW ERRORS;


