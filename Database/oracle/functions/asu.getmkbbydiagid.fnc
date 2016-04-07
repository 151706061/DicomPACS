DROP FUNCTION ASU.GETMKBBYDIAGID
/

--
-- GETMKBBYDIAGID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   TSMID (Table)
--   GET_FULLMKB10 (Function)
--
CREATE OR REPLACE FUNCTION ASU."GETMKBBYDIAGID" (pDiagID Number) return varchar2
is
  res Varchar2 (1000);
begin
    select SUBSTR(GET_FULLMKB10(d.fk_mkb10),1,20) into res from tdiag t, tsmid d where t.fk_id = pDiagID and d.fk_id = fk_mkb_10;
    Return res;
end;
/

SHOW ERRORS;


