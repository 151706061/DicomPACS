DROP PROCEDURE ASU.BUH_SAVE_PUTMAIN
/

--
-- BUH_SAVE_PUTMAIN  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TKARTA (Table)
--
CREATE OR REPLACE PROCEDURE ASU."BUH_SAVE_PUTMAIN" (pPacId in number, pSum in number, pPutNO in varchar2) IS
BEGIN
 if pSum <> 0 then
  update tkarta set fn_sum=pSum,fc_put=pPutNo where fk_id=pPacid;
 end if;
END; -- Procedure
/

SHOW ERRORS;


