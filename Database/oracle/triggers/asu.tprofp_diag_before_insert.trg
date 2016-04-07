DROP TRIGGER ASU.TPROFP_DIAG_BEFORE_INSERT
/

--
-- TPROFP_DIAG_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TPROFP_DIAG (Table)
--   SEQ_PROFP_DOG (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TPROFP_DIAG_BEFORE_INSERT"
 BEFORE
  INSERT
 ON tprofp_DIAG
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_profp_dog.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


