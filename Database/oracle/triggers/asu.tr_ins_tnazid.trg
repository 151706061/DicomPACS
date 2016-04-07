DROP TRIGGER ASU.TR_INS_TNAZID
/

--
-- TR_INS_TNAZID  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TNAZID (Table)
--   SEQ_INS_TNAZID (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TR_INS_TNAZID" 
 BEFORE
  INSERT
 ON tnazid
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
 select seq_ins_tnazid.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


