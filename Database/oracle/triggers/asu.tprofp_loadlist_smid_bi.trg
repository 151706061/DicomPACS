DROP TRIGGER ASU.TPROFP_LOADLIST_SMID_BI
/

--
-- TPROFP_LOADLIST_SMID_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SEQ_TPROFP_LOADLIST (Sequence)
--   TPROFP_LOADLIST_SMID (Table)
--
CREATE OR REPLACE TRIGGER ASU.tprofp_loadlist_smid_BI
 BEFORE 
 INSERT
 ON ASU.TPROFP_LOADLIST_SMID  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
 :new.fk_id := nvl( :new.fk_id,seq_tprofp_loadlist.NEXTVAL);
 end;
/
SHOW ERRORS;


