DROP TRIGGER ASU.TPROFP_ISPOL_BEFORE_INSERT
/

--
-- TPROFP_ISPOL_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TPROFP_ISPOL (Sequence)
--   TPROFP_ISPOL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPROFP_ISPOL_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON tprofp_ispol
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tprofp_ispol.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


