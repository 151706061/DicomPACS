DROP FUNCTION ASU.CHECK_TALON_BY_DIAG
/

--
-- CHECK_TALON_BY_DIAG  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   TAMBTALON (Table)
--   DO_VRACHFIO (Function)
--
CREATE OR REPLACE FUNCTION ASU.CHECK_TALON_BY_DIAG(pFK_TALONID in number , pFK_AMBID IN NUMBER, pFK_SMDIAGID IN NUMBER)
  RETURN varchar2
  IS
  res varchar2(1024) := 'TALON_CORRECT';

  cursor cCheck is
   select 'Существует неподписаный талон с таким же диагнозом от '||' '||TO_CHAR(TAMBTALON.FD_OPENED,'DD.MM.YYYY')||', '|| ASU.DO_VRACHFIO(TAMBTALON.FK_SOTRID) from ASU.TAMBTALON, ASU.TDIAG
     where
   TAMBTALON.FK_AMBID = pFK_AMBID
    and
   TAMBTALON.FN_SOS = 0
    and
   TAMBTALON.FK_DIAGMAIN = TDiag.FK_ID
    and
   TAMBTALON.FK_ID <> pFK_TALONID
    and
   TDiag.FK_SMDIAGID =  pFK_SMDIAGID;

BEGIN

  /*Open cCheck;
  Fetch cCheck into res;
  Close cCheck;*/

  Return res;

END;
/

SHOW ERRORS;


