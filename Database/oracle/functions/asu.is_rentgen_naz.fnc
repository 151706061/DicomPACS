DROP FUNCTION ASU.IS_RENTGEN_NAZ
/

--
-- IS_RENTGEN_NAZ  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   GET_RAD_ISSL (Function)
--   GET_RG_ISSL (Function)
--
CREATE OR REPLACE FUNCTION ASU.IS_RENTGEN_NAZ(pFK_SMID in number) return number is

  res number;
  cursor c is
    select 1
      from ASU.TSMID
     where FK_ID in (asu.get_rg_issl, asu.get_rad_issl)
    connect by prior FK_OWNER = FK_ID
     start with FK_ID = pFK_SMID;
Begin
  res := 0;

  open c;
  fetch c
    into res;
  close c;

  Return res;
end;
/

SHOW ERRORS;


