DROP TRIGGER ASU.TALLERGY_BEFORE_INSERT
/

--
-- TALLERGY_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TALLERGY (Table)
--   SEQ_TALLERGY (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TALLERGY_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tallergy
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select asu.seq_tallergy.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


