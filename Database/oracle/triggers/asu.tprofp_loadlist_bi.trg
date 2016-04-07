DROP TRIGGER ASU.TPROFP_LOADLIST_BI
/

--
-- TPROFP_LOADLIST_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SEQ_TPROFP_LOADLIST (Sequence)
--   TPROFP_LOADLIST (Table)
--
CREATE OR REPLACE TRIGGER ASU.tprofp_loadlist_BI
 BEFORE  INSERT  ON ASU.TPROFP_LOADLIST FOR EACH ROW
begin
 :NEW.fk_id := nvl( :NEW.fk_id,seq_tprofp_loadlist.NEXTVAL);
  end;
/
SHOW ERRORS;


