DROP FUNCTION ASU.ISDIAGWASINTHISYEAR
/

--
-- ISDIAGWASINTHISYEAR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--
CREATE OR REPLACE FUNCTION ASU."ISDIAGWASINTHISYEAR" (pPacID NUMBER,pMKB10 NUMBER,pDate Date, pDiagID Number) return number
is --by A.Nakorjakov 160808 - был ли поставлен пациенту диагноз (по коду) в отчетном году
  res Number;
begin
  select count(1) into res
  from asu.tdiag d
  where d.fk_pacid = pPacID
    and d.fk_smdiagid = pMKB10
    and d.fd_date between to_date('25.12.'||to_char(extract(year from pDate)-1),'dd.mm.yyyy') and pDate
    and d.fk_id <> pDiagID;
  return res;
end;
/

SHOW ERRORS;


