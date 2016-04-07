DROP PROCEDURE ASU.BUH_KARTA_SETBUH
/

--
-- BUH_KARTA_SETBUH  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TKARTA (Table)
--
CREATE OR REPLACE PROCEDURE ASU."BUH_KARTA_SETBUH" ( pPacId IN number,
   pOk IN number)
   IS
BEGIN
  update tkarta set fl_buh=pOk where fk_id=pOk;
END; -- Procedure
/

SHOW ERRORS;


