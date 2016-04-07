DROP TRIGGER ASU.TAPRIH$INS
/

--
-- TAPRIH$INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TAPRIH (Sequence)
--   TAPRIH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAPRIH$INS" 
BEFORE INSERT
ON ASU.TAPRIH REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
BEGIN
  SELECT seq_taprih.nextval
    INTO :new.fk_id
    FROM dual;
END;
/
SHOW ERRORS;


