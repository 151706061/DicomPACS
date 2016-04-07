DROP TRIGGER ASU.TAUCHGR_INS
/

--
-- TAUCHGR_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TAUCHGR (Sequence)
--   TAUCHGR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAUCHGR_INS" 
BEFORE INSERT
ON tauchgr
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
  SELECT seq_TAUCHGR.nextval
    into :new.fk_id
    FROM dual;
END;
/
SHOW ERRORS;


