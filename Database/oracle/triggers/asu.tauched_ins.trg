DROP TRIGGER ASU.TAUCHED_INS
/

--
-- TAUCHED_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TAUCHED (Sequence)
--   TAUCHED (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAUCHED_INS" 
BEFORE INSERT
ON tauched
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
bEGIN
  SELECT seq_tauched.nextval
    INTO :new.fk_id
    FROM dual;
END;
/
SHOW ERRORS;


