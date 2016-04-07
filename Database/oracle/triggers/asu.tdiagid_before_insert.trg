DROP TRIGGER ASU.TDIAGID_BEFORE_INSERT
/

--
-- TDIAGID_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TDIAGID (Sequence)
--   TDIAGID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TDIAGID_BEFORE_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TDIAGID  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
  select seq_tdiagid.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


