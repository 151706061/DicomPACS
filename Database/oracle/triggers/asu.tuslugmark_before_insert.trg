DROP TRIGGER ASU.TUSLUGMARK_BEFORE_INSERT
/

--
-- TUSLUGMARK_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TUSLUGMARK (Table)
--
CREATE OR REPLACE TRIGGER ASU.tuslugmark_before_insert
 BEFORE
  INSERT
 ON ASU.TUSLUGMARK REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare

begin
select seq_tuslugmark.nextval into :new.fk_id from dual;
end TUSLUGMARK_BEFORE_INSERT;
/
SHOW ERRORS;


