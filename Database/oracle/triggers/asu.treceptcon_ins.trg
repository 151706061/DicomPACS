DROP TRIGGER ASU.TRECEPTCON_INS
/

--
-- TRECEPTCON_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TRECEPTCON (Sequence)
--   TRECEPTCON (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPTCON_INS" 
BEFORE INSERT
ON treceptcon
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
  select seq_treceptcon.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


