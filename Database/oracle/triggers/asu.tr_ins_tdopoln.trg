DROP TRIGGER ASU.TR_INS_TDOPOLN
/

--
-- TR_INS_TDOPOLN  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TDOPOLN (Table)
--   SEQ_INS_TDOPOLN (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TR_INS_TDOPOLN" 
 BEFORE
  INSERT
 ON tdopoln
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
 select seq_ins_tdopoln.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


