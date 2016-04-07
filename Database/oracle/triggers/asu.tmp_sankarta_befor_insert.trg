DROP TRIGGER ASU.TMP_SANKARTA_BEFOR_INSERT
/

--
-- TMP_SANKARTA_BEFOR_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TNAZSOS (Sequence)
--   TMP_SANKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMP_SANKARTA_BEFOR_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TMP_SANKARTA  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
  select seq_tnazsos.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


