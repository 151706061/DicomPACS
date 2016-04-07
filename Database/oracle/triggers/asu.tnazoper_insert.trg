DROP TRIGGER ASU.TNAZOPER_INSERT
/

--
-- TNAZOPER_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKARTA (Sequence)
--   TNAZOPER (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZOPER_INSERT" 
 BEFORE
  INSERT
 ON tnazoper
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tkarta.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


