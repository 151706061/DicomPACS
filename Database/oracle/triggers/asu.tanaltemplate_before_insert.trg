DROP TRIGGER ASU.TANALTEMPLATE_BEFORE_INSERT
/

--
-- TANALTEMPLATE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TANALTEMPLATE (Table)
--   SEQ_TANALTEMPLATE (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TANALTEMPLATE_BEFORE_INSERT" 
 BEFORE
 INSERT
 ON ASU.TANALTEMPLATE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
  if :new.fk_id is null then
    select asu.seq_tanaltemplate.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


