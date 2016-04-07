DROP TRIGGER ASU.TRESMEDCONT$BEFORE_INSERT
/

--
-- TRESMEDCONT$BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TRESMEDCONT (Sequence)
--   TRESMEDCONT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESMEDCONT$BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TRESMEDCONT REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
BEGIN
  SELECT seq_tresmedcont.nextval
    INTO :new.fk_id
    FROM dual;
END;

-- END PL/SQL BLOCK (do not remove this line) ----------------------------------
/
SHOW ERRORS;


