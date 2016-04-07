DROP TRIGGER ASU.TMODALITY_BEFORE_INSERT
/

--
-- TMODALITY_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TMODALITY (Sequence)
--   TMODALITY (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMODALITY_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tmodality
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tmodality.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


