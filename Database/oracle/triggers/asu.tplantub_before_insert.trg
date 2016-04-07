DROP TRIGGER ASU.TPLANTUB_BEFORE_INSERT
/

--
-- TPLANTUB_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TPLANTUB (Sequence)
--   TPLANTUB (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPLANTUB_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tplantub
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tplantub.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


