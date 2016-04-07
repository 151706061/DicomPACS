DROP TRIGGER ASU.TDOC_SET
/

--
-- TDOC_SET  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TDOC_SET (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TDOC_SET" 
BEFORE INSERT 
ON tdoc_set
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
  select SEQ_tdoc_set.NEXTVAL into :NEW.fk_id from dual;
end;
/
SHOW ERRORS;


