DROP FUNCTION ASU.ISDIAGWASEVER
/

--
-- ISDIAGWASEVER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--
CREATE OR REPLACE FUNCTION ASU."ISDIAGWASEVER" (pPacID NUMBER, pMKB10 NUMBER, pMAIN NUMBER, pDiagID Number) return number
is --09.10.2009 Ефимов В.А. на основе ISDIAGWASINTHISYEAR
  res Number;
begin
  select count(1) into res
  from asu.tdiag d
  where d.fk_pacid = pPacID
    and d.fk_mkb_10 = pMKB10
    and d.fl_main = pMAIN
    and d.fk_id <> pDiagID;
  return res;
end;
/

SHOW ERRORS;


